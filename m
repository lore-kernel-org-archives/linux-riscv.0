Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0B51C531DD
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xX3QxYVlJlCXw/o9torEFfjlXHZoiv2pvdbzskElP4A=; b=meWzSiJu2qmyBH
	3NcF6lG+4KD7K+/nJT4k9Rvsnght8YifJSyQV/cg0kcvtdA5GoO+cOtvnErfchEgbTXfZmVmTxxnL
	Kxv7Pt6OlpkOk0Jf7uyRk23xxH72XNSGV2wYRPIR9UVAWYML1uVGM+IwdW98mUBCq/AuVm7vh4sSR
	et6p582u52jhAUA3clA6xGfWveobm12tQcVeuySqaNmmqe/IY2bOrr0CIEOp2ZIV+dfJakc0pc4Oq
	6gXhuaqKWp4FO1KkU5uVZqzMHJ+xUUglnyArWtTL/qCX2RHATZCN7MMXSd5vqg1qcVILdgwsBW7tc
	XshYDnGCw5ZIg/UDVVYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFRk-00000007OKY-2EKj;
	Wed, 14 Aug 2024 14:57:56 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seFQi-00000007O1o-3H8o
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 14:56:55 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 33167402D8
	for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 14:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1723647409;
	bh=sxLtNA8jlC2UdtFSfJSplJrgcfSiQ+BvRmrjXsCvtrQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=aZyojXWXk6kVEPjLQLsZPfc7+y5DtkJE0z6HdgydLNNJGeJyUb1zPSjwmozQFmfVP
	 Bfwh22gcZdB85BicWogqesOlwsnXRSvZjGz2B7X7wDW3CxHRWseYowAYR0pal9Aes2
	 QczuvtGEGfR0sOhO090hIvXR/v8hFXwJWO0JCu+BD+GGGhzCCdKzLm5Bh+2cLtTEhz
	 vWjIoN09UdHXSnQPqBrKyxCWN+cSOff1mn7nDAKQeg3i40gsheSr4ws6zwnFKXCMxp
	 sSvIL20qgOH6cvCZIxbWEk5KTMor947hdURdijxV5u6DUG95UmMfS5dnGeCILb12a5
	 fi1G4jYMMBTDg==
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-5bba487c10eso10575a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Aug 2024 07:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723647405; x=1724252205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxLtNA8jlC2UdtFSfJSplJrgcfSiQ+BvRmrjXsCvtrQ=;
        b=ITlHj12ClHPbLorPP9vHYVftxGwnjmvXpmduHyp+4m2V4lIWRzN6MGr3H8OtwWyrEJ
         wx0jm7M6/1C2qwLxDkEkh+lzFkcMSRTsKSj6vNOrumFXGtxJSj3fajbJ54fuuSD3DAlv
         ReWyKv/6ab/Otv8iEDSlwA3/+VaSlCKNXOHvlxxl+5iORZZ6zAJ3oqSDIaWYVl76HBPh
         +PcxSxFigqbo9vAwPfZBY508+Pm6gz7F9qV9sFKTXEe9FfgYBBHg5n+ecyNz6SuaW1iI
         VXjSNNprHqrhenbPRbeUX0ffJDC95OoEbZsKlpr0YDocsveZEnRCxeWzFCSsDJUf5wG7
         6Q4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUaO7o5zKLv1d9kBhbCcRyuQPltUKOuyyVmHjDo7sS03BO4TX+h+IymnuyFlk1bf2T8poOIyiwvzmUW5OHxQ3EDLasF+HzsVIVj/NZgtsiP
X-Gm-Message-State: AOJu0YwLcNde8r3FFP/iNvrErsdPRNQjj3lnBSZNixoF4Yxm0LZOI+Kj
	UBCSADKlEd1Okh0I/fzgehyuhwCsuDDtFSHv68uAmj1EiigcXqkA7B7CoZ7q/7v3V9xSCRTA0xX
	wjdbYLyuRHSisBr/aX8VUFdj62/mHMnngS/lNQ7gr849kQQX/unmtH0RJn2HE6RaWYZxAKmndvq
	/pk3jMOQ==
X-Received: by 2002:a17:906:d7d3:b0:a7a:bcbc:f7e1 with SMTP id a640c23a62f3a-a8366c32951mr208988966b.15.1723647405480;
        Wed, 14 Aug 2024 07:56:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHc/yfSJrvFTuMnyZ4+Y0SRDIMqZrC+J2GedSuxes8D5p74/pWwqtE1Vv2fGbgkAkF4zdDaxg==
X-Received: by 2002:a17:906:d7d3:b0:a7a:bcbc:f7e1 with SMTP id a640c23a62f3a-a8366c32951mr208986766b.15.1723647404802;
        Wed, 14 Aug 2024 07:56:44 -0700 (PDT)
Received: from stitch.. ([2a01:4262:1ab:c:bbf4:eba3:898f:7501])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f411bdcbsm182316866b.105.2024.08.14.07.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 07:56:44 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Anup Patel <apatel@ventanamicro.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v1 1/9] Revert "irqchip/sifive-plic: Chain to parent IRQ after handlers are ready"
Date: Wed, 14 Aug 2024 16:56:33 +0200
Message-ID: <20240814145642.344485-2-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
References: <20240814145642.344485-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_075653_060866_CB8EB635 
X-CRM114-Status: GOOD (  16.60  )
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

This reverts commit e306a894bd511804ba9db7c00ca9cc05b55df1f2.

This is a prerequisite to reverting the patch converting the PLIC into a
platform driver. Unfortunately this breaks booting the Allwinner D1 SoC.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 drivers/irqchip/irq-sifive-plic.c | 34 +++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 9e22f7e378f5..8fb183ced1e7 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -85,7 +85,7 @@ struct plic_handler {
 	struct plic_priv	*priv;
 };
 static int plic_parent_irq __ro_after_init;
-static bool plic_global_setup_done __ro_after_init;
+static bool plic_cpuhp_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 static int plic_irq_set_type(struct irq_data *d, unsigned int type);
@@ -487,8 +487,10 @@ static int plic_probe(struct platform_device *pdev)
 	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
 	u32 nr_irqs, parent_hwirq;
+	struct irq_domain *domain;
 	struct plic_priv *priv;
 	irq_hw_number_t hwirq;
+	bool cpuhp_setup;
 
 	if (is_of_node(dev->fwnode)) {
 		const struct of_device_id *id;
@@ -547,6 +549,14 @@ static int plic_probe(struct platform_device *pdev)
 			continue;
 		}
 
+		/* Find parent domain and register chained handler */
+		domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
+		if (!plic_parent_irq && domain) {
+			plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
+			if (plic_parent_irq)
+				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
+		}
+
 		/*
 		 * When running in M-mode we need to ignore the S-mode handler.
 		 * Here we assume it always comes later, but that might be a
@@ -587,35 +597,25 @@ static int plic_probe(struct platform_device *pdev)
 		goto fail_cleanup_contexts;
 
 	/*
-	 * We can have multiple PLIC instances so setup global state
+	 * We can have multiple PLIC instances so setup cpuhp state
 	 * and register syscore operations only once after context
 	 * handlers of all online CPUs are initialized.
 	 */
-	if (!plic_global_setup_done) {
-		struct irq_domain *domain;
-		bool global_setup = true;
-
+	if (!plic_cpuhp_setup_done) {
+		cpuhp_setup = true;
 		for_each_online_cpu(cpu) {
 			handler = per_cpu_ptr(&plic_handlers, cpu);
 			if (!handler->present) {
-				global_setup = false;
+				cpuhp_setup = false;
 				break;
 			}
 		}
-
-		if (global_setup) {
-			/* Find parent domain and register chained handler */
-			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
-			if (domain)
-				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
-			if (plic_parent_irq)
-				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
-
+		if (cpuhp_setup) {
 			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 					  "irqchip/sifive/plic:starting",
 					  plic_starting_cpu, plic_dying_cpu);
 			register_syscore_ops(&plic_irq_syscore_ops);
-			plic_global_setup_done = true;
+			plic_cpuhp_setup_done = true;
 		}
 	}
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
