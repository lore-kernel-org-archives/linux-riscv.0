Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE2AC5475B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Mar 2024 20:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS4Urjzi14qCLKNvYN0CpxI9AnF7bn3kt6oDRTAIQzI=; b=0g3RR1qOrH91z5
	3zifMxG9e3zZeugun09w23p/lJOGCcIC8V1bwiuE3lpGlQV3JkzVJvpkLIZDuoVtRNrsIXQMgyC8J
	xX/jdCCvTe6KYnE0jWJX75Y7dJkSFQH2ViETU6YS6auvSxPHWmhvs6V8Vz4twSEfPp2cb/NPy9E38
	Ev0M/KVri0JWIWaX3DArqc8qUMXOAcI+gSZ8SfXvQRb/8lB7pkFDJrtoUsyleHj6uzuUtAMXhBUph
	iJXMlY9vcWdwY9scVyPmt14wWyB6KyS58XARJIOFtxdLOAk0i8DQaBRFN9R2W6ZbpQoVq2RO4JZhb
	5VXJM9qIH9AX1LxrsWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxVD-00000001jrC-3Dci;
	Wed, 06 Mar 2024 20:04:35 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhxVA-00000001jnr-2TrQ
	for linux-riscv@lists.infradead.org;
	Wed, 06 Mar 2024 20:04:34 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1dd0d46ecc3so1003915ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 06 Mar 2024 12:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709755470; x=1710360270; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EVtHtZkQ3gl1JI+EwyEBrvg+iHnnWLYEsQB5N3MR4A=;
        b=ARKEILe4dFVYp/HSXiJqdoBQYHB5DEnE0UzntuiQYIVfCOqUeJwRcKnzLysOvJoOM2
         s8yYI5bvWRx2r6ZQimk5Fvshms87tVeRqIaImGhF7FdpCRH3yps2LsPhbAfPvbwTdnSK
         JSJ/HoFZXC4DkmcCP1gLML3Xfhvk1KxdkODMwJ4DmJsojjx3Dgr5S44P2LvHRGzy4jlI
         eYVXenigX+ONrEMcg/ODFzFYOa+TMiSwoqEiKur+oCJL9EZQMIWo7vtMh6d+QG41xQAU
         fiCR5v1JfCT7Tb8FIjGWvG9KaVtnwQcgZO/1BG9XalFEZlunECtohcl6xXvIIjnseUsN
         /vsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709755470; x=1710360270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EVtHtZkQ3gl1JI+EwyEBrvg+iHnnWLYEsQB5N3MR4A=;
        b=ICOay2MdFQ2QBnSmbvkqy0FZXoixwPoz5qm/jSJ486Y8havRYFzevrk6Za/T/6yGP0
         xd00/Y3PejcdqE1oE5J7J96InJonDDyQSp7Udb9nIcussq3FVekf0/i7ihP21BY6klNl
         nl7ZrrqK0NnBPeNlnlW8I6P2EFdVxFxOh4uQpEc8G+3/by5WD7SB1LoxEh8wqqiHD/Hn
         F1IpGc+dsI1kdU28foeC0YRAsKIcOIpMaORctpCip9vbHq1+SujSZUOQ0BHUqMBfA7MX
         7yuDoXH3gFYdlriOgWSCjswppoYhTSiEOnki5xx3pouKTQQlolyCDvLJQegC5x+qoM0A
         srHw==
X-Gm-Message-State: AOJu0YzsqQPz3NSIi0qwYMZmhfpeGquqiFM9Qyn2iyDx0c99ScRaKUZ2
	O+TyySzVYSGzwnxRiPW8C71BNLbDfkvdIUbwNF2lpdEvg4FJ47oIZYdU75t4/H4=
X-Google-Smtp-Source: AGHT+IH7qCYemZ9Fv29kGH+ngcAW1wIPaHrs6Rzhtk+olBLCSYpKDmZzT/TWRu2OtakOAUqT9RbrtQ==
X-Received: by 2002:a17:902:e892:b0:1dc:744f:5317 with SMTP id w18-20020a170902e89200b001dc744f5317mr7603710plg.50.1709755470277;
        Wed, 06 Mar 2024 12:04:30 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id m10-20020a170902db0a00b001dd42bbb08asm874913plx.253.2024.03.06.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 12:04:29 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 06 Mar 2024 12:00:01 -0800
Subject: [PATCH v7 1/4] riscv: lib: Introduce has_fast_unaligned_access
 function
MIME-Version: 1.0
Message-Id: <20240306-disable_misaligned_probe_config-v7-1-6c90419e7a96@rivosinc.com>
References: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
In-Reply-To: <20240306-disable_misaligned_probe_config-v7-0-6c90419e7a96@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709755467; l=3372;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FzR0GpkIwoZRYWxFyEryVlUwRX7agq76vtFdOU7VZ+M=;
 b=j5FrAhWN5NKWo/uoDCnKRVwC+pEcmVZD3Ik3AEgIdvZs2qy2QlaslIBnPi0QfAYB7of1L9SiA
 U1GUl1BflS1CjE+0hvYkkMgQbTVzvSCa3r0QvML215SYBVyiy3Wja5q
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240306_120432_759884_A836C221 
X-CRM114-Status: GOOD (  10.60  )
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
