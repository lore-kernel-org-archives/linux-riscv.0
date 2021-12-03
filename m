Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 022FEC433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Dec 2021 15:02:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:MIME-Version:References:
	In-Reply-To:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rD4bqTQn2vfFEvk5qlm/VsNl/swKwNvP2KxMXn2MFeM=; b=Whx14OaGFSl0XV
	qmoRo0BnLJWr19TsynB9duYcw5wnoapvKoCg7GDwHoxSZ0qDU0OMS37Hz9POsM7G2f4Ppgl/TDoBY
	U1+47fDxZVN0rs4WJch5wh4FLrCKLdi41tRaaaHJZDipshhLFnf4e27+3x1FzjTACI8BXK/DhcbC/
	b9JeVWuDjenu/rqGdjlTgCozaQxNCQnC51wzBEDNrrEZMHkbA2nJXRye+DpiPKgNDdMkkCipmjvoH
	jdCQvCj5SZrmz2+4ENcNCsvQHdEHN+pQUghBzsjzEt1Xxq0JZCyPEsbkKz9hSI87qGpljzih3LMvI
	Xs+Y4B4Qf0eEYy2yXP+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtA4L-00GHLm-Py; Fri, 03 Dec 2021 15:01:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mt9Vx-00G94t-IY
 for linux-riscv@lists.infradead.org; Fri, 03 Dec 2021 14:26:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 160CC62B6C;
 Fri,  3 Dec 2021 14:26:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82960C53FAD;
 Fri,  3 Dec 2021 14:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638541576;
 bh=opBMB9qQImOjDNakCrK7fCffd36SQEgbiRGDXcaTTEk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Q++9iK8wtWGYY/4+mLRyXrl2ZC+yeYhu+mkNx4WYb8fAsfRKKUVLBNtWb+JRJyGgq
 rRV9zPyQ+3UA1TRi+ptWn03B3fCx2xNNt154QJY2bxwYEjqHggm7cVfZszPlmJlrqb
 CrID9dh+vakNPSAJbCQ35iG6vS+rM0oyGIEl/wnQ3fNEiIcw2fp4lmvv1BJ9keLlrt
 BMD5nLtrc6B12f0FRNYulr6u+0E2ObyIm4KdlpYuhlJg+AnbmBFJKHB2Y8QtpOoEST
 4LsIQalce4muh6O3ZgI+lUuj1ckeYa3qjqbkwOlVuVEPCkS3VphVGxVCXWmPpLMuKq
 +MyUqSfdp7mFQ==
Date: Fri, 3 Dec 2021 22:18:57 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Alexandre ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] riscv: mm: init: remove _pt_ops and use pt_ops
 directly
In-Reply-To: <bdb6b231-2b1d-61c9-35a6-d5545bd667c6@ghiti.fr>
References: <20211203050317.2102-1-jszhang@kernel.org>
 <20211203050317.2102-4-jszhang@kernel.org>
 <bdb6b231-2b1d-61c9-35a6-d5545bd667c6@ghiti.fr>
MIME-Version: 1.0
Message-Id: <20211203142614.82960C53FAD@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_062617_709851_B6094560 
X-CRM114-Status: GOOD (  21.78  )
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

On Fri, 3 Dec 2021 09:57:35 +0100
Alexandre ghiti <alex@ghiti.fr> wrote:

> On 12/3/21 06:03, Jisheng Zhang wrote:
> > Except "pt_ops", other global vars when CONFIG_XIP_KERNEL=y is defined
> > as below:
> >
> > |foo_type foo;
> > |#ifdef CONFIG_XIP_KERNEL
> > |#define foo	(*(foo_type *)XIP_FIXUP(&foo))
> > |#endif
> >
> > Follow the same way for pt_ops to unify the style and to simplify code.  
> 
> 
> _dtb_early_pa and _dtb_early_va have the same 'issue' too. I thought 
> there was a reason for those variables to be declared this way but I 
> can't find it :)

Hi Alexandre

I may know the reason: the dtb_early_pa|va are used not only in init.c
but also in other source files, so they are not static vars. Then if they
are defined as the unified style, compiler will emit errors.

Thanks

> 
> 
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >   arch/riscv/mm/init.c | 6 ++----
> >   1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index bd445ac778a8..4d4fcd7ef1a9 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -227,12 +227,10 @@ static void __init setup_bootmem(void)
> >   }
> >   
> >   #ifdef CONFIG_MMU
> > -static struct pt_alloc_ops _pt_ops __initdata;
> > +static struct pt_alloc_ops pt_ops __initdata;
> >   
> >   #ifdef CONFIG_XIP_KERNEL
> > -#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&_pt_ops))
> > -#else
> > -#define pt_ops _pt_ops
> > +#define pt_ops (*(struct pt_alloc_ops *)XIP_FIXUP(&pt_ops))
> >   #endif
> >   
> >   unsigned long riscv_pfn_base __ro_after_init;  
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
