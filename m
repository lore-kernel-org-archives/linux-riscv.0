Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CBFAC5478C
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Feb 2024 08:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUM73rvsqZGp273ufoO9sTeYLTtn+ktzO7ZdYvjTIrs=; b=tI6GBA2EZ+vPwS
	XxXEmSUaa9J71LYe8aICsEyhxfA4deLFc1Y28qDfuMbY9PmKOg2RY3Pt4AykMsysrrmT7vqjOqE+u
	APTA1NEfI3LNlEAYkpwBD7teCO3gqUdY0RVnlUg+1eg4vLfxLXkpLc//iFtzwnmmGfIgb1tjNCsNG
	kxhPE4nLwKxpVn/e8q6MYM+XDglaXLB7uwh82/n3DVxW1E0vwbnC3O+iiu8em7hrGaUeeW60IQREC
	WRAb2tkK0+1GTDigEtFTxyAeNJA1ChTJ0goNj38MpEP7NSgGStSQHLX1xJeB7yGdA7gzBn1BtPsE7
	b7PB/yo3+kQsiPzNwkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQyz-00000008UgU-0UMp;
	Fri, 23 Feb 2024 08:32:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdQvH-00000008TYe-0uJ5;
	Fri, 23 Feb 2024 08:29:25 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708676920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BwouyOLbHz0eSzCdVQ2ZEsHOl10HJAxDGKDUKAL7Owk=;
	b=cfpLw9z8ATpZPiDKbtK60qO0kt54LwXCDHCurRp/6YD+12HSf3uBMKcklWFSACBsIAxbZM
	Gzfu7GBoQALfc6TLvIv0sA1guMwPM1uuqE9ljEfvOCL+t/mFIJS9LoqM+Nrund9/hzgi5j
	NfmMx2yL3j+NnrOvGGiCU+bV3Gnd3EHGyZzoLj/W2+x1kPFVT4TMMVCQHyWgYLQAMm/Xvn
	zimTWHdPfiHFuIegAswCFXw2TyvjkBhZz4FP3RrLqN9Lkjxp+jNtZV+vSS3HJ2R8h2Imie
	ueoCgOrGxcBKRnuUhqh8vbbkwa1uwYJDjPGCjLVbTu9Pwq29j3kFH55YWqmSTQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708676920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=BwouyOLbHz0eSzCdVQ2ZEsHOl10HJAxDGKDUKAL7Owk=;
	b=Gonh+AQTnZOB2EGMkKzwClO38MRD1hddXVrDFhRCeIADXpMKUQUubjPqRKqdqGquOcIx80
	7n/i+HaywMLdrGAw==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v14 11/18] irqchip: Add RISC-V incoming MSI controller
 early driver
In-Reply-To: <20240222094006.1030709-12-apatel@ventanamicro.com>
References: <20240222094006.1030709-1-apatel@ventanamicro.com>
 <20240222094006.1030709-12-apatel@ventanamicro.com>
Date: Fri, 23 Feb 2024 09:28:39 +0100
Message-ID: <87a5nreg94.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240223_002847_642339_62ECD416 
X-CRM114-Status: UNSURE (   8.47  )
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

On Thu, Feb 22 2024 at 15:09, Anup Patel wrote:
> +	/*
> +	 * Setup cpuhp state (must be done after setting imsic_parent_irq)
> +	 *
> +	 * Don't disable per-CPU IMSIC file when CPU goes offline
> +	 * because this affects IPI and the masking/unmasking of
> +	 * virtual IPIs is done via generic IPI-Mux
> +	 */
> +	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "irqchip/riscv/imsic:starting",
> +			  imsic_starting_cpu, imsic_dying_cpu);

This is not really correct. IPIs should be working right away when a CPU
comes online and on the unplug side until it really goes offline.

So this wants to be in the starting range, i.e. between CPUHP_AP_OFFLINE
and CPUHP_AP_ONLINE. No?

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
