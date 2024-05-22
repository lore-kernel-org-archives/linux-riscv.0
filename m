Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00493C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bdujmiSLIq5/GwFP+9OWic6tFkf0LM9/TQtpNvvoffw=; b=iLArFrBGcvTi/D+putH/RbTirW
	O+QbbxD1uKDQ6EjE0kmXv6pM6do2WAcCkNoPlmjb6VLrG2ruswXkPaATC+zrwvGeyW/T0iBQRvdx8
	Wl+8oIVmiSbCbISeiveahCcv6FNLsVJg0K9GgXZzUf5j2sv+ofb+x3LvzgIBkjpt6tLQ9C9kyAHlF
	3mMO2Shk/aBKnhKIyPfs+jSXZ1BjCeUQdadlH3+tTvI0jduXFdLIximLFknIXTtOQ6wQbHE5CsHws
	W0SYely+hsT6jn47aVPJaFXo5I/gmdtK9dtbpP1egMxU44upmTej7NIs9WnA6LDPY/Ri/iDz6DJ2Z
	G9o98gQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLp-00000001TvB-33kO;
	Wed, 22 May 2024 01:01:05 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKv-00000001TCk-1y2T
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:15 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f6a41800baso330828b3a.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339603; x=1716944403; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfexs9UjGmBXqFDc3RmOYfuuIPIjhIku4381mEPxmek=;
        b=RO/Sw48y+t0XT1TNcgDR2cQTUtbpHRPaoE40O5EQ5c7KVN6RyRCVaKZD0NXUKJwYEY
         NbeaG/VrLi+zsKe3sS11c+qp5FFY7Wp4jvjtFyH0pUh1+U5s2kV9Qvkyuo1UxrroRMnq
         N/ZH0b7yVKGVTJNb05fmDfiQfI3+1UfxCPZEkzZfg1qWQ0JOsIvQ5V0tC3vbXK7+x4dA
         Whgphru9KMV4iRiRRWibEKjixdKZHQhRYbf/2Lt6leOcUvDm2kXCK7Fx7gHD8dOK7gqM
         xmWtZ5vQ2zEFPUegCV75F1/sr2ay1Mtj081Xg/7Imw/GlV+b/tl1r0hDlbPtXA6OfDId
         cQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339603; x=1716944403;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zfexs9UjGmBXqFDc3RmOYfuuIPIjhIku4381mEPxmek=;
        b=TYJxuY6HEDOgwS87+kWhd+gLsP2UMcsR1E7xybGqKlnZokA4EXp+74r5CHtMWlMtAN
         Yc0RAhBZL7B7A03qIfyhDQTH3o6XsK+fP67ScbUqnTT6XaJ36f3ftZWXc/PC3rtHVp3S
         UmNL5eTcukc8xiixP7q+SI3xVCTW7KeRt5CnQ5UIK7hgfoM7jzEjCT9KFYGeA5oaUUlI
         D8pu5+Gw7/9/rBwRLbU/BwvbeKiiAw0vHVfLb+kGwis5nqhBHtOqi06cLL1B70hAOuZZ
         vjCjuu3g8VK9bWxwELKm12Z4+RcOkSUTiTPvIEHrriWLuepGIlJji9jYXKcF0iVLaJ/N
         0Z5Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1+s3KOQMmW3CipXwk2CmRlVVTvDqrmlDtc+4Jpidzc5eFZMyz8vVI/m3l2Dackh29ENG9xzL2vQvxval2cWkAhMnRRbpcn7IuBC8dIx6R
X-Gm-Message-State: AOJu0YyvCj5gaPjhx8t3TBcjguGJ80RpZVQOZYEiBe7eYhzgSIgbcxtS
	DmWsBosI8xC4aXpyHY3OqgEoJzK+42zxNgpSSKpwqVHy2fNmeA5C2cv7V6rMfwVA/ZvAfOvqz/S
	3nQ==
X-Google-Smtp-Source: AGHT+IEPkERz80TavebKf8h6ivCdraONOXoxyZx+85NntRxFKBy5lPixdFq9EghEr+xMMbOlv4i0i8mXE/M=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:8b87:b0:6ea:df4b:86d0 with SMTP id
 d2e1a72fcca58-6f69fc55137mr43971b3a.2.1716339603118; Tue, 21 May 2024
 18:00:03 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:56 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-11-edliaw@google.com>
Subject: [PATCH v5 10/68] selftests/clone3: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180009_961543_3FC6120F 
X-CRM114-Status: GOOD (  10.58  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
