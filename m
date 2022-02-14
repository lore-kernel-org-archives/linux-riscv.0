Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 718C8C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 20:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nsBFUqjGkno4/xYER1ME0gAPH6OBjkI0Cs8i1xs3WZI=; b=ZQHssfC8bfkdGf
	Qd8LFiODCzDPVAk+AIj3FzL5afYroW6L56cvnfxrV//RBNKfN4geBr0IfzOTcxdkt0SV3vmU3d0Au
	QGGRIhT+b670w4kJi1ZuCamIefIqdeO5HYn7/mpxU5fT5ldA9GcBqP9cbza/o58Bc05p5XNE4J74Q
	NA22bx6Q540UeSITzryRTQ5Nh4uoTLfCmOedakwccj0lSoEKC0PShAnF74dnnP2tXnQVOHuXr7raJ
	LxNhQoLMjjn9Q7ddiEKs+cbiUeG/hDcsSMKaeXTjeNs1OnTN1XlKpp+cr7e938OMpy0If9Gj1K+2N
	sNQW0i3fOgPXtoGGMQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJhaQ-00GmKE-L6; Mon, 14 Feb 2022 20:04:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJhaO-00GmJa-Gy
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 20:04:37 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nJhaN-0002kA-Bs; Mon, 14 Feb 2022 21:04:35 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Tsukasa OI <research_trasio@irq.a4lg.com>, linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Atish Patra <atishp@rivosinc.com>, Tsukasa OI <research_trasio@irq.a4lg.com>
Subject: Re: [PATCH v3 2/3] RISC-V: Minimal parser for "riscv, isa" strings
Date: Mon, 14 Feb 2022 21:04:34 +0100
Message-ID: <1805541.PHm1U2SkZS@diego>
In-Reply-To: <ff0494c3ca0115b73a0c201a283a85021b3b6b31.1644647398.git.research_trasio@irq.a4lg.com>
References: <ae93358e-e117-b43d-faad-772c529f846c@irq.a4lg.com>
 <ff0494c3ca0115b73a0c201a283a85021b3b6b31.1644647398.git.research_trasio@irq.a4lg.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_120436_599940_E42E3656 
X-CRM114-Status: GOOD (  13.31  )
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

Am Samstag, 12. Februar 2022, 07:30:00 CET schrieb Tsukasa OI:
> Current hart ISA ("riscv,isa") parser don't correctly parse:
> 
> 1. Multi-letter extensions
> 2. Version numbers
> 
> All ISA extensions ratified recently has multi-letter extensions
> (except 'H'). The current "riscv,isa" parser that is easily confused
> by multi-letter extensions and "p" in version numbers can be a huge
> problem for adding new extensions through the device tree.
> 
> Leaving it would create incompatible hacks and would make "riscv,isa"
> value unreliable.
> 
> This commit implements minimal parser for "riscv,isa" strings.  With this,
> we can safely ignore multi-letter extensions and version numbers.
> 
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> [Improved commit text and fixed a bug around 's' in base extension]
> Signed-off-by: Atish Patra <atishp@rivosinc.com>
> [Fixed workaround for QEMU]
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>

Tested-by: Heiko Stuebner <heiko@sntech.de>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
