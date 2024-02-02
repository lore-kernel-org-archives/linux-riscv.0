Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3DBC48295
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 23:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSj2vmJ4O8ser7SQzMTljNHvWGoLhpURCDBrvbdkb3I=; b=PMxXogdeEC6Z9s
	koijrcKB8bIoz17EE2qRMVEfOMFJBAgcB7pgJG3naIyGezGF7R1K3bf3aqbdEdAuduNo1R1Yz6YiU
	IKWj4bcqixhhCCvKW5RBxoJ8qeqLxineRLZRXAeiYbcMIZfOmPoC9c1i1QJgpdrc3bDKlZ/4NF509
	QyYYVA4TgZJbrCYh2BkChbOesW79bZD0rVSHAU0zQ2yU9NtLmGiBewg+ys+5Fn/EfQxbI8WwvGcS+
	yVzbLEzTWJK8zar5uW3LpcL11YlSG3rvYOPLgnRfVETzHjjdj4EIi3nNlimOdcC4SNf+2aA4LeXud
	YZfNILN/GPUiU9DpRE+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3N5-0000000Dqiy-1iBQ;
	Fri, 02 Feb 2024 23:54:59 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rW3N3-0000000Dqhz-0sFz
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 23:54:58 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d73066880eso22960725ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 15:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706918096; x=1707522896; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/1MLhuldF93A/E3O+pm9/YZf3cQu2JpI7YOHHh8M+ks=;
        b=J515LTgzgkAi5a1JuinQ4Nx9MoUEkn8d688r3+DNjb/Aq1oBl2N4hthZMfKj0kDwk7
         ezp+Cx0yYVUVuzXSOjJ2ywDXNFrfeu9yy6IBbu8Al09WUt0Lj7AhqbJBFpVLVvKF9gS3
         jc/95Lq0S38W+Ig8lJV075O0tQuwkuAvoG2fI2f0Pgrq1bH/5Wgl+D+aU0KEUPhNaAw8
         CZAs9FPKj5nKdJkvPlg1/TWhUV843mMsWgkZjNZ766hGLTRdN16Fr5Xd/7r7vh86ZQSf
         sm5EbJmMcKfs6T7dgyAxNgj9WzrkG/hclionT+50iVapJ5tOtoBzv0K6IxtPlngsovyc
         uDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706918096; x=1707522896;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/1MLhuldF93A/E3O+pm9/YZf3cQu2JpI7YOHHh8M+ks=;
        b=cbqK8aTWwlJJyEEA3N3aXqBS/gGi+vL2pSVUemWgifhVXIRh1vi8svae/PGTN3C6pg
         GGMtXK+Oj3DfF2wufVZ4S3YIawErLE2jxAJMqU7x9xM6ySLnx2P11NRJhexxcoDwnFr7
         dqlsDVBApNLwFR9D9WT8MXNPAjq9+4RGrrkLbN5X+eEzMx7wOkFB/RvnnAn6kxZCzawT
         KOUOz2fug+TQ1tL/5ZXWdVe2mIGDuJ0ip+CdEUj6hAaCPof8B76SsOar/lemP79vHsgI
         DrZ6zBBfbYQlmqIO5k7bxOB6FfgVTmqbet0nOjQuks+maLc2gVq2J6Vpr2Oj/NN/q1p9
         d93Q==
X-Gm-Message-State: AOJu0YzwmAKRN21uJtTyBXg2YSzNpiIuSqbNoMd0vUTo6kz6ysdmqCV/
	7hqDBOuatHzv6DUHIb3U+X2rQly/1LVOKvPqR9B1qDVpcEVElRxJqs5hGqe/wfc=
X-Google-Smtp-Source: AGHT+IEnHLkO32tQeIV/kkhU7yOafMeSu3lnsvbu9pYPIhhxQaTmXNS59xOikEhxTC0ZiRXCzzI1og==
X-Received: by 2002:a17:902:bb16:b0:1d9:7a79:c35a with SMTP id im22-20020a170902bb1600b001d97a79c35amr2200249plb.35.1706918096176;
        Fri, 02 Feb 2024 15:54:56 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWXRw1NDqFZj5R1OPn+mE5bcPhpsNgwjgE6bHW7KDP+lpfxY9uwZ4X1PpKnXjgcutHPAW7/V1cbJjc8baznAl/8B5GMjAFx78zCbu1+x+kc7EOesSZDlXdUdw0zg/dpcLGW3uoo9aBggOPILURQ9FvHsV1SlFPua43+txomnVGl//dA7WIBVJYygdJs8b7fiC8cja1KCesna0Tr1Qniy59mGsBEHpQKX+xSKF34KGwnh2xvS2i3ccBDMJAFy4fpBp7CN+Ra4lDi6lnpZmrZTwB7JtVeMn2VNWadSkTAsvhVRwih2bjoMLGubk/cm1egLYvutCT30w+qSQ==
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id u1-20020a17090282c100b001d8f81ece98sm2133607plz.104.2024.02.02.15.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Feb 2024 15:54:55 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 02 Feb 2024 15:54:52 -0800
Subject: [PATCH v3 1/2] riscv: lib: Introduce has_fast_misaligned_access
 function
MIME-Version: 1.0
Message-Id: <20240202-disable_misaligned_probe_config-v3-1-c44f91f03bb6@rivosinc.com>
References: <20240202-disable_misaligned_probe_config-v3-0-c44f91f03bb6@rivosinc.com>
In-Reply-To: <20240202-disable_misaligned_probe_config-v3-0-c44f91f03bb6@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Eric Biggers <ebiggers@kernel.org>, 
 Elliot Berman <quic_eberman@quicinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706918093; l=2638;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=EJLAQjoAaveZcHBafYijrvolB9ZWj2bzuPRUhvoIegQ=;
 b=PLwP0vQ99Z+7IGjRrd6DwcVhXXGqxnXdGfaaYbpjQXIm11Du3c0rwMO/IAoNkGCtIJCgwhfGo
 14cUsMbyb7LBWToiVkJFcuLp7tEVlDeIh2FEd6BBfXainkYwSh+K4RA
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_155457_287498_34EDE77D 
X-CRM114-Status: GOOD (  10.77  )
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

Create has_fast_misaligned_access to avoid needing to explicitly check
the fast_misaligned_access_speed_key static key.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 15 ++++++++++-----
 arch/riscv/lib/csum.c               |  7 ++-----
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 5a626ed2c47a..eb3ac304fc42 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright 2022-2023 Rivos, Inc
+ * Copyright 2022-2024 Rivos, Inc
  */
 
 #ifndef _ASM_CPUFEATURE_H
@@ -28,8 +28,6 @@ struct riscv_isainfo {
 
 DECLARE_PER_CPU(struct riscv_cpuinfo, riscv_cpuinfo);
 
-DECLARE_PER_CPU(long, misaligned_access_speed);
-
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
@@ -53,6 +51,15 @@ static inline bool check_unaligned_access_emulated(int cpu)
 static inline void unaligned_emulation_finish(void) {}
 #endif
 
+DECLARE_PER_CPU(long, misaligned_access_speed);
+
+DECLARE_STATIC_KEY_FALSE(fast_misaligned_access_speed_key);
+
+static __always_inline bool has_fast_misaligned_accesses(void)
+{
+	return static_branch_likely(&fast_misaligned_access_speed_key);
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
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index af3df5274ccb..47392a83239d 100644
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
+	if (has_fast_misaligned_accesses() || (((unsigned long)buff & OFFSET_MASK) == 0))
 		return do_csum_no_alignment(buff, len);
 
 	return do_csum_with_alignment(buff, len);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
