Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EB6C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 21:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JrQ/praDEubJ51EAuz5XekpZBch0iUEB2bCk7qZgGac=; b=s5ocq4u1AP2KKc
	cq3AaXue+a8zPtIpOd2r0sMdildQKhdcpKTPxx7SlmNhBZT992ilU1nDOjohG35SQv0gJJ5aG7NkP
	oChbIN48d3gJxotWV2wSvZeHpmnfGPS+Uvv2+ql9khFRK/2R/VAzZ464EictzKitl6ZTo0aKQB22Q
	4FuUdOWQXe1ai0T+oZ1xCDCafaCHJ7gGcb8JYYmMwRhgRLJGlkASPrNZKExJiHxld1SdegqLxf9nH
	UW3SwsnPLZPAEaIgSXTL7tlCEeyQZnC5nXfbygBADBaFa0C8K5KLgmHagrYSV4gAp3mf6sp2xvdXR
	+XL7S6QhnxmGQQtw9XMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMyVU-009RO0-6D; Tue, 31 Jan 2023 21:49:36 +0000
Received: from zeniv.linux.org.uk ([2a03:a000:7:0:5054:ff:fe1c:15ff])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMyVR-009RNI-Ov
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 21:49:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JJ44pVL3mpUwlUxxk25RF88dX6Vi82gssdvbi+j7w98=; b=L4fmKwMl034+kqBEbRIOil/Yzh
	hebphUxkSNBGPEKW8g2u5c7rAgqQSyyL13EJ+82NtRrNyTAhJvd+2dstA9BL7A1SQQIzJ9BejthDC
	mqlgtru3NuMP/KoLrfN0k0J5jRH+PdM2lcPU8uz/PZMFIj9F70MnMs6PGAjArLgKtPLwiKRooRb6k
	+TgRc0rgODdYO8q9/UPV7OHaNeiLl087a/TS7Z6P1YXJT6EbnikFdEJU12GDbE8H0Ka6TrH/jUxyT
	4iM7PQjXxJEAqoDKDAqsBulJEQRFXxqbtquBcyq1qPjb9aeKshaeeQQ17otlNuZ0SkHU49148N9sG
	Mi7bsbKA==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat Linux))
	id 1pMyVL-005Jej-28;
	Tue, 31 Jan 2023 21:49:27 +0000
Date: Tue, 31 Jan 2023 21:49:27 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Xu <peterx@redhat.com>, linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org, linux-ia64@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>,
	openrisc@lists.librecores.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org
Subject: Re: [RFC][PATCHSET] VM_FAULT_RETRY fixes
Message-ID: <Y9mM5wiEhepjJcN0@ZenIV>
References: <Y9lz6yk113LmC9SI@ZenIV>
 <CAHk-=whf73Vm2U3jyTva95ihZzefQbThZZxqZuKAF-Xjwq=G4Q@mail.gmail.com>
 <Y9mD1qp/6zm+jOME@ZenIV>
 <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wjiwFzEGd_60H3nbgVB=R_8KTcfUJmXy=hSXCvLrXQRFA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_134933_833196_CDDD27C3 
X-CRM114-Status: GOOD (  23.29  )
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

On Tue, Jan 31, 2023 at 01:19:59PM -0800, Linus Torvalds wrote:
> On Tue, Jan 31, 2023 at 1:10 PM Al Viro <viro@zeniv.linux.org.uk> wrote:
> >
> > Umm...  What about the semantics of get_user() of unmapped address?
> > Some architectures do quiet EFAULT; some (including alpha) hit
> > the sucker with SIGBUS, no matter what.
> 
> I think we should strive to just make this all common.
> 
> The reason alpha is different is almost certainly not intentional, but
> a combination of "pure accident" and "nobody actually cares".
> 
> > Are we free to modify that behaviour, or is that part of arch-specific
> > ABI?
> 
> I'd just unify this all, probably with a preference for existing
> semantics on x86 (because of "biggest and most varied user base").
> 
> That whole "send SIGBUS even for kernel faults" is certainly bogus and
> against the usual rules. And I may well be to blame for it (I have
> this memory of disliking how EFAULT as a return code didn't actually
> return the faulting address). And realistically, it's also just not
> something that any normal application will ever hit.  Giving invalid
> addresses to system calls is basically always a bug, although there
> are always special software that do all the crazy corner cases (ie
> things like emulators tend to do odd things).
> 
> I doubt such special software exists on Linux/alpha, though.
> 
> So I wouldn't worry about those kinds of oddities overmuch.
> 
> *If* somebody then finds a load that cares, we can always fix it
> later, and I'll go "mea culpa, I didn't think it would matter, and I
> was wrong".

FWIW, from digging through the current tree:

alpha, openrisc, sparc and xtensa send SIGBUS.
m68k: not sure, do_page_fault() callers there are delicate.
mips: really interesting -
        /* Kernel mode? Handle exceptions or die */
        if (!user_mode(regs))
                goto no_context;

        /*
         * Send a sigbus, regardless of whether we were in kernel
         * or user mode.
... which is obviously a rudiment of SIGBUS variant, but nowadays
it's EFAULT.

Everything else seems to be going with EFAULT.

PS: mips used to be SIGBUS, until this
commit 1d50e5e7a6e0325b1a652c4be296a71dc54a6e96
Author: Andrew Morton <akpm@osdl.org>
Date:   Fri Feb 20 01:33:18 2004 -0800

    [PATCH] MIPS mega-patch
    
    From: Ralf Baechle <ralf@linux-mips.org>
    
    Below following 125547 lines of patches, all to arch/mips and
    include/asm-mips.  I'm going to send the remaining stuff of which the one
    or other bit may need to be discussed in smaller bits.

IOW, details are buried somewhere in historical mips tree, assuming
it survives...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
