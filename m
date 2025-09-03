Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99A3DCA1016
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Sep 2025 02:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p3mEBNobxl0LV1I+fi8Lws5exGm8eBkzVItSWzecr1g=; b=gbH0VvJ2bktnPp
	u5AvBx+qDVLjcNu+ySz8/IKxAKVz1747xWLL3Iy6fyHzIBOPhYUNrdfX/XM6v1dYihhEA72CDw3L0
	Ngw527VSPSBYOKHBe5ljjiA0sYffrAnb+SEtxZutoz8G3YG2AFyXyQVwAGBrDLzeVUicahNmpCws4
	e1YbWwdvHiq2DXtU+dSta58OHo1JVG/rMMbyr4lCHUQyUpysMrzFVRcx7E4KlO9Eimper9ZP7/fGA
	SOpQF1Oowtzjo0lMQNjH4rb8Zmy7auc1CFwE92Fv2m5z5v35PmPxbEZqT7uRC4vJQLbXMPPOhUnqW
	CuBpFZ8hsqNbcmF4NscQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utzQv-00000008Etq-1u6h;
	Thu, 04 Sep 2025 02:10:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utu5N-00000007ZdX-3BwY
	for linux-riscv@bombadil.infradead.org;
	Wed, 03 Sep 2025 20:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dQqseQNcgscixdyVaCFhVdxJCiisNidf6D68QVReldg=; b=H5YGLXGvwHqOU/EB798ChPDAvM
	LNit1fcg/BOsGWvScZvXYhKHhTsRTq5MjLWgslJVBPe16gJSLUZVjzIHbxb9LoUwzJDAOYLGA3Y50
	giJU3Ln/9focte8EeBeSmPGAUbHsHzvy4cUO24bbT24E+tX8intdAGA9GAtkCuhVW2Er8TcmEydSl
	YnEK6uRox5KJORRolqgf5iEAKymmE50AUH1L3/YIeCt6XrouzinlvbxZN6YXRWErmKnBFoHa/Tgj4
	yLF3SyCwcqKwz+kFlsxF6UWhQGciR24sUsZB41HKvfpJZ9C2YSCSLLn5oKcnP8tjsH2EInS47btj4
	gzNOdH3w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utu5L-00000007fvU-1cO1;
	Wed, 03 Sep 2025 20:28:04 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 97F59300220; Wed, 03 Sep 2025 22:28:03 +0200 (CEST)
Date: Wed, 3 Sep 2025 22:28:03 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: Do not handle break traps from kernel as nmi
Message-ID: <20250903202803.GQ4067720@noisy.programming.kicks-ass.net>
References: <20250903-dev-alex-break_nmi_v1-v1-1-4a3d81c29598@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250903-dev-alex-break_nmi_v1-v1-1-4a3d81c29598@rivosinc.com>
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

On Wed, Sep 03, 2025 at 07:54:29PM +0000, Alexandre Ghiti wrote:
> kprobe has been broken on riscv for quite some time. There is an attempt
> [1] to fix that which actually works. This patch works because it enables
> ARCH_HAVE_NMI_SAFE_CMPXCHG and that makes the ring buffer allocation
> succeed when handling a kprobe because we handle *all* kprobes in nmi
> context. We do so because Peter advised us to treat all kernel traps as
> nmi [2].
> 
> But that does not seem right for kprobe handling, so instead, treat
> break traps from kernel as non-nmi.

You can put a kprobe inside: local_irq_disable(), no? Inside any random
spinlock region in fact. How is the probe then not NMI like?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
