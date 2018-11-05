Return-Path: <SRS0=E0x1=NQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,URIBL_SBL,URIBL_SBL_A,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25B1FC0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:26:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBFD32085A
	for <infradead-linux-riscv@archiver.kernel.org>; Mon,  5 Nov 2018 14:26:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jfvOjup6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YmcXL41y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBFD32085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wAwbPqt3jwU+rg6tjMuP1ICrfAt83Tt2VCnmUsFBWFM=; b=jfvOjup6mfRFKH
	0m6BBz5oh/gz16WxlGTxswMYFBGOoViVgzU3dCcwn3NogG3HABCQ39n4AwOSdsKlONbA1ZtIUmhw1
	DDUQfDPjYYun/UBcKWMLKQoslGGMu6cebMm+dzN7eCzTx+z+7hLK1MGQpwpPBnKnW/lHsynntvaXz
	uCmS20dU9SQxjXhW88gn+M716+iUB606alcO3n+G4vywo/mWwgX+REEZ6C50cPEJCYxUOmBsfiOCO
	BETG6GxeywEH0r9Hbxb6FIPXfX1bXHftNVbg9yOxUKV27tJWgm7EAlyEdSXNcT4OGQAKwSu/aagpP
	+M7Jqv/Qe5RHckirBNrg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gJfpt-0004LZ-6W; Mon, 05 Nov 2018 14:26:37 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gJfpq-00049W-Ai
 for linux-riscv@lists.infradead.org; Mon, 05 Nov 2018 14:26:36 +0000
Received: by mail-wm1-x341.google.com with SMTP id p2-v6so8226787wmc.2
 for <linux-riscv@lists.infradead.org>; Mon, 05 Nov 2018 06:26:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBz67z/mJka6vEpb5Y3a3+XUqviDBoG9e/F7g9R54D8=;
 b=YmcXL41yZOhgqeGgQlbxWfSZjBCKqUK9pJsIOR+O+4orMpQrZjUD/zO/eTNOVHRw3J
 H0mD1T1/Kj1xkoCVvI4OuiemC7S5VPanxevRNvGWgarV4ipcCSM/PvH0y5cQa/drxEdP
 9FyIEIYRWLoQrGf2FCSbxmCUKnpm3EuBJFs8mHWWbZVaCSxilmNUX9pSwYcP8kIf4pdl
 D2ENrsIjVuY5zLUTnYpAoZVUDISpvTn0DFHIQxaT6FlzcOb41QMqJwyCQLN5JVE5JyfB
 +mX+oZlaNJnod/odg9WlXMipw48ZPsqqGHxEnx4Imyk+CkdRWkBbZxtpWPtB0jUqigbq
 ha5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hBz67z/mJka6vEpb5Y3a3+XUqviDBoG9e/F7g9R54D8=;
 b=mzfkhbQ8D3ioa0AoXVypDAAKJvOQg5IWyfybYY9DYn62qKSVfOC848didz79k26jj6
 vItH42oSQiAUEfblUHCEraEStPMMnZ+Tq89e6CADmdKojBjnlgMh1Xp7a1mLgnNR3FeW
 3XtDJFZaQTR7aVt2/2FCsuXRb2Q+NZ0eKnqarv1yCfPoqNODIr75atiGXiXRwtoQiM4F
 8dz//35T+xoJ5AK64hcYSI/BfjaVtsg+x2iSm9T7ISDWBh57uMW3JUB0EgALYV0AoYby
 gWOsrLyjv2A9kYxtFJZ+81FbMaF3xmuCvxjGhBurLwZYZeHkvKeq/0Mnywhu26IPfZQ8
 +w9g==
X-Gm-Message-State: AGRZ1gI5AGtr/Iwy27m948y37MzX4b4z+qvuh4AC1QvbQoIb39rYtfL1
 l22QThWcDDSc2WjgEAJNfw0=
X-Google-Smtp-Source: AJdET5ck7py4QasQyGRzcxQm5JL6FXB01adS2g6uj+8nSnSBseNoO0Tzehiyf6BUze6097gNy0nVUg==
X-Received: by 2002:a1c:2d57:: with SMTP id t84-v6mr2591331wmt.9.1541427980445; 
 Mon, 05 Nov 2018 06:26:20 -0800 (PST)
Received: from localhost.localdomain (ip-76.net-89-3-178.rev.numericable.fr.
 [89.3.178.76])
 by smtp.gmail.com with ESMTPSA id b8-v6sm30105205wme.1.2018.11.05.06.26.19
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Nov 2018 06:26:19 -0800 (PST)
From: David Abdurachmanov <david.abdurachmanov@gmail.com>
To: palmer@sifive.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: add asm/unistd.h UAPI header
Date: Mon,  5 Nov 2018 15:26:02 +0100
Message-Id: <20181105142602.25750-1-david.abdurachmanov@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181105_062634_376681_E155F892 
X-CRM114-Status: GOOD (  13.31  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Arnd Bergmann <arnd@arndb.de>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181105142602.28oehfRJBb61m6odHIdDgqobmIf7iBG5CoPvHUhys-I@z>

Marcin Juszkiewicz reported issues while generating syscall table for riscv
using 4.20-rc1. The patch refactors our unistd.h files to match some other
architectures.

- Add asm/unistd.h UAPI header, which has __ARCH_WANT_NEW_STAT
- Remove asm/syscalls.h UAPI header and merge to asm/unistd.h
- Adjust kernel asm/unistd.h

So now asm/unistd.h UAPI header should show all syscalls for riscv.

Before this, Makefile simply put `#include <asm-generic/unistd.h>` into
generated asm/unistd.h UAPI header thus user didn't see:

- __NR_riscv_flush_icache
- __NR_newfstatat
- __NR_fstat

which are supported by riscv kernel.

Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Guenter Roeck <linux@roeck-us.net>
Fixes: 67314ec7b025
---
 arch/riscv/include/asm/unistd.h               |  5 ++--
 .../include/uapi/asm/{syscalls.h => unistd.h} | 24 +++++++++++++------
 2 files changed, 19 insertions(+), 10 deletions(-)
 rename arch/riscv/include/uapi/asm/{syscalls.h => unistd.h} (54%)

diff --git a/arch/riscv/include/asm/unistd.h b/arch/riscv/include/asm/unistd.h
index eff7aa9aa163..fef96f117b4d 100644
--- a/arch/riscv/include/asm/unistd.h
+++ b/arch/riscv/include/asm/unistd.h
@@ -13,10 +13,9 @@
 
 /*
  * There is explicitly no include guard here because this file is expected to
- * be included multiple times.  See uapi/asm/syscalls.h for more info.
+ * be included multiple times.
  */
 
-#define __ARCH_WANT_NEW_STAT
 #define __ARCH_WANT_SYS_CLONE
+
 #include <uapi/asm/unistd.h>
-#include <uapi/asm/syscalls.h>
diff --git a/arch/riscv/include/uapi/asm/syscalls.h b/arch/riscv/include/uapi/asm/unistd.h
similarity index 54%
rename from arch/riscv/include/uapi/asm/syscalls.h
rename to arch/riscv/include/uapi/asm/unistd.h
index 206dc4b0f6ea..5545f498071d 100644
--- a/arch/riscv/include/uapi/asm/syscalls.h
+++ b/arch/riscv/include/uapi/asm/unistd.h
@@ -1,13 +1,23 @@
-/* SPDX-License-Identifier: GPL-2.0 */
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
 /*
- * Copyright (C) 2017-2018 SiFive
+ * Copyright (C) 2018 David Abdurachmanov <david.abdurachmanov@gmail.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
-/*
- * There is explicitly no include guard here because this file is expected to
- * be included multiple times in order to define the syscall macros via
- * __SYSCALL.
- */
+#define __ARCH_WANT_NEW_STAT
+
+#include <asm-generic/unistd.h>
 
 /*
  * Allows the instruction cache to be flushed from userspace.  Despite RISC-V
-- 
2.19.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
