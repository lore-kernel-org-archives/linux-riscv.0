Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EC5C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 10:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hm4Zq2pdwjfsVIdL19p29dp5felYrqikJf9mdoeszVs=; b=KPXL++gGjCaN5U
	Vg1yRpV20huVCItbZSIKhIvwI8XfGRHv7T7O5KZpYs/n314AKkIky6q13tgJqZbwtwuBY8NsLQvVI
	uCYL8ABh928ZMUV5RrmDSHQ+cEtNHeWRIwFzHebofx4j19lRxxQSIR+CChntp35FcgrlztJZDNuEx
	vqVY7nqk2+Y+dS5LAtBP8mgiPINHnPQdnwqLoaCPiHMVF7tkHlnAMHBBm58fdLB41BiaLlmFov0gW
	3IPZVOH8vK4n3zf8rbOpFVJFKwsd0hEQYTPFxT5WReOaQHGywlTAJhl9A5ILJSbBCKrMQygpw5QZP
	MNdY6496/FcP2tWiPJXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF5l-00000004Eus-0Pdo;
	Thu, 02 Jul 2026 10:56:25 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfF5h-00000004EtN-2pHT;
	Thu, 02 Jul 2026 10:56:23 +0000
Date: Thu, 2 Jul 2026 12:56:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782989777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ixPQhnXgf4TKhclNNixfZQM7k/+d5gcWfCG3ObKKmF0=;
	b=4TVhvdqAIOEciydZhtWWTSBcjaeQ7Q4Nw9cuTHhL5opET36YUxZTwm3tFIMjXOSyivMsdt
	e0nVvs6ZVME8To/TkXXaWt9vu/ln7SPpBWx1P7HA4t0Pa7TQR7NzLgcvsS4YnG+QFfuA2k
	jsYLqaHd7uofGl1j45DFi+maomvGsdRErti9RqvI/7AcnlWEQPSWjCnZQX5zJ/p4BY96ey
	QuN0X4JZNXCH04yMHGSmEnv7E0fqOXkibVit8kf41tnXjZi3Uwslp69Trx+GBHyxL0CpUD
	9fxWC9NFlot4OKOHjeJwpm0BfXn01F53jFXoGwwFb35RESO/ccPB7phTFYI+aw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782989777;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ixPQhnXgf4TKhclNNixfZQM7k/+d5gcWfCG3ObKKmF0=;
	b=sH6bVU2F/pVuBlU067fDQEXZV5D8/UVBZNrA5jq3yQM1YprNUp9catTpYWYg5/RKz98OuW
	P0HauLhefLtPWAAQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	=?utf-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Thomas Huth <thuth@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Jisheng Zhang <jszhang@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Subject: Re: [PATCH] futex: Optimise the size check get_futex_key()
Message-ID: <20260702105615.PiYhQ9Rt@linutronix.de>
References: <20260630045531.3939-1-kprateek.nayak@amd.com>
 <20260630045531.3939-9-kprateek.nayak@amd.com>
 <20260701075714.GP48970@noisy.programming.kicks-ass.net>
 <20260701084150.GNOeboLw@linutronix.de>
 <38239f40-1673-469f-baa3-4a343d2aa4c3@amd.com>
 <20260701161736.xYYizA0e@linutronix.de>
 <20260702085921.GD49951@noisy.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260702085921.GD49951@noisy.programming.kicks-ass.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_035621_857195_861DF58D 
X-CRM114-Status: GOOD (  14.57  )
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

On 2026-07-02 10:59:21 [+0200], Peter Zijlstra wrote:
> > Could someone verify this, please? The 5% look a bit high. This is on
> > top of the series (but not worsen by the series).
> 
> Bah, I tried to reproduce and couldn't. Then I noticed I did a clang
> build and that is in fact clever enough to do this optimization itself.
> 
> /me tries again with a GCC build.
> 
> pre:  [thread  0] futex: 0x561f14430680 [ 9021408 ops/sec ]
> post: [thread  0] futex: 0x55feadbbb680 [ 8977527 ops/sec ]
> 
> (and this seems to be well inside the error threshold of this test).
> 
> So I see the GCC build do the DIV, and no longer with his patch applied,
> but for some reason I cannot get the runtime performance to actually
> improve much of anything on my system.

I did open https://gcc.gnu.org/bugzilla/show_bug.cgi?id=126078 for the
div.

My .config is the debian distro on the 4 node big iron. [ in case it
it has so much overhead elsewhere that this place a bigger role].

"perf top" showed this as 6% or something and red in the function. After
the removal it did not show up.

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
