Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7852DC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 00:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hYVnlMfEUd2K/NGFKiNsUHDGkjZ33MsBHXH6NQS08lM=; b=xDjhQj753G850p3EoYT1NijTin
	r5qSJOmyuN4RkknbQYED06oznWQ9O6oWw6thmm7IgU8m/Oqd4irSxDu29hlcTshSojpr967MoNut2
	bfNZCzsu3yf2o/uvXuMDvNDGuF/gZmKEcwRenG2P15wRvxI0bcECZ9cfsvaLW++BfVAw//fEVkVp5
	xZk+AD3dvHRKHNRT6EW82CvLoM1KPNqPLas0oCGc8IwXlKFNStcT2gRBqdSpLdrY1OSPCL5k2Rgqy
	1nVX4GXNp695ahiSpOksW3IXF/Ys1RMH75ZWYAeFUWM9eugSn8vWKRCeER9zOugLyxSCuEWiWGG/R
	a6M+ACaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKW-00000001SyP-1oih;
	Wed, 22 May 2024 00:59:44 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKP-00000001SuV-1zIB
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 00:59:40 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6256bc244b7so5001367b3.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 17:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339575; x=1716944375; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Vcoll/IdpSwzui0X6UWqq2ULt+x6/Cax/vsNd7eRYao=;
        b=Tqu9nt5LQw9nVNypCwQeW9W1zefTIKHr5i4ENe+mS3yEXNinO6enUBX0Ro4vrATb3n
         0lrLwhaFWoiucDYL55V8+zoMsIRfaRs/sth9WdU+WH4X00SDCRXy+DqlonBDJDBgDEQT
         DL079zu3KB+hwcD91lGouk01WutncI5ap3hkTha9cyjAsEQvLAs/xCmbEOokM4a++kjE
         9sLZxLCyofSEcF4bOYc6ESMe7Y0sLnIQ+ik7ga1WQ+locQSbYqPfT3jOs2pbMWUAn+0O
         mZ1qVBZ/9D1p67pApQ9UwYOlagBLjuneUfIpZfNuXwjPXyCEVLat4//ipTWyCGX3sXnP
         NJpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339575; x=1716944375;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vcoll/IdpSwzui0X6UWqq2ULt+x6/Cax/vsNd7eRYao=;
        b=fMkzNSNeOythZtNQx0cCSoPQ/82bPC810wQ5uA3iSnPhnj2PcWs2p5QYq9dlfwWIQ+
         d+5xCnv2nWbZz/u1kAUQjexznuP7pMmfM0QlzyMceoXPJ7V8wcOBZEFuR9w0Wwg1W1Kc
         hjJ8//IKMbBPZGw2H5NDO6qr4ugMB0F4lhez5KUe1opkBwjyOXUm7Z/xXbsC/gn/eRpI
         fU3rlUjrDTVf8TZ/++wJkVCjKgtplxZoRj9mO5vUJU+J0VZ3H94EDCz+reqOC5pBBbtA
         BXgsRo/nuxXx3p5jpbduJUtmiy56uUxOu0FG1ePK1+atfEexz/gC1D5DrFVLksUkO7R4
         VVTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiHZRsWn176eH8yMWineh7MwYGlgZtHdEnNQIkZqUd/UI9yxWJKATuEptW8cSXOj2MGnt355Ms7oGjrH/yxSZqjOIV19COg3vhSQ+HUdMn
X-Gm-Message-State: AOJu0Yxnp7+XdmIokZFxVMoXEm+BmvGhgQ/+busqgbmOFsrkkjczW/wZ
	AOZTAmRgtO6jz/iSmHLCxFF2ScukqqzemXSB8bGf9TjgVebx2/tOoNDpQ53hDXS+HnbyJBlnIt7
	A1w==
X-Google-Smtp-Source: AGHT+IFfzJvv3WGvX+RtoUMmfTZ8E947Y9999dOkBX567XvW3osHS4tB8pbUDMxPDbs7XRUAS1pAa7iMdxc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:cc49:0:b0:618:9348:6b92 with SMTP id
 00721157ae682-627970a0d4dmr27313297b3.1.1716339574994; Tue, 21 May 2024
 17:59:34 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:49 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-4-edliaw@google.com>
Subject: [PATCH v5 03/68] selftests/arm64: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_175937_686731_2253FD33 
X-CRM114-Status: UNSURE (   9.37  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
