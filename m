Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BDEBC2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 18:52:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWve7wVeIwYfqeI5nHOyI3371Pgo1Rlz5maVkm47yCU=; b=gjd2gRAQUl4g1c
	Yx1oYtrrr3k0FV8swFeabHuOxUFFLQLYIfOUjTiLWdRSzM9kLJGFnQsJWmquS2KbrCaPvOWb9vq0w
	nME0Mzd76ETK/r+TauFUSl7MSN4GN1WsTnNc+SCB0cnHV6KFk/zBQd6GbmNDQaE+44eC1Kv4Lg7LE
	u/TA46bSNrdO7vqbwbtJVPkD7nr0znC42McdgsZIbIvEEQ5sKhBDQeeGROgO30iQOMUjUTnuDu0zM
	FhnSMPBllkdrhwmdrIzniqK8JAlvbe5pN8k81JJLznVTHapGCtEYscTnYFd6I1ZcQ+721YKHhVl/7
	3LqoX+n4/u1WFktz9t0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM8W-00000004Wix-0PkZ;
	Mon, 01 Jul 2024 18:52:24 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOM8S-00000004WhA-2jIn
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 18:52:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1f9cd92b146so21871135ad.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 11:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719859939; x=1720464739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=itcRXPPZh8Q3BXWaLokMC5j6eLfJ7AJxltwXOVqlQWc=;
        b=uDCtjvGfBiYsn47kko6MbJNhyK/Gibnf4E2U/Vjdyov+wJXON/F41w308STK+ZsSd8
         gug2NrAxE7YoH26vAjEtjzoG8subox77VMICBiqUNeHxnbH2V1K5xmo4lRkXE1FZb1a9
         6XKD+77XSKHC+bTGn0FWRccNnu6U1u0bZvDibOjMFIOce1gmrX8/VjB55qvNnTd5neyk
         H1EG2lnMVgH6AOH/m1ZpxJlqLQYu76EGERRyi/Y/Lt+kSoZOZcMMs+oiZ177y2xMP37X
         ksqBDwHxNcy9+xQb/VWhOqSrR45j0OVFnP9JhgvThBOtdYPqs6LspzO9f/gKioZSZzBC
         XbHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719859939; x=1720464739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=itcRXPPZh8Q3BXWaLokMC5j6eLfJ7AJxltwXOVqlQWc=;
        b=AqRprI26qPrrTf5/xr+oZjVobRRKsj+QqPRv++5CTG/r4SeouAtL8us8soZaWMuQ0h
         fuIXpO8Dlk70SV1fTnr7X7Vz1MVTwxMOzjfmua65Y4lnDO4Gs3e0qBPXA/tU4U1R2U4x
         xAJIXxSIvDYhqJfvvNswdNqkGzSR1kFNmgLYqYNm+4vZZSts5uZr50/i/TdzN8rnHPqe
         DcvYgIACWarf2+QF/wLqinXtphfx4ReRPvu/hplBGwNKe2iUdgvHpdP13+UBiR+IWztg
         zqJHeNkHwCkORnbImBKZ593fDJwexSudcRuCUq7UnxF0TSsm1wQQo6IQgFXLI0fAX676
         JtCA==
X-Gm-Message-State: AOJu0YxmTnfwe+cP3ZIeCPGfSCnfVfhSSbCx+IEycaHNSGi+nWWbnF2Q
	RXKqpIreqjQZIt9eUH9oeZemhiIfwVj/HP4eZX368iudd7MgzuQ4QC7kWKL7ex0dNxjIK8fHxOa
	f
X-Google-Smtp-Source: AGHT+IGIUJjGzCtP0TFRY0kOYr6wkwolnJ7bp8Bd4PCKOWhg54h7MqyOQeiMmVlGODF0WvjecY3/hQ==
X-Received: by 2002:a17:903:32d2:b0:1f6:fe0d:ad47 with SMTP id d9443c01a7336-1fadbd08cbbmr59034325ad.62.1719859939141;
        Mon, 01 Jul 2024 11:52:19 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fac10d1ccesm69883375ad.20.2024.07.01.11.52.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jul 2024 11:52:18 -0700 (PDT)
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
Subject: [PATCH v3 3/4] RISC-V: pi: Add kernel/pi/pi.h
Date: Mon,  1 Jul 2024 14:51:31 -0400
Message-ID: <20240701185132.319995-4-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240701185132.319995-1-jesse@rivosinc.com>
References: <20240701185132.319995-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_115220_714893_A4E30027 
X-CRM114-Status: GOOD (  13.46  )
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
