Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2224FC678D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Mar 2023 17:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmuBFqg5hsJRbIps70tmJ8XCz+RRTvWbYbxCBo6c1ec=; b=B16a1rznW9OG2m
	IX38bC2bW9wAdevpwri3ghVtsjysg8DEdZBIKd/3P/ONDugQIEMWUPZd3XqevTF4gCuoD2+TZKsIJ
	x1yPk32ACkkOmfHCuhtjM+L6/V2HwtTbs17It+9jNrkZQc8zJnsH9i/cnJZ2vPfx+ZvquzY0VKDSH
	ygPAShECzaVtJfG93W6mCVO70f2l1Q7AkESPPMFKNl+klyv6H8j2tIqiY56UlUwc/+8GOA15MhawO
	5ytkxrwRJN8PBPRLZKg08YWkxRuv7jrOe7jGisN3kRzgb229wDIsOVhivXtG51umiNRgApdBHTmwx
	cv8yzeaeVu+5k5qki3gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBp-001p5U-Qv; Tue, 07 Mar 2023 17:33:29 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZbBl-001ozu-4u
	for linux-riscv@lists.infradead.org; Tue, 07 Mar 2023 17:33:28 +0000
Received: by mail-pj1-x1035.google.com with SMTP id x34so14008883pjj.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Mar 2023 09:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1678210402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y7s+91AtfNZFr11BBB79AwltySbIUEsIHQ1Gjnv2r90=;
        b=YTWXHNmU3Hc0XfTZfvFMvruc2cQ9hnzedj7ZkwO5SHSf1i826p8VXu0CSgOmw3sEuz
         axKHZNIeR/th3QaA/yV6b5AZMnLsblZMRHG3T5HKXos+s/gBIBydn8ZA/U+vr18J9BWH
         NegD9ptHCwFrVFzxrJSLCT/zEl3GiSfks6/11ihSiHydYPZXH4hQ/YruwdwPI+X47x5V
         7Vu9/BY42gjkqKPWdezFXi5W9kNPnXNnNcxHhvruX9ZUpq5wxaT6HST/EWFQyl1asuBS
         qtsP8tOVDKwf6Oft1NhTeoUyzuFlLfFLejxnGCYq0a9IA8pRUIt2tTlIJ2L4JzDPPt88
         vTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678210402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y7s+91AtfNZFr11BBB79AwltySbIUEsIHQ1Gjnv2r90=;
        b=LF4p+nBmfuAclylSoC/HRG1pyNhCryAijNFYSrOreZUkk7z1q6+gsjROC0HrhObhO+
         wKcrw8RYEny9lzcrdsI/EqFZu9VFL50OhQ48719H5iZs8aEmYukKEfnp9P2Sl+GUrjwz
         GkZX7LkuXSxIiMWl8szo1Bcjd12ObR+83szr6sURLjMBjBnOsB8xet82skcgwX8IpbcN
         SXBijFS/8gzT2EVyQHpxu16naCdwRPKTpVdTaI9Jurex5YlrmYU/UmsAqP2MaC/oZcQL
         sfNuTMn99G7CM89jqR3qEyAgT/BTE/RzUESqIWttrqpvvPTOz2V9BfafhXvmTpT5pLNE
         7peg==
X-Gm-Message-State: AO0yUKUJsZftvaGYYC7xMGb3ci8mpIGrzBDRGe1ldWwj3OFAtK6/l5xA
	Wc0ICg8UGgYaZe2jQCbXmMyJDQ==
X-Google-Smtp-Source: AK7set9P3Xbi72+G+xm28XWsz1BZjXh4gBXZE7BHzOVDDQ3CSdHSkQXa+8ZcFv1MLnww7/0wJpQ/Aw==
X-Received: by 2002:a05:6a20:1447:b0:cd:87ef:3f33 with SMTP id a7-20020a056a20144700b000cd87ef3f33mr19970346pzi.29.1678210401853;
        Tue, 07 Mar 2023 09:33:21 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id 1-20020a630301000000b004fb11a7f2d4sm7996185pgd.57.2023.03.07.09.33.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Mar 2023 09:33:21 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
	Alistair Francis <Alistair.Francis@wdc.com>,
	Anup Patel <anup@brainfault.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v17 7/7] irqchip/riscv-intc: Add empty irq_eoi() for chained irq handlers
Date: Tue,  7 Mar 2023 23:02:31 +0530
Message-Id: <20230307173231.2189275-8-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307173231.2189275-1-apatel@ventanamicro.com>
References: <20230307173231.2189275-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_093325_237635_3ECAEEA1 
X-CRM114-Status: GOOD (  11.11  )
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
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
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
