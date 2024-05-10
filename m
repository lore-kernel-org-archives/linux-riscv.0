Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838BAC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=HLl5CHKX7VzrITaSIstjBZ1HloWHRs+J9RWExr17wUw=; b=2PaNkFTLzvUika9bAV2rQt4Rva
	aD6sPslmFMgnHnYk3rinmtyfjIGJHupvXdFq4oLhLVN9g6m/5a/qinxGYLlNYQ3gYABgI4N8QZHgH
	g5v6jFjf28Te6gYQnDipUHJPG8YLHIxPeDVXGfNPsqDbi/GNY/FkdnKxgXPk717N80gCJr+fDeCF6
	7fpa1vmaiicZ6gWkcp6WbgJAf3QaMe5a8nV4eccK3UIQnMgzgKMknZXlVdvwfzJZ3o5eKEQsHPbMs
	OSQ7xyrSrpBXjmRDbT0SDuvLCwYaSWCvRfxCDhdeBYh+nYGOQZOItqaFIzX7RcIc7Gunvb6yA4Dyp
	tOB1+ddw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dp2-00000003MRI-36KH;
	Fri, 10 May 2024 00:09:12 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Doz-00000003MN9-1rOF
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:11 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-6383fd1e475so30260a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299746; x=1715904546; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tXggadKKCK6MVIJRJtEM2QQicrU97LLqONZv8Oqcmks=;
        b=MdbpGlgdurtp1Yd9JqTEKO/FOtaAOSbRkAmqWv2Myd7mRTWxY5vUNdYqKh3nQ++W0N
         Q+zyV0T+dZBhXRpsD1t48Lrj+W9sB2g65rkimgQ8XBzdMZ2rkUFl8fqC32Ieeg/NixOo
         QC6DZ2Lnd3OdtaNVDaYTCZBp4VH4mkmT2BFXsv8+Qv99V+Wz7PDvlgLVCPIwW7439siV
         Ia+xJMSIiTWS9N8hyMEj1q/ednQdcNnNGW31gXWFfcbLbOPwwS0em3ZjbmHJSHCs2WH6
         0ul5oPoWepPPL+BqCt68PKMU5fW2eb2/50ExFv8yzXYHNs3nNFhwQ3v+83yRoTigbAfY
         AZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299746; x=1715904546;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tXggadKKCK6MVIJRJtEM2QQicrU97LLqONZv8Oqcmks=;
        b=XiXT0oDIzt+s92v8IGJlNHO65DQ8zi5tOeDHNslONvFqG5IvRKBUGOJuWnpbj86+sy
         94DRDH8PJVRktDreDKITyuNRWMHf63nmhzfOyu5S9TCCb38pzP/9upulnPNyqLJwtzk6
         XJX8fi5DInpB73kZx7bHaJbTusdJxBUYKS/G52ZZXb8N+ab9sjWMDT0Bixl9m8kqUggu
         UF8obev9gECQ1G4wCg5ekVQywNCDM2OWs899CQ3j7/OYQtBtu9eFMWqyeMls3fjiUUes
         nwCAP7SgCA6BhK1/1RUKHGSaYv/64gYmR1BkMwJNPEtiaPBLpp3lNlDCUAHezSIZFxZ6
         fhkg==
X-Forwarded-Encrypted: i=1; AJvYcCUa+m/BkXhMPASR4ymEXkOkI62Q0bU1cO0i5wCN5O8EKgo0xUyQVqpuo4j7omUFJsYqxbdeugWTe1OB20Wd5pGQmB67G3LmDbHMCrIZ66os
X-Gm-Message-State: AOJu0Ywjefm2ZC5hRlqG7uaVcm43S6hevYJCKuD+IOQ0EfhpyzPtazxu
	fmmUSmnaQw87RDXiY5wwrDuoWpPhQnoWZTMYra17j7QPnlXDNcbNY4NynBDe9zuLRlE8l/zqwem
	RgQ==
X-Google-Smtp-Source: AGHT+IH/4J8CPlJQivHdZD4ORSDr8VuDv1sGosfNXuvMsaU3Mx5nF/LYxoOqEnJxYZlCRSOl/f7n75EPBvs=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:6f0e:0:b0:5ff:bf83:21d7 with SMTP id
 41be03b00d2f7-637416535a9mr2330a12.8.1715299745871; Thu, 09 May 2024 17:09:05
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:19 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-3-edliaw@google.com>
Subject: [PATCH v4 02/66] selftests/arm64: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170909_550625_D52E6627 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/arm64/fp/fp-ptrace.c              | 3 ---
 tools/testing/selftests/arm64/fp/fp-stress.c              | 2 --
 tools/testing/selftests/arm64/fp/vlset.c                  | 1 -
 tools/testing/selftests/arm64/mte/check_buffer_fill.c     | 3 ---
 tools/testing/selftests/arm64/mte/check_child_memory.c    | 3 ---
 tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c | 3 ---
 tools/testing/selftests/arm64/mte/check_ksm_options.c     | 3 ---
 tools/testing/selftests/arm64/mte/check_mmap_options.c    | 3 ---
 tools/testing/selftests/arm64/mte/check_tags_inclusion.c  | 3 ---
 tools/testing/selftests/arm64/mte/check_user_mem.c        | 3 ---
 tools/testing/selftests/arm64/pauth/pac.c                 | 3 ---
 11 files changed, 30 deletions(-)

diff --git a/tools/testing/selftests/arm64/fp/fp-ptrace.c b/tools/testing/selftests/arm64/fp/fp-ptrace.c
index c7ceafe5f471..eb1f14047361 100644
--- a/tools/testing/selftests/arm64/fp/fp-ptrace.c
+++ b/tools/testing/selftests/arm64/fp/fp-ptrace.c
@@ -3,9 +3,6 @@
  * Copyright (C) 2023 ARM Limited.
  * Original author: Mark Brown <broonie@kernel.org>
  */
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <stdbool.h>
 #include <stddef.h>
diff --git a/tools/testing/selftests/arm64/fp/fp-stress.c b/tools/testing/selftests/arm64/fp/fp-stress.c
index dd31647b00a2..042f736970c2 100644
--- a/tools/testing/selftests/arm64/fp/fp-stress.c
+++ b/tools/testing/selftests/arm64/fp/fp-stress.c
@@ -2,8 +2,6 @@
 /*
  * Copyright (C) 2022 ARM Limited.
  */
-
-#define _GNU_SOURCE
 #define _POSIX_C_SOURCE 199309L
 
 #include <errno.h>
diff --git a/tools/testing/selftests/arm64/fp/vlset.c b/tools/testing/selftests/arm64/fp/vlset.c
index 76912a581a95..e572c0483c3a 100644
--- a/tools/testing/selftests/arm64/fp/vlset.c
+++ b/tools/testing/selftests/arm64/fp/vlset.c
@@ -3,7 +3,6 @@
  * Copyright (C) 2015-2019 ARM Limited.
  * Original author: Dave Martin <Dave.Martin@arm.com>
  */
-#define _GNU_SOURCE
 #include <assert.h>
 #include <errno.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/arm64/mte/check_buffer_fill.c b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
index 1dbbbd47dd50..c0d91f0c7a4d 100644
--- a/tools/testing/selftests/arm64/mte/check_buffer_fill.c
+++ b/tools/testing/selftests/arm64/mte/check_buffer_fill.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <stddef.h>
 #include <stdio.h>
 #include <string.h>
diff --git a/tools/testing/selftests/arm64/mte/check_child_memory.c b/tools/testing/selftests/arm64/mte/check_child_memory.c
index 7597fc632cad..ef69abc7c82d 100644
--- a/tools/testing/selftests/arm64/mte/check_child_memory.c
+++ b/tools/testing/selftests/arm64/mte/check_child_memory.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <signal.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
index 325bca0de0f6..aaa5519c6bbd 100644
--- a/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
+++ b/tools/testing/selftests/arm64/mte/check_gcr_el1_cswitch.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <pthread.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/arm64/mte/check_ksm_options.c b/tools/testing/selftests/arm64/mte/check_ksm_options.c
index 88c74bc46d4f..76357f914125 100644
--- a/tools/testing/selftests/arm64/mte/check_ksm_options.c
+++ b/tools/testing/selftests/arm64/mte/check_ksm_options.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/arm64/mte/check_mmap_options.c b/tools/testing/selftests/arm64/mte/check_mmap_options.c
index 17694caaff53..66bddc8fe385 100644
--- a/tools/testing/selftests/arm64/mte/check_mmap_options.c
+++ b/tools/testing/selftests/arm64/mte/check_mmap_options.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
index 2b1425b92b69..e66d8b8d5bdc 100644
--- a/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
+++ b/tools/testing/selftests/arm64/mte/check_tags_inclusion.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <signal.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/arm64/mte/check_user_mem.c b/tools/testing/selftests/arm64/mte/check_user_mem.c
index f4ae5f87a3b7..220a8795d889 100644
--- a/tools/testing/selftests/arm64/mte/check_user_mem.c
+++ b/tools/testing/selftests/arm64/mte/check_user_mem.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/arm64/pauth/pac.c b/tools/testing/selftests/arm64/pauth/pac.c
index b743daa772f5..b5205c2fc652 100644
--- a/tools/testing/selftests/arm64/pauth/pac.c
+++ b/tools/testing/selftests/arm64/pauth/pac.c
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (C) 2020 ARM Limited
-
-#define _GNU_SOURCE
-
 #include <sys/auxv.h>
 #include <sys/types.h>
 #include <sys/wait.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
