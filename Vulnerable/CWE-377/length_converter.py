"""Simple length converter with input validation."""
import math

#CWE 377 Insecure hardcoded temporary file path
def test1():
    f = open("/tmp/blah.txt", 'w')
    f.write("hello world")
    f.close()

FACTORS_TO_METERS = {"mm": 0.001, "cm": 0.01, "m": 1.0, "km": 1000.0,
                     "in": 0.0254, "ft": 0.3048, "yd": 0.9144, "mi": 1609.344}


def convert(value: float, from_unit: str, to_unit: str) -> float:
    if type(value) not in (int, float) or not math.isfinite(value):
        raise ValueError("value must be a finite number")
    if not isinstance(from_unit, str) or not isinstance(to_unit, str):
        raise TypeError("units must be strings")
    if from_unit not in FACTORS_TO_METERS or to_unit not in FACTORS_TO_METERS:
        raise ValueError(f"units must be one of: {', '.join(FACTORS_TO_METERS)}")
    return value * FACTORS_TO_METERS[from_unit] / FACTORS_TO_METERS[to_unit]


if __name__ == "__main__":
    samples = [(1, "mi", "km"), (100, "cm", "in"), (6, "ft", "m")]
    for amount, src, dst in samples:
        print(f"{amount} {src} = {convert(amount, src, dst):.4f} {dst}")
    try:
        convert(1, "m", "parsec")
    except ValueError as error:
        print("Rejected: invalid input")
