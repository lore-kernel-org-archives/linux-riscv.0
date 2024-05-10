Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CF7C25B77
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=le7WIpvOog3Yu6ojzRkNwYBn0id5C4+FY0wGC5mCTto=; b=S5hFZejwgJ4NI46k4edKwivg2Y
	eV9GNYQRGpcOClaMNjx+/pKkoUyQM8YCxVYL411U6tnmeA9TDCbuaa2gajxPfT1r+AWJ4VeuX/JOr
	u8BQqAgpqNPC/zIZ/I8hadNNDryqUJXVTQ2m2TPBJlp5/s0PvFcW3yxWmJviLRMTY5jZJ3rtnGDKp
	dctCOHCPXOZmrIGmuv8eoSQu6KQ6yRfxw0xh++tQnst0CYf5FIipE6tQIuryQVfJuPYOMAf6g8NJY
	j6s3g0NuUH9p/rR7MWcsW7F2704NmS6TfqBjLI/qhkscupYcZsRPA/6/e/VU7PsUqjUcPly+JgcqF
	aDXw/WaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esg-00000003ajw-0XNv;
	Fri, 10 May 2024 01:17:08 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpR-00000003MgI-1tGt
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:47 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f454878580so1370945b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299774; x=1715904574; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PW3mfjkgd+MZlh3nBATuOvH+NDY42sIa+VAHDQCo4gg=;
        b=G+dwNwjKFCKP+y/a+pP7RIwa2N3nBUw2A3SOl1yvw584qMVvHiM2lQRJ9I17K9Taa6
         xx6tcOMDgK4gnx+npaZwOuyZeDziyHpHfl9sG6dvyMqP35YtNF5+CF1QLs7VW+/Q4WZU
         J0P2jAOglwXG8Xrx5EIM1GZUosHK2BIJKrftmvNt3jKUCHB5fYK40NROnUyu+9PPi8ko
         OKp+ALhKTe2MSqVjmSgHP+Fs3Y7F+Rn3aVVq98PwaYtkQuTDBVt9jSeEUXqehkVIHq+J
         JmcC1KWnLQcA0mqCJBKExJ/C3ISZh2h+XX6Hd+yFWs8AR4IWfgYziVsBFfsL6zTHQ2yT
         /I8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299774; x=1715904574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PW3mfjkgd+MZlh3nBATuOvH+NDY42sIa+VAHDQCo4gg=;
        b=jfBhUyRhn1OcwXw/vziDKxQPN8D0z1qCF9hzS+JhEKnCcHP1ZWlco3AF4upJzWn4TC
         axE3oUNmTnVB/0O8RTDEIyqaKUzFSbNrkTBkofogdztBFgce6x/8w/05IL79tOQdXTte
         f2wZpwFBMDDoLWc7YAwBm1dgIfkXfL4LmkcwK4exC1Ju7wEKOk4YI0Fwxew5EUuWFPnU
         1Fkfcp1SSpKyNP34wWqJwVim0PQYyh28VfxQV6M/K/ph2nKIuvgAyqZTREpeSkYejQ0B
         nyPXUAPaeMt6//RGPrezoU82lGrLFhu8zKGCCvwEZeeMtxAbGI/0BUdcIt8nG2E8npCq
         q5PQ==
X-Forwarded-Encrypted: i=1; AJvYcCVu1XZPzOJlB9AxZ2hn5RSjpXQ1lMk4MQTYV1U5y9Hpb6D6fosYT5nyAUoU6rCrWbPe6ohFjtuWM7sCSE2wHhtNiLyjAO90c0BYMqsMzkjV
X-Gm-Message-State: AOJu0Yxh6OIkBqtTfoq14hzWlD49dr/AdtRCnr3DoTQftFBdFItOfBQJ
	VqUrmsYCilj6qzz+e32PXbbqC1li7yYkeFyZ3GAK8wVxmWoeH8L5GV40kZDyU2l4RM7M3zDxbg7
	dwQ==
X-Google-Smtp-Source: AGHT+IG+56tzsbyva1ZUQtPuRI+DlskjPnyTRIt8RkIrDnkpdAUoEV1Ksd4/O0D6pcKIPC/4JuC4Gkgv66o=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3a0f:b0:6ea:88cd:67e9 with SMTP id
 d2e1a72fcca58-6f4e0376006mr68314b3a.4.1715299773958; Thu, 09 May 2024
 17:09:33 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:26 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-10-edliaw@google.com>
Subject: [PATCH v4 09/66] selftests/clone3: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_170937_625540_5D96FDE4 
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

_GNU_SOURCE is provided by lib.mk, so it should be dropped to prevent
redefinition warnings.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/clone3/clone3.c                        | 2 --
 tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c | 2 --
 tools/testing/selftests/clone3/clone3_clear_sighand.c          | 2 --
 tools/testing/selftests/clone3/clone3_selftests.h              | 1 -
 tools/testing/selftests/clone3/clone3_set_tid.c                | 2 --
 5 files changed, 9 deletions(-)

diff --git a/tools/testing/selftests/clone3/clone3.c b/tools/testing/selftests/clone3/clone3.c
index e61f07973ce5..ce2c149dab46 100644
--- a/tools/testing/selftests/clone3/clone3.c
+++ b/tools/testing/selftests/clone3/clone3.c
@@ -1,8 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
 /* Based on Christian Brauner's clone3() example */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <inttypes.h>
 #include <linux/types.h>
diff --git a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
index 31b56d625655..bb99ea20f7d5 100644
--- a/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
+++ b/tools/testing/selftests/clone3/clone3_cap_checkpoint_restore.c
@@ -7,8 +7,6 @@
  */
 
 /* capabilities related code based on selftests/bpf/test_verifier.c */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <linux/types.h>
 #include <linux/sched.h>
diff --git a/tools/testing/selftests/clone3/clone3_clear_sighand.c b/tools/testing/selftests/clone3/clone3_clear_sighand.c
index ce0426786828..8ee24da7aea8 100644
--- a/tools/testing/selftests/clone3/clone3_clear_sighand.c
+++ b/tools/testing/selftests/clone3/clone3_clear_sighand.c
@@ -1,6 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <sched.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/clone3/clone3_selftests.h b/tools/testing/selftests/clone3/clone3_selftests.h
index 3d2663fe50ba..172e19d5515f 100644
--- a/tools/testing/selftests/clone3/clone3_selftests.h
+++ b/tools/testing/selftests/clone3/clone3_selftests.h
@@ -3,7 +3,6 @@
 #ifndef _CLONE3_SELFTESTS_H
 #define _CLONE3_SELFTESTS_H
 
-#define _GNU_SOURCE
 #include <sched.h>
 #include <linux/sched.h>
 #include <linux/types.h>
diff --git a/tools/testing/selftests/clone3/clone3_set_tid.c b/tools/testing/selftests/clone3/clone3_set_tid.c
index bfb0da2b4fdd..a6df528341bb 100644
--- a/tools/testing/selftests/clone3/clone3_set_tid.c
+++ b/tools/testing/selftests/clone3/clone3_set_tid.c
@@ -5,8 +5,6 @@
  * These tests are assuming to be running in the host's
  * PID namespace.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <linux/types.h>
 #include <linux/sched.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
