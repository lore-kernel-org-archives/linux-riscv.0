Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708BCC3DA49
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 17:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UOR7dbmZsC81bAhsi5T6JBZ8BOLvgfv1/jgm2Nc7PUs=; b=Rv6+m4JpwJGDAZ
	tabV6Y5LahV+66hlR24fNw8uii0zosOYHd2qfnqgus3rJWaYSwS8H2zruxaGsQG3PPHeZU0mKUrHJ
	FS1bYtuyXuEe3RlT15LZAQO9COS4f7EsyA0B0yfm7lC9Z36IRunHEHfFdGejznBE/ktMEctSSe2is
	Cw08EhrLP5ADretpFS/Uhq7vsXzfmRviTqoAuQ81yvRSOl0o1Moqo0XSNYMbzX5B2sETLM7iCEVkW
	tRFH8tIBMjy0fTw02xP86ILlf9ix+Og8GUW58j1Sv2CJr3QsoU0PMKxzlOSfXDXQuE8z+Rgxi3GTp
	e/4tSiq+9ObkQdIW9tMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREod-00000008CJi-43Zd;
	Tue, 09 Jul 2024 17:39:47 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREoZ-00000008CFd-2hEn
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 17:39:45 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-79ef8e0c294so275829185a.1
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 10:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546782; x=1721151582; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oe7d24KWB8rzk++ulHp+tuuvOpse+BwjRMWl/Nf52L0=;
        b=Bqr8jzOf/3FNyu20oznxQbKA6lenwmzRs+9AX1+foXWZh7gy/3gLuMdII+oeN/39yx
         6DM/K8QSfMksVvoM8MTJDzgWjKj613gqJrRoKRsMpQFyRjZfhS0HxkkFIFxIXkf6QcSx
         p4caZYEIoSMoxGnKAzOcHKh2c0j89g0CnoXphLAZA4XmS7/P/fIgJQ/z+OctF5DxR3JH
         +LPtBfo2zXZFHbhPbR3LeGb2EG9TvliSiPZZVgCHTTMxwiO2cEVDeDU1Mno6/WhDM4Ea
         YftN/xGbymDtNtnHMEGs14eNuEMKEEts4VohDEJ20EqoozjXolO2zYg32CUdJuGYREhk
         +u1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546782; x=1721151582;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oe7d24KWB8rzk++ulHp+tuuvOpse+BwjRMWl/Nf52L0=;
        b=kgngaNpYg7fsTRRHgY0CBcvGnQ6DltVpdE1XtbepX7wOwKXayv7qEWNOOdddCjQxIz
         OrCGI/w6D73JAjkgfVIx44VvKehqDwuc/qnXJkcqb07ygOg/hPJ4JBSDU6DxZaliDLsH
         kakmj5l2AtTjLmbzrOl32n14usvSzNh2pi2x5lBZJveo59L42Ea2C75eljgPuxvjZnLX
         WVbk8SsluL59ZHlTAS0kRjQA6QiSmPd+YqTcTlM8VNeYeyItJkvQGbGlPW+9139/RXnF
         MRoTvwK+AFkVEThor/qCO0JjklVtwABPGTrStDrRV58QyZDy/wd7uGP6CSG3u2oU99nS
         9pqA==
X-Gm-Message-State: AOJu0YywrqLTGJUc2h+GngFG+reDiaz1pYl50LVVhHDmSxKGYPABAhS2
	6f9LDkEPMFlwGGXJU4ngLVyc6hgFmM1FN7DsJi7A7gMQzz7GhXk0wsaQuYO7Q28V5n5QxCMOtA/
	W
X-Google-Smtp-Source: AGHT+IGWO7bA4cK6KdAEt99qo/k1Gyg+6RZq4MQ67Cvy2nU3f5DYdGmozbUGc4IeTVAirQbmHO6UsQ==
X-Received: by 2002:ae9:e411:0:b0:79f:1bb:e7e6 with SMTP id af79cd13be357-79f1b5a9a89mr506394585a.18.1720546781921;
        Tue, 09 Jul 2024 10:39:41 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:41 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>
Subject: [PATCH v4 3/4] RISC-V: pi: Add kernel/pi/pi.h
Date: Tue,  9 Jul 2024 13:39:36 -0400
Message-ID: <20240709173937.510084-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709173937.510084-1-jesse@rivosinc.com>
References: <20240709173937.510084-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_103943_757673_8A9C4C25 
X-CRM114-Status: GOOD (  13.44  )
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

Add pi.h header for declarations of the kernel/pi prefixed functions
and any other related declarations.

Suggested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
V1 -> V2:
 - New patch
V2 -> V3:
 - Spelling
V3 -> V4:
 - No changes
---
 arch/riscv/kernel/pi/cmdline_early.c | 10 ++--------
 arch/riscv/kernel/pi/fdt_early.c     |  7 +------
 arch/riscv/kernel/pi/pi.h            | 17 +++++++++++++++++
 3 files changed, 20 insertions(+), 14 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/pi.h

diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
index f6d4dedffb84..fbcdc9e4e143 100644
--- a/arch/riscv/kernel/pi/cmdline_early.c
+++ b/arch/riscv/kernel/pi/cmdline_early.c
@@ -6,15 +6,9 @@
 #include <asm/pgtable.h>
 #include <asm/setup.h>
 
-static char early_cmdline[COMMAND_LINE_SIZE];
+#include "pi.h"
 
-/*
- * Declare the functions that are exported (but prefixed) here so that LLVM
- * does not complain it lacks the 'static' keyword (which, if added, makes
- * LLVM complain because the function is actually unused in this file).
- */
-u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
-bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
+static char early_cmdline[COMMAND_LINE_SIZE];
 
 static char *get_early_cmdline(uintptr_t dtb_pa)
 {
diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index 899610e042ab..40ee299702bf 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -3,12 +3,7 @@
 #include <linux/init.h>
 #include <linux/libfdt.h>
 
-/*
- * Declare the functions that are exported (but prefixed) here so that LLVM
- * does not complain it lacks the 'static' keyword (which, if added, makes
- * LLVM complain because the function is actually unused in this file).
- */
-u64 get_kaslr_seed(uintptr_t dtb_pa);
+#include "pi.h"
 
 u64 get_kaslr_seed(uintptr_t dtb_pa)
 {
diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
new file mode 100644
index 000000000000..493c8cb7c0e6
--- /dev/null
+++ b/arch/riscv/kernel/pi/pi.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _RISCV_PI_H_
+#define _RISCV_PI_H_
+
+#include <linux/types.h>
+
+/*
+ * The following functions are exported (but prefixed). Declare them here so
+ * that LLVM does not complain it lacks the 'static' keyword (which, if
+ * added, makes LLVM complain because the function is unused).
+ */
+
+u64 get_kaslr_seed(uintptr_t dtb_pa);
+bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
+u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
+
+#endif /* _RISCV_PI_H_ */
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
