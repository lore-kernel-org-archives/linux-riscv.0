Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C505CCD187
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Oct 2025 07:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JGT6S2ut9+8EBobba4FjmxVKCXIoIGRrHmfulAHBWak=; b=iKDSqzi8TiVVqC
	Ay3xeITljK0hay3PelPC+pdpUC+NkW4wwKYZ3zUWtdu203a2q/OWfduJ1g8PVQyQlmUDBLAyq5uK4
	9ZbWhZU0QCgTJEXauBGfq4qxH+dL9pIq9WIk8dfwoE8FH115fwnPRcDKHciP42RqEF4gsdPTtI2GI
	byM8HRW5mBaqyeJ/ydsB01ZmA7t850vmXzdDh6C1v0lknmPgk3Lue+W5mRPqH842ZKj6u5v4WtGfY
	Zx4tEsUzRuMHc4cHDA08h9evXQym+MrsttoTDIQjAXzmkmHU+Nx07F3wOoGgNAepor90hFAzEmVjX
	YMiYYs6dSyZa2GFvJuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7q3n-0000000B8Er-2eC7;
	Sun, 12 Oct 2025 07:00:03 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7q3l-0000000B8EQ-2OwB
	for linux-riscv@lists.infradead.org;
	Sun, 12 Oct 2025 07:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D1798602CE;
	Sun, 12 Oct 2025 06:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7023C4CEE7;
	Sun, 12 Oct 2025 06:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760252397;
	bh=77zuiySPdjhs3+W9heR5TXbrRLy69D4PruJGMHlXl6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtYjYXk98WWKuUcgi97iurAjpPu5twj1qiDE7i3aAPmL3t+Rv/G0KfNQD3lwlsOEq
	 CRc3ZMkMxCwhxwxQQEDF3ih6xIA9mrFE01r1qp04Zt2Y+LpHXKs7eet2Zmw3pl2OT0
	 HN0hxDqMycoeMtLd0c0Kc3c0T3seMGV1xYnlE3gbHU+tLPhwEeoIVwj0Io0Myv1OgW
	 HZo4WkOIAxSa+jCb32bRyiBpeiC+LnHve/h3vj3DdUJeQrC601pw51qltBANpfwQmi
	 OgVVryhbwgYcmQHECIIsFbs5Ne1lpuoeSXX8woDX///tQRlphSkR+9j3SOBOQEI5fu
	 IySUmjf8uvx7w==
Date: Sun, 12 Oct 2025 02:59:43 -0400
From: Guo Ren <guoren@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH] RISC-V: Define pgprot_dmacoherent() for non-coherent
 devices
Message-ID: <aOtR39pl5xjyYHn1@gmail.com>
References: <20250820152316.1012757-1-apatel@ventanamicro.com>
 <aOtFpju/42kVkBsx@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aOtFpju/42kVkBsx@gmail.com>
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

On Sun, Oct 12, 2025 at 02:07:34AM -0400, Guo Ren wrote:
> On Wed, Aug 20, 2025 at 08:53:16PM +0530, Anup Patel wrote:
> > The pgprot_dmacoherent() is used when allocating memory for
> > non-coherent devices and by default pgprot_dmacoherent() is
> > same as pgprot_noncached() unless architecture overrides it.
> > 
> > Currently, there is no pgprot_dmacoherent() definition for
> > RISC-V hence non-coherent device memory is being mapped as
> > IO thereby making CPU access to such memory slow.
> > 
> > Define pgprot_dmacoherent() to be same as pgprot_writecombine()
> > for RISC-V so that CPU access non-coherent device memory as
> > NOCACHE which is better than accessing it as IO.
> > 
> > Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/pgtable.h | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> > index 91697fbf1f90..00d8bdaf1e8d 100644
> > --- a/arch/riscv/include/asm/pgtable.h
> > +++ b/arch/riscv/include/asm/pgtable.h
> > @@ -653,6 +653,8 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
> >  	return __pgprot(prot);
> >  }
> >  
> > +#define pgprot_dmacoherent pgprot_writecombine
> I missed this patch and sent out a duplicate one [1]. Maybe the comments
> from [1] could be appended to this one.
[1]: https://lore.kernel.org/linux-riscv/20251011155746.1558731-1-guoren@kernel.org/

> 
> Tested-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
> 
> > +
> >  /*
> >   * Both Svade and Svadu control the hardware behavior when the PTE A/D bits need to be set. By
> >   * default the M-mode firmware enables the hardware updating scheme when only Svadu is present in
> > -- 
> > 2.43.0
> > 
> > 
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv
> > 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
