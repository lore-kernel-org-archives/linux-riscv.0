Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A612C25B79
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=C1AwIL/H4WpNwDpjtFPoSbBShrN5WFkj/HmyU//ieyQ=; b=Jx9IJl7BUv+MhSNQvHTpp8255Q
	SNzdq1C84+NtL6sFFZ7Y0nxkEt9eNTQa1deNX2g8QTIWpw9G4ROzvX1/uSg1+xUDRcx78uatF63TO
	ckBYQeEkdj9w9mMv+ravXx/xsUNmuNC9ltvht+VXAAyvSE4GiQj+VF40fKKdBr1evAe0XQz0gk3ws
	1Wookmc6W7cn8fTSMCTsspzSQptE6YQZvNeI8Bs3nio2HO3DRmcLXecyTCQWZwXqDPwD1nXMVe2Ov
	I4KOvV/aSWJ2EjxkvyAb+rIR2543H0gNmBMYRfoHER/J2zV3TVF80BSTfZe8pF4AXmclh9vm+rif2
	VTifsG5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ess-00000003an8-3f23;
	Fri, 10 May 2024 01:17:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqI-00000003NLz-3LB4
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CIHvn5ASgOV//V6BNzY0OrviieFVRwnd5gLwyJxh1+U=; b=ONjmCaJ+IGk1A3d2zBiire8J+r
	OYhbd5Q8yoONXBDGikZcIjEAOakfv5DjuRPyXFUEpKVg1OrmtfBI53x+SiI8HY4imwJOeOcDYgZbg
	0HV3QkEmsTp6H0OEKN3c2+eMWK91h/xtlw6tC/nk2dDgTcLAnzxqV4xep6FL9kDMsiLDYze76qHFJ
	Nmb7SDv7xbN5kQaL1TJzvLtXNbWLUOGps8Nmg/hAUIZ3YX7bPv15bdtXbKrDZg8dzV2wtgTnDjotC
	ABHpvRbAGdwj7fOowlHFikN47N5eZ2UVUOeWSrLWS9n4lXk1+nMZmwaNsMXF5swSZU3RdRzYgXv71
	p0AmEXOw==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqD-0000000364V-3K8b
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:29 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61be26af113so24461117b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299821; x=1715904621; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CIHvn5ASgOV//V6BNzY0OrviieFVRwnd5gLwyJxh1+U=;
        b=ikC4TAzM+3Mv7WfwlvPvx1OHel8zVbSAxtlVfdncE1YbR7Qq/ki7wOD4nIsjoULqG9
         6hBDXjAZ3ctXA+mdGVxecBzzdFFaMCw2Q4rtmMGdIhXEK48W25QPLRtEXyNArymas7hM
         JvEDST4h2h29JcPvbfLNpoO8opBK2+Ei14BoGq2JQqnOoyQpOLnK7C7gi4PmjFULfUPg
         UKiRr7SKlRDsxG+BL/sfUO0CBOxtwzd6DPOcAJtUFzlf1VoVmmkpTZ0ZHmzljoni8Xlq
         zR+Wdf7w08H+TRZqC+9anh03PkF+2NAIibfpZEQjFqNBgTYKl6zX7sIbN3/2o6+E2ql8
         UdwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299821; x=1715904621;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CIHvn5ASgOV//V6BNzY0OrviieFVRwnd5gLwyJxh1+U=;
        b=S4fn/XiVcbB6GBw69d45tgwn+6Iea8oQoD+TFHlfEEzNPq3YQNzwcz8Eav8bI0rV9e
         Vl5pUeZlX/SB1fKxT/zWtuOoGYw1SwtyAznaynagEYvk8orVs2UWBjUNjKTXPSStP/na
         U+Pn+wIcsortZ1XtOakNhff83RtGdWXa0isD5m/OTXcxoP4dQ6/35+qPhGf2Eubgvb6m
         ULIL23dKISIIBf+YyydWqj789VYnC8Am/csHJSPLoMJt8w8cC08jZ1c7KGIYStDneqhG
         WV/CoDTIGnb89zvXmiWGPRhUUhma8+2SzThft13x4tGJ9a9ALPnW50FHy6a134ZHuL0F
         s0ug==
X-Forwarded-Encrypted: i=1; AJvYcCU7N9bNt3DrvJ0U+iQ+yYPXUc8HREACUsM+6aHL2dUV8d7tEV+U11UFKqm5gVbEC9CODeK29/xxEWNlGYpBAfoNoA78cpVajRPlpPvPuvy4
X-Gm-Message-State: AOJu0Yy0WNnJDgZcjOxgoMCc/dHuZHALF0Yw6e6mviO4+zhFazpZ9RBm
	wFEwlXDSTqP960t2mzF4DitoTXY9P5gKa94V5hysJLfhagxadS+j1WNhhX7/1EXWYZycjk6p0Ac
	Q7Q==
X-Google-Smtp-Source: AGHT+IEN/ClfY6d0zLv4bo9ANzz+JtSyd/QLYeBdMlNaP9/cMcvp47wQjGpGOEr+YL62OUgs3v0T3C2jYqM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:4b0e:b0:61d:4701:5e65 with SMTP id
 00721157ae682-622aff90344mr2703587b3.2.1715299821016; Thu, 09 May 2024
 17:10:21 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:45 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-29-edliaw@google.com>
Subject: [PATCH v4 28/66] selftests/memfd: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011026_133553_3A191AE0 
X-CRM114-Status: GOOD (  10.11  )
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
 tools/testing/selftests/memfd/common.c     | 1 -
 tools/testing/selftests/memfd/fuse_test.c  | 2 --
 tools/testing/selftests/memfd/memfd_test.c | 1 -
 3 files changed, 4 deletions(-)

diff --git a/tools/testing/selftests/memfd/common.c b/tools/testing/selftests/memfd/common.c
index 8eb3d75f6e60..879d4f4c66fa 100644
--- a/tools/testing/selftests/memfd/common.c
+++ b/tools/testing/selftests/memfd/common.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <stdio.h>
diff --git a/tools/testing/selftests/memfd/fuse_test.c b/tools/testing/selftests/memfd/fuse_test.c
index dbc171a3806d..e35c6909f0bb 100644
--- a/tools/testing/selftests/memfd/fuse_test.c
+++ b/tools/testing/selftests/memfd/fuse_test.c
@@ -12,8 +12,6 @@
  * the read() syscall with our memory-mapped memfd object as receive buffer to
  * force the kernel to write into our memfd object.
  */
-
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <errno.h>
diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index 95af2d78fd31..ee019b57bb98 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
