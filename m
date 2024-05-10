Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E4A9C25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=R4K6zhKEur2HbpfIoQqnBaL7EnIeb84gbCcsh2+K+KM=; b=ZnVipckz6kfn8sg/RVV20euBLy
	0bpHIllYzXyPJEX/0AlqcmwSVYlLGRFfgFmd9iwGLusx0a7nIeCZOCtlMnhOPngnDpVtcx3fuJoS7
	XzrNNHVeWn0vZLSnz2IB58e8kxTGjC3wVj5w4iSBLuHH/TQepHpFclOvVI+K6ra64BFve4ipM4Jom
	dDbHJD11isF6O5txq3G7qslQPu2vEOINYFo2kvQurpEFTmsJfV8qlWWABb6Vbla4eotaU0oGt1HqU
	pkFox+gnAeHgBVcvYrQTFmCO0kgHf3REOxGS7isAEdSM2JraijlZKVT5sNpFtlTNHpGZxZcGfX1KJ
	0hi3q16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5EtF-00000003b4w-40IL;
	Fri, 10 May 2024 01:17:38 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dqx-00000003Nsz-07gr
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:29 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-6292562bac4so1909922a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299866; x=1715904666; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=84fq6ZvWsXcH3yoCsXtIeXNIR0piZVNg/mOHlmzM6PE=;
        b=2JO7OJLvJ6Vwy/hLehBdwWV/aRtjXNIsRtCpKpTgYc6uyey9epTRNdD6u62xLuPGaf
         j0NLU3EhXD/OVnLWo1wqzTdCIvSLBj6n+9XguICHfGTCrK2qTuI3x24Smt9NkQkLCkQs
         XRlOd9jKZA1/zxUv0pZLJWM/wyVtTSav8dLV8it968BhqPBWB5Grq8SFvc9dg0JNgswi
         jmwsUcrQOb++Gjz5idr7RkSGwYvWw4jaEvGrxUOWdMInIJletLOaMjyyg5YTFbITom9Z
         ps10b47WFGvTZihn0XJU+uugEs70tTh4cBGUZ5Z5fH5fh2zJqL49LtXCYhG2iRd+rLQS
         +n1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299866; x=1715904666;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=84fq6ZvWsXcH3yoCsXtIeXNIR0piZVNg/mOHlmzM6PE=;
        b=bZ7O18NrQjKEu/6Qz1MBXEJjW7nf6VSo1sWelXM125zPamG+ND6zKgKMYWZqhM4nFv
         53vzGqNpvvSqUkwlrv/GGAindqrByeWfoqlGOgdfFI+H/iWhvBjII10uVURGEwF5UvSX
         wrY70y00kb4xDHWFbkxepKt18mmI4r+NJpE9zkqrv+RLZnQ+Ymy+F9e4o+a3oQt3w+Lb
         qzbha48jJFPNBc2JsP5CYCmmsndULYy/zTOwgOPKvID5JvajT2JLZ08vSouelQt3/IFQ
         YMiGsyx1p4ZlMvGyjnz1iorMXGnNsh2EZYrWlmHjfY1nz73T/nhR9uTEyq4I+Av6/WND
         iy8g==
X-Forwarded-Encrypted: i=1; AJvYcCVUJl72S17IbcyvMr4ceT+VdpUNR5RB9rstWX1vkcxw1sekSZuslxr+ukJ9RxpdC6ZD8fau/BR8lCWLegT6whxTE8mTLa+ykr8GHdNJgQJF
X-Gm-Message-State: AOJu0Yyb/zsf2xS+1bLKZIFrGk9tubNX53DtDioh04B5yKrtLOaUj5+i
	cBXpBG1+pnLWejzv2+DfUJJesPX3VKJ3SnGKuJaZX7cFB9kyNfagy0xy1YNr3Mc/R/hSpgD8D5r
	QxA==
X-Google-Smtp-Source: AGHT+IFLSkriyfNeZwxTH/1tCYYn+ZGRPXxu1UD93cF6+eE2G0giQE/xuWSoSQ6S66AYY+DWZyjpxcVkStY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:6f0e:0:b0:5ff:bf83:21d7 with SMTP id
 41be03b00d2f7-637416535a9mr2353a12.8.1715299866441; Thu, 09 May 2024 17:11:06
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:59 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-43-edliaw@google.com>
Subject: [PATCH v4 42/66] selftests/pidfd: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_171111_368161_CA1FE259 
X-CRM114-Status: UNSURE (   9.21  )
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

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/pidfd/pidfd.h             | 1 -
 tools/testing/selftests/pidfd/pidfd_fdinfo_test.c | 2 --
 tools/testing/selftests/pidfd/pidfd_getfd_test.c  | 2 --
 tools/testing/selftests/pidfd/pidfd_open_test.c   | 2 --
 tools/testing/selftests/pidfd/pidfd_poll_test.c   | 2 --
 tools/testing/selftests/pidfd/pidfd_setns_test.c  | 2 --
 tools/testing/selftests/pidfd/pidfd_test.c        | 2 --
 tools/testing/selftests/pidfd/pidfd_wait.c        | 2 --
 8 files changed, 15 deletions(-)

diff --git a/tools/testing/selftests/pidfd/pidfd.h b/tools/testing/selftests/pidfd/pidfd.h
index 88d6830ee004..e33177b1aa41 100644
--- a/tools/testing/selftests/pidfd/pidfd.h
+++ b/tools/testing/selftests/pidfd/pidfd.h
@@ -3,7 +3,6 @@
 #ifndef __PIDFD_H
 #define __PIDFD_H
 
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c b/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
index f062a986e382..84135d75ece7 100644
--- a/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_fdinfo_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <assert.h>
 #include <errno.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/pidfd/pidfd_getfd_test.c b/tools/testing/selftests/pidfd/pidfd_getfd_test.c
index cd51d547b751..b6a0e9b3d2f5 100644
--- a/tools/testing/selftests/pidfd/pidfd_getfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_getfd_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/pidfd/pidfd_open_test.c b/tools/testing/selftests/pidfd/pidfd_open_test.c
index c62564c264b1..f6735eca1dab 100644
--- a/tools/testing/selftests/pidfd/pidfd_open_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_open_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <inttypes.h>
diff --git a/tools/testing/selftests/pidfd/pidfd_poll_test.c b/tools/testing/selftests/pidfd/pidfd_poll_test.c
index 55d74a50358f..83af8489c88e 100644
--- a/tools/testing/selftests/pidfd/pidfd_poll_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_poll_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <linux/types.h>
 #include <poll.h>
diff --git a/tools/testing/selftests/pidfd/pidfd_setns_test.c b/tools/testing/selftests/pidfd/pidfd_setns_test.c
index 47746b0c6acd..518051f0c3a1 100644
--- a/tools/testing/selftests/pidfd/pidfd_setns_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_setns_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/pidfd/pidfd_test.c b/tools/testing/selftests/pidfd/pidfd_test.c
index 9faa686f90e4..53cce08a2202 100644
--- a/tools/testing/selftests/pidfd/pidfd_test.c
+++ b/tools/testing/selftests/pidfd/pidfd_test.c
@@ -1,6 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/types.h>
diff --git a/tools/testing/selftests/pidfd/pidfd_wait.c b/tools/testing/selftests/pidfd/pidfd_wait.c
index 0dcb8365ddc3..54beba0983f1 100644
--- a/tools/testing/selftests/pidfd/pidfd_wait.c
+++ b/tools/testing/selftests/pidfd/pidfd_wait.c
@@ -1,6 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <linux/sched.h>
 #include <linux/types.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
