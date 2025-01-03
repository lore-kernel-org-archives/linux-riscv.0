Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AA7AE77188
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jan 2025 13:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TyWFgXFfo170yZKZd5EXbxTSqm+ElcHPgX0U4pAVYfk=; b=x+XGTrG1tqmTwy
	YdRse0ThMVYVW3a55O5kt7kN0NZATeqOTn3cUGZzbiYi6x5nep6oiafAS3TawcDdOQ27JlPeGNgf5
	2EhD6HNIdSubBoNrysL7bkcahcqbqa2hV79nbc5zaJmGNtxTYPZkY3wSk/Oc8+GL9ioaRw9/H35UC
	Tt6F8TyMQpTrUxUr4lXcPxTVllSDLRt8f12H+A9Zt0HNhyr5X8akTarfdRBdwyCk0s+FUKPADaDi5
	FbqiPPoRO4y5PwkwngPm0M9tstY42IVCz/tSWALhAaC/Vxd+K57ThAjj92YJiJDRMUrnZH0sYeclz
	5gqyaVf0nL2xyvSvUcjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tThHy-0000000CxMi-45GO;
	Fri, 03 Jan 2025 13:00:30 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tThHw-0000000CxLL-1D8J
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jan 2025 13:00:29 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2163bd70069so71085675ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 03 Jan 2025 05:00:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735909227; x=1736514027; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3IC8pHAXBnHweFaq0TqnW2AnPKbh58D2DOWeo9mLza8=;
        b=BSUpX/qb7LIeM7YDRVAsr1iZqyAowDJNPSfpf5Joz9wVfw2ChadFF4l6yFbby9fapr
         /HvcN2D1UCzjXCmvt+F5+kAzaU3PIQgoJL1jsmY5DZbae+rnfAcwqo91PLezdtk8yL+e
         4kMA6qqAyKY5v4leZ4oYxEpNYltG0y4dUbuLp+Yv7taUdSkeL3dKFoY4g9NM7OckDt+g
         FKPpHS+orJzGwoS+kU65tdBIh/cYiDqC1M6Kb/gRvhbnRiJdcMkLAk/1QG0YopEBGL9Y
         33zr65AYm2Wb9nFPmV0nj4exAnlwIe0rct3Zcirfbj/9m0GeNHD3HIkExmBz7I+9M8z9
         jVxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735909227; x=1736514027;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3IC8pHAXBnHweFaq0TqnW2AnPKbh58D2DOWeo9mLza8=;
        b=F1wp5hwra/wjiMkJuHNs+B3S/03OBIj2ss6dbwJLU6e7kE0DSTDcPR7iQMPRleooXy
         GYipqQP4YEd5hZhTYNejbZoiRn045AMzJOlb5Bk1JP6Z9ImqTnap33LF9Jh4CrT29nxg
         o9G0iIZqiNk34guxdF5pdvUGxR6kcbqFiCK0BXkMMaOiC72xQfih6/eyCCYJnxLyf6qz
         dbbtR4oWhwgH8UaBHWsaT/NPPniMDjKJf/Uz3zKz4iVq3H/1gmheTL2mVfK89OVuRsIY
         4Y28lKW9cDwa/5FKKAnhlb2g2xKD+2NjdCGr4INltGoRDwZEHQxT7m69kNbLTctz4W+6
         Xkpw==
X-Forwarded-Encrypted: i=1; AJvYcCU2s9Y5V4GcppBTYC1rkUIzbjXaaaBa30lMAx4udP1G4ZXz8NdIdp+0GM/K6wIAK5uO7Dh+vl+ujiAgng==@lists.infradead.org
X-Gm-Message-State: AOJu0YybDytYWkJZbDpoV34gtw3cZ9subXvdQLgTlWfNbKaUFFVxk2yz
	giyfA5xppGg4X2jDBGayWgZJqI6OBY30E4F+1gaRKAQ2AoY+TaiugJZ1nqKhw/k=
X-Gm-Gg: ASbGncvqNKOHTg7PVbwK9+Kqrgxd95h9K2f2UmoU8owv4mkfvELlO6nza21yBwYabhz
	r1DpndHbkmvE4ujOBP7EBQVdi9U3JrnXYVdUr6sr2yRmPjznD+KH52o8hC6S9riONiq5xp0SBCk
	YbiyjQQ7832yhkF+69JlS2UnwhPynlkL8nQoQ3LDNlXfyOzPjj+1vKPLKLq5aSSE+lCugUQ1IZC
	X7ntjswTL3X6+IwMQfEBhRo5brqTFHsO8hi/DnykhL5XorVzXZggrOHLC80WZXlZ75nvb0rewdz
	COz23EEY7r/1jPVrYr/slU6Qyq8c9a0X8yyDKNk=
X-Google-Smtp-Source: AGHT+IFN5bHsIB1vygR17dR/EPZKajkRBHEdNUkbVb4Fp3ZLcSef1rUquFUDTP26CTgg1Aj/Zy2YqQ==
X-Received: by 2002:a17:902:db0e:b0:215:8695:ef91 with SMTP id d9443c01a7336-219e6e8957amr732305365ad.6.1735909226965;
        Fri, 03 Jan 2025 05:00:26 -0800 (PST)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc970c8fsm244601745ad.60.2025.01.03.05.00.23
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 03 Jan 2025 05:00:26 -0800 (PST)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	tglx@linutronix.de,
	paul.walmsley@sifive.com
Cc: lihangjing@bytedance.com,
	xieyongji@bytedance.com,
	guojinhui.liam@bytedance.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] irqchip/riscv-imsic: Support allocating multiple msi-x vectors
Date: Fri,  3 Jan 2025 20:59:26 +0800
Message-Id: <20250103125926.54203-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_050028_331205_78671B70 
X-CRM114-Status: GOOD (  12.95  )
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

This commit modifies alloc and free callback of imsic_base_domain to
support allocating and freeing multiple msi-x vectors at once.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 54 +++++++++++++---------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index c708780e8760..d0ea0eb22e2e 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -141,35 +141,45 @@ static struct irq_chip imsic_irq_base_chip = {
 				  IRQCHIP_MASK_ON_SUSPEND,
 };
 
+static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
+				  unsigned int nr_irqs)
+{
+	struct irq_data *d;
+	int i;
+
+	for (i = 0; i < nr_irqs; i++) {
+		d = irq_domain_get_irq_data(domain, virq + i);
+		imsic_vector_free(irq_data_get_irq_chip_data(d));
+	}
+	irq_domain_free_irqs_top(domain, virq, nr_irqs);
+}
+
 static int imsic_irq_domain_alloc(struct irq_domain *domain, unsigned int virq,
 				  unsigned int nr_irqs, void *args)
 {
 	struct imsic_vector *vec;
-
-	/* Multi-MSI is not supported yet. */
-	if (nr_irqs > 1)
-		return -EOPNOTSUPP;
-
-	vec = imsic_vector_alloc(virq, cpu_online_mask);
-	if (!vec)
-		return -ENOSPC;
-
-	irq_domain_set_info(domain, virq, virq, &imsic_irq_base_chip, vec,
-			    handle_simple_irq, NULL, NULL);
-	irq_set_noprobe(virq);
-	irq_set_affinity(virq, cpu_online_mask);
-	irq_data_update_effective_affinity(irq_get_irq_data(virq), cpumask_of(vec->cpu));
+	int i, err;
+
+	for (i = 0; i < nr_irqs; i++) {
+		vec = imsic_vector_alloc(virq + i, cpu_online_mask);
+		if (!vec) {
+			err = -ENOSPC;
+			goto error;
+		}
+
+		irq_domain_set_info(domain, virq + i, virq + i, &imsic_irq_base_chip,
+				    vec, handle_simple_irq, NULL, NULL);
+		irq_set_noprobe(virq + i);
+		irq_set_affinity(virq + i, cpu_online_mask);
+		irq_data_update_effective_affinity(irq_get_irq_data(virq + i),
+						   cpumask_of(vec->cpu));
+	}
 
 	return 0;
-}
-
-static void imsic_irq_domain_free(struct irq_domain *domain, unsigned int virq,
-				  unsigned int nr_irqs)
-{
-	struct irq_data *d = irq_domain_get_irq_data(domain, virq);
 
-	imsic_vector_free(irq_data_get_irq_chip_data(d));
-	irq_domain_free_irqs_parent(domain, virq, nr_irqs);
+error:
+	imsic_irq_domain_free(domain, virq, i);
+	return err;
 }
 
 static int imsic_irq_domain_select(struct irq_domain *domain, struct irq_fwspec *fwspec,
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
