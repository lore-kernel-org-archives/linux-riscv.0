Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6C3FCCD19A
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Oct 2025 10:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kHAYyZyAap4dyJdR9avjOCeO8aIwRYYyCg//nZXEmNw=; b=jEl3g9Jvntdls1
	b1LCB/ku3vVHIwII4yPg4wKZ/DSk85uKTIR0NZPSk9z7E48sAdKu5vgqfF7tfueCbIngeX+jPtoCZ
	u78+L+k91RUPmJR13eS+saAS1CNFVCZ8029AaJ7XUIQB+BX50epemdYkn/c4tY3PDQ/49LfSjAF26
	PUR1R3JWidGourOiLkLGnB7CKnKZz7xws/NaOjfFUvCAa3KeAwSnAYbjzDZ/bfta7EF9QY6q8jel9
	zfvN1vUtSVRr5iKZm2x5cuDQZUzJrSDqmxw08BUIn1uDoo9mqVIVQ6AuScKl2yhk7dXy3w4vizVbQ
	F5aCdS/J5G0L2h9L4rUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hqX-00000007YNZ-1HKh;
	Fri, 17 Oct 2025 10:38:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hqV-00000007YND-2y3l;
	Fri, 17 Oct 2025 10:38:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nWS8mbbAyKknksTkgFaSq1Uk5/fAQaz/isktn9K57hg=; b=rx05nYJAYN+RTwLB2lGfP1bKqX
	cPz5fqwLakGazsonqYKuradYhuAqs/nZNMp1UmMdmEfCx/0wwDD1Jo8DUW2lVPnJwIO6NufWGAA9r
	ZiUDqFrLMAam5RoKlt9adHo8b8Nkesw6GoiJ3pPrPHmQwBLTDcZDeMMDpoeIh/vzMVcK8i9VuHnvA
	GdtPmogaKpTQntPRIva/xPzJCazhbx9a7ZE/fV3ObzJngfuEGmNt4pPpmcf/oqbUye2TOgbB5JjbS
	DIiU97r47NbJ1u6sTo7huCPbrCOm4ElFLO5G2diIbCi3+DVFhpmeU5zExTsMiYzZevf9n4rETyW3X
	VfZs2JcA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hqO-00000008mcj-0Bmj;
	Fri, 17 Oct 2025 10:37:57 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8AB1130023C; Fri, 17 Oct 2025 12:37:55 +0200 (CEST)
Date: Fri, 17 Oct 2025 12:37:55 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V3 00/12] uaccess: Provide and use scopes for user masked
 access
Message-ID: <20251017103755.GZ4067720@noisy.programming.kicks-ass.net>
References: <20251017085938.150569636@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251017085938.150569636@linutronix.de>
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

On Fri, Oct 17, 2025 at 12:08:54PM +0200, Thomas Gleixner wrote:

> After some back and forth discussion Linus suggested to put the local label
> workaround into the user access functions themself.

> Andrew thankfully pointed me to nested for() loops and after some head
> scratching I managed to get all of it hidden in that construct.

These two hacks are awesome and made my day; thanks!

> Thomas Gleixner (12):
>       ARM: uaccess: Implement missing __get_user_asm_dword()
>       uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
>       x86/uaccess: Use unsafe wrappers for ASM GOTO
>       powerpc/uaccess: Use unsafe wrappers for ASM GOTO
>       riscv/uaccess: Use unsafe wrappers for ASM GOTO
>       s390/uaccess: Use unsafe wrappers for ASM GOTO
>       uaccess: Provide scoped masked user access regions
>       uaccess: Provide put/get_user_masked()
>       futex: Convert to scoped masked user access
>       x86/futex: Convert to scoped masked user access

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>

>       select: Convert to scoped masked user access

Basically okay on this one too, except see the comment.

>       coccinelle: misc: Add scoped_masked_$MODE_access() checker script

And that's just pure magic, I can't seem to get me head around
coccinelle syntax.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
