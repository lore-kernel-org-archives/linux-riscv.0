Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7DE6F9D0FD
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Apr 2026 01:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K2/vQqm4aBmCN/sxWxy0VFJ09chq9G9nMS9+PyUMMZs=; b=cCxiqelR6llDLg
	2Qo7psLMHUMO9gsvLqHUtpF3RXDHsYvzCCgODbQTFNs+mSuefSgL0jkBVmtpNVllsQS0T+VVLjyIi
	husy69qTt6xBhBoPDGJjrIGYzF85LD8dRMthKJMcrkuYOe3aYmJ4KoStcLZhbAsJ2NeLdMVTFGxzH
	LMvN46h7i3dXqjypw27Zi0T8Km6rackIPrglCHTJRUD6H5znBu8aEIVAZAweKWVkDuriSlzsG0DEA
	1ASx6/yjDLTEZzI88ftorxYIhq2NZFYjvWMtFN8iWr9Y4OqyAUMXLAE4woZ6S7Xli5F7YaFgZ/ckQ
	JZTjxIYFHmrhrm9P8P3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUz-00000000Rr0-0Vy6;
	Wed, 15 Apr 2026 01:57:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCpUv-00000000RnX-2q7A
	for linux-riscv@lists.infradead.org;
	Wed, 15 Apr 2026 01:56:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5AEE8409AB;
	Wed, 15 Apr 2026 01:56:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42D6C2BCC6;
	Wed, 15 Apr 2026 01:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776218217;
	bh=K1u9KtDv/RgUAXZ7DmVQ4g7/U7BEShgGe9dLp0XEClE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UNt385vlbIZ2Dqkx6XB+BnqbrzGzSEYUN2m88yHdpyXxcCsGzIG6BTUdrLo6w+OIs
	 udV42Svr7ZiZmh1W+x/iKMz3Wiea9g3n0LuJ1lKikalo6EJVsBi5RfX5+ncBjwgSM9
	 tuSeGihQQEJ+WsScNlo3UMljvlsLiK0+g6bLE3wTvED+iHHglcoo6W0ntrsQxhJEzn
	 HgL9I0AgeS97vKge4PRD+Vw2XnLORf6vvDJfL9hHAZDlJrQ9hYHS2Wb9tE3WTnpqZ7
	 hlFQQr+nog3wVKtqrVBIC2MuiT1P8+aTUg4+W8CqFUFk+NlU5iuulmmnx4AZIm+I+n
	 i3XETS8Isk6Lw==
From: Drew Fustini <fustini@kernel.org>
Date: Tue, 14 Apr 2026 18:54:02 -0700
Subject: [PATCH RFC v3 08/11] ACPI: PPTT: Add
 acpi_pptt_get_cache_size_from_id helper
MIME-Version: 1.0
Message-Id: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-8-b3b2e7e9847a@kernel.org>
References: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
In-Reply-To: <20260414-ssqosid-cbqri-rqsc-v7-0-v3-0-b3b2e7e9847a@kernel.org>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, Gong Shuai <gong.shuai@sanechips.com.cn>, 
 Gong Shuai <gsh517@gmail.com>, liu.qingtao2@zte.com.cn, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3731; i=fustini@kernel.org;
 h=from:subject:message-id; bh=K1u9KtDv/RgUAXZ7DmVQ4g7/U7BEShgGe9dLp0XEClE=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTe+5A04VtdUsJcsRSL83MPh3Ae9F6Z9HRbIM+xv+fk3
 kz5phVf1FHKwiDGxSArpsiy6UPehSVeoV8XzH+xDWYOKxPIEAYuTgGYyM7nDP9slAq03RcZRUmr
 R3hvlON7uNzq8PogW/PLL8TXzeTpv3uFkeH9Oocv167lySbV6z+6bPD0tFLSK157q3UX2qetFu8
 5q8cLAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_185657_769450_E49607E5 
X-CRM114-Status: GOOD (  15.61  )
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

Add helper to look up a cache's size from its cache ID in the PPTT
table. This is needed by the RISC-V RQSC parser to determine the cache
size for CBQRI capacity controllers.

The implementation follows the pattern established by
find_acpi_cache_level_from_id() and acpi_pptt_get_cpumask_from_cache_id():
uses acpi_get_pptt(), upgrade_pptt_cache(), checks all three cache types,
and uses the do/while empty-detection loop.

Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/acpi/pptt.c  | 63 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/acpi.h |  8 +++++++
 2 files changed, 71 insertions(+)

diff --git a/drivers/acpi/pptt.c b/drivers/acpi/pptt.c
index de5f8c018333..36e375551b43 100644
--- a/drivers/acpi/pptt.c
+++ b/drivers/acpi/pptt.c
@@ -1063,3 +1063,66 @@ int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus)
 
 	return 0;
 }
+
+/**
+ * acpi_pptt_get_cache_size_from_id() - Get the size of the specified cache
+ * @cache_id: The id field of the cache
+ * @size: Where to store the cache size in bytes
+ *
+ * Determine the size of the cache identified by cache_id. This allows the
+ * property to be found even if the CPUs are offline.
+ *
+ * The PPTT table must be rev 3 or later.
+ *
+ * Return: -ENOENT if the PPTT doesn't exist, the revision isn't supported or
+ * the cache cannot be found. Otherwise returns 0 and sets *size.
+ */
+int acpi_pptt_get_cache_size_from_id(u32 cache_id, u32 *size)
+{
+	int cpu;
+	struct acpi_table_header *table;
+
+	table = acpi_get_pptt();
+	if (!table)
+		return -ENOENT;
+
+	if (table->revision < 3)
+		return -ENOENT;
+
+	for_each_possible_cpu(cpu) {
+		bool empty;
+		int level = 1;
+		u32 acpi_cpu_id = get_acpi_id_for_cpu(cpu);
+		struct acpi_pptt_processor *cpu_node;
+
+		cpu_node = acpi_find_processor_node(table, acpi_cpu_id);
+		if (!cpu_node)
+			continue;
+
+		do {
+			int cache_type[] = {CACHE_TYPE_INST, CACHE_TYPE_DATA, CACHE_TYPE_UNIFIED};
+
+			empty = true;
+			for (int i = 0; i < ARRAY_SIZE(cache_type); i++) {
+				struct acpi_pptt_cache *cache;
+				struct acpi_pptt_cache_v1_full *cache_v1;
+
+				cache = acpi_find_cache_node(table, acpi_cpu_id, cache_type[i],
+							     level, &cpu_node);
+				if (!cache)
+					continue;
+
+				empty = false;
+
+				cache_v1 = upgrade_pptt_cache(cache);
+				if (cache_v1 && cache_v1->cache_id == cache_id) {
+					*size = cache->size;
+					return 0;
+				}
+			}
+			level++;
+		} while (!empty);
+	}
+
+	return -ENOENT;
+}
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 4d2f0bed7a06..0596ec18f522 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -1547,6 +1547,7 @@ int find_acpi_cpu_topology_package(unsigned int cpu);
 int find_acpi_cpu_topology_hetero_id(unsigned int cpu);
 void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id, cpumask_t *cpus);
 int find_acpi_cache_level_from_id(u32 cache_id);
+int acpi_pptt_get_cache_size_from_id(u32 cache_id, u32 *size);
 int acpi_pptt_get_cpumask_from_cache_id(u32 cache_id, cpumask_t *cpus);
 #else
 static inline int acpi_pptt_cpu_is_thread(unsigned int cpu)
@@ -1571,10 +1572,17 @@ static inline int find_acpi_cpu_topology_hetero_id(unsigned int cpu)
 }
 static inline void acpi_pptt_get_cpus_from_container(u32 acpi_cpu_id,
 						     cpumask_t *cpus) { }
+
 static inline int find_acpi_cache_level_from_id(u32 cache_id)
 {
 	return -ENOENT;
 }
+
+static inline int acpi_pptt_get_cache_size_from_id(u32 cache_id, u32 *size)
+{
+	return -ENOENT;
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
