Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C321DC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 18:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GXXjMSRkZEx6nzpGdUdJCYPI4I5f2tv0ttYCg/T71GM=; b=IjNFVGd5XtYDEs
	xQnyfnRXtMzREj6Bz7a6uTtQ+J7IwkGAYhmQ3DllXgnhSEPLJd99UdIJVq6sX6aP/gm42q/r+KnVK
	489TLkaEyytbR4NWxlDM3z7fZjNJq89gbY8BCnDvgEygonO/f4VT7yJEcLBGYngWJSABJwyFd2IXB
	bJ0o1+5degylfVUBKJ7SfP/LlC9b86nawUh2OjXkpOCOybkt5pk+tiVl6lJAhM+Pz/67wmlPO091T
	52juOet+3DlUPkC3beU06Nl/BO601IqR66UVe/1u8suNsLedxt1dc0PXkYJ+S9cFV625nLh8v3RLT
	vlCGbVo1sCmaQgk9abbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRgY-003xcF-0P;
	Tue, 09 May 2023 18:03:38 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwRgU-003xbS-2l;
	Tue, 09 May 2023 18:03:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683655413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8lMKg/Pl8bB6qnYC08+nBqTm61HWmUyuaLIaj1gFuQ=;
	b=p/DT4GAI2EtIvZG/E48g6Y7O0PSW6I7fXi+Elpt8is0SHczyNHYG4WQo1p8SYYocLErxKG
	tmvgrxjIF+UxfScN840YPnkbKctQmYUakhWVsbINnsqgaMlRICOjt3Qfc6Up2X1bjDtoAO
	ar+k+iD6nwCsxY3BjhAFgFJUIEJHTt1PrRE8rbODQZgYjBKNgq6ykZLI1Uu1z7pabrzvU3
	BwVO+gXxHyh4uHTSjhXVxYRN+IF1E8Jy0qeflsgMafTVMfAIUm1oLIOiNDcRtX6ADo3QXJ
	K1YoDfr+wSZLKitYMptlFZ4BJxPZWh1AEKhWq/8P8VH08qDCjiggV3Xig5/J1w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683655413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=H8lMKg/Pl8bB6qnYC08+nBqTm61HWmUyuaLIaj1gFuQ=;
	b=o/GeRRk5OesDmJnkkrzpp/P4MfatYoS6Fv9RucWpaz9lKWhE91kzNOmkETuNZ878NLl+Jz
	nDab+Y4hdtD/OPAA==
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
Date: Tue, 09 May 2023 20:03:32 +0200
Message-ID: <87lehxz8jv.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_110335_060428_CB4AE4F3 
X-CRM114-Status: GOOD (  16.81  )
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
> Again, not really this patch, but since I had to look at this code ....
>
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

Won't bother either as that mask is gone a few patches later.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
