Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E9EFC48260
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Feb 2024 20:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pebtLH4PXuQf+2Fm7C9FcVaLfIX36vAdG6LlfUC4WwI=; b=kFhF+BW/dxY9o8
	f0PfE89GvpJZP9fM4vbf9AlVy9qiIOBz8g4qBi3S+KdfmrHr6u+sA/DpCIVLi+TqeNnMTSG/wLTw6
	/OX5lAAOyCiI2rWwmhWiQauMlHpXIBa4PNKCZnTQQZhjs9BMCabWTLloSVRqPulUd4f/E/DCZQ+Tg
	EOp1iQySfJpPbnh2NnsqblR6Qfa2CAyZkumnN9sb1XSDtDXU5HeuN31uBEQRHskLMGWWCBL/q8dSK
	4+ibfJDgt1zAomANbrEWDdapZ9M0cDE68nQrmMDLIbhT/RnnNDBHT/FuCXBhuQspbvmMXgoHN7NtC
	jyjRJ9EyreDe11zVy0+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4c0-00000003aI6-0o2y;
	Fri, 16 Feb 2024 20:15:08 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb4bb-00000003aCR-229v;
	Fri, 16 Feb 2024 20:14:52 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1708114481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7j9WqHfayRaIIREmzZW0nKi8Bnarz7ICJN+nBCweXc=;
	b=4IOyeAYEjUjHckRrd1S3aY4uvbscEQQWp3tmFMOm42bvd2WU30njrgMiIwPVpiO/QL2XrY
	Eo/+d1WwQBI9/cf+/ZHlOY0PAb5MnbCkf1RHtPZpiPvsL+/Gb+9uGeQh2f0V1XPvZ3D9xB
	YNywcoeXeE2mkpdfYOzELxJhVKyDzsqSRKt0l4+rOEWtIQqpWyrI3hjb4x8cj82hSrVDQO
	y+XKMUzsc/EtPRi2YgU/4B4Dr0yNHNzd3L2oAqYSTZl7nEr4t0KnsihOTi2Blagu4tAIBp
	Sa0K+tMysEGj9ASvDgGdpG7TAc+bANkrkIkHUbU8ap/WhbuYf/WvQt5c/Pk+jQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1708114481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=V7j9WqHfayRaIIREmzZW0nKi8Bnarz7ICJN+nBCweXc=;
	b=Da4zfJRFHUQE+UmdbrPWJ8vlFxBbtg2C2O6aQ74Anm52kZ3pnZVLFYmT+jfpjjwcMLR+94
	2RuTbIsMTmkjVYBQ==
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand
 <frowand.list@gmail.com>, Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v12 20/25] irqchip/riscv-imsic: Add device MSI domain
 support for PCI devices
In-Reply-To: <20240127161753.114685-21-apatel@ventanamicro.com>
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <20240127161753.114685-21-apatel@ventanamicro.com>
Date: Fri, 16 Feb 2024 21:14:40 +0100
Message-ID: <87bk8gcgjz.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_121444_696553_5134A2EF 
X-CRM114-Status: UNSURE (   6.65  )
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

On Sat, Jan 27 2024 at 21:47, Anup Patel wrote:
> +#ifdef CONFIG_RISCV_IMSIC_PCI
> +
> +static void imsic_pci_mask_irq(struct irq_data *d)
> +{
> +	pci_msi_mask_irq(d);
> +	irq_chip_mask_parent(d);
> +}
> +
> +static void imsic_pci_unmask_irq(struct irq_data *d)
> +{
> +	pci_msi_unmask_irq(d);
> +	irq_chip_unmask_parent(d);

That's asymmetric vs. mask().  

Thanks,

        tglx

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
