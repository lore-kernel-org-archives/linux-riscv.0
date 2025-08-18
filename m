Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AEDCA0EED
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Aug 2025 05:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTV2I6NoIPAex57Kj4mYHPbPDbzBDojx7aR7MRoS7n0=; b=r56rF3sSwTmU7/
	JWih8DVE2tIo7Utg/M3XB6nY3kD121bPD1sVrtXxMjG7BRpF2JCYq5TtQ4D6QH3+7h4NdU8zFxyMa
	VPZh/Td6q+7iNg9P5B/Cg86+UmU1zMr/SzZQ279zezsif1YyRwVrum45JMjhwlt1qlM6M1q2ExaX4
	ZSgeH+BHdGBG4FiaeXZwa9tMXKRyvCvmBqculK36kNtpBrh2qyAXNMbHaohHq1tj+9GZIX08nnu7t
	FoEh+9PIBoI81k61sVmklz3+KDSlsaLHAnRYkfKSsd5ATyDl6BQ3wmeR+5TCwr+QX4lRr/UBGToGU
	4KexFoTagGpQZvEdTThA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unsGM-00000006XDK-2qmM;
	Mon, 18 Aug 2025 05:18:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEr-00000006Riy-3uvt
	for linux-riscv@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1yWqS/B4+C2GeeCl07+fnbYmzaV3u99GO7HLw3KmW+Q=; b=JFkcP04YbG9Oo11cJmiu0xube0
	K6uCC1U0CrN2tlvrM/HRN/lfv9hwhTVObs8DZzf63kaAiwZ1i9ISwE041GLTvtoGy+wIt/DJHpAZV
	DNGMPMD86u8xT7B+9d3eljrZn6R7A3qtC68azb07J5mu8DulWBhlQSSCq3DyZkIGwZoqunHlmh8ZD
	N8YwjH+BxxGqylrPqkyKI6TF3dLsYy+XswLfNfgWaQvRUdocpAkZIBmo38bLjilpL4L0Oy+eueNae
	JGXsthSFtC5SQ/2ZxEUk6OwawOVLa1mkRGiNsv3eI1OGLhR50s4duDZtYXkN5jLkcWsNyKJFr5yKn
	C5C7UKlQ==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrEc-0000000HEDK-3P65
	for linux-riscv@lists.infradead.org;
	Mon, 18 Aug 2025 04:12:51 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-323266cdf64so2754236a91.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Aug 2025 21:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1755490355; x=1756095155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yWqS/B4+C2GeeCl07+fnbYmzaV3u99GO7HLw3KmW+Q=;
        b=aXOLNlSjIrIrAb1aQGXwxPhCsE98fHfirvg+c2ytY++zU6Sp8UmosUJUVWJbCQ/oWu
         M5nex92bBx5arCBjlbMxrzwj8yphsZftv4osz4Mo3KT5jAWVP650Klb3B0S2F/dfjDna
         GQzF7je1WEJ1tGs7kFaN3kyottSGFcwlD9DPYKCX1cuoZE6PtV2F4MAWzS7nA7jJ+WI2
         U2Dp5kQYbMQkU+pJOnNoGiwUIvgeG1HDsbfKPFfUcD2qZqdJ/qhmCC9VUv0kmN7jg2KS
         WIStxEV6c4/6/8BPufuLjtFAIG3+/xEfBShDaI/MQEsJtalJqcQgIqpUbjrRKdoPXa/f
         tPjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755490355; x=1756095155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yWqS/B4+C2GeeCl07+fnbYmzaV3u99GO7HLw3KmW+Q=;
        b=rKEy+AfA9T12E9LcT4Q2uWqcso0saWI4G8hJhACuCfpfZwd6pCzGJBUfTamHvJ+T02
         YnswV8czQ6Yps1p/oq7ROS3X8fTlVyprDNHedmv79GsOwxM4xEREJ6E7F2CZnmJu+h/G
         KKVg0iXp5O4q8dK/wJ1WY7cfrm3Vx/goNq9gThIkHdFaKq3CKgknOmxE05SAecY22K4K
         my6FJCzZ2T87//z0W387DOuOK3znaKBanCqN10IXg8hrlVPIczT5HHqt3aSc4xdLwGeQ
         T5vLOVEj+G7da890xD3MOzpvcWYZRis0RRnpLkH1nBbwdsrJv0A+imuVACMRqEPZnl3W
         BA8g==
X-Forwarded-Encrypted: i=1; AJvYcCUYPPPx8/JbSJ0MzuYXRawLTaMnuAYpT2o8gJgQoFyYVCb3bx8GkXzyY/0sZ7Aim6uGM8LuH3M7ogpfgA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydX1EVSckgQGs6GkYHEM1A3H+i+s/5+xyg8cWLlsGBOdeJhE1k
	EA9cG0sdwEOSh198CF7/lrA0vVBLYnfnxXfew2PXzB6TJ9ao1t+O51/gs1LS5oYNhMQ=
X-Gm-Gg: ASbGncsIFb2HIBeE2Pie2o4779wWUN8Wb1doyE0bUmWNXOs2vU3zPnxFvT6iuoT4Aoo
	65j1+ZrfZbNgsxXxliDlKrd63kUc671HGMBlDKVV97v7sgJ2+ofMbAsUILW4AA9p7wPZFNzWTYQ
	yaRKLXP2EeH5t48fstU2RSqIRZ3/GLDA+ZVBQ94SW6+td8wO1hxLNmknIwx8xGO4Fxjn1ekMgnm
	jyAi1xJNF1Bj2zHXq+kqyAG3MXJTzQ39lk3QoJMGTnEfjCCTZbHLHsdJ6weVxdYzSLaeRXhcxhb
	5gEgVGeQCZszBNnteHHUMvtGTFTIwr+Ibm0w0N8LV/aqy/5L/NiRoDgy20h5/yOjb3xxX0H+gad
	y7u0tFoxhwSqCiaxc4/gODsajyQ8O/vDt2JHMnWbJXqdZ6oYK4bwrcA==
X-Google-Smtp-Source: AGHT+IEsDmj77mUvgdQimMi0uVp5iehZpP28fFtyXe2C6DL2NiDYzgOPGr8ykLq5LaUBARt9lXtGMA==
X-Received: by 2002:a17:90b:3949:b0:321:4760:c65a with SMTP id 98e67ed59e1d1-32341fff339mr14481306a91.27.1755490354531;
        Sun, 17 Aug 2025 21:12:34 -0700 (PDT)
Received: from localhost.localdomain ([122.171.17.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32343c70356sm6560972a91.25.2025.08.17.21.12.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 21:12:34 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Subject: [PATCH v10 18/24] ACPI: RISC-V: Add support to update gsi range
Date: Mon, 18 Aug 2025 09:39:14 +0530
Message-ID: <20250818040920.272664-19-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250818040920.272664-1-apatel@ventanamicro.com>
References: <20250818040920.272664-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_051246_118790_3A210E3B 
X-CRM114-Status: GOOD (  20.14  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>, Atish Patra <atish.patra@linux.dev>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, Samuel Holland <samuel.holland@sifive.com>, linux-acpi@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Len Brown <lenb@kernel.org>, linux-clk@vger.kernel.org, Rahul Pathak <rpathak@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

Some RISC-V interrupt controllers like RPMI based system MSI interrupt
controllers do not have MADT entry defined. These interrupt controllers
exist only in the namespace. ACPI spec defines _GSB method to get the
GSI base of the interrupt controller, However, there is no such standard
method to get the GSI range. To support such interrupt controllers, set
the GSI range of such interrupt controllers to non-overlapping range and
provide API for interrupt controller driver to update it with proper
value.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/irq.h |  5 +++++
 drivers/acpi/riscv/irq.c     | 38 ++++++++++++++++++++++++++++++++++--
 2 files changed, 41 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/irq.h b/arch/riscv/include/asm/irq.h
index 59c975f750c9..7ec592fe430a 100644
--- a/arch/riscv/include/asm/irq.h
+++ b/arch/riscv/include/asm/irq.h
@@ -42,6 +42,7 @@ unsigned long acpi_rintc_ext_parent_to_hartid(unsigned int plic_id, unsigned int
 unsigned int acpi_rintc_get_plic_nr_contexts(unsigned int plic_id);
 unsigned int acpi_rintc_get_plic_context(unsigned int plic_id, unsigned int ctxt_idx);
 int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resource *res);
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs);
 
 #else
 static inline int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
@@ -76,6 +77,10 @@ static inline int __init acpi_rintc_get_imsic_mmio_info(u32 index, struct resour
 	return 0;
 }
 
+static inline int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	return -ENODEV;
+}
 #endif /* CONFIG_ACPI */
 
 #endif /* _ASM_RISCV_IRQ_H */
diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 33c073e2e71d..cc1928422418 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -10,6 +10,8 @@
 
 #include "init.h"
 
+#define RISCV_ACPI_INTC_FLAG_PENDING BIT(0)
+
 struct riscv_ext_intc_list {
 	acpi_handle		handle;
 	u32			gsi_base;
@@ -17,6 +19,7 @@ struct riscv_ext_intc_list {
 	u32			nr_idcs;
 	u32			id;
 	u32			type;
+	u32			flag;
 	struct list_head	list;
 };
 
@@ -69,6 +72,22 @@ static acpi_status riscv_acpi_update_gsi_handle(u32 gsi_base, acpi_handle handle
 	return AE_NOT_FOUND;
 }
 
+int riscv_acpi_update_gsi_range(u32 gsi_base, u32 nr_irqs)
+{
+	struct riscv_ext_intc_list *ext_intc_element;
+
+	list_for_each_entry(ext_intc_element, &ext_intc_list, list) {
+		if (gsi_base == ext_intc_element->gsi_base &&
+		    (ext_intc_element->flag & RISCV_ACPI_INTC_FLAG_PENDING)) {
+			ext_intc_element->nr_irqs = nr_irqs;
+			ext_intc_element->flag &= ~RISCV_ACPI_INTC_FLAG_PENDING;
+			return 0;
+		}
+	}
+
+	return -ENODEV;
+}
+
 int riscv_acpi_get_gsi_info(struct fwnode_handle *fwnode, u32 *gsi_base,
 			    u32 *id, u32 *nr_irqs, u32 *nr_idcs)
 {
@@ -115,14 +134,22 @@ struct fwnode_handle *riscv_acpi_get_gsi_domain_id(u32 gsi)
 static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr_idcs,
 					       u32 id, u32 type)
 {
-	struct riscv_ext_intc_list *ext_intc_element, *node;
+	struct riscv_ext_intc_list *ext_intc_element, *node, *prev;
 
 	ext_intc_element = kzalloc(sizeof(*ext_intc_element), GFP_KERNEL);
 	if (!ext_intc_element)
 		return -ENOMEM;
 
 	ext_intc_element->gsi_base = gsi_base;
-	ext_intc_element->nr_irqs = nr_irqs;
+
+	/* If nr_irqs is zero, indicate it in flag and set to max range possible */
+	if (nr_irqs) {
+		ext_intc_element->nr_irqs = nr_irqs;
+	} else {
+		ext_intc_element->flag |= RISCV_ACPI_INTC_FLAG_PENDING;
+		ext_intc_element->nr_irqs = U32_MAX - ext_intc_element->gsi_base;
+	}
+
 	ext_intc_element->nr_idcs = nr_idcs;
 	ext_intc_element->id = id;
 	list_for_each_entry(node, &ext_intc_list, list) {
@@ -130,6 +157,13 @@ static int __init riscv_acpi_register_ext_intc(u32 gsi_base, u32 nr_irqs, u32 nr
 			break;
 	}
 
+	/* Adjust the previous node's GSI range if that has pending registration */
+	prev = list_prev_entry(node, list);
+	if (!list_entry_is_head(prev, &ext_intc_list, list)) {
+		if (prev->flag & RISCV_ACPI_INTC_FLAG_PENDING)
+			prev->nr_irqs = ext_intc_element->gsi_base - prev->gsi_base;
+	}
+
 	list_add_tail(&ext_intc_element->list, &node->list);
 	return 0;
 }
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
