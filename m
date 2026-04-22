Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EA9F94CBE
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 22:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Content-ID:MIME-Version
	:In-reply-to:Subject:To:From:Reply-To:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=RyeZzPujy14lbIo317MpNLTgqtMpTQWYfnXdyjrXV+8=; b=Qlc+7W/uigEjgq
	kFTw7bVIOKW+NIAcLuXfrq5nvLU2psJe+ISBs/j8p0S65Zp4Q0NC6t5kR0hMBHYXVgBDFqn/axNpq
	2nqjO14GchQHK9RP0BPNKOJHNFAD6t1sypmCmdp44O4uHqL6jZLh388HK6xn+xEBHZNmlE0z/zfHb
	J5Au4//W5Cd5CiUeDFY8wcqN2I3xvtDrjhVjl4yRXDwhlzX8ZO1YRV4qwNKdjR7euZBSog5IRLxel
	rqFaJh86OVjRbP1GXumjLVKeSlMXcMYWAPOpnOQZaI/I6NUUXDhv93iFfmfCaVVCoj1eQuw9LRC7o
	HOci0pph6dIhTwbBwKRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFgAL-0000000Anq8-3S5g;
	Wed, 22 Apr 2026 22:35:29 +0000
Received: from smtpauth.rollernet.us ([2607:fe70:0:3::d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFgAJ-0000000Anpn-05H0
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 22:35:28 +0000
Received: from smtpauth.rollernet.us (localhost [127.0.0.1])
	by smtpauth.rollernet.us (Postfix) with ESMTP id EBF502800405;
	Wed, 22 Apr 2026 15:35:22 -0700 (PDT)
Received: from mailhub.fnord.greeley.co.us (mailhub.fnord.greeley.co.us [129.146.138.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtpauth.rollernet.us (Postfix) with ESMTPSA;
	Wed, 22 Apr 2026 15:35:06 -0700 (PDT)
Received: by mailhub.fnord.greeley.co.us (Postfix, from userid 10)
	id C0B1B2DF; Wed, 22 Apr 2026 22:35:05 +0000 (UTC)
Authentication-Results: zarathud.internal.fnord.greeley.co.us; dmarc=fail (p=none dis=none) header.from=fnord.greeley.co.us
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=fnord.greeley.co.us;
	s=2024q2; t=1776897271;
	bh=GOiIbUMSW+shVQwKPptWwq3X3FqenNWCLHvQ3Gv9j8Q=;
	h=From:To:cc:Subject:In-reply-to:Date:From;
	b=E1rUsaNWliTkrgWsGftpQYuHC/qeyuLHJ3Nh8WAHTD+UNuXbHD5QPCYahmwXWCjG5
	 ZvPujYddylcWE5r2w0LO3O4Uq0NrvXDc6H52DY3xFfDfYpH59bCjxYgrFPJWIFI8Tn
	 uRtOFwfqT3uclB4ENnEAnVO6kPu65k19K/FrEfHY9kSlXtb1AsfMKCqQEKpKjjJLPJ
	 O8Bh0Z9Tlwkr4r4XQ0a9oj/SkMGxmIjtt27zonDjLE2Ms+nhYHQXkB1fUxk+yGV6t0
	 se4Xll30z5jSHPb7zNHT2+1GtUv27pbRUBbFdcv5ckOWR26G13WTRp9gyNCjwqD4iF
	 Y46qDR4dwcm3A==
Received: from zarathud.internal.fnord.greeley.co.us (unknown [IPv6:2001:470:3924:1000:50c6:bdff:fea1:ac49])
	by zarathud.internal.fnord.greeley.co.us (Postfix) with ESMTP id AE2223B5A;
	Wed, 22 Apr 2026 22:34:31 +0000 (UTC)
From: "Aaron D. Johnson" <debbugreporter@fnord.greeley.co.us>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [Patch] PCI/MSI: Handle lack of irqdomain gracefully
In-reply-to: Your message of "Wed, 22 Apr 2026 23:22:11 +0200."
             <87qzo61yik.ffs@tglx>
MIME-Version: 1.0
Content-ID: <3447710.1776897242.1@zarathud.internal.fnord.greeley.co.us>
Date: Wed, 22 Apr 2026 22:34:31 +0000
Message-Id: <20260422223431.AE2223B5A@zarathud.internal.fnord.greeley.co.us>
X-Rollernet-Abuse: mailto:abuse@rollernet.us https://www.rollernet.us/policy
X-Rollernet-Submit: Submit ID 10466d.69e94d1a.7a43e.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_153527_069444_7CA1C1F9 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Bjorn Helgaas <helgaas@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, 1127635@bugs.debian.org, Paul Walmsley <paul.walmsley@sifive.com>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, linux-riscv@lists.infradead.org, regressions@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thomas Gleixner writes:
> Aaron, can you please apply the patch below and see whether it fixes
> the issue and provide the dmesg with the output of those
> pr_warn()'s?

I can build it.  But as stated earlier, the machine is no longer in my
possession.  If it comes back, (and it might -- its new owner is
having problems supplying sufficient input power in his apartment), I
will be happy to test patches.

> The other information which would be useful: When you boot a kernel
> with the commit reverted and look at that OHCI controller with lspci
> -vvv then you should see whether it has MSI enabled or not. If it
> has MSI enabled, then please provide the output of
>
>    /sys/kernel/debug/irq/irqs/$IRQNR
>
> You need to enable CONFIG_GENERIC_IRQ_DEBUGFS for that.

Noted.  And thanks for the time looking into it.

- Aaron

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
