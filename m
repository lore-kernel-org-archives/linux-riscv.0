Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30328C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QK5dPJXnBkK/dmXko+yG5V+e5kgufgMURL4qhLfsRKA=; b=NxAyOZAQLWWM54
	f1XnRLE4xtfPxShMbB80PSV5ABVgwd7ZBwqy1Am/KHCXPWXlRChPYr0VdDd3tu36/NsaM7G6jBJjp
	Eno9UaxyNmLoa2bSHWCa/Ayq7D9wauzGxXc2lTboO5G0Hzxt0WjenTc8Y0iT3g2m+SlU7xVt5+5wB
	Pb4K8hqg3l0gbeQ3bfNo5iNdh59SYcO2w0aXvf9WW5BbUeXVwrxqbXMy+gB2E4mhsnMSVAmiuLSzO
	sXCwCmcjmR2Xde7o+/wE0fiC0B0oGOKKk+aEN3Vj/+d47YLNStYN7kTovvuAfKvfSDCApPHcSZiEq
	lAk1p7LxBf8ZVWwST8EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSqf-0000000AdvV-2Lnp;
	Fri, 07 Feb 2025 18:13:05 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgSoW-0000000AdUW-46f8
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 18:10:54 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-38db570a639so1393504f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 10:10:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738951851; x=1739556651; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaGa43r2JveY8ihF44rUo4WO7W9CMxjRpmYKl91QS2U=;
        b=Df6rLNraSSUYumwnhi41JwCkRy1PSERgmTRJCSLyLI4MPqlQW1v/a4CnOqnTumSDCx
         kD8hLzpHJSqiiaU+oDDR1oco+2yV2Vt9loIgvZVc1QvQ8ya+JZl6K+G63ZvahMFSwMXO
         alj6eZFjJMQXmJXvmLgAjAjnGFuoCP0HLt5aBnCVx/GzLFAbUWrjI8SvulUXMQiy0XvK
         ETbM3g1gez1F+S3Cv7GJXmuQLLgKPMG8/dBNSBxgYPziaaNQfVK5EEZ5KCywMdlZyT8D
         cH4co+LEfws2D38P9Hp17ZC610ayNZpMgHcOfWWRnxYKtfuYGpw+iUx80lyhL1pNvf1e
         S49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738951851; x=1739556651;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaGa43r2JveY8ihF44rUo4WO7W9CMxjRpmYKl91QS2U=;
        b=SqmJgWxNxgBtIXdVaIRqOYTY6fhKtHZQRvuLrI/Njg30fhC239s+5j4fgs+HNFsW/o
         sZ89po35moAAvOBN0LbsSDgb0e4s3sRV47uWkh0ZZe19oKbP6wAawaiGAtTeAQ2rhFJY
         968YGpQFe6FhlWNkXCDpvy5bgF5oFmcwg1CMdHRFja30g0qZCDrHn51TTOWaFoWNTFj2
         Mg1PfSzjTyHEs43mms1yNZV1ChpRTbZSrz5VqqJ1IDUHPgdalMBnsasW/oZt1eKbZIWq
         8fPygaxipZyp9gbl5LhJ1UgcIs0xqnJEty2q3KvDqVs27RZ6eqLdNyk+xi+2mW1ZINGK
         2UsQ==
X-Gm-Message-State: AOJu0YwVrTHKMdB4N9sRLoqn96TeNEi45Xmu8ChVAL/ZnmibChnColG2
	2n0ADJb+2ugcKxUjJ3Qi2FxFHFeQ65/NZTbYlJxZGCdmCnCBI0JU638aVSybixGURZCGKCz7Uf6
	tE7Q=
X-Gm-Gg: ASbGnctN+WOY3S08JOGqalv3ZN9n0IUftfpOcujzmoKvgAx9VbNqVQQDY1Pvrlon8QM
	E+hzUaXX4+rcG/DrwGugl5f8QMW7U0W4NBiu5kAefan1ntLpM6MYoL6y33PTrL3LoUMFfj0blEY
	vaPBoFErdM2Kfw4Awm//o9ybXEqDeRfnyl8o4R+yKO9vL/OXEpybD20DLiQS365TxzVtmGs8EEi
	kKL1BLT7AB7DYHobxkWKy1b6ZopXX7FP4fnSZ4cza27Xt80S11mm8GpSU0aTHbGMcByLU1xuzkw
	fpE23GRPfXk1ofLszcP9
X-Google-Smtp-Source: AGHT+IHOihO78F1JYjZBcL716TkRfKyLKlP1MuS9GngQcG+qjWBNUOBMY89/HVssLqqzYEkL5feOmg==
X-Received: by 2002:a05:6000:188b:b0:38d:b7dc:30b8 with SMTP id ffacd0b85a97d-38dbb2cf5b8mr7099206f8f.18.1738951851310;
        Fri, 07 Feb 2025 10:10:51 -0800 (PST)
Received: from localhost ([2a00:11b1:103b:18b0:943f:8e0:c299:6db0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d933794sm100227965e9.7.2025.02.07.10.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 10:10:50 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: cleger@rivosinc.com
Subject: [PATCH 8/9] riscv: Implement check_unaligned_access_table
Date: Fri,  7 Feb 2025 19:10:49 +0100
Message-ID: <20250207181048.6045-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_101053_010132_77FE4E62 
X-CRM114-Status: GOOD (  15.84  )
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

Define the table entry type and implement the table lookup to find
unaligned access types by id registers which is used to skip probing.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 91 +++++++++++++++++++++-
 1 file changed, 89 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index f8497097e79d..bd6db4c42daf 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -12,6 +12,7 @@
 #include <linux/types.h>
 #include <asm/cpufeature.h>
 #include <asm/hwprobe.h>
+#include <asm/sbi.h>
 #include <asm/vector.h>
 
 #include "copy-unaligned.h"
@@ -230,11 +231,89 @@ static int __init lock_and_set_unaligned_access_static_branch(void)
 
 arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
 
-static bool check_unaligned_access_table(void)
+/*
+ * An unaligned_access_table_entry maps harts (or collections of harts) to
+ * unaligned access types. @level is used to determine whether @marchid and/or
+ * @mimpid should to be considered. All (level, mvendorid, marchid, mimpid)
+ * tuples formed from each table entry must be unique.
+ */
+enum id_level {
+	LEVEL_VENDOR,
+	LEVEL_ARCH,
+	LEVEL_IMP,
+};
+struct unaligned_access_table_entry {
+	enum id_level level;
+	u32 mvendorid;
+	ulong marchid;
+	ulong mimpid;
+	long type;
+};
+
+static struct unaligned_access_table_entry unaligned_access_table_entries[] = {
+};
+
+/*
+ * Search unaligned_access_table_entries[] for the most specific match,
+ * i.e. if there are two entries, one with mvendorid = V and level = VENDOR
+ * and another with mvendorid = V, level = ARCH, and marchid = A, then
+ * a hart with {V,A,?} will match the latter while a hart with {V,!A,?}
+ * will match the former.
+ */
+static bool __check_unaligned_access_table(int cpu, long *ptr, int nr_entries,
+					   struct unaligned_access_table_entry table[])
 {
+	struct unaligned_access_table_entry *entry, *match = NULL;
+	u32 mvendorid = riscv_cached_mvendorid(cpu);
+	ulong marchid = riscv_cached_marchid(cpu);
+	ulong mimpid = riscv_cached_mimpid(cpu);
+	int i;
+
+	for (i = 0; i < nr_entries; ++i) {
+		entry = &table[i];
+
+		switch (entry->level) {
+		case LEVEL_VENDOR:
+			if (!match && entry->mvendorid == mvendorid) {
+				/* The match, unless we find an ARCH or IMP level match. */
+				match = entry;
+			}
+			break;
+		case LEVEL_ARCH:
+			if (entry->mvendorid == mvendorid && entry->marchid == marchid) {
+				/* The match, unless we find an IMP level match. */
+				match = entry;
+			}
+			break;
+		case LEVEL_IMP:
+			if (entry->mvendorid == mvendorid && entry->marchid == marchid &&
+			    entry->mimpid == mimpid) {
+				match = entry;
+				goto matched;
+			}
+			break;
+		}
+	}
+
+	if (match) {
+matched:
+		*ptr = match->type;
+		return true;
+	}
+
 	return false;
 }
 
+static bool check_unaligned_access_table(void)
+{
+	int cpu = smp_processor_id();
+	long *ptr = per_cpu_ptr(&misaligned_access_speed, cpu);
+
+	return __check_unaligned_access_table(cpu, ptr,
+					      ARRAY_SIZE(unaligned_access_table_entries),
+					      unaligned_access_table_entries);
+}
+
 static int riscv_online_cpu(unsigned int cpu)
 {
 	if (check_unaligned_access_table())
@@ -380,9 +459,17 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 }
 #endif
 
+static struct unaligned_access_table_entry vec_unaligned_access_table_entries[] = {
+};
+
 static bool check_vector_unaligned_access_table(void)
 {
-	return false;
+	int cpu = smp_processor_id();
+	long *ptr = per_cpu_ptr(&vector_misaligned_access, cpu);
+
+	return __check_unaligned_access_table(cpu, ptr,
+					      ARRAY_SIZE(vec_unaligned_access_table_entries),
+					      vec_unaligned_access_table_entries);
 }
 
 static int riscv_online_cpu_vec(unsigned int cpu)
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
