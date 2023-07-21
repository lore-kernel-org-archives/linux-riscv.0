Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE8B0EB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jul 2023 16:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lseKIBOyF6m5un/RRqeJsnQMj9tPD3CV/dGH4fqG/v4=; b=DZR/FYI3IFIYHx
	Gj/pKqBzQZwMmUK01cQEyetxgdEbnAGWUUTFdNpcFPpISZUujOuzQbaQhJD3eZ+Igfu78sIAySV+H
	DwYyg6dQX+I5jE/hlnZNS8/8ByLwOvE3gHWxx4iIP4W2Ljac3d6uJvwAGQgPFu6DrKGysvRRdoAE4
	/LzAgslh5WiFI6R65nH3WRU3cVDlSE1KYhhr8VOpVVQoG+1iwr8rhZ2YfrOALvtJMinw4m0WP4JTO
	7ULfbZZbO/CRQ9a3T8RtYd0lJBMMfBkPvbNn/l9jiHSd0IMQEVjxwHPNKb8O9Qcd3n8lEv53i4HKC
	1UO8bhUBn6WrIclshokA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtQ5-00Eex0-1s;
	Fri, 21 Jul 2023 16:55:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMtQ4-00Eewe-1b
	for linux-riscv@bombadil.infradead.org;
	Fri, 21 Jul 2023 16:55:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wimJ925cRdpSi7uZQcxvngoQCBxgutclkITzDOIvNGA=; b=Ou1WTj9BNc904xqGWKrsAdJfF0
	X1/b6gEastanfHojH4jj4PZhUaaFIcxA88+34kffYAkGHbn6tzyPmn1Yy2tAOg4fEqlyblbzzCqrt
	g32pxop6/hTA85gGAfKvb2QwmUsesoqmJwzNfjLu3XQjZy7OmVpbEJMLQZy+BLRm0+kW0d2DaKXk9
	W28fvB8fky0gkPVGV9Fy2Rq5QPJpK1D4eTHrYrHWSKabhAHyzq6zcu0uGOkUJTHK1cVu2ygnhEvWk
	Ov67TNz3pHrl8VAWl9kN12v8aBm53sCD1+om0Oq/Y+hPHTvibsC2ZdjrGYBQB2FTixMYQPPN3rnN6
	5t4w5H2A==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMsxm-000A2A-1D
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jul 2023 16:26:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D0D7461D34;
	Fri, 21 Jul 2023 16:26:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE0D4C433CA;
	Fri, 21 Jul 2023 16:26:33 +0000 (UTC)
Date: Fri, 21 Jul 2023 12:26:32 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Peter Zijlstra <peterz@infradead.org>, LKML
 <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, "Jiri Kosina" <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Nicholas Piggin"
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 <linux-csky@vger.kernel.org>, <linux-parisc@vger.kernel.org>,
 <linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
 <live-patching@vger.kernel.org>, =?UTF-8?B?546L6LSH?=
 <yun.wang@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, Jakub Kicinski
 <kuba@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20230721122632.56b4df6c@gandalf.local.home>
In-Reply-To: <035cee53-255b-11a3-d7ac-ca46c05b907b@intel.com>
References: <20211015110035.14813389@gandalf.local.home>
	<20211015161702.GF174703@worktop.programming.kicks-ass.net>
	<20211015133504.6c0a9fcc@gandalf.local.home>
	<20211015135806.72d1af23@gandalf.local.home>
	<20211015180429.GK174703@worktop.programming.kicks-ass.net>
	<20211015142033.72605b47@gandalf.local.home>
	<20211015142541.4badd8a9@gandalf.local.home>
	<1b402c0c-1beb-d93f-ff6d-955350995ca3@intel.com>
	<20230721120040.6ed2c02a@gandalf.local.home>
	<035cee53-255b-11a3-d7ac-ca46c05b907b@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230721_172642_640934_EC622C5F 
X-CRM114-Status: GOOD (  12.57  )
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

On Fri, 21 Jul 2023 18:06:07 +0200
Alexander Lobakin <aleksander.lobakin@intel.com> wrote:

> > Just because you disable interrupts does not mean you are in interrupt
> > context.  
> 
> Ah okay, thanks! IOW, if we want to check in some code that we're
> certainly have interrupts enabled and are not in the interrupt context,
> we must always do
> 
> if (!(in_hardirq() || irqs_disabled()))
> 

Yeah, probably.

> , nothing more elegant / already existing / ...?

It's not a common check. What would you call that?

	irq_safe() ?

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
