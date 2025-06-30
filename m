Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1F19C83029
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVc/mTwIoQMZSzSI8K/mtpQ0a+bSCDCJHQwuNY72+6w=; b=IU+uaxEZd8S5ka
	qsrJoqf75/VmhFMg76ZUe/lIeH3AhascrSu/iN57kRbgtDZ4E+LZIWcpNt+warCa8afHKxvSvruiQ
	rQpk8aEO3hShPsap+X+5CL9yvvjswfz9OX6yYX6GfPJCxe4KAantu49uwlE8XoywLrx0+sfPXxdhm
	qG2+GvA3Y7ldpnCh91/qrSMqvi3YirlNVrIyJIMlMhPMxvsvUr/HKjnGAiFNzpEKQ2NxZyeaNRDsy
	AUJU9iZldM55p0l41UIGh8NG7nDlOhJykmUHQHzGStw0AT7gpjFHwnNoI5C79NSfxOJFVRfTu0gP1
	pxU4w11pw/usuGiQcuRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1U-000000039bu-0X3H;
	Mon, 30 Jun 2025 18:14:32 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH4S-00000002ppG-1iaj
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 16:09:31 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751299765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgWh+8E8RTKxGksXA+o1xJJWmZfJpISlf1Dk4CiA5hE=;
	b=xtNSb8RZjSqBKP2IQVrjWflgw36UNeIc/EC8mgGnMVlLfJ9AboALwO9eLLY+9yXdAQL+zN
	A+i248Iq+y2lDr0mh41n89FnRCCDNg4nCyTCYmi/dKmrA7cQ+ZI1C/fR8WNc9gzs1oW3Sp
	ar4wfDYcn3hnJB9UAErmDYC8qmQy7dcCJDr1VTWlQKc0ORk8U2cIipeUtZO+SGg9cY31yS
	WrnSTBtAa3xpY0n41r4vaVeM7lrigKi4LVenOXBcaTyNiK0wy+VNn0HPBCgJcKtXJY/ptp
	Cxcyz0ow1RhXddhkD+LJJh2sELo5yzunCZEdD2uz8KrBInBgyBdRB72XH00Izw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751299765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SgWh+8E8RTKxGksXA+o1xJJWmZfJpISlf1Dk4CiA5hE=;
	b=sKQ4Gl+exyR09gQZxZEr/USGywhLUVyLmQZQeftmQheSbi5pkBj82V0GdH6Ntn1vhQY0hq
	WrpD8CbBhR5SMhDQ==
To: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@linux.dev>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones
 <ajones@ventanamicro.com>, linux-doc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, Anup Patel
 <apatel@ventanamicro.com>
Subject: Re: [PATCH] irqchip: riscv-imsic: Add kernel parameter to disable IPIs
In-Reply-To: <20250625161715.1003948-1-apatel@ventanamicro.com>
References: <20250625161715.1003948-1-apatel@ventanamicro.com>
Date: Mon, 30 Jun 2025 18:09:24 +0200
Message-ID: <87wm8tmcsr.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_090928_616381_0364C6AD 
X-CRM114-Status: GOOD (  10.60  )
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

On Wed, Jun 25 2025 at 21:47, Anup Patel wrote:

$Subject...

https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#patch-subject

Is it that hard?

> When injecting IPIs to a set of harts, the IMSIC IPI support will
> do a separate MMIO write to SETIPNUM_LE register of each target
> hart. This means on a platform where IMSIC is trap-n-emulated,
> there will be N MMIO traps when injecting IPI to N target harts
> hence IPIs based on IMSIC software injected MSI is slow compared
> to the SBI IPI extension.
>
> Add a kernel parameter to disable IPIs in IMSIC driver for platforms
> with trap-n-emulated IMSIC.

Why do you need a kernel parameter for that. If the platform uses trap-n
emulation, then disable the IPI muck automatically, no?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
