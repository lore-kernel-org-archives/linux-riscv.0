Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB41606A31B
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2026 10:30:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0ws5eej2;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=lZJIZhgZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=EvlFxbnEpFt/8nnY+fKyJy8ig0fROEfZ33dULq+9Y+g=; b=0ws5eej2+6mrrvCF/W78Bc4piR
	4FZRd50aLeGo1LIGyQRaaA7CZ4b5rc3U2S1RnGjNsjbJp+HW3PRP/EvZJcoPnMvuuv2dACwVrdAP2
	ZACfKO3jHA7UOwUEm9z5PbuqSLu/k3c6i+8PvvCSLgbW6M0OvX16BqioDtAvTtZaRIf6qUnPwEzsX
	zynXAbh+0GQ9DNv35NCQUlLn29ULuGOZSW2tKXPHaKE6XFD05fNXx1sApWWYpXowNLK6mLMaV7XzP
	yZI03nM2eLTz9YAoJ/J87bXp6AIOK55VSX2QWyzWFvRbbeRaLtF4DFIZFH+0BKUkd7qaXoffMuvIu
	1K7KLwqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHy8-00000002GYC-21du;
	Mon, 26 Oct 2026 10:30:20 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHy7-00000002GY4-15Cu
	for linux-riscv@bombadil.infradead.org;
	Mon, 26 Oct 2026 10:30:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BPQ45pNWMxy9Q9JShYIadO5sSR/GgKBVI8UMLlvZrdE=; b=lZJIZhgZ34Vvmxa8NJqJoeeO+e
	R6AoC+bVdHPWwv9mAjQqOFj5HywlL6pCVHbrwZTXjgnB8w0C5gnOKAhIIqBdMeP/eTD1oF8JMI1Kz
	iNoFKD38SdPxK/i+MQLhnw84YPyFfW/4rHeKlj89Y4X4toh/kYodExVESjWizAKZFbjZZ8zEXXfyU
	ucG/ZkErbm/IBOGWBtWovX7yWH2gxyldoT9CRG1ey+CU/tsnnj/J30xswzEEHffwJ7+uzUHoFz1c0
	6ZjX6NWEO7FyGIy2CFm96M6++opFlCTdLRaVN6+z8UIpKQfsxa4smllg2I4clpZczBWzNtVBiK8Ps
	QRfb7ivg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLHy3-00000001gwV-3WW5;
	Mon, 26 Oct 2026 10:30:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8B776300DB9; Mon, 26 Oct 2026 11:30:14 +0100 (CET)
Date: Mon, 26 Oct 2026 11:30:14 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Gary Guo <gary@garyguo.net>, Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>, cfu@wavecomp.com,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] riscv: support CPUs with Zalrsc but not Zaamo
Message-ID: <20261026103014.GC2668200@noisy.programming.kicks-ass.net>
References: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261026-lrsc-only-v3-0-ec29c8190fb1@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 26, 2026 at 11:20:01AM +0200, Vladimir Kondratiev wrote:
> RISC-V split the A extension into Zaamo (AMO*.w/AMO*.d) and Zalrsc
> (LR/SC). Linux has so far required the whole A extension.
> 
> MIPS P8700 [1] implements only Zalrsc. AMO instructions are emulated by a
> trap into SBI. I measured typical userspace atomics on this CPU: an
> LR/SC atomic takes about 40 cycles, an AMO atomic about 600. The same
> ratio applies to kernel refcounts, bitops, xchg and futexes, so the
> kernel needs to emit LR/SC when Zaamo is not implemented.
> 
> Mobileye is going to use the "eyeq7h" platform, built on this CPU, for
> ADAS and autonomous driving. Kernel atomics are on the scheduling,
> memory-management and driver paths of that product, so the emulated
> AMO cost is not acceptable there.
> 
> This series keeps today's default: both extensions on, -march still
> contains "a", generated code is unchanged. Turning Zaamo off is a
> NONPORTABLE choice. The resulting kernel matches one -march, which
> userspace has to use as well, so a runtime alternative would not
> produce a portable image.
> 
> Zalrsc stays mandatory. cmpxchg, conditional atomics and futex CAS are
> already LR/SC sequences; Zaamo cannot replace them. BPF atomic ops
> still emit AMO and remain unsupported on a Zalrsc-only kernel.

The comment with RISCV_QUEUED_SPINLOCKS state that Zalrsc requires that
cmpxchg() loops have forward progress; which is much stronger than the
typical LL/SC implementation.

Does this MIPS thing indeed provide this?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
