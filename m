Return-Path: <SRS0=aIEb=AO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56B83C433E1
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 294572084C
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2020 08:58:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TgY1ZUaG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lrQzB7Ek"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 294572084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8IgIzXBh/wUzdXuv8uhbwezw0H9vVujTwQ+SHjMUmXA=; b=TgY1ZUaGZ6C+pPSudJjT/krvD
	vC5IcAbXJkGinUiWWpZ4uhQI1cbywRI3AQpIIp1gvbK75ETboI7rLIAhMxKTKDWBpKHn7Xh5rJdrV
	Us0Y6AmKCnaIPcaWbFMUVfFIlAfy757F7poKvd90eYUZjko01RT8a4Z6wNLqQwWmqwx5Z6yAB5hZU
	O0FNtdvDlmehAAcLRbG3sTXcaeAOQAgaE8+ZAr9JKnuLrNVBwL3X4T0ferSU21LeIgJIre1A+TXb3
	tUIiERSH3FANTbIzNH8TO/R3Pnw3lIXLiprWO0xT6V5tdfj4QcdAVzqeWs1/xBGlhkXGuFmJhV3Il
	w5BTlRStA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jrHWK-00036T-Lb; Fri, 03 Jul 2020 08:58:08 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jrHWI-000357-A4
 for linux-riscv@lists.infradead.org; Fri, 03 Jul 2020 08:58:07 +0000
Received: by mail-pj1-x1042.google.com with SMTP id gc9so7137867pjb.2
 for <linux-riscv@lists.infradead.org>; Fri, 03 Jul 2020 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=k5L8NObQEzyS+/JLPwFcEH2ZHcXncJHg+hMC0oanQIM=;
 b=lrQzB7Ekjzc0cdr3gHo1HfR/yMcchGFdyAFKx9DU60Rc5yHUbn0Lx3CAUA8k4VwGGs
 uTHooG0TVm1cP47El3ohXhymEdIf3zhq29247azDfApabPx5kf7GxT44LhiQfiKMc4w4
 58qqA9yCZq19OkKXtzdkOAjsL2ONOLlfj4ICN+qC2ac+0ZZlmtPrwNZJxYrgs/2tTzJy
 oV0lT53Nlfpzy1CBOpS9dh/MjyEQfaM4evClnqDtQoz0lxy2lDO74Af9bDJ1B+h8rDvU
 32v7+PN8/vGHmoOk7uLDkT/OFK5+EGuUmZ6e3YX5dI+nSnh86GoXylI/DVhLK+ViFyEI
 SnHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=k5L8NObQEzyS+/JLPwFcEH2ZHcXncJHg+hMC0oanQIM=;
 b=LSDzgdJkfc3wF6ZMiBHdB8priNfFeVJKl18yr45y3xzc2ZIC/k/oUlKKMT+Cz7ynJW
 YLRvnqZzoDvotj0IV+Z8+CPpWUFhR1IhISYkMbZ/Q/0BCZLEzYgporsH1URj8FP29FkK
 BEKelnooyahs8M+DE3F/LZM/nTAcfB6Ia+hoPMEwo1vZEvw0wT/ae4DwO1hj+3wvbdtV
 lqMncUbMip3kP0fkNJTIzchlGuArnQQJG4vo1F7jepla3n5KDkDDtMNlwPGy5wrfZ/n4
 k9Y0qDsdQOHfZPXHqgyJVuDgbOnHaca2Zv7b0o26QkTXacKM2YwPYCiV6R3DRTTa69IL
 R6wQ==
X-Gm-Message-State: AOAM5310ncn7SizCS2bymqtSQ4eqsuWsc25KFTYvUpiWMKQUc4pPGh2C
 J6RR4a1vsUcNh0xXr2xEX8gZAPfwXE8=
X-Google-Smtp-Source: ABdhPJw5vxhyVn4tFLalV8PwqFsfed5R2PePhZXSqwfXgfj6LHXDeCv2va1ofYEgUSg6CR85YmXbtw==
X-Received: by 2002:a17:902:9042:: with SMTP id
 w2mr20339410plz.8.1593766684385; 
 Fri, 03 Jul 2020 01:58:04 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id l23sm2126287pjy.45.2020.07.03.01.58.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Jul 2020 01:58:04 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] riscv: Add cache information in AUX vector
Date: Fri,  3 Jul 2020 16:57:55 +0800
Message-Id: <aa7675dda78d3d595617d8d56b7fdd7f279a884f.1593766028.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593766028.git.zong.li@sifive.com>
References: <cover.1593766028.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200703_045806_431761_D17A6395 
X-CRM114-Status: GOOD (  20.90  )
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
Cc: Zong Li <zong.li@sifive.com>
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
---
 arch/riscv/include/asm/cacheinfo.h   | 14 ++++++++++++
 arch/riscv/include/asm/elf.h         | 13 +++++++++++
 arch/riscv/include/uapi/asm/auxvec.h | 23 ++++++++++++++++++-
 arch/riscv/kernel/cacheinfo.c        | 33 +++++++++++++++++++++++++++-
 4 files changed, 81 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/include/asm/cacheinfo.h

diff --git a/arch/riscv/include/asm/cacheinfo.h b/arch/riscv/include/asm/cacheinfo.h
new file mode 100644
index 000000000000..ba179cd198b9
--- /dev/null
+++ b/arch/riscv/include/asm/cacheinfo.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2020 SiFive
+ */
+
+#ifndef _ASM_RISCV_CACHEINFO_H
+#define _ASM_RISCV_CACHEINFO_H
+
+#include <linux/cacheinfo.h>
+
+uintptr_t get_cache_size(u32 level, enum cache_type type);
+uintptr_t get_cache_geometry(u32 level, enum cache_type type);
+
+#endif /* _ASM_RISCV_CACHEINFO_H */
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
index cdd35e53fd98..263335def44b 100644
--- a/arch/riscv/kernel/cacheinfo.c
+++ b/arch/riscv/kernel/cacheinfo.c
@@ -3,10 +3,41 @@
  * Copyright (C) 2017 SiFive
  */
 
-#include <linux/cacheinfo.h>
 #include <linux/cpu.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <asm/cacheinfo.h>
+
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
+	return 0;
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
 
 static void ci_leaf_init(struct cacheinfo *this_leaf, enum cache_type type,
 			 unsigned int level, unsigned int size,
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
