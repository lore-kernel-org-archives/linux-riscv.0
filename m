Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA32CC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e/hMOfdrShla4e2+EMlZLrOO2ZrLLhBPUfDOTdgOdfA=; b=BxmDhzyxJDPIxz
	mFl6/938hhh9xNa/IlzmAoHIJmzKFtXUttBpWSNhochkM/j56I8JiOYgRx//AgyvVGYNNxdRxPv78
	AT84jjy35EKg9FEgrZiLRaR66Y3bAgjR8iGP7uVMAU6XJnhIlbHqg6NDCKFVzCaWqGNjSapuEllvt
	wS/j7bNwU04p5OthQQPHnsUz7+C233BCZ7EFNMRivA9vh4x0JxXFvMRW/t1F1W1UnlEmyfiz59IN2
	2JSrYr58SW6nbbn/EnujoeqHGL5Wv+zB6IDUhAvlhIb2Gr6d/HpjLv1l7smLRARb3Ok9096GU8oph
	HkOe0ThiPqzvFzqAvF+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIC9-0000000HMQw-3aeo;
	Thu, 15 Oct 2026 09:56:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHIC2-0000000HMLR-0jQi
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 09:56:13 +0000
Date: Thu, 15 Oct 2026 11:56:05 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1792058167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFEg5rBy11tyNBNdIuvVomtgQF/QuAip/Xj+WCkUSmo=;
	b=XRmqjzV18wuoqXRgtigU+fhfMIjgiNIQ3iewlkI98Nlj9+p8+YerN+bdrrAeHLOqfbFEND
	8YHpTWE/exAN3kDfGBz5QEtqz2nODKSTbiQZemTeosnT8klcPbks9EYSWIqhnrhrAQ7nAu
	5qzEqp6bCMpI2cZqIQ5xv8oGruE+k+UXX//e515ZF9FwP2EYcoG6Qky/8VITSM217MnsrQ
	kzJhriC77K7N4i2AmMwCEwWe4yfmU3od4i7TKfgr35cSMT3CuC/tdn90S3wEXPuSz4vedM
	rs83CRLJKT/E9KBCXdIHasLJvgmacIY/D22A7dmU0ZnvCry9Gpt2peQugKpcZQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1792058167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WFEg5rBy11tyNBNdIuvVomtgQF/QuAip/Xj+WCkUSmo=;
	b=Wqc1csHQ5AUTcgoWYY++Pje58rEo92XZN0S5XXlUOsYd/XU1uIyY80XLzsWr2q1jwJ1p6J
	b6d+2IxgF8PJAzBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jessica Liu <liu.xuemei1@zte.com.cn>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3] irqchip/riscv-aplic: fix asynchronous probing
Message-ID: <20261015095605.pIRkhzUR@linutronix.de>
References: <20261012-aplic-async-probe-v3-1-5cf52dc28690@mobileye.com>
 <20261013152727.2cUDX3l0@linutronix.de>
 <5a8048ef-a241-4486-adc1-440721d3606a@mobileye.com>
 <20261014105312.xNkvgkGg@linutronix.de>
 <46eaa0f0-ff72-4a72-91c8-b610be2d893a@mobileye.com>
 <20261015063227.GBjyN6LZ@linutronix.de>
 <9bb6f315-c668-4f90-9fee-920f115a3dcd@mobileye.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9bb6f315-c668-4f90-9fee-920f115a3dcd@mobileye.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_025611_433094_623BE715 
X-CRM114-Status: UNSURE (   7.90  )
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

On 2026-10-15 11:11:24 [+0300], Vladimir Kondratiev wrote:
> On 10/15/26 09:32, Sebastian Andrzej Siewior wrote:
> > The driver providing MSI capabilities (the MSI domain for this device)
> > must a module. This is the requirement so that _this_ driver returns
> > EPROBE_DEFER and *then* once the MSI domain driver is loaded as a module
> > (after boot) this driver is probed again and succeeds.
> Why module? for "riscv-aplic", "msi-parent" shall be "riscv-imsic" and
> it is "builtin_platform_driver", see
> drivers/irqchip/irq-riscv-imsic-platform.c

But _how_ do you want to make deferred probing happen that will change
aplic_syscore_registered after init without using modules?

> Thanks, Vladimir

Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
