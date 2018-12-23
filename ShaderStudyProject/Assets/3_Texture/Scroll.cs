using UnityEngine;

public class Scroll : MonoBehaviour
{
    Material material;
    float currentTime;

    [SerializeField]
    float speed = 0.5f;

    void Start()
    {
        material = GetComponent<MeshRenderer>().material;
    }

    void Update()
    {
        currentTime += Time.deltaTime;

        float offset = currentTime * speed;
        material.SetTextureOffset("_Texture", new Vector2(offset, 0));
    }
}
