Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F66C3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 17:17:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j3KAu5yuCH6TYgvyZu9l1KYxhUrjlYqVCCn3czikbL0=; b=GHceb/UXW1QAIL
	xOIoJQrBU86+eDaZQu2EdG47yORzDtIVYxe04Ibld4bE8l8a3NerFcdJNpQBdezoDakFxv2bX+ScH
	Ka256SMSS368eQaWyXZKrpg5jx6NTbLkmD6Ch0QfvqDAbYvsmswgcwMS389wdmLF/V6z7O9fQsBfH
	i0ZWvLzEh00xnmKYSeoIR+T50LASmvv0HoKs9nH0sBkiDUuark3M0aSe6+Y/lN20VYkbA2Yj4o/ba
	K0ziCoTUb9SCLSF6isTtlpTdVYLOj0hYXleY+AHbjGypyNT6SZv0tOXyW4CgIy37t4tOkIn5JkGCA
	gheuLeeSkIzFeMmapjEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWGo-00000007jMk-10ut;
	Wed, 26 Jun 2024 17:17:22 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWGl-00000007jLA-3220
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 17:17:21 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-681bc7f50d0so671719a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719422239; x=1720027039; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2+lAD5jtfoEc4FrM9h7co7KfTqJwWQk8uXEwNnDDNnA=;
        b=cd6lpDYh9z026hTum4tdF9OIah+0OxNe4kHhBN4h2LdlHQiwMc1MCZkLA4bYjA5rnR
         3xjmJYRyhVPFDizowGSgIdL7RSq2f7xwLjf3ykDln65iCer/mePQoHT+nunRKvc84pdX
         K6RbVCAlBH7kjh1osjKQ1DSSTuwnSRiOMCkCg2lGuINmYCFHRpCmlyVu+/UmN2XbqjQh
         b+BZPWwlRaeVJCc2dpaCUd3C3QgfSWRFaJ3x3VXNOK89ivdiJu2tceEI5kQxGEbbBEPt
         AymxqyUJ6eP3wamIQDIRfW/fzhi2PSHz06+m4Ny7MGJbzz0PvShhSx2WKrkQBcXECWsl
         kTMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422239; x=1720027039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2+lAD5jtfoEc4FrM9h7co7KfTqJwWQk8uXEwNnDDNnA=;
        b=suU+G84RA/OqbgP3MKFPxMEl3+XGLJX5KnxeBF34eYEOUEuecCQWdo2omfA6y1q46C
         ixiUDUXpALF7ohi4Q6J6hsaXyu46rJ+9oA8GatyBvylFkWYo0mqoWLttqeUA3TBoxEyg
         YEbiYpimJ54hgexqxmFr41PasVoCaG7qiHF6hrsdcZJIaRmcaoVDgm8QfED+nUE9uPgw
         MT3rHDlNZDprkcPu6Hv92igyn2DlT5LrvwOiKFzqiG/Yir1UIjuwbaolKGG1hGedi5lw
         02Aaua21YBKE4weX1ZO1+qCgsgxDEY8s1thn5IwqQSAJxQ+7RWsXE5ZvnQ0ciVYcuygI
         xCXw==
X-Gm-Message-State: AOJu0Yy8IGwRQbS7Wgp6+duwDADJMDFXGHoiahfAjsaaSJdbcH9DYi4q
	nKIKjQfeRcJ381vn8b5Ucb1ifQBFyYM/JPFMvDR2aHGRErZl0AzTGhQgTtWnPEU3q35d13RZYyP
	W
X-Google-Smtp-Source: AGHT+IGG7s6Oe33J/XmHTMtV5FMqVvWxCk+2M3wpvCrsMnzNwrLwsfiUejeLhxTVumdEvPHZXZpSuQ==
X-Received: by 2002:a17:90a:4094:b0:2c8:2236:e2c3 with SMTP id 98e67ed59e1d1-2c848a4399bmr15456635a91.17.1719422238599;
        Wed, 26 Jun 2024 10:17:18 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8f3b5ad36sm83217a91.26.2024.06.26.10.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 10:17:18 -0700 (PDT)
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
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 2/3] RISC-V: pi: Add kernel/pi/pi.h
Date: Wed, 26 Jun 2024 13:16:51 -0400
Message-ID: <20240626171652.366415-2-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626171652.366415-1-jesse@rivosinc.com>
References: <20240626171652.366415-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_101719_784786_E37CEC75 
X-CRM114-Status: GOOD (  13.25  )
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

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
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
index 000000000000..65da99466baf
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
+ * The folowing functions are exported (but prefixed) declare them here so
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
