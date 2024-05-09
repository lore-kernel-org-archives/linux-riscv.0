Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F070C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Tny6/N4INZZ4ODoMWcvxISEoZ3zyH3pwgqaIDQ3Wv4g=; b=YWFoozzfLOgHKexIsPedca/VIZ
	6kYabWr6MUXSOJ+bqK0ipTSkFQr/wG3ShN7P6Jh/KvBKS66nkQs6QK6zaRyQwiutj7DmUTL/wmcTd
	v1Zg5fUUbv40SPW3XQMwwFFdLtMwvAoI6FrRwGrr7K44mQ/gTXWuZWbo0btDivqfznNTRxrPUN/EH
	dRwet3VFACXtvfiNNTaeIsDfymvS1uBwOuVvdmCqrYMqW+3MMrfrjoLmPPsee7J3V9SlYGraqZoJp
	6WfddklZF5wa86AHujwJ6mh16/D4mnRjKJhzboIkIrm8ene+VNyYKik6QLRR8L9ozzXZByo0nqCvV
	Qaf8NEkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zT-00000002cpZ-30JV;
	Thu, 09 May 2024 20:03:43 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59y4-00000002bgs-0Nvd
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:33 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61c9675ae5aso20633967b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284931; x=1715889731; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Di7Erv/XRsHV/bMQeC6cRhGef1PHcLc0ShAwyYHpOVU=;
        b=CTr3GdUPw3dOaFYl9zXbPLCoFjx8Jk/QkYHZiJi5O52zT8SPTON0orOlJekBbw6Y1+
         o/baR/CObruX/8guQLQeYsxVyYfeBzTYH9333JEZLoO9PxacQAp8snBE5F9RQkT7An7Y
         IFgP2Ts9SyAcCfd9v6v/UVjmQ3wuf9JyLU2dOBxQyIlq/e6arqovOMghwiJ5huebKI45
         itFnQjVI7/2dNZET5t0DjIoZ4WHorc0hc3WmTZszU+gvr/IgIs4vxA3T+B2AQ6etEemR
         5aPkKlsx23L1xsCxelGkoBueTh63Fo2IVXPuylZ7dRDj8b5tfp3KyFz4oRrdYk9kKGfE
         9uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284931; x=1715889731;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Di7Erv/XRsHV/bMQeC6cRhGef1PHcLc0ShAwyYHpOVU=;
        b=J3+LozJd3anydlU71pz7i3cP7Rok09WIT6Nys7rtFimIyjxujEpuYFtp5gIsjI4LNg
         Pa4oFwZ3h7944dx6Aap90Ynl1cyZMyJ70OZ2v6UXiRzOfHKRFDNkgkGk/tG+xdPOprRJ
         IjDHAB3wrW3YKABgB13WFeez8L2TwfV4IR96scCc2FV5mPOCMYGDMpD1YlRjaeaQG96c
         SkA9MqgeYRm1+pzRx3WzDf4xVIKUbqgwpPXUo1Y9xxrhfGSv8RjVAayYbAs4cKWtJWAj
         TJn9aOkaiPfbbH3YdmtMVyzs73D+odDxb1XXHEJ9MWSFp1netbdl21J3c8bzkOQSIL0/
         jHVw==
X-Forwarded-Encrypted: i=1; AJvYcCWGnVdjoGCyjQT7ITEFMUPGcvA1nS1nvianiFlOr+zSNobbBJIxcMa5uR8HAmE35WZbIiScgUUQEEscAQauVK5R3WNbOGmo8RGBlfnUSlYD
X-Gm-Message-State: AOJu0YxZe8UXSlx7M3rT6YlA+8YUjBp3ZT66zZiDyh0zAwA34IPHDsgN
	/Hzhy4YSA6480LZQ89sO8A2thqorsLID+0u9uStvrNJGyRLabnobLBXyQDo4ImSSWFcgYl3XVXJ
	9Fw==
X-Google-Smtp-Source: AGHT+IGzNz2UjieyVL+13PppSOIoCCWtRL0jFRrJh3a18AgOw9IEjMhpDthMiXvHB10Rx4IrrNB28zpbHTM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6d0c:b0:61b:e6a8:a8a with SMTP id
 00721157ae682-622affeb280mr1228217b3.6.1715284931252; Thu, 09 May 2024
 13:02:11 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:22 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-31-edliaw@google.com>
Subject: [PATCH v3 30/68] selftests/memfd: Drop define _GNU_SOURCE
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
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130216_555981_25AA2613 
X-CRM114-Status: GOOD (  10.99  )
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
