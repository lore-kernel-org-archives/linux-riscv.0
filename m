Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4094C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 01:54:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RltubyK2Bz4nOu2gRp3qbyOfprItZesSQbDzugljcTQ=; b=Waim6lFjmQoIAj
	1tMSZrYmGKC9xaHHKvO43xIHJYzjoGxmi2+DMEJGycwA5QLc+tCRXGeuZOdCznKSYEvRDIDoip6Q0
	rT74RmicF2rqFD13A53KnowaTzLGjca/P7LQiaUg7TUtRvSBL43bMJiFrvhMJhEs46o5Fo58ltSFH
	6hnD7PbdPFVvJMDfUVlTqEtUXyC9Re3g/FcUZgDSi3o69CzaFJJpUiDIEUFBgI0ncZTiP8AFezeNi
	RkMtgNwtKrJi/tnWqQMLwIcuFnjXyDWDw4aTT9ZN77ZERfQy/vS7qEIpdgJtcTd+6JzVVzuayWDBY
	nsgGv8ollH3d3t8Frs7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2KN-009sD2-LJ; Wed, 01 Feb 2023 01:54:23 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2KK-009sBt-Kl
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 01:54:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 877C4B81FB1
	for <linux-riscv@lists.infradead.org>; Wed,  1 Feb 2023 01:54:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFDF4C433A1
	for <linux-riscv@lists.infradead.org>; Wed,  1 Feb 2023 01:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675216449;
	bh=JlEbqXOJy9cLAn/e3yXkfKsfn9G5mHeLtTDvuLqbw64=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=t6uo6+11mU5CIsNSR4kobkwIQdLvaGpGC7/eWqtKFN0X/4J0izYcy5Xyn+0X6mG0R
	 2fE8g7cITgUBF9ZWOKWZJ4dfAhvtRCbSc7f9aI4HQ+LfKXboLnAUcQBu/Pd+o7h382
	 Vpu+B+rPdZdgtM+0YcFuoUtgHQ8qoO7wh4A2lNCFPznRmw4rfEtjzLt7GNKkMMN6zD
	 CV6nppWa4rc2KJNNPyGZrA4tjONWLGMufWYlYXVU8XjzNKHH0912tISnUuCbUFa2SW
	 D8Gn3SsXZdpnQ03914tTuqqaE1SHf1VVNaa1dVgECs7BDfCXOAXyvEiN0JMWeqTB3p
	 MuE7qcsFf/9mg==
Received: by mail-ej1-f50.google.com with SMTP id ml19so23565364ejb.0
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 17:54:09 -0800 (PST)
X-Gm-Message-State: AO0yUKVIqk83rapPY76+4oeYX8BU2zFGLHLqAuq2HN8TQGjLCVodRpYq
	eA+6sONKQNzDSnjE6n0hs7JDvlEYntX19OnEU70=
X-Google-Smtp-Source: AK7set/R8MSbh/i8Z3UdUWDc3gbQZvMlilpqSSgOTvBYzAb9sWVGqcGQrcbLUMBu0h897PRabSFEGpZj2x0Kf3KsYEU=
X-Received: by 2002:a17:906:4c84:b0:887:2320:57e1 with SMTP id
 q4-20020a1709064c8400b00887232057e1mr139586eju.73.1675216447930; Tue, 31 Jan
 2023 17:54:07 -0800 (PST)
MIME-Version: 1.0
References: <20230127050421.1920048-1-guoren@kernel.org> <20230127115714.467ymd5cpvi5h2ey@orel>
In-Reply-To: <20230127115714.467ymd5cpvi5h2ey@orel>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 1 Feb 2023 09:53:55 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSDDuEZGqsO8-TnXewMpkOuu1r3tXBtbz0dDJzmRstd3w@mail.gmail.com>
Message-ID: <CAJF2gTSDDuEZGqsO8-TnXewMpkOuu1r3tXBtbz0dDJzmRstd3w@mail.gmail.com>
Subject: Re: [PATCH -next V2] riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Andrew Jones <ajones@ventanamicro.com>
Cc: tongtiangen@huawei.com, alexandre.ghiti@canonical.com, 
	muchun.song@linux.dev, palmer@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, 
	Muchun Song <songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_175421_006259_000149E3 
X-CRM114-Status: GOOD (  26.65  )
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

On Fri, Jan 27, 2023 at 7:57 PM Andrew Jones <ajones@ventanamicro.com> wrote:
>
> On Fri, Jan 27, 2023 at 12:04:21AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add HVO support for RISC-V; see commit 6be24bed9da3 ("mm: hugetlb:
> > introduce a new config HUGETLB_PAGE_FREE_VMEMMAP").
>
> I found Documentation/mm/vmemmap_dedup.rst even more enlightening
> about HVO than the commit message of 6be24bed9da3.
I've put that in v3 commit log.
>
> > This patch is
> > similar to commit 1e63ac088f20 ("arm64: mm: hugetlb: enable
> > HUGETLB_PAGE_FREE_VMEMMAP for arm64"), and riscv's motivation is the
> > same as arm64. The current riscv was ready to enable HVO after fixup,
> > ref commit d33deda095d3 ("riscv/mm: hugepage's PG_dcache_clean flag
> > is only set in head page").
> >
> > The HugeTLB VmemmapvOptimization (HVO) defaults to off in Kconfig.
> >
> > Here is the riscv test log:
> > cat /proc/sys/vm/hugetlb_optimize_vmemmap
> > echo 8 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
> > mount -t hugetlbfs none test/ -o pagesize=2048k
> > <Try some simple hugetlb test in test dir, no problem found.>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Link: https://lore.kernel.org/linux-riscv/1F5AF29D-708A-483B-A29F-CAEE6F554866@linux.dev/
> > Acked-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> > Changelog:
> > V2:
> >  - Optimize the commit log
> >  - Remove riscv page compound_head fixup which has been merged.
> >  - Rebase on riscv for-next (20230127)
> >  - Add HVO author's acked-by
> >
> > V1:
> > https://lore.kernel.org/linux-riscv/20221023133205.3493564-1-guoren@kernel.org/
> > ---
> >  arch/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e2b656043abf..949974a38a41 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -46,6 +46,7 @@ config RISCV
> >       select ARCH_WANT_FRAME_POINTERS
> >       select ARCH_WANT_GENERAL_HUGETLB
> >       select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> > +     select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> >       select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
> >       select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> >       select BUILDTIME_TABLE_SORT if MMU
> > --
> > 2.36.1
> >
>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
>
> Thanks,
> drew



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
