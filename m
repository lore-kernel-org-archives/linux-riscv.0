Return-Path: <SRS0=/L7I=NE=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D389BC67863
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 11:58:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5774820824
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 24 Oct 2018 11:58:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XMtVM4qK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rxvOMkoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5774820824
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6qDtJR3YpygazZynBFAm7SI/n6M/dSnEYOBH3i65dCU=; b=XMtVM4qKA4APTU
	BjlyUqcJK7hQTundTexAsUMxoQw0AL3QaeWZh6WtX8+IfS/IJvnsyY+pyjQzOq58iYipjh/SWLAgj
	fjkJ5YJ/U1BWqePiRUy69gvu1XqizyVHlxljLB6wK2BO5o6+8Hay6fh/KfMKM27cel0+x+bZKH8iE
	tDohNk2y6qqgXuGCjXPQZdLUAS0KcYfElpYElCcIn37GDlqhTBiiIAOWq1ghCd2YgOUYwYNfjBRU3
	a4zQVy3GG/p0ihb+rjp4G3/VAksHqUecKt0fIgYMy/b7YDrjt5LIjwyDFsaimncgdTdTj2hu7NrTb
	oxJ16Z/LCulUh/e+SuGw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFHnm-0006n4-Dd; Wed, 24 Oct 2018 11:58:18 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFHnK-0006Y6-8f; Wed, 24 Oct 2018 11:58:01 +0000
Received: by mail-pg1-x542.google.com with SMTP id g12-v6so2218514pgs.1;
 Wed, 24 Oct 2018 04:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=r4S1JZtjtEoZRmv1cmbD7oqQ5fBxxZJ0gckdgeOcI14=;
 b=rxvOMkoPR1fl+wChK1gmiyTy80jYizuSzzLNsN1UW/nn68lcvDelAzg7q5xRULAFwF
 88m9+eaacj9fu1oQRgbn9o9rL5OobsROYLsUPy8Jgnz+ao671RDA5Lk1ggZYlGqX9SbG
 9RUUixIOumM9W9fFeC11ng0GECm2HV0kpOJEacCyBhFOab2Q3i4VFHF0QbnxQWZzkmCY
 Lire1m9l7AF9VgUbUKgofuhPxpehLdKNOXRb6mUKntibxqs2pslottwNtAIjzUINJV13
 bV4f1WLD9yCA7Iyr+h+lgaNFbMHR6/U4tmHoxnhQ/7prUqBNDcYtn35v7xWxzF+rGnLI
 1zrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=r4S1JZtjtEoZRmv1cmbD7oqQ5fBxxZJ0gckdgeOcI14=;
 b=IjWhuy2DCafakCHos4M0GcG9M+++pTNlXnnA8PBUZNzIKX3M2XDE3MECwB6pzfM3nN
 QcfPs27SKl5mFSEooXJbqMjbx83UniuNNtVnnH/4LjHAwi1BV8KZQTMLbiNe7Qj4gAXB
 WiwJN3gpUB4gETa3kF2SIbaG0zt9P4jW8rui/oIbV5eVOC7serhiwbPRzjDdg05NuIFA
 MAkSL4TfS9YxfuO3e1IfL9ZEdsTWsOTm5USlwxZxFkembyzDiciEiD6vz1oErLxKPQO7
 4g9LSz5n6/IzeiKtRveJh4qva8galJwL/cnZQG8NeG/jADKpLzQwZDFdkp7RBnOQyOFM
 EfQw==
X-Gm-Message-State: AGRZ1gJbx6JyOWNdbfjv/qBgk9DqcZhStfzAHC5t9G5oaQVL6U6G1l/R
 mOAslYnBWOjMDz7cGiqPtFg=
X-Google-Smtp-Source: AJdET5fJWm/yEunoAdHkJCNfHZyAKT69zWrP0KZ/06Nf8Zmi/6rvBn7LEzBt+uDaB55Nx51vc0n+3g==
X-Received: by 2002:a62:6383:: with SMTP id
 x125-v6mr2334785pfb.13.1540382257876; 
 Wed, 24 Oct 2018 04:57:37 -0700 (PDT)
Received: from localhost (14-202-194-140.static.tpgi.com.au. [14.202.194.140])
 by smtp.gmail.com with ESMTPSA id
 t5-v6sm3677450pfm.26.2018.10.24.04.57.35
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 04:57:36 -0700 (PDT)
Date: Wed, 24 Oct 2018 22:57:33 +1100
From: Balbir Singh <bsingharora@gmail.com>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
Message-ID: <20181024115733.GN8537@350D>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
 <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_045750_521481_D1AA580F 
X-CRM114-Status: GOOD (  18.86  )
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
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 linux-riscv@lists.infradead.org, elfring@users.sourceforge.net,
 Jonas Bonn <jonas@southpole.se>, kvmarm@lists.cs.columbia.edu,
 dancol@google.com, Yoshinori Sato <ysato@users.sourceforge.jp>,
 sparclinux@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 hughd@google.com, "James E.J. Bottomley" <jejb@parisc-linux.org>,
 kasan-dev@googlegroups.com, anton.ivanov@kot-begemot.co.uk,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>, linux-snps-arc@lists.infradead.org,
 kernel-team@android.com, Sam Creasey <sammy@sammy.net>,
 Fenghua Yu <fenghua.yu@intel.com>, linux-s390@vger.kernel.org,
 Jeff Dike <jdike@addtoit.com>, linux-um@lists.infradead.org,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Julia Lawall <Julia.Lawall@lip6.fr>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 nios2-dev@lists.rocketboards.org, Stafford Horne <shorne@gmail.com>,
 Guan Xuetao <gxt@pku.edu.cn>, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, Richard Weinberger <richard@nod.at>,
 linux-parisc@vger.kernel.org, pantin@google.com,
 Max Filippov <jcmvbkbc@gmail.com>, linux-kernel@vger.kernel.org,
 minchan@kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-alpha@vger.kernel.org, Ley Foon Tan <lftan@altera.com>,
 akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181024115733.mZpxzNRdRAIDc4z8RZlmwTLR_6XbnZ8uf8EzntNJZas@z>

On Wed, Oct 24, 2018 at 01:12:56PM +0300, Kirill A. Shutemov wrote:
> On Fri, Oct 12, 2018 at 06:31:58PM -0700, Joel Fernandes (Google) wrote:
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 9e68a02a52b1..2fd163cff406 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -191,6 +191,54 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
> >  		drop_rmap_locks(vma);
> >  }
> >  
> > +static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
> > +		  unsigned long new_addr, unsigned long old_end,
> > +		  pmd_t *old_pmd, pmd_t *new_pmd, bool *need_flush)
> > +{
> > +	spinlock_t *old_ptl, *new_ptl;
> > +	struct mm_struct *mm = vma->vm_mm;
> > +
> > +	if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
> > +	    || old_end - old_addr < PMD_SIZE)
> > +		return false;
> > +
> > +	/*
> > +	 * The destination pmd shouldn't be established, free_pgtables()
> > +	 * should have release it.
> > +	 */
> > +	if (WARN_ON(!pmd_none(*new_pmd)))
> > +		return false;
> > +
> > +	/*
> > +	 * We don't have to worry about the ordering of src and dst
> > +	 * ptlocks because exclusive mmap_sem prevents deadlock.
> > +	 */
> > +	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
> > +	if (old_ptl) {
> 
> How can it ever be false?
> 
> > +		pmd_t pmd;
> > +
> > +		new_ptl = pmd_lockptr(mm, new_pmd);


Looks like this is largely inspired by move_huge_pmd(), I guess a lot of
the code applies, why not just reuse as much as possible? The same comments
w.r.t mmap_sem helping protect against lock order issues applies as well.

> > +		if (new_ptl != old_ptl)
> > +			spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
> > +
> > +		/* Clear the pmd */
> > +		pmd = *old_pmd;
> > +		pmd_clear(old_pmd);
> > +
> > +		VM_BUG_ON(!pmd_none(*new_pmd));
> > +
> > +		/* Set the new pmd */
> > +		set_pmd_at(mm, new_addr, new_pmd, pmd);
> > +		if (new_ptl != old_ptl)
> > +			spin_unlock(new_ptl);
> > +		spin_unlock(old_ptl);
> > +
> > +		*need_flush = true;
> > +		return true;
> > +	}
> > +	return false;
> > +}
> > +
> -- 
>  Kirill A. Shutemov
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
