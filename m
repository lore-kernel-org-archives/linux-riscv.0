Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53FCFD0D791
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 13:42:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QGdezAr7TBk58atJawIQrq5BDLohRjNW4qHM9JZlAyQ=; b=sB0Fx/HPwtB5/j
	6S6m0CYBlWcGTlCc29kZOmzbEEglFAqgDrAceEyI23TInts7wPsP+hT0UxRehHTlaVx7b+FuXDUg6
	7HGXhlQkjlauieT+DdDinAaNmi1Upm8YJ/jw6TIdcLZyfvwwca5Zrbx2EyCirtWPV7aklfoit9u9h
	WWcr04ajre9VG6nmaZCJ4+glJxD+9Bmjn6Fp/9fY6Yght+uJcuJgK3gxLv74BH2yGmVuaxrxSNE7G
	VLedp31Fr9OzLabOcl/M5Daob24T52rs11S81T/xQj3ts+bH043qB6y8QhZK5RvClsVkso4xkZjT8
	9lZYK8JySMP3xAnHwbmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szFuK-0000000GU4v-3WTN;
	Fri, 11 Oct 2024 13:42:16 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szFfh-0000000GRmv-3by4;
	Fri, 11 Oct 2024 13:27:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EBDC7A444B4;
	Fri, 11 Oct 2024 13:26:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1D23C4CEC7;
	Fri, 11 Oct 2024 13:27:04 +0000 (UTC)
Date: Fri, 11 Oct 2024 09:27:14 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>, Will
 Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui
 <kernel@xen0n.name>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen
 N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>
Subject: Re: [PATCH v3] ftrace: Consolidate ftrace_regs accessor functions
 for archs using pt_regs
Message-ID: <20241011092714.71074a2b@gandalf.local.home>
In-Reply-To: <Zwj9QocrEVtgraHp@arm.com>
References: <20241010202114.2289f6fd@gandalf.local.home>
	<Zwj9QocrEVtgraHp@arm.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_062710_016210_8977AD8B 
X-CRM114-Status: GOOD (  13.20  )
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

On Fri, 11 Oct 2024 11:26:10 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Thu, Oct 10, 2024 at 08:21:14PM -0400, Steven Rostedt wrote:
> > diff --git a/arch/arm64/include/asm/ftrace.h b/arch/arm64/include/asm/ftrace.h
> > index bbb69c7751b9..5ccff4de7f09 100644
> > --- a/arch/arm64/include/asm/ftrace.h
> > +++ b/arch/arm64/include/asm/ftrace.h
> > @@ -54,6 +54,7 @@ extern void return_to_handler(void);
> >  unsigned long ftrace_call_adjust(unsigned long addr);
> >  
> >  #ifdef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> > +#define HAVE_ARCH_FTRACE_REGS
> >  struct dyn_ftrace;
> >  struct ftrace_ops;
> >  struct ftrace_regs;  
> 
> In case you need an ack for the arm64 change
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks, appreciate it.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
