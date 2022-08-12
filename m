Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9F4C00140
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Aug 2022 07:52:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+EzR0Tm6/FuZodMLAmx6LOdgz1pZOfem6SmTTg0l9mQ=; b=Z7KUSa4tlKtSp2
	IQMD8bMTirTKkWrcTc/5WV6iP00+1+KKNQwEPdnMjNZxlLYnL7919peei9HhAVB/BaYmtlftH1jsR
	dBtgQOOVadCdO1+W6IxX+GjLoKE9i4uB0/T3mf5EbYFetiRdyb4cVYn7mpixTNAiCy70ebP0ftdM7
	T8aw7cvC9I59RJj50tr2G0+J8VWHycBH97vkHBpUMqzgEwG7G46HJ0OsFagkIXX8udd3VbMZXmIy8
	uUM/oSLLBAkly50TUinlEabLNO6PbPfzesnjiv0SQyBE5Fpbt40VqZMTUM7a78xpOc0EqpihGWYwT
	bS9/W0bJ8Ci97RSqWcfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPSv-00282P-Vi; Fri, 12 Aug 2022 07:52:22 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMPSo-0027vq-RI
	for linux-riscv@lists.infradead.org; Fri, 12 Aug 2022 07:52:18 +0000
Received: by mail-lj1-x229.google.com with SMTP id by6so170251ljb.11
        for <linux-riscv@lists.infradead.org>; Fri, 12 Aug 2022 00:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=Y1FgwE1S0sZxGVZfKzOP1495FUieOVb1Ijht3ICAFkg=;
        b=mL0W5VC6YSoWJdmliy79TMTZKdBE0ndlkNHtLaGGwh6t3xDn+H2ok9auBHCeQ88/Pr
         akeMAs/sbQxBsK39m3xjJHHbOo9x6yrGvlspQtODqTOgqChqdD1hKHnANPOhSTLnm00N
         I7n/2QBlBqTZ+PBv4evi+qLwiJos6vXDlo8lmnSoajfFbooNbIXyWsIlBGu9hjERgQgc
         QNt9VSW65T9PvyuMsZ17SkJBTzyXmqZkxIP1Y23gHfdCDPUI/sX0dvDVOFjE3qgRvQDO
         dr8x/65eK7Yfl7khzi00d7fI15M5Gdm+HZ3zc9Q9OYpqKXmSFFrsiGwbsCCaY98pCNBC
         lf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=Y1FgwE1S0sZxGVZfKzOP1495FUieOVb1Ijht3ICAFkg=;
        b=VWckbW2wV90wjpf65Q2gfku1luwc0c/xsqYjgGtbKmb8UMKK4N6gBjXb758J3llzRs
         gmVc0ZcbvXhQv632rbEeaUXnPqpOliWfcx710fYzYSCSQc5jEdE2yYIMhndtbGYLfIYz
         sN6os/J3JG1T9XJTaB5Kzu1Vk6+G1GAzCtl3qP2f9yfn8fwjun3EbqqTHmd6AVZUVkC6
         mxFbkNgAFBV2p2BR0GAJyNh/tMkieAHT0wzamVtzQomDtc2a2/0Edu7N7Zo/Q//kNd2R
         pBFbAN5Nh66YLKRjeBS4mmJT0xhDB2RPFIu7Zqm4H5njWkOPvNKI+XX/DQzc7FovaLzY
         zDwQ==
X-Gm-Message-State: ACgBeo1MRI32tdlM1jrIH5Nii5bETWH8YkthKUKXY2qwnNDxAb35DKPt
	fxDD2xGUZS52C/zOyRwKsbTMVA==
X-Google-Smtp-Source: AA6agR7ieagGDwa45zL3pLJwwj3Fc73INAw9s0I68eA2wdC3N+LrYS0gii7eVHf8+1bD5EKhkVFLpQ==
X-Received: by 2002:a2e:bd89:0:b0:25a:9386:75d0 with SMTP id o9-20020a2ebd89000000b0025a938675d0mr866830ljq.431.1660290732392;
        Fri, 12 Aug 2022 00:52:12 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id i27-20020ac25b5b000000b0048b18fb378fsm124440lfp.119.2022.08.12.00.52.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 00:52:11 -0700 (PDT)
Message-ID: <edf3da1b-79dc-4e09-8d3e-73aca09e847f@linaro.org>
Date: Fri, 12 Aug 2022 10:52:02 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 4/4] dt-bindings: PCI: microchip,pcie-host: fix missing
 address translation property
Content-Language: en-US
To: Conor Dooley <mail@conchuod.ie>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, Conor Dooley <conor.dooley@microchip.com>
Cc: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20220811203306.179744-1-mail@conchuod.ie>
 <20220811203306.179744-5-mail@conchuod.ie>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220811203306.179744-5-mail@conchuod.ie>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_005215_002571_9EAC7C13 
X-CRM114-Status: GOOD (  26.12  )
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

On 11/08/2022 23:33, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> When the PCI controller node was added to the PolarFire SoC dtsi,
> dt-schema was not able to detect the presence of some undocumented
> properties due to how it handled unevaluatedProperties. v2022.08
> introduces better validation, producing the following error:
> 
> arch/riscv/boot/dts/microchip/mpfs-polarberry.dtb: pcie@2000000000: Unevaluated properties are not allowed ('clock-names', 'microchip,axi-m-atr0' were unexpected)
>         From schema: Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> 
> Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> I feel like there's a pretty good chance that this is not the way this
> should have been done and the property should be marked as deprecated
> but I don't know enough about PCI to answer that.

It seems bindings were added incomplete and now based on DTS (which did
not match bindings), we keep adding "missing" properties. I don't think
it is good. It creates a precedence where someone might intentionally
sneak limited bindings (without controversial property) and later claim
"I forgot to include foo,bar".

Therefore the property should pass review just like it is newly added
property.

> ---
>  .../devicetree/bindings/pci/microchip,pcie-host.yaml  | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> index 9b123bcd034c..9ac34b33c4b2 100644
> --- a/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> +++ b/Documentation/devicetree/bindings/pci/microchip,pcie-host.yaml
> @@ -71,6 +71,17 @@ properties:
>    msi-parent:
>      description: MSI controller the device is capable of using.
>  
> +  microchip,axi-m-atr0:

Name is not helping. If it is offset, add such suffix (see
brcm,iproc-pcie.yaml).

Unfortunately I don't know PCIe good enough to judge whether the
property makes any sense or some other ranges-style should be used.

> +    description: |
> +      Depending on the FPGA bitstream, the AXIM address translation table in the
> +      PCIe controllers bridge layer may need to be configured. Use this property
> +      to set the address offset. For more information, see Section 1.3.3,
> +      "PCIe/AXI4 Address Translation" of the PolarFire SoC PCIe User Guide:
> +      https://www.microsemi.com/document-portal/doc_download/1245812-polarfire-fpga-and-polarfire-soc-fpga-pci-express-user-guide
> +    $ref: /schemas/types.yaml#/definitions/uint32-matrix
> +    minItems: 2

minItems should not be needed, but you should instead describe the items
in the matrix.

> +    maxItems: 2


Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
