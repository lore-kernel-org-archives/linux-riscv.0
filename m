Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF09BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 19:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkVe7kIsSYLpIwgdbx0Ui0mEtBB4HH3Zxs6q9INvt8A=; b=SCQ7brDJWi2S2L
	yCMaim7qDfErLhkM4yyNr4iSsBJ6R3P76+5Fg5RCcwVylHZoU/4wwi9KhXHOWEQz5jSXGLClJrQXt
	Nf51TC/9uOTBxAd5zB6FBlymGj+LKIvh9JLwOGLYOymbLI/q2FpO2czj1in0Xj0qdeDBYf+AGbfp2
	HqPGE5nddvyMXJY8oGX6DLh79c32/jpFkt8vuNL0lNHO2+SAn0H2JykfzScKvHjHix2waiyZBCi8j
	wcgDosAtZgB5uzHU5DZbip+ZXeF6fbgoQ2gmS5QGMwGeOO9Vfxhnj3nLoK7Sn7wK+ngPh7dNbLNpr
	UZRafJfzNN+Lz8IoSwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWgR-004nTK-Hn; Thu, 06 Oct 2022 19:37:27 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWgO-004nSc-HG
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 19:37:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id CEDC3B82147;
	Thu,  6 Oct 2022 19:37:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 309B0C433C1;
	Thu,  6 Oct 2022 19:37:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665085041;
	bh=RvQ4n6Z/fEG1KCN9GdAtVJ18BhwghWKZK8tk9yiyOQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lg9wr1JGc1vdI4iBopcBBvGU6SWcnfI34gCk734S5e5/EiUetYJqww345KtKczNHI
	 dpOtvgC8sMO/p6w4YnSVB7GPkE2V7BxYFpve1eN0cocET9//yaXV2xR+yo7HroP3iq
	 dBeDicH1HS1jF1WrIv6dl84Jk3HHuywxTovajSHoZH4W3MCcjzikgdoJTYNwNPG3EO
	 Oaaow8x6ilH1DEXIhTA0Lj2NPWqa8HWFNvBErXt7VoOR4rdjFUTisqSBrxZLuVkWYM
	 4u0Xkn3D+3SOLLQcqoBguSeMyZfQjoJOcGx6zONzwT6leHAH8wb5zBhfBbMEx+V2Aa
	 j/BRKK4vusoEg==
Date: Thu, 6 Oct 2022 20:37:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: panqinglin2020@iscas.ac.cn, palmer@dabbelt.com,
	linux-riscv@lists.infradead.org, jeff@riscv.org, xuyinan@ict.ac.cn
Subject: Re: [PATCH v6 0/4] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <Yz8ubUZ+4YhF+SIi@spud>
References: <20221005112926.3043280-1-panqinglin2020@iscas.ac.cn>
 <20221005132930.cxvkwoazmztknz3z@kamzik>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221005132930.cxvkwoazmztknz3z@kamzik>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_123724_899320_5F4F1538 
X-CRM114-Status: GOOD (  26.89  )
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

On Wed, Oct 05, 2022 at 03:29:30PM +0200, Andrew Jones wrote:
> Hi Qinglin,
> 
> Please give more time between postings. v5 is barely 48 hours old and I
> haven't even looked at half its patches yet.

Aye, please wait until at least after the merge window to send another
version with Drew's comments addressed. Hard to tell if this v6 has
resolved his comments on v5 or not. I assume it hasn't given the
changelog in the cover only has a single comment?

> 
> Thanks,
> drew
> 
> 
> On Wed, Oct 05, 2022 at 07:29:22PM +0800, panqinglin2020@iscas.ac.cn wrote:
> > From: Qinglin Pan <panqinglin2020@iscas.ac.cn>
> > 
> > Svnapot is a RISC-V extension for marking contiguous 4K pages as a non-4K
> > page. This patch set is for using Svnapot in Linux Kernel's boot process
> > and hugetlb fs.
> > 
> > This patchset adds a Kconfig item for using Svnapot in
> > "Platform type"->"SVNAPOT extension support". Its default value is off,
> > and people can set it on if they allow kernel to detect Svnapot hardware
> > support and leverage it.
> > 
> > Tested on:
> >   - qemu rv64 with "Svnapot support" off and svnapot=true.
> >   - qemu rv64 with "Svnapot support" on and svnapot=true.
> >   - qemu rv64 with "Svnapot support" off and svnapot=false.
> >   - qemu rv64 with "Svnapot support" on and svnapot=false.
> > 
> > 
> > Changes in v2:
> >   - detect Svnapot hardware support at boot time.
> > Changes in v3:
> >   - do linear mapping again if has_svnapot
> > Changes in v4:
> >   - fix some errors/warns reported by checkpatch.pl, thanks @Conor
> > Changes in v5:
> >   - modify code according to @Conor and @Heiko
> > Changes in v6:
> >   - use static key insead of alternative errata
> > 
> > 
> > Qinglin Pan (4):
> >   riscv: mm: modify pte format for Svnapot
> >   riscv: mm: support Svnapot in physical page linear-mapping
> >   riscv: mm: support Svnapot in hugetlb page
> >   riscv: mm: support Svnapot in huge vmap
> > 
> >  arch/riscv/Kconfig                  |  17 +-
> >  arch/riscv/include/asm/hugetlb.h    |  37 +++-
> >  arch/riscv/include/asm/hwcap.h      |   4 +
> >  arch/riscv/include/asm/page.h       |   2 +-
> >  arch/riscv/include/asm/pgtable-64.h |  13 ++
> >  arch/riscv/include/asm/pgtable.h    |  69 +++++++-
> >  arch/riscv/include/asm/vmalloc.h    |  28 ++++
> >  arch/riscv/kernel/cpu.c             |   1 +
> >  arch/riscv/kernel/cpufeature.c      |   1 +
> >  arch/riscv/mm/hugetlbpage.c         | 250 +++++++++++++++++++++++++++-
> >  arch/riscv/mm/init.c                |  30 +++-
> >  11 files changed, 440 insertions(+), 12 deletions(-)
> > 
> > -- 
> > 2.35.1
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
