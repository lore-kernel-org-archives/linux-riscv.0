Return-Path: <SRS0=LzlR=MY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54C0FC6783C
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 14:37:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B0DC20645
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Oct 2018 14:37:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AmBaJ9TC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=shutemov-name.20150623.gappssmtp.com header.i=@shutemov-name.20150623.gappssmtp.com header.b="UYddXijW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B0DC20645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eYfuUnCh8L6HgZUzC/ftEIFzCf04KXvoU3TqXcJoj64=; b=AmBaJ9TCG8VDCb
	gmld7BKeaMJYgDR9eL7f0Clpm9r9gdefMML8scw/dMMWwl78BMYbnaH/9VXlp/J3ZTVEc1uon35cF
	ztFiyYclCWBjeXNN3M4FE3iGt9Q/UGvhc4pFA4Ozhs7hlGjz8E3Fux8MVPNZMwC13aG8Bsq+cyLlH
	kB40AdH+1d5FIX7F5/0/0kzpkND431hMCpCGXtxLfbKtsweiYA9uQ7frXkWUrzxkt6rhJ/+vgzLza
	qUc57FKrQ5vFhPqXN9VarutprixSRc2+50kdBFb1PZA3i6ujWkyzJ/sEXBYtDD/+etar5l231Slou
	gabr1UrlmxHuKpberKHw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAyZd-0004Nn-Dk; Fri, 12 Oct 2018 14:37:53 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAyZV-0004Kq-8x
 for linux-riscv@lists.infradead.org; Fri, 12 Oct 2018 14:37:50 +0000
Received: by mail-pl1-x641.google.com with SMTP id q19-v6so2955691pll.5
 for <linux-riscv@lists.infradead.org>; Fri, 12 Oct 2018 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WmsBeRqG+js0d1ZYoeNRzLWfmHXKH+0ny1JSwktvXaA=;
 b=UYddXijWdtK9+FBoycXqxjeDGtjj/99t/2YOiRgSdNY9ts+ybCKBQgWkbhOw3a0URs
 yzPTxHWgLmkfdlyI4yoSEx/ax89p4/aZUNpeF9gGkdPOSDUGdbqm7XKqzqiCbasA3WV0
 qdCaVeaXsSO4uwUI1EksMXDjBgN9542M4G4Rhq8Z1ZwXPb+Fa8hBdziFFq4A8LdSY8Xe
 K/9zRLDH1k3tfdvlXuq5bjM2NgMx7gSsu/MWXhYEMazsght6EqNCnY3QJqhMfBe3PIdF
 is7eogsMKQfiycKtWskb2wWAR9kqJ106PX+GvamKzqxF4YukqxOJQPgO0bDFYWkI/zub
 wkVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WmsBeRqG+js0d1ZYoeNRzLWfmHXKH+0ny1JSwktvXaA=;
 b=cs3qRts2/baM85auPZlS/wNt6ECSDhAM5niPydoRMkZes0I/6FuN3pvB08ktJ+6Vzz
 EwfDYyaqi1GLuK2/g0UCmQQ3rSICETcRmxqCG/63irX9l1WcV4PohFQPu3rRWDbiwiEF
 OnNu6zvooshVFkkCnJdj998m7fKwGPT8EfWhqeHzdb+YcYoWnDGp+3oMnr3gbP3MQXF9
 evaFZ248l2eCEfqlqPtopDqN7xHdF32gqGDIf3ao8ncAVoyJX7SRj80Hj5H6U9DtGLo8
 A/HPyUj4QCjqk4A7Z6hHHhvWCuORPYmk8Su2OFBUwXNN77eZY1yrt1QTDhbRtBf4eTa8
 0qsA==
X-Gm-Message-State: ABuFfogpv8AeaGHw7CijX3gBkxp4ko1eDStivMcQR11h2imbFusK/dyE
 KqSiVxBOjaf31xX02g3OCgcgcg==
X-Google-Smtp-Source: ACcGV624HBQdcYuhf1fNqc+fSSuf014ZgxhuMF9sCWpN1xC28Kjk2roR0JUzmssKeyQqkz1U05KpYw==
X-Received: by 2002:a17:902:2e81:: with SMTP id
 r1-v6mr79552plb.212.1539355054305; 
 Fri, 12 Oct 2018 07:37:34 -0700 (PDT)
Received: from kshutemo-mobl1.localdomain ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id h7-v6sm3188482pfd.35.2018.10.12.07.37.32
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 12 Oct 2018 07:37:33 -0700 (PDT)
Received: by kshutemo-mobl1.localdomain (Postfix, from userid 1000)
 id B6CDF300030; Fri, 12 Oct 2018 17:37:28 +0300 (+03)
Date: Fri, 12 Oct 2018 17:37:28 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Anton Ivanov <anton.ivanov@kot-begemot.co.uk>
Subject: Re: [PATCH v2 2/2] mm: speed up mremap by 500x on large regions
Message-ID: <20181012143728.t42uvr6etg7gp7fh@kshutemo-mobl1>
References: <20181012013756.11285-1-joel@joelfernandes.org>
 <20181012013756.11285-2-joel@joelfernandes.org>
 <9ed82f9e-88c4-8e4f-8c45-3ef153469603@kot-begemot.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9ed82f9e-88c4-8e4f-8c45-3ef153469603@kot-begemot.co.uk>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181012_073745_420783_F387B791 
X-CRM114-Status: GOOD (  28.64  )
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
 Jonas Bonn <jonas@southpole.se>, linux-s390@vger.kernel.org, dancol@google.com,
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
 Andy Lutomirski <luto@kernel.org>, nios2-dev@lists.rocketboards.org,
 Stafford Horne <shorne@gmail.com>, Guan Xuetao <gxt@pku.edu.cn>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org,
 pantin@google.com, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, minchan@kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, Richard Weinberger <richard@nod.at>,
 sparclinux@vger.kernel.org, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181012143728.h3O-IUMcklCic50HYsmRxdMuf2nFXLXK3KArT_co9iM@z>

On Fri, Oct 12, 2018 at 03:09:49PM +0100, Anton Ivanov wrote:
> On 10/12/18 2:37 AM, Joel Fernandes (Google) wrote:
> > Android needs to mremap large regions of memory during memory management
> > related operations. The mremap system call can be really slow if THP is
> > not enabled. The bottleneck is move_page_tables, which is copying each
> > pte at a time, and can be really slow across a large map. Turning on THP
> > may not be a viable option, and is not for us. This patch speeds up the
> > performance for non-THP system by copying at the PMD level when possible.
> > 
> > The speed up is three orders of magnitude. On a 1GB mremap, the mremap
> > completion times drops from 160-250 millesconds to 380-400 microseconds.
> > 
> > Before:
> > Total mremap time for 1GB data: 242321014 nanoseconds.
> > Total mremap time for 1GB data: 196842467 nanoseconds.
> > Total mremap time for 1GB data: 167051162 nanoseconds.
> > 
> > After:
> > Total mremap time for 1GB data: 385781 nanoseconds.
> > Total mremap time for 1GB data: 388959 nanoseconds.
> > Total mremap time for 1GB data: 402813 nanoseconds.
> > 
> > Incase THP is enabled, the optimization is skipped. I also flush the
> > tlb every time we do this optimization since I couldn't find a way to
> > determine if the low-level PTEs are dirty. It is seen that the cost of
> > doing so is not much compared the improvement, on both x86-64 and arm64.
> > 
> > Cc: minchan@kernel.org
> > Cc: pantin@google.com
> > Cc: hughd@google.com
> > Cc: lokeshgidra@google.com
> > Cc: dancol@google.com
> > Cc: mhocko@kernel.org
> > Cc: kirill@shutemov.name
> > Cc: akpm@linux-foundation.org
> > Signed-off-by: Joel Fernandes (Google) <joel@joelfernandes.org>
> > ---
> >   mm/mremap.c | 62 +++++++++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 62 insertions(+)
> > 
> > diff --git a/mm/mremap.c b/mm/mremap.c
> > index 9e68a02a52b1..d82c485822ef 100644
> > --- a/mm/mremap.c
> > +++ b/mm/mremap.c
> > @@ -191,6 +191,54 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
> >   		drop_rmap_locks(vma);
> >   }
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
> > +		pmd_t pmd;
> > +
> > +		new_ptl = pmd_lockptr(mm, new_pmd);
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
> 
> UML does not have set_pmd_at at all

Every architecture does. :)

But it may come not from the arch code.

> If I read the code right, MIPS completely ignores the address argument so
> set_pmd_at there may not have the effect which this patch is trying to
> achieve.

Ignoring address is fine. Most architectures do that..
The ideas is to move page table to the new pmd slot. It's nothing to do
with the address passed to set_pmd_at().

-- 
 Kirill A. Shutemov

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
