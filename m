Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB551C27C43
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 21:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8PTsVdwpRvWsjRSfjfIZtQMng08XVwk3Ga7p709QK7c=; b=GoZ0kuX1O49ASI
	MVkVpP+WvqUWv3uJrjNNMNY02xQ5GTiCe3hINpscl3vI6xg/ju2+lWwifMonfyfwWJhsuFc0hWSER
	KZBMMSGn5PN7EQ130L2YWrM5a5A+onZVduC+qLqQUuVl0Y1LJzqcwksIogmxH6I7L7TTVPq18ILEB
	EprxK7ApgRlIEWceHlrq/Zn+3sLFzfRhf8Q8D/BaKp3dpxLFvi1QWKv2cvjTO4IGsgwuiIuth4Jnz
	HxKBTZRIrNEIgwl/2Idx88iq0FzrCsMGit1CSoX+0cMsUqyqdbUCS7UQOIuWIajbv1/1UsJxsDBkF
	qzr6442NW8wKPIk20wgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRGD-00000005dt9-0KsI;
	Wed, 29 May 2024 21:55:05 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCRG9-00000005dsA-2hUg
	for linux-riscv@lists.infradead.org;
	Wed, 29 May 2024 21:55:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-68195b58daeso187096a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 29 May 2024 14:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1717019700; x=1717624500; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JkamhnzZzL+d5XOCP7ZQRgk3oaOwgUEN9NLGiuPviks=;
        b=Ev8nSMSFJGPXRS091xR1q1JSoi2WjZLljwBs2mQjFmHBbsW5QVA3Qvw+BkaBtHOsuF
         QgFMRIOCqsiNyRM+8DmuFqMeAfPE7p9My+wMdRlm31XSDPhYjJ27L8lfpEDiaZXcsYLi
         ofN5GvWVhihEghoLEHnlrpEodJWEXIEM/hzxFWNJtONeZjERBnKTRSWkc4zIDqdJ5QZZ
         ZIGmMjOahinxjGLdU0EIQ0IoSFyqXXEYN0YgE2mU++gCsY6Vwl+7tESL7uy8WlhQLvSw
         sgAbxB/8Xzmyp/k9QK/Hz87nRsPB9xq9d+3+cXAMv5Jmx0xKn1bdf7lkM/1XdPWoUVE6
         guUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717019700; x=1717624500;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkamhnzZzL+d5XOCP7ZQRgk3oaOwgUEN9NLGiuPviks=;
        b=Ptug6WGEtfpSsMf160CbW6k0RAfJJDQykbQDg+S2eUTmOyALOiEF2n7Fi51jwYKA1G
         SJWqGMsmDpnaidtw4Vw+I1WzF1mqKcQ1yokNm84OHS6PIkxUoRmV1beY9KpWlTFUR8v0
         khwtGG48rXWJZ4ceCv/gTVsXhUppNL9n1N8ivAQnbeCf9OQ31Lk7eq2kdz7kF9Ucugxn
         KfMtI0/i8LGpmeNMu5wLGQw5RgjqPbS1zmjLIFGcQf11tB4N5PWel2wlGcBDZboCf8pN
         Z9g6+SyGeC4geBa3OhSrE3oKPWB3LBIiyjnRnGglYpqC53kguKxQIZIMgSmTVAoTgeG+
         WUQA==
X-Forwarded-Encrypted: i=1; AJvYcCXEtXN0T4nd9RtjXGdHOZE7cKHMOgbohGim8TSmTz3bT/waSRXFupuF3LkU90VbSAaZiYiNhmOkaG0DgewQb9qt7isNiu1lPYDODtXHE7Z3
X-Gm-Message-State: AOJu0YwmarHcHtiMAkf52sG5KHSSewhKKheUunR/sGuTtMiMCLkjxfi0
	Ae07UeuWOs/keoeTlEDeE1VxCY7DM7FYyq+Nl/v+aDqiL2UJBuDMhsVVExq9mUI=
X-Google-Smtp-Source: AGHT+IEyd+1nf+mYeXxqbzWxP0KkmJ38q4hcn4FSLb1gMwyFmtQyII9SHwxxRo8Vj3wVM4NLSPx0tg==
X-Received: by 2002:a17:902:e806:b0:1f2:fe82:21e9 with SMTP id d9443c01a7336-1f61983aad4mr3454005ad.46.1717019700374;
        Wed, 29 May 2024 14:55:00 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c994a66sm104445115ad.182.2024.05.29.14.54.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 14:54:59 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] irqchip/sifive-plic: Chain to parent IRQ after handlers are ready
Date: Wed, 29 May 2024 14:54:56 -0700
Message-ID: <20240529215458.937817-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_145502_361253_26625119 
X-CRM114-Status: GOOD (  18.12  )
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

Now that the PLIC uses a platform driver, the driver probed later in the
boot process, where interrupts from peripherals might already be
pending. As a result, plic_handle_irq() may be called as early as the
call to irq_set_chained_handler(). But this call happens before the
per-context handler is completely set up, so there is a window where
plic_handle_irq() can see incomplete per-context state and crash. Avoid
this by delaying the call to irq_set_chained_handler() until all
handlers from all PLICs are initialized.

Fixes: 8ec99b033147 ("irqchip/sifive-plic: Convert PLIC driver into a platform driver")
Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/r/CAMuHMdVYFFR7K5SbHBLY-JHhb7YpgGMS_hnRWm8H0KD-wBo+4A@mail.gmail.com/
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-sifive-plic.c | 34 +++++++++++++++----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 8fb183ced1e7..9e22f7e378f5 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -85,7 +85,7 @@ struct plic_handler {
 	struct plic_priv	*priv;
 };
 static int plic_parent_irq __ro_after_init;
-static bool plic_cpuhp_setup_done __ro_after_init;
+static bool plic_global_setup_done __ro_after_init;
 static DEFINE_PER_CPU(struct plic_handler, plic_handlers);
 
 static int plic_irq_set_type(struct irq_data *d, unsigned int type);
@@ -487,10 +487,8 @@ static int plic_probe(struct platform_device *pdev)
 	unsigned long plic_quirks = 0;
 	struct plic_handler *handler;
 	u32 nr_irqs, parent_hwirq;
-	struct irq_domain *domain;
 	struct plic_priv *priv;
 	irq_hw_number_t hwirq;
-	bool cpuhp_setup;
 
 	if (is_of_node(dev->fwnode)) {
 		const struct of_device_id *id;
@@ -549,14 +547,6 @@ static int plic_probe(struct platform_device *pdev)
 			continue;
 		}
 
-		/* Find parent domain and register chained handler */
-		domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
-		if (!plic_parent_irq && domain) {
-			plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
-			if (plic_parent_irq)
-				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
-		}
-
 		/*
 		 * When running in M-mode we need to ignore the S-mode handler.
 		 * Here we assume it always comes later, but that might be a
@@ -597,25 +587,35 @@ static int plic_probe(struct platform_device *pdev)
 		goto fail_cleanup_contexts;
 
 	/*
-	 * We can have multiple PLIC instances so setup cpuhp state
+	 * We can have multiple PLIC instances so setup global state
 	 * and register syscore operations only once after context
 	 * handlers of all online CPUs are initialized.
 	 */
-	if (!plic_cpuhp_setup_done) {
-		cpuhp_setup = true;
+	if (!plic_global_setup_done) {
+		struct irq_domain *domain;
+		bool global_setup = true;
+
 		for_each_online_cpu(cpu) {
 			handler = per_cpu_ptr(&plic_handlers, cpu);
 			if (!handler->present) {
-				cpuhp_setup = false;
+				global_setup = false;
 				break;
 			}
 		}
-		if (cpuhp_setup) {
+
+		if (global_setup) {
+			/* Find parent domain and register chained handler */
+			domain = irq_find_matching_fwnode(riscv_get_intc_hwnode(), DOMAIN_BUS_ANY);
+			if (domain)
+				plic_parent_irq = irq_create_mapping(domain, RV_IRQ_EXT);
+			if (plic_parent_irq)
+				irq_set_chained_handler(plic_parent_irq, plic_handle_irq);
+
 			cpuhp_setup_state(CPUHP_AP_IRQ_SIFIVE_PLIC_STARTING,
 					  "irqchip/sifive/plic:starting",
 					  plic_starting_cpu, plic_dying_cpu);
 			register_syscore_ops(&plic_irq_syscore_ops);
-			plic_cpuhp_setup_done = true;
+			plic_global_setup_done = true;
 		}
 	}
 
-- 
2.44.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
