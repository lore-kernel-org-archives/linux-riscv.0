Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12078C36010
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Mar 2025 11:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5U8h7ixdPw5cn3AcRYWp1KA0Pmjpn1AxzeS4etLvkJU=; b=hO2HZqoGvGsM3r
	aImG0+KERb05nMnUEqyfQ+EvDFZ4P6URmCx6c7c2tUVen7CnyfOjy3q4SX3Xpx2VrX9/2o1FcLWtB
	88WzkHPi1ahJrE3vNptBHw/Kw0mJSyPrQICnWd8vPf1XsffYOtQ6ODP0Iri0vDpAhOHplYjBuBn+1
	J6BBhL2vurLp/r48XFFD5IuCo7gEz2mZvloC+vbftxY7Drq9RuURhTVxn0BUgztnipkT5ug15MCrT
	YQlDbJbGK3FWwoPlmYNkcep93l934sgKC14AjkseEznuFoeneIhua3nSqnlL84SdWI3BC+mFjqUC9
	0V8p7jY+qJDT/xfHtLBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOsY-00000008LnH-0YWr;
	Wed, 26 Mar 2025 11:25:02 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txOsW-00000008Lmb-0w9j
	for linux-riscv@lists.infradead.org;
	Wed, 26 Mar 2025 11:25:01 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-6ef9b8b4f13so58929277b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 26 Mar 2025 04:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742988299; x=1743593099; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CAKfg0qsqFTp3rC4gKRjScpyZGRWGz93JbWST6kAsnA=;
        b=ua3H68EddFK/FLNqqQJyYVDTuwrxmgat2CStP7uXNtQ7JBrqozH3MgEiWBIUd8JTSB
         TciIzVi5K8AkBKnbrbSpuKOwhyTA3JhbsNW12UTmct2/HKmvBUA1DRGGNa4d/hct0M/o
         Rop8O/AvvAm362bsGMr/ubxuhBtmDpWQSIiLkpwxSw64PvWQ6CFncmwZGcXP5mjDnu6B
         oc/g0u7F/iJyz+1FD6PnYkKQktPDFav3V6HDz55nYIREFvodaeqTTxTkqTQw2mQqcfEL
         TwdCh2a9dkOYD8cK3uwrP7orfGDQsb/OJigXK/Pcql0avwyQGAxyey4YdCu5PWr3ybd5
         2Lkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742988299; x=1743593099;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CAKfg0qsqFTp3rC4gKRjScpyZGRWGz93JbWST6kAsnA=;
        b=gMDYqDlttcnL+DFtJx+vducAe/DEvSP5ts06aENiDcKubMohuxiEfPkzSrP0EcENqV
         XEFSsf+jSLhHL6LBDu0PmwryOr4oCBpHsx/cbkLJ8dGsRe7qWiGF5lRMU6/HpdaJ83oP
         eJJeuH+6EAa0JJi1tL+OihcZXXtZfjtuk2yUdAF1QGuLfIYyJcEBLy56R90w6QTfh1+n
         A4qyvmEtW/bow3563yKf9rI48Vgx3bR6yhh2vPLlZWLh6YL2aW5ztmgh+xrZz0iON1Za
         KVhLztyc2cXOgXDss1dadWizg2XErtTdVW7XaNLhBHB08xloSzl/4pgJGPY0M0NFzzGu
         P4jA==
X-Forwarded-Encrypted: i=1; AJvYcCW/vuPgUiuiGvGyas05/Iv7qkmzB5Htc/ztEwnHSopwYhtXBGT4T2rue5b/RframbvgUzYkehBiNp7VAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyGcYeysZ3bbCszLnSr1tQe9Ol47wczRZFGAhxCicvoFQYi4yvz
	oqE7Y/5jnvlBpEpOPVql4K/3zO/GVJ3KMwOWVHQe9X7byAWb0t6cy/xEKyDfvRJ3EhIwBgLakm6
	zUrJH7aKK/DdD9s52yuyraY67q5cSVdOZsEJAHg==
X-Gm-Gg: ASbGncu54G7FVFPtIYcwISyKPPyReGhOF4DZnyUMIrF/LMWDAdZ23171rAEQRtoleqM
	D+u448xpve/6QhmAJg4jIMJATOUN2E74t2ac7cvHqj2qlG6XrxwjSsCKeQsrLSnFk724KjTAWun
	/cJN+0EI1z468LsHy39TKEbmzePXlziQAQHTkmVOs0zgLx7sKq4Bfhem6LMp0=
X-Google-Smtp-Source: AGHT+IG0bRqZ7yucLkko4jSBCBt6Lj/LtcXgRGGRXa8ZXxRF/rWOCdZbLtb/q8iP+odXXLa6ynfR6bWujWIchPutkxQ=
X-Received: by 2002:a05:690c:f86:b0:6f9:7921:480e with SMTP id
 00721157ae682-700babfd2d6mr231478087b3.5.1742988298731; Wed, 26 Mar 2025
 04:24:58 -0700 (PDT)
MIME-Version: 1.0
References: <20250303143629.400583-1-m.wilczynski@samsung.com>
 <CGME20250303143637eucas1p1a3abdea520ab88688de1263a5f07bba0@eucas1p1.samsung.com>
 <20250303143629.400583-5-m.wilczynski@samsung.com> <de50dd55e1285726e8d5ebae73877486.sboyd@kernel.org>
 <4c035603-4c11-4e71-8ef3-b857a81bf5ef@samsung.com> <aacd03a071dce7b340d7170eae59d662d58f23b1.camel@pengutronix.de>
 <e90a0c77-61a0-49db-86ba-bac253f8ec53@samsung.com> <38d9650fc11a674c8b689d6bab937acf@kernel.org>
In-Reply-To: <38d9650fc11a674c8b689d6bab937acf@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 26 Mar 2025 12:24:22 +0100
X-Gm-Features: AQ5f1Jr_9rY3NEgVW4bBC1NZ3qSkcNWvCh-D1oUbC5XKRCPzJhBOl8lQH97_HVA
Message-ID: <CAPDyKFqsJaTrF0tBSY-TjpqdVt5=6aPQHYfnDebtphfRZSU=-Q@mail.gmail.com>
Subject: Re: [PATCH v1 4/4] clk: thead: Add GPU clock gate control with CLKGEN
 reset support
To: Stephen Boyd <sboyd@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>, Philipp Zabel <p.zabel@pengutronix.de>, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org, 
	jszhang@kernel.org, krzk+dt@kernel.org, m.szyprowski@samsung.com, 
	mturquette@baylibre.com, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	robh@kernel.org, wefu@redhat.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_042500_276159_C9F18792 
X-CRM114-Status: GOOD (  64.86  )
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

On Tue, 25 Mar 2025 at 23:40, Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Michal Wilczynski (2025-03-19 02:22:11)
> >
> >
> > On 3/13/25 10:25, Philipp Zabel wrote:
> > > On Do, 2025-03-06 at 17:43 +0100, Michal Wilczynski wrote:
> > >>
> > >> On 3/6/25 00:47, Stephen Boyd wrote:
> > >>> Quoting Michal Wilczynski (2025-03-03 06:36:29)
> > >>>> The T-HEAD TH1520 has three GPU clocks: core, cfg, and mem. The mem
> > >>>> clock gate is marked as "Reserved" in hardware, while core and cfg are
> > >>>> configurable. In order for these clock gates to work properly, the
> > >>>> CLKGEN reset must be managed in a specific sequence.
> > >>>>
> > >>>> Move the CLKGEN reset handling to the clock driver since it's
> > >>>> fundamentally a clock-related workaround [1]. This ensures that clk_enabled
> > >>>> GPU clocks stay physically enabled without external interference from
> > >>>> the reset driver.  The reset is now deasserted only when both core and
> > >>>> cfg clocks are enabled, and asserted when either of them is disabled.
> > >>>>
> > >>>> The mem clock is configured to use nop operations since it cannot be
> > >>>> controlled.
> > >>>>
> > >>>> Link: https://lore.kernel.org/all/945fb7e913a9c3dcb40697328b7e9842b75fea5c.camel@pengutronix.de [1]
> > >>>>
> > >>>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> > >>> [...]
> > >>>> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> > >>>> index ea96d007aecd..1dfcde867233 100644
> > >>>> --- a/drivers/clk/thead/clk-th1520-ap.c
> > >>>> +++ b/drivers/clk/thead/clk-th1520-ap.c
> > >>>> @@ -862,17 +863,70 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
> > >>> [...]
> > >>>>
> > >>>>  static CCU_GATE_CLK_OPS(CLK_GPU_MEM, gpu_mem_clk, "gpu-mem-clk",
> > >>>>                         video_pll_clk_pd, 0x0, BIT(2), 0, clk_nop_ops);
> > >>>> +static CCU_GATE_CLK_OPS(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk",
> > >>>> +                       video_pll_clk_pd, 0x0, BIT(3), 0, ccu_gate_gpu_ops);
> > >>>> +static CCU_GATE_CLK_OPS(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
> > >>>> +                       video_pll_clk_pd, 0x0, BIT(4), 0, ccu_gate_gpu_ops);
> > >>>> +
> > >>>> +static void ccu_gpu_clk_disable(struct clk_hw *hw)
> > >>>> +{
> > >>>> +       struct ccu_gate *cg = hw_to_ccu_gate(hw);
> > >>>> +       unsigned long flags;
> > >>>> +
> > >>>> +       spin_lock_irqsave(&gpu_reset_lock, flags);
> > >>>> +
> > >>>> +       ccu_disable_helper(&cg->common, cg->enable);
> > >>>> +
> > >>>> +       if ((cg == &gpu_core_clk &&
> > >>>> +            !clk_hw_is_enabled(&gpu_cfg_aclk.common.hw)) ||
> > >>>> +           (cg == &gpu_cfg_aclk &&
> > >>>> +            !clk_hw_is_enabled(&gpu_core_clk.common.hw)))
> > >>>> +               reset_control_assert(gpu_reset);
> > >>>
> > >>> Why can't the clk consumer control the reset itself? Doing this here is
> > >>> not ideal because we hold the clk lock when we try to grab the reset
> > >>> lock. These are all spinlocks that should be small in lines of code
> > >>> where the lock is held, but we're calling into an entire other framework
> > >>> under a spinlock. If an (unrelated) reset driver tries to grab the clk
> > >>> lock it will deadlock.
> > >>
> > >> So in our case the clk consumer is the drm/imagination driver. Here is
> > >> the comment from the maintainer for my previous attempt to use a reset
> > >> driver to abstract the GPU init sequence [1]:
> > >>
> > >> "Do you know what this resets? From our side, the GPU only has a single
> > >> reset line (which I assume to be GPU_RESET)."
> > >>
> > >> "I don't love that this procedure appears in the platform reset driver.
> > >> I appreciate it may not be clear from the SoC TRM, but this is the
> > >> standard reset procedure for all IMG Rogue GPUs. The currently
> > >> supported TI SoC handles this in silicon, when power up/down requests
> > >> are sent so we never needed to encode it in the driver before.
> > >>
> > >> Strictly speaking, the 32 cycle delay is required between power and
> > >> clocks being enabled and the reset line being deasserted. If nothing
> > >> here touches power or clocks (which I don't think it should), the delay
> > >> could potentially be lifted to the GPU driver."
> > >>
> > >> From the drm/imagination maintainers point of view their hardware has
> > >> only one reset, the extra CLKGEN reset is SoC specific.
> > >
> > > If I am understanding correctly, the CLKGEN reset doesn't reset
> > > anything in the GPU itself, but holds the GPU clock generator block in
> > > reset, effectively disabling the three GPU clocks as a workaround for
> > > the always-ungated GPU_MEM clock.
> > >
> > >> Also the reset driver maintainer didn't like my way of abstracting two
> > >> resets ("GPU" and and SoC specific"CLKGEN") into one reset
> > >
> > > That is one part of it. The other is that (according to my
> > > understanding as laid out above), the combined GPU+CLKGEN reset would
> > > effectively disable all three GPU clocks for a while, after the GPU
> > > driver has already requested them to be enabled.
> >
> > Thank you for your comments Philipp, it seems like we're on the same
> > page here. I was wondering whether there is anything I can do to move the
> > patches forward.
> >
> > Stephen, if the current patch is a no go from your perspective could you
> > please advise whether there is a way to solve this in a clock that would
> > be acceptable to you.
>
> It looks like the SoC glue makes the interactions between the clk and
> reset frameworks complicated because GPU clks don't work if a reset is
> asserted. You're trying to find a place to coordinate the clk and reset.
> Am I right?
>
> I'd advise managing the clks and resets in a generic power domain that
> is attached to the GPU device. In that power domain, coordinate the clk
> and reset sequencing so that the reset is deasserted before the clks are
> enabled (or whatever the actual requirement is). If the GPU driver
> _must_ have a clk and reset pointer to use, implement one that either
> does nothing or flag to the GPU driver that the power domain is managing
> all this for it so it should just use runtime PM and system PM hooks to
> turn on the clks and take the GPU out of reset.
>
> From what I can tell, the GPU driver maintainer doesn't want to think
> about the wrapper that likely got placed around the hardware block
> shipped by IMG. This wrapper is the SoC glue that needs to go into a
> generic power domain so that the different PM resources, reset, clk,
> etc. can be coordinated based on the GPU device's power state. It's
> either that, or go the dwc3 route and have SoC glue platform drivers
> that manage this stuff and create a child device to represent the hard
> macro shipped by the vendor like Synopsys/Imagination. Doing the parent
> device design isn't as flexible as PM domains because you can only have
> one parent device and the child device state can be ignored vs. many PM
> domains attached in a graph to a device that are more directly
> influenced by the device using runtime PM.
>
> Maybe you'll be heartened to know this problem isn't unique and has
> existed for decades :) I don't know what state the graphics driver is in
> but they'll likely be interested in solving this problem in a way that
> doesn't "pollute" their driver with SoC specific details. It's all a
> question of where you put the code. The reset framework wants to focus
> on resets, the clk framework wants to focus on clks, and the graphics
> driver wants to focus on graphics. BTW, we went through a similar
> discussion with regulators and clks years ago and ended up handling that
> with OPPs and power domains.

Right, power-domain providers are mostly implementing SoC specific code.

In some cases, power-domain providers also handle per device SoC
specific constraints/sequences, which seems what you are discussing
here. For that, genpd has a couple of callbacks that could be
interesting to have a look at, such as:

genpd->attach|detach_dev() - for probe/remove
genpd.dev_ops->start|stop() - for runtime/system PM

That said, maybe just using the regular genpd->power_on|off() callback
is sufficient here, depending on how you decide to model things.

>
> I believe a PM domain is the right place for this kind of stuff, and I
> actually presented on this topic at OSSEU[1], but I don't maintain that
> code. Ulf does.
>
> [1] https://osseu2024.sched.com/event/1ej38/the-case-for-an-soc-power-management-driver-stephen-boyd-google

Kind regards
Uffe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
