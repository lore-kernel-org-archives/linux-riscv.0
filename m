Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDFFC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=bnQTQ2F8OhRUF5AGSdPKRqIqUJAnyXFGEgMSAalNtbc=; b=VnWbrjIa+MHjINm+CVRV+mxFuY
	sEqJFP4lTNijKLSZTxSBLnatC2pDdBJdF1d1Y69DZT8MMPB2a31TSpHuZCQp1ARouYxmyDtZ6NFeq
	57kC0ZX1VjyE147BnySE82O55oK8HuzeLon+j9NBaevDxt7JMaTUp13VmWOzcyav+nAjQo6Ul3yfi
	yux3D4C7hwmcgQp7uygB0Mw75auNAA46MWYs/rWOGBrcdrslrjIOKdrQRm7TSeFkthO1v5G1deRiU
	pv0/jrYDBPSEI+e6MLCgBxwYtzGHxbsLRPiJT9Tvg9vuSeJFRtdJtMvcwmNqu2+QZUKhhW+L8PDqr
	Ty7gN7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59wi-00000002aie-12Pa;
	Thu, 09 May 2024 20:00:52 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59wd-00000002ag0-0ykW
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:00:49 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61be4b79115so22749657b3.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284843; x=1715889643; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba6gtNWy+5dDG4FkE5cayyoNwuE5iBhkuWvzvH75i1U=;
        b=aYPEROErx4+rmpR15EDZQ8Xm8anUNy3pe2EEepvhRarg6n0FLsNuuhhwR33EJvOlLI
         Jl2nArwF+575m3YIyEwP2SJPyHu1N1jdhSBMkJP4/jiq82b2tz6sc2NHnfUhz8Mnq04N
         QGIfNqxUiBWhWL0NqPPzCnnVFAGSKNoaiE4Y0NN+PuppWfis2dE2zCqILnV01VNXdpzK
         iY0KronJdC56S0cogWyd+hKjgIdsPc1GNSJEc6NdcBQr+TPS6ug5sqOtOZU8sPd+4dzL
         Acm9wGjhZydR1t925DiPaRq47EOobWN9JxmgJOwVeqfuWaTMdjIrYS4t2eKIZjnq0wAp
         NTPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284843; x=1715889643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ba6gtNWy+5dDG4FkE5cayyoNwuE5iBhkuWvzvH75i1U=;
        b=aaA1XNWj+60qfg/ojeaW8lBPlwf9hVffXNVPUs33tFP6svQugeH3V32cTO7IvoowyW
         giYYzbvgVNWoPjJ/P787UopS/8T3CkePKi2PBGaNOgwBjOHvTlXQ/w8W4/U2QLctoFVm
         ufwFLvIh6h+ZaylG5rNvO0mW5HXt9JX8bSGfdwSFcVAjX1UApRcCWmKjPCHDWfXc4wYk
         sk5xT/iVV78UwTF0i/tyGlx9bwwXBynyMTn3CrWTRZsQpbDHyzfZSPHYmAVIY68nMnGE
         vhvMoBS1jeZ7f2ERE126gEY3l33If/JnktHA8ZvRIa1iWTaMutPNm3LuyhgPa8EG2jp9
         xEiw==
X-Forwarded-Encrypted: i=1; AJvYcCWlbk3kHjoNyQWy8OxdUJrCZCaoHQEKnn3MxzMY13vDf8TCD/COMtjZr9eS3i7vg5uKiwy1BkglxLx/7HupciAqQlooh9b4jkxeXXiLD2w7
X-Gm-Message-State: AOJu0YxeEGPNhFDortClbOqAA5o3wNQs067fddXbsQ8s1x7LS/J3OWTD
	/Wmk8Tx/9m2d7r9XJgwvFYBhqK0pelyhhqCdbv+SVVKP99pT5e3nb6/+uSs1gLJ7an17rZJqe9q
	y9A==
X-Google-Smtp-Source: AGHT+IFtxzWKY7VhIBdVaBt6o2fKuOgK4J0Sm4jxWWsiePPAsW3qSwIRHpAtz3W+/n8cUj9FLINB0ruDjug=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6f08:b0:61b:e39f:143b with SMTP id
 00721157ae682-622afd84a02mr1771287b3.0.1715284843538; Thu, 09 May 2024
 13:00:43 -0700 (PDT)
Date: Thu,  9 May 2024 19:57:53 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-2-edliaw@google.com>
Subject: [PATCH v3 01/68] selftests: Compile kselftest headers with -D_GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	Edward Liaw <edliaw@google.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	kernel test robot <oliver.sang@intel.com>, Mark Brown <broonie@kernel.org>, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130047_405284_2E252D72 
X-CRM114-Status: GOOD (  13.29  )
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

Add the -D_GNU_SOURCE flag to KHDR_INCLUDES so that it is defined in a
central location.

809216233555 ("selftests/harness: remove use of LINE_MAX") introduced
asprintf into kselftest_harness.h, which is a GNU extension and needs
_GNU_SOURCE to either be defined prior to including headers or with the
-D_GNU_SOURCE flag passed to the compiler.

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reported-by: kernel test robot <oliver.sang@intel.com>
Closes: https://lore.kernel.org/oe-lkp/202404301040.3bea5782-oliver.sang@intel.com
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/Makefile            | 4 ++--
 tools/testing/selftests/kselftest_harness.h | 2 +-
 tools/testing/selftests/lib.mk              | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/Makefile b/tools/testing/selftests/Makefile
index 9039f3709aff..f0431e6cb67e 100644
--- a/tools/testing/selftests/Makefile
+++ b/tools/testing/selftests/Makefile
@@ -170,11 +170,11 @@ ifneq ($(KBUILD_OUTPUT),)
   # $(realpath ...) resolves symlinks
   abs_objtree := $(realpath $(abs_objtree))
   BUILD := $(abs_objtree)/kselftest
-  KHDR_INCLUDES := -isystem ${abs_objtree}/usr/include
+  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_objtree}/usr/include
 else
   BUILD := $(CURDIR)
   abs_srctree := $(shell cd $(top_srcdir) && pwd)
-  KHDR_INCLUDES := -isystem ${abs_srctree}/usr/include
+  KHDR_INCLUDES := -D_GNU_SOURCE -isystem ${abs_srctree}/usr/include
   DEFAULT_INSTALL_HDR_PATH := 1
 endif
 
diff --git a/tools/testing/selftests/kselftest_harness.h b/tools/testing/selftests/kselftest_harness.h
index 7612bf09c5f8..31b2c70a2be2 100644
--- a/tools/testing/selftests/kselftest_harness.h
+++ b/tools/testing/selftests/kselftest_harness.h
@@ -51,7 +51,7 @@
 #define __KSELFTEST_HARNESS_H
 
 #ifndef _GNU_SOURCE
-#define _GNU_SOURCE
+static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
 #endif
 #include <asm/types.h>
 #include <ctype.h>
diff --git a/tools/testing/selftests/lib.mk b/tools/testing/selftests/lib.mk
index 429535816dbd..3023e0e2f58f 100644
--- a/tools/testing/selftests/lib.mk
+++ b/tools/testing/selftests/lib.mk
@@ -67,7 +67,7 @@ MAKEFLAGS += --no-print-directory
 endif
 
 ifeq ($(KHDR_INCLUDES),)
-KHDR_INCLUDES := -isystem $(top_srcdir)/usr/include
+KHDR_INCLUDES := -D_GNU_SOURCE -isystem $(top_srcdir)/usr/include
 endif
 
 # In order to use newer items that haven't yet been added to the user's system
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
