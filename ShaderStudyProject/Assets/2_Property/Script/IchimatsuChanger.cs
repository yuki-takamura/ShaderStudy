using UnityEngine;

public class IchimatsuChanger : MonoBehaviour
{
    Material material;

    float currentTime = 0;

    bool isBlockMany = false;

    float blockNum = 20;

    void Start()
    {
        material = GetComponent<MeshRenderer>().material;
    }

    void Update()
    {
        currentTime += Time.deltaTime * 0.5f;
        float r = Mathf.Abs(Mathf.Sin(currentTime));
        float g = Mathf.Abs(Mathf.Cos(currentTime));
        float b = Mathf.Abs(Mathf.Sin(currentTime));
        material.SetColor("_Color", new Color(r, g, b));
        material.SetColor("_SecondColor", new Color(g, b, r));

        if(Input.GetKeyDown(KeyCode.Z))
        {
            isBlockMany ^= true;
        }

        if (Input.GetKey(KeyCode.Z))
        {
            if (isBlockMany)
            {
                blockNum += 0.5f;
            }
            else
            {
                blockNum -= 0.5f;
            }
        }

        if(blockNum < 2)
        {
            blockNum = 2;
        }

        material.SetFloat("_Num", blockNum);
    }
}
