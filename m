Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6321BC19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 23:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:References:
	In-Reply-To:MIME-Version:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1b011L92fHtv97F66LNt4elpcqj68hUITNwIoDSEmrk=; b=IL//pgUqRVpxZv
	Ogj8As11HMbNZhj1Bf1QrRQGcAJJAipA17DmQtOThGKycUf7awwKHdigHTv/MPctOpRtSaa9zMsvt
	CxgH+4j2h5lHh5BpelCnA2U/md5k5arUwnAGOCEcMJB1u6dAL/J6R73BmsY0INgP6eX8wS44pheD8
	VvAhWEnvKWg5AvBlXgXe22xR/fDMIE/fl0vThcPFjwwA/z1YF4khAXWdr8y+9K56gEe0LLR7vCEPR
	lgtbDZp4ZjIPqx9BsK93spayTJTfwAZd5daUTtbxgX7s6fG0Q43yGFFDzoyvJoUitMl6WTwTZ5YI2
	XybvfTzp6E3dH9FDsaOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpySU-00000009dmm-0DDA;
	Wed, 05 Mar 2025 23:47:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpySR-00000009dmP-3xsk
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 23:47:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 692625C4D58;
	Wed,  5 Mar 2025 23:45:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D28FCC4CED1;
	Wed,  5 Mar 2025 23:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741218442;
	bh=yA+mUIWACYxP3Wr1A2JYKZlm4l4xjgxWXhCe3n4HpBw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=l44AdQvFTlXE8ARf+BNvTDCRbaYon8o/M9LdZYejmCWWUovoprvtNhQqzc2mtMdqf
	 u3MrpKKSG1SplcM2kQASQXt2pQdGTQv0OnyK/ZlLSaynTp/cGd7pzsxm3zhqRdvlz9
	 iY0hMoysDkpLpa5ypgSn5c+1nmu/x6mBNtb7cMnizpkkhKJO+/XDl55ph335On0cch
	 bzaPCrv6k1sHMTnHhZKK+AC1g1ByoOfW9aNm3ypSDDSm/T60LaFgYl2q0akHmMkB4O
	 qKYxQRA/hvbDzKe9yImCbDGWYTlWBrHL8N6wT9IX+6X720wGg56rIxKMSYq+jFMZC7
	 N3zX6hQSEXOOg==
Message-ID: <de50dd55e1285726e8d5ebae73877486.sboyd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250303143629.400583-5-m.wilczynski@samsung.com>
References: <20250303143629.400583-1-m.wilczynski@samsung.com> <CGME20250303143637eucas1p1a3abdea520ab88688de1263a5f07bba0@eucas1p1.samsung.com> <20250303143629.400583-5-m.wilczynski@samsung.com>
Subject: Re: [PATCH v1 4/4] clk: thead: Add GPU clock gate control with CLKGEN reset support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Michal Wilczynski <m.wilczynski@samsung.com>
To: Michal Wilczynski <m.wilczynski@samsung.com>, alex@ghiti.fr, aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com, mturquette@baylibre.com, p.zabel@pengutronix.de, palmer@dabbelt.com, paul.walmsley@sifive.com, robh@kernel.org, wefu@redhat.com
Date: Wed, 05 Mar 2025 15:47:20 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_154724_092867_56EF486E 
X-CRM114-Status: GOOD (  23.44  )
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

Quoting Michal Wilczynski (2025-03-03 06:36:29)
> The T-HEAD TH1520 has three GPU clocks: core, cfg, and mem. The mem
> clock gate is marked as "Reserved" in hardware, while core and cfg are
> configurable. In order for these clock gates to work properly, the
> CLKGEN reset must be managed in a specific sequence.
> 
> Move the CLKGEN reset handling to the clock driver since it's
> fundamentally a clock-related workaround [1]. This ensures that clk_enabled
> GPU clocks stay physically enabled without external interference from
> the reset driver.  The reset is now deasserted only when both core and
> cfg clocks are enabled, and asserted when either of them is disabled.
> 
> The mem clock is configured to use nop operations since it cannot be
> controlled.
> 
> Link: https://lore.kernel.org/all/945fb7e913a9c3dcb40697328b7e9842b75fea5c.camel@pengutronix.de [1]
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
[...]
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index ea96d007aecd..1dfcde867233 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -862,17 +863,70 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
[...]
>  
>  static CCU_GATE_CLK_OPS(CLK_GPU_MEM, gpu_mem_clk, "gpu-mem-clk",
>                         video_pll_clk_pd, 0x0, BIT(2), 0, clk_nop_ops);
> +static CCU_GATE_CLK_OPS(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk",
> +                       video_pll_clk_pd, 0x0, BIT(3), 0, ccu_gate_gpu_ops);
> +static CCU_GATE_CLK_OPS(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
> +                       video_pll_clk_pd, 0x0, BIT(4), 0, ccu_gate_gpu_ops);
> +
> +static void ccu_gpu_clk_disable(struct clk_hw *hw)
> +{
> +       struct ccu_gate *cg = hw_to_ccu_gate(hw);
> +       unsigned long flags;
> +
> +       spin_lock_irqsave(&gpu_reset_lock, flags);
> +
> +       ccu_disable_helper(&cg->common, cg->enable);
> +
> +       if ((cg == &gpu_core_clk &&
> +            !clk_hw_is_enabled(&gpu_cfg_aclk.common.hw)) ||
> +           (cg == &gpu_cfg_aclk &&
> +            !clk_hw_is_enabled(&gpu_core_clk.common.hw)))
> +               reset_control_assert(gpu_reset);

Why can't the clk consumer control the reset itself? Doing this here is
not ideal because we hold the clk lock when we try to grab the reset
lock. These are all spinlocks that should be small in lines of code
where the lock is held, but we're calling into an entire other framework
under a spinlock. If an (unrelated) reset driver tries to grab the clk
lock it will deadlock.

I see the commit text talks about this being a workaround. I'm not sure
what the workaround is though. I've seen designs where the reset doesn't
work unless the clk is enabled because the flops have to be clocking for
the reset to propagate a few cycles, or the clk has to be disabled so
that the reset controller can do the clocking, or vice versa for the clk
not working unless the reset is deasserted. Long story short, it's
different between SoCs.

Likely the reset and clk control should be coordinated in a PM domain
for the device so that when the device is active, the clks are enabled
and the reset is deasserted in the correct order for the SoC. Can you do
that?

> +
> +       spin_unlock_irqrestore(&gpu_reset_lock, flags);
> +}

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
