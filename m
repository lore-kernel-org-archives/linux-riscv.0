Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A030AC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+WT3a3HbsKBmrprDGEiDktExmi/H9WVx3cvO9nvALtA=; b=oYN65ffSLUs92bj+AnORRB4ESO
	2BNtusXoudWYed37sykIulo1gYA8Z8FEhAW+lcWZst0TNBSpPdY8Ah0ipkewOXN8IYVo05+tMwFuH
	2TCISK37wjVaIA8oAqx9rLdYSPDF0gaGoaRUDwoT0Gg60brVkMW8BfPeqESgqGvDMxYc79d/Ww2r7
	98BJxOqCPU6O4dydi+3bV3oHq5Eotrs4Kvuo/9pzLayyuG2BCpd4kdbgzYtejd9LTwutSLudCM9tx
	It/WzJbWhT91iRRFQvyKO/6XFeWP+9cYpMXOViSZb9l9t+EN+q0jK+gRw7wphocxOLLQF41G2ojNS
	nb1NXSXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqB-00000003NHN-0dbN;
	Fri, 10 May 2024 00:10:23 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpj-00000003Mt8-20kT
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:04 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2b6209f5246so1426273a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299792; x=1715904592; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tuMq0VwTGU6ryY2Jy9N3vXpEbju3toV+EO4EgzSUctQ=;
        b=MhQwlkRaETO4+5FXdqMkuyhVTBVHSzCWxhN8f5uvV1GUznlAhaorg00/2SeiA+75yB
         gSXaFIz+cXJK+MBU1mmipTz9AjYILaun+Vb5lSDLnOPAz7z+7Z3dzc8CJ16bjeMFzB8o
         U+aX2t48BtDONxfZAHv8xWwKZOqbDTDP0Wx6tkK7tbGRQvBKbIMbbOnuslyHwuVjrxg1
         M+A25WilP+2WdCS364lwysGa+yQE+AijAFaYrSo1zBqY9Gt1VjFmXXWRNxXvWQRQLXvJ
         i8pS/TDO8vEShMTJPUwcb9giUiJpzdzTmwmihSKUfVRzId9pJB3up+L03qC6R7E/Vb6f
         lNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299792; x=1715904592;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tuMq0VwTGU6ryY2Jy9N3vXpEbju3toV+EO4EgzSUctQ=;
        b=re6slMIgmM2FlG+GAy6AP9vRRQG2JwNej1HkRuDwJPRJt+Ja+Qo6u/rUA50CVb+hKY
         Fjt7cucot1Kg7QntJ1su2bVLvz5l09XuUI0QPgHZ1vduz+OfFfmKfFdfUdIokHkeftt7
         Ufq5K4UED8QjXD1x1iyQinFunfobg1std3Wcwc5OSD9HU2GMkcc/vW5wtGXunduDjMr4
         uUxJw2eIbj2uCcU/nleejv0s8sVabiOKi0dO3IHOuOIilTO9BiTQi+1Rj5w6pd7KnoEd
         hRbeS0a5a+njZqBsHS/JwlHXxAaxouhE6KKwhzr/dcN/jHE0MdDv8KdOeMg+bL/sft1k
         qRVA==
X-Forwarded-Encrypted: i=1; AJvYcCWIgn1DmICBlOlh+Z/urnDvnVI60GILunAXaxIZcx2lDH27q/5cDkHho5ZYPnyKiGzOctpw+pAjlh8ESunRUYyB1lITxsAMxQe63ljIJddd
X-Gm-Message-State: AOJu0YxpByliIipP0P9iPCX1AmnoOiU1jbYXz+IsQhOma8N3cgE4tuqe
	UrMP7W7C54YcmelsKykGmLhiXTwZmCMC4jyyXjpbuNOStPmV1v9BGge9qk+Ng+S9YwHb4E/M2n4
	YqQ==
X-Google-Smtp-Source: AGHT+IGy3rjskMzZhJoc6HJMFO9JT1FQP2T4mP9KVEwgoBctPBXhbpLR3qUquXuPkPY8i9uH3imRrzXSEyI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:a082:b0:2b3:c26d:4589 with SMTP id
 98e67ed59e1d1-2b6ccef6e35mr2868a91.6.1715299791671; Thu, 09 May 2024 17:09:51
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:33 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-17-edliaw@google.com>
Subject: [PATCH v4 16/66] selftests/filesystems: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170956_111495_1DBBE405 
X-CRM114-Status: GOOD (  10.75  )
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
 tools/testing/selftests/filesystems/binderfs/binderfs_test.c   | 2 --
 tools/testing/selftests/filesystems/devpts_pts.c               | 1 -
 tools/testing/selftests/filesystems/dnotify_test.c             | 1 -
 tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c  | 2 --
 tools/testing/selftests/filesystems/eventfd/eventfd_test.c     | 2 --
 tools/testing/selftests/filesystems/fat/rename_exchange.c      | 2 --
 tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c    | 2 --
 tools/testing/selftests/filesystems/statmount/statmount_test.c | 3 ---
 8 files changed, 15 deletions(-)

diff --git a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
index 5f362c0fd890..fca693db1b09 100644
--- a/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
+++ b/tools/testing/selftests/filesystems/binderfs/binderfs_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <pthread.h>
diff --git a/tools/testing/selftests/filesystems/devpts_pts.c b/tools/testing/selftests/filesystems/devpts_pts.c
index b1fc9b916ace..73766447eeb0 100644
--- a/tools/testing/selftests/filesystems/devpts_pts.c
+++ b/tools/testing/selftests/filesystems/devpts_pts.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/filesystems/dnotify_test.c b/tools/testing/selftests/filesystems/dnotify_test.c
index c0a9b2d3302d..05367a70b963 100644
--- a/tools/testing/selftests/filesystems/dnotify_test.c
+++ b/tools/testing/selftests/filesystems/dnotify_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE	/* needed to get the defines */
 #include <fcntl.h>	/* in glibc 2.2 this has the needed
 				   values defined */
 #include <signal.h>
diff --git a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
index 65ede506305c..9bc2ddad7e92 100644
--- a/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
+++ b/tools/testing/selftests/filesystems/epoll/epoll_wakeup_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <asm/unistd.h>
 #include <linux/time_types.h>
 #include <poll.h>
diff --git a/tools/testing/selftests/filesystems/eventfd/eventfd_test.c b/tools/testing/selftests/filesystems/eventfd/eventfd_test.c
index f142a137526c..17935f42fbc9 100644
--- a/tools/testing/selftests/filesystems/eventfd/eventfd_test.c
+++ b/tools/testing/selftests/filesystems/eventfd/eventfd_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <asm/unistd.h>
diff --git a/tools/testing/selftests/filesystems/fat/rename_exchange.c b/tools/testing/selftests/filesystems/fat/rename_exchange.c
index e488ad354fce..56cf3ad8640d 100644
--- a/tools/testing/selftests/filesystems/fat/rename_exchange.c
+++ b/tools/testing/selftests/filesystems/fat/rename_exchange.c
@@ -6,8 +6,6 @@
  * Copyright 2022 Red Hat Inc.
  * Author: Javier Martinez Canillas <javierm@redhat.com>
  */
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <stdio.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c b/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c
index 759f86e7d263..b58a80bde95a 100644
--- a/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c
+++ b/tools/testing/selftests/filesystems/overlayfs/dev_in_maps.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <inttypes.h>
 #include <unistd.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/filesystems/statmount/statmount_test.c b/tools/testing/selftests/filesystems/statmount/statmount_test.c
index e6d7c4f1c85b..c8944effb780 100644
--- a/tools/testing/selftests/filesystems/statmount/statmount_test.c
+++ b/tools/testing/selftests/filesystems/statmount/statmount_test.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-
-#define _GNU_SOURCE
-
 #include <assert.h>
 #include <stddef.h>
 #include <stdint.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
