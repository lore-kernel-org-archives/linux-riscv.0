Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C45C5C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 17:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ed3B5HShV7Rb4yx7B2uohpt5cR9C4cnKW4M1d5AD0oQ=; b=IRowl7tedBgPZa
	VGZWIreOaXt/BBmggNurJPgRTwDV5t5k9m/nauiOb5piPf2/VH2gkuUot+A/ZbS+GPSKFo+4FqLdR
	p+pngy7NKaQXvQknhCU5ytnGjjgtqTnjEjfGvPCbBwb9va0dUn2BrGuUie7fEwqLbET5QgLYX6yM5
	7f4GMrUNb97xtP5e2QIIsd4JeU7s3DlPrWGMCcNggq1YzNcSi4vToGj9Sq9ArNTbH8ES7ADKPxTv6
	0F+VPZKFb4ENGsv6mnCnXbxx6Mpw+LD3zGpqJn+6X+iEsx5PhKz7nT/DGQzGHyc+pMVDN1L2O+Nv2
	lMjsSpdKxztL1Gp0mmKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Dgt-0000000AIyc-3VEQ;
	Wed, 01 May 2024 17:24:23 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Dgr-0000000AIxy-0ozI
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 17:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA705CE1151;
	Wed,  1 May 2024 17:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 622E2C072AA;
	Wed,  1 May 2024 17:24:14 +0000 (UTC)
Date: Wed, 1 May 2024 13:24:58 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
 <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, "James E.J.
 Bottomley" <James.Bottomley@HansenPartnership.com>, Helge Deller
 <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
Message-ID: <20240501132458.3ea28f6b@gandalf.local.home>
In-Reply-To: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_102421_442329_18FE2888 
X-CRM114-Status: GOOD (  18.48  )
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

On Wed,  1 May 2024 09:29:56 -0700
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> If an error happens in ftrace, ftrace_kill() will prevent disarming
> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
> freed, yet the kprobes will still be active, and when triggered, they
> will use the freed memory, likely resulting in a page fault and panic.
> 
> This behavior can be reproduced quite easily, by creating a kprobe and
> then triggering a ftrace_kill(). For simplicity, we can simulate an
> ftrace error with a kernel module like [1]:
> 
> [1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer
> 
>   sudo perf probe --add commit_creds
>   sudo perf trace -e probe:commit_creds
>   # In another terminal
>   make
>   sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
>   # Back to perf terminal
>   # ctrl-c
>   sudo perf probe --del commit_creds
> 
> After a short period, a page fault and panic would occur as the kprobe
> continues to execute and uses the freed ftrace_ops. While ftrace_kill()
> is supposed to be used only in extreme circumstances, it is invoked in
> FTRACE_WARN_ON() and so there are many places where an unexpected bug
> could be triggered, yet the system may continue operating, possibly
> without the administrator noticing. If ftrace_kill() does not panic the
> system, then we should do everything we can to continue operating,
> rather than leave a ticking time bomb.
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
> Changes in v3:
>   Don't expose ftrace_is_dead(). Create a "kprobe_ftrace_disabled"
>   variable and check it directly in the kprobe handlers.

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

Thanks,

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
