Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08228CEF148
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 10:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hosKEij3FGzaOCljiLmkzfbg/qC5nb7Rb2IFUQwM8xw=; b=WaH4X4yZeVWPAU
	yGMTy9sg823WVRX+hHWWtXfVLcRg3kxBDAcY/wtfTil3syxPP5iw1TIpfata0UvshcybXGWfO4O7P
	sg+2jHhCKa/bqdYNClDQDttVpQNd+IafATy+dOmh4DnpxfnHsYvDxWurjZsr/0AClG+TC6dPMjZkH
	QhEoMlPBLXwnqisW6kMM7Oci4Pi6XdisdkWobgtUqvrZD1ZLnHxUsp08bo8ES6FO71QCfeqegk7UR
	lR8ksXoqOmU3zjZLrPPTZOB/M6ABY6FLv3ntoamJcKn608ogqb4ZPT4UWIjEg/NKLi9TyedLFj0xP
	7fV9xKw+L8DuslJNbARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy77H-00000005PZr-2F02;
	Tue, 08 Oct 2024 10:06:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy74Z-00000005P55-22Nv;
	Tue, 08 Oct 2024 10:04:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 43C2FA42600;
	Tue,  8 Oct 2024 10:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49794C4CEC7;
	Tue,  8 Oct 2024 10:04:00 +0000 (UTC)
Date: Tue, 8 Oct 2024 11:03:57 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Linux Trace Kernel <linux-trace-kernel@vger.kernel.org>,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"x86@kernel.org" <x86@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <ZwUDjbrYZNC7HLZS@arm.com>
References: <20241007204743.41314f1d@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241007204743.41314f1d@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_030407_627503_43E28C9A 
X-CRM114-Status: GOOD (  15.96  )
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

On Mon, Oct 07, 2024 at 08:47:43PM -0400, Steven Rostedt wrote:
> From: Steven Rostedt <rostedt@goodmis.org>
> 
> ftrace_regs was created to hold registers that store information to save
> function parameters, return value and stack. Since it is a subset of
> pt_regs, it should only be used by its accessor functions. But because
> pt_regs can easily be taken from ftrace_regs (on most archs), it is
> tempting to use it directly. But when running on other architectures, it
> may fail to build or worse, build but crash the kernel!
> 
> Instead, make struct ftrace_regs an empty structure and have the
> architectures define __arch_ftrace_regs and all the accessor functions
> will typecast to it to get to the actual fields. This will help avoid
> usage of ftrace_regs directly.
> 
> Link: https://lore.kernel.org/all/20241007171027.629bdafd@gandalf.local.home/
> 
> Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
> Note, I tried to cros-compile the affected architectures,
> but my builds failed for 32 bit powerpc and s390 (without this patch).
> It mostly compiled, and the affected files seemed to build.
> 
>  arch/arm64/include/asm/ftrace.h          | 20 +++++++++--------
>  arch/arm64/kernel/asm-offsets.c          | 22 +++++++++----------
>  arch/arm64/kernel/ftrace.c               | 10 ++++-----

For arm64:

Acked-by: Catalin Marinas <catalin.marinas@arm.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
