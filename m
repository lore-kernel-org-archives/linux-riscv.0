Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7539BCCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 01:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXUfh+Rt3dmNHTPcIM/SLBHBP9o6OzG1/+a2pCD73z8=; b=V0VJgo1wIiCkhY
	JinXACsM+SOQAtg1tlkLs0SE8QoNIREnMyke3Iv2DsoA2+fJ/QrUMzoXj7wKqQviRMCvPcb0XIyhq
	f4hUIa+RLor09h6AQJ46nM1fpHDVXNpznz9wI0x5e5URSvI869HndgB5Zs5q8HLagUvTGVACPxwLa
	VAUL2pLfX6YY7zNdtm4m+aN+ZvX6azl87DvYDe+eybxt284O0Y3gQaqOW6pF82B45oaSBW0U1jf63
	lTb/tsuZSSzuWCWIBpWGaAvdj9cZ2Ps/W0VDQbK2aiP60YoXs5zL3izCm3FjNqSXfqwNksnCl88O2
	mtusgbjs7+QIABkQdkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UHx-0000000EvqE-0mhg;
	Tue, 14 Oct 2025 01:57:21 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8UHu-0000000Evov-009n
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 01:57:19 +0000
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-93bd394fab0so120473339f.0
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 18:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760407037; x=1761011837; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DRqpVkhMILdGgOXoNXOKPLRF82QFKKsH1zKrfan+k9o=;
        b=BVEBbaetHPEjkykMcMt+bmOVcP1OgaHkpjcKVM6Deq0Rfc5f6ivQ9Yghn4PKjvhz68
         okYZ0EM+ib2EP0hRtlJfXX0KAFBcJPH2RHqBqOerbVbRsgLI2ZTmaNA+1fPiLUSMBBo4
         Ei5Hv1ZmS3GhKdLVtNypI2gYi2l8Zgmza/BYSWWXYiTuskmB4DIqq02/7z6ssuUDxbGi
         7wVJOeyhrjGvKH/KHLoQ6yoPbbVMUr+AusnsTZ3u2GNo7woKZy0q8QfbonR0fK7r37oT
         espO8vjn4Ovvxexnf5H4a2ekNJeihluOkzm//JW6xszZAUmOuY66joVYzWMbba4+4zvv
         P+Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760407037; x=1761011837;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DRqpVkhMILdGgOXoNXOKPLRF82QFKKsH1zKrfan+k9o=;
        b=ELZ0e0AAp14tDmxT6Bowt41OW7Gfhf8/zSqg3D1EPxmXC8WoInlJ/AjWuWj42Jnfhd
         mGzMW6SETFNLoC4LB27BRnUa6B+DMO2bSAU4MfRr3tX7r63nPhRRkeiytRgskQ/dQoHc
         79twSpkfaGvfB/GU8sBsaTGGXcTrqQwsPSKkHsZuPPJDUFE7qDu5527H4wBecxWU5rMh
         5m94+URZYyal9dUblPYnEt1w+TX3/kIiiGcS7XMKoqQdyld222RqskqkNOaYfaUBpZxG
         vs284yjSwY4NWu9CSbIkYAHSruZC8ikRD2tNuiaKbBiptXjg7R0pv99cr7KXgr8mwV9C
         rz9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXNhunHfMt2+rS6UeHseiNeFSySo7RmVGl1QtnHEajzndkJS5RSDOLqwlQ1FTWd+8z1IQCuh/UhcurbxA==@lists.infradead.org
X-Gm-Message-State: AOJu0YybXlS2pHX9SHXwBzf4VMCosVWsZz+DTEWvODAOZtU6iAc2stZv
	4xNa9bzL0/XJpd1l0tnMU3xwg6kCP9wHEMKPh268FYxqD8v7elN8NIE/GsG7zWu5sWk=
X-Gm-Gg: ASbGncuKwzLdNPRAc140C/g983VXWxbyrs3A848mSL4kS/9A6BSZS+nfNRQRLh0PXma
	Ma31ZctogE5d8uaaBpBPsruvjKmGaDgGIMD9AWPP1EHmSuR5ziqFpnxALS6wlqJJsO5gnDlWj8s
	80TVX4CGSoC6yxGC4y7WnVt5+3nC5IccApG4BsUL4y+fQEQUDvgyh6TA9HDdCXGIzz9rWpKy+cy
	PCtVsA5lVNvvRAealvXlhwKVw8BYCMp4Mm0vzMOfweU7otC4rpEMXWkYARxsDnCvBu2x24Y5CvP
	3IeI1gQYC6cyf5/VQ9t0Ibmb+bmDhygbWRdrsqXQ7EB1+jgXI+/0PDr18F0b8Q/W8L+z2Xio63y
	bAUvAX4krgQpc5vyCMH88Ncnsyl1JxO9iOQ1qOQQECYxXB/IfREK+iTT44A8yYt+ZH4G873EiaY
	ttqeWPeSexPJe9ww==
X-Google-Smtp-Source: AGHT+IFz+6u4FT7mXO0HjOe5eXpI34wWI1ZFKrY/cjEseejOQH/7Ctss1Fp2rB13acyyKvsMsu5OOA==
X-Received: by 2002:a05:6602:811:b0:87c:2a76:4cf9 with SMTP id ca18e2360f4ac-93bc4074509mr2599466339f.1.1760407037052;
        Mon, 13 Oct 2025 18:57:17 -0700 (PDT)
Received: from [10.211.55.5] (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-93e25a659a0sm455091539f.17.2025.10.13.18.57.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Oct 2025 18:57:16 -0700 (PDT)
Message-ID: <860df9d7-9791-40de-903d-0f62d34533e7@riscstar.com>
Date: Mon, 13 Oct 2025 20:57:14 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] dt-bindings: pci: spacemit: introduce PCIe host
 controller
To: Yao Zi <ziyao@disroot.org>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, bhelgaas@google.com, lpieralisi@kernel.org,
 kwilczynski@kernel.org, mani@kernel.org, vkoul@kernel.org, kishon@kernel.org
Cc: dlan@gentoo.org, guodong@riscstar.com, pjw@kernel.org,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 p.zabel@pengutronix.de, christian.bruel@foss.st.com, shradha.t@samsung.com,
 krishna.chundru@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
 namcao@linutronix.de, thippeswamy.havalige@amd.com, inochiama@gmail.com,
 devicetree@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-phy@lists.infradead.org, spacemit@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013153526.2276556-1-elder@riscstar.com>
 <20251013153526.2276556-4-elder@riscstar.com> <aO2tkGSUTYssSaVf@pie>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <aO2tkGSUTYssSaVf@pie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_185718_282730_66F62C17 
X-CRM114-Status: GOOD (  19.95  )
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

On 10/13/25 8:55 PM, Yao Zi wrote:
> On Mon, Oct 13, 2025 at 10:35:20AM -0500, Alex Elder wrote:
>> Add the Device Tree binding for the PCIe root complex found on the
>> SpacemiT K1 SoC.  This device is derived from the Synopsys Designware
>> PCIe IP.  It supports up to three PCIe ports operating at PCIe gen 2
>> link speeds (5 GT/sec).  One of the ports uses a combo PHY, which is
>> typically used to support a USB 3 port.
>>
>> Signed-off-by: Alex Elder <elder@riscstar.com>
>> ---
>> v2: - Renamed the binding, using "host controller"
>>      - Added '>' to the description, and reworded it a bit
>>      - Added reference to /schemas/pci/snps,dw-pcie.yaml
>>      - Fixed and renamed the compatible string
>>      - Renamed the PMU property, and fixed its description
>>      - Consistently omit the period at the end of descriptions
>>      - Renamed the "global" clock to be "phy"
>>      - Use interrupts rather than interrupts-extended, and name the
>>        one interrupt "msi" to make clear its purpose
>>      - Added a vpcie3v3-supply property
>>      - Dropped the max-link-speed property
>>      - Changed additionalProperties to unevaluatedProperties
>>      - Dropped the label and status property from the example
>>
>>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++++++++++++++++
>>   1 file changed, 156 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> new file mode 100644
>> index 0000000000000..87745d49c53a1
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
>> @@ -0,0 +1,156 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/pci/spacemit,k1-pcie-host.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: SpacemiT K1 PCI Express Host Controller
>> +
>> +maintainers:
>> +  - Alex Elder <elder@riscstar.com>
>> +
>> +description: >
>> +  The SpacemiT K1 SoC PCIe host controller is based on the Synopsys
>> +  DesignWare PCIe IP.  The controller uses the DesignWare built-in
>> +  MSI interrupt controller, and supports 256 MSIs.
>> +
>> +allOf:
>> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
>> +
>> +properties:
> 
> ...
> 
>> +  num-viewport:
>> +    const: 8
> 
> This property has been deprecated for a long time, and the driver now
> detects viewports at runtime since commit 281f1f99cf3a (PCI: dwc: Detect
> number of iATU windows, 2020-11-05), IOW, it makes no effect with the
> current mainline DWC PCIe driver. Is it really necessary?

Based on what you say, the answer is "no" and I'll gladly remove it.

Thanks.

					-Alex

> Best regards,
> Yao Zi


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
