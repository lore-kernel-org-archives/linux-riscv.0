Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92DB1ECDE44
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 02:09:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4905020831
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 02:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TezSPkx9";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=joelfernandes.org header.i=@joelfernandes.org header.b="LAnJhDOq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4905020831
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=joelfernandes.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUsJNxNRgIdSXHW+eHuVOzADgU7+fs3+IWbhxUSd3ac=; b=TezSPkx93hujde
	734VxqiOLlg6B6rpCLNc7lvq13s9qqyUY9GeRNZ/6M81OIHsWWAHsDsSDR6ezEP7FHPJtZ04lIhCX
	mJvIWeo3HJYD3S7Jt3TZN7vxG/4wowwb55lSQiSMSDS3eHl60UefJ8O4k4xgNpuirJd3Co15W7Ufo
	iNKhkfWPWUVbW03LwLwrb0X2MUQQMxrKCqkZgGhu7nCbwoUtc86wd7A81fIs+VwhUUZCL7amD2SGb
	Z8XBALHzs4MUU9RCWdOvvZrxmC/uVryS1bfTf/CLfzxlfU7QLgPQiLviTaSNNlVeQ+xsVqF3ntNtA
	+TKCo3tZ4ZzEqQWBsB/w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFV5T-00005o-57; Thu, 25 Oct 2018 02:09:27 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFV5O-0008W0-Ae
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 02:09:24 +0000
Received: by mail-pf1-x441.google.com with SMTP id f26-v6so3369172pfn.9
 for <linux-riscv@lists.infradead.org>; Wed, 24 Oct 2018 19:09:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=joelfernandes.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=G78I9uM4gXdiLalpqQZcUQ0k8S9gAvq6zBmyUxhGe0M=;
 b=LAnJhDOqLDe5rJ8W4SiC2EjUQZvQu/r5ZibVfgxKfT2epX8iHZwYQmEjB6a8btC1dW
 r6dDSvdCvkPgsk5m3K0hxUEc1ohpdLPr/504o7kJ7XSyqWkNXqLU77+seSO2HzOgNvQs
 hVyNi6MDrJlz77EflnU3vSDe0xbeuTe8cghrE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=G78I9uM4gXdiLalpqQZcUQ0k8S9gAvq6zBmyUxhGe0M=;
 b=ID7Zd2Up1+b6ZMUJ/tZauYZ3FLt4Yha3Y1FKhK7eH7hxAPydp3Gy4abLMW3yLG+G8p
 Ud/IYH98zKVuGxPU6qc8KWbgbzhFKUer6OSJW52tayHJApqpDEODZiCDvoubbMd5pM90
 79a6SvMkMPnOmSr7MLrlXk+aOvVgf4G8yj9qKR6YPt+RgUbHzsxhI/0DWtUlkTdsxyRa
 lK5ptBrSNU7Tqjg4LagF/XYSYjXHsuBXD9WDlrszxFaFblXZAbYAx9ZDmqXPNkC9QQQt
 mmXhJP316iC/SwsgW/j2P2bVpEDTZKWSyuyxg7lLTM33ch6vnuF89bdIp1xIgehl4dYz
 vfTw==
X-Gm-Message-State: AGRZ1gLmrXQ0m8ZXOZzdhqWYqUW3sqjtYHLIqxHxpb/d9DZwNhgvbpBK
 jow5UjnvewV434e9NIUO9TI5/Q==
X-Google-Smtp-Source: AJdET5dUEfywPWvzS+489PJ55mfHZNUk9qKPmDa0EsEQ3lYTg7j+ER6qGO2BektCxwt9F6U/VdSRSA==
X-Received: by 2002:aa7:814f:: with SMTP id
 d15-v6mr5054081pfn.78.1540433350578; 
 Wed, 24 Oct 2018 19:09:10 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
 by smtp.gmail.com with ESMTPSA id 68-v6sm6748192pfg.136.2018.10.24.19.09.08
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 24 Oct 2018 19:09:08 -0700 (PDT)
Date: Wed, 24 Oct 2018 19:09:07 -0700
From: Joel Fernandes <joel@joelfernandes.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH 2/4] mm: speed up mremap by 500x on large regions (v2)
Message-ID: <20181025020907.GA13560@joelaf.mtv.corp.google.com>
References: <20181013013200.206928-1-joel@joelfernandes.org>
 <20181013013200.206928-3-joel@joelfernandes.org>
 <20181024101255.it4lptrjogalxbey@kshutemo-mobl1>
 <20181024115733.GN8537@350D>
 <20181024125724.yf6frdimjulf35do@kshutemo-mobl1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20181024125724.yf6frdimjulf35do@kshutemo-mobl1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181024_190922_406994_49105C45 
X-CRM114-Status: GOOD (  22.07  )
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
 Balbir Singh <bsingharora@gmail.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Will Deacon <will.deacon@arm.com>,
 mhocko@kernel.org, linux-mm@kvack.org, lokeshgidra@google.com,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 elfring@users.sourceforge.net, Jonas Bonn <jonas@southpole.se>,
 kvmarm@lists.cs.columbia.edu, dancol@google.com,
 Yoshinori Sato <ysato@users.sourceforge.jp>, linux-xtensa@linux-xtensa.org,
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
Message-ID: <20181025020907.OS777LGVojirFXRJFNyj6eAjdE_C3R5tPDnR3_821vs@z>

On Wed, Oct 24, 2018 at 03:57:24PM +0300, Kirill A. Shutemov wrote:
> On Wed, Oct 24, 2018 at 10:57:33PM +1100, Balbir Singh wrote:
> > On Wed, Oct 24, 2018 at 01:12:56PM +0300, Kirill A. Shutemov wrote:
> > > On Fri, Oct 12, 2018 at 06:31:58PM -0700, Joel Fernandes (Google) wrote:
> > > > diff --git a/mm/mremap.c b/mm/mremap.c
> > > > index 9e68a02a52b1..2fd163cff406 100644
> > > > --- a/mm/mremap.c
> > > > +++ b/mm/mremap.c
> > > > @@ -191,6 +191,54 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
> > > >  		drop_rmap_locks(vma);
> > > >  }
> > > >  
> > > > +static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
> > > > +		  unsigned long new_addr, unsigned long old_end,
> > > > +		  pmd_t *old_pmd, pmd_t *new_pmd, bool *need_flush)
> > > > +{
> > > > +	spinlock_t *old_ptl, *new_ptl;
> > > > +	struct mm_struct *mm = vma->vm_mm;
> > > > +
> > > > +	if ((old_addr & ~PMD_MASK) || (new_addr & ~PMD_MASK)
> > > > +	    || old_end - old_addr < PMD_SIZE)
> > > > +		return false;
> > > > +
> > > > +	/*
> > > > +	 * The destination pmd shouldn't be established, free_pgtables()
> > > > +	 * should have release it.
> > > > +	 */
> > > > +	if (WARN_ON(!pmd_none(*new_pmd)))
> > > > +		return false;
> > > > +
> > > > +	/*
> > > > +	 * We don't have to worry about the ordering of src and dst
> > > > +	 * ptlocks because exclusive mmap_sem prevents deadlock.
> > > > +	 */
> > > > +	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
> > > > +	if (old_ptl) {
> > > 
> > > How can it ever be false?

Kirill,
It cannot, you are right. I'll remove the test.

By the way, there are new changes upstream by Linus which flush the TLB
before releasing the ptlock instead of after. I'm guessing that patch came
about because of reviews of this patch and someone spotted an issue in the
existing code :)

Anyway the patch in concern is:
eb66ae030829 ("mremap: properly flush TLB before releasing the page")

I need to rebase on top of that with appropriate modifications, but I worry
that this patch will slow down performance since we have to flush at every
PMD/PTE move before releasing the ptlock. Where as with my patch, the
intention is to flush only at once in the end of move_page_tables. When I
tried to flush TLB on every PMD move, it was quite slow on my arm64 device [2].

Further observation [1] is, it seems like the move_huge_pmds and move_ptes code
is a bit sub optimal in the sense, we are acquiring and releasing the same
ptlock for a bunch of PMDs if the said PMDs are on the same page-table page
right? Instead we can do better by acquiring and release the ptlock less
often.

I think this observation [1] and the frequent TLB flush issue [2] can be solved
by acquiring the ptlock once for a bunch of PMDs, move them all, then flush
the tlb and then release the ptlock, and then proceed to doing the same thing
for the PMDs in the next page-table page. What do you think?

- Joel


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
