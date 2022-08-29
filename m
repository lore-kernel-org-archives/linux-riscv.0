Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47436ECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 14:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ctoiIZhhCKai/dmNbJkEc20SjqPGE9d7vEWJHNZD2JA=; b=y0Yx4+vqM2hlFo
	5F59GBTJiEOUIkDX8SrnL67at1AIpd9uNnzI0expANtwvMJ9ocSuba0HJk43I8S62KGAAa9i/7JkG
	HqEDSuJCECqp4TJRl3Vg13zN99A8hZbMk18knWrEbWUfSCq97Wm4L4kZtwVu8YrF9sJ0QN8f7DMQR
	BwkPqUKWEVhtnfwsSamUscJguP9/oVl4kpDB3GwsUPlrgAACsV93HrP8WJuxNpaUatCtUaxzuxY5/
	7COmrUSLDKk2TGJoVBL9kcFYF9xcFVpZyEuQgNeNYtKff3+F4wnVzQXaPZGU8I0Y0gZikQSat6LkV
	J4GXImhG+fLC7R89Zm8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfcc-00B34j-IV; Mon, 29 Aug 2022 14:20:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfcZ-00B33N-TM
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 14:20:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8BEE60E9D;
	Mon, 29 Aug 2022 14:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 300DEC433C1;
	Mon, 29 Aug 2022 14:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661782809;
	bh=5t9TYUD+7W9POaNmmtNmb01GYlGZ8fVGivHM4X+6f2M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NB0+0Mwkdgsa95TVX/0Jeji1znYOMzQXT1a70l9QbWiHgxF3iwBjcGJrprerId8tQ
	 n/1bto5FbCQflPk49KQ54vGgbaBr7HxI7334gQxZmoyQ72qgJjrIsETi6+mzbLdAQq
	 XDjmULvnzU433k8CSsBRjjNQAfkXzhPEV6shVbUeehBKPoqdSaF0xzr1X6fN6pzV1f
	 pJCnB+RCRRLcH3JPXLCD3DUig7LJxnnhFwZ1Q179TDxVn4rvuTFoF/W6ZWkQ+vsXA4
	 7v2OlutPDVQ8mJoUketumtAbUM15OQCw35WOTub+w5zZeP/3lOJD/CAaFS239UkCZ6
	 VNfrlhqHj95kg==
Date: Mon, 29 Aug 2022 22:10:53 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor.Dooley@microchip.com
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	ajones@ventanamicro.com
Subject: Re: [PATCH v2] riscv: enable THP_SWAP for RV64
Message-ID: <YwzI7VmfFnOvYWgf@xhacker>
References: <20220827095815.698-1-jszhang@kernel.org>
 <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0256a458-440c-171c-2a6f-e88a50c16f82@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_072012_026473_A1B230F9 
X-CRM114-Status: GOOD (  23.85  )
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

On Sat, Aug 27, 2022 at 09:13:03PM +0000, Conor.Dooley@microchip.com wrote:
> Hey Jisheng,

Hi Conor,

> On 27/08/2022 10:58, Jisheng Zhang wrote:
> > I have a Sipeed Lichee RV dock board which only has 512MB DDR, so
> > memory optimizations such as swap on zram are helpful. As is seen
> > in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64") and
> > commit bd4c82c22c367e ("mm, THP, swap: delay splitting THP after
> > swapped out"), THP_SWAP can improve the swap throughput significantly.
> > 
> > Enable THP_SWAP for RV64, testing the micro-benchmark which is
> > introduced by commit d0637c505f8a ("arm64: enable THP_SWAP for arm64")
> > shows below numbers on the Lichee RV dock board:
> > 
> > thp swp throughput w/o patch: 66908 bytes/ms (mean of 10 tests)
> > thp swp throughput w/ patch: 322638 bytes/ms (mean of 10 tests)
> 
> I know the original commit message contains this, but it's a little
> odd. If the patch /enables/ THP then how would there be THP swap
> prior to the patch?

hmm, it's swap I'll send a v3 to correct the description.

> 
> > 
> > Improved by 382%!
> 
> I could not replicate the after numbers on my nezha, so I suspect
> I am missing something in my config/setup. zswap is enabled and is

swap on zram rather than zswap ;)

> working, TRANSPARENT_HUGEPAGE is enabled etc. Not that it matters
> for acceptance of the patch though.
> 
> I gave it a try and nothing went up in flames while using zswap so:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> > ---
> > Since v1:
> >  - collect reviewed-by tag
> >  - make ARCH_WANTS_THP_SWAP rely on HAVE_ARCH_TRANSPARENT_HUGEPAGE
> >    instead
> > 
> >  arch/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index ed66c31e4655..79e52441e18b 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -45,6 +45,7 @@ config RISCV
> >  	select ARCH_WANT_FRAME_POINTERS
> >  	select ARCH_WANT_GENERAL_HUGETLB
> >  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> > +	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
> >  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> >  	select BUILDTIME_TABLE_SORT if MMU
> >  	select CLONE_BACKWARDS

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
