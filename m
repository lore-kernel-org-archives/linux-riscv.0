Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D07FCCD19F
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Oct 2025 19:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rjfzcywdA9q0l7L3Ebqqifq2HQxVosuB/dx2gFkO0ig=; b=CzalYS1Cx2nMM+
	dsr1FwMOyJUZAhCvdwfxxJuoxtgA1EYLfX7tNItZhHDLR3x8l+2U7nSWMklE6eI4xrXLI6Lru6O9p
	WCHpPIcuT5PIygmwV6zNMcTa4sMeBhfNJJ0HLXIrXbS1wMwYpG2V4CaE1JIsYSk3iWob4aD4YZCKi
	wWLwXqCqEYBS3eImXrnOYNpfeD95HRYP5cUaT4q+9BaEvno2yQuVhKpSQPQZbVGzJwxlFdqfU/St0
	V4Ay4M+9bUT0ty0a7DZYRUkFzBJoAaLnHwz+3xzk6nmA1PkPr3tN2H2t482GmxK4opowUoDpspCQV
	v6n+x72dqySN98npaQlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97cd-00000002ngi-1cof;
	Wed, 15 Oct 2025 19:57:19 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v97ca-00000002neu-3KoZ
	for linux-riscv@lists.infradead.org;
	Wed, 15 Oct 2025 19:57:17 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-781206cce18so1468131b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 12:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760558236; x=1761163036; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2XXJNRa+a1EmBL15srEVpdMPkO8sE1KKJAIBSS6n0KY=;
        b=SsfWUt7HSGq/b2jOPqyWE7lEcijYutMg1V6ETX9nFNkwWgGU4QcxdY4Y1tirfw+Kqy
         GdNo90rlnn6mTS+eUsyKNcTUUkp4jVy7gpR1e3i2pIhu5+ASAuVfM0nslNgLWiWH+p27
         3mo0xWU0jVlY6lU3kPUkzv8LVnOe5SWzCG4eMpOWsK8cDpA9CN2+F91A93VOlzO2t3GL
         oLdQdsm27bjpJ7SAsk91k+k6h7NTvTWn7B2tQXopK71ts+vJ+0FJw86m2RJefdt1AyCP
         FBgxQEuvNyVpLCkae06dtD97VkVMWo+RgDNE1KW24JQFOiLDBdHMb9viZ6AwKPIZ3m9u
         rx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760558236; x=1761163036;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2XXJNRa+a1EmBL15srEVpdMPkO8sE1KKJAIBSS6n0KY=;
        b=OA7nQSlxiZnZ3jOc6OIT5wfiwzPZN1TNyxDlrp0E8l5sUOXGPIW9zyOKOJSIWgtv37
         R1naQDC9owlJFEAyqRuklSwZG1VpFkXF1ZHBo5PJbofQgpXABD532Vnk2SaS7IJxGm26
         FI84x0qKxictLknhaoW+uQ8k7hsUyZ6gzaYkQ5FRlQQpyHMlZeuOHSdhss+A3t8h1S7E
         NF9R0nL1xu7bG3xwOeXb1/67Vaw3jaYUvN2NykUuXOAMlqyrUCYKHcAv1+l1PT6dq8hi
         R7ptL9kktWMJfDk5cZ3Uwkk6CmDgsQVjN8A/kcp7uOoABpXn22rYnB6t+zMOPV7gcyCx
         VeXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGYGWta1Qrp1qU3l9InT1xGOt1q5//T7LCvrL2JAl/MjbTvnqRxBMUpM03db8DiXsFCWQwWC6GDY0CBw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3ijE9155ZgwdNjaCcXruFRDdCBBaXrONOy7VHw3Rnd8Fmydgb
	PqfUusLmZtdRyIBx/dVF47pBn0Q7FcXHPBvlSlVaCiDelxS5cEaeS8IBEWRf+e/oxBk=
X-Gm-Gg: ASbGnctfQtulJaY5kinRX25JEs2NoV5PtPcg6YOFtczXDw3MkIYun99ScInjIcNm5VR
	+nVot+z1mSoFfbZZ0x5XfP0ChONVMbuvAurniLli2Om/+tGas6xEvAeDIC7RepWzDK6/I5hPeUp
	mrkgLYgXu3orAS8OPIMJCfdygD4oG5O3KHzc+Stnk9rOsM036hrsY+GhW5GmzdefULTYGBtcGXb
	iEHmU77FmYfmboKBdvC957aUy+4oIRj47nCHuuhHQbWf9W7a1o3D7ysD8tKsCzu45jaoW3HxSOr
	ATQ+EOlltQM1P68RjT/Y6gxnleSJQmbEag0YsNOIzZD1p6F9FBJ+fqmuuvpdaOIVCino2emyFFn
	mQv6LQdb2KESkwXCP++1b9xpaOgovnt0bq4y0Dxg2k1unXxUy/C/MsX/Npx7lo4oEICPR+Wvgbw
	==
X-Google-Smtp-Source: AGHT+IFYzvKYJ39wIxnM+7RE1dPFgDr4+Lj3QmztieH+Js7P0YTUrQYUELqiUNF31KEmW0OEISH7cA==
X-Received: by 2002:a05:6a20:42a3:b0:32b:8022:15 with SMTP id adf61e73a8af0-33495c20923mr1630846637.3.1760558236034;
        Wed, 15 Oct 2025 12:57:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b06075fsm20151322b3a.17.2025.10.15.12.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 12:57:15 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH 2/4] irqchip/riscv-imsic: Embed the vector array in lpriv
Date: Wed, 15 Oct 2025 12:55:13 -0700
Message-ID: <20251015195712.3813004-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251015195712.3813004-1-samuel.holland@sifive.com>
References: <20251015195712.3813004-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_125716_840215_7743CBC2 
X-CRM114-Status: GOOD (  13.12  )
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

Reduce pointer chasing and the number of allocations by using a flexible
array member for the vector array instead of a separate allocation.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 drivers/irqchip/irq-riscv-imsic-state.c | 10 ++--------
 drivers/irqchip/irq-riscv-imsic-state.h |  2 +-
 2 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index dc95ad856d80..9a499efdebe3 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -487,7 +487,6 @@ static void __init imsic_local_cleanup(void)
 		lpriv = per_cpu_ptr(imsic->lpriv, cpu);
 
 		bitmap_free(lpriv->dirty_bitmap);
-		kfree(lpriv->vectors);
 	}
 
 	free_percpu(imsic->lpriv);
@@ -501,7 +500,8 @@ static int __init imsic_local_init(void)
 	int cpu, i;
 
 	/* Allocate per-CPU private state */
-	imsic->lpriv = alloc_percpu(typeof(*imsic->lpriv));
+	imsic->lpriv = __alloc_percpu(struct_size(imsic->lpriv, vectors, global->nr_ids + 1),
+				      __alignof__(*imsic->lpriv));
 	if (!imsic->lpriv)
 		return -ENOMEM;
 
@@ -521,12 +521,6 @@ static int __init imsic_local_init(void)
 		timer_setup(&lpriv->timer, imsic_local_timer_callback, TIMER_PINNED);
 #endif
 
-		/* Allocate vector array */
-		lpriv->vectors = kcalloc(global->nr_ids + 1, sizeof(*lpriv->vectors),
-					 GFP_KERNEL);
-		if (!lpriv->vectors)
-			goto fail_local_cleanup;
-
 		/* Setup vector array */
 		for (i = 0; i <= global->nr_ids; i++) {
 			vec = &lpriv->vectors[i];
diff --git a/drivers/irqchip/irq-riscv-imsic-state.h b/drivers/irqchip/irq-riscv-imsic-state.h
index 57f951952b0c..196457f1bbca 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.h
+++ b/drivers/irqchip/irq-riscv-imsic-state.h
@@ -40,7 +40,7 @@ struct imsic_local_priv {
 #endif
 
 	/* Local vector table */
-	struct imsic_vector			*vectors;
+	struct imsic_vector			vectors[];
 };
 
 struct imsic_priv {
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
