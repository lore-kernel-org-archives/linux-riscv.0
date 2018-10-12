Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C891C6787C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 17:16:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30CF22077C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 17:16:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aVneyHq4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LpQPOrEz";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="WwQOLfCb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 30CF22077C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S+dnDWXyO6kC5gBAtOp7/nV6VUsbCTcgSYg069JN8eA=; b=aVneyHq42nmj/1
	w8SHSJ9db45P0gFUk2RgM7ypaQnUgdLklUle8uaeoT4ebBEyH7OnPMz6xQ7Ue7PsVOVwRxMGZCxzX
	0VErJPDLnQq3xMXwvLwAiA6aN9+zDuYM7qs+qUJ6Gj4vq6MCUi8puZhnJtZQ7bHUQnZJyjmU18lYM
	fDFbw7RXnAOdY/wRYt9YEt94zRP6h1RwR0TIZb8vpLF/zPS9+ggrQvFuY2pz2W1idy2sKp3XYbYyW
	QhJp4Fjdx8GFQhzqCtRdl1jsfRY9cuwT7pihE2Gz+/rCxMyI+nq4yWvyVBPm/xOstYlMmLLghPrKY
	c8lGNHFJ3/lIwykKJomA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gB13M-0008D6-DG; Fri, 12 Oct 2018 17:16:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB0ud-00047c-Jb
 for linux-riscv@bombadil.infradead.org; Fri, 12 Oct 2018 17:07:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TWO+dFnIA15gJmvQ4eNCqGVZ4Qr8lNDSuRvOzoXBn+E=; b=LpQPOrEzfcetGvwZwbUXsW5jL
 9gKw3v4aeBOrLu+Ks/Dywu6PauC7ZBy9jqDKLl8hTKE7OdFCcbV1tzcpoC5KZfk7E6kP+ONIuLVjT
 67b9yKkNfTGDTlQWq26Vt1LELW4X0KZOZBOR3VgUXbWizRilMTxwEXmyf/l0jJ87mspaB4Yd32P2V
 Jy5mvReV0X030BINy+7ikVtGS7CHORdSiPc1gDmVIS3YXNj/ENToB2CJCJ23VwMZWhAcIJRxJjxxp
 rAyjJlSI84QDLp2K/EFVsofW/qp2T3KROi5yBd5oVVUAEf7NsRKDuuSuq1tjHx0z/Yv0T75VjUTKH
 AFOPx4uNA==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gB0u8-0006Ie-Uv
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 17:07:16 +0000
Received: by mail-pf1-x441.google.com with SMTP id m77-v6so6501982pfi.8
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 10:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=TWO+dFnIA15gJmvQ4eNCqGVZ4Qr8lNDSuRvOzoXBn+E=;
 b=WwQOLfCbO08E3NezFCRCjwi3+jigw7IuZV/3VMwyQTIrRXeYa1SnFe/q8Q8jl8npqM
 m7+28ANzAzlEob4deL70RikU2qKMFmo22Iqv7KRsQzLW0+PPtrLc3yy2PVaZXzxrb9Iu
 QWG8MqGMV8u6uclnrr8mBMRhkTg2589/g79Lk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=TWO+dFnIA15gJmvQ4eNCqGVZ4Qr8lNDSuRvOzoXBn+E=;
 b=CW73PMIb86cHRfX8IAMCsL5LZWQHO9EUJNONuWUxuR/gWV5TeyRU3xeklrjrtpMv0L
 XqTrjPSn8EM+U+9oCF09pQjsu8tXxRk6qIBsalP3w0KcuwZc+a1TptJhL+Bs55t6Mn88
 2ezM773l7wyxzYEE3bj44jDJEpfEgM0Eq4boBtGlzb4zwi5H0R1rgnrnGCas4/zZaxA3
 MsMXr6pogfgHD5KahrNrWAOMbDFx9oS3MCg7qr4tJ8i0QxWnrPphvHEGDrJwgJq+tdO1
 WGMtJajmcSmE/kwKTGuWTunbjvWQolDpqjO4NNjgbVWoQvvf4jXex2rYgQjCkPkCYMRB
 Fa+Q==
X-Gm-Message-State: ABuFfojMKE6DHb9qJdWmrYsDtH6mHk4rJPawnLF4tQ3tfT0rRY1bq2KM
 aYxqTvXumP+lyYcKmKpa1jzeqg==
X-Google-Smtp-Source: ACcGV62OCxlNUxXyh36zKpq33KISxAGo4zTV/25XvmfDqzhMWe9+VxAYnqYbiMM/wNfwPBwH+ngvTg==
X-Received: by 2002:a65:4783:: with SMTP id e3-v6mr6189410pgs.12.1539364020849; 
 Fri, 12 Oct 2018 10:07:00 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id i5-v6sm2695646pgs.10.2018.10.12.10.06.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Oct 2018 10:06:59 -0700 (PDT)
Date: Fri, 12 Oct 2018 10:06:58 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181012170658.GF223066@joelaf.mtv.corp.google.com>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <9ed82f9e-88c4-8e4f-8c45-3ef153469603@kot-begemot.co.uk>
 <20181012143728.t42uvr6etg7gp7fh@kshutemo-mobl1>
 <4dd52e22-5b51-9b30-7178-fde603a08f88@kot-begemot.co.uk>
 <97cb3fe1-7bc1-12ff-d602-56c72a5496c5@kot-begemot.co.uk>
 <20181012165012.GD223066@joelaf.mtv.corp.google.com>
 <4f969958-913e-cb9f-48fb-e3a88e1d288c@kot-begemot.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4f969958-913e-cb9f-48fb-e3a88e1d288c@kot-begemot.co.uk>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_180713_015479_B0845702 
X-CRM114-Status: GOOD (  40.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012170658.Pf4wmJ1KmcT_-Abl2nAtYLOTa4Bc9TMACYO71YNfW_0@z>

On Fri, Oct 12, 2018 at 05:58:40PM +0100, Anton Ivanov wrote:
[...]
> > > > > > If I read the code right, MIPS completely ignores the address
> > > > > > argument so
> > > > > > set_pmd_at there may not have the effect which this patch is trying to
> > > > > > achieve.
> > > > > Ignoring address is fine. Most architectures do that..
> > > > > The ideas is to move page table to the new pmd slot. It's nothing to do
> > > > > with the address passed to set_pmd_at().
> > > > If that is it's only function, then I am going to appropriate the code
> > > > out of the MIPS tree for further uml testing. It does exactly that -
> > > > just move the pmd the new slot.
> > > > 
> > > > A.
> > > 
> > > A.
> > > 
> > >  From ac265d96897a346b05646fce91784ed4922c7f8d Mon Sep 17 00:00:00 2001
> > > From: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > > Date: Fri, 12 Oct 2018 17:24:10 +0100
> > > Subject: [PATCH] Incremental fixes to the mmremap patch
> > > 
> > > Signed-off-by: Anton Ivanov <anton.ivanov@cambridgegreys.com>
> > > ---
> > >   arch/um/include/asm/pgalloc.h | 4 ++--
> > >   arch/um/include/asm/pgtable.h | 3 +++
> > >   arch/um/kernel/tlb.c          | 6 ++++++
> > >   3 files changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
> > > index bf90b2aa2002..99eb5682792a 100644
> > > --- a/arch/um/include/asm/pgalloc.h
> > > +++ b/arch/um/include/asm/pgalloc.h
> > > @@ -25,8 +25,8 @@
> > >   extern pgd_t *pgd_alloc(struct mm_struct *);
> > >   extern void pgd_free(struct mm_struct *mm, pgd_t *pgd);
> > > -extern pte_t *pte_alloc_one_kernel(struct mm_struct *, unsigned long);
> > > -extern pgtable_t pte_alloc_one(struct mm_struct *, unsigned long);
> > > +extern pte_t *pte_alloc_one_kernel(struct mm_struct *);
> > > +extern pgtable_t pte_alloc_one(struct mm_struct *);
> > If its Ok, let me handle this bit since otherwise it complicates things for
> > me.
> > 
> > >   static inline void pte_free_kernel(struct mm_struct *mm, pte_t *pte)
> > >   {
> > > diff --git a/arch/um/include/asm/pgtable.h b/arch/um/include/asm/pgtable.h
> > > index 7485398d0737..1692da55e63a 100644
> > > --- a/arch/um/include/asm/pgtable.h
> > > +++ b/arch/um/include/asm/pgtable.h
> > > @@ -359,4 +359,7 @@ do {						\
> > >   	__flush_tlb_one((vaddr));		\
> > >   } while (0)
> > > +extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> > > +		pmd_t *pmdp, pmd_t pmd);
> > > +
> > >   #endif
> > > diff --git a/arch/um/kernel/tlb.c b/arch/um/kernel/tlb.c
> > > index 763d35bdda01..d17b74184ba0 100644
> > > --- a/arch/um/kernel/tlb.c
> > > +++ b/arch/um/kernel/tlb.c
> > > @@ -647,3 +647,9 @@ void force_flush_all(void)
> > >   		vma = vma->vm_next;
> > >   	}
> > >   }
> > > +void set_pmd_at(struct mm_struct *mm, unsigned long addr,
> > > +		pmd_t *pmdp, pmd_t pmd)
> > > +{
> > > +	*pmdp = pmd;
> > > +}
> > > +
> > I believe this should be included in a separate patch since it is not related
> > specifically to pte_alloc argument removal. If you want, I could split it
> > into a separate patch for my series with you as author.
> 
> 
> Whichever is more convenient for you.

Ok.

> One thing to note - tlb flush is extremely expensive on uml.
> 
> I have lifted the definition of set_pmd_at from the mips tree and removed
> the tlb_flush_all from it for this exact reason.
> 
> If I read the original patch correctly, it does its own flush control so
> set_pmd_at does not need to do a force flush every time. It is done further
> up the chain.

That is correct. It is not done during the optimization, but is done later
after the pmds have moved.

thanks,

 - Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
