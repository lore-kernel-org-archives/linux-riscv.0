Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5239BC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 125B3207BB
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 07:34:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BL2fyJKX";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="mACKkyQQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 125B3207BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6cVtETdt0v9jN4rlHSfR2OEXo3fT5IorTp0mEeXys7Y=; b=BL2fyJKXAM0t4rRz4UsbInYRB
	cHrsa6mgIgqkVXIAqEHahAdAQKH2qsahp/Yrli1Dwcpq4gXsDEk4o/syfaDXs2Gr6bnPlFDKhSOI2
	fQ/AWbJdzdXnP+nR9UVol7ZvTS5ny92uQkX0fRFdcjPG7OgaUhYHL+/yBQMrfkT6Xm3+ax9sjyKDE
	R7vts1YU2nXh2azC3BxYmJKsJKjZzbPi8bYO2QiaZuq/MLQ3ylUuZucej00upOaR3VJ3Y5uLiDstn
	lW5dEMlH0hVedDbmGhPNQeSJ5DqUcPJ20uabVkOmaK0v/kArnOo75/rEk7oKO7N6620XkunqrL7rO
	r+SkKWs2w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCeKK-00006c-8R; Mon, 31 Aug 2020 07:34:04 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCeKG-00004q-Vw
 for linux-riscv@lists.infradead.org; Mon, 31 Aug 2020 07:34:02 +0000
Received: by mail-pg1-x542.google.com with SMTP id g29so161481pgl.2
 for <linux-riscv@lists.infradead.org>; Mon, 31 Aug 2020 00:34:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=D2/zDTHvWlr1Ly8bFpcj2KiwYie4rAzDW76UW7C3FiQ=;
 b=mACKkyQQ3E/8JXYbwFUTlc1csMGhgn1EiPhe/kKRn4KBtyQaNIy996S4oVaTWzlCIu
 tLDEfA8yVJcq6YAC8VOuPDhIpk5u1jVuz/u47YDYMr/nNi+XKiwzI12UZaFZFS4JrbhR
 hy4GxpGFrtcl1cjCIm/lGKk1tcow2uDZjBkrqyUE4U1ltLvNXsk0eOS+/LmFw3HRZx/w
 HowbdOqEENDRs0P/AnZ33dv/PMMJPbYUq+HUdnFEDaH24O5y+Mv1IDklM62ZeVlX4sbJ
 FbdXCOTDyrPR6CzWnoVt0VVJ6rxCZwpgfwZJz+KwWqgmbTFaxJBygSyPPwdS7a3bo/+S
 Bpqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=D2/zDTHvWlr1Ly8bFpcj2KiwYie4rAzDW76UW7C3FiQ=;
 b=hNh8ziwKwWp2nsj40F94cVDX3uSBbtGnw1QBJogmmwXxKFM/R4CloDyTO3g//z3VL7
 uvEJRC3gUIMk7B9DVLKpP4nqTrtc33AlcbNuLdLEN4GOFEnqY1FRWIHDF0lDSpfOMwPK
 ViKKEfKB3p3YoytPkbtzrPL4+y/Z4SDc4Jt8r/UOC9ISziR5220FK3VT953hCDieK3Oj
 YG2caN3Gyu0Gm6nE96iN+a8jVB1DWJgcYhghmEpN60Pac+qE5XtpehNPW1HDCEXclJ+p
 XICjcQl0D+oQg8GJjQ9cf4aKgNGvZurFxdz1X34MODEseWQ0YFtjiVzmTmGHkFdPRF/C
 QhDw==
X-Gm-Message-State: AOAM533BvADegj3HleAcQyy7twQSR0eGiQNmA2qTbdzpx+MIume2AF1e
 wbTkOSYKGWg6NYX8bH9tIWuo0g==
X-Google-Smtp-Source: ABdhPJwDzdqwO+6c2A0n956bc0Kzwtr46Zq0Wj5zhNMlJWmnjRsDKjYooyKfh0ZE52LII3vg+9b+xQ==
X-Received: by 2002:a65:6286:: with SMTP id f6mr336781pgv.0.1598859238809;
 Mon, 31 Aug 2020 00:33:58 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id m3sm6065979pjn.28.2020.08.31.00.33.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Aug 2020 00:33:58 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/3] riscv: Add cache information in AUX vector
Date: Mon, 31 Aug 2020 15:33:50 +0800
Message-Id: <b6fed9b4c2a3eacb2a9c353c2570d9dc1d0c1c88.1598859038.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1598859038.git.zong.li@sifive.com>
References: <cover.1598859038.git.zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200831_033401_067509_243ADFB6 
X-CRM114-Status: GOOD (  20.81  )
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
index 291d7d8f748b..de59dd457b41 100644
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
+
+	return this_leaf ? (this_leaf->ways_of_associativity << 16 |
+			    this_leaf->coherency_line_size) :
+			   0;
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
