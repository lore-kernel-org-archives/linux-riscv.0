Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E5A1D5C0E4
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzHwTGECVH1cVBIvmkl0wkMBIo9HfQrCiQZawm0Tf9g=; b=epPEEMKAP80ZVt
	sRQ5yDCLXdGyKkRXni/Pqel5oNT43zVxtfmsEekNq3RSovfsLxWYSJo8QBp0Nbfk04Sa91UcnmnEH
	D7i7wlws/n4Anft3oNc9oeHKv1qfii2vxdtuJhT2VN7I37Fkp14Ago2NY6MNYWMYSRK3Jzk9T4TO1
	y0JNrXXYd2PgMd8hpvTd4wrJ1SM4yUsji6tDM5G/ozAX/LRt761o301ZzZYPHxW29x37Fxy27IAnT
	BpCrZ0jLaNRgHQY+6yWbDsgFIcMCBliYMI4fnaCt0v9aobBAgPerKlh6NVa75kWvERvxbKBLZl45u
	lcoWQlaJVLhx+L0fRt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9QXQ-0000000AxNI-1C4R;
	Fri, 08 Nov 2024 15:04:40 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9PvH-0000000AqBQ-2eVp;
	Fri, 08 Nov 2024 14:25:19 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1731075911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+f+g8yyOKXMQlbG8MpvRrvh4tIxLok0rEAYYuf18pU=;
	b=TAmLIgJpFi3WYWagfHvvZLAAirgZXLul++2EA0xNzLlguNFCXkuNJTpfHNo69/tyI8iOQg
	u4vLFaU7ceFS/iJcWPNqKOQUlm2pysPD3aoU/TClqt+39Nz5Y0kWGOGhLQeX2ZKEaluvX7
	JrFFbixe2hezzdMtdwmRw+Mm/Mg0eoiw8AdWn8T0VHbVO2fBuftlG4I5TkyBjYHjxurTBW
	WPvm4i8miTfv9X6bPrBoFZRtSiKtjorssIDWzxQ/wC7gTIqCeMwplVMFDMlGu3C6JC0MYz
	3ECnyr7+hH5tijyg0p6vRJtVJ1V7xWwN+rOmq60anQwvSzqzIVmDRCYZPzF3KQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1731075911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=v+f+g8yyOKXMQlbG8MpvRrvh4tIxLok0rEAYYuf18pU=;
	b=jj/8EwA6cJ5MUQOonh7MRj4YYMI1ZD0f2sju/5TUx8FC8GyPnd68uaGGplLfknboD/bc7G
	2i/uKKIRBVnxttBA==
To: David Wang <00107082@163.com>, richard.henderson@linaro.org,
 linux@armlinux.org.uk, catalin.marinas@arm.com, will@kernel.org,
 guoren@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
 James.Bottomley@HansenPartnership.com, deller@gmx.de, mpe@ellerman.id.au,
 paul.walmsley@sifive.com, ysato@users.sourceforge.jp, dalias@libc.org,
 glaubitz@physik.fu-berlin.de, davem@davemloft.net, andreas@gaisler.com,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, chris@zankel.net, jcmvbkbc@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, David Wang
 <00107082@163.com>
Subject: Re: [PATCH] kernel/irq/proc: performance: replace seq_printf with
 seq_put_decimal_ull_width
In-Reply-To: <20241103080552.4787-1-00107082@163.com>
References: <20241103080552.4787-1-00107082@163.com>
Date: Fri, 08 Nov 2024 15:25:13 +0100
Message-ID: <87r07lol9y.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_062515_841188_789AD691 
X-CRM114-Status: UNSURE (   6.60  )
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

David!

On Sun, Nov 03 2024 at 16:05, David Wang wrote:

$Subject: [PATCH] kernel/irq/proc: performance: ...

That's not a valid subsystem prefix.

> seq_printf is costy, when stress reading /proc/interrupts, profiling indicates
> seq_printf takes about ~47% of show_interrupts samples:

Also please follow the documentation for denoting functions in change
logs:

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#function-references-in-changelogs

>  arch/alpha/kernel/irq.c     |   8 +--
>  arch/arm/kernel/smp.c       |   4 +-
>  arch/arm64/kernel/smp.c     |   3 +-
>  arch/csky/kernel/smp.c      |   4 +-
>  arch/loongarch/kernel/smp.c |   2 +-
>  arch/parisc/kernel/irq.c    |  34 ++++++------
>  arch/powerpc/kernel/irq.c   |  44 ++++++++--------
>  arch/riscv/kernel/smp.c     |   3 +-
>  arch/sh/kernel/irq.c        |   4 +-
>  arch/sparc/kernel/irq_32.c  |  12 ++---
>  arch/sparc/kernel/irq_64.c  |   4 +-
>  arch/x86/kernel/irq.c       | 100 ++++++++++++++++++------------------
>  arch/xtensa/kernel/irq.c    |   2 +-
>  arch/xtensa/kernel/smp.c    |   4 +-
>  kernel/irq/proc.c           |   6 ++-

There is no dependency on these changes. So please split them up into
seperate patches for core and the individual architectures.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
