Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 404E0C5478C
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Feb 2024 23:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iS4Urjzi14qCLKNvYN0CpxI9AnF7bn3kt6oDRTAIQzI=; b=mRAT/DJqWyj/MD
	g0N2MqHX+FagBvBWbwOoGI1yyjBT4lYI4qTqxZk93KCY41kwETJODt7nqz37tyegKZRNe7ocsSAbx
	ufvpeWQ4LWDqPNWgfY8XlowJruuW2e0Jqm6ABZS5Z6qLOBOlgn7y9lYaUgSBn3ogNt05ar8J/gcrX
	wiktec9Wd4Ly3oxC8TIh2lrnMJB3mbUqhvpkNlYCMQlwmkvISpKKY+sZsV+Ke1uB1MudOD6rO52dN
	QctepOG/nKtvXDqEBZa4h6b6hk3fRJmacGAbdGXmdOs3lheLT62Q7JZqP7jccXFrVRpLNsA6BfaGz
	pyX6wx4j2kRmzpGzXpLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf6ev-00000007CVu-2fd3;
	Tue, 27 Feb 2024 23:14:49 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rf6et-00000007CTf-06Wx
	for linux-riscv@lists.infradead.org;
	Tue, 27 Feb 2024 23:14:48 +0000
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3c1a2f7e302so1252088b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Feb 2024 15:14:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1709075684; x=1709680484; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3EVtHtZkQ3gl1JI+EwyEBrvg+iHnnWLYEsQB5N3MR4A=;
        b=hyrBbrhiSs9Ve18scjbzBAxu6UKfZQshK7YuDyY7I0Wn31Pj6bCWjy0BEjHgb9343i
         c8PJU0b6prY7n53RzMCX5c0YuFV0mh0p7JPHwU5xDA38DIB5pHP6IuXUxktjtoMfV4sl
         ExBKWOr0k9Xd8mkbFYufb7drk6tNTQBR+RUEVAAfYXZe4WQMZIkT5fKxcsEZkjT41nxH
         XXsysVZOOa1qCXFwY7IJZoyLZtf7RaOJtRG9a3WXCDHwaGezu3iIga5ZlNXf6nVGWU6r
         +/OxPaRxBr0JxuWw//sojfL/qPSzI/OYWzh1qK6E2F7/f+/x6CKqvy5WdNpptQM8LXk2
         G/Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709075684; x=1709680484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3EVtHtZkQ3gl1JI+EwyEBrvg+iHnnWLYEsQB5N3MR4A=;
        b=LZ5ZBGUOQ+4RQaEHWmXVj3/XU+mbEn4OfnIC9nIJxa1mP0fBo+1F6Fyf6IKGJU4XZ1
         eRrHyFtPePJdU4PNxgeVP4dHR9TloNxPAKy05iTPizI4ANMPP0CIiWjq9AxAZjqEpt6z
         AThxDcfil1N3E57MqQcXAAFsVFUE5DxpOqQhMeIWisYKpAX+ITOvLtGpI4YbBrpPS1z+
         Ktg8uV8OarsQo+w2lK2REoIK8FzJwkHCf9LMC/tWkVKZtfGKA3S2+zS8ZyJUceU8j1hA
         yEKvFbMo8mtCh5tQKlI43HIUNuDYmbzqzEEoEbdKwA8wD02FDkxOL+tJXwcMsFyk+/3h
         /0yQ==
X-Gm-Message-State: AOJu0Ywl60ZZOas15LIguI4LSQen+zklmWUYHb1VrJUsEK64kOz6lZ7p
	XfjaC/6GBFOkxnYJkmt7/HdcZZ2UNq4gVsBDCtbG+/0Bx2eXLo41tgdekhB8vYE=
X-Google-Smtp-Source: AGHT+IEauNl6WIPyiM20fdRy7YKnnW9sZ9a46d4rbs0aUU30IGxqJuZ//IpFXEdYF60LR7VnmeBLsQ==
X-Received: by 2002:a05:6808:13c9:b0:3c1:7c22:c62c with SMTP id d9-20020a05680813c900b003c17c22c62cmr4524328oiw.40.1709075684262;
        Tue, 27 Feb 2024 15:14:44 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id l9-20020a635709000000b005ce998b9391sm5455645pgb.67.2024.02.27.15.14.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 15:14:43 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Tue, 27 Feb 2024 15:13:13 -0800
Subject: [PATCH v5 1/2] riscv: lib: Introduce has_fast_unaligned_access
 function
MIME-Version: 1.0
Message-Id: <20240227-disable_misaligned_probe_config-v5-1-b6853846e27a@rivosinc.com>
References: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
In-Reply-To: <20240227-disable_misaligned_probe_config-v5-0-b6853846e27a@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1709075681; l=3372;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=FzR0GpkIwoZRYWxFyEryVlUwRX7agq76vtFdOU7VZ+M=;
 b=5y5R/N2D/Izd61qDhY+QzsoZDbkw4sD+B7NwvE2jC4w/xh3hOu1ij8PyYt+mXFR/AYxl45x0n
 pT8slOgGASxDYjzi7bPNXDa+gv/FdP5MbL/e/2C3zZR8eBhTPoT66Fi
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240227_151447_135293_91A24B28 
X-CRM114-Status: GOOD (  11.21  )
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
