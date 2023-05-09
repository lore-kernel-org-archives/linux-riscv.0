Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2126C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OwerNN3c/YXGp4Rgtnh4G6ZtXDkhIJgeGM1A/zWd5xI=; b=WLvNjqJWX7wjLG
	Ol+PD5WpVOgcQLDwo9kzd/SbdyVAY+3+DRVghwrvkk60Xvcql3XNKRaLc6MAERr3yGZhqoek24Ntt
	eMsRXkELtBBGLf3vfhKBCHcRk/VR4i0KPNgR/TyTX3pfj/mBtCwDOeYiITMBr7o8ni8VRdYA022DG
	2iKdTMf6g8Q6v2qe5YYNX26T0lZa2kDf+EkOhF+hyd1p4cv37FpZuv7waZQPd00aSTlmctPYvcJBz
	HlIiQ3heLh/zsLpbiWVPo9a5meb5hw2nMEeHdZMvMkP+6FWwdgzLV+ShXqFM9ucxD0kAptH+EFiin
	slpyVjlzg3UlWoUbi4Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM99-003EEk-3C;
	Tue, 09 May 2023 12:08:47 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM98-003EDH-1U;
	Tue, 09 May 2023 12:08:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:Message-ID:
	Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=auvnPlCdrxbwfVCryOkTHE8CzjY0504gnLY8d2dRonQ=; b=fSyCifjmTxsHnkoflxwFQeSyAl
	mUUTEuogjrtzLCtv1mjuvQBOXj/0tid0MG7YohtTLOtxBsAM3Wnb8pCyCAk62V2wxQvncTNyTDx1M
	Va+rXomYJT6iR1QNrWUdB2IbGiQ8XGDF9955KRdQxk87KvObdw8vlMPU8Qo4BQikhJqQhyvqnlgQH
	Tx3CJuQUvVSy4teradOTmPhBIW35h+E9owCsbH6wYPFWO777J5pMXr1ddihzrl4ZyiBg0CN4yTrEp
	xNY49LzitVjiFDQyT3YQmjCSVBfix08tbop+0ToL74C+7bcDtsQPRNGmtWtOphfcLmRJkRTyX4ocn
	PJEGfqMQ==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM8x-0067cU-2n;
	Tue, 09 May 2023 12:08:37 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auvnPlCdrxbwfVCryOkTHE8CzjY0504gnLY8d2dRonQ=;
	b=wafQfE3T818swYq6uLvh8KHiTe44B+AlTcCuev0YTvhSecK7fkanUUlrOFuq1HA2ASd8t+
	BU6tHwwDMQA0mZaxMylheStrGpAitYQ7e4+1xdIBRK50qlGuPKGUbpzNoPFc/U7pFg4vp7
	3txn/u3LsCuYBQ0eNUlaTm7ZlGVH1WlsNSZfP3xwKGSzwPqUJorHyzC7YM1MHYvCO7Lmx3
	BiJQOvEs+Zr/r7cQvp3o3X/HSCezUruhmuDtMYKpw4lmxWL4y4XK9Xj0Ms0sscYlMfQk/M
	8L9/ObIQjuOr/DXSdupvrplmykX+MkwMcI4Kqk1nxIkYGFdBkt+5ECVVyItbUg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=auvnPlCdrxbwfVCryOkTHE8CzjY0504gnLY8d2dRonQ=;
	b=iQxVDqhAuaPEJSQzwxbX/REaKwQ08dwCm2L5m3NrRVeFnmsUvKPu/IfGcUkN/jYTMsh6S3
	yqlu1nzMP1/UIxCA==
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
In-Reply-To: <20230509101902.GV83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509101902.GV83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:08:31 +0200
Message-ID: <87mt2d1zcw.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_130836_100991_0982E182 
X-CRM114-Status: GOOD (  16.08  )
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

On Tue, May 09 2023 at 12:19, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
>> @@ -1048,60 +1066,89 @@ static int do_boot_cpu(int apicid, int c
>
> 	/*
> 	 * AP might wait on cpu_callout_mask in cpu_init() with
> 	 * cpu_initialized_mask set if previous attempt to online
> 	 * it timed-out. Clear cpu_initialized_mask so that after
> 	 * INIT/SIPI it could start with a clean state.
> 	 */
> 	cpumask_clear_cpu(cpu, cpu_initialized_mask);
> 	smp_mb();
>
> ^^^ that barrier is weird too, cpumask_clear_cpu() is an atomic op and
> implies much the same (this is x86 after all). If you want to be super
> explicit about it write:
>
> 	smp_mb__after_atomic();
>
> (which is a no-op) but then it still very much requires a comment as to
> what exactly it orders against what.

As this is gone a few patches later, I just be lazy and leave it alone.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
