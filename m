Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1249C369A2
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Apr 2025 00:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uqIx6iqV9wKPVmpD5eVy/wWEviBbioFq3IGz9by+ANE=; b=3O0BVDMmiKeI8y
	Ptpvjw+M52JCtgXGb6fkWNHXYBow1yE22os3kYHa3r7YsCpkInLTwVHiCe1zO9sfYx8sdoZSDm3ri
	XqeCQV7D/o9sEydDiPlxSOw/0jgkwZYRsWJG+pt+HjtriOWsCwR3XBrr7An6DW/xKQ3g/bqgIXPcC
	aU2aBCiocf+BFItw+MiYIijbRTLxub2P3vpXVyYfj9dLoI2FDYWOBPZfDgIxNz6cSVHLEauaGw5HW
	FIqRDwUsbKE8HGuw7dyDt8be1vAocYEic0bIiKJLm6v0+khlFh1HoF1efQ3DagziTX8aiT0EpsE62
	EQua/p6rhytWscDA9BRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0ram-0000000DDv5-0BXM;
	Sat, 05 Apr 2025 00:41:00 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0raA-0000000DDq2-2DjS
	for linux-riscv@lists.infradead.org;
	Sat, 05 Apr 2025 00:40:24 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-227b650504fso25066405ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Apr 2025 17:40:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1743813622; x=1744418422; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KfoL6a33lyE8RWsO9SgyVcz36aO/OVd9DKI3BuJvE6Q=;
        b=HKQjstd+Vs2gV9ghfvfBX28A/fbApYGibsq+XBGrMTYY4ey2ksVSZ+rClSAPbIZPYo
         91A8rUzCpvHie+A+S27sphovD6eHK1dBD2a0l7LuTWIbHag3julQzBbD/4hAzLYLqJbF
         J07LrOa8GbOmnmDmawWn+QOFuXYHewlvCM+Uf1MaNuGLys4Koj/KnwZdu1Q2oHabUK0x
         lfyn2hLYS60S0YZk1I+nH4BxfWc3853TjDI/hWKTaDGXh5hi7UaF0r0Jf3wd4gIoxpYI
         XfC00XrVSOGVAVZBlPu1XgOLPwCQJcS0PGboWCpWp3FgdQv4HkgHJHKZfNAe7BJadRHO
         6ITQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743813622; x=1744418422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KfoL6a33lyE8RWsO9SgyVcz36aO/OVd9DKI3BuJvE6Q=;
        b=UVSR69/iuWwWDONUc1PE3Yh8T0sRUN0A8AiUrCsm8qZQrffNipzBjrrAtxBBHNa2P5
         XYfp4+BZoyYiAHjc/McKvM/C7E3yKtPky25hz8yp06q86m0a1bipYiOwbZ5YEwSgDm1w
         HN0nyt1xbS/KMWzeSly+0dtgAEVbofxm2bubQYboHmOnMcCFJvw/S2EAt7JFOtud2+2J
         vZSwKCqT1Ofk+BZ11zE9wrfj2H0oWQz+jgw6RKT1J1+z1+RUmReJvl+C923bHMLCtdpT
         K4CnQJm6udtQZnhLtOTF2XTqK3JgyLPswH9HQg6YX7dIsGnq3OsDgYyNC4jPu0udWMp6
         qMgw==
X-Forwarded-Encrypted: i=1; AJvYcCX21Q0qc2U0YWYAlZuEPbeEcg06RfDT0hQ8jgXpbHvacgc5llyLGF8mVnmjFSRNZ9TAR6zkjE465Yb0sw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3UoAOD2IQUcYCl/nJd9Q1ebNh2Te0aRsWQR6jNc+CMtaf0Oov
	e+smw7PphzgnP+H5jIY1PcTtgfD59Ck8aMITkTRvAjIzDR3wOL2WTjmIoPa7kOM=
X-Gm-Gg: ASbGnctOMMdv8ToCZdqnRgaIL6VVmQShiumY/R5138cjH6KmJ8HRKDYRGMqAZVdkQEX
	0LbgnAwHMlfmzvEItNOoggsYp8xEEzSglyLkJXw+cTzTQkPJHYPpYvIO2Jmv2YK85JuVCT8alAo
	oM4niu6+9XmpSIY2nhU67uXTT4GpZd27KO2em0Bx9pb5ku4xR7rNE8pbbxPr8j8u9yS9TkYGf+J
	UtaYaK3FHVLGlOhB/Ju9xud9PtNysCIara/NafZ4BhhNuuhu1cThu+8eryxvht1Ug+J7LEtgHfc
	oOIPQEZBeCMgMZKz8xAr6dFq
X-Google-Smtp-Source: AGHT+IFLlRqb+B8Il0xSrLbIQ8LNYlVWESSp8k1D2Bpzp3CZ/lAiYjSrvaoBZJx+MHW3Im1cvg/mxw==
X-Received: by 2002:a17:902:ec86:b0:21f:5cd8:c67 with SMTP id d9443c01a7336-22a8a080701mr71816545ad.31.1743813621742;
        Fri, 04 Apr 2025 17:40:21 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97d1be1sm4092468b3a.8.2025.04.04.17.40.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 17:40:21 -0700 (PDT)
Date: Fri, 4 Apr 2025 17:40:19 -0700
From: Drew Fustini <drew@pdp7.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, guoren@kernel.org,
	wefu@redhat.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, jszhang@kernel.org,
	p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/3] clk: thead: Add clock support for VO subsystem in
 T-HEAD TH1520 SoC
Message-ID: <Z/B78yemvvSS1oLe@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094432eucas1p112aada697802092266bc36ef863f4299@eucas1p1.samsung.com>
 <20250403094425.876981-3-m.wilczynski@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250403094425.876981-3-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_174022_832889_9BCE36C2 
X-CRM114-Status: GOOD (  13.54  )
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

On Thu, Apr 03, 2025 at 11:44:24AM +0200, Michal Wilczynski wrote:
> The T-Head TH1520 SoC integrates a variety of clocks for its subsystems,
> including the Application Processor (AP) and the Video Output (VO) [1].
> Up until now, the T-Head clock driver only supported AP clocks.
> 
> Extend the driver to provide clock functionality for the VO subsystem.
> At this stage, the focus is on implementing the VO clock gates, as these
> are currently the most relevant and required components for enabling and
> disabling the VO subsystem functionality.  Future enhancements may
> introduce additional VO-related clocks as necessary.
> 
> Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 196 +++++++++++++++++++++++++-----
>  1 file changed, 168 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index 4c9555fc6184..ebfb1d59401d 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
>  static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
>  static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
>  
> +static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
> +		video_pll_clk_pd, 0x0, BIT(0), 0);

Is CLKCTRL_GPU_MEM_CLK_EN (bit 2) skipped on purpose?

> +static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
> +		0x0, BIT(3), 0);
> +static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
> +		video_pll_clk_pd, 0x0, BIT(4), 0);
> +static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
> +		video_pll_clk_pd, 0x0, BIT(5), 0);
> +static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
> +		video_pll_clk_pd, 0x0, BIT(6), 0);
> +static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
> +		BIT(7), 0);
> +static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
> +		BIT(8), 0);
> +static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, 0x0,
> +		BIT(9), 0);
> +static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_clk_pd,
> +		0x0, BIT(10), 0);
> +static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_pd, 0x0,
> +		BIT(11), 0);
> +static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_clk_pd,
> +		0x0, BIT(12), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
> +		video_pll_clk_pd, 0x0, BIT(13), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
> +		video_pll_clk_pd, 0x0, BIT(14), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-clk",
> +		video_pll_clk_pd, 0x0, BIT(15), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-clk",
> +		video_pll_clk_pd, 0x0, BIT(16), 0);
> +static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-refclk",
> +		video_pll_clk_pd, 0x0, BIT(17), 0);
> +static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
> +		video_pll_clk_pd, 0x0, BIT(18), 0);
> +static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
> +		0x0, BIT(19), 0);
> +static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
> +		video_pll_clk_pd, 0x0, BIT(20), 0);
> +static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(21), 0);
> +static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
> +		video_pll_clk_pd, 0x0, BIT(22), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
> +		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
> +		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
> +static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
> +		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
> +static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
> +		video_pll_clk_pd, 0x0, BIT(27), 0);
> +static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(28), 0);
> +static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
> +		video_pll_clk_pd, 0x0, BIT(29), 0);
> +static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
> +		video_pll_clk_pd, 0x0, BIT(30), 0);
> +static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
> +		video_pll_clk_pd, 0x0, BIT(31), 0);
> +static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
> +		0x4, BIT(0), 0);

Did you intentionally skip VOSYS_DPU_CCLK_CFG.VOSYS_DPU_CCLK_CFG and
TEST_CLK_CFG.TEST_CLK_CFG as they aren't needed?


Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
