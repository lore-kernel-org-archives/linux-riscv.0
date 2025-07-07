Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B79BFC83F07
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Jul 2025 01:56:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QVcuNOC0wQmE+Mtewv0i8nlekM0vjmhksD9AlYu/gHI=; b=f1L9rcFyeQtoLm
	aWF3lh5RmmfTMU3Yut46ADmRHaK34lPopgaGfr9QGF9quiPcZlcEsHwDKEmqqlbSirDwvpwcvQrAV
	ZDDfaxSmBVlviQyJMdRi64YGb+tdyDKJw+N96JGgDILvu4jg58gcyjtELPDMP30WoQy1nrBJan2L6
	BT6BehSwnZ+i8QHfkgnnMg5ueBfGJywXCJEGHNW0N0vNZSM9KG22CO7meNgMiTVNDKCa96Cvmef0a
	YcRuuux75D62BnflRmZajlPRZc5iG1J6J/6YzuVNujeEL9KPLTGRfRFZG3Psqu0ED93BkQPi+GCVn
	KzYAD/eyPR8TOqRz+rTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYb5K-000000019yB-3DxC;
	Mon, 07 Jul 2025 01:55:58 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYato-000000018Zf-1mgs
	for linux-riscv@lists.infradead.org;
	Mon, 07 Jul 2025 01:44:06 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id D5CD625BB6;
	Mon,  7 Jul 2025 03:43:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZhZxq-Ph4-IH; Mon,  7 Jul 2025 03:43:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1751852638; bh=W0aYtN0vm8uGLHx3axEQY4aRYshmJ7EragvrKqgq9aw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IVqQo5Xi9Z13iyqaQDysPJP2fwBLeuJ+s5oe4BadfpVOOwHno4peWRtcMnSHWKKeV
	 g4Xxklg5yIxyyPFdTIIq/UrZ6Tz9UtJVy/AzXsogUZ7Hbl1cyY08lWsGBsvhY4LsoC
	 23y76RFrxbB31bhcPhhaZu4y/ao/47R2TZaQzV+rWwl+XvHGcXYsiffjy9N6+BlRib
	 Qs75LjIbSLzaZLXTdLZnnUTNddEeiNuJEV6qxUDcIJcqDmfgDm2BGSNBdP3H9tH2ir
	 wwv3ee5gIU4s6l7M8m46s7rk4z7NgxSYWwoVneDIAX3zI/DMNxhy1IO4bj5aBgO+Es
	 QK2JbOBhwPqTw==
Date: Mon, 7 Jul 2025 01:43:45 +0000
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
	Yangtao Li <frank.li@vivo.com>, linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: thead: th1520-ap: Correctly refer the parent for
 c910 and osc_12m
Message-ID: <aGsmUSHjgkWo9SmB@pie>
References: <20250705052028.24611-1-ziyao@disroot.org>
 <aGm+adSNdTHyN7K1@x1>
 <aGnaZjMoWbW_FZfj@pie>
 <aGn8IVkWQJjHMfCT@x1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aGn8IVkWQJjHMfCT@x1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_184404_872519_181F590E 
X-CRM114-Status: GOOD (  37.33  )
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

On Sat, Jul 05, 2025 at 09:31:29PM -0700, Drew Fustini wrote:
> On Sun, Jul 06, 2025 at 02:07:51AM +0000, Yao Zi wrote:
> > On Sat, Jul 05, 2025 at 05:08:09PM -0700, Drew Fustini wrote:
> > > On Sat, Jul 05, 2025 at 05:20:28AM +0000, Yao Zi wrote:
> > > > clk_orphan_dump shows two suspicious orphan clocks on TH1520 when
> > > > booting the kernel with mainline U-Boot,
> > > > 
> > > > 	$ cat /sys/kernel/debug/clk/clk_orphan_dump | jq 'keys'
> > > > 	[
> > > > 	  "c910",
> > > > 	  "osc_12m"
> > > > 	]
> > > > 
> > > > where the correct parents should be c910-i0 for c910, and osc_24m for
> > > > osc_12m.
> > > 
> > > Thanks for sending this patch. However, I only see "osc_12m" listed in
> > > clk_orphan_dump. I tried the current next, torvalds master and v6.15 but
> > > I didn't ever see "c910" appear [1]. What branch are you using?
> > 
> > I think it has something to do with the bootloader: as you could see in
> > your clk_orphan_dump, the c910 clock is reparented to cpu-pll1, the
> > second possible parent which could be correctly resolved by the CCF,
> > thus c910 doesn't appear in the clk_orphan_dump.
> > 
> > But with the mainline U-Boot which doesn't reparent or reclock c910 on
> > startup, c910 should remain the reset state and take c910-i0 as parent,
> > and appear in the clk_orphan_dump.
> 
> Ah, thanks for the explanation. I'm on an old build:
> 
> U-Boot SPL 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)
> FM[1] lpddr4x dualrank freq=3733 64bit dbi_off=n sdram init
> U-Boot 2020.01-g55b713fa (Jan 12 2024 - 02:17:34 +0000)
> 
> I would like to run mainline but I have the 8GB RAM LPi4a. Does mainline
> only work for the 16GB version right now?

I only tested the DRAM driver on the 16GiB version, but have seen some
working reports on the 8GiB one. Btw, the mainline U-Boot is still in an
early stage (only MMC/eMMC is working and netboot is still WIP).

> > Another way to confirm the bug is to examine
> > /sys/kernel/debug/clk/c910/clk_possible_parents: without the patch, it
> > should be something like
> > 
> > 	osc_24m cpu-pll1
> > 
> > c910's parents are defined as
> > 
> > 	static const struct clk_parent_data c910_parents[] = {
> > 		{ .hw = &c910_i0_clk.common.hw },
> > 		{ .hw = &cpu_pll1_clk.common.hw }
> > 	};
> > 
> > and the debugfs output looks obviously wrong.
> 
> Thanks, yeah, without the patch I also see:
> 
> ==> c910-i0/clk_possible_parents <==
> cpu-pll0 osc_24m
> 
> > 
> > There's another bug in CCF[1] which causes unresolvable parents are
> > shown as the clock-output-names of the clock controller's first parent
> > in debugfs, explaining the output.
> 
> Thanks for that fix. I now see '(missing)' for c910 too when I apply
> that patch:
> 
> root@lpi4amain:/sys/kernel/debug/clk# head c910/clk_possible_parents
> (missing) cpu-pll1
> 
> > 
> > > I think it would be best for this patch to be split into separate
> > > patches for osc_12m and c910.
> > 
> > Okay, I originally thought these are relatively small fixes targeting
> > a single driver, hence put them together. I'll split it into two patches
> > in v2.
> 
> I think the osc_12m is good as-is but I'm not sure what Stephen will
> think about using the string "c910-i0" in c910_parents[]. I think
> splitting it up will make discussion go faster.

Okay, I'm willing to do so.

> Thanks,
> Drew

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
