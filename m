Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86745C54E5C
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Mar 2024 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w70xITaCma6OVdx6baqnQZBFD6T+MhCXDBEIGWSLu/c=; b=2ufVTDXQJwCxEu
	BUrIlPvcg1Eer0igPtWk3oWD79U/RxsLaNQABiYBnmFKcaqv0fpkSk1LXJzMfgewGw3sqgc8iYXMU
	aF+CbYYBbWdNLDk2zKQ2fAqJe3U2pmPxuL708kTiOpSWk++m3ag1HPEWHN5jPBFt3UUC2oSHpDZLN
	DGzf4M4ICO1WtzMGqOTG9Zzk5FzB3MlmHO+mWKvt+tayWhmZnyHJ5eXgjIl2I0pGviB+ha2eVQ8me
	TU2zU/y8M5qEtP5DryOad6y57v5a2S18DcSiCX/GGbU6KZQ1LT6z77YpeHMuKw5JukxZUBH3pnXGW
	z0HsDS/kuyZYnc0h/CKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riev6-0000000AmqA-2WBK;
	Fri, 08 Mar 2024 18:26:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rieuy-0000000Amlj-3WLT
	for linux-riscv@lists.infradead.org;
	Fri, 08 Mar 2024 18:26:09 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-29aa91e173dso1662481a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Mar 2024 10:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709922361; x=1710527161; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=akMpdDedBfqF60/fNsk+O8npKk5JqF+ySZ0f9xW5/1M=;
        b=MJM3tK5F8kb8InIgXO+9k4+84xYztDRfzjAq04mUU7/eZYQDoXWlvFy3WWeoYBx9st
         4bO3Gkn9B5rlpmRZLDoZBHaNySR5FPD5OAnG4d6VNbgPI3tiB7t/DOO+x3YuntTAlYmz
         vBT6Uj+T4VM4spz7xDOLJYOoSW94tmWloi3x/bnQOfqx+y8eTHFQCq9YuztfbFweBJD6
         8iKEvouHMP//Zm/bpR0TYwLYsiWO3XPrtLLTlaeTczXVjSy1lOiDTyQTc3KH2j/BZFcg
         uDbJ2WSYzWSjPGsFZ1jJlB0IvD4lo0TM87WSXMJHBW5jKcqapeWfFuilNOM3qJ+Z5Ea2
         SylQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709922361; x=1710527161;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=akMpdDedBfqF60/fNsk+O8npKk5JqF+ySZ0f9xW5/1M=;
        b=blIwZkYsGNN2ayctrD01H5mcRwfqXCLm9REQ3QE8fTbPqkD9+Kv6u+s/lzrPaW2SB0
         HlqGEi0/JnDDJwYKPyLcdUwi3wYYRSNfAlDj5c3Ree71OsOi3QEyp3xjGS6vC4oacSkd
         htTPsvJdCbD7thi4hB6YYgqdLWQWSGkyP/LL6bPEg00GxWFJiS4T3AdLzOPYQaZCtgik
         0IIL9k35toxHgVjNocLaxGUj7OhCGyqysIPW13GBz01LDrvQOFkd1NbVHHN2eVwWCUM6
         stfoZ8FNEa+hntCowIVj2KksmyeAarBhHMLeSMepO2K/P98vQveOvBDGBl+QVdmQCAws
         XphQ==
X-Gm-Message-State: AOJu0YzmenbWROJhW+DTJy3topnOE2EZcnzMmfPpAXX669Isv34dhb9h
	f3L/6ng8QIeCKTxyH/Bwcc5IXEkhcTLZfzMS4ts1Wod3R3Jh7/ofM1EaFecgNemYB6SbwNlwBmo
	9
X-Google-Smtp-Source: AGHT+IHedflOqFeHEwgfr854USwwC55wJSFS3hsQJ1T3yn5ygm4BiYm2PUImp7bGuhG8F7kabsskTg==
X-Received: by 2002:a17:90b:216:b0:29b:c179:9ba with SMTP id fy22-20020a17090b021600b0029bc17909bamr730495pjb.47.1709922361463;
        Fri, 08 Mar 2024 10:26:01 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e13-20020a17090ac20d00b0029bb1bb298dsm44821pjt.35.2024.03.08.10.26.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Mar 2024 10:26:00 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 08 Mar 2024 10:25:55 -0800
Subject: [PATCH v9 1/4] riscv: lib: Introduce has_fast_unaligned_access()
MIME-Version: 1.0
Message-Id: <20240308-disable_misaligned_probe_config-v9-1-a388770ba0ce@rivosinc.com>
References: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
In-Reply-To: <20240308-disable_misaligned_probe_config-v9-0-a388770ba0ce@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709922358; l=3428;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ejS3FVJ1L+bLL4KR96q6ZNDMwke6NlmAthP91enITHI=;
 b=SJMPynNndVY7EsAyEorrdTi5vigiwbschT4Hh2s6NWRzNuKQv7kmdQH1jlqRP0WwxvdIrlvD5
 dLhky32sTVtCvLuntQiohAff3ZBkbKDJ0Ms+9YYieJh871kgkrrcG6J
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_102604_889519_BF306C0B 
X-CRM114-Status: GOOD (  10.78  )
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
