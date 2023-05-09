Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37DF0C77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1NBKBAJy8xg8HsUJ3JGCeOvjG6qJYBNx1iclrCWMCI=; b=BJ28WqUOizO0g4
	5QVPoLcKCfvD5Q+za7ZuqRGkZnjv+DDUjfBpdP2QL/H991jd4qmQit/r0g5ygsYgTVTQoY8BMfc+q
	bqj5jFtkyCtpZ6b4hMr8iokAFj8njVAZVDYM1+kZgO4rYvDHI2rdhzG27n0E88fptPh3VbKjqqJYf
	FHkdPPNp5MSdnZvf5Cnfw6Eiv2KJEc748qgU62wdfwFXF/lMfu/cQAE5plP4Siyul3v/bBNMPbfq3
	SP5Ii4gV9HTyTGWwXO7mwVwbSWe/wzjTn7UkmL9kYziLKM+8/7qgIQwsTGkQTWJnTIaY7+2gdJQ5E
	0sWRJn4ohziGhmJ5neVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM9o-003EQW-3D;
	Tue, 09 May 2023 12:09:29 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwM9m-003EOO-1o;
	Tue, 09 May 2023 12:09:27 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1683634163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JzzIG9diO0rBmRqXNA2vITQ7laniNDqcQjUI61xR0zc=;
	b=yGBgjZXX7JUQf9ai2BxNAcE40QqlbbCZvKDivZ8fc+Ky9mAI/0ueQdDzNtDVuilsrvxJJO
	lJ5mhaodIDGsYlQ0IXQvZ9tZytQody5uNCpERHh6I46d500WQf2vjLSAaSUonj1VM7S27k
	ijKtUP6m6oR8ZuUZRNmjosyunXeQRrX26+o4C4sXaWq1kq0u9zQ+mYZBmKYBPh+6Nuyz6J
	ha7BRefsXdcuOh0ABNgFpkVgNGLsV2g+kzTN5Fz65Tux9qtwNHNwfsc6BXGq7Rw/qb5o8h
	P5C95248r6aRH+rMJbxtb6dCXh+b7CBcpY6Wfvf0ny/k2Ev6eJ3Z3YSX7s1qRw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1683634163;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=JzzIG9diO0rBmRqXNA2vITQ7laniNDqcQjUI61xR0zc=;
	b=fUDzvynzHE21pHjVwgqzy6eWSyFgbVajRkQas+BUCgv8eUYACTe86SoKSEy94dBf+BbPut
	fM8AU/kPvb2mGGDg==
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
In-Reply-To: <20230509103146.GW83892@hirez.programming.kicks-ass.net>
References: <20230508181633.089804905@linutronix.de>
 <20230508185217.671595388@linutronix.de>
 <20230509103146.GW83892@hirez.programming.kicks-ass.net>
Date: Tue, 09 May 2023 14:09:23 +0200
Message-ID: <87jzxh1zbg.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_050926_738233_2343F9E8 
X-CRM114-Status: GOOD (  16.03  )
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

On Tue, May 09 2023 at 12:31, Peter Zijlstra wrote:
> On Mon, May 08, 2023 at 09:43:39PM +0200, Thomas Gleixner wrote:
>> +	/*
>> +	 * Wait for the AP to mark itself online, so the core caller
>> +	 * can drop sparse_irq_lock.
>> +	 */
>> +	while (!cpu_online(cpu))
>> +		schedule();
>> +}
>
> These schedule() loops make me itch... this is basically Ye Olde yield()
> loop with all it's known 'benefits'.
>
> Now, I don't think it's horribly broken, we're explicitly waiting on
> another CPU and can't have priority inversions, but yuck!
>
> It could all be somewhat cleaned up with wait_var_event{_timeout}() and
> wake_up_var(), but I'm really not sure that's worth it. But at least it
> requires a comment to justify.

All of them are gone with the later patches and the control CPU will
just go straight to wait for the completion in the core code.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
