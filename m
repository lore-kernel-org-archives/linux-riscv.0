Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64755C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 10:11:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gA+gyNMNTM59KBg7B9utdaXMJ5OsjOl/lphcVCK9dC0=; b=5CPyEgmFzlgLbR
	cT2GpidehsQHm9A9QM4lT4s+WxlI9tXw4Y9vfMD/96EbUToildWe2BaLFjKaKx946rQ5oRN2qbppc
	RAZAc6DTHpbtC9pJWWWmvYF1QTmx5xmE0klwQiC6+WV1h8LHwy9FmAQ+cS8t5Tr5/ODqMU4T3AssT
	HzrpHLuKkrqpR8OcW+Y2ZjrenKd7CyJMH7HOglXfgGh7kJnMuher1Y6BcNfeUFvcfsmcQluPkwq/4
	tlkEbDEvRFgMXNJaAiGdPp+y1KAa20Rgrr347uYEKSIbxlMgQtpm41idY2xBBhO9EPrAURSghkOnR
	njHSwQYdoIk0lpydqZJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcN67-0000000ECfJ-3agm;
	Tue, 20 Feb 2024 10:11:35 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcN5t-0000000ECWW-0qxI;
	Tue, 20 Feb 2024 10:11:28 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708423879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=in6V0tATuxP4n7VcDzSoSG7lzzMjrpnmMLAUnJYqlUI=;
	b=eDB1pBdZjBtgeBM0iMFA3XI4L1yWTD9h1FpaSKMOqIrO3YUNxSpQ8W6D0zUtWuz6Ng8uJV
	io4eno98m107yXtFUz41S+1anbi/0JdvGBNir5BY71ERzMiIuoyIqUulIG5a0jGfU3zmXq
	x0CROufbYLfSXQcLYpOP22m1x1lKSy9alWKsKabMGjckr7KTRf8AJnqDdhOA4y/L5c+VYI
	TSS3UnnEL9Mx9yY0hzVIt1aqM+XAt9vrxGtG2oVJS950lm+HJbKWOBjJqEOB22So6wWDbb
	lZwxe1i0Cad4cI+KCsoDi+utl27jklszyBnLwfWgUmTM4x7Sv6739FgoVua85Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708423879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=in6V0tATuxP4n7VcDzSoSG7lzzMjrpnmMLAUnJYqlUI=;
	b=evAVoWILlx+PTEd1aPDdZd+kDLc77vRgr4NzPJTBR+bDTjDQxg3aekt1yJMur+8M9Zbakr
	SwPdNTN3Pw3TSDDQ==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v13 02/13] irqchip/sifive-plic: Improve locking safety
 by using irqsave/irqrestore
In-Reply-To: <20240220060718.823229-3-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-3-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 11:11:19 +0100
Message-ID: <87frxnigxk.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_021121_566985_72FAEC79 
X-CRM114-Status: UNSURE (   5.87  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 20 2024 at 11:37, Anup Patel wrote:
> Now that PLIC driver is probed as a regular platform driver, the lock
> dependency validator complains about the safety of handler->enable_lock
> usage:
>
> [    0.956775]  Possible interrupt unsafe locking scenario:
>
> [    0.956998]        CPU0                    CPU1
> [    0.957247]        ----                    ----
> [    0.957439]   lock(&handler->enable_lock);
> [    0.957607]                                local_irq_disable();
> [    0.957793]                                lock(&irq_desc_lock_class);
> [    0.958021]                                lock(&handler->enable_lock);
> [    0.958246]   <Interrupt>
> [    0.958342]     lock(&irq_desc_lock_class);
> [    0.958501]
>                 *** DEADLOCK ***
>
> To address above, let's use raw_spin_lock_irqsave/unlock_irqrestore()
> instead of raw_spin_lock/unlock().

s/let's//

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
