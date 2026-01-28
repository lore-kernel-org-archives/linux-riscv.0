Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 113B3D46BF8
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RNaiChDmGFu+gtETV6uicSlskySVTUy+JVfTVUMqrQs=; b=okmj+VDSs4m5Wl
	g8MbPwg10i9SmUqYses+hWF6vtA4IwMipE3+QjNoy3tlwVCS+rIrZ4Ahs38ZtQxPebo7PYx9e1hzG
	pS209JTQ/7W/s261dJmSR5HAGxm6E9OhX9zk54AqY7IubDtnx6/4n6P+N0WfXwHjCj9t08A23LbyN
	UPrDkxtD4uFKL98CYPR7FiuA+UzauSqvM3bljUzFRPURHhahXhx88UyIM8AZ4zrEg/HbA7ofG8R2K
	zB91dBrzNzEO4Lhz6y8X45PiKtKAtRkDVzHEqjlxtYylBl2H6RKnN77xssZ/ITRJ53j87AKBAT/rJ
	m5a7MzCL+N1qwiGc2MaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9M-0000000GkID-44wl;
	Wed, 28 Jan 2026 20:28:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC95-0000000Gk3G-01Qx
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A584D44528;
	Wed, 28 Jan 2026 20:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE73C2BCB6;
	Wed, 28 Jan 2026 20:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632090;
	bh=ocyqe4U7WsJJbTpfliXFcM4vxluIpCLTh7ZpGc7FQ9c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HbukFBG+BVdHcteku9MwelF3rnMrQgJFghq6OZXCg5Wo5w/M6fgaw9wzgtHBlHOW1
	 rW+G8vQfaNvEpize+pVloepoxynpzcwSDZtd1EvjSC7x6CRsoL+mEwfeiWcRaINuAB
	 HteP3IzzZ4ADheYpxvQLwdEw4d45oPj+bD4erFph+GLriIDePg7Wy0A795AFfwg58Q
	 oPznvx57FUi9ilO1GmxcLQEd3anBF7PgGs6eLNE0VUweCeMp0zy8wox7hUNXwW9sYN
	 nrkbieancGhVy32DDtoVxFMZ22KPgdi7fRCht6u66H7FBBP/GsUmiYk9w4BxjqokkX
	 +WncgTdQo4sjA==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:34 -0800
Subject: [PATCH RFC v2 13/17] acpi: pptt: Add helper to find a cache from
 id
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-13-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3896; i=fustini@kernel.org;
 h=from:subject:message-id; bh=ocyqe4U7WsJJbTpfliXFcM4vxluIpCLTh7ZpGc7FQ9c=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQZ+FZveccRm85//urc4F8ws39AV4PNEeSnr7A3fJ
 qQfjjZR6ihlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMZN5JRoY9yR671mX9nXtM
 Y0eh5fX2lpN5ji2OBTNnHiqsUwgTMzZn+B86nb1+klSz0ddQYdlrLO/8j2srLPvgcEXN9ulepdj
 O1ywA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122811_210721_6A8367D2 
X-CRM114-Status: GOOD (  14.27  )
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

Add function to find the pointer to an instance of acpi_pptt_cache.

find_acpi_cache_from_id() is based on find_acpi_cache_level_from_id()
from commit c4170570cc7f ("ACPI / PPTT: Find PPTT cache level by ID") in
the morse/mpam/snapshot/v6.14-rc1 branch.

TODO: find_acpi_cache_level_from_id() has changed since then so this
function should be updated. In additon, there may be a simpler way for
acpi_parse_rqsc() than adding this function to get a pointer to
acpi_pptt_cache.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/acpi/pptt.c  | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  8 +++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index de5f8c018333..d1002673dc39 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -1063,3 +1063,66 @@ int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
 
 	return 0;
 }
+
+/*
+ * find_acpi_cache_from_id() is adapted from find_acpi_cache_level_from_id()
+ * introduced by c4170570cc7f ("ACPI / PPTT: Find PPTT cache level by ID")
+ * in the morse/mpam/snapshot/v6.14-rc1 branch.
+ *
+ * TODO: find_acpi_cache_level_from_id() has changed since then so this
+ * function should be updated. In additon, there may be a simpler way for
+ * acpi_parse_rqsc() than adding this function to get a pointer to
+ * acpi_pptt_cache.
+ */
+struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
+{
+	u32 acpi_cpu_id;
+	acpi_status status;
+	int level, cpu, num_levels;
+	struct acpi_pptt_cache *cache;
+	struct acpi_table_header *table;
+	struct acpi_pptt_cache_v1 *cache_v1;
+	struct acpi_pptt_processor *cpu_node;
+
+	status = acpi_get_table(ACPI_SIG_PPTT, 0, &table);
+	if (ACPI_FAILURE(status)) {
+		acpi_pptt_warn_missing();
+		return NULL;
+	}
+
+	if (table->revision < 3) {
+		acpi_put_table(table);
+		return NULL;
+	}
+
+	for_each_possible_cpu(cpu) {
+		num_levels = 0;
+		acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (!cpu_node)
+			break;
+		num_levels = acpi_count_levels(table, cpu_node, NULL);
+
+		for (level = 1; level <= num_levels; level++) {
+			cache = acpi_find_cache_node(table, acpi_cpu_id,
+						     ACPI_PPTT_CACHE_TYPE_UNIFIED,
+						     level, &cpu_node);
+			if (!cache)
+				continue;
+
+			cache_v1 = ACPI_ADD_PTR(struct acpi_pptt_cache_v1,
+						cache,
+						sizeof(struct acpi_pptt_cache));
+
+			if (cache->flags & ACPI_PPTT_CACHE_ID_VALID &&
+			    cache_v1->cache_id == cache_id) {
+				acpi_put_table(table);
+				return cache;
+			}
+		}
+	}
+
+	acpi_put_table(table);
+	return NULL;
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index fbf0c3a65f59..fee6a5059a46 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1546,6 +1546,7 @@ int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
 void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
 int find_acpi_cache_level_from_id(u32 cache_id);
+struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id);
 int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
@@ -1570,10 +1571,17 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 }
 static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
 						     cpumask_t *cpus) { }
+
 static inline int find_acpi_cache_level_from_id(u32 cache_id)
 {
 	return -ENOENT;
 }
+
+static inline struct acpi_pptt_cache *find_acpi_cache_from_id(u32 cache_id)
+{
+	return NULL;
+}
+
 static inline int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id,
 						      cpumask_t *cpus)
 {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
