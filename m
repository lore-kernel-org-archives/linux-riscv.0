Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 635AEC282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 09:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NPSYoxGUN20nRbPh9wndRr5h1idLKDqV773c9ZTklac=; b=XKDcE79XI4MbGJ
	kF582qb0hpq5NF/OCAw/hWgwtWytZTlSqpwMDrR3GMpt3+cKFgKgJYfj3PJX6cPsgNf5s08Qgl7CT
	GwWzaZdVxZnZ2YdCfMsCOSHbJ0NsgvZuCXyUaLsmZltP3ripP5wTavIQR9XSQu3R1qPfqeR6kOto4
	PyvA/rmHW0tCYYGJRt+0PExQ7IEJTprNV6G2seWysKbOsaTnikXu2XmfVRsCu9Pdt/CMCS/VBQ8lg
	QlLDq/rZbqCChcIORdTy9FC+Feq3MZlnHAhSl3plKwCcqsckREbuvuOMYfLi/Xze2Urv3iT6Ho5Rt
	6oVw58ky//1uS3rzBZIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsepN-0000000Aj3e-2PS4;
	Thu, 13 Mar 2025 09:26:09 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsepL-0000000Aj2r-38Bw
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 09:26:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseov-0007i3-LS; Thu, 13 Mar 2025 10:25:41 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseou-005VlU-0j;
	Thu, 13 Mar 2025 10:25:40 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1tseou-00058F-0Q;
	Thu, 13 Mar 2025 10:25:40 +0100
Message-ID: <aacd03a071dce7b340d7170eae59d662d58f23b1.camel@pengutronix.de>
Subject: Re: [PATCH v1 4/4] clk: thead: Add GPU clock gate control with
 CLKGEN reset support
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Michal Wilczynski <m.wilczynski@samsung.com>, Stephen Boyd
 <sboyd@kernel.org>, alex@ghiti.fr, aou@eecs.berkeley.edu,
 conor+dt@kernel.org,  drew@pdp7.com, guoren@kernel.org, jszhang@kernel.org,
 krzk+dt@kernel.org,  m.szyprowski@samsung.com, mturquette@baylibre.com,
 palmer@dabbelt.com,  paul.walmsley@sifive.com, robh@kernel.org,
 wefu@redhat.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Thu, 13 Mar 2025 10:25:40 +0100
In-Reply-To: <4c035603-4c11-4e71-8ef3-b857a81bf5ef@samsung.com>
References: <20250303143629.400583-1-m.wilczynski@samsung.com>
	 <CGME20250303143637eucas1p1a3abdea520ab88688de1263a5f07bba0@eucas1p1.samsung.com>
	 <20250303143629.400583-5-m.wilczynski@samsung.com>
	 <de50dd55e1285726e8d5ebae73877486.sboyd@kernel.org>
	 <4c035603-4c11-4e71-8ef3-b857a81bf5ef@samsung.com>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_022607_987758_C65C06A0 
X-CRM114-Status: GOOD (  39.92  )
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

On Do, 2025-03-06 at 17:43 +0100, Michal Wilczynski wrote:
> 
> On 3/6/25 00:47, Stephen Boyd wrote:
> > Quoting Michal Wilczynski (2025-03-03 06:36:29)
> > > The T-HEAD TH1520 has three GPU clocks: core, cfg, and mem. The mem
> > > clock gate is marked as "Reserved" in hardware, while core and cfg are
> > > configurable. In order for these clock gates to work properly, the
> > > CLKGEN reset must be managed in a specific sequence.
> > > 
> > > Move the CLKGEN reset handling to the clock driver since it's
> > > fundamentally a clock-related workaround [1]. This ensures that clk_enabled
> > > GPU clocks stay physically enabled without external interference from
> > > the reset driver.  The reset is now deasserted only when both core and
> > > cfg clocks are enabled, and asserted when either of them is disabled.
> > > 
> > > The mem clock is configured to use nop operations since it cannot be
> > > controlled.
> > > 
> > > Link: https://lore.kernel.org/all/945fb7e913a9c3dcb40697328b7e9842b75fea5c.camel@pengutronix.de [1]
> > > 
> > > Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > [...]
> > > diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > > index ea96d007aecd..1dfcde867233 100644
> > > --- a/drivers/clk/thead/clk-th1520-ap.c
> > > +++ b/drivers/clk/thead/clk-th1520-ap.c
> > > @@ -862,17 +863,70 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
> > [...]
> > >  
> > >  static CCU_GATE_CLK_OPS(CLK_GPU_MEM, gpu_mem_clk, "gpu-mem-clk",
> > >                         video_pll_clk_pd, 0x0, BIT(2), 0, clk_nop_ops);
> > > +static CCU_GATE_CLK_OPS(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk",
> > > +                       video_pll_clk_pd, 0x0, BIT(3), 0, ccu_gate_gpu_ops);
> > > +static CCU_GATE_CLK_OPS(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
> > > +                       video_pll_clk_pd, 0x0, BIT(4), 0, ccu_gate_gpu_ops);
> > > +
> > > +static void ccu_gpu_clk_disable(struct clk_hw *hw)
> > > +{
> > > +       struct ccu_gate *cg = hw_to_ccu_gate(hw);
> > > +       unsigned long flags;
> > > +
> > > +       spin_lock_irqsave(&gpu_reset_lock, flags);
> > > +
> > > +       ccu_disable_helper(&cg->common, cg->enable);
> > > +
> > > +       if ((cg == &gpu_core_clk &&
> > > +            !clk_hw_is_enabled(&gpu_cfg_aclk.common.hw)) ||
> > > +           (cg == &gpu_cfg_aclk &&
> > > +            !clk_hw_is_enabled(&gpu_core_clk.common.hw)))
> > > +               reset_control_assert(gpu_reset);
> > 
> > Why can't the clk consumer control the reset itself? Doing this here is
> > not ideal because we hold the clk lock when we try to grab the reset
> > lock. These are all spinlocks that should be small in lines of code
> > where the lock is held, but we're calling into an entire other framework
> > under a spinlock. If an (unrelated) reset driver tries to grab the clk
> > lock it will deadlock.
> 
> So in our case the clk consumer is the drm/imagination driver. Here is
> the comment from the maintainer for my previous attempt to use a reset
> driver to abstract the GPU init sequence [1]:
> 
> "Do you know what this resets? From our side, the GPU only has a single
> reset line (which I assume to be GPU_RESET)."
> 
> "I don't love that this procedure appears in the platform reset driver.
> I appreciate it may not be clear from the SoC TRM, but this is the
> standard reset procedure for all IMG Rogue GPUs. The currently
> supported TI SoC handles this in silicon, when power up/down requests
> are sent so we never needed to encode it in the driver before.
> 
> Strictly speaking, the 32 cycle delay is required between power and
> clocks being enabled and the reset line being deasserted. If nothing
> here touches power or clocks (which I don't think it should), the delay
> could potentially be lifted to the GPU driver." 
> 
> From the drm/imagination maintainers point of view their hardware has
> only one reset, the extra CLKGEN reset is SoC specific.

If I am understanding correctly, the CLKGEN reset doesn't reset
anything in the GPU itself, but holds the GPU clock generator block in
reset, effectively disabling the three GPU clocks as a workaround for
the always-ungated GPU_MEM clock.

> Also the reset driver maintainer didn't like my way of abstracting two
> resets ("GPU" and and SoC specific"CLKGEN") into one reset

That is one part of it. The other is that (according to my
understanding as laid out above), the combined GPU+CLKGEN reset would
effectively disable all three GPU clocks for a while, after the GPU
driver has already requested them to be enabled.

> to make it
> seem to the consumer driver drm/imagination like there is only one
> reset and suggested and attempt to code the re-setting in the clock
> driver [2]. Even though he suggested a different way of achieving that: 
> 
> "In my mind it shouldn't be much: the GPU clocks could all share the
> same refcounted implementation. The first clock to get enabled would
> ungate both GPU_CORE and GPU_CFG_ACLK gates and deassert
> GPU_SW_CLKGEN_RST, all in one place. The remaining enable(s) would be
> no-ops. Would that work?"
> 
> The above would have similar effect, but I felt like enabling both
> clocks in single .enable callback could be confusing so I ended up with
> the current approach. This could be easily re-done if you feel this
> would be better.
> 
> I agree that using spinlocks here is dangerous, but looking at the code
> of the reset_control_deassert and reset_control_assert, it doesn't seem
> like any spinlocks are acquired/relased in that code flow, unless the
> driver ops would introduce that. So in this specific case deadlock
> shouldn't happen ?

There are no spinlocks in the reset_control_(de)assert paths in the
reset framework, but in general there could be in the driver. The thead
driver [1], uses regmap_update_bits() on a regmap with .fast_io = true,
which uses the internal struct regmap::spinlock.

[1] https://lore.kernel.org/all/20250303152511.494405-3-m.wilczynski@samsung.com/


regards
Philipp

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
