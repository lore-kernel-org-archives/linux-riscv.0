Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451F7CCD185
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 00:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wbrSEio6fCcR0epoI4btS4S0J5v5a61XLgF2g3SNN6I=; b=wQZ1oqocMnw+N8
	WDCy/gR9a4oWaju/1BTnAj7RktdlLpFxp7bd18pO5/DgD0yukmyYnYNjlf2npWyr/I29Q+6n7ihjQ
	iz7JzD6GI5TrfI3q9wcXdiaL3kNtvn3EG3bjyQjL4EN8ht8SXTXt39XMqiYvhgQOTVPAJB4rXGdeE
	jg0q1IRZ/StB4L+I+CwwYymTtxldFl1J6fA3DrI5fB7Gd0j1nSI/0G3qsHi9KclYHyrUbSshD1Dqx
	+62FZhTW9NGrf/iuptILP66cFsSE0YL4jAW5bDKKvZnA9cJShHjlnGt4hDpgAkJ5x8x7K703lWSHg
	tneecDQ/pOlaDThQtGrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BvE-000000039VD-2UQE;
	Thu, 16 Oct 2025 00:32:48 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9BvC-000000039Ur-41FT
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 00:32:48 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-79ef9d1805fso180015b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 15 Oct 2025 17:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1760574766; x=1761179566; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Wl/lY8JAaE7A8957nqq7PMXYFhem+rXkxRLcRBl4qnU=;
        b=ib6q4CR3LtTS4XLgdOD6rv8Q50pQLhchdESnlcmC+FCe8kvKZR6qujhmCxW3bsaKip
         zjLRVcORtywVupM8Guy5waVQt06wPTKUumJwbQZCQEJVY7mwjchvQ2kQ11WG1O8eeNiv
         ICc6/Bm33Jb6tpCBuhwileC8LoPTTDwI27b4SUW60UZ1UmzbIRhkhndBuGQO56tGMWUG
         xxI6/CVawjlhkFCN8V7yAnjOspzaUge1OpGnCzRFtCqa5ShIuFKOEZfezVE0Bi9UXRAo
         //GK6BbvwXgRJackNroJCVKMGBdzcyrr7kPIwgaKgF1qIZRE+AcV5s38OJLfLTuz5BuS
         pvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760574766; x=1761179566;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wl/lY8JAaE7A8957nqq7PMXYFhem+rXkxRLcRBl4qnU=;
        b=qcvY+uDqM/75qMzO8hQ/1kmmcOemAMbWkog1cHGhVqxqFoWhOE4tEVaeIx11tF782n
         UY+2ORiFgoBOthJ4MPwrIVQWYrOzdpTD1ZRplGsRaEk4F+Pv7Km1Xen38mUx3+CH8IHE
         Z8HOdjn3ZZA54OymkLeMpnuigMtgO4Uu12N9G/bbVW/OJ/u4S+/GS22lwKx+HMdGgH4J
         /xtuC6La0EG0x7IpuL+VNXoAZHR4pevLbadxkwhy4tR+F8wa2cYJkLunyzkAHITi4QTZ
         RiBghPPDhKMotfkHY/TIc/jglL6Ivsf2FEGvwKAcNLcT8qW8Id8cgDBk69pLACpsszP7
         H8Nw==
X-Forwarded-Encrypted: i=1; AJvYcCVXV7gUWGH/2T6RvIQjmU/TBlq8EMqN5oRDmGdci5Fv03/yVd3rP2AaarwL4PFg209SNf8ngZzV9ZWP/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxiRx9CwGa/u221LN00tjfYgi+3u7xG1p4EP4zmci3sNVFYmdca
	+pDhujDHD5+AV94WXNFqZnQci8FbSCGPW1COFS4xLuGNDYA0Gn/Og9AjaeT2EqeTpOI=
X-Gm-Gg: ASbGncvdeguAE2SpyFskQ7xg4tl7hMgBn6BaLnDppCPgd+2vnUoLGnnpXKRsrxgbfUg
	0b8vxXcO4Hcpid5iBprZcxgVh1WiFdJWvw1MZIYNQqmH3cR+LKm7qS13SP1zIcZQtLeDiQWOFxh
	5xDKvZth4gW8fydpGu8+EuxlqkqPD2IZLYoPfkYOCFR5n02N6km7DkcgZyZWcaSWfQ8OMkh29fz
	vmoleMZ/hGO7CNAKNuAkEwPj7E9NSY9Zo1vUvv+SaueEUeP/GjKvyu6vyjCMTFZFblo2XGGUtyN
	EhN4LsY9uJEBnyqD2MK+TGlGr1moDGLW3/Dv3kaZ/8qhkSOqtku8fmpgNvGdIP9nJ8rF6nPQmH+
	dJYzk9ORDbVmPyvBQvijKXee7hxeKfXo/AMBGGL5cZM+kqolZ9pRK8E+7tcttVGMVsfJdsoWiH0
	ZDP9QDZFNiEQNN2VgjBrkXbxIx0aH7OJbs
X-Google-Smtp-Source: AGHT+IHLzh9TmRMIItVhwqjxb8DLVTBAx6eIunXzY4s4RJzGl3w59VWm5xr1ObSp2GfFAAyuDlXIcQ==
X-Received: by 2002:a05:6a20:12cd:b0:2f8:4558:ad9e with SMTP id adf61e73a8af0-32da839ee26mr41282091637.33.1760574766115;
        Wed, 15 Oct 2025 17:32:46 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992b060b59sm20620987b3a.2.2025.10.15.17.32.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 17:32:45 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Valentina Fernandez <valentina.fernandezalanis@microchip.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Register IPI IRQs with unique names
Date: Wed, 15 Oct 2025 17:32:05 -0700
Message-ID: <20251016003244.3910332-1-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_173247_031003_6B51F0B6 
X-CRM114-Status: UNSURE (   9.48  )
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

This allows different IPIs to be distinguished in tracing output.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/kernel/smp.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index e650dec44817..5ed5095320e6 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -40,6 +40,17 @@ enum ipi_message_type {
 	IPI_MAX
 };
 
+static const char * const ipi_names[] = {
+	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
+	[IPI_CALL_FUNC]		= "Function call interrupts",
+	[IPI_CPU_STOP]		= "CPU stop interrupts",
+	[IPI_CPU_CRASH_STOP]	= "CPU stop (for crash dump) interrupts",
+	[IPI_IRQ_WORK]		= "IRQ work interrupts",
+	[IPI_TIMER]		= "Timer broadcast interrupts",
+	[IPI_CPU_BACKTRACE]     = "CPU backtrace interrupts",
+	[IPI_KGDB_ROUNDUP]	= "KGDB roundup interrupts",
+};
+
 unsigned long __cpuid_to_hartid_map[NR_CPUS] __ro_after_init = {
 	[0 ... NR_CPUS-1] = INVALID_HARTID
 };
@@ -199,7 +210,7 @@ void riscv_ipi_set_virq_range(int virq, int nr)
 	/* Request IPIs */
 	for (i = 0; i < nr_ipi; i++) {
 		err = request_percpu_irq(ipi_virq_base + i, handle_IPI,
-					 "IPI", &ipi_dummy_dev);
+					 ipi_names[i], &ipi_dummy_dev);
 		WARN_ON(err);
 
 		ipi_desc[i] = irq_to_desc(ipi_virq_base + i);
@@ -210,17 +221,6 @@ void riscv_ipi_set_virq_range(int virq, int nr)
 	riscv_ipi_enable();
 }
 
-static const char * const ipi_names[] = {
-	[IPI_RESCHEDULE]	= "Rescheduling interrupts",
-	[IPI_CALL_FUNC]		= "Function call interrupts",
-	[IPI_CPU_STOP]		= "CPU stop interrupts",
-	[IPI_CPU_CRASH_STOP]	= "CPU stop (for crash dump) interrupts",
-	[IPI_IRQ_WORK]		= "IRQ work interrupts",
-	[IPI_TIMER]		= "Timer broadcast interrupts",
-	[IPI_CPU_BACKTRACE]     = "CPU backtrace interrupts",
-	[IPI_KGDB_ROUNDUP]	= "KGDB roundup interrupts",
-};
-
 void show_ipi_stats(struct seq_file *p, int prec)
 {
 	unsigned int cpu, i;
-- 
2.47.2

base-commit: 5a6f65d1502551f84c158789e5d89299c78907c7
branch: up/ipi-names

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
