Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66426C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 06:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+5rv1mJUF9+UE7wTZYSQmYYbzFFZRqHLhEJWmG4GEEw=; b=0mZ4hxQ7SQJB0k
	PUZk+sVjFCwzTaGGx3aO/nGrIqEpk/INUGySpo7zLO9C3G0OtTS9kKZUrsawrmn2lYamo7LAMKyae
	7Sjy3w0HiuKjgKBPjz4aS0oxgchfjdK6F+lu0uCrVDy+7SiYLsykFVyXsDGWqR/wVEV6hroS49RPw
	/qefTd4L2w+5BEiUITw8AxXQmS7M+jLsE0VM2NVZlAsOPrvxYDWoggbTBuCQQWXyfPptW6Z+ueDy3
	9RJ9MYdst3uYaC4cfW9zx3AWn+psWjm7D1yrCavgA9ydQzHR8yej97ZRK0AbC3uJAQZFjePHcmiFf
	KfQDpRkvWpSiB+i4d4cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKlF-000HHi-72; Thu, 06 Oct 2022 06:53:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogKlB-000HDL-SO
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 06:53:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1665039213; x=1696575213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TWTzXIepdJAhGXlLlYIHyFJRwqOy33J1R/GJHz29r8M=;
  b=rMyQfUbBa59fbMLIe5qI2KSrpUR6ofPgPXnK418/wpfuI0ztsKLzW2AB
   usNukUdg+kdxqXQFMbOcLXXIJmOq2QFGggcm7/yLxKO1gjMdKyip6BZ+X
   F6q4PsVzHq39cgqope/FBXHf/Zt8ZWEwcD3RZWtX/EgoGBN3EvgWIqYZk
   SrG14yjRVdNKWCnJWLDhOFOGJ60U2HJLtuMkgiEdgzfW+MM6xNfu4fZFp
   fdkkfx6y1CkTMycNjjI0U/AZlxKK7DWxCd/M4ra/9+mPuevwfECWzBANE
   /EwEK0+gbrX8AfJJOkZOnVGNvL0BRMOMYJ34jhFfhNIt4gTYs5RF791lb
   A==;
X-IronPort-AV: E=Sophos;i="5.95,163,1661842800"; 
   d="scan'208";a="180642588"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 05 Oct 2022 23:53:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Wed, 5 Oct 2022 23:53:26 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.12 via Frontend
 Transport; Wed, 5 Oct 2022 23:53:25 -0700
Date: Thu, 6 Oct 2022 07:53:03 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	<aou@eecs.berkeley.edu>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: enable THP_SWAP for RV64
Message-ID: <Yz57T4eob3pXAVSP@wendy>
References: <20220821170559.840-1-jszhang@kernel.org>
 <mhng-a75e502f-0324-44ae-92c5-e93864fbf1cc@palmer-ri-x1c9>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <mhng-a75e502f-0324-44ae-92c5-e93864fbf1cc@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_235334_045271_42DE2AF8 
X-CRM114-Status: GOOD (  17.01  )
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

On Wed, Oct 05, 2022 at 07:35:53PM -0700, Palmer Dabbelt wrote:
> On Sun, 21 Aug 2022 10:05:59 PDT (-0700), jszhang@kernel.org wrote:
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
> > 
> > Improved by 382%!
> > 
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  arch/riscv/Kconfig | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index ed66c31e4655..19088c750c7f 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -45,6 +45,7 @@ config RISCV
> >  	select ARCH_WANT_FRAME_POINTERS
> >  	select ARCH_WANT_GENERAL_HUGETLB
> >  	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
> > +	select ARCH_WANTS_THP_SWAP if TRANSPARENT_HUGEPAGE
> >  	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
> >  	select BUILDTIME_TABLE_SORT if MMU
> >  	select CLONE_BACKWARDS
> 
> Thanks, this is on for-next.

FYI, this is v1 of a patchset that went to v3.
v3 only changed the commit message, but v2 had a functional change.

v3 is here:
https://lore.kernel.org/all/20220829145742.3139-1-jszhang@kernel.org/

Thanks,
Conor.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
