Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89D56C25B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 18:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ea+huAAdMOVzoVhHDPaD4ihVw3EyLPui2YuaehOac/A=; b=MBMy/0ak1+Av5k
	51Bnq5dNrvRH0vm6fbnt+XHagkDJTYSWEpyXihr0G2clZYlHB9+C7Gb1horhmSREAKKUFOw8atIvL
	KRqRpbwNVmEMGm3xZZl0ooBG3XaNWnpoyfW4babnxnO+D2KOq8bB8A97RRi2nUtzU7A7Z6aTMdBlR
	ICCmfKqGN18t344ws+rUu8D3ooLpnZbXyv0vMsR67aGdoFrw182NeiS0eOw9Go6qoMxzn5K6EEPCZ
	hiU/tRgRUAWZsOoZ2vlm1+t/p8vzV7gcgOuJ13LSbFUeVS/MpfI2lTzVcHsQfaCRw7aZWlmYGgSZc
	L6vvhBVRX9lwkgsY19Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3l-00CuWQ-08;
	Wed, 25 Oct 2023 18:56:53 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvj3g-00CuTz-22
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 18:56:50 +0000
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D3CBD3FD42
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 18:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698260206;
	bh=72yTSynUrDUHeNGfbDrBCEgB1J8riTYEUtHwwC8rPyQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type;
	b=If+kDKHeuT2EMsw92xqfmlqXDH3ramsZx0OPNFo05CzPW6IzPJXEgCM9sqx28lSet
	 iO/k+Ed6G8bYm24NN9bCSmPCKB90vXyjsUewYsZET2bIfnPL1C7dyKPUCYh/qsOJQI
	 SGqWhbY6wiSTH8A0JeQ0L7yK7xsDlFLCuJ3+eHTVkOpZI2bLp5Qwi6noWjYlZw7Uic
	 X0T3HlHZmN4ds6obzGV0kVkXRaof/mnXeUiIpbm9JeywgNEtvcJE4BvzvifW9KWRSK
	 qHwddJUubiP4KK9FC+GAN/g7v7bphg8b2xhrKXwYj5MQ2oXbwH/qarlI00hMv04Xhb
	 ux4UWtt4U7GLA==
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-66cfda4c191so1251336d6.0
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 11:56:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698260204; x=1698865004;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=72yTSynUrDUHeNGfbDrBCEgB1J8riTYEUtHwwC8rPyQ=;
        b=WMg0wYeO1gGgMZcsfYchAjyg5V3seAV+WnkqxYMXKOSdmks+mjcBIEEXrH/CzeDuv9
         SkOTxCNtDN4a7DP6N8g6d5JNDEvZDOcN5pkdOaLeS5OEfWDYaICxuD50oHIGDipoJLk7
         xTTg8R0IqUm1A/v1kp52NG6T7Lb9dv/76KU9QpFcrMNEctUhUgpH9Og8Ln3lSH29Obs5
         AVrE9Y2BTzCay5WKqP75GtKgZk89A5I1ObxJ1gOp/jlGOh6ptbgFxSUZMxGj2tw/V+UD
         1QVF8SufQHMlCWz0GXs4GB96L3+xulVSesoo6FPRGA5gICpJV6m8jiEre+K7fWv0TceQ
         ntBQ==
X-Gm-Message-State: AOJu0Yy0R4arMDmV8OHbFBbgAw/8hG8a1MmmXy5/xTi9/gphoF3k+zx0
	9CEuK7Prbuu32vvbOZiRICpJ6kzcjL5BFw6Qimyn/cOelxbqVsw9uuDATdn+yVIvyWmieRxhbrT
	oghlZBAmzOOGM7WsExz9/Hl7lDmADtdjXADF5ErB2RU8p9qMeW/LFVWB+E///V7OCqiT0sg==
X-Received: by 2002:a05:6214:500a:b0:66d:1ff3:31ed with SMTP id jo10-20020a056214500a00b0066d1ff331edmr18230020qvb.52.1698260204378;
        Wed, 25 Oct 2023 11:56:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqrp3yXMtVysnlSo/32Nx/YVY6NylQz5OO3JSRKcqHPaoXNSn7AoCmimrkLCz7k8X5K09lEujMXAozvhm6Dhg=
MIME-Version: 1.0
X-Received: by 2002:a05:6214:500a:b0:66d:1ff3:31ed with SMTP id
 jo10-20020a056214500a00b0066d1ff331edmr18230005qvb.52.1698260204165; Wed, 25
 Oct 2023 11:56:44 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 11:56:43 -0700
From: emil.renner.berthing@canonical.com
Date: Wed, 25 Oct 2023 11:56:43 -0700
Message-ID: <CAJM55Z8XPo=NfzGcu0UVOb2pwGhkuL6nx+Mae7eLy4EDN0=cAw@mail.gmail.com>
Subject: [PATCH 4/4] soc: sifive: ccache: Support cache management operations
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_115648_811280_D9F9B120 
X-CRM114-Status: GOOD (  12.12  )
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

This cache controller also supports flushing cache lines by writing
their address to a register. This can be used for cache management on
SoCs with non-coherent DMAs that predate the RISC-V Zicbom extension
such as the StarFive JH7100 SoC.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
---
 drivers/soc/sifive/sifive_ccache.c | 45 +++++++++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c
b/drivers/soc/sifive/sifive_ccache.c
index 676468c35859..9bf94c22cad9 100644
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
@@ -125,6 +132,34 @@ int
unregister_sifive_ccache_error_notifier(struct notifier_block *nb)
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
@@ -258,6 +293,14 @@ static int __init sifive_ccache_init(void)
 	}
 	of_node_put(np);

+#ifdef CONFIG_RISCV_NONSTANDARD_CACHE_OPS
+	if (of_property_read_bool(np, "sifive,cache-ops")) {
+		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
+		riscv_noncoherent_supported();
+		riscv_noncoherent_register_cache_ops(&ccache_mgmt_ops);
+	}
+#endif
+
 	ccache_config_read();

 	ccache_cache_ops.get_priv_group = ccache_get_priv_group;
@@ -278,4 +321,4 @@ static int __init sifive_ccache_init(void)
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
