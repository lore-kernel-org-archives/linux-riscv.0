Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB863C7EE24
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 17:59:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7l8AaBLfs/KU2vxReL7sRj6LW4vWGupmUImRbTbUGFs=; b=Oy/mFeHAlJvhd6
	vLgtoB/J5zf0E95DrhaEXpVkZ0QzR99GhYp2mLs0UfOPa8ibdAnvVZaY1JFTF8I0s929Pk8HGNpkY
	MyMqJi972jbIBdJiKRntLhPRzr6y0TwmNTKe/itXBIsR9+cENTypE3L36DMlHaPMDLA6yGWhYutpP
	wdMJPKWt0hQfth43DJSgB3YcKTQ4myhWW0qaxyHZhscqi0GeRICLIZ4mp7GMeumnv5eO4BqJ1GZlC
	0+nwgYjbtHE+SWM8Ub+tFULUspKA3xtshztf9Dobsvh87E2EOQv+iZw6Xx0FZfDMjk/2F+GZSN93L
	BvKaHqO24IPVD51vjjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRce-003wwR-1d;
	Tue, 09 May 2023 17:59:36 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRca-003wtZ-05;
	Tue, 09 May 2023 17:59:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683655167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xum3/PoQhkj8+lZ0cf9sSFx6MXDYkjs5zNnUN+Pv1LU=;
	b=Nkxxvef/gwwBJnsMEIx+ow4OwBi+0uHyp5RBmTf5nu2aiSk0OvZ3yifQpp8iu0sBDEUJcj
	a1p/dXIoIW4cJOIsg3u9nq+3ZMGA79rnrh+h78apzOr+Woxv52xV94jRRDOLibuFSvjBwU
	SUohqreBen1xyv3eEH/AIWmtrxMik/GCCKHEY26BeCG6MKFWZnPkyvuY6oXd/duWViLVW4
	n9vlzd7qcknLzQIMlzIHP9a/aIzu+mUh7LOMVIovsp4Zig3bcOdy74WIwY4m1K8dtzitFX
	d+4WVMFQBWUbsdvHH09vwdfFlTvUiShojFdmigWEUDG66lPt7MAObiHtgpD6iQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683655167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xum3/PoQhkj8+lZ0cf9sSFx6MXDYkjs5zNnUN+Pv1LU=;
	b=hLLA1dOtcFDkk6Slof++fN9bjbnwHItgF9jR7A+4LDWa4ZEHpxGnn+ndm2NGXZQsn8wojt
	9d63Rl+ydABO0vAQ==
To: Peter Zijlstra <peterz@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, x86@kernel.org, David Woodhouse
 <dwmw2@infradead.org>, Andrew Cooper <andrew.cooper3@citrix.com>, Brian
 Gerst <brgerst@gmail.com>, Arjan van de Veen <arjan@linux.intel.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Paul McKenney <paulmck@kernel.org>, Tom
 Lendacky <thomas.lendacky@amd.com>, Sean Christopherson
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
In-Reply-To: <87pm791zev.ffs@tglx>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509100421.GU83892@hirez.programming.kicks-ass.net>
 <87pm791zev.ffs@tglx>
Date: Tue, 09 May 2023 19:59:26 +0200
Message-ID: <87o7mtz8qp.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_105932_226735_D74583F1 
X-CRM114-Status: GOOD (  17.09  )
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

On Tue, May 09 2023 at 14:07, Thomas Gleixner wrote:
> On Tue, May 09 2023 at 12:04, Peter Zijlstra wrote:
>> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
>>> +	/*
>>> +	 * Sync point with wait_cpu_callin(). The AP doesn't wait here
>>> +	 * but just sets the bit to let the controlling CPU (BSP) know that
>>> +	 * it's got this far.
>>> +	 */
>>>  	smp_callin();
>>>  
>>> -	/* otherwise gcc will move up smp_processor_id before the cpu_init */
>>> +	/* Otherwise gcc will move up smp_processor_id() before cpu_init() */
>>>  	barrier();
>>
>> Not to the detriment of this patch, but this barrier() and it's comment
>> seem weird vs smp_callin(). That function ends with an atomic bitop (it
>> has to, at the very least it must not be weaker than store-release) but
>> also has an explicit wmb() to order setup vs CPU_STARTING.
>>
>> (arguably that should be a full fence *AND* get a comment)
>>
>> There is no way the smp_processor_id() referred to in this comment can
>> land before cpu_init() even without the barrier().
>
> Right. Let me clean that up.

So I went and tried to figure out where this comes from. It's from
d8f19f2cac70 ("[PATCH] x86-64 merge") in the history tree. One of those
well documented combo patches which change world and some more. The
context back then was:

	/*
	 * Dont put anything before smp_callin(), SMP
	 * booting is too fragile that we want to limit the
	 * things done here to the most necessary things.
	 */
	cpu_init();
	smp_callin();

	Dprintk("cpu %d: waiting for commence\n", smp_processor_id()); 

That still does not explain what the barrier is doing. I tried to
harvest mailing list archives, but did not find anything. The back then
list discuss@x86-64.org was never publicly archived... Boris gave me an
tarball, but this 'barrier()' add on was nowhere discussed in public.

As the barrier has no obvious value, I'm adding a patch upfront which
removes it.

Thanks,

        tglx





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
