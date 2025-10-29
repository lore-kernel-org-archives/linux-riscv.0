Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DA4CCCF9EB
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 10:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wL2ME3x252/7R45oKRu1YV2NZ+dkyzryycdU7LMMPJY=; b=EnyFYgNmNnTGtv
	uCmA88ZQ+/DxkKBxlFsu0ynzgz66j0d9rs2KBXnWbqLmVnZYInRclmoW9wK3iINm8Laeyo1Fk7wbk
	0MuJ89Sr+d+kgdWOqWfNAoDf7NBNXEuE/gF8ddI9RrNR3hcjQyhZL7MLnW8WPXVwdIFoToXDpqsHW
	6YOdrVDFLNL7Zpj+2SeJFOFdj1oSDDgb6FZQU++XXhkmcA0Wa94yNxoHpW2+helImppWbvQdQ+J2+
	MT8cRD18iTShiSk5uJAcxKRkVU3wZexZa2aB1d+LsioY1S44dZX4QAikRzrHKF466SDF3cDsG6iPy
	IRrBzOtd1S+2DhZ4M/Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3LE-00000000jca-3KOD;
	Wed, 29 Oct 2025 10:23:44 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3L9-00000000jV6-28bq;
	Wed, 29 Oct 2025 10:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FTMUdLNlqjqoXX4P14LI/1ejbYO2CftFuA0qjvbF9f8=; b=fpc+lgycW1wcwUiZs6b4NjJePP
	iuaV9Xq7hNjiBnfjYwG7NBZlPjgZxOgGNDi8UoDFQ2xMc4q8YBYtO20x88uTqSr2tN5PTAcwTu+qG
	jRsNMYi3FjF+scS+TRjZ8raKrmJm9irXvKLA2qzlz3kQZOfHDnKWt3nYjxtU3QoTlJ9FFjc5NRt5i
	BJ0qtaYnNMLstn6zkZGJcqLrpPOfRpgOQIVchARnPISVBUlcFFYLLVx72Xb5bgAV7fHs8ehlsNrWf
	TG363xC52UimSsVO9P073iBgZndCyJUrWJNmVTw2mNHVCVo6NnZx0KzUujHtGahy82tqBVkLDkuet
	cNiQyKCg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE3L1-00000007Ffr-18tN;
	Wed, 29 Oct 2025 10:23:33 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 034AB300323; Wed, 29 Oct 2025 11:23:32 +0100 (CET)
Date: Wed, 29 Oct 2025 11:23:31 +0100
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
	David Laight <david.laight.linux@gmail.com>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?iso-8859-1?Q?Andr=E9?= Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
Message-ID: <20251029102331.GG988547@noisy.programming.kicks-ass.net>
References: <20251027083700.573016505@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027083700.573016505@linutronix.de>
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

On Mon, Oct 27, 2025 at 09:43:40AM +0100, Thomas Gleixner wrote:
> Thomas Gleixner (12):
>       ARM: uaccess: Implement missing __get_user_asm_dword()
>       uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
>       x86/uaccess: Use unsafe wrappers for ASM GOTO
>       powerpc/uaccess: Use unsafe wrappers for ASM GOTO
>       riscv/uaccess: Use unsafe wrappers for ASM GOTO
>       s390/uaccess: Use unsafe wrappers for ASM GOTO
>       uaccess: Provide scoped user access regions
>       uaccess: Provide put/get_user_inline()
>       futex: Convert to get/put_user_inline()
>       x86/futex: Convert to scoped user access
>       select: Convert to scoped user access

Applied to tip/core/rseq along with the first set of rseq patches. The
core-scoped-uaccess tag should denote just this series.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
