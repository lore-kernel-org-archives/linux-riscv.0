Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 426BFC48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 10:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UpgFLT4wtFNBU7+mXHSF1+SA508IlCRJ2mrBcXuPmo4=; b=yliIcE0ZU5HRS+
	HACAYktkdeTjr1rJIKqXdR982kiV8NKoESX0uNGhUejFmGIxmSt/JGiVhnKMoDPB2uu7IbARjFXeY
	d/z7T+h1jmxC5vZuz5Ue/JHSMD6RIY96ps24ROF4Bt++e4hizDVXzGJpIgtOCGLFPJJ/upibPJcGt
	6BRy48i9gsMvNr6B1rypSk9TXvTbECHbixl4zcvcck2IsVo+HTdeNJXhS88eNGS3RP9HpEEBXJ/dU
	T+ml9+TgXTawILjqxP0q1tXReoli/Ym+LvOcAIFGTWH5K6yRZTLgaQGzO5FI7IX7eCCBf6w3wYTqk
	a/fINE880yabVl0c8zSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcN7q-0000000EDER-3wYu;
	Tue, 20 Feb 2024 10:13:22 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcN7k-0000000EDBF-3Ddw;
	Tue, 20 Feb 2024 10:13:19 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708423995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=laFAJ1WS6uZx5Qx1npB6qVhditvot1Fb8n/CdM0NjF4=;
	b=eAWJWjfKj4Exj6mD+gG2026KDyKmNgCS41grYSnkAmb/YGmADaQqe1sbZzj9EPkor5NABF
	6MCSMSIHheBZ+KhYWYGxtmYpPKRp+N2TfzZPLbErwhLv6KOgA6HgJ/s6RwYLbjsKIi2/S5
	KubpQ3XgYqGjz1UlNyfT+1fgppS39GjKWlVtCltywAjEVsHg6HTwmymO0ZuS/ObLld6+6y
	mqNnHZLFpBtmVkxz8FLhyIMrgJQqk2w48iq1AQRJDpO6xfy/+qoPwxZ/HEqZCPzY55rBtU
	zIF1k080ccayut4VH1p7dX8ozpYZb8MbGw2Yz5UA7we0K6os8uTEwcaEmXp4Sg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708423995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=laFAJ1WS6uZx5Qx1npB6qVhditvot1Fb8n/CdM0NjF4=;
	b=XpElhKtiuPPyaiRk/K/PQKgz6xwbFQgSyRq4YzUC7dfsJ907Gb168BrwzkPW5XhDZeDvGe
	zQc4ZOGV40T8BXAg==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v13 03/13] irqchip/riscv-intc: Add support for RISC-V AIA
In-Reply-To: <20240220060718.823229-4-apatel@ventanamicro.com>
References: <20240220060718.823229-1-apatel@ventanamicro.com>
 <20240220060718.823229-4-apatel@ventanamicro.com>
Date: Tue, 20 Feb 2024 11:13:14 +0100
Message-ID: <87cysrigud.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_021316_974606_38A002FA 
X-CRM114-Status: UNSURE (   9.84  )
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

> The RISC-V advanced interrupt architecture (AIA) extends the per-HART
> local interrupts in following ways:
> 1. Minimum 64 local interrupts for both RV32 and RV64
> 2. Ability to process multiple pending local interrupts in same
>    interrupt handler
> 3. Priority configuration for each local interrupts
> 4. Special CSRs to configure/access the per-HART MSI controller
>
> We add support for #1 and #2 described above in the RISC-V intc
> driver.

S/We add/Add/

> +static asmlinkage void riscv_intc_aia_irq(struct pt_regs *regs)
> +{
> +	unsigned long topi;
> +
> +	while ((topi = csr_read(CSR_TOPI)))
> +		generic_handle_domain_irq(intc_domain,
> +					  topi >> TOPI_IID_SHIFT);

Please let it stick out. You got 100 characters. All over the place.

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
