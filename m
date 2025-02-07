Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01022C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 18:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QK5dPJXnBkK/dmXko+yG5V+e5kgufgMURL4qhLfsRKA=; b=JQluh3/xz8ClFt
	/rPJwPXavP/DWcIInqz6MPhUwEYfg7LnmdY931rwxnTJAMnqPpny3RhCXtfwfswyhTLmiRsJe4yNT
	R2vtJFF7cjoxvoLqE5zEjZTi+Zed8oiclPBProFc1mx4RBQUcZU99i+8Z1bhSNsiexZaKgBAMp2sg
	p3jEMB1VB5kcycu1iedi28e2GuP8PUm6kv3noWYAdM0GL6+4UeEQOu7JQ5CCofuNroxBepTc4S+xw
	cD45SNhmrm54aohJQ68uv2X3yjIzpBG3HZoAum6QqTgZi/SZucd8c6XNtjniqLDTp4EEhMK69mgar
	WF41Txe7BhlhbAx+onHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTMz-0000000Am8c-1cWk;
	Fri, 07 Feb 2025 18:46:29 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5y-0000000AFj2-0t4h
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:20:47 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-436ce2ab251so15370885e9.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945245; x=1739550045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZaGa43r2JveY8ihF44rUo4WO7W9CMxjRpmYKl91QS2U=;
        b=YxLIZiF1QbnBGAo/KKQn7sTKUBlfYT9nCw5QllSEoksg9U7csz8yccBcfyKYVz4Wir
         fZ+v1HviybPpy/FoeujDrqMyYsiD0uoz6kCTXwz78K9lK2kTB09g6nzsrLhdVcAdcOpJ
         jK85Yt6RJ1JW/kCCYYDKSqfgDet21akHr330YUsP9nGdTaTqmy5A4qMGe1OJTlIO2jJ3
         okrHynuyT36aUfnKLiHQI9ynhx4OYe8VFdlGh5pk5yvPzAVE3DvcpIKLGIAp5N1B0Zxs
         Y5lKGwBwi7seQW3gn4Aq3fTqwPVoTIkFtrE5Qkv3ccexvg6G+JVpTybJqHYwlwMDcV2m
         6iqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945245; x=1739550045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZaGa43r2JveY8ihF44rUo4WO7W9CMxjRpmYKl91QS2U=;
        b=jEDhv5ohONImU4f90fAPZs8lJwLm0YravFTkd+s9VMfUZiqpgTj61R6chIPwdycCch
         U5xcCQsbxQ5adZwMccZXXm2dCLxmFjOPL+XrcfFwNLtI3JYxVa7goD2DCmWabFTGrr7T
         re0zgj9L5eJIJiBq9QEjuIOu6dt5qwsxDf4JKgW1UFMgABCbMN4L5NaGe+S/5gyWAO7r
         jR+CSzTdKpbCkOQo9cjFw/DxKtTd6/GIER3qkQ9QXkUivTpp6Ci+w1eMir4OgmtawicA
         JHxsTD7iRZzXkUPAds0sG7sHufCYK8biVbn4zWec16gR16DWbEP8G17b8J/KQys40TIc
         H1pA==
X-Gm-Message-State: AOJu0YxZ4XrI5+J+i8JbxLdctpL5tB6JrQLSbOC6h3U7SeLg8575Zfbt
	JiBivxq/dRqIATxkfpsQsGUSK5CcTRNJCjgYOrM8i+P1VLkT7SJTuttXQeCAtC+9r3k+KlziOue
	JQH4=
X-Gm-Gg: ASbGnct32iXZ81MOMDY86qEXgzUC+A5qhzdwoXqTF7Xjy+Ve79IHWd5Gse1noDYP2kq
	htQkEc/7gU3QSzSpeyOYOJ311aK3WBr6xxnP2iJ0jY/EOeMNS0Fh/+JiR83FeAwyT2B1k6Y/ZY6
	JugG9jTUkdl6v6UMGdiA8Rewyz1ZELYcxVZQ7WERxYkIITYAYgbEyPj6Qi4JGe0mSw6FJ44x/Km
	Uu0ndTFNk/tH5YCnF33nytoGA/7XG1nCMaMvVYGmjp+nZQiRD1iOZFGKUfrwzbNICcp8l4v9SSj
	maohXRvnsa2WAmRSJk3wsrPYO5VL0mc6TUiGXSSqDipevVLMuzWERP3PBw==
X-Google-Smtp-Source: AGHT+IEsxHTbv/ApYqI1Db4PbE3wHNdmjENh4/dQ6JTZy1CmXAHF/WRV8cibN7pL6QAb7qvzWGRwaQ==
X-Received: by 2002:a05:600c:6a88:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-439249a4033mr32953915e9.19.1738945244744;
        Fri, 07 Feb 2025 08:20:44 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dbde0ff44sm4891569f8f.76.2025.02.07.08.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:44 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 8/9] riscv: Implement check_unaligned_access_table
Date: Fri,  7 Feb 2025 17:19:48 +0100
Message-ID: <20250207161939.46139-19-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082046_249566_BFDC88A2 
X-CRM114-Status: GOOD (  15.69  )
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
