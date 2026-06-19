Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F821CD98F6
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jun 2026 23:55:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s5ocHf7f5XJPsMX7UQi8fXlpi6+LOYnAkmYDGzM6Q/I=; b=P78koqU4+aHx3H
	yn3HeH/R5VvrenYa8zHU3AolQZZhnRUv231jhxuDOlpMA5CFxV539TfEgye6R8WjtM76NHcO05CdT
	II01nyldhgbfiMmVKhWYApcAY4EMZL820OI+7kjPH+SimUucQJaNlXEWg2LsXuR2C/V628/CSr1uW
	VCaDlPtrN1jtTEOXaXLYqSePl2WpyNFvECISToiklbcExPTnLNkQHAgWO8O/RwsPZrE6A60jjBshu
	IEsqgvBhBbX5rowl5Otmw6HeoijIyrSOIL0KQaoPlDpTZdfhAikVsIvlmksO/l/GmRSHxQk2RTawa
	8X33UO/d9tA2gVWPDTig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waj32-000000035t0-1QEu;
	Fri, 19 Jun 2026 23:54:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waj31-000000035ss-08s7
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jun 2026 23:54:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1746A41B74;
	Fri, 19 Jun 2026 23:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF6ED1F000E9;
	Fri, 19 Jun 2026 23:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781913293;
	bh=T2U6mD5Mi888Hcm8xp1sqPPOMOUnXskbr2jM/AcqYN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MFSFWYrMI30DpGUYSviB3mF0oMxLpUDKjrBft2OtFxA5uWy0f01420l8cek0mMKZm
	 SPBoIfC1iKg02qhAv6VtWy2neMROUeTEPxOE3SLlr/WZ/N7wgLVl910xr3NObOx+Ub
	 8vT92jPm0m5RzKdtlZM++nW7awockcRqxBZlg4s03nT1z3hwSSje+94MrTRPc6yDAV
	 xutiuMxLRaImQGCgxbm0wP5QbIsg2dcQAapoHOGx2j8FYUuGxtQwgYEzT/AnVSKtme
	 uhaMtdDBzVia1xtMuLlxV5mfVa/ZLQ3XAZTTOnxcYeBjYqLv/5Ixk1+duLPC0tHkeR
	 pKwQXvtH2vAKw==
Date: Fri, 19 Jun 2026 16:54:53 -0700
From: Kees Cook <kees@kernel.org>
To: guoren@kernel.org
Cc: arnd@arndb.de, palmer@rivosinc.com, tglx@linutronix.de,
	peterz@infradead.org, luto@kernel.org, conor.dooley@microchip.com,
	heiko@sntech.de, jszhang@kernel.org, lazyparser@gmail.com,
	falcon@tinylab.org, chenhuacai@kernel.org, apatel@ventanamicro.com,
	atishp@atishpatra.org, mark.rutland@arm.com, bjorn@kernel.org,
	palmer@dabbelt.com, bjorn@rivosinc.com, daniel.thompson@linaro.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, stable@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: Re: [PATCH] riscv: entry: Fixup do_trap_break from kernel side
Message-ID: <202606191652.38297DE51@keescook>
References: <20230702025708.784106-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230702025708.784106-1-guoren@kernel.org>
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

*thread encromancy*

On Sat, Jul 01, 2023 at 10:57:07PM -0400, guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> The irqentry_nmi_enter/exit would force the current context into in_interrupt.
> That would trigger the kernel to dead panic, but the kdb still needs "ebreak" to
> debug the kernel.
> 
> Move irqentry_nmi_enter/exit to exception_enter/exit could correct handle_break
> of the kernel side.
> 
> Before the fixup:
> $echo BUG > /sys/kernel/debug/provoke-crash/DIRECT
>   lkdtm: Performing direct entry BUG
>   ------------[ cut here ]------------
>   kernel BUG at drivers/misc/lkdtm/bugs.c:78!
> [...]
>   Kernel panic - not syncing: Aiee, killing interrupt handler!

This appears to still be unfixed. What's the blocker? The solutions in
this thread seem to work...

I'd like to be exercising an Oops path via KUnit (for KCFI), and riscv
just instantly falls over instead of thread-killing on the exception.

Thanks!

-Kees

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
