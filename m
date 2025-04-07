Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9978DC369A7
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 21:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMMwUImGVbVQ/VzAP5SKKI335BeZuJafFNLJbQQmbDU=; b=mHTpAQwlAL5Mn7
	FUY/mbebuuHPKm4AWQWBCyDpfOS4TVxV5ATZGDMhtctf9rMnWgwLXV1TCaZgMYA2IUpkyc3LgDycX
	w52gL0jfZVN4oTEnM64xut11mFQ35E45MMB/FdfFuh5ZkprP3Z+ey9P2pYJm2t+QR8Wj9kxFeN7pG
	G7lVSnQvpHdvsxkr/tRWOkc+ub0W7aZSxPT4n2UT2Nq/uwk0kFTQ5L4EEjIxdhxmPxdRxfWrbntq0
	A9adwIa4vMnD02UqpUGcYFuoVa6wkrtXTKgeZpF0ZKH6BTGl1VxrXs1a1+4GsWT2xJL4fkbys1ihK
	sl6MocQruKuilgUaSQzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1uIp-00000002456-1vo1;
	Mon, 07 Apr 2025 21:46:47 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1r4m-00000001X4H-2x6X
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 18:20:06 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so3985230b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Apr 2025 11:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pdp7-com.20230601.gappssmtp.com; s=20230601; t=1744050004; x=1744654804; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=R+V2vTlPXFRoR4RnOsfulrUnfIyTIkpiYxiS7BOwBDI=;
        b=FJzftHXvhOgbGNJ4HlBzS0gblP/pINNogObLtYmfSWn04m72q7DAMlJrq4G2HAASpv
         Rtg3pl6qpopa/G61zZR1ghxcrBKhzYedBMwFeueDXl3dQbzASqfkpKSvEqkPwzH6JwZd
         dpOTbN8PgfxvBijB8K92zoejGmPySBREMdKVDNbmQrzQFki29F1GzcboA2sbBLLnqg5C
         HCG1o3xqozttSIS2P529zMAj/9xRO0LqaDRDv1OfVrzfJhQUplD9+HuNnQZ/ubRfLoqY
         dPgMk+XlP5CE2x94FaYErVbDTwRLZ8KVEd/3Be2Tr6+BB9O9e+YjVEFbGXoSN1gY4EO4
         0qcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744050004; x=1744654804;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+V2vTlPXFRoR4RnOsfulrUnfIyTIkpiYxiS7BOwBDI=;
        b=VOzJUvjKjmWSzXmBEMTysNthiRrOJ4nq2RLwrO1q8FJHFmJDONP326AmMahZm7uyp9
         iCvHXOXFbuW/swcIVHgGr8vU/gj4nqIBcUhuoRvqMiIUBKmkR0M1HysUklAtycsAcg+v
         MCfwYdZKrzUiPfNa5lItkB82Zg5ieKAtHf2D+F2OSaOemvPtr53qxdQZIO3HNBPnr6oQ
         +1sX7/dCi1Yo3/desWEZBuWFj0pHm/5Y3CjsgHoZ0+0k+0lXsfZ7qYbVi0eJu9otGEPc
         WWxfRp4/UQN3XlnFejuvutxP5UJorIGsI20d8wKQF8m0TbrZQQJGXX6xFURHzWhnXG4I
         TZrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqGYOU8ANEc+OFlCYk7QQYS4ZiLQtnbybfSNjRDT8010Cj/0B8SQTQUZSU0E3CE7ADQnUnFvPuy14OWA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0KfWUnojQERS+RN1X2AQVWAfuOdegFrr2W0+0FZ1BYWuo8LMA
	PoaXJafuJjbmzoIJoGRtxOhOJvlTp/Nth4UX49e9Knc0OVpLwJO4aU+bHxZxFM8=
X-Gm-Gg: ASbGncvF0ElfncztkengYvL8jWV59iX9lNaoCcs2KMV/w86n3pLzprqfU7WXBqtIxAd
	wZP74oYzyerT0s3mHrG1Rc8pYE/WJIZ7vSk6qjxz9Bk6HMPrdPWmC6qOVvWJ6qx2NCiHs4ca4Np
	lXZ/ZvRvYRFu2nwoWkGl9uSzC3xPagYERg1BcdE0xvQbxOfFpu0RWF+HlZ0r6/jDbN9mLj5dLGc
	2UFfoSzY8I/s3JttrDyROdHeS7yMTa/pAuazRtv59uBgdgAiXke1/hCxxy9kTv1bMu64SyzmrRG
	DMLqNQIA4JUxrg/uZQvUwuaE
X-Google-Smtp-Source: AGHT+IEl1YxVJk4wofWvZdOA4V1bIqKO6UF883BN6rvABi3IMXJHGdv+VxDSAdya02SSa2rBro1iGw==
X-Received: by 2002:a05:6a00:3c8f:b0:730:9801:d3e2 with SMTP id d2e1a72fcca58-73b6aa401a6mr12709766b3a.8.1744050003612;
        Mon, 07 Apr 2025 11:20:03 -0700 (PDT)
Received: from x1 ([97.115.235.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739da0deddfsm8878564b3a.162.2025.04.07.11.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 11:20:03 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:20:00 -0700
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
Message-ID: <Z/QXUEFLGwb48eKK@x1>
References: <20250403094425.876981-1-m.wilczynski@samsung.com>
 <CGME20250403094432eucas1p112aada697802092266bc36ef863f4299@eucas1p1.samsung.com>
 <20250403094425.876981-3-m.wilczynski@samsung.com>
 <Z/B78yemvvSS1oLe@x1>
 <955e01e2-cfd4-4ac1-9e7b-d624d7d6a2d7@samsung.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <955e01e2-cfd4-4ac1-9e7b-d624d7d6a2d7@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_112004_877623_5FCCF929 
X-CRM114-Status: GOOD (  22.53  )
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

On Mon, Apr 07, 2025 at 06:16:52PM +0200, Michal Wilczynski wrote:
> 
> 
> On 4/5/25 02:40, Drew Fustini wrote:
> > On Thu, Apr 03, 2025 at 11:44:24AM +0200, Michal Wilczynski wrote:
> >> The T-Head TH1520 SoC integrates a variety of clocks for its subsystems,
> >> including the Application Processor (AP) and the Video Output (VO) [1].
> >> Up until now, the T-Head clock driver only supported AP clocks.
> >>
> >> Extend the driver to provide clock functionality for the VO subsystem.
> >> At this stage, the focus is on implementing the VO clock gates, as these
> >> are currently the most relevant and required components for enabling and
> >> disabling the VO subsystem functionality.  Future enhancements may
> >> introduce additional VO-related clocks as necessary.
> >>
> >> Link: https://protect2.fireeye.com/v1/url?k=36dff7e6-5754e2d0-36de7ca9-74fe485cbff1-cfd601a10959d91c&q=1&e=fa692882-d05b-4276-bff3-01f7a237dd97&u=https%3A%2F%2Fopenbeagle.org%2Fbeaglev-ahead%2Fbeaglev-ahead%2F-%2Fblob%2Fmain%2Fdocs%2FTH1520%2520System%2520User%2520Manual.pdf [1]
> >>
> >> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> >> ---
> >>  drivers/clk/thead/clk-th1520-ap.c | 196 +++++++++++++++++++++++++-----
> >>  1 file changed, 168 insertions(+), 28 deletions(-)
> >>
> >> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> >> index 4c9555fc6184..ebfb1d59401d 100644
> >> --- a/drivers/clk/thead/clk-th1520-ap.c
> >> +++ b/drivers/clk/thead/clk-th1520-ap.c
> >> @@ -847,6 +847,67 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
> >>  static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
> >>  static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
> >>  
> >> +static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
> >> +		video_pll_clk_pd, 0x0, BIT(0), 0);
> > 
> > Is CLKCTRL_GPU_MEM_CLK_EN (bit 2) skipped on purpose?
> 
> Hi,
> This one is marked as "Reserved" in the manual, so yeah it's on purpose.
> 
> > 
> >> +static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
> >> +		0x0, BIT(3), 0);
> >> +static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
> >> +		video_pll_clk_pd, 0x0, BIT(4), 0);
> >> +static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
> >> +		video_pll_clk_pd, 0x0, BIT(5), 0);
> >> +static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
> >> +		video_pll_clk_pd, 0x0, BIT(6), 0);
> >> +static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
> >> +		BIT(7), 0);
> >> +static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
> >> +		BIT(8), 0);
> >> +static CCU_GATE(CLK_DPU_CCLK, dpu_cclk, "dpu-cclk", video_pll_clk_pd, 0x0,
> >> +		BIT(9), 0);
> >> +static CCU_GATE(CLK_HDMI_SFR, hdmi_sfr_clk, "hdmi-sfr-clk", video_pll_clk_pd,
> >> +		0x0, BIT(10), 0);
> >> +static CCU_GATE(CLK_HDMI_PCLK, hdmi_pclk, "hdmi-pclk", video_pll_clk_pd, 0x0,
> >> +		BIT(11), 0);
> >> +static CCU_GATE(CLK_HDMI_CEC, hdmi_cec_clk, "hdmi-cec-clk", video_pll_clk_pd,
> >> +		0x0, BIT(12), 0);
> >> +static CCU_GATE(CLK_MIPI_DSI0_PCLK, mipi_dsi0_pclk, "mipi-dsi0-pclk",
> >> +		video_pll_clk_pd, 0x0, BIT(13), 0);
> >> +static CCU_GATE(CLK_MIPI_DSI1_PCLK, mipi_dsi1_pclk, "mipi-dsi1-pclk",
> >> +		video_pll_clk_pd, 0x0, BIT(14), 0);
> >> +static CCU_GATE(CLK_MIPI_DSI0_CFG, mipi_dsi0_cfg_clk, "mipi-dsi0-cfg-clk",
> >> +		video_pll_clk_pd, 0x0, BIT(15), 0);
> >> +static CCU_GATE(CLK_MIPI_DSI1_CFG, mipi_dsi1_cfg_clk, "mipi-dsi1-cfg-clk",
> >> +		video_pll_clk_pd, 0x0, BIT(16), 0);
> >> +static CCU_GATE(CLK_MIPI_DSI0_REFCLK, mipi_dsi0_refclk, "mipi-dsi0-refclk",
> >> +		video_pll_clk_pd, 0x0, BIT(17), 0);
> >> +static CCU_GATE(CLK_MIPI_DSI1_REFCLK, mipi_dsi1_refclk, "mipi-dsi1-refclk",
> >> +		video_pll_clk_pd, 0x0, BIT(18), 0);
> >> +static CCU_GATE(CLK_HDMI_I2S, hdmi_i2s_clk, "hdmi-i2s-clk", video_pll_clk_pd,
> >> +		0x0, BIT(19), 0);
> >> +static CCU_GATE(CLK_X2H_DPU1_ACLK, x2h_dpu1_aclk, "x2h-dpu1-aclk",
> >> +		video_pll_clk_pd, 0x0, BIT(20), 0);
> >> +static CCU_GATE(CLK_X2H_DPU_ACLK, x2h_dpu_aclk, "x2h-dpu-aclk",
> >> +		video_pll_clk_pd, 0x0, BIT(21), 0);
> >> +static CCU_GATE(CLK_AXI4_VO_PCLK, axi4_vo_pclk, "axi4-vo-pclk",
> >> +		video_pll_clk_pd, 0x0, BIT(22), 0);
> >> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU_PCLK, iopmp_vosys_dpu_pclk,
> >> +		"iopmp-vosys-dpu-pclk", video_pll_clk_pd, 0x0, BIT(23), 0);
> >> +static CCU_GATE(CLK_IOPMP_VOSYS_DPU1_PCLK, iopmp_vosys_dpu1_pclk,
> >> +		"iopmp-vosys-dpu1-pclk", video_pll_clk_pd, 0x0, BIT(24), 0);
> >> +static CCU_GATE(CLK_IOPMP_VOSYS_GPU_PCLK, iopmp_vosys_gpu_pclk,
> >> +		"iopmp-vosys-gpu-pclk", video_pll_clk_pd, 0x0, BIT(25), 0);
> >> +static CCU_GATE(CLK_IOPMP_DPU1_ACLK, iopmp_dpu1_aclk, "iopmp-dpu1-aclk",
> >> +		video_pll_clk_pd, 0x0, BIT(27), 0);
> >> +static CCU_GATE(CLK_IOPMP_DPU_ACLK, iopmp_dpu_aclk, "iopmp-dpu-aclk",
> >> +		video_pll_clk_pd, 0x0, BIT(28), 0);
> >> +static CCU_GATE(CLK_IOPMP_GPU_ACLK, iopmp_gpu_aclk, "iopmp-gpu-aclk",
> >> +		video_pll_clk_pd, 0x0, BIT(29), 0);
> >> +static CCU_GATE(CLK_MIPIDSI0_PIXCLK, mipi_dsi0_pixclk, "mipi-dsi0-pixclk",
> >> +		video_pll_clk_pd, 0x0, BIT(30), 0);
> >> +static CCU_GATE(CLK_MIPIDSI1_PIXCLK, mipi_dsi1_pixclk, "mipi-dsi1-pixclk",
> >> +		video_pll_clk_pd, 0x0, BIT(31), 0);
> >> +static CCU_GATE(CLK_HDMI_PIXCLK, hdmi_pixclk, "hdmi-pixclk", video_pll_clk_pd,
> >> +		0x4, BIT(0), 0);
> > 
> > Did you intentionally skip VOSYS_DPU_CCLK_CFG.VOSYS_DPU_CCLK_CFG and
> > TEST_CLK_CFG.TEST_CLK_CFG as they aren't needed?
> 
> Yeah I couldn't see a use for them even in the vendor kernel so skipped
> them. I guess they could be added when we figure some way to use them.

Thanks, for the explanations. This looks good to me.

Reviewed-by: Drew Fustini <drew@pdp7.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
