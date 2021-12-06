Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A16CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Dec 2021 10:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TuWRTbgGkttOXV8g2A7pKEpHiS9UASJa4YHIM4PeAJw=; b=bI91LlYkX8EZ/i
	QD8c0EGQSbYOeQEf2enIctxZ+b1/lPWn+MO1plaGZ91r6wUUsui5gFCVqadZArBvdeBWvmiMIgwwZ
	B3dwh/T6mu27hEraU8i7cfTLu+ePldtHGAXA0uhn1BkjwUarIA2r8lNhoqnNaRAxA8m7CwIS1UZxK
	f4RzkUe+wOJ8pTB78nz7DHjhF2n/SsUrsV+KCYTljMr+IxIcefndXC6nXht7pu2d9pavKCn3+QHZJ
	EgoX6A8EG+OwZNAv/jBTErm3rUrfhOf6Iooa5ibl7MSI/PxNxtA/zDpB0KIMbRs0xM8+rWaecPj99
	DZF/4bX6Zww6ZeSD/dLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muBeo-003SFR-UN; Mon, 06 Dec 2021 10:55:42 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muBel-003SDX-4U
 for linux-riscv@lists.infradead.org; Mon, 06 Dec 2021 10:55:40 +0000
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E420B3F1F1
 for <linux-riscv@lists.infradead.org>; Mon,  6 Dec 2021 10:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1638788137;
 bh=fBYZyvFhkAhfEVEwW97Oqj/gTwgmisupm0BTu4ieBtI=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nGYXZIp9stVbbfZhrljXdyBtTBVhbaYsmG2XYCAGCzfI2f+aadgEt4r2BtfODBAM7
 jTNGkZIy3VI1JzubxFuc6qIoq7U0Hf7iSz31uYri2HSKQq/U5PONl3CTDBa2GkTBXv
 BjzD4xaKQOckkft3O2Tlx6WFuD1fAcXryrMHJZcpBaa9SqO8cUXTJV2yblIKP9eQKU
 c5K3wN6z5ids2/kC4c3iicKdTtnqzkvxsDxOp9enw+mzdrYgQmMYwIrg9W4tO3VRqo
 QIb5zqARRqlE0wEkKiQuQvc8pSBL6SNfYmvYcReB4O8iofCyBCRHTC3OCNkMjO0t9O
 Y+Q+TmFYmA0hQ==
Received: by mail-wm1-f70.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso4320325wms.1
 for <linux-riscv@lists.infradead.org>; Mon, 06 Dec 2021 02:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fBYZyvFhkAhfEVEwW97Oqj/gTwgmisupm0BTu4ieBtI=;
 b=R79lp6t/cxKvo7Pm/NkIOPWd7ZqnHvujMjODK7eMYbBCWjq/MJJTss08rcwy3utmzN
 UKJXqOBIGy2lNpEWaBorXuLQt4fC8b3/9OMrb+sRQNlZbdgdTOd+u/0WIzaa1FpTFf4S
 vbN3N7YFx+WSuh636zQMr0WPG7HM49gQghozCS3SaVQBWEgeIZpddVLkIdesiR7BBB1Y
 w3vGA4GI10mHXWlgidW2IReeh3mvXfBdIgu0ZLYN/1SQMPwcZyNfINyWc2EdPYHszStU
 iIAs3UfNcvSm3jtD1Lnf9aMs3xxPgsEEZPtfnyQJuowHRUQyWvS1bp44QXi/i4yaQxrJ
 n9vg==
X-Gm-Message-State: AOAM530LFKlkiMuNM7RvNA/8Jk7GMdTYOYpNBeAxDFyKCeE3A0OiRYtm
 9un4FgGfYLs9uxciGccu67nQ/uVIY3lJ85j9tt3OZC7C8MFxOjwJsRJatGPcXLN8XZJFh5mQgVw
 KfvWU89WWOeDsc/Ha2gZBEcSyu/B+w2dWn3Ym5UVUDrtHUw==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr37911664wmi.178.1638788126595; 
 Mon, 06 Dec 2021 02:55:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvEyew/HP7ohYaIhZylrYW6SxTUjeNuu3G9AULmOWcX//NDYQ3KYHU+hoCCRnPDfXU/eCCXg==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr37911644wmi.178.1638788126387; 
 Mon, 06 Dec 2021 02:55:26 -0800 (PST)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id o4sm12657395wry.80.2021.12.06.02.55.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 02:55:26 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Anup Patel <anup@brainfault.org>,
 Atish Patra <Atish.Patra@rivosinc.com>, Christoph Hellwig <hch@lst.de>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>,
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <keescook@chromium.org>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn,
 linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linux-efi@vger.kernel.org, linux-arch@vger.kernel.org
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v3 08/13] riscv: Use pgtable_l4_enabled to output mmu_type in
 cpuinfo
Date: Mon,  6 Dec 2021 11:46:52 +0100
Message-Id: <20211206104657.433304-9-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_025539_354266_9EB61DF2 
X-CRM114-Status: GOOD (  15.02  )
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

Now that the mmu type is determined at runtime using SATP
characteristic, use the global variable pgtable_l4_enabled to output
mmu type of the processor through /proc/cpuinfo instead of relying on
device tree infos.

Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/cpu.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 6d59e6906fdd..dea9b1c31889 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -7,6 +7,7 @@
 #include <linux/seq_file.h>
 #include <linux/of.h>
 #include <asm/smp.h>
+#include <asm/pgtable.h>
 
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
@@ -70,18 +71,19 @@ static void print_isa(struct seq_file *f, const char *isa)
 	seq_puts(f, "\n");
 }
 
-static void print_mmu(struct seq_file *f, const char *mmu_type)
+static void print_mmu(struct seq_file *f)
 {
+	char sv_type[16];
+
 #if defined(CONFIG_32BIT)
-	if (strcmp(mmu_type, "riscv,sv32") != 0)
-		return;
+	strncpy(sv_type, "sv32", 5);
 #elif defined(CONFIG_64BIT)
-	if (strcmp(mmu_type, "riscv,sv39") != 0 &&
-	    strcmp(mmu_type, "riscv,sv48") != 0)
-		return;
+	if (pgtable_l4_enabled)
+		strncpy(sv_type, "sv48", 5);
+	else
+		strncpy(sv_type, "sv39", 5);
 #endif
-
-	seq_printf(f, "mmu\t\t: %s\n", mmu_type+6);
+	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
 static void *c_start(struct seq_file *m, loff_t *pos)
@@ -106,14 +108,13 @@ static int c_show(struct seq_file *m, void *v)
 {
 	unsigned long cpu_id = (unsigned long)v - 1;
 	struct device_node *node = of_get_cpu_node(cpu_id, NULL);
-	const char *compat, *isa, *mmu;
+	const char *compat, *isa;
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
 	if (!of_property_read_string(node, "riscv,isa", &isa))
 		print_isa(m, isa);
-	if (!of_property_read_string(node, "mmu-type", &mmu))
-		print_mmu(m, mmu);
+	print_mmu(m);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
 		seq_printf(m, "uarch\t\t: %s\n", compat);
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
