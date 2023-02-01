Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30DC4C636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 01:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VkdGL95pR68I8nh06XvqUxeQOk6rMnE+F3oEKGQCULU=; b=1J8haSFEZw4InN
	bBP1ucWh4X8mtK0eT6B76bth4GtscsBXUCOgs11VngPgrW98dI7j/tDjGIJKQYN2QdU2VAHNlYxwX
	Th3Iyq5ttIN0oVABqk3FQmBNF5M0qSmq/ygkq0BbmJ8aX3AjmyUnZn7nbXJjvaYzjWPdgk3gN8X8y
	nziTUGne+xdc8xJOCiVkSnn/Y7ckd1ouzxzID7tI+AbJU164kCaTLeOc3/gM/4XPuXwnb+5bHCNLv
	d/MRQ+ByRdzhYKj6qmRYqXEb1od/eeRPP98CXYGyeg3WZHXW+ZR3htKn3VNtOQYjK2aTNs/lH32+p
	Hu+UUQoWPfRVvwmgIfvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2Kg-009sG7-LE; Wed, 01 Feb 2023 01:54:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2Kd-009sFN-Ct
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 01:54:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED8EA609D0
	for <linux-riscv@lists.infradead.org>; Wed,  1 Feb 2023 01:54:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E914C433AA
	for <linux-riscv@lists.infradead.org>; Wed,  1 Feb 2023 01:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675216478;
	bh=3xAa4l0LmSTXVxseZu61VbAE5L//xGayriqchoMaBp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f4sNWLLqzzYiBxE1PB9yMqytXxTusMgGzbikSO64AJ7MkpWuXK4BfYIYKdI4rrKU/
	 4GxwVMw6/d6Qdqr5/0gE9TOEuHv+DJ2cB5+NpVtJW1FQpve2f2RGs+0M+S8CZmkZFF
	 D7ZO1vFBQWCMVo/t4WkysFPeeY5N3u8MmN2djiK/5skGVzdM9JMbGT0D7ImYlYOR9J
	 54B33I/DrXrvbc839rYpZM3MFJndbqnyzBXIjHbXBVa3qvwKQ4oD56rayfi9KSDNLD
	 /SuaEyCivj7BMOzTULoEn23VyHLNjQY1MC5RrmTaZ7iy/B1AYX+RBahAYCHbxPuM70
	 aQNPnNJhFtvjg==
Received: by mail-ej1-f50.google.com with SMTP id qw12so31206280ejc.2
        for <linux-riscv@lists.infradead.org>; Tue, 31 Jan 2023 17:54:38 -0800 (PST)
X-Gm-Message-State: AO0yUKXeLmvLUeRCM8f9MMMAI8Q4t+Yx8wQoaSK9C4IPq2687gHJWnGe
	ykbVZq7Vd2qOwa7f/vkvVoT5mX0pi+QX3A7NqVA=
X-Google-Smtp-Source: AK7set8A4ow3YOcTfMflIVmtGMoyRcXzw+Y0St3ZWmBiU2H53qDQAZBUeNS1mIG/kzVMuDUbm/z5n+8COVuQFDLnljE=
X-Received: by 2002:a17:906:2a51:b0:88c:b87d:b771 with SMTP id
 k17-20020a1709062a5100b0088cb87db771mr135432eje.195.1675216476379; Tue, 31
 Jan 2023 17:54:36 -0800 (PST)
MIME-Version: 1.0
References: <20230127050421.1920048-1-guoren@kernel.org> <Y9lcsajzIpS5ZkDT@spud>
In-Reply-To: <Y9lcsajzIpS5ZkDT@spud>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 1 Feb 2023 09:54:24 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSFKY1AU5ivzN1TMX489-Hr04iNzWGfvdfWODweSGrAOw@mail.gmail.com>
Message-ID: <CAJF2gTSFKY1AU5ivzN1TMX489-Hr04iNzWGfvdfWODweSGrAOw@mail.gmail.com>
Subject: Re: [PATCH -next V2] riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
To: Conor Dooley <conor@kernel.org>
Cc: tongtiangen@huawei.com, alexandre.ghiti@canonical.com, 
	muchun.song@linux.dev, palmer@rivosinc.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>, 
	Muchun Song <songmuchun@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_175439_531983_9D7ED824 
X-CRM114-Status: GOOD (  27.03  )
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

On Wed, Feb 1, 2023 at 2:23 AM Conor Dooley <conor@kernel.org> wrote:
>
> On Fri, Jan 27, 2023 at 12:04:21AM -0500, guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add HVO support for RISC-V; see commit 6be24bed9da3 ("mm: hugetlb:
> > introduce a new config HUGETLB_PAGE_FREE_VMEMMAP"). This patch is
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
>
> CI is telling me that this is added out of order. I suppose that means
> that T is before _ in the "alphabet", and this should be moved up one
> line.
> Perhaps it can be fixed on application!
okay

>
> >       select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
> >       select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> >       select BUILDTIME_TABLE_SORT if MMU
> > --
> > 2.36.1
> >



-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
