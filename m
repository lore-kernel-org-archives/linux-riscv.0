Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 223DBC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 May 2023 09:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MXNS6ddlmLlog6rxXBAne9VMz44+pqN6g4xbOJbdRJY=; b=4Ek0FNknpJkXye
	+G2xlqW6nHnAr3hmLBCBaVsbnsMMUpRyJ8aGZ7jvdOpHIHcTH3KCEbA168ZHtK7OGGes08/vWtZLu
	yJyKKFxvoBJd+6lNzMwqgYLOM4slddPCxfFYbmUH65eFP0bSiwzOo7pgiJSA7kFmTp2EZElndfJQV
	rW3EJI/weRi1OPbY/9Ej8Zh6CkpaCm6odWEqc3tQVicK1sb8Fvs3uG7shagx4f+M3O0oA5HOncw1i
	bnHWLOnPKcjQEvODkPlIysxQCPSdFz/Gkq+lVHT8TINWfOGFwNvOZSvmXbB/jV/q15XBDBHMHqRZr
	/Wx2WxlZwjj3cah6N/rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vcT-00D9iC-1D;
	Tue, 30 May 2023 09:26:21 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3vcP-00D9g5-2q;
	Tue, 30 May 2023 09:26:19 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1685438774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OuP6yOSR9XWm7UsYO6pZdZmKv2tnQHjp+lm/v984YCA=;
	b=4M9Rhxb+Ak3/yFJgB1S859CSZLFWoXOP0uMTWtvEKyHSLqPJWzDtmdPw+nD7OakjHwTvL9
	3H4QTINZn7/MOdikwDWln06pYSfL8jvb0I5oZP0DesRNI92ni3zwbDzgSLSlL/Pu5A7ayE
	rYYGLRlzgJx7Mzzdxn0P+XOLdusRXdTLu2ZGz+x2RQA5bSNBrZJT2AeE+kvVPAgUR6estR
	vY+t9gmb5UEUwYCeoMX6kP4VPGvNBn7Lz23Yllf7oRg5tOfqRvkOxsk2p5mTi2eG6HqWL4
	i7ehXbcRL2W2gE3TOlBREPsOXH6v8kr/26nERrHEOZ95S6/lVpsHxw/6/+/DQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1685438774;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OuP6yOSR9XWm7UsYO6pZdZmKv2tnQHjp+lm/v984YCA=;
	b=HcG/D4NiqXeHLfwKoko4UyTPezLO1CVsxR+RlJLjEUh5/8YeL4Jf/2ZxSLH+TzNJfOKKZT
	r4jRkltXrdP6XoDg==
To: "Kirill A. Shutemov" <kirill@shutemov.name>
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
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, linux-parisc@vger.kernel.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Mark Rutland <mark.rutland@arm.com>,
 Sabin Rapan <sabrapan@amazon.com>, "Michael Kelley (LINUX)"
 <mikelley@microsoft.com>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [patch v3 31/36] x86/apic: Provide cpu_primary_thread mask
In-Reply-To: <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
References: <20230508181633.089804905@linutronix.de>
 <20230508185218.962208640@linutronix.de>
 <20230524204818.3tjlwah2euncxzmh@box.shutemov.name> <87y1lbl7r6.ffs@tglx>
 <87sfbhlwp9.ffs@tglx> <20230529023939.mc2akptpxcg3eh2f@box.shutemov.name>
 <87bki3kkfi.ffs@tglx> <20230529203129.sthnhzgds7ynddxd@box.shutemov.name>
Date: Tue, 30 May 2023 11:26:03 +0200
Message-ID: <87pm6ijhlg.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230530_022618_072373_1B2DF372 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

On Mon, May 29 2023 at 23:31, Kirill A. Shutemov wrote:
> Aaand the next patch that breaks TDX boot is... <drum roll>
>
> 	x86/smpboot/64: Implement arch_cpuhp_init_parallel_bringup() and enable it
>
> Disabling parallel bringup helps. I didn't look closer yet. If you have
> an idea let me know.

So how does TDX end up with actual parallel bringup?

	if (cc_platform_has(CC_ATTR_GUEST_STATE_ENCRYPT)) {
		pr_info("Parallel CPU startup disabled due to guest state encryption\n");
		return false;
	}

It should take that path, no?

Thanks,

        tglx


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
