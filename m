Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33A12C369A1
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Apr 2025 10:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VyegziNMboBcCbptbEAeOvqskt6lHaLI8k5UXlb0zbQ=; b=OOPcTOWb/IBmHw
	GL7S+EwKYTdE3x+x1ncYsrca/zYUitYNp5OOwE+4/7HzVYDfORo2bpB3V2mb9psdafwMqLdv1JvGc
	kHKT1fMrPenm4+Ry9gn26q38hlAWrnFQXiZhqErFrQ0IIaSIQgRRdgzOY+z1lVwJWEN6/A2Ywr2d3
	65MH0xSzRo5pHneUCHU71dcmLM+h367aeHzbQojdh/cAAGJHMzt+Ksz51vWH20wvU0B3T1GMuBilO
	6TTX4INeGhwsYEOULhWsRW7eo5XMFDa85Hz/82Q/an/+kqEtkxrcyfs0h1KPNcsaUkdHQdLlSFGRV
	DqnwziWAjCqGK5SlIquQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SsX-00000006s7x-2JKe;
	Wed, 09 Apr 2025 10:41:57 +0000
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2SsU-00000006s6q-00xY
	for linux-riscv@lists.infradead.org;
	Wed, 09 Apr 2025 10:41:55 +0000
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-700b17551cdso65329767b3.0
        for <linux-riscv@lists.infradead.org>; Wed, 09 Apr 2025 03:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744195312; x=1744800112; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=zbx/nnTrG6Q4jtzUnp3dgghp62oCSk+raqpc9aCKiZs=;
        b=M32a9QvRzerdloCz2cSTgHAzCm64EuzBsA5pvg650Rql4rOH0FrnrVHrN3EHGO8yUo
         XLbhV0wmB4mY34ae50e6+I+m+8nWNrMpzHLg1EM0pLWyX17r+KAUj94+HtuobFZFW7Se
         cPO/WrweJW1dsoyFCw2X8rxMRmub2rQuzQJC25AhRBtR2kCbGkCXsL3sUthoDeRwtkhq
         ArwvcbbzdnIY31to+YjsHZvViYLcSnfIHe+C4cMRuNzeYBIKgA2ErSmWdN+/ynyXCSsP
         4TQ8JJ3PBIK9rJ8z1G5ic25gu6kkoEHNCNoHtlWO32TJW5a9KUWXeNfpGxDsFo7NVZ7P
         lmzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195312; x=1744800112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zbx/nnTrG6Q4jtzUnp3dgghp62oCSk+raqpc9aCKiZs=;
        b=Ci4T6K5jRpFWnHftwBUurdpdTp0TLcgSWDGjTGOS3Y6E3Im4h4/F8vJ6txVSB/Eb/h
         BsMKX6Fy0C0l3/jXYgLmg4Z+uaii8jZvjb4dmeLq839JT6Jr0SmFWj0Epvbc8AE7eFy1
         PkYOQ3VPYcTePZLoTHY1LHcNQPq3s1Lj4lr2aMxY6ZfVhdzFDQH5wBcYTnNeHTZBaT1I
         +bZLRSIv9Kwx2BO1/XKeWLnsE9Io3wWK0zJ83H25ZtY2fONAPHC0xUTaleZWAsuZMivL
         3MJUeVP3XYx0YUn1qMxeYPLKeaImra6maPOSks6wSiMHQ4OLipD2aRKG5I0NgLduavhu
         HvoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmvLteRgZs43fzTOFyNBe/aiiDHbsKxmNH4F5SC4ZxhiQFhnCONIOAP/2n48KOVQGk6LNpDBse2Ymm7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyhsBTsFe8SlTv/CVfx3kzXz/+LZs+KcuAqsydxeSB26XUY/um4
	RuCf5JQJklZe3lYbNC/xXZWyJm8hbzN8jcDl8TqwTSOavOyefCpAkS6/vPKS//UvLYj9RisDa7P
	5ZtyTzBvAaak+rp5O6vcS2kT7wXc+/G4paQpK1A==
X-Gm-Gg: ASbGncvLGOMf10k1cQGkgqt6o/Jr195YRHR/0DXW6bPPwLr12QgksyLqa4iOMsrggWb
	YFAlB1Ii6Uuu2iuY9oNwfuII3Lucs8LGe7ee7FcugaJnsZhDqDeq8NNC5W9+W8UYHxybLXKyb88
	sLdgUaXEQStICnYs5BjX7EQLBsAu82khxYSA==
X-Google-Smtp-Source: AGHT+IFcW3dVYG/NllcMUbiQFPsaC2kMGwBB25zgb5C4LoLaPrqyxQ+CvN8joNvk0vnecmPTbBGtAkQPDSjYEggyHcE=
X-Received: by 2002:a05:690c:4889:b0:6fd:4485:9255 with SMTP id
 00721157ae682-7053ae70affmr35816427b3.24.1744195312358; Wed, 09 Apr 2025
 03:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20250409093031eucas1p2222e9dc4d354e9b66b7183922c0fb3cf@eucas1p2.samsung.com>
 <20250409093025.2917087-1-m.wilczynski@samsung.com> <20250409093025.2917087-2-m.wilczynski@samsung.com>
In-Reply-To: <20250409093025.2917087-2-m.wilczynski@samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 9 Apr 2025 12:41:16 +0200
X-Gm-Features: ATxdqUGWw59JsfUXBmewm_-nQPR1HPGJKXnfN1JdqM3oC2wFfjOLFi3_5CNvBz8
Message-ID: <CAPDyKFpoSwKAmiWyvNt1fVyu6=NU1oVOmQLVuzX_bG=-5KrM2Q@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: firmware: thead,th1520: Add clocks
 and resets
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, 
	guoren@kernel.org, wefu@redhat.com, p.zabel@pengutronix.de, 
	m.szyprowski@samsung.com, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_034154_043386_CDA92E35 
X-CRM114-Status: GOOD (  20.47  )
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

On Wed, 9 Apr 2025 at 11:30, Michal Wilczynski <m.wilczynski@samsung.com> wrote:
>
> Prepare for handling GPU clock and reset sequencing through a generic
> power domain by adding clock and reset properties to the TH1520 AON
> firmware bindings.
>
> The T-HEAD TH1520 GPU requires coordinated management of two clocks
> (core and sys) and two resets (GPU and GPU CLKGEN). Due to SoC-specific
> requirements, the CLKGEN reset must be carefully managed alongside clock
> enables to ensure proper GPU operation, as discussed on the mailing list
> [1].
>
> Since the coordination is now handled through a power domain, only the
> programmable clocks (core and sys) are exposed. The GPU MEM clock is
> ignored, as it is not controllable on the TH1520 SoC.
>
> This approach follows upstream maintainers' recommendations [1] to
> avoid SoC-specific details leaking into the GPU driver or clock/reset
> frameworks directly.
>
> [1] - https://lore.kernel.org/all/38d9650fc11a674c8b689d6bab937acf@kernel.org/
>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/firmware/thead,th1520-aon.yaml   | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> index bbc183200400..8075874bcd6b 100644
> --- a/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> +++ b/Documentation/devicetree/bindings/firmware/thead,th1520-aon.yaml
> @@ -25,6 +25,16 @@ properties:
>    compatible:
>      const: thead,th1520-aon
>
> +  clocks:
> +    items:
> +      - description: GPU core clock
> +      - description: GPU sys clock
> +
> +  clock-names:
> +    items:
> +      - const: gpu-core
> +      - const: gpu-sys

These clocks don't look like they belong to the power-domain node, but
rather the GPU's node.

Or is this in fact the correct description of the HW?

> +
>    mboxes:
>      maxItems: 1
>
> @@ -32,13 +42,27 @@ properties:
>      items:
>        - const: aon
>
> +  resets:
> +    items:
> +      - description: GPU reset
> +      - description: GPU CLKGEN reset
> +
> +  reset-names:
> +    items:
> +      - const: gpu
> +      - const: gpu-clkgen
> +

Ditto for the reset.

>    "#power-domain-cells":
>      const: 1
>
>  required:
>    - compatible
> +  - clocks
> +  - clock-names
>    - mboxes
>    - mbox-names
> +  - resets
> +  - reset-names
>    - "#power-domain-cells"
>
>  additionalProperties: false
> @@ -47,7 +71,11 @@ examples:
>    - |
>      aon: aon {
>          compatible = "thead,th1520-aon";
> +        clocks = <&clk_vo 0>, <&clk_vo 1>;
> +        clock-names = "gpu-core", "gpu-sys";
>          mboxes = <&mbox_910t 1>;
>          mbox-names = "aon";
> +        resets = <&rst 0>, <&rst 1>;
> +        reset-names = "gpu", "gpu-clkgen";
>          #power-domain-cells = <1>;
>      };
> --
> 2.34.1
>

That said, it's still possible to make both the clocks and reset being
managed from the genpd provider. I will comment on that separately for
patch2.

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
