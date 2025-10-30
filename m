Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BEBCCF9EB
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 00:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4fY364l7NN/jJUEvoRVxijPXm4JZNIJfApRKmzcvz1w=; b=DMTDOo0KV0OQBv
	3sLUFk+UAqrJyR6OCxRlsMNJKFOeAlPa6TF8xfKSoRqgmOLMlBxBqfk/MKLfB8dnqZO7KAEXEyitp
	z9ofeqGIoQdMtUplUc5Up4c3zAMPpxkXi16Ijbu3xwyJIFMlrCGCHTm3co/hzH2hi6JhbalWZDEY6
	E+IIU3wWGvdkcQAJ4KbOnsL0tNtzHD/CAyeN9XcZzKYnHkwz/EwI3p8moDuy3MOeHaF4t3NK1J85D
	E1dqNGXDy0F6ArK0UuuxTBxVI/DvtZ4AwqICx6tDeg0eii7SD1FV5faJ9QMl2GCWgaamQwKyWT9Kd
	IU3fgxkTEQnFmNifq2AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGF3-00000003HEq-3qgb;
	Thu, 30 Oct 2025 00:10:13 +0000
Received: from mail-il1-x143.google.com ([2607:f8b0:4864:20::143])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEGF0-00000003HDe-3ja7
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 00:10:12 +0000
Received: by mail-il1-x143.google.com with SMTP id e9e14a558f8ab-430b6a0eaeaso4094815ab.1
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 17:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761783010; x=1762387810; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OxyxNUOgrblEElGmyEA4sep5LlBoVO7BBRw8igevJ6s=;
        b=XF2yqIOtDTLbKU101XIIc57Z34Achyxekab0k2gAq7s0+vEM9QsmgMNoPzTuO5E2rc
         hugaBIQwkKCzb+cI8p+Ay1vPNQOfcuQww6sm2luijdlFaEV/DOv3aA5fKGW+Xy2Au0Uh
         FCImOipK20LYTLi+xYLzFSUpqRkR8IVL3bckhxgLYwdy+MLkKpG0p06t8/+mAMX4Iljr
         fKXtDK5oKWG5w+gnI9uX+lr0zLHyeyGwym6QzF8ZXe4Sc1DUoR5jMahME5vPs3YfRqJX
         u7NITztc3XwQTarO+jWyrX9pJ+clRda+VIVXLhOPftO/iCKq4lHiqydgqNOwUUJoInim
         FTQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761783010; x=1762387810;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OxyxNUOgrblEElGmyEA4sep5LlBoVO7BBRw8igevJ6s=;
        b=cChWUxUai515FvXqpsgC6/adgCA92cP4SlpC6m97aSCneS+34wErh4rw5+xQMrlG52
         dI2sRqFjLdL/jhQjePO/Jj4bh9DCvymIPuBbxcpH+8LSgEBWORqpg5Mm0o5pXze5iRvp
         5eUisseIqegnqKvOgatJOCp/xCoMFFBT78DWNNJr8BzvGFR+iBsT5FRiLWMwYrgxGSLr
         35v0SMzb9IW15utcUsO11VPA84Q+7hDBtm9iA4IQF1J5B8TIt/O/F+hkzQ3GIOG2oGav
         eJVMyZ5zAB8ru16v88r3mT56Il4LClgd8mT+WsOaFYDCXIz5TDVINb3C6ftauqVq0T+R
         8PWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1f7PNvmThxQmiiH55qt786I7aCY0l6ZsF6tCu/fBLHdT029YgEvVVQnCZDfrYjZlC3tXVW8lGL71B5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGdNDFzeWivY4GIgG+fxHokIpU7btZP17SXCuDMDhonwM+zqLo
	Q/FNjawNJhzkGtejmQYIGKi5YDcspAXduHZj2mweErMRLhnZdpp4oUUNsq2Ebm/0S7E=
X-Gm-Gg: ASbGnctj9a+jpY3fWPy/FFjuguvsi0fqdiDGJNDgz3VHI/vt1cOwO/huTDDhEa+P87R
	hoZmeGZJEr9dPiSdCvMI8ZEqP4KL0ZiJI9gle+ltkjkoSq+wkjyv6Fju/V220vRU5dHP3zH7C15
	cYxIRLuwmM+ixyb1Wpa2yQwwSMTUcxF3dx4aBll9u3El2edfybKFA2qYfGLNTVfOIXXn2Cjo7K7
	PmRttOoISBsYk6an6FUTNHScEXhwZ+VaNL9kfYwfi+Wp9lQaugU3i4XFXiQhEtRrrNCTnG2dCU4
	Vkgt7gM1quKHtbMgj+fxUSelHbvypd/bUdGtIOusWAYOXSO/Y3Ki5SMbGgYTQCltr31HO6SrwJB
	5A4ZVgPEmB1X1J7X0k9j/XFZRb4z+uWb+c8Rqx4t00y7GAz6u2FFUbQu0ACczLNSlpHwwdszS05
	VyE05KxDnHsWcULQkEIP8VMWk7Vd+hV0CtEgmTgIWB
X-Google-Smtp-Source: AGHT+IGo5/UX7J0ClNKidKN2YOwDqgsyx0nxeraSSzCU9ZW8jr+AVU5FOLaQI0Rlsn9hweZUzGxIew==
X-Received: by 2002:a05:6e02:2162:b0:431:d83a:9ba with SMTP id e9e14a558f8ab-432f9045398mr62043485ab.26.1761783009512;
        Wed, 29 Oct 2025 17:10:09 -0700 (PDT)
Received: from [172.22.22.234] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea946de57sm5939330173.34.2025.10.29.17.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Oct 2025 17:10:09 -0700 (PDT)
Message-ID: <6a8e8e43-c86f-4c46-851b-858e5deec8ac@riscstar.com>
Date: Wed, 29 Oct 2025 19:10:06 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, dlan@gentoo.org, guodong@riscstar.com,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-4-elder@riscstar.com>
 <u53qfrubgrcamiz35ox6lcdpp5bbzfwcsic466z5r6yyx6xz3n@c64nw2pegtfe>
 <ae92d3f4-5131-46be-b9b1-e8ec437c9ae9@riscstar.com>
 <tjnc4wwpdwlziboonlmki6nm7t523k5atemygwyg7ck5knsde4@anjrtcf5gcq7>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <tjnc4wwpdwlziboonlmki6nm7t523k5atemygwyg7ck5knsde4@anjrtcf5gcq7>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_171010_986260_A7B7C485 
X-CRM114-Status: GOOD (  24.89  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 10/28/25 12:58 AM, Manivannan Sadhasivam wrote:
> On Mon, Oct 27, 2025 at 05:24:33PM -0500, Alex Elder wrote:
>> On 10/26/25 11:38 AM, Manivannan Sadhasivam wrote:
>>> On Mon, Oct 13, 2025 at 10:35:20AM -0500, Alex Elder wrote:
>>>> Add the Device Tree binding for the PCIe root complex found on the
>>>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>>>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>>>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>>>> typically used to support a USB 3 port.
>>>>
>>>> Signed-off-by: Alex Elder <elder@riscstar.com>
>>>> ---
>>>> v2: - Renamed the binding, using "host controller"
>>>>       - Added '>' to the description, and reworded it a bit
>>>>       - Added reference to /schemas/pci/snps,dw-pcie.yaml
>>>>       - Fixed and renamed the compatible string
>>>>       - Renamed the PMU property, and fixed its description
>>>>       - Consistently omit the period at the end of descriptions
>>>>       - Renamed the "global" clock to be "phy"
>>>>       - Use interrupts rather than interrupts-extended, and name the
>>>>         one interrupt "msi" to make clear its purpose
>>>>       - Added a vpcie3v3-supply property
>>>>       - Dropped the max-link-speed property
>>>>       - Changed additionalProperties to unevaluatedProperties
>>>>       - Dropped the label and status property from the example
>>>>
>>>>    .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
>>>>    1 file changed, 156 insertions(+)
>>>>    create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>>> new file mode 100644
>>>> index 0000000000000..87745d49c53a1
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>>> @@ -0,0 +1,156 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>>>> +%YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: SpacemiT K1 PCI Express Host Controller

. . .

>>>> +  interrupt-names:
>>>> +    const: msi
>>>> +
>>>> +  phys:
>>>> +    maxItems: 1
>>>> +
>>>> +  vpcie3v3-supply:
>>>> +    description:
>>>> +      A phandle for 3.3v regulator to use for PCIe
>>>
>>> Could you please move these Root Port specific properties (phy, vpcie3v3-supply)
>>> to the Root Port node?
>>>
>>> Reference: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/st,stm32-pcie-host.yaml
>>
>> OK, I'll try to follow what that ST binding does (and the
>> matching driver).
>>
>>> For handling the 'vpcie3v3-supply', you can rely on PCI_PWRCTRL_SLOT driver.
>> I looked at the code under pci/pwrctrl.  But is there some other
>> documentation I should be looking at for this?
>>
> 
> Sorry, nothing available atm. But I will create one, once we fix some core
> issues with pwrctrl so that it becomes useable for all (more in the driver
> patch).

Sounds good, I think it's necessary.  I might not get it completely
right on the next try but I trust you'll help me understand what I
need to do.

>> It looks like it involves creating a new node compatible with
>> "pciclass,0604".  And that the purpose of that driver was to
>> ensure certain resources are enabled before the "real" PCI
>> device gets probed.
>>
>> I see two arm64 DTS files using it:  x1e80100.dtsi and r8a779g0.dtsi.
>> Both define this node inside the main PCIe controller node.
>>
>> Will this model (with the parent pwrctrl node and child PCI
>> controller node) be used for all PCI controllers from here on?
>>
> 
> The PCI controller (host bridge) node is the parent and the Root Port node
> (which gets bind to pwrctrl slot driver) will be the child.

That makes sense to me.

>> Or are you saying this properly represents the relationship of
>> the supply with the PCIe port in this SpacemiT case?
>>
> 
> We want to use this for all the new platforms and also try to convert the old
> ones too gradually.

OK, understood.

Thank you.

					-Alex

> 
> - Mani
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
