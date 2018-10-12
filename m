Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F18C6783C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 16:50:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 89768205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 16:50:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Idl3MDQu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="NjXES6Pd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 89768205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qeTrVm0bX9mnC/HyZUL6KzHXk2doAyedZeWvlilyALg=; b=Idl3MDQu74fmsg
	zvoK42kqri/aunxVxZid33oauPz/hje5eZ5gBV/bpX9cogR0STxOoYJmhfq1VjyY+zHXvjSrEEdOB
	haFB16zyA5WYRADVyr2Ih/b9GzkVH5S0IIY3tp9TT7fabEdzImMFgpegzAVV34OSTynTG9iCaDPt/
	LOuq9UmUNlLXIr984DkJCwSxxBMWu+zo3UV0usRe5mjTNUC/nD0NXFi3Q4Ok4W8w0TMRO/zlX0K3E
	KAdeqwYhfcv/lefev92osnXsjuuw3su5+nwNC6VN/LZh967wKdHOhv3w1AcTz03MyNzSaAR9lEZQr
	aCWZktV8HIGQ+jgcwftg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB0e4-0004oM-Af; Fri, 12 Oct 2018 16:50:36 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB0du-0004fI-Rq
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 16:50:33 +0000
Received: by mail-pg1-x541.google.com with SMTP id a5-v6so6091315pgv.13
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 09:50:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=3DML0DfB0nlc1tyXD8MYIv9tqy7JJDHuUUZSi5Dy3yc=;
 b=NjXES6Pdb9e/l8KucJPuNidi4InOrLFXUBcvWc4+j0RbQKkbD8LAt8rSFmcj60j72A
 lk+5mekUv3vuHlwU2QpyXlfXTOTjty0LreTUFHc0xiFeCNWZMY4jP5XFJZ+Xx0Xio/Hf
 09K9DQhSrrYcb+L7j1mCGPPUS96kJiHDrKUBM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=3DML0DfB0nlc1tyXD8MYIv9tqy7JJDHuUUZSi5Dy3yc=;
 b=JlpglK1HKG4AVGfnOm3HyBHSo+YofuWM3TrsKSHPKalh/WP4ZZbMWC/b8Q4vqla3EL
 kwXoLisHFrMgghF8O7fl+W2QtkBe9u1JIh0sGa/dJlOUILjkqZavqpinhm4QZoqJC9NA
 4YkPmdr2gzoegRLXkPh1e816La3mmJ6BDHPIfPeQMSlnJfCkvruE3TKpT0BzzlX0zR4E
 hjZOZtrwRigOXq1Bj6eV7oDzFZD3dTUdyP4rHtjz8FRbFiQqyzeNPiSHyg241brl/bXU
 ViWgWOqURY9VpEc4bCO6STkJwoMs7FB9EBQqUOaVqiDz+Jp3YybEMq6wZ/3KxyoAf3G8
 pa4Q==
X-Gm-Message-State: ABuFfoiSNeUwDJDKQ/4sd/K3f1x4mvrqHFsRv8eiL5+SjnHy/n2wG8WS
 g/p55RO8Y8VA0EVoT1eVsU2Zcg==
X-Google-Smtp-Source: ACcGV62W/f8rTwoBekJAo9vNmsdLbflTQ3Cm4bKAHH1uL186sKig6+wGtZkqdu2aVDYNLeyo7iNvSw==
X-Received: by 2002:a62:c4c5:: with SMTP id
 h66-v6mr6856183pfk.39.1539363014751; 
 Fri, 12 Oct 2018 09:50:14 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id n64-v6sm3128120pfi.185.2018.10.12.09.50.13
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 09:50:13 -0700 (PDT)
Date: Fri, 12 Oct 2018 09:50:12 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181012165012.GD223066@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <9ed82f9e-88c4-8e4f-8c45-3ef153469603@kot-begemot.co.uk>
 <20181012143728.t42uvr6etg7gp7fh@kshutemo-mobl1>
 <4dd52e22-5b51-9b30-7178-fde603a08f88@kot-begemot.co.uk>
 <97cb3fe1-7bc1-12ff-d602-56c72a5496c5@kot-begemot.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <97cb3fe1-7bc1-12ff-d602-56c72a5496c5@kot-begemot.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_095026_938883_8F18FD5D 
X-CRM114-Status: GOOD (  41.69  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-mips@linux-mips.org, Rich Felker <dalias@libc.org>,
 linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 linux-s390@vger.kernel.org, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, kvmarm@lists.cs.columbia.edu,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 linux-xtensa@linux-xtensa.org, Jeff Dike <jdike@addtoit.com>,
 linux-alpha@vger.kernel.org, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Ley Foon Tan <lftan@altera.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, linux-arm-kernel@lists.infradead.org,
 Chris Zankel <chris@zankel.net>, Tony Luck <tony.luck@intel.com>,
 linux-parisc@vger.kernel.org, pantin@google.com, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 nios2-dev@lists.rocketboards.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012165012.dJcnIe6DGa6JYJbiVqcpWFwU1SDiXir0ADxAdv30oo8@z>

On Fri, Oct 12, 2018 at 05:42:24PM +0100, Anton Ivanov wrote:
> =

> On 10/12/18 3:48 PM, Anton Ivanov wrote:
> > On 12/10/2018 15:37, Kirill A. Shutemov wrote:
> > > On Fri, Oct 12, 2018 at 03:09:49PM +0100, Anton Ivanov wrote:
> > > > On 10/12/18 2:37 AM, Joel Fernandes (Google) wrote:
> > > > > Android needs to mremap large regions of memory during
> > > > > memory management
> > > > > related operations. The mremap system call can be really
> > > > > slow if THP is
> > > > > not enabled. The bottleneck is move_page_tables, which is copying=
 each
> > > > > pte at a time, and can be really slow across a large map.
> > > > > Turning on THP
> > > > > may not be a viable option, and is not for us. This patch
> > > > > speeds up the
> > > > > performance for non-THP system by copying at the PMD level
> > > > > when possible.
> > > > > =

> > > > > The speed up is three orders of magnitude. On a 1GB mremap, the m=
remap
> > > > > completion times drops from 160-250 millesconds to 380-400
> > > > > microseconds.
> > > > > =

> > > > > Before:
> > > > > Total mremap time for 1GB data: 242321014 nanoseconds.
> > > > > Total mremap time for 1GB data: 196842467 nanoseconds.
> > > > > Total mremap time for 1GB data: 167051162 nanoseconds.
> > > > > =

> > > > > After:
> > > > > Total mremap time for 1GB data: 385781 nanoseconds.
> > > > > Total mremap time for 1GB data: 388959 nanoseconds.
> > > > > Total mremap time for 1GB data: 402813 nanoseconds.
> > > > > =

> > > > > Incase THP is enabled, the optimization is skipped. I also flush =
the
> > > > > tlb every time we do this optimization since I couldn't find a wa=
y to
> > > > > determine if the low-level PTEs are dirty. It is seen that the co=
st of
> > > > > doing so is not much compared the improvement, on both
> > > > > x86-64 and arm64.
> > > > > =

> > > > > Cc: minchan@kernel.org
> > > > > Cc: pantin@google.com
> > > > > Cc: hughd@google.com
> > > > > Cc: lokeshgidra@google.com
> > > > > Cc: dancol@google.com
> > > > > Cc: mhocko@kernel.org
> > > > > Cc: kirill@shutemov.name
> > > > > Cc: akpm@linux-foundation.org
> > > > > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > > > > ---
> > > > > =A0=A0 mm/mremap.c | 62
> > > > > +++++++++++++++++++++++++++++++++++++++++++++++++++++
> > > > > =A0=A0 1 file changed, 62 insertions(+)
> > > > > =

> > > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > > index 9e68a02a52b1..d82c485822ef 100644
> > > > > --- a/mm/mremap.c
> > > > > +++ b/mm/mremap.c
> > > > > @@ -191,6 +191,54 @@ static void move_ptes(struct
> > > > > vm_area_struct *vma, pmd_t *old_pmd,
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 drop_rmap_locks(vma);
> > > > > =A0=A0 }
> > > > > +static bool move_normal_pmd(struct vm_area_struct *vma,
> > > > > unsigned long old_addr,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 unsigned long new_addr, unsigned lon=
g old_end,
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0 pmd_t *old_pmd, pmd_t *new_pmd, bool=
 *need_flush)
> > > > > +{
> > > > > +=A0=A0=A0 spinlock_t *old_ptl, *new_ptl;
> > > > > +=A0=A0=A0 struct mm_struct *mm =3D vma->vm_mm;
> > > > > +
> > > > > +=A0=A0=A0 if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 || old_end - old_addr < PMD_SIZE)
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > +
> > > > > +=A0=A0=A0 /*
> > > > > +=A0=A0=A0=A0 * The destination pmd shouldn't be established, fre=
e_pgtables()
> > > > > +=A0=A0=A0=A0 * should have release it.
> > > > > +=A0=A0=A0=A0 */
> > > > > +=A0=A0=A0 if (WARN_ON(!pmd_none(*new_pmd)))
> > > > > +=A0=A0=A0=A0=A0=A0=A0 return false;
> > > > > +
> > > > > +=A0=A0=A0 /*
> > > > > +=A0=A0=A0=A0 * We don't have to worry about the ordering of src =
and dst
> > > > > +=A0=A0=A0=A0 * ptlocks because exclusive mmap_sem prevents deadl=
ock.
> > > > > +=A0=A0=A0=A0 */
> > > > > +=A0=A0=A0 old_ptl =3D pmd_lock(vma->vm_mm, old_pmd);
> > > > > +=A0=A0=A0 if (old_ptl) {
> > > > > +=A0=A0=A0=A0=A0=A0=A0 pmd_t pmd;
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 new_ptl =3D pmd_lockptr(mm, new_pmd);
> > > > > +=A0=A0=A0=A0=A0=A0=A0 if (new_ptl !=3D old_ptl)
> > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 spin_lock_nested(new_ptl, SING=
LE_DEPTH_NESTING);
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 /* Clear the pmd */
> > > > > +=A0=A0=A0=A0=A0=A0=A0 pmd =3D *old_pmd;
> > > > > +=A0=A0=A0=A0=A0=A0=A0 pmd_clear(old_pmd);
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 VM_BUG_ON(!pmd_none(*new_pmd));
> > > > > +
> > > > > +=A0=A0=A0=A0=A0=A0=A0 /* Set the new pmd */
> > > > > +=A0=A0=A0=A0=A0=A0=A0 set_pmd_at(mm, new_addr, new_pmd, pmd);
> > > > UML does not have set_pmd_at at all
> > > Every architecture does. :)
> > =

> > I tried to build it patching vs 4.19-rc before I made this statement and
> > ran into that.
> > =

> > Presently it does not.
> > =

> > https://elixir.bootlin.com/linux/v4.19-rc7/ident/set_pmd_at - UML is not
> > on the list.
> =

> Once this problem as well as the omissions in the include changes for UML=
 in
> patch one have been fixed it appears to be working.
> =

> What it needs is attached.
> =

> =

> > =

> > > =

> > > But it may come not from the arch code.
> > =

> > There is no generic definition as far as I can see. All 12 defines in
> > 4.19 are in arch specific code. Unless i am missing something...
> > =

> > > =

> > > > If I read the code right, MIPS completely ignores the address
> > > > argument so
> > > > set_pmd_at there may not have the effect which this patch is trying=
 to
> > > > achieve.
> > > Ignoring address is fine. Most architectures do that..
> > > The ideas is to move page table to the new pmd slot. It's nothing to =
do
> > > with the address passed to set_pmd_at().
> > =

> > If that is it's only function, then I am going to appropriate the code
> > out of the MIPS tree for further uml testing. It does exactly that -
> > just move the pmd the new slot.
> > =

> > > =

> > A.
> =

> =

> A.
> =


> From ac265d96897a346b05646fce91784ed4922c7f8d Mon Sep 17 00:00:00 2001
> From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> Date: Fri, 12 Oct 2018 17:24:10 +0100
> Subject: [PATCH] Incremental fixes to the mmremap patch
> =

> Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> ---
>  arch/um/include/asm/pgalloc.h | 4 ++--
>  arch/um/include/asm/pgtable.h | 3 +++
>  arch/um/kernel/tlb.c          | 6 ++++++
>  3 files changed, 11 insertions(+), 2 deletions(-)
> =

> diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
> index bf90b2aa2002..99eb5682792a 100644
> --- a/arch/um/include/asm/pgalloc.h
> +++ b/arch/um/include/asm/pgalloc.h
> @@ -25,8 +25,8 @@
>  extern pgd_t *pgd_alloc(struct mm_struct *);
>  extern void pgd_free(struct mm_struct *mm, pgd_t *pgd);
>  =

> -extern pte_t *pte_alloc_one_kernel(struct mm_struct *, unsigned long);
> -extern pgtable_t pte_alloc_one(struct mm_struct *, unsigned long);
> +extern pte_t *pte_alloc_one_kernel(struct mm_struct *);
> +extern pgtable_t pte_alloc_one(struct mm_struct *);

If its Ok, let me handle this bit since otherwise it complicates things for
me.

>  static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
>  {
> diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
> index 7485398d0737..1692da55e63a 100644
> --- a/arch/um/include/asm/pgtable.h
> +++ b/arch/um/include/asm/pgtable.h
> @@ -359,4 +359,7 @@ do {						\
>  	__flush_tlb_one((vaddr));		\
>  } while (0)
>  =

> +extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> +		pmd_t *pmdp, pmd_t pmd);
> +
>  #endif
> diff --git a/arch/um/kernel/tlb.c b/arch/um/kernel/tlb.c
> index 763d35bdda01..d17b74184ba0 100644
> --- a/arch/um/kernel/tlb.c
> +++ b/arch/um/kernel/tlb.c
> @@ -647,3 +647,9 @@ void force_flush_all(void)
>  		vma =3D vma->vm_next;
>  	}
>  }
> +void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> +		pmd_t *pmdp, pmd_t pmd)
> +{
> +	*pmdp =3D pmd;
> +}
> +

I believe this should be included in a separate patch since it is not relat=
ed
specifically to pte_alloc argument removal. If you want, I could split it
into a separate patch for my series with you as author.

thanks,

- Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
