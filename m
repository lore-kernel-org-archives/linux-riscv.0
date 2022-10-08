Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7272FC433F5
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Oct 2022 19:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnpT+9VDI82pF4VWCQ85eSBHuZ4v3A+4+0RYWwKGeLk=; b=R3DmoCuhTeW27y
	zNXNw0C1rs3+fUv4d8khiCGSllMe7o6FtwlBo0pwGhkxzHGxIYkno1R509G9hZ3bDgpbCim6HWMzI
	XlgxN6+iYx8uMGM9Gh2C80mhT9YusS4EJdCWrRclHGypAEQY/xLkJhFLrZvvsJOm5KnbAK9p/YTmB
	w89xD4I741WkwwOJOy71azXMVM2ig3SxZIV6WQM7Kfa7F2dw9ZXEoCoIcRR3r9v1YGdf4kWvLR+z7
	kOJnHF2p+/rViGQNMliTk0y1r6WBk16T59469hH8mwOMqy6Kbah9xYiK0YHgsGgf5q/B8wta8I/Yt
	S/OQvnC3BCxtLkVSe16w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohFbS-00E3il-Er; Sat, 08 Oct 2022 19:35:18 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohFbH-00E3gl-37; Sat, 08 Oct 2022 19:35:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 764F4B80BA9;
	Sat,  8 Oct 2022 19:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0348FC433C1;
	Sat,  8 Oct 2022 19:34:46 +0000 (UTC)
Date: Sat, 8 Oct 2022 15:34:42 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-ia64@vger.kernel.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, openrisc@lists.librecores.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, "Paul E. McKenney"
 <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Thomas
 Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior
 <bigeasy@linutronix.de>, Juri Lelli <juri.lelli@redhat.com>, Daniel Bristot
 de Oliveira <bristot@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Marc Zyngier <maz@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Nicholas Piggin <npiggin@gmail.com>, Guo Ren <guoren@kernel.org>, "David S.
 Miller" <davem@davemloft.net>
Subject: Re: [RFC PATCH 4/5] irq_work: Trace calls to arch_irq_work_raise()
Message-ID: <20221008153442.159b2f2d@rorschach.local.home>
In-Reply-To: <20221007154533.1878285-4-vschneid@redhat.com>
References: <20221007154145.1877054-1-vschneid@redhat.com>
	<20221007154533.1878285-4-vschneid@redhat.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_123507_325858_3A190266 
X-CRM114-Status: GOOD (  15.26  )
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

On Fri,  7 Oct 2022 16:45:32 +0100
Valentin Schneider <vschneid@redhat.com> wrote:
>  }
>  
> +static inline void irq_work_raise(void)
> +{
> +	if (arch_irq_work_has_interrupt())
> +		trace_ipi_send_cpu(_RET_IP_, smp_processor_id());

To save on the branch, let's make the above:

	if (trace_ipi_send_cpu_enabled() && arch_irq_work_has_interrupt())

As the "trace_*_enabled()" is a static branch that will make it a nop
when the tracepoint is not enabled.

-- Steve


> +
> +	arch_irq_work_raise();
> +}
> +
>  /* Enqueue on current CPU, work must already be claimed and preempt disabled */

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
