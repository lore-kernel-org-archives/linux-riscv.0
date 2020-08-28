Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21DDC433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FC14208C9
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 07:09:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tgHP9vlL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="cXf97D38"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FC14208C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sUdGsWmV23egi1NIPJqvr3SNhQWIw6yH7pi8EGPeY3k=; b=tgHP9vlLI5emX4EIB/bjf3gc4
	u+LGAdCcTYJTSvnax9ztxT+ZvXY396oFEfXiVL5jXXkLg7wKbdcrsmv9O8yi7q34s+S3rTiuALkpB
	mNijtO8e/DHgkkvAabS1LBDbCIa+Abtpyz49fy6XdvyRjgE4lO0C8i5iFs7sJlMiIe+5bBSlzQuTw
	sSFrmD94twlnhCFqwV80Kx3NdKQ2XakPVDKxlzh2uXx21UzFjo+2R10d9VYd2lFZDimt8S85zEdv8
	tCeEtM4aVgPeWzoVSOqmkCtA1v57G5SbkHz2Ra6bINED01WHSh085NHYweJcsBgXjR+uJxHASVTCS
	2smuxoZgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBYVl-0004cP-0y; Fri, 28 Aug 2020 07:09:21 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBYVi-0004b7-Ed
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 07:09:19 +0000
Received: by mail-pg1-x542.google.com with SMTP id p37so32349pgl.3
 for <linux-riscv@lists.infradead.org>; Fri, 28 Aug 2020 00:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0/HQoclrFB+hqZ38ogIZhhpo7z/PjWFWcD7V3KhVE1M=;
 b=cXf97D38uxELp4hcn43WKFfrM5IaDjMOCdIcXvlotIPCzE342mRt7SeGtV2/3Y4pKr
 UdDZXNWHq/DFoL7J75V7PyjEJD8/lUYz3iokq3eMf1tmnewPpAOgDXrDB4JOh0AITOOY
 PSSlpS8UQKPYxrMVS1F6pNYE1FUL9XRExG2uewWikjWdMG48UI8qErW10Pk/zjrNBY44
 yo0gp0h+lOXYucfCqouCRZ7ykjvB/oe3bpJroTdQC2E6+yJH/vfiJv3ACcC84sThd2lg
 mUS1Nmqsj9iioFZ9HS8sjt0XXg3lJ3KigDrk9o5svYXfyvjQ7plG1l3L7+wfkZtlZLWy
 zntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0/HQoclrFB+hqZ38ogIZhhpo7z/PjWFWcD7V3KhVE1M=;
 b=eceeMN3KKXhi2+s/IRuVUF4spm/B9jfKCUEXi80vGG0R+soHdWrtWaV1xdhi3gWB7r
 Fhk80lFgjrXRwXxhBDhfHBHiAoVqYohdJt19nAcC8zuXpABXC0VBkqou026fLYrAmtqm
 t05RjS71slADKfaPJVdsDyjK/nU7u2rUlKUVtaBw/8qPQqJKJeIECZpsXMsCHG3MdAAm
 UpO1tTX00evKubd+m0qWk9kMKGHqirgyUr3HaGw4d0y88qDglqr440TgmwFcJG2lp17C
 3eeIk1Tf9Uj38T3BGNT//PMEOxDZnAUcIKKmbmo8rXVtlLq3UvvCm3215f9su++bXh/i
 DP3Q==
X-Gm-Message-State: AOAM530K/nt7xsEmT6H4rSLwgTeqg4Mazaw3tWQ3Ex6lYW28QtNVGz/t
 +I/VCq3NLmFDC1K6toPlc8f4EQ==
X-Google-Smtp-Source: ABdhPJyrhpDTUbmO4L2Q/Sn00KMcK7LGG3TJpgsBkxKWlDHQD0kNvvDeVaDvwm3UpZuR43Opdk344A==
X-Received: by 2002:a63:b70c:: with SMTP id t12mr246648pgf.178.1598598556647; 
 Fri, 28 Aug 2020 00:09:16 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id b8sm434158pfp.48.2020.08.28.00.09.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 00:09:16 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] riscv: Add cache information in AUX vector
Date: Fri, 28 Aug 2020 15:09:07 +0800
Message-Id: <ee6a18d118b65cca0602e32bbb8be092f63ae8b6.1598598459.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598598459.git.zong.li@sifive.com>
References: <cover.1598598459.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_030918_558633_98E3BC67 
X-CRM114-Status: GOOD (  21.47  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

There are no standard CSR registers to provide cache information, the
way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
could use them to get information of cache through AUX vector.

The result of 'getconf -a' as follows:
LEVEL1_ICACHE_SIZE                 32768
LEVEL1_ICACHE_ASSOC                8
LEVEL1_ICACHE_LINESIZE             64
LEVEL1_DCACHE_SIZE                 32768
LEVEL1_DCACHE_ASSOC                8
LEVEL1_DCACHE_LINESIZE             64
LEVEL2_CACHE_SIZE                  2097152
LEVEL2_CACHE_ASSOC                 32
LEVEL2_CACHE_LINESIZE              64

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/include/asm/cacheinfo.h   |  5 +++++
 arch/riscv/include/asm/elf.h         | 13 +++++++++++
 arch/riscv/include/uapi/asm/auxvec.h | 23 +++++++++++++++++++-
 arch/riscv/kernel/cacheinfo.c        | 32 +++++++++++++++++++++++++++-
 4 files changed, 71 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/cacheinfo.h b/arch/riscv/include/asm/cacheinfo.h
index 5d9662e9aba8..d1a365215ec0 100644
--- a/arch/riscv/include/asm/cacheinfo.h
+++ b/arch/riscv/include/asm/cacheinfo.h
@@ -1,4 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 SiFive
+ */
 
 #ifndef _ASM_RISCV_CACHEINFO_H
 #define _ASM_RISCV_CACHEINFO_H
@@ -11,5 +14,7 @@ struct riscv_cacheinfo_ops {
 };
 
 void riscv_set_cacheinfo_ops(struct riscv_cacheinfo_ops *ops);
+uintptr_t get_cache_size(u32 level, enum cache_type type);
+uintptr_t get_cache_geometry(u32 level, enum cache_type type);
 
 #endif /* _ASM_RISCV_CACHEINFO_H */
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index d83a4efd052b..5c725e1df58b 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -11,6 +11,7 @@
 #include <uapi/asm/elf.h>
 #include <asm/auxvec.h>
 #include <asm/byteorder.h>
+#include <asm/cacheinfo.h>
 
 /*
  * These are used to set parameters in the core dumps.
@@ -61,6 +62,18 @@ extern unsigned long elf_hwcap;
 do {								\
 	NEW_AUX_ENT(AT_SYSINFO_EHDR,				\
 		(elf_addr_t)current->mm->context.vdso);		\
+	NEW_AUX_ENT(AT_L1I_CACHESIZE,				\
+		get_cache_size(1, CACHE_TYPE_INST));		\
+	NEW_AUX_ENT(AT_L1I_CACHEGEOMETRY,			\
+		get_cache_geometry(1, CACHE_TYPE_INST));	\
+	NEW_AUX_ENT(AT_L1D_CACHESIZE,				\
+		get_cache_size(1, CACHE_TYPE_DATA));		\
+	NEW_AUX_ENT(AT_L1D_CACHEGEOMETRY,			\
+		get_cache_geometry(1, CACHE_TYPE_DATA));	\
+	NEW_AUX_ENT(AT_L2_CACHESIZE,				\
+		get_cache_size(2, CACHE_TYPE_UNIFIED));		\
+	NEW_AUX_ENT(AT_L2_CACHEGEOMETRY,			\
+		get_cache_geometry(2, CACHE_TYPE_UNIFIED));	\
 } while (0)
 #define ARCH_HAS_SETUP_ADDITIONAL_PAGES
 struct linux_binprm;
diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 22e0ae888406..32c73ba1d531 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -10,7 +10,28 @@
 /* vDSO location */
 #define AT_SYSINFO_EHDR 33
 
+/*
+ * The set of entries below represent more extensive information
+ * about the caches, in the form of two entry per cache type,
+ * one entry containing the cache size in bytes, and the other
+ * containing the cache line size in bytes in the bottom 16 bits
+ * and the cache associativity in the next 16 bits.
+ *
+ * The associativity is such that if N is the 16-bit value, the
+ * cache is N way set associative. A value if 0xffff means fully
+ * associative, a value of 1 means directly mapped.
+ *
+ * For all these fields, a value of 0 means that the information
+ * is not known.
+ */
+#define AT_L1I_CACHESIZE	40
+#define AT_L1I_CACHEGEOMETRY	41
+#define AT_L1D_CACHESIZE	42
+#define AT_L1D_CACHEGEOMETRY	43
+#define AT_L2_CACHESIZE		44
+#define AT_L2_CACHEGEOMETRY	45
+
 /* entries in ARCH_DLINFO */
-#define AT_VECTOR_SIZE_ARCH	1
+#define AT_VECTOR_SIZE_ARCH	7
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/kernel/cacheinfo.c b/arch/riscv/kernel/cacheinfo.c
index 8b85abfbd77a..ee6ec91260b3 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2017 SiFive
  */
 
-#include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
@@ -25,6 +24,37 @@ cache_get_priv_group(struct cacheinfo *this_leaf)
 	return NULL;
 }
 
+static struct cacheinfo *get_cacheinfo(u32 level, enum cache_type type)
+{
+	struct cpu_cacheinfo *this_cpu_ci = get_cpu_cacheinfo(smp_processor_id());
+	struct cacheinfo *this_leaf;
+	int index;
+
+	for (index = 0; index < this_cpu_ci->num_leaves; index++) {
+		this_leaf = this_cpu_ci->info_list + index;
+		if (this_leaf->level == level && this_leaf->type == type)
+			return this_leaf;
+	}
+
+	return NULL;
+}
+
+uintptr_t get_cache_size(u32 level, enum cache_type type)
+{
+	struct cacheinfo *this_leaf = get_cacheinfo(level, type);
+
+	return this_leaf ? this_leaf->size : 0;
+}
+
+uintptr_t get_cache_geometry(u32 level, enum cache_type type)
+{
+	struct cacheinfo *this_leaf = get_cacheinfo(level, type);
+	uintptr_t ret = (this_leaf->ways_of_associativity << 16 |
+			 this_leaf->coherency_line_size);
+
+	return this_leaf ? ret : 0;
+}
+
 static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
 			 unsigned int level, unsigned int size,
 			 unsigned int sets, unsigned int line_size)
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
