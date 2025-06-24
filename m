Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7996C77B7F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 17:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3DoYrM/lPDLpXtj5naRG91CAjkt3e7IWtEC0jKmazTU=; b=p9ZjXhu1Z5M5K9
	YoJ3SCeQAcZF3uVJDyQCfo7a0sAuWJKJ+3jzl6P1owWEeGDvf/XonMX8SdljUbYMTGJCbi9WNs/RX
	J4blecSRm07zwh0CRetuJslElBhMQGWzMOU+aGTTKlk7PDaDCSf9yymcA51BMpp7oVUK/eS991/jE
	GoCDiaixR87u2YCloL5ulz0+49RgQ7m16zT8pwxJdk+a0BEiHmFDgTnGLrl/Fbl2hHrkfEWI4Kp7v
	zA+0EwO4mNuK4sGN464m2C7IHmeVJuKIVJdOYuK0yoWJCRn6pfZ1KoVTk9OPIrD48GGkf+0H5SV2B
	u2LVWwPmrTGI6NO9lF+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU78x-00000006Luq-06Qk;
	Tue, 24 Jun 2025 17:09:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4jl-00000005vs3-40Iv
	for linux-riscv@bombadil.infradead.org;
	Tue, 24 Jun 2025 14:35:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=DyOk14eUc32P6w82vpyuzaHeCuPZSG8D+2f7eCuUwY0=; b=poqq7hHYMP6HTbyqyrgvFlYdYz
	zYh0lCtHZrkpFTJ2BsSx25VNC8pJw3iqCqu1isssiO1Oh+qLqAusXbQP9FTLQcZkljrOgpiyjf5wb
	r4MUmRITnFUGs94hQRtFxuz6q9Boe5JomK4QMGEOaShNmBGHOAs7zAhn+CVUAjHR3qd17B4OvH9mO
	H0uVnOSWRnloKFCXHoEHxzatoAIL335aNDKDiOlKQv3BX9Mbw79mTZX3Srv8Vgv4sdPe+DWadse20
	lNTAstXIRl+md6y8JyfQz4uGrw+zx84oDLXTQ71PJh1belrKoTWv87eVXs852LWrkNcIzwth/nijX
	fSvQ78RQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4jj-00000006pFk-07Ar;
	Tue, 24 Jun 2025 14:34:59 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 64FC1307E51; Tue, 24 Jun 2025 16:34:58 +0200 (CEST)
Date: Tue, 24 Jun 2025 16:34:58 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Nam Cao <namcao@linutronix.de>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	Alexandre Ghiti <alex@ghiti.fr>, clrkwllms@kernel.org,
	rostedt@goodmis.org, linux-rt-devel@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Enable interrupt during exception handling
Message-ID: <20250624143458.GW1613200@noisy.programming.kicks-ass.net>
References: <mhng-60581B88-6FC7-4349-96B6-730D908ABF4A@palmerdabbelt-mac>
 <alpine.DEB.2.21.2506240303170.61655@angie.orcam.me.uk>
 <19cf2371-7293-4e71-a17d-669db4c8270a@rivosinc.com>
 <20250624131730.XqPd1HUR@linutronix.de>
 <d135d6cc-5117-4b3a-9abe-2e5fd9e3e490@rivosinc.com>
 <20250624140815.GU1613200@noisy.programming.kicks-ass.net>
 <20250624141130.gZVv4WnP@linutronix.de>
 <20250624141801.GV1613200@noisy.programming.kicks-ass.net>
 <20250624142350.xZ_DdClH@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250624142350.xZ_DdClH@linutronix.de>
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

On Tue, Jun 24, 2025 at 04:23:50PM +0200, Sebastian Andrzej Siewior wrote:
> On 2025-06-24 16:18:01 [+0200], Peter Zijlstra wrote:
> > I'm confused, sending signals is for exception from userspace. That has
> > nothing to do with exceptions from kernelspace being NMI like.
> 
> Yes. See the original submission
> 	https://lore.kernel.org/linux-riscv/20250620114346.1740512-1-namcao@linutronix.de/

I'm still confused, that code is trying to enable IRQs in the
from-kernel part. That's insane.

Can some Risc-V person explain why a from-kernel exception would ever
result in a signal?!?!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
