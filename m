Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B994C36002
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Apr 2025 19:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ntj/xORLUZszv68eWPFqLowoYuAlE3QHdlYHAo/9FlI=; b=eTFKdyAngTWR3Y
	dBvcgYpgjvyEx6ZE+2hreIFvpgv950jTOm5Epu0/K2tcE53E9+gVGMNY++V83dCWJAnE52pKf79JQ
	qEnrLzcwU+n6fB8CZ/OjiT5Chf7f18XcV+qNPJeXimftMY0jUTgbzFvA/EqOa2hn3nvpEcxbxNJB0
	KwRJHyWhvnxAh25HQq/ThRT4bFRbVcuSraNkRx6rMfZBFgZg6HkP0D21fSoQDqU7nqvnrke1dk/xb
	Nb0H78+PgSGhIdhRMAJyeXmUNOKqlJlRybNRc1aAdm9bb6e5w4yC61W9GD5h+IKcaF1outXfsiQrM
	vCCgg82/85BZKhQj86mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1W97-0000000FjtW-1WKA;
	Sun, 06 Apr 2025 19:59:09 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1W93-0000000Fjt4-3La8
	for linux-riscv@lists.infradead.org;
	Sun, 06 Apr 2025 19:59:07 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-af28bc68846so3281222a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743969544; x=1744574344; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cSV5brJCU8FRwDjADDTtVWC1mi4xZgKh3TRBBKKlcb0=;
        b=jI7mMqknk8zoBqnpG1Pvh09QIRtkUohUSicAKP1r2Pj/pQ0MUdCsNw7PUga2ipklgo
         6VBowj0mIVfEa3w1xAvbV1Z11rlGYiKVbnR2l/KOATD5v2r95HNerxplZMhUB8GZbaDo
         3dYwMX4Q8Dqlnye+GA14IEBCTN+pLqlYmuThFSm3ZIdJmvPk4eLNLw3TSdVihYi2MLu6
         BxUgBwDG2je6DgnwqeuRKQGAGNuqoJbau9g+L/5qm9WIXVZzv2xlPoZgxyEgC9cPNWWk
         bbS7022BfajIXclrpU3aFTbG59FoqGYu8q2/QQ43E9qicW5MEqDWhzKcG6+xY41NOsPq
         ZgAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743969544; x=1744574344;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSV5brJCU8FRwDjADDTtVWC1mi4xZgKh3TRBBKKlcb0=;
        b=JLAL1X+bNS3SVOy0k5hn1jv0Os4vFibxE/eoLKhbaVkiozv00JWRzsCKoKnrO/nx2O
         PzmSKRrrNtA62A0WH5/c1XucuF+4J5ZBf+rD0niOmdF2dsq0NFy7gOxxO7m1FF4qIlyp
         4J2sUFwx4++GY/W7L36rFi10NTpTI0bBy03yeYjiKoaGtUEWc1rQ7rWVhtkUX3y6zufw
         ePDVnyH8eQKRiW9TpqzXwHCvPhf5beutYhhpK9IqcEVUiCKHmVCcCPhY0RVSgRu6fbM+
         CDayilPXe3Co9XtO81h/io2ICVExCnMh40bjRALkmRJVxew/PFpK7WFUhpZGiIT9k4Zy
         GpeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmDTqM/O7zSYLrOvUvsDj9GGKeTkWpuy5evg3oSc1FlNY3ZxKcFYhvu85TgCU3k5mKxuXbccpTf3z45g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaBMEsdvs0R63YW0EXe/GpMFJjpOISStqxwwQNl4zoQ2Doob1Q
	YxeO/FBNnXtJYvTlj4STckl434B/7JpAJn5uAp9H9Rc2POS277EN2s75Ry/+nEw=
X-Gm-Gg: ASbGncvNuEs6Tcj1+PNLbbvt/8LhazU0TAZcU5xaX2A18y89zsIDNowkXhPjiJcILc+
	HXcFCGkOAy6wxc1iFEuXFMwECo9ndjyvYDDfxrQs30eJ3D4sz4Bkjx5QTxAU9FqekT2yuvff+d0
	VxPlUPajsAn4e3hUbFOb9VUi1jS2bJXn6YiE7Kmp3bLtyD7jBjz9557t6gxaMvvJhMs9vCkvyXK
	vS0U0qyFqYD20MfJCr8mLR5yug4A5YAGaggMmiRIOaSYVEkHbdf6ohEdxqnSOs2y1NNo3fe7ag7
	hr1LAnAkNpgcjd3nAyXZEYWI
X-Google-Smtp-Source: AGHT+IFHfOOl6mZeB5Mp3Yf4a024PZQ1azNnZAt0Xlq5r9Sp57KSEDZ9mlf7RbY8QgX4UurEi2QyFw==
X-Received: by 2002:a17:90b:274c:b0:2fe:a545:4c85 with SMTP id 98e67ed59e1d1-306a6268598mr13951024a91.27.1743969544093;
        Sun, 06 Apr 2025 12:59:04 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3057ca47ec7sm8413268a91.15.2025.04.06.12.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 12:59:03 -0700 (PDT)
Date: Sun, 6 Apr 2025 12:59:01 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: thead: Add TH1520 VO clock
 controller
Message-ID: <Z/LdBTtAj2+J5nbb@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094431eucas1p21412dff1c24aae077fdfeef08e0f802b@eucas1p2.samsung.com>
 <20250403094425.876981-2-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403094425.876981-2-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_125906_103687_C6905BA8 
X-CRM114-Status: GOOD (  17.65  )
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

On Thu, Apr 03, 2025 at 11:44:23AM +0200, Michal Wilczynski wrote:
> Add device tree bindings for the TH1520 Video Output (VO) subsystem
> clock controller. The VO sub-system manages clock gates for multimedia
> components including HDMI, MIPI, and GPU.
> 
> Document the VIDEO_PLL requirements for the VO clock controller, which
> receives its input from the AP clock controller. The VIDEO_PLL is a
> Silicon Creations Sigma-Delta (integer) PLL typically running at 792 MHz
> with maximum FOUTVCO of 2376 MHz.
> 
> This binding complements the existing AP sub-system clock controller
> which manages CPU, DPU, GMAC and TEE PLLs.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../bindings/clock/thead,th1520-clk-ap.yaml   | 17 ++++++++--
>  .../dt-bindings/clock/thead,th1520-clk-ap.h   | 34 +++++++++++++++++++
>  2 files changed, 48 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> index 0129bd0ba4b3..9d058c00ab3d 100644
> --- a/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> +++ b/Documentation/devicetree/bindings/clock/thead,th1520-clk-ap.yaml
> @@ -8,7 +8,8 @@ title: T-HEAD TH1520 AP sub-system clock controller
>  
>  description: |
>    The T-HEAD TH1520 AP sub-system clock controller configures the
> -  CPU, DPU, GMAC and TEE PLLs.
> +  CPU, DPU, GMAC and TEE PLLs. Additionally the VO subsystem configures
> +  the clock gates for the HDMI, MIPI and the GPU.
>  
>    SoC reference manual
>    https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf
> @@ -20,14 +21,24 @@ maintainers:
>  
>  properties:
>    compatible:
> -    const: thead,th1520-clk-ap
> +    enum:
> +      - thead,th1520-clk-ap
> +      - thead,th1520-clk-vo
>  
>    reg:
>      maxItems: 1
>  
>    clocks:
>      items:
> -      - description: main oscillator (24MHz)
> +      - description: |
> +          One input clock:
> +          - For "thead,th1520-clk-ap": the clock input must be the 24 MHz
> +            main oscillator.
> +          - For "thead,th1520-clk-vo": the clock input must be the VIDEO_PLL,
> +            which is configured by the AP clock controller. According to the
> +            TH1520 manual, VIDEO_PLL is a Silicon Creations Sigma-Delta PLL
> +            (integer PLL) typically running at 792 MHz (FOUTPOSTDIV), with
> +            a maximum FOUTVCO of 2376 MHz.
>  
>    "#clock-cells":
>      const: 1
> diff --git a/include/dt-bindings/clock/thead,th1520-clk-ap.h b/include/dt-bindings/clock/thead,th1520-clk-ap.h
> index a199784b3512..09a9aa7b3ab1 100644
> --- a/include/dt-bindings/clock/thead,th1520-clk-ap.h
> +++ b/include/dt-bindings/clock/thead,th1520-clk-ap.h
> @@ -93,4 +93,38 @@
>  #define CLK_SRAM3		83
>  #define CLK_PLL_GMAC_100M	84
>  #define CLK_UART_SCLK		85
> +
> +/* VO clocks */
> +#define CLK_AXI4_VO_ACLK		0
> +#define CLK_GPU_MEM			1
> +#define CLK_GPU_CORE			2
> +#define CLK_GPU_CFG_ACLK		3
> +#define CLK_DPU_PIXELCLK0		4
> +#define CLK_DPU_PIXELCLK1		5
> +#define CLK_DPU_HCLK			6
> +#define CLK_DPU_ACLK			7
> +#define CLK_DPU_CCLK			8
> +#define CLK_HDMI_SFR			9
> +#define CLK_HDMI_PCLK			10
> +#define CLK_HDMI_CEC			11
> +#define CLK_MIPI_DSI0_PCLK		12
> +#define CLK_MIPI_DSI1_PCLK		13
> +#define CLK_MIPI_DSI0_CFG		14
> +#define CLK_MIPI_DSI1_CFG		15
> +#define CLK_MIPI_DSI0_REFCLK		16
> +#define CLK_MIPI_DSI1_REFCLK		17
> +#define CLK_HDMI_I2S			18
> +#define CLK_X2H_DPU1_ACLK		19
> +#define CLK_X2H_DPU_ACLK		20
> +#define CLK_AXI4_VO_PCLK		21
> +#define CLK_IOPMP_VOSYS_DPU_PCLK	22
> +#define CLK_IOPMP_VOSYS_DPU1_PCLK	23
> +#define CLK_IOPMP_VOSYS_GPU_PCLK	24
> +#define CLK_IOPMP_DPU1_ACLK		25
> +#define CLK_IOPMP_DPU_ACLK		26
> +#define CLK_IOPMP_GPU_ACLK		27
> +#define CLK_MIPIDSI0_PIXCLK		28
> +#define CLK_MIPIDSI1_PIXCLK		29
> +#define CLK_HDMI_PIXCLK			30
> +
>  #endif
> -- 
> 2.34.1
> 

Reviewed-by: Drew Fustini <drew@pdp7.com>

I think this makes sense and dt_binding_check looks clean.

Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
