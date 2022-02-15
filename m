Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DE8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 16:03:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3Zp9kaLb1psnKIx9MhZG1gbiF2bJbnX/62dxI80wcw=; b=fDLSQtKY9C3vzL
	CC7XNuBrD5F0t6t7tCGloJir3xzprEdKSqj3CbwaUco+h80cMyOhSrkxoDQ+Ec78H1bipFDPCywkX
	4oOz51H1nnyCrrrvJvMP0bpQR7PSYd3z34+fOTsO3lEzj01tgMmFT7dj0O3vg6MJjCn2dkBdJ0S1z
	HJEwb02rGSVIimvLx5HYW3YKI04QnzwpYRm2ub0aifbL7nkPj3PTnr6xcJH4F4zB5DlywXDOy51w8
	UBrLEDskELqnYb0JXnVv8tWdZ/KNMnEJ/mnA30ol81P+Lf/20OQW3NG5X8D3w7cTIpTOT4BBvUK4O
	j5myAiF1tecq/C6pPBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK0Im-003XdE-7w; Tue, 15 Feb 2022 16:03:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzyl-003Nrn-Vm
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 15:43:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 43C2B61738;
 Tue, 15 Feb 2022 15:42:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF950C340EB;
 Tue, 15 Feb 2022 15:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939778;
 bh=vzyFMhGsfn/rk38bV9aGlalnsputB6BGCOL+8B6o7Ag=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cNI7u7wCnN07cGh93W7Jd2myp7Re0Mh/JT2m2U4uaG4f9AeseBcC/QduH/JcqR04y
 cP5NTTOKadVvlnJHKQICUaTDLLqurPFWI9LN+Lm27I6SM+jRQB/YfyBmEVNGETBSip
 B8P2lD1yNsvJ1H0/skAMArzHE2BsIntxz39fGWxnxLUA3h79TO5ny3U4vfgQCotx1m
 KsZPsbtJ7LGVFW56/a4/r/i/yUGNHH1Hdwl7X/pM0qLmwA5Ia6WbkVOBO6R+6FGLGY
 EtagshxnP+Kt9dJlwccOjjLqEAdZu6+gaqTzJ3vor5es0Ap3N5RFxdg3ITxcSL5qkZ
 ZugoJMetxYw/w==
Date: Tue, 15 Feb 2022 23:34:59 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>, Atish Patra <atishp@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, alexandre.ghiti@canonical.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com
Subject: Re: [PATCH 0/3] unified way to use static key and optimize
 pgtable_l4_enabled
Message-ID: <YgvIIw1CV4gxn2lS@xhacker>
References: <20220125165036.987-1-jszhang@kernel.org>
 <mhng-41f2520d-7583-41b3-ae7a-95e74117676a@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-41f2520d-7583-41b3-ae7a-95e74117676a@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_074300_172395_885F57EB 
X-CRM114-Status: GOOD (  26.80  )
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

On Mon, Feb 14, 2022 at 03:52:44PM -0800, Palmer Dabbelt wrote:
> On Tue, 25 Jan 2022 08:50:33 PST (-0800), jszhang@kernel.org wrote:
> > Currently, riscv has several features why may not be supported on all
> > riscv platforms, for example, FPU, SV48 and so on. To support unified
> > kernel Image style, we need to check whether the feature is suportted
> > or not. If the check sits at hot code path, then performance will be
> > impacted a lot. static key can be used to solve the issue. In the
> > past FPU support has been converted to use static key mechanism. I
> > believe we will have similar cases in the future. For example, the
> > SV48 support can take advantage of static key[1].
> > 
> > patch1 introduces an unified mechanism to use static key for riscv cpu
> > features.
> > patch2 converts has_cpu() to use the mechanism.
> > patch3 uses the mechanism to optimize pgtable_l4_enabled.
> > 
> > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> > 
> > Jisheng Zhang (3):
> >   riscv: introduce unified static key mechanism for CPU features
> >   riscv: replace has_fpu() with system_supports_fpu()
> >   riscv: convert pgtable_l4_enabled to static key
> 
> I see some build failures from LKP, but I don't see a v2.  LMK if I missed
> it.

Hi Palmer,

I also saw the build failure due to RV32, fixing it is easy but I have
some thoughts/questions here after reading Atish's "fraemework for RISC-V
ISA extensions" series. 

Hi All,

I'm considering how to support cpu features or new ISA extensions.
IMHO, we will need some static keys for ISA extenstions as well as
the cpu features. for example:

if (static_branch_likely(&has_isa_ext_foo))
	do_something;

So I have a big question here about CPU features VS. ISA extensions:

1. Is CPU feature == ISA extension?
If yes, then it seems we'd better rebase this series on the ISA
extension series. If no, which is the super set? If CPU feature
is the super set, then if one kind of future cpu feature is implemented
via. the ISA extension, do we need to combine the cpu feature bitmap
with the ISA extension bitmap? how?

2. Is SV48 considered as riscv ISA extension?

I will also comment in Atish's series.

Thanks

> 
> > 
> >  arch/riscv/Makefile                 |   3 +
> >  arch/riscv/include/asm/cpufeature.h | 105 ++++++++++++++++++++++++++++
> >  arch/riscv/include/asm/pgalloc.h    |   8 +--
> >  arch/riscv/include/asm/pgtable-64.h |  21 +++---
> >  arch/riscv/include/asm/pgtable.h    |   3 +-
> >  arch/riscv/include/asm/switch_to.h  |   9 +--
> >  arch/riscv/kernel/cpu.c             |   2 +-
> >  arch/riscv/kernel/cpufeature.c      |  29 ++++++--
> >  arch/riscv/kernel/process.c         |   2 +-
> >  arch/riscv/kernel/signal.c          |   4 +-
> >  arch/riscv/mm/init.c                |  23 +++---
> >  arch/riscv/mm/kasan_init.c          |   6 +-
> >  arch/riscv/tools/Makefile           |  22 ++++++
> >  arch/riscv/tools/cpucaps            |   6 ++
> >  arch/riscv/tools/gen-cpucaps.awk    |  40 +++++++++++
> >  15 files changed, 234 insertions(+), 49 deletions(-)
> >  create mode 100644 arch/riscv/include/asm/cpufeature.h
> >  create mode 100644 arch/riscv/tools/Makefile
> >  create mode 100644 arch/riscv/tools/cpucaps
> >  create mode 100755 arch/riscv/tools/gen-cpucaps.awk

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
