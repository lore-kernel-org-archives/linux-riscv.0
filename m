Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E4AC25B78
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OBz+8o8ehkWKgTjQRC3BiXPRjVcZXiTR6pxwnEyVxGo=; b=edSsqf+Wna1zgfxIk0b9IHntg4
	ImmPrLqLa3QKC4U6b7lwvwo2+TpUA7+G/kOoTzQqF/kD5m0+2KGvo2j+Ez5ENydmlPzni8zkBwtur
	mjos7GVmUq8H8S3aTqIcfJAxsVcXshh0pUSLY1TZZq185RNhGzAqcjXuhHuXSCOxV7GMAsunT36Aq
	/Ydk/V89MvJbJ+pDypU2kmXtM3KjWHqLCIRF42xGFWG4lytwfl7B1jC0Uiy75vz9lWo/D5yw6/D19
	tEYReiXs86o/bfiyQXHyNGMnUUqWL2VGReQxjSmIaKbbz/Gm6Ul2yDcm41ixK9C+729/9cPr5YrNL
	Cd1xSrGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIm-000000036Jl-36Ty;
	Thu, 09 May 2024 22:31:48 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59za-00000002cu4-3Nrd
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:59 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ec620ccf77so8835995ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285027; x=1715889827; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CrH27rGPbpomBrMwjXFw9TPUN7Jl3Ae++I8KKaa1ZHU=;
        b=J2SN1yDFsl0jET4HQcZM0R6ajz7lUELRplUbg535mNtkgqzwscfQghxDB8/uJW03Z0
         mh3VbR6XM+7fuBLBOILxAgTZT8fAOyzryNrnZtG1qcLHN/fNLsjl5T3a/6dLEfPoX+9O
         lM1KNRtbWOKCTYX4sG+UllQFTds0QOoe6OvruHNjhq5ni8JsxLlK+ZFlR5Tawo0hQuWe
         qFqK0H1JN4ck33iljRk0GgS7DPBbuC0T65CQ8KUuy+778rut4RcSMWyzr76iimvgnFM1
         YudoYqjrkXgOiJWIP2KVEKfUqytZK2RGOajZU2VoPgEruISdnQ2E5MADvsY9UQbT64r5
         FiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285027; x=1715889827;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CrH27rGPbpomBrMwjXFw9TPUN7Jl3Ae++I8KKaa1ZHU=;
        b=SE1XK+9OtXauUrE1tBVLr8284uQYIUv4WwW/7G2E56uGH0VIc1Hlu3ea0ZGduOVtOi
         4OxY4uqQVBPNFsvsUjfkH8S9hasCqUPSmhQHQhvj5jdp3NXJaCc4SIuWyoQud+tfpgM/
         KVVPRFNo8M9HpgWszAISApKQlZm7+mNij8b2vyKojDh26rtC52p5OR3zrMXPcXHDDD0h
         5X84LlDqArpA1t6Vp+fzD2KUynFLM3opqKNyK3Z7Ib/BjRTADGN4azbGHMFOgx4Kz5H6
         IhUsb8V/EwKmKXfl3f3i0F7QsBeW5dSCYWyudtJJyggaDJNU2FwRlAbQa1jZoTZ1Ljb/
         P2Xw==
X-Forwarded-Encrypted: i=1; AJvYcCXwl3dByU8+KUX3Fzij7a3yl5yovtbW8e1FwZGtXDuqrE8Vi6aMPyEfONYiTlnFPGef7pskun+Rvwdfxo0EPgHbrYnjl3XqxXXWtfiGD6d3
X-Gm-Message-State: AOJu0YwTgyUfz1SaajoAESzmTndpti5o3cifebgJeqoMD3aY6i4pDZl4
	zPIh5QBptjZXWMe0a4D/ZvPlvIVR/q/700cPrQvdlCAcb3djX+2UVopsHBaDSWEJaYCN3RExAZq
	RBA==
X-Google-Smtp-Source: AGHT+IEuE3KvkQE4fBcoS4/aejH8+5T9BJ8+Tcefhf/wjiyYj040WpgbcuK7JYXdw/yXkY1WQk04Fq+Ou3U=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f548:b0:1eb:ac97:6c35 with SMTP id
 d9443c01a7336-1ef43f41477mr266155ad.9.1715285027301; Thu, 09 May 2024
 13:03:47 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:54 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-63-edliaw@google.com>
Subject: [PATCH v3 62/68] selftests/timens: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130351_143565_14E9370A 
X-CRM114-Status: GOOD (  10.12  )
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/timens/clock_nanosleep.c | 1 -
 tools/testing/selftests/timens/exec.c            | 1 -
 tools/testing/selftests/timens/futex.c           | 1 -
 tools/testing/selftests/timens/gettime_perf.c    | 1 -
 tools/testing/selftests/timens/procfs.c          | 1 -
 tools/testing/selftests/timens/timens.c          | 1 -
 tools/testing/selftests/timens/timer.c           | 1 -
 tools/testing/selftests/timens/timerfd.c         | 1 -
 tools/testing/selftests/timens/vfork_exec.c      | 1 -
 9 files changed, 9 deletions(-)

diff --git a/tools/testing/selftests/timens/clock_nanosleep.c b/tools/testing/selftests/timens/clock_nanosleep.c
index 72d41b955fb2..5608f2b519e1 100644
--- a/tools/testing/selftests/timens/clock_nanosleep.c
+++ b/tools/testing/selftests/timens/clock_nanosleep.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <sys/timerfd.h>
diff --git a/tools/testing/selftests/timens/exec.c b/tools/testing/selftests/timens/exec.c
index e40dc5be2f66..7f718a3bb043 100644
--- a/tools/testing/selftests/timens/exec.c
+++ b/tools/testing/selftests/timens/exec.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/timens/futex.c b/tools/testing/selftests/timens/futex.c
index 6b2b9264e851..0a5a81939220 100644
--- a/tools/testing/selftests/timens/futex.c
+++ b/tools/testing/selftests/timens/futex.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <linux/unistd.h>
diff --git a/tools/testing/selftests/timens/gettime_perf.c b/tools/testing/selftests/timens/gettime_perf.c
index 6b13dc277724..9fe6690edd2a 100644
--- a/tools/testing/selftests/timens/gettime_perf.c
+++ b/tools/testing/selftests/timens/gettime_perf.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sys/types.h>
 #include <sys/stat.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/timens/procfs.c b/tools/testing/selftests/timens/procfs.c
index 1833ca97eb24..7bc389b05799 100644
--- a/tools/testing/selftests/timens/procfs.c
+++ b/tools/testing/selftests/timens/procfs.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <math.h>
diff --git a/tools/testing/selftests/timens/timens.c b/tools/testing/selftests/timens/timens.c
index 387220791a05..7941a43155a8 100644
--- a/tools/testing/selftests/timens/timens.c
+++ b/tools/testing/selftests/timens/timens.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/timens/timer.c b/tools/testing/selftests/timens/timer.c
index 5e7f0051bd7b..378e058359c1 100644
--- a/tools/testing/selftests/timens/timer.c
+++ b/tools/testing/selftests/timens/timer.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <sys/syscall.h>
diff --git a/tools/testing/selftests/timens/timerfd.c b/tools/testing/selftests/timens/timerfd.c
index 9edd43d6b2c1..807edb9d83c9 100644
--- a/tools/testing/selftests/timens/timerfd.c
+++ b/tools/testing/selftests/timens/timerfd.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <sys/timerfd.h>
diff --git a/tools/testing/selftests/timens/vfork_exec.c b/tools/testing/selftests/timens/vfork_exec.c
index beb7614941fb..675c6a8b2eed 100644
--- a/tools/testing/selftests/timens/vfork_exec.c
+++ b/tools/testing/selftests/timens/vfork_exec.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
