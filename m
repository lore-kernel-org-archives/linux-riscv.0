Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64CCBC19F2D
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Aug 2022 02:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HqNXla2tqStn6A01k3PUwgWR0/dpbl1Zen+Vdm+KII=; b=kE9MVjtKotOjEj
	nvKL4x8097WIERydlYDYUOm82as+CoTprKc1jMHLK44o2hI8flQ34q/CSCOCt5l7ome9gfvdMHqDk
	XQjY2mbS6cuCGRr6gHFEfMvofJc2jcsTzve8qd7nf4C/LGgZR5qSpdT5nI81G2oUCETJpZsgN9kIg
	ud28avI1KAVbzWF4PdtO/UYIbh8j1w1s+r0U5HN4yOsHEC0I92usBftT6b+0jhuQM1DHcsJowhAqM
	TUAyI0Y/fscO7FF+YMrq0kKEC0q+7qrhd2alSQkM/hbc4HW6YXRIgatJNzWxBA7omqzOWpzXDOFGW
	FtbWUAFFBMXIHxzdCw8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oN2xw-002AuL-74; Sun, 14 Aug 2022 02:03:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oN2xn-002Aoo-BF
	for linux-riscv@lists.infradead.org; Sun, 14 Aug 2022 02:02:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4216BB80AD0;
	Sun, 14 Aug 2022 02:02:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F09F6C433C1;
	Sun, 14 Aug 2022 02:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660442563;
	bh=3Xhd2qMStNNb5Ln/IC1tYj590OqHgijGKjY6kdJpxOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aqQK9izivFDXFa8dAOJReQCRDC8kftOBwATyPbyhWhRN4iAGOv97r3qJH/YSu8pe9
	 p28oPt1v/RiHYTaperJFBJhXEsZ5+qnyH7fTFHLLrFuxX7z4MgnDCJEW2lEwXzVCQV
	 MoHMqdVFQHL1NJQ/pAElanXxHw0Shj8fZjfEO6Su9Ju4XqMK9AkXLCh1xq2rjhDMue
	 F7wB2+0SjIKz+mt9asv8llqOHHCtRFrp76YM95sWFTiPpBQzRZZsbJJK61UM15x/MC
	 l++e/LwCtMMyBS4by5Me3U6BL2GdUWFiyw7O5mJmRkq71LVI/WBtCqev0tGNwGZiUx
	 6HhjwG9u2vayw==
Date: Sun, 14 Aug 2022 09:53:22 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com
Subject: Re: [PATCH v6 0/2] use static key to optimize pgtable_l4_enabled
Message-ID: <YvhVktaSeK0vLmhB@xhacker>
References: <20220716115059.3509-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220716115059.3509-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220813_190256_091048_A9ECDB12 
X-CRM114-Status: GOOD (  20.60  )
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

On Sat, Jul 16, 2022 at 07:50:57PM +0800, Jisheng Zhang wrote:
> The pgtable_l4|[l5]_enabled check sits at hot code path, performance
> is impacted a lot. Since pgtable_l4|[l5]_enabled isn't changed after
> boot, so static key can be used to solve the performance issue[1].
> 
> An unified way static key was introduced in [2], but it only targets
> riscv isa extension. We dunno whether SV48 and SV57 will be considered
> as isa extension, so the unified solution isn't used for
> pgtable_l4[l5]_enabled now.
> 
> patch1 fixes a NULL pointer deference if static key is used a bit earlier.
> patch2 uses the static key to optimize pgtable_l4|[l5]_enabled.
> 
> [1] http://lists.infradead.org/pipermail/linux-riscv/2021-December/011164.html
> [2] https://lore.kernel.org/linux-riscv/20220517184453.3558-1-jszhang@kernel.org/T/#t

Hi Palmer,

I see part1 and part2 were sent out...
What I can do to make this series merged for 6.0-rc1? I'm afraid this series
may miss anothe round of merge window again.

Thanks in advance

> 
> Since v5:
>  - Use DECLARE_STATIC_KEY_FALSE
> 
> Since v4:
>  - rebased on v5.19-rcN
>  - collect Reviewed-by tags
>  - Fix kernel panic issue if SPARSEMEM is enabled by moving the
>    riscv_finalise_pgtable_lx() after sparse_init()
> 
> Since v3:
>  - fix W=1 call to undeclared function 'static_branch_likely' error
> 
> Since v2:
>  - move the W=1 warning fix to a separate patch
>  - move the unified way to use static key to a new patch series.
> 
> Since v1:
>  - Add a W=1 warning fix
>  - Fix W=1 error
>  - Based on v5.18-rcN, since SV57 support is added, so convert
>    pgtable_l5_enabled as well.
> 
> Jisheng Zhang (2):
>   riscv: move sbi_init() earlier before jump_label_init()
>   riscv: turn pgtable_l4|[l5]_enabled to static key for RV64
> 
>  arch/riscv/include/asm/pgalloc.h    | 16 ++++----
>  arch/riscv/include/asm/pgtable-32.h |  3 ++
>  arch/riscv/include/asm/pgtable-64.h | 60 ++++++++++++++++++---------
>  arch/riscv/include/asm/pgtable.h    |  5 +--
>  arch/riscv/kernel/cpu.c             |  4 +-
>  arch/riscv/kernel/setup.c           |  2 +-
>  arch/riscv/mm/init.c                | 64 ++++++++++++++++++-----------
>  arch/riscv/mm/kasan_init.c          | 16 ++++----
>  8 files changed, 104 insertions(+), 66 deletions(-)
> 
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
