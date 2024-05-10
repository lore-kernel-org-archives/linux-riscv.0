Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FA40C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Mq1eDJ1l8vv375UNA6d7cHJjMNyYqsBZkyOEZL4CnLc=; b=DeZkFW6CiGtywvK8FGPuhnpMKl
	oaHuYFAYV7O4skk0mjf6E0PLekGP5C1Zf1XP8Mvf/C5fADsNkVwaRjs4T+x/nAl0bjh2bMSTXpb+q
	V/Tjd6UN0JZ7Lf92XTvJIZ0kVdWZmIN/CT/IXVYbS3By250oBHfpsYkcJqyeCTdnAaiuqE+cFda2u
	vgVp9N+XqMPiaxGbN0o8jEruN8fNvlPLZthQ7JJxaRLJ8QtsnAbxovMIe+VecXF6DLZNNwgpfjaTZ
	9UjKSZQHNK7EyCVqzXsS67eGipImmurfWhl65A97ipb0S/BtQustYDDs17LtZ5/tBl8lYNz4gJgn/
	f+PVrcrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dt5-00000003PXr-387U;
	Fri, 10 May 2024 00:13:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dro-00000003Od3-46EN
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SRNRq1qF8bny7SXtkZUZA1yyodfV/k2JiC2RYv7Zcwo=; b=K2HRbSBz/RaMeaJiwNs1fKdCwi
	VRKuOiWCkNhK/iIseaVTRLFSWPpMhHb45ZTd9r7VfOdwcJQSya4jQybGE09deIeDlPbRh1dhbbECz
	X0vkWSVCh/viOe2puJi3UtdUQZLdwEtkcSS4TBq3JtrtzPONqR0QRLb/4mGfxxX4BAWOCILh2QfT4
	OW7GtrM1Xuc5vgiMMY2xZA/psmO2grSIxVkeCWX4IgAdsp+WXQtmkfPgH2SV2V3eVObzuLjr9i/Do
	gDD7xx/dbrUmJL5fwO2T0rKnCz9RbPXtQZ84f+ElVmVXkggUoMUWgtoMo6vrrnPq9UjMQXM4v4E9H
	MLnY4AlA==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drj-000000036QR-2YHG
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:02 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5cdfd47de98so1452715a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299917; x=1715904717; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SRNRq1qF8bny7SXtkZUZA1yyodfV/k2JiC2RYv7Zcwo=;
        b=vY1IWf7Q0IBjKMsUurOAEq082or7EgzjZH5G28f944gKdnYTSqGlv8WjEPRI50HAo0
         RdPeXsBCDmzIzkK0sqpGdzyiTFLfaJkhUu/HEQyzMCmJQ1TxT74hyxbekW18R1BwXqXd
         oomDbxJFqpC2TlZzE9x9ZHU8bGlwD0aLzluNsbWr79cIuIexPLcQqDpJ1AIFLWJ91vjD
         8HcS32vhNDn5ykNItRkNiasX2KqFcIfbGi2IwKKZrd/RGe2x/V2NlldgVewl/Hn2Ct8p
         kJ7Us19BIjsS241lzgrorK16PCLzf/XwL+3A65pWChgBlnWJD4WDqEL+75/QpV9CmeKq
         r8fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299917; x=1715904717;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SRNRq1qF8bny7SXtkZUZA1yyodfV/k2JiC2RYv7Zcwo=;
        b=prEatxUUFCS1gr1T4rRcT54SZCEsjAUClm/v7G1+Ycl4/Kb8NSl/d21UpNKZM71KB3
         FtWdQxrPXnKUJRbe7/EA5RQdCqYYUFdJlYf9yme21JVDj47jSL44AtYahYpVHbWNzya5
         9L2TUiDOVpGbw6xLMuXqcfcEtX4cphbHDveyt/7qLCCRwWBtT80NQYqKe7QZnSobrtof
         6vzhEPnM3cmlYJOR7ALTR40u4BlqlpmDP0T+8rhCPHYsdtCu19SIjPyUSRuGCXaqJRBH
         IWfir0Qr2jnIxqRx+PRi/zVablMpIt06b+0aNnZxTyjyhrtJdb8DXyb0LNVj/s1g1bNI
         yBEg==
X-Forwarded-Encrypted: i=1; AJvYcCVB4biCOSGQDaSjnCRhuHhAe0oY8pRfdJflj7+K4Ir6QZlZX8a+8wJmLckReB45MlPIp+bQH+asGYTfN6xtJX6n6iIDrnYO8KbeIr4sMIpT
X-Gm-Message-State: AOJu0YwaLIxM3BxyHDGHIpc1LPBslbvWFmHNfFx1jeWa3OaoLILQldb5
	5YsUs9pjn1eKIb236W9lx1r8SEPqsNZXegP3YU86NTkQ7s2rVu0Mf5PYGu8uK7vL5P2+wM6sg1S
	xpg==
X-Google-Smtp-Source: AGHT+IHJ/Z8yTZVEty1N/QdZrLUX087HrMPb2W/aoyS4qCIrsBTTBdEKswueVBWbPmwhLdiVqvZ/UOq9Jdo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:503:b0:623:2c3c:ab09 with SMTP id
 41be03b00d2f7-6373451a8bdmr2786a12.0.1715299916621; Thu, 09 May 2024 17:11:56
 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:17 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-61-edliaw@google.com>
Subject: [PATCH v4 60/66] selftests/timens: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240510_011200_316851_89F4FDFB 
X-CRM114-Status: UNSURE (   9.03  )
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
