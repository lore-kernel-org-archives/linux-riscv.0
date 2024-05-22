Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98BD5C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=uEVnBw4iLiSsAybp/zUzMhjsSpBhdvobe8SmYm+n95Y=; b=o1dQk3wsKVP1t+4Lm5yNMEtV/a
	2VK2dFLfJ3BdvvK6x+8WMNvd1cgUOC+d5aQJZOhTnrJ9DiXWsiaXVFsAWDUifA16LVnTg5h3bBGwQ
	jZ9xHv4BPTEWxUvOwyA/J4/PbGhulMSkJxOsXJdFDi8TFm2h16uQx8h4aWrDRWSwanzMnfXpzV9t5
	ee/4FyLtIWJuQu3SbM6uC7MndBdKBqdLAZzXSlXL/z5Br7D+vNKvUwXkhldXdvRTnGFnan4Hhjhzz
	um09OLvSmxupMtJGLiJtBb3V0yAjFRR3dXbSFpOgrq+IhBWfW6zTW35RMiqypaV+VMQi2chcHjV6/
	GAncA2QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMA-00000001U9R-0wX3;
	Wed, 22 May 2024 01:01:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLW-00000001Ti5-0IAq
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:00:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=FNG7YTq6wWhb9Gypxi8RkESHmvk+xQ9RF1yrdo51xx0=; b=ohUqDJPkrUkHlMmXSZksUMvAY1
	HL/SUb1aFo1MjaiNwRxyu/9bCTa1aEgrWoqn6saWYsBXdprLsimzg2TsNd0EgOSOXG2Wpt0btDmhG
	8vCcOHh6y1nvXRywkZtVUwZzcFVl/TlbvpTw7+DbSzshRzf7ECfR4oLTqtBNXj9OAb42+Bb2ySR3c
	hzrXxyU46tB31TOlIBrAf35YTaz/MmergfzGMoGMUTCRf0Tr2CEozuXLOhopw+HGX1p0vPTyKii41
	FCaN9V0bz8U+EcgbKTjeOdpNjPLaqH2CSbkcEYmOkBNj0RcRuhpqqaPjDgq68ga0jnFL3KpjGet0h
	//kOrLOA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLS-00000000All-2QrD
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:44 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627e6fe0303so2028917b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339621; x=1716944421; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FNG7YTq6wWhb9Gypxi8RkESHmvk+xQ9RF1yrdo51xx0=;
        b=zmOxN6b3Y838e7DpVgY6N737Z62jYXpIbiZUWwqqWXXnjdKMY3yTSHIDxr2fUoOWh/
         G3CzOgfilqKkmggIxYyi7/5u104AabqFQfjy07UB6KuPlmPD9E8iW9O7AMC+c/ivcEFP
         l+22PJoy4Psnm0YFd/pJBokJoI+rAc2QTdqckvtTbTkndJLyYboyB59OcriSs7KZTTYz
         I3V968O2Atddjp+aXaRXKc+HjGrnVlfC/uCBN1euebnag9VTtupgjSzMRVFD4RN4vxGg
         nJEbhCwkhz8OO0a1pMC8WHLrx0/9z08EDjdSsgy347ike6knsNEwOUjcAkzcgz526k9w
         cG+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339621; x=1716944421;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FNG7YTq6wWhb9Gypxi8RkESHmvk+xQ9RF1yrdo51xx0=;
        b=Vc+Cm+573nu66sglyyoC+r5/AXgw9mIOE0b90p4RL0laa9ywbkdu2FW0jW+FPulyKA
         HBpPdmV2ZuiFbe9YpW5FCr/LA0/w8jmwx4rigA1odj75Oxfd+cNPB4injnFIocJWTAEZ
         ADKUBi18010lZGAo1NpbVZsTIUHcCj7dTt4keShkFkIoPOAnz0IIzzezdVhzWesgzwuD
         w83/UOLxMjM+LZP0+GZNOGPXqJ6SV3prr/ijWSLoC9iTTMv+TrXJdGtYNIB+2PFAQ4On
         JEit1r7oHuPbvUSWhiRZxEYG9V452gly5EIlZrJ1ALx2donzAGosRWEMdv/TTsSn3H7O
         7MAA==
X-Forwarded-Encrypted: i=1; AJvYcCV0P7f1cNvItpShFEsCkM+VX6lUvmD+83Kk4m+rfwqo+KEcIO7oLgtTR1xSO32sPZu++TogFaylkzNptS/I+PHwBVlBdHCpOjT3IV5x18wD
X-Gm-Message-State: AOJu0YxfLI1rySRhoDL0GQjui5IxIW7+r6Dpq8qCK9oy8xdpvUeTDJ4/
	CHrbcLnCUQ8uFpN29lXDDUYSCOzBBQ40AVHoEfgET3gIZ8P9trmuDxam78Hl/o1kv9XA+N+Lcs4
	QKA==
X-Google-Smtp-Source: AGHT+IFg+kNLcHI3zR8m3BgWth3i4xmVSRIRYNQ+xFqcAnC0YttDF3R1CXo1S4GgHYpDInHmuGIdl6awE9I=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:2b13:b0:dda:c59c:3953 with SMTP id
 3f1490d57ef6-df4e097fb15mr225939276.0.1716339621086; Tue, 21 May 2024
 18:00:21 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:03 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-18-edliaw@google.com>
Subject: [PATCH v5 17/68] selftests/filesystems: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020042_656685_DC33066C 
X-CRM114-Status: UNSURE (   8.77  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
