Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEC1FC4828D
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 23:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6S6ZvmisExDYLxzizQPbzywehGjF3nK68oqSThubhMA=; b=G+Lt45exGoBSKu
	974yfHCWmJNrxi1ZfDTOw74OCkSzyv1OmCHW/3obQ9OMWRrPgOm3fr8hpjvtttweFam2mPCH3t/B3
	UgzkyQqzRbKGbt/X+U5KHiwIuezOyQTglGzEeDR+LqrjzkN8ZxOKTip3Ntbj3OE+I61LjW7YpQq5C
	ccIVc6nxkPJu6U7WC9kh0T9dgOU982ioQcFzE6/dzKtVB/l8j+HE5BgU5g7VGuYHmTGtsaJv2HFsY
	CJkPecKNb38yY6JaYawTFB/d2XVee/0JpueUxWJiOP0GJ/wJmTFwMuzqCQZcw2NJXhXmhNSBwsypM
	yKbFiaRd3+z45EA8H3Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgWE-00000009el4-0uvK;
	Thu, 01 Feb 2024 23:30:54 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVgWB-00000009ejq-1M5b
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 23:30:52 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso1328735a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 15:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1706830250; x=1707435050; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fYLbS2tqTt3y9/rBcMPJwW0rTrdOJiUg4wOkRn5dCzg=;
        b=RqEheocPrlnGpWSGNbtmBqqLMbFr2OZrZbOGfkH9EMvrwS5pDBKAGjO8T4HZgLFGYc
         NMCC6S8g9CAjV312SX0eP3OlVOy4rtifNlZzQQA1FOC/ITZH86Tzp1ASjhDBuwyuF8MB
         mXpc7sOPYXT2O4MycIRz/0G7l7tI87rdSKcdnp+9fSdWw9opkf0LxzBH4ZOfKnBb6Mbf
         Co8p+whfbjVpNZeM/rOsJqzscHgVGHO7tXlDQd3Cacoy96qlW9EVCSxwkuT7oF6l+ZUv
         1x9TqtB13nlAg3/IoYabOZQUUH7D1rkm557uuGQqfRQC/ggk5RqpsnHAw92sZ7/7yg0A
         Klow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706830250; x=1707435050;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYLbS2tqTt3y9/rBcMPJwW0rTrdOJiUg4wOkRn5dCzg=;
        b=w4t0kuJiOFrLzEdIFRpQMmqckIvuOSx9NDtfNO6+QdhAgVqOBlkU8MtqhgHkqo4tQV
         V8oOaheFyMKF+6j4WeE4sZicvkJUx9PJCjMsvHj0dg1HXQBc7NPxIhQb8NlTNVlNTvJQ
         G0vJ8A2Llpq2N2VljmZ9vs1NZABRsTQ4jmWvVL6n8RGbF4ZaGNwFqEnODkfKnSdw1Em1
         33lh6ZCMaKHOLveMuOFaPnnEjBgloeH7x/o6a7eFU90hWN2Ow+0I9C8dv6eJpFMlcUR5
         ruyoOyUk+GKVM/is8PxttNvEK8pmY+ERx/hgvHDfkwVlqtSwpt/Gqi2wXHwe9crdsAzO
         baOw==
X-Gm-Message-State: AOJu0Yyh2oJOdrVqOqo7n1saAioyhr9d7LJ8v4HEyotdsua+if+ssWAp
	Zh42patA7gz9G82xvJt1Dy+HAOWkA1cOznvWPfERkbbkkuDnL5LVBWSI9xtYfaA=
X-Google-Smtp-Source: AGHT+IGU4e20A5H2cqtnSW5mhi4F21ib+OdbT2cjHxXIHr/pgI38p1vAdWCnwydtDJykjCQae1bXQw==
X-Received: by 2002:a05:6a21:2d85:b0:19c:aaee:bb1b with SMTP id ty5-20020a056a212d8500b0019caaeebb1bmr408931pzb.7.1706830250291;
        Thu, 01 Feb 2024 15:30:50 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXrPr/NLHFlskYHFmrbSw5TuH6tCYPXpCSodI+pn8DDMHKntmqGmwobMaJHB3HBnS1uinXFAsm+UAR/4MPIfLy1RQvNE/bc/7xCEEGlZS2roZbAi5uQV5FOoL/qn70gYI8hiYahxwrkl4a3JdlBHYCy5pmE2hKI1qHu8NnX7Zkkxf/wqcmFgOn1CFl/+5QtLNdLjwKHkkK1tc+Ufr1uYwXq0n5w0rDuTI/Aj8FufxJyiesr+sXXvzHIk6EJbDhB5M/RAj+5Z++L6DA=
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id y9-20020a62ce09000000b006db85b12036sm309673pfg.137.2024.02.01.15.30.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 15:30:49 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 01 Feb 2024 15:30:45 -0800
Subject: [PATCH v2 1/2] riscv: lib: Introduce has_fast_misaligned_access
 function
MIME-Version: 1.0
Message-Id: <20240201-disable_misaligned_probe_config-v2-1-77c368bed7b2@rivosinc.com>
References: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
In-Reply-To: <20240201-disable_misaligned_probe_config-v2-0-77c368bed7b2@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1706830247; l=2642;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=1uo2wJRuP0cOhYLucx9knuEwY0at2TKxxPAsRqVzTVs=;
 b=/GVxyTwgomTdVjJfsMJQL8duFxtcbDwkmrjXW1K7NOOEbw5flZcVOyyyihOjT+qWhBpAkICnz
 xZBD89qWs/GDbbwP0FmWHPjS3OI9TrlMHKE1LeJuIigzSiOkn/sZGcL
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_153051_395631_DE266275 
X-CRM114-Status: GOOD (  10.67  )
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
index af3df5274ccb..ea2f668fab71 100644
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
+	if (has_fast_misaligned_accesses() || (((unsigned long)buff & OFFSET_MASK) == 0b101))
 		return do_csum_no_alignment(buff, len);
 
 	return do_csum_with_alignment(buff, len);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
