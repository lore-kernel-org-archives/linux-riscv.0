Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655FFE74AC8
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 17:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXabCdJJBsF86cgAI4JWsKWVXXlkpGXruf2w2knrmqo=; b=XjjahJvjPocu2t
	xMXQZeoENwbcZaEdtW4zbPLnxUux+d2TzSE2i3j45JDkTtlXsqkmYriSSxcm3lFkvlt40/UXaT7zz
	izvDCzEacPeL9dZoAlr/wFxKXDba6g3FgunOQAHfBfT/92YIoriHBKwd0wMpKns+Z6YBjaI6le7ux
	ZvxdiReBYU1kyE3Qgjr6ceB6ykd6wF11kcgLjdhz2P59fAtodLfytSYd41VQ+zqqUtWeyYrOx/TNf
	eSmIje5fOkmTaFMT59+KrAFoKbdrVBOeb9n6H/mvCVBbW+8SjQCoaWCaeb4qrDxrTTwSwjsSwVM0B
	KY1ep1jJ3ZDi03eoZGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIXAl-0000000AJzH-2EPW;
	Tue, 03 Dec 2024 17:58:55 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW6J-0000000A9fL-3AM0;
	Tue, 03 Dec 2024 16:50:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1733244613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ddUgFgPxg+SS7wo0+tjynAsBYR5Mxah4PrQSaFnCmnk=;
	b=T9WrCOrxKvgOzRX18+gpG03ZanbaXNOW4Q8EJ+AjPslvATRO09l/e/uoFg5o0u3V7mUxIc
	FKCFbTtx7TWQa10iy/a+u0zHSpl3oM+K6vPIY9QN3aZr19zGDrMJOmgz4vPYA6x3G1/c3M
	WxUqbqLRsTrv/siOEk3R5LiTzgSo1JgEv+NOVe8nSL0VGMxhIKdtW2JlhhQbsGo42ibEke
	2lZUHWjzXEzzayRZlFzV90vwPiuaNQ2p8MbtOrPSWndbBJzlUJHotzmppPVkuKRyl+XUKe
	4OyeIQ55HqBlfvUvBUNtTExzn47SF13chN/bZbI7ZfD22izCmNHBbNZyXaOqwQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1733244613;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ddUgFgPxg+SS7wo0+tjynAsBYR5Mxah4PrQSaFnCmnk=;
	b=7UtLMG0FCrXqstktFxvDODEZS+Zvp0Wod9CVP17RsZNtcP0UOJ6fcJsb5uKaTcWojLI+EE
	5MXVE3lGdmrbDeBQ==
To: Andrew Jones <ajones@ventanamicro.com>
Cc: iommu@lists.linux.dev, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, tjeznach@rivosinc.com, zong.li@sifive.com,
 joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
 anup@brainfault.org, atishp@atishpatra.org, alex.williamson@redhat.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Subject: Re: [RFC PATCH 01/15] irqchip/riscv-imsic: Use hierarchy to reach
 irq_set_affinity
In-Reply-To: <20241203-1cadc72be6883bc2d77a8050@orel>
References: <20241114161845.502027-17-ajones@ventanamicro.com>
 <20241114161845.502027-18-ajones@ventanamicro.com> <87mshcub2u.ffs@tglx>
 <20241203-1cadc72be6883bc2d77a8050@orel>
Date: Tue, 03 Dec 2024 17:50:13 +0100
Message-ID: <87a5dcu2wq.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_085015_939038_6D3A6103 
X-CRM114-Status: GOOD (  12.01  )
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

On Tue, Dec 03 2024 at 17:27, Andrew Jones wrote:
> On Tue, Dec 03, 2024 at 02:53:45PM +0100, Thomas Gleixner wrote:
>> On Thu, Nov 14 2024 at 17:18, Andrew Jones wrote:
>> The whole IMSIC MSI support can be moved over to MSI LIB which makes all
>> of this indirection go away and your intermediate domain will just fit
>> in.
>> 
>> Uncompiled patch below. If that works, it needs to be split up properly.
>
> Thanks Thomas. I gave your patch below a go, but we now fail to have an
> msi domain set up when probing devices which go through aplic_msi_setup(),
> resulting in an immediate NULL deference in
> msi_create_device_irq_domain(). I'll look closer tomorrow.

Duh! I forgot to update the .select callback. I don't know how you fixed that
compile fail up. Delta patch below.

Thanks,

        tglx
---
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -180,7 +180,7 @@ static void imsic_irq_debug_show(struct
 static const struct irq_domain_ops imsic_base_domain_ops = {
 	.alloc		= imsic_irq_domain_alloc,
 	.free		= imsic_irq_domain_free,
-	.select		= imsic_irq_domain_select,
+	.select		= msi_lib_irq_domain_select,
 #ifdef CONFIG_GENERIC_IRQ_DEBUGFS
 	.debug_show	= imsic_irq_debug_show,
 #endif

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
