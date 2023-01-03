Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07B97C3DA7D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuXLuzRnikghdYN1YVyyoUbtOHoN9exzz9YrlCXzOic=; b=SyaJR6TeKsRefi
	LQm83YQ+UaYIdZnYzY3o5+LnwHAU+3DSEyQfbxMsexCytsvTGpeyfwWUYfCtYXTUmAeFHfpqOYOzL
	Tkats//8+JBKeF9kkD8OMghJuNWkoOA/SVc5cZizgJifUJ6Nn2Eg67EoqDaiaH1uFl9Pke3gt7LiV
	MYmPSYJCZgNSayIb31YsppRdzeE7l3V2R5ocZ+6S/n3YDK7/Ts9hWym44wFcvUpU1sRI+w1R7d3lb
	NLNtNNvswwxsb3gnAouhWe7QMgJkakA25y/PqgJgUqxeumHcJdlI6uTFOpqgUV7VWQiSwQsLCoNIJ
	uHjTLKgyJfHqN2l8w+1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkkK-003EfF-4y; Tue, 03 Jan 2023 17:06:40 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi2Y-001qyz-Sr
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:13:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id jl4so26427119plb.8
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:13:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=E8TWf5DkaPepHOkkXVQ+z8+CLsbLMAAvnxqIbnjKBZsOqm5DJLf4puRyphTaXyU7A3
         O20QSTl/gD6BfMbEjrMBswkQ2h+vdKWGGbkpnphb7jN+WHlAF8wJ9JJYAhz3yGD5s/f2
         M4qufJ2rkuyfvuEUfC8iBM8MGVWgvY+NJotvQZHFI7YhFe/5Jv6/ZqFn8lwng1OwLSfA
         8S0bJb64BFUYOOnDUHcZ/6iT6d54Q54fwUs5SN3W4qp3X3nnTy+i7Z3IkQucMwzklVhr
         ahzWYcQ9DvTEWEHqAFDrsnEwT9HyIodujAoltPh0wMNEwmdDz4oe7eQQ2rKO3pAP1FuI
         4YBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=QWNHwF9aMGoa5EJRIUEIQarLa87aSIgV4iEGv1o1VPEbsZYqiUXy1oed04tZ3gk2m9
         bqRx1r+kBjNEeBBvrirYdSlEXR3sialMaK8yPwJEBwvAPqNbhihXqMHPWa+FRpfk84ZD
         UunbZL5NzKNPE3PBYuAdIVbRauwzeLfCpIHliABZBzCfZl9amgmjozgyY+utDIfzgLj0
         6wFxytKODZGP2GZU9k0BvlUFaEYt9GC7YRLYYsw3UHpyLo7juAjx+gK+yzhIhI2aA2BO
         XA2J74Q0oDFMD5GfE9RcNOU0DJ9WP4Bb52pAmYcWPSW8ysm77KFElGD1bDZVqKA/6Re5
         auiw==
X-Gm-Message-State: AFqh2kor17XxEY1U0weh4uEV2Q+fs04z0bw6P17MTeGiMKsxAfteWMQ4
	bWv+NkVwBO8Rgz1DJHX0gi8URQ==
X-Google-Smtp-Source: AMrXdXsuVkKXoZiM/PJQ6X7CsAqviLdEWi7Y0fZ02BkzwCJ5cCR4nkdmJMMRGmSCm2P4swYEtm6ULA==
X-Received: by 2002:a17:902:c386:b0:192:709b:9a6a with SMTP id g6-20020a170902c38600b00192709b9a6amr32164806plg.65.1672755196106;
        Tue, 03 Jan 2023 06:13:16 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id x16-20020a1709027c1000b00192b0a07891sm8598286pll.101.2023.01.03.06.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:13:15 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v16 8/9] irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
Date: Tue,  3 Jan 2023 19:42:20 +0530
Message-Id: <20230103141221.772261-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141221.772261-1-apatel@ventanamicro.com>
References: <20230103141221.772261-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061319_078341_E4FDDBE5 
X-CRM114-Status: GOOD (  11.25  )
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

We add empty irq_eoi() in RISC-V INTC driver for child irqchip
drivers (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) which
implement chained handlers for parent per-HART local interrupts.
This hels us avoid unnecessary mask/unmask of per-HART local
interrupts at the time of handling interrupts.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/irqchip/irq-riscv-intc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-intc.c b/drivers/irqchip/irq-riscv-intc.c
index 784d25645704..f229e3e66387 100644
--- a/drivers/irqchip/irq-riscv-intc.c
+++ b/drivers/irqchip/irq-riscv-intc.c
@@ -46,10 +46,27 @@ static void riscv_intc_irq_unmask(struct irq_data *d)
 	csr_set(CSR_IE, BIT(d->hwirq));
 }
 
+static void riscv_intc_irq_eoi(struct irq_data *d)
+{
+	/*
+	 * The RISC-V INTC driver uses handle_percpu_devid_irq() flow
+	 * for the per-HART local interrupts and child irqchip drivers
+	 * (such as PLIC, SBI IPI, CLINT, APLIC, IMSIC, etc) implement
+	 * chained handlers for the per-HART local interrupts.
+	 *
+	 * In the absence of irq_eoi(), the chained_irq_enter() and
+	 * chained_irq_exit() functions (used by child irqchip drivers)
+	 * will do unnecessary mask/unmask of per-HART local interrupts
+	 * at the time of handling interrupts. To avoid this, we provide
+	 * an empty irq_eoi() callback for RISC-V INTC irqchip.
+	 */
+}
+
 static struct irq_chip riscv_intc_chip = {
 	.name = "RISC-V INTC",
 	.irq_mask = riscv_intc_irq_mask,
 	.irq_unmask = riscv_intc_irq_unmask,
+	.irq_eoi = riscv_intc_irq_eoi,
 };
 
 static int riscv_intc_domain_map(struct irq_domain *d, unsigned int irq,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
