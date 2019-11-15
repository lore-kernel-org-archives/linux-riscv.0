Return-Path: <SRS0=Ubum=ZH=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3AA9C432C3
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2019 19:24:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CA539206D9
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 15 Nov 2019 19:24:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DMuDN9Bt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gstardust.com header.i=@gstardust.com header.b="Ofmzbwjv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="WAVs5khK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CA539206D9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gstardust.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D56Xa4AAxOtqdC+DRe9adH76BmFB7PtrvtWs622kTu8=; b=DMuDN9Btn8U+xiJUgtcZEah8Na
	RNoMg7TAN6r42mBv9BEMMjPCL/dXlE5y3w4AyClV0NXzSA08jBwG29Z3rR55aWZSG6MwF5HTRkCIe
	EKOd0awbeAImrwKyM4yoPyF5rGHhLYeb7Fhyi+oAwmWv7GkT1YWNl2RVZVpzkC9PuhP9dBbU1yoP9
	5Ttmdm+1Pug3GrTUb+ShwvgQrBEj0GcYfinv51tzMEDoZIhUNB5Dft50hxJm7drZhssC06NmixtJb
	5362HOOYepVJH6j6P1JiVdBh2UhZn6Mtm5P7/GjjEfik2/x6/aaU9grgEXUKPBYvbrtKVpbAToknT
	/NXPoVlw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVhCu-0003Ak-J5; Fri, 15 Nov 2019 19:24:36 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVhCp-00037F-Ni
 for linux-riscv@lists.infradead.org; Fri, 15 Nov 2019 19:24:33 +0000
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 3AA0D21E6A;
 Fri, 15 Nov 2019 14:24:29 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute7.internal (MEProxy); Fri, 15 Nov 2019 14:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gstardust.com;
 h=from:to:cc:subject:date:message-id:in-reply-to:references; s=
 mesmtp; bh=enghHmGRNsMOhK6tHSHB/IAZItD4D5q6OBtAd4WrW64=; b=Ofmzb
 wjv80WRHf65InEbR5rKeHSW8fUNf+bPNbdsbiYcy4w7gy+UehFHUX13PU17jMQEc
 AGpkORxJWKgTlwBM0rzc3ERp7QQb6CwVcIVftb82rpKknQsUfsbBxQlfs3KyjO0A
 Z4LFLD0SdxpMxSxiBgUnm2hjlu4tmmbcpPG444=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:date:from:in-reply-to:message-id
 :references:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=enghHmGRNsMOhK6tHSHB/IAZItD4D
 5q6OBtAd4WrW64=; b=WAVs5khKy3j1a/U/5IY7dmcN94L+s4AFBXa7OHVb+Jv8S
 FYU0bAwCPg4+yIBg6anF06vlPZruTFtZbqaIvWFQbXzsVP+E/BnHthfezy/yc381
 H+mhnd6mewzF4g+V8hvunZ2bBxIKzDU/Jsae8k+/K0tklKWMabo4OUyouIB5m7cZ
 0kKF9akNKE4tLUd27bjwC20tKQn9HYMg0VcM3N4DawjrZJAEAakqUSkT1OJf6KzY
 3XMYf9FVf6+el6A/k2saV85QRu+1s/1YXQVZ/LUgXqyFzdN3CzLGMLjL7bw1VFlm
 Tk17UsGimpmYVLuxB6elmSLZy0zi/GSLbzTu1LBLA==
X-ME-Sender: <xms:bfvOXRUOvVI6Wxj1VcK3G1_7xlfI4SQSNLZ490454eCHP6D3kSYrlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrudefhedguddvfecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhephffvufffkffojghfsedttdertd
 ertddtnecuhfhrohhmpeforghrtgcuifgruhhthhhivghruceotghonhhsuhhlthdqmhhg
 sehgshhtrghrughushhtrdgtohhmqeenucfkphepudegvddrheelrdehledrvdelnecurf
 grrhgrmhepmhgrihhlfhhrohhmpegtohhnshhulhhtqdhmghesghhsthgrrhguuhhsthdr
 tghomhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:bfvOXdibxo89gP-KTEG8focxPaXRq-FoK9Z56lyxdAYDO-kWj0G8dw>
 <xmx:bfvOXTgHlmXEM8dJlru9tVr8tNix5VYuHamZw8H1VQS5VUGpHIKccw>
 <xmx:bfvOXas7o2X-KlavI3I0wivjrSPdSlkc2VFkZCNgKoWcg1roQqGiaQ>
 <xmx:bfvOXSnrKZk6OjgTBUygDYnwMjBBEyjlsYmc51gQSLZwpIlSF0JyFw>
Received: from SurfBoard.localdomain (unknown [142.59.59.29])
 by mail.messagingengine.com (Postfix) with ESMTPA id D844B306005C;
 Fri, 15 Nov 2019 14:24:28 -0500 (EST)
From: Marc Gauthier <consult-mg@gstardust.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: Set SHMLBA according to cache geometry
Date: Fri, 15 Nov 2019 14:23:54 -0500
Message-Id: <20191115192354.19814-3-consult-mg@gstardust.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191115192354.19814-1-consult-mg@gstardust.com>
References: <20191115192354.19814-1-consult-mg@gstardust.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191115_112431_944710_D0038170 
X-CRM114-Status: GOOD (  14.00  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Marc Gauthier <consult-mg@gstardust.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Set SHMLBA to the maximum cache "span" (line size * number of sets) of
all CPU L1 instruction and data caches (L2 and up are rarely VIPT).
This avoids VIPT cache aliasing with minimal alignment constraints.

If the device tree does not provide cache parameters, use a conservative
default of 16 KB:  only large enough to avoid aliasing in most VIPT caches.

Signed-off-by: Marc Gauthier <consult-mg@gstardust.com>
---
 arch/riscv/include/asm/shmparam.h | 12 ++++++++
 arch/riscv/kernel/cacheinfo.c     | 49 +++++++++++++++++++++++++++++++
 2 files changed, 61 insertions(+)
 create mode 100644 arch/riscv/include/asm/shmparam.h

diff --git a/arch/riscv/include/asm/shmparam.h b/arch/riscv/include/asm/shmparam.h
new file mode 100644
index 000000000000..9b6a98153648
--- /dev/null
+++ b/arch/riscv/include/asm/shmparam.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _ASM_RISCV_SHMPARAM_H
+#define _ASM_RISCV_SHMPARAM_H
+
+/*
+ * Minimum alignment of shared memory segments as a function of cache geometry.
+ */
+#define	SHMLBA	arch_shmlba()
+
+long arch_shmlba(void);
+
+#endif /* _ASM_RISCV_SHMPARAM_H */
diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 4c90c07d8c39..a7a601ee6a86 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -1,12 +1,58 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * Copyright (C) 2017 SiFive
+ * Copyright (C) 2019 Aril Inc
  */
 
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/mm.h>
+
+static long shmlba;
+
+
+/*
+ * Assuming  cache size = line size * #sets * N  for N-way associative caches,
+ * return the max cache "span" == (line size * #sets) == (cache size / N)
+ * across all L1 caches, or 0 if cache parameters are not available.
+ * VIPT caches with span > min page size are susceptible to aliasing.
+ */
+static long get_max_cache_span(void)
+{
+	struct cpu_cacheinfo *this_cpu_ci;
+	struct cacheinfo *this_leaf;
+	long span, max_span = 0;
+	int cpu, leaf;
+
+	for_each_possible_cpu(cpu) {
+		this_cpu_ci = get_cpu_cacheinfo(cpu);
+		this_leaf = this_cpu_ci->info_list;
+		for (leaf = 0; leaf < this_cpu_ci->num_leaves; leaf++, this_leaf++) {
+			if (this_leaf->level > 1)
+				break;
+			span = this_leaf->coherency_line_size * this_leaf->number_of_sets;
+			if (span > max_span)
+				max_span = span;
+		}
+	}
+	return max_span;
+}
+
+/*
+ * Align shared mappings to the maximum cache "span" to avoid aliasing
+ * in VIPT caches, for performance.
+ * The returned SHMLBA value is always a power-of-two multiple of PAGE_SIZE.
+ */
+long arch_shmlba(void)
+{
+	if (shmlba == 0) {
+		long max_span = get_max_cache_span();
+		shmlba = max_span ? PAGE_ALIGN(max_span) : 4 * PAGE_SIZE;
+	}
+	return shmlba;
+}
 
 static void ci_leaf_init(struct cacheinfo *this_leaf,
 			 struct device_node *node,
@@ -93,6 +139,9 @@ static int __populate_cache_leaves(unsigned int cpu)
 	}
 	of_node_put(np);
 
+	/* Force recalculating SHMLBA if cache parameters are updated. */
+	shmlba = 0;
+
 	return 0;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
