Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DEEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 09:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iTaviAAm/pWTsUIXWhPVDAyUFg93HlUOVFbBp2jSasM=; b=i3zpDqvPgIkLar
	KApZ7RIvJGeHsl2r2+Os6BLEom4ZSTWI2tcUlbIgVpbOXs4mGAk79ur4GbnrJUBoiVyIZ2+SSS7GR
	YzsD71mQZqqNZAsmviz8kxqCIA80QvzGLh7/E4kWFtA9OtYhceds5y17NhatC0n1ErF7lmvPBOy+A
	EwMK0nGYN73/i9RaGpI/1ilWuyvr2Uc11Tz3XyRFVOLh1kQOKh6ZrJCXSG0zqJoqZ3t9WA+4gsQmB
	gxfY2KMZ3lhVbYnARjliWksCrjxtG1FVmvYLpsdGbszUE3+j7hirpako0OabndKKqV1vI4bi/uCEk
	8LjF0lSTopq/4kY+TksQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrG6t-0014cm-3S; Wed, 18 May 2022 09:36:51 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrG4F-0012dG-CN; Wed, 18 May 2022 09:34:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 90D0C1063;
 Wed, 18 May 2022 02:34:06 -0700 (PDT)
Received: from usa.arm.com (e103737-lin.cambridge.arm.com [10.1.197.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DDDBB3F66F;
 Wed, 18 May 2022 02:34:04 -0700 (PDT)
From: Sudeep Holla <sudeep.holla@arm.com>
To: Atish Patra <atishp@atishpatra.org>,
	linux-kernel@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>, Atish Patra <atishp@rivosinc.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Morten Rasmussen <morten.rasmussen@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Qing Wang <wangqing@vivo.com>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 7/8] of: base: add support to get the device node for the
 CPU's last level cache
Date: Wed, 18 May 2022 10:33:24 +0100
Message-Id: <20220518093325.2070336-8-sudeep.holla@arm.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220518093325.2070336-1-sudeep.holla@arm.com>
References: <20220518093325.2070336-1-sudeep.holla@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_023407_555956_D588C6E9 
X-CRM114-Status: GOOD (  16.38  )
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

It is useful to have helper function just to get the pointer to the device
node of the last level cache for a given logical cpu. It can be used as
unique firmware identifier for the last level cache.

This is useful to obtain the cpumask/cpumap of all the CPUs sharing the last
level cache using the device node pointer as unique identifier for the last
level cache.

Cc: Rob Herring <robh+dt@kernel.org>
Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
---
 drivers/of/base.c  | 33 +++++++++++++++++++++++++--------
 include/linux/of.h |  1 +
 2 files changed, 26 insertions(+), 8 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index d4f98c8469ed..0b6a8c3f9a85 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -2072,17 +2072,17 @@ struct device_node *of_find_next_cache_node(const struct device_node *np)
 }
 
 /**
- * of_find_last_cache_level - Find the level at which the last cache is
- * 		present for the given logical cpu
+ * of_find_last_level_cache_node - Find the device node at which the last
+ *		cache is present for the given logical cpu
  *
- * @cpu: cpu number(logical index) for which the last cache level is needed
+ * @cpu: cpu number(logical index) for which the last cache level's device
+ * node is needed
  *
- * Return: The the level at which the last cache is present. It is exactly
- * same as  the total number of cache levels for the given logical cpu.
+ * Return: The device node corresponding to the last cache for the  given
+ * logical cpu
  */
-int of_find_last_cache_level(unsigned int cpu)
+struct device_node *of_find_last_level_cache_node(unsigned int cpu)
 {
-	u32 cache_level = 0;
 	struct device_node *prev = NULL, *np = of_cpu_device_node_get(cpu);
 
 	while (np) {
@@ -2091,7 +2091,24 @@ int of_find_last_cache_level(unsigned int cpu)
 		np = of_find_next_cache_node(np);
 	}
 
-	of_property_read_u32(prev, "cache-level", &cache_level);
+	return prev;
+}
+
+/**
+ * of_find_last_cache_level - Find the level at which the last cache is
+ *		present for the given logical cpu
+ *
+ * @cpu: cpu number(logical index) for which the last cache level is needed
+ *
+ * Return: The level at which the last cache is present. It is exactly
+ * same as  the total number of cache levels for the given logical cpu.
+ */
+int of_find_last_cache_level(unsigned int cpu)
+{
+	u32 cache_level = 0;
+	struct device_node *np = of_find_last_level_cache_node(cpu);
+
+	of_property_read_u32(np, "cache-level", &cache_level);
 
 	return cache_level;
 }
diff --git a/include/linux/of.h b/include/linux/of.h
index 04971e85fbc9..ca0384cf08a3 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -297,6 +297,7 @@ extern struct device_node *of_get_child_by_name(const struct device_node *node,
 
 /* cache lookup */
 extern struct device_node *of_find_next_cache_node(const struct device_node *);
+extern struct device_node *of_find_last_level_cache_node(unsigned int cpu);
 extern int of_find_last_cache_level(unsigned int cpu);
 extern struct device_node *of_find_node_with_property(
 	struct device_node *from, const char *prop_name);
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
