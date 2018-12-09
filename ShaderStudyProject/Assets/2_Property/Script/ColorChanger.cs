using UnityEngine;

public class ColorChanger : MonoBehaviour
{
    Material material;

    void Start()
    {
        material = GetComponent<MeshRenderer>().material;
    }

    void Update()
    {
        if (Input.GetKey(KeyCode.Z))
        {
            material.SetColor("_Color", Color.red);
        }
        else
        {
            material.SetColor("_Color", Color.black);
        }
    }
}