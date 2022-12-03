Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CFFCC4332F
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Dec 2022 06:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yuXLuzRnikghdYN1YVyyoUbtOHoN9exzz9YrlCXzOic=; b=NVdTE4ZKZbFplP
	iZoUZ8NKy7o7+Zxq4xVYeQgrGxyen0hsQc89Uun7d98LHt61qGJIl8xPw0sVj1m6CiKqkOQ8HCWrH
	rtGyHg7GsMHoJMlr0pFacX90Ao91aaiN+ptGxpPVHPUqtujzeMrAS8t0ghtFhGbBPQch6PcJlGfqF
	Jy+hzWNwjm9kKRA2WM3s/SUAm5VL4vVjxU3KCec4BkcUlONoP40Up2vdTWzvUaeFDrqbz8ytC2eBA
	MOgyzff9q6S7nNoerA8/vyKeuOFHsEb4Zms6kuQQwK0T214gSjM1uo2IaTIwmOPPp06qMpcjfy1nm
	tzELC55bwSluwT3xhmug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MJI-002e2A-24; Sat, 03 Dec 2022 06:47:40 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p1MJA-002dxO-Eq
	for linux-riscv@lists.infradead.org; Sat, 03 Dec 2022 06:47:34 +0000
Received: by mail-pg1-x52a.google.com with SMTP id h33so6118608pgm.9
        for <linux-riscv@lists.infradead.org>; Fri, 02 Dec 2022 22:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=euh/WJv+d/Y/UR2nFG7ACLKlAQLWvS+pspdNbRB2N4/ywmUMocGyzv6imRDqz3xhKH
         hVIldCdSsx3gSImK07Yklld58ZLWhRJphAr12DxQQMawFYKM8pywLrV/uTbV9LLAmDDS
         hkO3PZ89RKY81mdSQ5tkYkGv/19QpikDSfjaQ9c9l6WF4jNeQaqrXyrB1x88IiFy/stj
         oeKNb5wLl3m5IwqB8Igm+5/ongIkEWLlVV71WL0HdF0ei1kY0RX9XFwtmoOPgrlc8MEL
         Um+06X63qygkIXhJ93rF3/Ong8S3f02KGlhQvPM2nJo2TLUyBkBpQuETTzyMtWnUE0jL
         3udA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fOsF09BSv6WEjfktoanH0vG9zVuY2VCJ6w8ZQR8SIzw=;
        b=sGKEP2sXuLGJWz3nXp4kKk9zm521CXmvQLBGyrOMFeB6t1Dlu0kx0VoHXqLoXzQZ6d
         2dtrA+Ymsy5crjkpULtqnRorkrDi29gPakVa4T3UeMsIXInplJ4vz59CHKDR+KF3zdtd
         RXdAFupwVEBInNUN9YfPmE6Juldkh5R/ACJvi7+QCHcuS3DGiaoXbzGI7MPPJSOvEk1Q
         fDZelnOtbSVwAKvTFM3dwc3wfMTwdUkbt25CNSD3mCc6AWebZ7dklZtjSFPA03tApHJa
         EzrxRC9cwyHyB7+BMlADoU+uLat4FGFn3v4KNhIeTJSYmHUswROYoIj4zQK0MK2DgMIe
         pWIA==
X-Gm-Message-State: ANoB5pn/3Giz4D404e2OI/TbbdFa88EDAODjLc3sz68ZzPRk5YxylzwQ
	7gmZHNBt0PNSb355Hk3FN+Bf6w==
X-Google-Smtp-Source: AA0mqf4cYcNP3uDXkKA9ArYUQffs8SfM8J5dvZeNdcfvt1eItOoV77aq5HziR3bIe/MvkyKpsO/qbA==
X-Received: by 2002:aa7:92d7:0:b0:576:5cc7:8106 with SMTP id k23-20020aa792d7000000b005765cc78106mr6633237pfa.82.1670050051811;
        Fri, 02 Dec 2022 22:47:31 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id t17-20020aa79471000000b00575c8242849sm6102091pfq.69.2022.12.02.22.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Dec 2022 22:47:31 -0800 (PST)
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
Subject: [PATCH v15 8/9] irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
Date: Sat,  3 Dec 2022 12:16:28 +0530
Message-Id: <20221203064629.1601299-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221203064629.1601299-1-apatel@ventanamicro.com>
References: <20221203064629.1601299-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221202_224732_982707_F3E99FBB 
X-CRM114-Status: GOOD (  10.94  )
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
