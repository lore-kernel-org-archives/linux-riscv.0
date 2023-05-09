Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C16DC7EE23
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 20:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ojPjA/MFGIG2E+Y/xLilkaWA2v6KO+DCF1Ltql1+Tpw=; b=NTN/i3h4KF4Png
	VY3QThxfGLiRCwUl2AWakY346CjZ+mRxt/P0Y4mIftaE5u2VzgyzVf/Mhy3UkFnhCSHwWBHxfGaw8
	eaaX14qUAkna+CKh5hosX4GyFRaqRBZ4lxjJBM2+k4YzPn/ATaU9VYqlStF3EMRnDrZbeBZacDyzM
	RRDt43bgmNBJucZbya/cYoqwvMqCYEqQ55aq+0X8ZBCHtqhg6ACEQMuzJz3LWphJ24kR50m4M5z8E
	X8Fw5U61Dapr5CIOeOnkpG/Fm8OQFes7dgXR9Aukxdmv9vLOaSOy7CgTpwIo7LlfJemKjEkxMcdCd
	A8QG++KBWuDS2wvoaCIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTgE-004AzW-1a;
	Tue, 09 May 2023 20:11:26 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwTgB-004Awu-28;
	Tue, 09 May 2023 20:11:24 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683663065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDHRmjiERMZtAMWS8NswxcpsZgr8pqyf8cBJN0UwKq4=;
	b=qRz1Wt3JIbNYLISqAbJr1CMERh+G2fMl0sqNUINGFnuAglUDS20PR5mShGM7iQQQaOXzUO
	6p1nBmlJSh5FISuh/gxPpyFl5N/5lIcPzXiWCbOhc/BY9nLjejGZdozuMFQuDWHB0czbQ3
	N334596N1dIxTBUtYyzDiKqjfnYYlcCALsa05iyDdZ772j72RpkHn+oDxyP4ObL7l+piSu
	ZhZkepOsryy7f/3f8Xvt0ySi2CMPDVnx0tsF8XLS0QXVKSABEb0ZDeaHvlrFZfnZHg6sEY
	EkUkcA416BPYsfyNhOSk3xIjz0pEBaTy2eNw1t0P+tqJe8e17B+vC1YPI9z1/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683663065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=GDHRmjiERMZtAMWS8NswxcpsZgr8pqyf8cBJN0UwKq4=;
	b=Xlcesbr/mowxxv4d+xv21wM9Nh14MEM6CP2UULmrKClB0/ijd/XoMlkIURymgqxjfMwTM5
	2x4mgfol9jpnTzDw==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
 <seanjc@google.com>, Oleksandr Natalenko <oleksandr@natalenko.name>, Paul
 Menzel <pmenzel@molgen.mpg.de>, "Guilherme G. Piccoli"
 <gpiccoli@igalia.com>, Piotr Gorski <lucjan.lucjanov@gmail.com>, Usama
 Arif <usama.arif@bytedance.com>, Juergen Gross <jgross@suse.com>, Boris
 Ostrovsky <boris.ostrovsky@oracle.com>, xen-devel@lists.xenproject.org,
 Russell King <linux@armlinux.org.uk>, Arnd Bergmann <arnd@arndb.de>,
 linux-arm-kernel@lists.infradead.org, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren
 <guoren@kernel.org>, linux-csky@vger.kernel.org, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org, "James E.J.
 Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [patch v3 08/36] x86/smpboot: Split up native_cpu_up() into
 separate phases and document them
In-Reply-To: <20230509100421.GU83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509100421.GU83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 22:11:05 +0200
Message-ID: <87fs85z2na.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_131123_867391_90B73AF1 
X-CRM114-Status: GOOD (  12.50  )
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

On Tue, May 09 2023 at 12:04, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
> Not to the detriment of this patch, but this barrier() and it's comment
> seem weird vs smp_callin(). That function ends with an atomic bitop (it
> has to, at the very least it must not be weaker than store-release) but
> also has an explicit wmb() to order setup vs CPU_STARTING.
>
> (arguably that should be a full fence *AND* get a comment)

TBH: I'm grasping for something 'arguable': What's the point of this
wmb() or even a mb()?

Most of the [w]mb()'s in smpboot.c except those in mwait_play_dead()
have a very distinct voodoo programming smell.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
