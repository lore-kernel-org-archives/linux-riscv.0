Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8BDEC54E6A
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 14:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+t9YBLME/kndGiKxR53Z8EwGoNQsFezkCze9bBxmcgs=; b=F9ti+8H+EmHpD6
	c/l3kXf/VKZlla1iawA/oL57fyAwNZrvJq0a/Z+jZ31N1c8sbyEDGDhtl+NzG/HcL8n9ecFBEQXz5
	kZnW5LuR2fKOpkVRbpDRPg6ThkhIeQdVihoOYzMIqEX6K7bEjU4eeYc56vRFPsCsfO9hqkrc8Ur2I
	1dib7XI5Y1T+zWTp7JWTxwR4ZBcgKS3T+OgwrnLKZfxeCkUmtCspg/X0qRtIO6YWZV3/ciKZP7ShQ
	Ckajd9pCa4LoBaBQwSjal/na3Tmjz5atNxkB0ZN7FSnDuGv6uQBB2h1pSKKpkWyt9nobnqUVV0y7M
	abbUcgsQEWrgm3+HBk2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmB1-0000000EfNt-1t60;
	Thu, 14 Mar 2024 14:35:23 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkmAx-0000000EfLr-3S2l
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 14:35:21 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-33ec8f13c62so447127f8f.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 07:35:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710426918; x=1711031718; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mlfXWz2bHcMeceXPmCS8ZEw2z1gMzt2SLSx+N4MGu4M=;
        b=qiuFmhIcuf6mCAnGhmg4E5n3YdQOUCImkinceT5aS+cAJVt1D+2LspekVgVuqIfHQI
         +ZmAnpDUQmsB45Rald++4dkWMHEUTsJV/fR2mj8V44UD7jpS2R7o3l4m9PE9wkVxQAaA
         Z/bYpeC+nZdLgtZMrtBcInqpkmn9JSY3b5DV3PD8itdzI6pzs2CA/NCSDB08RyISRr+I
         qeLyi1pLmz+JoGIQsz3RHrJYzRZ6ItulSEGiGLnD4QL95rEugk1V4DGyunRDcd0wD+yy
         cvFFDNeZ0JgXcpQ/EOcYd2txfIZgQGcyQHyc2cXwYD9Fa0S2ooPnYc2/x7eQUgxkJx9A
         kZGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710426918; x=1711031718;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mlfXWz2bHcMeceXPmCS8ZEw2z1gMzt2SLSx+N4MGu4M=;
        b=Ky1Nc08NlvtM+HM6bgZ36oU9DPtNVboXlHdmPKOIykxl8fF1DfkqNK7eXNFfpdIO/2
         mkxDJ16E9ag/sJ8j1z2qEjRs0XDsAqWNSgZ776YBfyJWL5U4RxBfb7Pn8eiRuHOzpmy1
         6zv1StIwDRtwibGrzCHy7aRqaNOtb0sFnaTR8Y4LDO62dLI4Hs2xWb91jJU1jKAH3cy8
         26/MvC4/2DIEklAXqghJbuCMbtK7Bc8JBsqHYLSdn/3+UisgFcl3RR1YPNvHIeA1immS
         v1swb+uTXD/6xCdXJsQjYT7oW3uR+I10Zfxn5BsVmjC3BQXjEy5mJUgKINcM6butr2os
         8iEA==
X-Forwarded-Encrypted: i=1; AJvYcCUhSV/F2AeVwP3nlBEkCRvMCmuAgKIRq09UI5YQ9RudKuEec59zd33axBjaprLw+vGd//9kI2XYgC51LPMsGaE5KmXPEjRI+Nu3w75VQha4
X-Gm-Message-State: AOJu0YzMFH0ilaeF/K14H87rqA85lN/041kJF+JrqFvRXoEAH0N9V2kW
	l/G3qvoa5nmpsOxCTNE4h+pgsI4bNFjdoHsnNFw8NZhEBnDgLVxMlDXXmL9oeVk=
X-Google-Smtp-Source: AGHT+IHnbAtEB8fZkJ1NYRXHqIQKiPIKagRXRe3HFnoWOZuEMo8a6yhPPUxxt4o30LCM7sIZJ4Op+g==
X-Received: by 2002:a05:6000:d01:b0:33e:9f65:3b62 with SMTP id dt1-20020a0560000d0100b0033e9f653b62mr234671wrb.49.1710426917814;
        Thu, 14 Mar 2024 07:35:17 -0700 (PDT)
Received: from [192.168.1.78] (host-92-17-96-232.as13285.net. [92.17.96.232])
        by smtp.gmail.com with ESMTPSA id a13-20020adfeecd000000b0033ec94c6277sm871235wrp.115.2024.03.14.07.35.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Mar 2024 07:35:17 -0700 (PDT)
Message-ID: <a5eac9d5-1e88-4d7a-b8e8-677f6d116782@linaro.org>
Date: Thu, 14 Mar 2024 14:35:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] dt-bindings: qcom: Update DT bindings for multiple
 DT
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
To: Amrit Anand <quic_amrianan@quicinc.com>, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, agross@kernel.org,
 andersson@kernel.org, konrad.dybcio@linaro.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kernel@quicinc.com, peter.griffin@linaro.org,
 linux-riscv@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-mediatek@lists.infradead.org, Simon Glass <sjg@chromium.org>
References: <1710418312-6559-1-git-send-email-quic_amrianan@quicinc.com>
 <1710418312-6559-3-git-send-email-quic_amrianan@quicinc.com>
 <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
In-Reply-To: <f6f317d9-830d-4c38-998f-b229b3d9f95a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_073519_958259_94BA52D3 
X-CRM114-Status: GOOD (  32.41  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 14/03/2024 14:20, Caleb Connolly wrote:
> Hi Amrit,
> 
> On 14/03/2024 12:11, Amrit Anand wrote:
>> Qualcomm produces a lot of "unique" boards with slight differences in
>> SoC's and board's configuration. For eg, there can be SM8150v1 on MTPv1,
>> SM8150v1 on MTPv2, SM8150v2 on MTPv2, SM8150v2 on MTPv2 with a different
>> PMIC, SM8150v2 with no modem support and so on. For instance, suppose we
>> have 3 SoC, each with 4 boards supported, along with 2 PMIC support for
>> each case which would lead to total of 24 DTB files. Along with these
>> configurations, OEMs may also add certain additional board variants. Thus
>> a mechanism is required to pick the correct DTB for the corresponding board.
>>
>> Introduce mechanism to select required DTB using newly introduced device
>> tree properties "board-id" and "board-id-type". "board-id" will contain
>> the list of values of "qcom,soc-id", "qcom,board-id", "qcom,pmic-id" or
>> "qcom,oem-id". "board-id-types" contains the type of parameter which is
>> entered. It can be either "qcom,soc-id", "qcom,board-id", "qcom,pmic-id"
>> or "qcom,oem-id".
> 
> Thanks for working on this, it's nice to finally see this logic
> documented in the kernel.
>>
>> Qualcomm based bootloader will use these properties to pick the best
>> matched DTB to boot the device with.
>>
>> Signed-off-by: Amrit Anand <quic_amrianan@quicinc.com>
>> ---
>>  Documentation/devicetree/bindings/arm/qcom.yaml | 90 +++++++++++++++++++++++++
>>  1 file changed, 90 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
>> index 7f80f48..dc66ae9 100644
>> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
>> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
>> @@ -1100,6 +1100,76 @@ properties:
>>        kernel
>>        The property is deprecated.
>>  
>> +  board-id:
>> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
>> +    minItems: 2
>> +    description: |
>> +      Qualcomm specific bootloader uses multiple different identifiers
>> +      (qcom,soc-id, qcom,board-id, qcom,pmic-id, qcom,oem-id) to select
>> +      single Devicetree among list of Devicetrees. For different identifiers,
>> +      the selection can be done either based on exact match (where the
>> +      identifiers information coming from firmware should exactly match
>> +      the ones described in devicetree) or best match (firmware provided
>> +      identifier information closely matches with the one of the Devicetree).
>> +      Below table describes matching criteria for each identifier::
>> +      |----------------------------------------------------------------------|
>> +      |  DT property  |  Individual fields   |   Exact  |  Best  |  Default  |
>> +      |----------------------------------------------------------------------|
>> +      | qcom,soc-id   |                                                      |
>> +      |               |  Chipset Id          |     Y    |    N   |     -     |
>> +      |               |  SoC Revision        |     N    |    Y   |     -     |
>> +      | qcom,board-id |                                                      |
>> +      |               |  Board Id            |     Y    |    N   |     -     |
>> +      |               |  Board Major         |     N    |    Y   |     -     |
>> +      |               |  Board Minor         |     N    |    Y   |     -     |
>> +      |               |  Subtype             |     Y    |    N   |     0     |
>> +      |               |  DDRtype             |     Y    |    N   |     0     |
>> +      |               |  BootDevice Type     |     Y    |    N   |     0     |
>> +      | qcom,pmic-id  |                                                      |
>> +      |               |  Slave Id            |     Y    |    N   |     0     |
>> +      |               |  PMIC Id             |     Y    |    N   |     0     |
>> +      |               |  PMIC Major          |     N    |    Y   |     0     |
>> +      |               |  PMIC Minor          |     N    |    Y   |     0     |
>> +      | qcom,oem-id   |                                                      |
>> +      |               |  OEM Id              |     Y    |    N   |     0     |
>> +      |----------------------------------------------------------------------|
>> +      For best match, identifiers are matched based on following priority order::
>> +      SoC Revision > Board Major > Board Minor > PMIC Major > PMIC Minor
>> +
>> +  board-id-types:
>> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
>> +    description:
>> +       Each field and helper macros are defined at include/dt-bindings/arm/qcom,ids.
>> +    minItems: 2
>> +    items:
>> +       oneOf:
>> +         - const: qcom,soc-id
>> +           description:
>> +              Matches Qualcomm Technologies, Inc. boards with the specified SoC.
>> +              2 integers are needed to describe a soc-id. The first integer is the
>> +              SoC ID and the second integer is the SoC revision.
>> +              qcom,soc-id = <soc-id  soc-revision>
>> +         - const: qcom,board-id
>> +           description: |
>> +              Matches Qualcomm Technologies, Inc. boards with the specified board.
>> +              2 integers are needed to describe a board-id. The first integer is the
>> +              board ID. The second integer is the board-subtype.
>> +              qcom,board-id = <board-id  board-subtype>
This is a recursive definition. You partially described the individual
fields above, you should do that here.

What is DDR type? What information is encoded that doesn't make sense to
describe elsewhere in DT?

Same for "bootdevice type", why would you pick a different DT based on
whether the bootloader was loaded from UFS or NAND? Why does this
information belong in DT?
>> +         - const: qcom,pmic-id
>> +           description: |
>> +              Qualcomm boards can be attached to multiple PMICs where slave-id (SID)
>> +              indicates the address of the bus on which the PMIC is attached. It can be
>> +              any number. The model for a PMIC indicates the PMIC name attached to bus
>> +              described by SID along with  major and minor version. 2 integers are needed
>> +              to describe qcom,pmic-id. The first integer is the slave-id and the second integer
>> +              is the pmic model.
>> +              qcom,pmic-id = <pmic-sid pmic-model>

Same questions here, why don't you just walk the DT and read the
compatible properties of PMIC nodes?
>> +         - const: qcom,oem-id
>> +           description: |
>> +              Matches Qualcomm Technologies, Inc. boards with the specified OEM ID.
>> +              1 integer is needed to describe the oem-id.
>> +              qcom,oem-id = <oem-id>
>> +
>>  allOf:
>>    # Explicit allow-list for older SoCs. The legacy properties are not allowed
>>    # on newer SoCs.
>> @@ -1167,4 +1237,24 @@ allOf:
>>  
>>  additionalProperties: true
>>  
>> +examples:
>> +  - |
>> +    #include <dt-bindings/arm/qcom,ids.h>
>> +    / {
>> +         model = "Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform";
>> +         compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
>> +
>> +         #board-id-cells = <2>;
>> +         board-id = <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(1)>,
>> +                    <QCOM_SOC_ID(SC7280) QCOM_SOC_REVISION(2)>,
>> +                    <QCOM_BOARD_ID(IDP, 1, 0) QCOM_BOARD_SUBTYPE(UFS, ANY, 1)>;
>> +         board-id-types = "qcom,soc-id",
>> +                          "qcom,soc-id",
>> +                          "qcom,board-id";
> Forgive me if this is a particularly cynical view, but this seems
> incredibly blatant, the "qcom,board-id" property is deprecated for
> various good reasons, just using a key/value map where "qcom,board-id"
> is a key doesn't change that. There are two main issues I have with the
> proposal here:
> 
> 1. This breaks backwards compatibility, millions of production devices
> with bootloaders that will never receive another update might be
> compatible with the downstream "qcom,board-id" property, but they won't
> work with this.
> 2. A top level board-id property that isn't namespaced implies that it
> isn't vendor specific, but the proposed implementation doesn't even
> pretend to be vendor agnostic.
> 
> U-Boot also has some ideas around this issue, there you can pass in
> multiple DTBs and provide some board specific "best match" function.
> I think there's definitely some value in exposing this information, but
> there's no good reason to define the same data as `qcom,board-id` while
> breaking production bootloaders.
>> +
>> +         #address-cells = <2>;
>> +         #size-cells = <2>;
>> +    };
>> +
>> +
>>  ...
> 

-- 
// Caleb (they/them)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
