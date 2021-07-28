Return-Path: <SRS0=BMZi=MU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD587C4338F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 12:54:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 700C960F9E
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jul 2021 12:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 700C960F9E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LfmbuTja9NYuqbzpZXAVA+rF4NzA1P9rYXjMOLVnQjA=; b=B0fQVQyPFVZw+2
	kO6ROwH0DaJDYgjTorgqevaiUQKBg4YNAzrBOIECJqsOlfZwY9DWMTG+l4MaItsW4FLPrdU7iQCvT
	kRg4NtonWJ+m524GaePA6L5hJzAkksX5mKAF8qn/s6h9At6aEIQV2dle4TcWYbqIG5BRc6MOzCYyf
	gKjhVyWlQFaYFBBMq1PhE0GOdIBRNC68sMYUGMYJLzHj8Uqj6zkSDNWbtAVOaA5elKVTIBjQWj/q/
	NFU5qxjcmyctRmX6WVHdW5KWXrPFSTRrF9BHwKXeyhOvbCqw9JrwBPcaeqO8RpfPCaB0ZK0GQR0Ez
	/rl0GbddWiC56IAPAcnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8j3f-000jLd-Md; Wed, 28 Jul 2021 12:53:11 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8j3c-000jLK-OR
 for linux-riscv@lists.infradead.org; Wed, 28 Jul 2021 12:53:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9C2E60FC4;
 Wed, 28 Jul 2021 12:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627476788;
 bh=uVs06J6Sp0nm7rKdLCNuLO/owrULe5dkBXVfD8Ww5vE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G/faYnN3UaBN3B4xIHIKWqE5hItl6PNO4fcX6B9/fhP2vRecEWniGPj/DGuP74hnz
 NNJBFupVHrEVdCyQ19KJM0OlpQBGpgiROFQ5/6H9uvN+tFmu08+87Icn6uoQNiqjPa
 vC4rrZheFMLK8yy5LDm3HZT5APN5gQrutrVbMLDT4RI0aKxjgiwxx19zGYUtUy4UTj
 oimAgvdikHrUJSR0QIUaouf2fbu3c8vPX3OKZKeQVLWIojcQ5c/qITQReGJgTi94mP
 DEMqs6HRqk3llsf2nKmASpsGOm7Ltgl+Yz/2jVJ00iGzkkwcorRHDi/Vg71IEY/AH+
 g4KcFpr+9BA9A==
Date: Wed, 28 Jul 2021 15:52:58 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Alex Ghiti <alex@ghiti.fr>
Cc: Kenneth Lee <nek.in.cn@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atish.patra@wdc.com>, Kenneth Lee <liguozhu@hisilicon.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>, Guo Ren <guoren@linux.alibaba.com>,
 Jisheng Zhang <jszhang@kernel.org>, Nick Kossifidis <mick@ics.forth.gr>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guohanjun@huawei.com, wangzhou1@hisilicon.com
Subject: Re: [PATCH] riscv: fix the global name pfn_base confliction error
Message-ID: <YQFTKtNmqorzsv6a@kernel.org>
References: <20210728064318.375747-1-nek.in.cn@gmail.com>
 <0e81c8d2-468a-9afd-bce3-0e8211baa065@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e81c8d2-468a-9afd-bce3-0e8211baa065@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_055308_867081_E2C9E395 
X-CRM114-Status: GOOD (  23.22  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jul 28, 2021 at 09:19:16AM +0200, Alex Ghiti wrote:
> Hi Kenneth,
> =

> Le 28/07/2021 =E0 08:43, Kenneth Lee a =E9crit=A0:
> > From: Kenneth Lee <liguozhu@hisilicon.com>
> > =

> > RISCV use a global variable pfn_base for page/pfn translation. But this
> > is a common name and will be used elsewhere. In those case,
> > the page-pfn macro which refer this name will refer to the local/input
> > variable of those function (such as in vfio_pin_pages_remote). This make
> > everything wrong.
> > =

> > This patch change the name from pfn_base to riscv_global_pfn_base to fix
> > this problem
> =

> What about removing this variable entirely and using
> PFN_DOWN(kernel_map.phys_addr) directly in ARCH_PFN_OFFSET definition? Th=
at
> would remove code from mm/init.c, which is nice :)

That would be nice, but such change would also change the generated code.
Probably nothing important, but someone would have to at least check what
size and bloat-o-meter say.
 =

> Thanks,
> =

> Alex
> =

> > =

> > Signed-off-by: Kenneth Lee <liguozhu@hisilicon.com>
> > ---
> >   arch/riscv/include/asm/page.h | 4 ++--
> >   arch/riscv/mm/init.c          | 6 +++---
> >   2 files changed, 5 insertions(+), 5 deletions(-)
> > =

> > diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/pag=
e.h
> > index cca8764aed83..8711e415f37c 100644
> > --- a/arch/riscv/include/asm/page.h
> > +++ b/arch/riscv/include/asm/page.h
> > @@ -79,8 +79,8 @@ typedef struct page *pgtable_t;
> >   #endif
> >   #ifdef CONFIG_MMU
> > -extern unsigned long pfn_base;
> > -#define ARCH_PFN_OFFSET		(pfn_base)
> > +extern unsigned long riscv_global_pfn_base;
> > +#define ARCH_PFN_OFFSET		(riscv_global_pfn_base)
> >   #else
> >   #define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
> >   #endif /* CONFIG_MMU */
> > diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> > index a14bf3910eec..2ce4e9a46ca0 100644
> > --- a/arch/riscv/mm/init.c
> > +++ b/arch/riscv/mm/init.c
> > @@ -228,8 +228,8 @@ static struct pt_alloc_ops _pt_ops __initdata;
> >   #define pt_ops _pt_ops
> >   #endif
> > -unsigned long pfn_base __ro_after_init;
> > -EXPORT_SYMBOL(pfn_base);
> > +unsigned long riscv_global_pfn_base __ro_after_init;
> > +EXPORT_SYMBOL(riscv_global_pfn_base);
> >   pgd_t swapper_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> >   pgd_t trampoline_pg_dir[PTRS_PER_PGD] __page_aligned_bss;
> > @@ -572,7 +572,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
> >   	kernel_map.va_kernel_pa_offset =3D kernel_map.virt_addr - kernel_map=
.phys_addr;
> >   #endif
> > -	pfn_base =3D PFN_DOWN(kernel_map.phys_addr);
> > +	riscv_global_pfn_base =3D PFN_DOWN(kernel_map.phys_addr);
> >   	/*
> >   	 * Enforce boot alignment requirements of RV32 and
> > =


-- =

Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
