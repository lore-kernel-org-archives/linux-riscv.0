Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BEA9C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 21:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mcMS7waSICCa9iCVDc4ZT63JtYBgz4hibKVoHvLwil0=; b=bhzYH2yRb/pRAP
	G/UuSaJETspXo8lvqrrIVwGIhWwqxlRojfU/CoHkrV8UVsUbfu8yvh6R5F833p99t6vo5SMWMGlGD
	MbCw0TD9LwIs6p+ZXHat+54zUQQ8OjQTf2Ximc15Td2ulZ2ri3SLrCFP6JtIHA874CP2RFO+pBsYS
	tufhr7GIE0IyhWX/1U/QbrKHscXgyltYCUmNmgbMxWLZHVXi/M232ShYXDNMpTgML06/hfepw69p/
	xeRue8KXo83s6uNErEDYfl5aLH1+1OIAndJ8lnOXF9o3jD1i9ID/aUOs5qTXFMgOgCp86+kr7Ej5i
	5u7lfFF1z1zgqcrA1D4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGih-00000006g5H-2u38;
	Thu, 22 Feb 2024 21:35:07 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGhd-00000006fpv-0ZG5;
	Thu, 22 Feb 2024 21:34:36 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708637638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PrJ6YaFxatvY2iijd5Wqk9LxjgKfLoik+dqgECHQvCc=;
	b=E8IKGWFobvMuydi/MYlCGtioOqkIyOjB766pK5NO0O5XAbWMgtCQk2EakY7kz56uIkMp3A
	fJbScBQ7wtn6rKFXSCse7HAP0zIHNNRFq8Ui3HnKIRcHVv/O9A7dOQ6zsE4xtAO/3shZDu
	23y7JebnE1ZqgWTCB3f+GBIYWpf2KD4JcGH/n7wROMMpEU5bjsYRQQkyvREUxOWN/82puZ
	yudaq144aPD64IIrSwauXD1UAtqhEMgF3BHJg+rFhOCmk9oLQQttGgkoVbUWVsWI1tTVVf
	mqGzlP45wJkqZqOGx/jyqNSr6gyeRP5Z+KfnumjcBO+2r6ws4mpxbJxuDmtoag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708637638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PrJ6YaFxatvY2iijd5Wqk9LxjgKfLoik+dqgECHQvCc=;
	b=fDIU63ciUTcRIKaxF7jIPyC9HLb4PBqsycE7avUV7D+2/qWfEpyl+pqC54WNOiNeW+0k7b
	moIvBy70qNb/RwAw==
To: Yu Chien Peter Lin <peterlin@andestech.com>, acme@kernel.org,
 adrian.hunter@intel.com, ajones@ventanamicro.com,
 alexander.shishkin@linux.intel.com, andre.przywara@arm.com,
 anup@brainfault.org, aou@eecs.berkeley.edu, atishp@atishpatra.org,
 conor+dt@kernel.org, conor.dooley@microchip.com, conor@kernel.org,
 devicetree@vger.kernel.org, evan@rivosinc.com, geert+renesas@glider.be,
 guoren@kernel.org, heiko@sntech.de, irogers@google.com,
 jernej.skrabec@gmail.com, jolsa@kernel.org, jszhang@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, locus84@andestech.com, magnus.damm@gmail.com,
 mark.rutland@arm.com, mingo@redhat.com, n.shubin@yadro.com,
 namhyung@kernel.org, palmer@dabbelt.com, paul.walmsley@sifive.com,
 peterlin@andestech.com, peterz@infradead.org,
 prabhakar.mahadev-lad.rj@bp.renesas.com, rdunlap@infradead.org,
 robh+dt@kernel.org, samuel@sholland.org, sunilvl@ventanamicro.com,
 tim609@andestech.com, uwu@icenowy.me, wens@csie.org, will@kernel.org,
 inochiama@outlook.com, unicorn_wang@outlook.com, wefu@redhat.com
Cc: Randolph <randolph@andestech.com>, Atish Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v9 02/10] irqchip/riscv-intc: Allow large non-standard
 interrupt number
In-Reply-To: <20240222083946.3977135-3-peterlin@andestech.com>
References: <20240222083946.3977135-1-peterlin@andestech.com>
 <20240222083946.3977135-3-peterlin@andestech.com>
Date: Thu, 22 Feb 2024 22:33:58 +0100
Message-ID: <87r0h4dvzt.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_133402_634530_DE734C60 
X-CRM114-Status: UNSURE (   8.27  )
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

On Thu, Feb 22 2024 at 16:39, Yu Chien Peter Lin wrote:
> Currently, the implementation of the RISC-V INTC driver uses the
> interrupt cause as the hardware interrupt number, with a maximum of
> 64 interrupts. However, the platform can expand the interrupt number
> further for custom local interrupts.
>
> To fully utilize the available local interrupt sources, switch
> to using irq_domain_create_tree() that creates the radix tree
> map, add global variables (riscv_intc_nr_irqs, riscv_intc_custom_base
> and riscv_intc_custom_nr_irqs) to determine the valid range of local
> interrupt number (hwirq).
>
> Signed-off-by: Yu Chien Peter Lin <peterlin@andestech.com>
> Reviewed-by: Randolph <randolph@andestech.com>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Reviewed-by: Atish Patra <atishp@rivosinc.com>

Reviewed-by: Thomas Gleixner <tglx@linutronix.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
