Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A474DC54798
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Mar 2024 20:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w70xITaCma6OVdx6baqnQZBFD6T+MhCXDBEIGWSLu/c=; b=kg3DBblUpRE1Jr
	LpSRckXycw3Ctovz4JaJsRTPCEcY2SXLx2uku1rpKv4DXq6kovOIbyZ9Y9JLRl0HMDl/xd1vQmwg7
	YRFiwpzfIoXqGAfIisTaATVkgeFVyqaoiom5enoCtdgv5+TX1/FL5pyPuLiXJ82R8lzHJSLJzAVoo
	aJiRXuqnuee2Pv8+zzQlfGvb2Cw7DQb4mI47YKUrj9YkHlV8XY5fCQ/imCxstOZ4dB0L5En/7SB7j
	KAbGfTWvk1afJCSWzqHt/KwOs4fzxAqdcizZfmmnrQvXPb+D53H3IX7aMl++DLbR0VsaEkPaGA+2X
	USoD6zOVcWO8pR/ljHlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riK0r-00000006Cxj-1ZmR;
	Thu, 07 Mar 2024 20:06:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riJ3z-00000005yPy-3GFf
	for linux-riscv@lists.infradead.org;
	Thu, 07 Mar 2024 19:05:59 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1dd611d5645so4486995ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Mar 2024 11:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709838354; x=1710443154; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akMpdDedBfqF60/fNsk+O8npKk5JqF+ySZ0f9xW5/1M=;
        b=pFYq1MQ0RW+gjAE2WI59qoVnYMV9Y2mfb+3zZaY3I6sA1Hjyn0at273IDsgqhRyzAB
         qtmp3RZ2CBFCYGl2NopQnCC2QaHrz9+fu0VsgQJtKI0Gy5TXW3hKF8hGZqSgA23qK1Cb
         ZBzAi1KdPT4OSgl/mLypvfbBRBvj5rlx78m8JYgLaLSDAlrHp8jV00jf6dG2mzVRfdGs
         PvkDHt55kzwsTggtN41l17uvYcRHaNZGJyz/1kHG/SrbAnLuPm89HkNwpDShbarenVB/
         LCOAwbaluIIcx38/ll5K16JCP4S7SRGOL/abf4P4zbhIDDiEppEzsYA+O8gBnj9BBh+y
         IWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709838354; x=1710443154;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akMpdDedBfqF60/fNsk+O8npKk5JqF+ySZ0f9xW5/1M=;
        b=JaGQlAaevAVM/zzt2d7d9VKMe8QaGsMxjU0jdTZ2kMERUvTUKeu+NeSrG5d4wrfzTc
         fChi5Tj9B0O92kYlR3LbGAofZGxp+yxp0/7AQP9EaHQZ0RQzzzvocBauUGY1nAwQ6rZm
         aD7LnQs2NfHMd3qwjg3JO/83NzJ9d4D9Q3gzZ8JFmfyy5sNEz9KU1o9lp3pnefxgp0uB
         u6PRsbAh7vi8qPdtZU4Bj5/uPpl3qIj2P0dbZQAlNvGkhv+FrJKtGoruZB2bDwvE2SF4
         Y1767pdQFJEev57kVMlvIxSNdTFcuDov7Q8eB7xyRthzRCCh2FO3Fkfppaw6fn+eR87U
         0Vvw==
X-Gm-Message-State: AOJu0YxlFoZ3WNcAgAahPaX90qrzDBnL8qFpn0+AS6uO4fhbx/6vW8hn
	S6vNNXMN48PRbq4HqMb4n2T6eO4gig5FEI9UPO3izSYuQYSSyZkpOQbCFPrXL2g=
X-Google-Smtp-Source: AGHT+IGIkFO9XVaeP/1tKPmqCILvLsJZGaZz9P1TWEAdnDzXM5s2KMdvUPij6lw/K5WrTNkXwn1yVg==
X-Received: by 2002:a17:902:fa90:b0:1dc:c161:bce6 with SMTP id lc16-20020a170902fa9000b001dcc161bce6mr2666593plb.15.1709838354594;
        Thu, 07 Mar 2024 11:05:54 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id h3-20020a170902680300b001dd526af36csm1747338plk.295.2024.03.07.11.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 11:05:53 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 07 Mar 2024 11:05:45 -0800
Subject: [PATCH v8 1/4] riscv: lib: Introduce has_fast_unaligned_access()
MIME-Version: 1.0
Message-Id: <20240307-disable_misaligned_probe_config-v8-1-55d696cb398b@rivosinc.com>
References: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
In-Reply-To: <20240307-disable_misaligned_probe_config-v8-0-55d696cb398b@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, Charles Lohr <lohr85@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709838351; l=3428;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ejS3FVJ1L+bLL4KR96q6ZNDMwke6NlmAthP91enITHI=;
 b=QSgWXU48WzSbKsbVl21l4yUMXYbuR79AfVXchsjcwshH/vOtpegFqmabEpCqdScNEvHiGhn1R
 dUTNhTVGbssD6hYxGOAUgt/afIDbNbpK0lhR5laE9KWUauYvQHlnj1x
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_110555_910748_44C1AE04 
X-CRM114-Status: GOOD (  11.02  )
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

Create has_fast_unaligned_access to avoid needing to explicitly check
the fast_misaligned_access_speed_key static key.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/cpufeature.h | 11 ++++++++---
 arch/riscv/kernel/cpufeature.c      |  6 +++---
 arch/riscv/lib/csum.c               |  7 ++-----
 3 files changed, 13 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 5a626ed2c47a..466e1f591919 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright 2022-2023 Rivos, Inc
+ * Copyright 2022-2024 Rivos, Inc
  */
 
 #ifndef _ASM_CPUFEATURE_H
@@ -53,6 +53,13 @@ static inline bool check_unaligned_access_emulated(int cpu)
 static inline void unaligned_emulation_finish(void) {}
 #endif
 
+DECLARE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
+
+static __always_inline bool has_fast_unaligned_accesses(void)
+{
+	return static_branch_likely(&fast_unaligned_access_speed_key);
+}
+
 unsigned long riscv_get_elf_hwcap(void);
 
 struct riscv_isa_ext_data {
@@ -135,6 +142,4 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
-DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
-
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 89920f84d0a3..7878cddccc0d 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -810,14 +810,14 @@ static void check_unaligned_access_nonboot_cpu(void *param)
 		check_unaligned_access(pages[cpu]);
 }
 
-DEFINE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+DEFINE_STATIC_KEY_FALSE(fast_unaligned_access_speed_key);
 
 static void modify_unaligned_access_branches(cpumask_t *mask, int weight)
 {
 	if (cpumask_weight(mask) == weight)
-		static_branch_enable_cpuslocked(&fast_misaligned_access_speed_key);
+		static_branch_enable_cpuslocked(&fast_unaligned_access_speed_key);
 	else
-		static_branch_disable_cpuslocked(&fast_misaligned_access_speed_key);
+		static_branch_disable_cpuslocked(&fast_unaligned_access_speed_key);
 }
 
 static void set_unaligned_access_static_branches_except_cpu(int cpu)
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index af3df5274ccb..7178e0acfa22 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -3,7 +3,7 @@
  * Checksum library
  *
  * Influenced by arch/arm64/lib/csum.c
- * Copyright (C) 2023 Rivos Inc.
+ * Copyright (C) 2023-2024 Rivos Inc.
  */
 #include <linux/bitops.h>
 #include <linux/compiler.h>
@@ -318,10 +318,7 @@ unsigned int do_csum(const unsigned char *buff, int len)
 	 * branches. The largest chunk of overlap was delegated into the
 	 * do_csum_common function.
 	 */
-	if (static_branch_likely(&fast_misaligned_access_speed_key))
-		return do_csum_no_alignment(buff, len);
-
-	if (((unsigned long)buff & OFFSET_MASK) == 0)
+	if (has_fast_unaligned_accesses() || (((unsigned long)buff & OFFSET_MASK) == 0))
 		return do_csum_no_alignment(buff, len);
 
 	return do_csum_with_alignment(buff, len);

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
