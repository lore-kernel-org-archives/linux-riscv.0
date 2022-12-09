Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F54C4332F
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Dec 2022 10:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4+JaTOFfetIhUfpmxninOtFWqahZie1fitMTdZa+mcU=; b=JkDFjjU/t+yPAU
	qLZBHxq9nGjUlqngDKms/w9NXDHMd3rV8PoClRbS4sDEgZFFI/DoPKctFxyu2gMVOBW5JcU4SuM12
	i6HFS1kD2xvOq8sIDRwfuwOqnzlmXkEUM9k4QOhpXmGY0GKii+MNPIxOnad1SyQevGOfNi/WXv8a5
	vNcoGLJZAccGexBnVKuKPxSOkLzbI9HeMPSLfOCi2lIDMRA1DptcS3DOLaAEGzVnk9uOs1VH9faQ4
	s3ZVX7JPFpgMao1uQ98x1NjiTfJcnBb7nRoHCdGGDswNv7zNsokxSTZYMQ2O2kkY3Y4XXnqnhGOUZ
	J0Ll2MYkkmhyUYrFpbXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3agX-006e9D-Ty; Fri, 09 Dec 2022 10:32:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3agJ-006e4J-22; Fri, 09 Dec 2022 10:32:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B43FCD6E;
	Fri,  9 Dec 2022 02:32:41 -0800 (PST)
Received: from pierre123.arm.com (unknown [10.57.42.27])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 2A30F3F73B;
	Fri,  9 Dec 2022 02:32:30 -0800 (PST)
From: Pierre Gondois <pierre.gondois@arm.com>
To: linux-kernel@vger.kernel.org
Cc: palmer@rivosinc.com,
	Ionela.Voinescu@arm.com,
	Pierre Gondois <pierre.gondois@arm.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Gavin Shan <gshan@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v3 1/5] cacheinfo: Use RISC-V's init_cache_level() as generic OF implementation
Date: Fri,  9 Dec 2022 11:31:23 +0100
Message-Id: <20221209103130.572196-2-pierre.gondois@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209103130.572196-1-pierre.gondois@arm.com>
References: <20221209103130.572196-1-pierre.gondois@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221209_023239_210681_11AA25FF 
X-CRM114-Status: GOOD (  12.81  )
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

RISC-V's implementation of init_of_cache_level() is following
the Devicetree Specification v0.3 regarding caches, cf.:
- s3.7.3 'Internal (L1) Cache Properties'
- s3.8 'Multi-level and Shared Cache Nodes'

Allow reusing the implementation by moving it.

Signed-off-by: Pierre Gondois <pierre.gondois@arm.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/cacheinfo.c | 39 +------------------------------
 drivers/base/cacheinfo.c      | 44 +++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h     |  1 +
 3 files changed, 46 insertions(+), 38 deletions(-)

diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 90deabfe63ea..440a3df5944c 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -115,44 +115,7 @@ static void fill_cacheinfo(struct cacheinfo **this_leaf,
 
 int init_cache_level(unsigned int cpu)
 {
-	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
-	struct device_node *np = of_cpu_device_node_get(cpu);
-	struct device_node *prev = NULL;
-	int levels = 0, leaves = 0, level;
-
-	if (of_property_read_bool(np, "cache-size"))
-		++leaves;
-	if (of_property_read_bool(np, "i-cache-size"))
-		++leaves;
-	if (of_property_read_bool(np, "d-cache-size"))
-		++leaves;
-	if (leaves > 0)
-		levels = 1;
-
-	prev = np;
-	while ((np = of_find_next_cache_node(np))) {
-		of_node_put(prev);
-		prev = np;
-		if (!of_device_is_compatible(np, "cache"))
-			break;
-		if (of_property_read_u32(np, "cache-level", &level))
-			break;
-		if (level <= levels)
-			break;
-		if (of_property_read_bool(np, "cache-size"))
-			++leaves;
-		if (of_property_read_bool(np, "i-cache-size"))
-			++leaves;
-		if (of_property_read_bool(np, "d-cache-size"))
-			++leaves;
-		levels = level;
-	}
-
-	of_node_put(np);
-	this_cpu_ci->num_levels = levels;
-	this_cpu_ci->num_leaves = leaves;
-
-	return 0;
+	return init_of_cache_level(cpu);
 }
 
 int populate_cache_leaves(unsigned int cpu)
diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 4b5cd08c5a65..a4308b48dd3e 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -224,8 +224,52 @@ static int cache_setup_of_node(unsigned int cpu)
 
 	return 0;
 }
+
+int init_of_cache_level(unsigned int cpu)
+{
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(cpu);
+	struct device_node *np = of_cpu_device_node_get(cpu);
+	struct device_node *prev = NULL;
+	int levels = 0, leaves = 0, level;
+
+	if (of_property_read_bool(np, "cache-size"))
+		++leaves;
+	if (of_property_read_bool(np, "i-cache-size"))
+		++leaves;
+	if (of_property_read_bool(np, "d-cache-size"))
+		++leaves;
+	if (leaves > 0)
+		levels = 1;
+
+	prev = np;
+	while ((np = of_find_next_cache_node(np))) {
+		of_node_put(prev);
+		prev = np;
+		if (!of_device_is_compatible(np, "cache"))
+			break;
+		if (of_property_read_u32(np, "cache-level", &level))
+			break;
+		if (level <= levels)
+			break;
+		if (of_property_read_bool(np, "cache-size"))
+			++leaves;
+		if (of_property_read_bool(np, "i-cache-size"))
+			++leaves;
+		if (of_property_read_bool(np, "d-cache-size"))
+			++leaves;
+		levels = level;
+	}
+
+	of_node_put(np);
+	this_cpu_ci->num_levels = levels;
+	this_cpu_ci->num_leaves = leaves;
+
+	return 0;
+}
+
 #else
 static inline int cache_setup_of_node(unsigned int cpu) { return 0; }
+int init_of_cache_level(unsigned int cpu) { return 0; }
 #endif
 
 int __weak cache_setup_acpi(unsigned int cpu)
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 00b7a6ae8617..ff0328f3fbb0 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -80,6 +80,7 @@ struct cpu_cacheinfo {
 
 struct cpu_cacheinfo *get_cpu_cacheinfo(unsigned int cpu);
 int init_cache_level(unsigned int cpu);
+int init_of_cache_level(unsigned int cpu);
 int populate_cache_leaves(unsigned int cpu);
 int cache_setup_acpi(unsigned int cpu);
 bool last_level_cache_is_valid(unsigned int cpu);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
