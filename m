Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC765C43458
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jul 2026 16:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GsjPPf9sJ2DjBuxj7BvdKGLl4c0AraLtHPV0PR5oNLA=; b=UHcybU6W21Mp7y
	VeDlkuWClv+lhPI+YcUzirlOCBZdCwE0+wD2L/nCSsPMbVK2v/lt0XmcX8Ptk+dogRi6g/D/F25FI
	ajzgLGiaDPRPVs83TWsJPxKPXHa9zvk7RqhxcoJB4f7JSnXla18jh8kVgXJtDz/RtYI+FjPG2dCJP
	v+Vlwk55uXc0zoHYDN4hYjYfmE6dx82b/EXtm4vTUWhTVHSHGsNU/Qn5ugmc9F2uUjZyJ8rwTpQCR
	SXxcRtJ6DBgbkUygZQBk9GssQpIHUMSWWv3TM3rhC2zKkgLWWpWSKBqXs37lkauJ/uaSvxFuYPJ/C
	Xb4Rqst/0cqETE3Xmfmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfd-00000005F2f-0gdY;
	Fri, 10 Jul 2026 16:01:45 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiDfb-00000005F0x-0kiM
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jul 2026 16:01:44 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-51c2a449c57so6317151cf.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jul 2026 09:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20251104.gappssmtp.com; s=20251104; t=1783699302; x=1784304102; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xplki/WjnUaATCo6uGj8PBglmca7aRIHrcSArfmWE/8=;
        b=ox+6JapZMeB9mEIElSTM86+ZHRm3qPitCetodBVa5ardGWbu2InrozXvAVE1BmdzON
         e0Ep+JFqT9CtVhrTghgKNRePJpVwexK/uK6eirbf3X0uR1c31RnKt6Bz0gzIqwRxpevB
         zbaSC8i8YYsnqEFSgAh4xHPNOOUEE9lGo76iJUmw5Rxpv2WjWBz9HEMHFUM40R5uZ762
         NckcIrcieWdSOgX5IFiEAIzL2Xha1HTcf4hp6q7GcrHdE+aTSvTUBTaY+J8HMa0GPY4J
         I5rhDNslUn5VvvGw4BAdbGLEsQ31pT8NBk7Ub3sy8UyHlK6/LmsZKiA8u96gbkJi/MQy
         k4ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783699302; x=1784304102;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xplki/WjnUaATCo6uGj8PBglmca7aRIHrcSArfmWE/8=;
        b=lEEwEaMeXW5UYQo5OiLkQEiO1RIetV837QK/GT00d4HD65/XKMK7WzzPjXQ1WDasrR
         d8Z0QgO8D6j5vj+A86PkObEMf85TNpS6PT+/xpz5VCEnytl61qcq7Tvx3s/Wms+E7YhP
         Ux+9a4OIA0X540YjOAISCG6MXKneDpitgEX5/eX8NwXJ5yXuEhcihh5IFUJmhxNw46fM
         sSVt2J/TN48swKXDAgTKW6X6z4FR4RR1e2DcVMC9RI4sJx0oE4msnmM0psGNMfL82IEG
         DANFuVJU9dT72wTPEuCS5kQxAb595HkNWBY730BzTTH69YlvUvLXrRPzB+/xEWiazAxO
         k8/A==
X-Forwarded-Encrypted: i=1; AHgh+Rq/2SoitgeR4PNqm8VTX6H0eQiCg1/tHEB3I2kF73Qd+oeuz3IoSOzdLpVCqt32cHEQgKkC9VpkOboteA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6+lNW9SgJJJDmuNVcSHtrEL34pd2aIItcNLp+RYUK9oJ+SDCH
	wVAA8HeboDccgllKERE9LAGTUGkS0MWzMxJBJ4PP+GzbisBzpBDA9E2uTxLuUTCa1JI=
X-Gm-Gg: AfdE7cn5//bKMMxjm1aG97GVjpU02llhVw+/PuxOqCbSdsUi46nbvDstevY8C+GnUBs
	3R5Y+nBmKyJzFKRSUTh0JrcA3RYUhErCo4t+G+myML5DnW2bSvwsZzDMsLb9Wynibwos9l0Hd4i
	4UlRQ6hapd0eb0MKWIzE7GXrXi7mBNMe0cifQq6mrOiONXHx/peCXUEqXtO2uWg3F7rBWjh7lih
	ua1BGeaai3f98BfyOMEzxJcv1FkfdTD2JE4FVIPVRIbvjzF/aL5F2plVZRUXjsb5LKtIaiHQC+y
	xRwceRlkWV/oSuP3LsFNbiPKb7Q3VNWOoAhXIo+DO0yWOBPmfTwPqspihPR33o3Gt3dXbiBZNQN
	ALkxIMwjZSzfG6NlN714/0pzGQPx45cEfPeSEM8xcDUVE810dv2x/8CP2nK4Go0nx8u6yoc+fGC
	Xv1PI9LwckGP4i
X-Received: by 2002:a05:622a:2c6:b0:516:df62:bdd2 with SMTP id d75a77b69052e-51c8b3c65f5mr122904381cf.55.1783699301497;
        Fri, 10 Jul 2026 09:01:41 -0700 (PDT)
Received: from [172.22.22.28] ([73.62.185.64])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caaf5f61csm18644921cf.22.2026.07.10.09.01.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 09:01:40 -0700 (PDT)
Message-ID: <58948c74-0990-449e-8eee-88cbb38db7e7@riscstar.com>
Date: Fri, 10 Jul 2026 11:01:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] dt-bindings: PCI: spacemit: Introduce Spacemit K3
 PCIe host controller
To: Inochi Amaoto <inochiama@gmail.com>, Jingoo Han <jingoohan1@gmail.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Bjorn Helgaas
 <bhelgaas@google.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Christian Bruel <christian.bruel@foss.st.com>, Frank Li <Frank.Li@nxp.com>,
 Nam Cao <namcao@linutronix.de>, Qiang Yu <qiang.yu@oss.qualcomm.com>,
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
 Xincheng Zhang <zhangxincheng@ultrarisc.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Vidya Sagar <vidyas@nvidia.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>,
 Longbin Li <looong.bin@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
 <20260709040027.958400-6-inochiama@gmail.com>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20260709040027.958400-6-inochiama@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_090143_238409_840302C5 
X-CRM114-Status: GOOD (  17.68  )
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

On 7/8/26 11:00 PM, Inochi Amaoto wrote:
> Add binding support for the PCIe controller on the SpacemiT K3 SoC.
> This controller is almost a standard Synopsys DesignWare PCIe IP,
> with some extra link and reset state control.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

This looks OK to me.  What I see is that K3 does not require
the interrupts and interrupt-names properties, allows up to
six PHYs (not just one), and adds a dbi2 register that is not
used by K1.

I might have missed it, but I don't see where the dbi2 register
is used by the K3 code you have added.  In pcie-designware.c,
I see that if no "dbi2" resource is found, memory at offset
4096 from the "dbi" base is used.  Does that apply for K3?
If so, maybe there's no need to define dbi2.

					-Alex

> ---
>   .../bindings/pci/spacemit,k1-pcie-host.yaml   | 50 ++++++++++++++++---
>   1 file changed, 43 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> index c4c00b5fcdc0..54817d6fd9af 100644
> --- a/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
> @@ -14,26 +14,29 @@ description: >
>     PCIe IP.  The controller uses the DesignWare built-in MSI interrupt
>     controller, and supports 256 MSIs.
>   
> -allOf:
> -  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> -
>   properties:
>     compatible:
> -    const: spacemit,k1-pcie
> +    enum:
> +      - spacemit,k1-pcie
> +      - spacemit,k3-pcie
>   
>     reg:
> +    minItems: 4
>       items:
>         - description: DesignWare PCIe registers
>         - description: ATU address space
>         - description: PCIe configuration space
>         - description: Link control registers
> +      - description: Data Bus Interface (DBI) shadow registers.
>   
>     reg-names:
> +    minItems: 4
>       items:
>         - const: dbi
>         - const: atu
>         - const: config
>         - const: link
> +      - const: dbi2
>   
>     clocks:
>       items:
> @@ -66,6 +69,8 @@ properties:
>     interrupt-names:
>       const: msi
>   
> +  msi-parent: true
> +
>     spacemit,apmu:
>       $ref: /schemas/types.yaml#/definitions/phandle-array
>       description:
> @@ -84,7 +89,8 @@ patternProperties:
>   
>       properties:
>         phys:
> -        maxItems: 1
> +        minItems: 1
> +        maxItems: 6
>   
>         vpcie3v3-supply:
>           description:
> @@ -96,13 +102,43 @@ patternProperties:
>   
>       unevaluatedProperties: false
>   
> +allOf:
> +  - $ref: /schemas/pci/snps,dw-pcie.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-pcie
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 4
> +
> +        reg-names:
> +          maxItems: 4
> +
> +      patternProperties:
> +        '^pcie@':
> +          properties:
> +            phys:
> +              maxItems: 1
> +
> +      required:
> +        - interrupts
> +        - interrupt-names
> +    else:
> +      properties:
> +        reg:
> +          minItems: 5
> +
> +        reg-names:
> +          minItems: 5
> +
>   required:
>     - clocks
>     - clock-names
>     - resets
>     - reset-names
> -  - interrupts
> -  - interrupt-names
>     - spacemit,apmu
>   
>   unevaluatedProperties: false


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
