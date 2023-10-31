Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3A1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Oct 2023 14:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7lvSefnjmhuxe73/mTJTZK8VYXgY8qHd1pDyDCCOq+E=; b=SyoydLGmx9L6i6
	qVzYAQGYUXdwNribNmk6n1VewGUHtQ2QqmB9ltQg+xFAaW6uPUM7LuQInuC/szGYxuJ+DqpmqMa/P
	aq2if2X3nbblQNDjdJ5X1CETqJfF6czXXficUzCwDD2FUQBn+Q5f6EmC874FNGN/NLll0nKr4Ik2O
	/71QxVdHUg+a1PQaNDwcM7rkDkYp9fuJ3aPHHpLgoM85mybPWj5QNTAb0TWJL0jQklxu6o6THySyx
	r9noarxnhodT7NoYKew6L6bxnQFPmVFPzy5y2ztivScz+B8P93OGPM/1Sbfvtu1aEhi+OUSSRDnZv
	WgHP5FUbj+BoofySlkqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpWM-005PY6-0V;
	Tue, 31 Oct 2023 14:15:06 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxpWK-005PWo-0J
	for linux-riscv@lists.infradead.org;
	Tue, 31 Oct 2023 14:15:05 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 6C00E4094F
	for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 14:14:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698761695;
	bh=XnEjgTb1m78EWwQDGRYEFN4m8CDZaDkjNTK8j9cPE/A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version;
	b=Zvn1cEceYUnjD45So4hjGezozXswGQDlmlCn6KBov7v4NLa9UxFC24qq6ZPEWl1Ki
	 SKTbUoBH4sm4i0Te2183hy3Zag4gHNAlnnQxLZbH0eTrx9t9ZM5rE1Qi5ibuqw5mEi
	 9W2iWw7Z7dfkve9rqVG5kS8xI9CO5KfK9hSY7xt14IBNpheq9BaGo6RCLyDmHVuNSO
	 h3K3nCkmz+Qn6qw3t223AwOHDTkX7CUPl3EBHVoDePTc0jdfHx5+a8+VdCMY0IiGa0
	 1EJsuugTJOfoFRbIh0jHzH3EQ2ycZCBcNIXvbsrxX1I3m4MPq9WVKvKZijQD8JzX3F
	 gyKjEIeQvF2Kg==
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-9a62adedadbso396206166b.1
        for <linux-riscv@lists.infradead.org>; Tue, 31 Oct 2023 07:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698761690; x=1699366490;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnEjgTb1m78EWwQDGRYEFN4m8CDZaDkjNTK8j9cPE/A=;
        b=JBshkXv3255JnB/y2EWmu5fut1WJFjXjZ6neDgqxLxho3HQDeP8z1qXX+GfHXn3Xe5
         EJhEwIQs8Ta8IXgjzLRnQujCrWVZzc9mcVqOAdtUai3gQl+ZPMUmfqWCzmKAUW+YQw7y
         e5tXvctaT+gusWzBPFg/P3Cklumgk+siCiZxGOb2jb0vVqWJT1pC0GVS+8uB/X4JxHXx
         HSlUsYfviqRlrPDiKSnPXYGSjNj5QaWX7tXNLFbU5xTa/HbMWw/3UJo1rojaBK9orIVz
         xPux2bSu738Rdi/ieo0s8eX9k34kZc+68u2eXiO0GX99BT83jDM4x4+C5MdoJeRaduJf
         DdXQ==
X-Gm-Message-State: AOJu0YymOnrAWrqc78Epjmy0YJCAYfLtMa4OoDM5FkmeSIJUE/yAfVRz
	Vw0e0RfAuBcKSkFjYHypMpMLO3+gyjdDUZldT8Bm8i2Ldugks3EMsXK0QDbbi8l9WOLJE2QAzM2
	QvWUFHYNls1hZ3oKYG2rAw/3iZY5EErvQeldLVN0Id3lIkq+yqV8tiQ==
X-Received: by 2002:a17:907:3184:b0:9c5:844f:a7f4 with SMTP id xe4-20020a170907318400b009c5844fa7f4mr10802111ejb.35.1698761690446;
        Tue, 31 Oct 2023 07:14:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfXx1RuCQtYqjPRoFL8zYiifdddYy2acqzq59Ogj9Q205dxFWWWX8UcYcvHsioLJG5MGwW2w==
X-Received: by 2002:a17:907:3184:b0:9c5:844f:a7f4 with SMTP id xe4-20020a170907318400b009c5844fa7f4mr10802092ejb.35.1698761690172;
        Tue, 31 Oct 2023 07:14:50 -0700 (PDT)
Received: from stitch.. ([2a02:aa7:4003:190e:bd47:7b6e:876:4bdc])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709061b4500b009d23e00a90esm1037395ejg.24.2023.10.31.07.14.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 07:14:49 -0700 (PDT)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] soc: sifive: ccache: Add StarFive JH7100 support
Date: Tue, 31 Oct 2023 15:14:44 +0100
Message-Id: <20231031141444.53426-3-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
References: <20231031141444.53426-1-emil.renner.berthing@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_071504_286195_848C1D28 
X-CRM114-Status: GOOD (  22.21  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Emil Renner Berthing <kernel@esmil.dk>

This adds support for the StarFive JH7100 SoC which also features this
SiFive cache controller.

The JH7100 has non-coherent DMAs but predate the standard RISC-V Zicbom
exension, so instead we need to use this cache controller for
non-standard cache management operations.

Unfortunately the interrupt for uncorrected data is broken on the JH7100
and fires continuously, so add a quirk to not register a handler for it.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/soc/sifive/sifive_ccache.c | 62 +++++++++++++++++++++++++++++-
 1 file changed, 60 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 3684f5b40a80..0da3d1bd0866 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -8,13 +8,16 @@
 
 #define pr_fmt(fmt) "CCACHE: " fmt
 
+#include <linux/align.h>
 #include <linux/debugfs.h>
 #include <linux/interrupt.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
 #include <linux/device.h>
 #include <linux/bitfield.h>
+#include <asm/cacheflush.h>
 #include <asm/cacheinfo.h>
+#include <asm/dma-noncoherent.h>
 #include <soc/sifive/sifive_ccache.h>
 
 #define SIFIVE_CCACHE_DIRECCFIX_LOW 0x100
@@ -39,10 +42,14 @@
 #define SIFIVE_CCACHE_CONFIG_SETS_MASK GENMASK_ULL(23, 16)
 #define SIFIVE_CCACHE_CONFIG_BLKS_MASK GENMASK_ULL(31, 24)
 
+#define SIFIVE_CCACHE_FLUSH64 0x200
+#define SIFIVE_CCACHE_FLUSH32 0x240
+
 #define SIFIVE_CCACHE_WAYENABLE 0x08
 #define SIFIVE_CCACHE_ECCINJECTERR 0x40
 
 #define SIFIVE_CCACHE_MAX_ECCINTR 4
+#define SIFIVE_CCACHE_LINE_SIZE 64
 
 static void __iomem *ccache_base;
 static int g_irq[SIFIVE_CCACHE_MAX_ECCINTR];
@@ -56,6 +63,11 @@ enum {
 	DIR_UNCORR,
 };
 
+enum {
+	QUIRK_NONSTANDARD_CACHE_OPS	= BIT(0),
+	QUIRK_BROKEN_DATA_UNCORR	= BIT(1),
+};
+
 #ifdef CONFIG_DEBUG_FS
 static struct dentry *sifive_test;
 
@@ -106,6 +118,8 @@ static void ccache_config_read(void)
 static const struct of_device_id sifive_ccache_ids[] = {
 	{ .compatible = "sifive,fu540-c000-ccache" },
 	{ .compatible = "sifive,fu740-c000-ccache" },
+	{ .compatible = "starfive,jh7100-ccache",
+	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_BROKEN_DATA_UNCORR) },
 	{ .compatible = "sifive,ccache0" },
 	{ /* end of table */ }
 };
@@ -124,6 +138,34 @@ int unregister_sifive_ccache_error_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(unregister_sifive_ccache_error_notifier);
 
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+static void ccache_flush_range(phys_addr_t start, size_t len)
+{
+	phys_addr_t end = start + len;
+	phys_addr_t line;
+
+	if (!len)
+		return;
+
+	mb();
+	for (line = ALIGN_DOWN(start, SIFIVE_CCACHE_LINE_SIZE); line < end;
+			line += SIFIVE_CCACHE_LINE_SIZE) {
+#ifdef CONFIG_32BIT
+		writel(line >> 4, ccache_base + SIFIVE_CCACHE_FLUSH32);
+#else
+		writeq(line, ccache_base + SIFIVE_CCACHE_FLUSH64);
+#endif
+		mb();
+	}
+}
+
+static const struct riscv_nonstd_cache_ops ccache_mgmt_ops __initdata = {
+	.wback = &ccache_flush_range,
+	.inv = &ccache_flush_range,
+	.wback_inv = &ccache_flush_range,
+};
+#endif /* CONFIG_RISCV_NONSTANDARD_CACHE_OPS */
+
 static int ccache_largest_wayenabled(void)
 {
 	return readl(ccache_base + SIFIVE_CCACHE_WAYENABLE) & 0xFF;
@@ -210,11 +252,15 @@ static int __init sifive_ccache_init(void)
 	struct device_node *np;
 	struct resource res;
 	int i, rc, intr_num;
+	const struct of_device_id *match;
+	unsigned long quirks;
 
-	np = of_find_matching_node(NULL, sifive_ccache_ids);
+	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
 	if (!np)
 		return -ENODEV;
 
+	quirks = (uintptr_t)match->data;
+
 	if (of_address_to_resource(np, 0, &res)) {
 		rc = -ENODEV;
 		goto err_node_put;
@@ -240,6 +286,10 @@ static int __init sifive_ccache_init(void)
 
 	for (i = 0; i < intr_num; i++) {
 		g_irq[i] = irq_of_parse_and_map(np, i);
+
+		if (i == DATA_UNCORR && (quirks & QUIRK_BROKEN_DATA_UNCORR))
+			continue;
+
 		rc = request_irq(g_irq[i], ccache_int_handler, 0, "ccache_ecc",
 				 NULL);
 		if (rc) {
@@ -249,6 +299,14 @@ static int __init sifive_ccache_init(void)
 	}
 	of_node_put(np);
 
+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (quirks & QUIRK_NONSTANDARD_CACHE_OPS) {
+		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
+		riscv_noncoherent_supported();
+		riscv_noncoherent_register_cache_ops(&ccache_mgmt_ops);
+	}
+#endif
+
 	ccache_config_read();
 
 	ccache_cache_ops.get_priv_group = ccache_get_priv_group;
@@ -269,4 +327,4 @@ static int __init sifive_ccache_init(void)
 	return rc;
 }
 
-device_initcall(sifive_ccache_init);
+arch_initcall(sifive_ccache_init);
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
