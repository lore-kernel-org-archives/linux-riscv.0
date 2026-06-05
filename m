Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73822CD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzmljdmCgD6QasyDcjqfgfoPSBHhi9In1CzphMniZeY=; b=M3yYm7P4OYXtk+
	i+KCjHDXa95zzl9UuG50nLnk36fuklyC7EgC7rrAJTm30bR3k3/7f4HuBJMJZvwN2FBurw0ziwYU5
	zXDRcKYcTJnZyUF+MPEUUELuSNj6eoIlNHTwpZ2aHK4LCTZwjdvTxv2vBPjD/p03xhYQ7nyoPqY54
	SAKdu4UmCvh+Erg7QgO77hmDJBOA2WhP3cMESMGLsXXl8EQ/S4LH8kvnQK4swOrs2wTV4hDo0eHkn
	pmZhhXMgm+q4ytF7WaXU0fl7VK5sVbCIvakMySL57OmRkvPZsaolyz1KgbGvKdp/CG+GOUNcwooJN
	y5RDZAMFmzkDFwHZBJOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXrf-00000000wdi-1rhb;
	Fri, 05 Jun 2026 16:57:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVXrd-00000000wcm-1kY5
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 16:57:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D429043932;
	Fri,  5 Jun 2026 16:57:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E5771F00899;
	Fri,  5 Jun 2026 16:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780678664;
	bh=Jj3ovDkYZ3anEGZ4CNsrCFFMc5/xQDRxORSrSJZrc4s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LYBC522JBjhloHApoP115oaTCnl4EUfQASF2XDgEgQwETOTDZ6NYvIY4+kM9rw1Fm
	 AranaQ8CUcxE3tgozG7BKV2bzUVyxbb2TisZT/H0z4M31W72kWOqUl24NXl4K4Vuj4
	 doNXSNEhnWJ5zFseuuTivCGoOx2caBeYzyf0jh+qEtVjQDSgRMqz+BLK8stwZCun7f
	 L+ha1Hwc66WbLNrPs6b7eziTZhEcH5Zy03KRzbcur3IUkjMZ3rhFWeBja+9e+pzO7k
	 8EGY7ubohHHmLOdOtGiauNQdPbgaceBWWUzhAOZnLxh4hgtGMRDz+aASWQNG5+/ITy
	 huRt2fStDenaA==
Date: Fri, 5 Jun 2026 09:57:43 -0700
From: Drew Fustini <fustini@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Michael Ellerman <mpe@kernel.org>, linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>
Subject: Re: [PATCH] riscv: defconfig: thead: enable PCA953X GPIO driver
Message-ID: <aiMAB0RjnjEzDQKu@x1>
References: <CGME20260603082156eucas1p1f44a198f7957d9d82ec0b8bc296fb03c@eucas1p1.samsung.com>
 <20260603082132.3200787-1-m.szyprowski@samsung.com>
 <7ffb4a7c-ea74-431a-8be9-1a1d7418b467@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7ffb4a7c-ea74-431a-8be9-1a1d7418b467@kernel.org>
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

On Fri, Jun 05, 2026 at 02:50:54PM +1000, Michael Ellerman wrote:
> On 3/6/26 6:21 pm, Marek Szyprowski wrote:
> > Enable PCA953X GPIO driver to properly probe Wifi pwrseq driver on
> > LicheePi4a board.
> > 
> > Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> > ---
> >   arch/riscv/configs/defconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> > index 08445df56006..a51a423d53f4 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -174,6 +174,8 @@ CONFIG_PINCTRL_SOPHGO_SG2002=y
> >   CONFIG_GPIO_DWAPB=y
> >   CONFIG_GPIO_SIFIVE=y
> >   CONFIG_GPIO_SPACEMIT_K1=y
> > +CONFIG_GPIO_PCA953X=y
> > +CONFIG_GPIO_PCA953X_IRQ=y
> Does it need to be built-in, or would a module work?
> 
> It's not a huge driver (~20KB), but it all adds up.

Good point.

Marek - could you respin as module?

thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
