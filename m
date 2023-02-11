Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92195C636CC
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Feb 2023 03:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kCHjRQpRLKNDB5+F+edRGTsF0ORU1FnY84AyD2IO3vg=; b=UTCCYMZqGkq/LV
	RAvUr7ysRbSmsBEyUIe9XyVs02xqz1oIonOjrPqhLS7NW8P2+bQ2q3TzxeUGcpKuKXP5WCxd8ce51
	FQGutlbKQOB+fHXgd9gC22STgfeoFroRllkDZoL/dae3cRmQbxXdUcBpfXm57P+56vTLrsp9t5G1g
	F0qIS4wHkb1DroxTQkvub/D0I5pjS3g1qVrf/aB4dhqLpGLOa1BI5nJThEjsGRY5lAhtGYs8dtghP
	owz9113vphaHN4IMlJB31WXbcljp4K8xgkXgdr5oc+nvWQZsIxgT0LSW/y8MqvdAWPIEleGj5soqX
	TZ1LhDJcmlSO+j1Hopzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgY3-008VmD-9S; Sat, 11 Feb 2023 03:27:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQgPV-008Rnh-Fu; Sat, 11 Feb 2023 03:18:47 +0000
Received: from localhost (unknown [86.120.32.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1719D6602112;
	Sat, 11 Feb 2023 03:18:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676085524;
	bh=dWT0RanDNiM3R2DCgFc/XbzaC63mZATcL9ooscBLbYQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OEECfIzkegZFxQGlNbEk0xpVXMYbfsjuxNV0jzVV+mhag3vfoFisKqwcwAejSdADU
	 c2tk68Yksshis0/Wo96/mdHLwprlFo1d7gT4NWnVZo4FhmuA3vb8qRWnxx5jPtgXWv
	 b/pV/VG5UGPafKrQc9OH4xX5/PaK4lgE+77yMgpU1Bz0QdUXAVG4RG5L9OgAoYqk8P
	 iQzRVEev8TgYOSWRcZ+nLYNmv7Ycrz7LIMBI0fVjR8NpLZy9o8IZDtO3Y2KKPhWK6X
	 asyOruKtVqPgbh/86k8oWarMwscItXxCD4n4rBW0WRhCtDtEcFkJUN2o7DMhhM26VZ
	 Q2BNo4v2uF72Q==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Sagar Kadam <sagar.kadam@sifive.com>,
	Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 04/12] soc: sifive: ccache: Add non-coherent DMA handling
Date: Sat, 11 Feb 2023 05:18:13 +0200
Message-Id: <20230211031821.976408-5-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
References: <20230211031821.976408-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_191845_883664_7371971A 
X-CRM114-Status: GOOD (  14.72  )
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

From: Emil Renner Berthing <kernel@esmil.dk>

Add functions to flush the caches and handle non-coherent DMA.

Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
[replace <asm/cacheflush.h> with <linux/cacheflush.h>]
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/soc/sifive/sifive_ccache.c | 60 +++++++++++++++++++++++++++++-
 include/soc/sifive/sifive_ccache.h | 21 +++++++++++
 2 files changed, 80 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index 676468c35859..0062635d845f 100644
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
+#include <linux/cacheflush.h>
 #include <asm/cacheinfo.h>
+#include <asm/page.h>
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
@@ -125,6 +132,47 @@ int unregister_sifive_ccache_error_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(unregister_sifive_ccache_error_notifier);
 
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+static phys_addr_t uncached_offset;
+DEFINE_STATIC_KEY_FALSE(sifive_ccache_handle_noncoherent_key);
+
+void sifive_ccache_flush_range(phys_addr_t start, size_t len)
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
+EXPORT_SYMBOL_GPL(sifive_ccache_flush_range);
+
+void *sifive_ccache_set_uncached(void *addr, size_t size)
+{
+	phys_addr_t phys_addr = __pa(addr) + uncached_offset;
+	void *mem_base;
+
+	mem_base = memremap(phys_addr, size, MEMREMAP_WT);
+	if (!mem_base) {
+		pr_err("%s memremap failed for addr %p\n", __func__, addr);
+		return ERR_PTR(-EINVAL);
+	}
+
+	return mem_base;
+}
+EXPORT_SYMBOL_GPL(sifive_ccache_set_uncached);
+#endif /* CONFIG_RISCV_DMA_NONCOHERENT */
+
 static int ccache_largest_wayenabled(void)
 {
 	return readl(ccache_base + SIFIVE_CCACHE_WAYENABLE) & 0xFF;
@@ -213,6 +261,7 @@ static int __init sifive_ccache_init(void)
 	int i, rc, intr_num;
 	const struct of_device_id *match;
 	unsigned long broken_irqs;
+	u64 __maybe_unused offset;
 
 	np = of_find_matching_node_and_match(NULL, sifive_ccache_ids, &match);
 	if (!np)
@@ -258,6 +307,15 @@ static int __init sifive_ccache_init(void)
 	}
 	of_node_put(np);
 
+#ifdef CONFIG_RISCV_DMA_NONCOHERENT
+	if (!of_property_read_u64(np, "uncached-offset", &offset)) {
+		uncached_offset = offset;
+		static_branch_enable(&sifive_ccache_handle_noncoherent_key);
+		riscv_cbom_block_size = SIFIVE_CCACHE_LINE_SIZE;
+		riscv_noncoherent_supported();
+	}
+#endif
+
 	ccache_config_read();
 
 	ccache_cache_ops.get_priv_group = ccache_get_priv_group;
@@ -278,4 +336,4 @@ static int __init sifive_ccache_init(void)
 	return rc;
 }
 
-device_initcall(sifive_ccache_init);
+arch_initcall(sifive_ccache_init);
diff --git a/include/soc/sifive/sifive_ccache.h b/include/soc/sifive/sifive_ccache.h
index 4d4ed49388a0..d349ccb3969b 100644
--- a/include/soc/sifive/sifive_ccache.h
+++ b/include/soc/sifive/sifive_ccache.h
@@ -7,10 +7,31 @@
 #ifndef __SOC_SIFIVE_CCACHE_H
 #define __SOC_SIFIVE_CCACHE_H
 
+#include <linux/io.h>
+#include <linux/jump_label.h>
+
 extern int register_sifive_ccache_error_notifier(struct notifier_block *nb);
 extern int unregister_sifive_ccache_error_notifier(struct notifier_block *nb);
 
 #define SIFIVE_CCACHE_ERR_TYPE_CE 0
 #define SIFIVE_CCACHE_ERR_TYPE_UE 1
 
+DECLARE_STATIC_KEY_FALSE(sifive_ccache_handle_noncoherent_key);
+
+static inline bool sifive_ccache_handle_noncoherent(void)
+{
+#ifdef CONFIG_SIFIVE_CCACHE
+	return static_branch_unlikely(&sifive_ccache_handle_noncoherent_key);
+#else
+	return false;
+#endif
+}
+
+void sifive_ccache_flush_range(phys_addr_t start, size_t len);
+void *sifive_ccache_set_uncached(void *addr, size_t size);
+static inline void sifive_ccache_clear_uncached(void *addr, size_t size)
+{
+	memunmap(addr);
+}
+
 #endif /* __SOC_SIFIVE_CCACHE_H */
-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
