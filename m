Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE4F3C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=D4Elhf+AI92Rf7U6ElIR97ftDTx8zv7FL1tp6XYdDNo=; b=rr/uU0038NRIQpwKh0IOrcUbhH
	O1x9Dzu1rxa1zFEUOiDh6YFikGfTqtaUefjSKw47YEbr/vjx8qrK2cdHA7YGX7qu/1AjSNZL1so3d
	KdvzUimXhassR3MEh8kbcww2QoTEOEF4CiO19xLiLIqwPfgsIH7rD/vFS1M5++grTZzLlJTOGpsJL
	OQ2hf/BNYqbbsEZQ5rLe0GRShflAbbpFbQxa7QNWCOEyLY8clT5D4TBXKM9cDgEcvmYXkGdgw/aPf
	Buc+7aEHmbCwxtHf7irc/VX1fQTG2V3/cTEgiz5D9FIm10MFhzPIrVpZQzfWaYFRk85jD+KxFg025
	HMfPzXzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xn-00000002bXT-23uW;
	Thu, 09 May 2024 20:01:59 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xD-00000002b0l-422R
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:32 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61bd64c9eadso18775007b3.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284881; x=1715889681; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5eQ6XGkPYgeissWdzFADaWCQSCh1US1lB39uUrru0zE=;
        b=e1ceVKoyIMe8YYGymXCZSjaUGREZrT1jGvqT5iaKfwDHU6tfaH6DLiZzHL/t1JZaPV
         ecVRSGNsa/rtGRpFy72tRWyqQqLCRz0N5qCNRcVKGv9cQnSXhz9aIQKCeUykqUOom4NT
         ulPN/yqtda2Npn12EmQvjTF+RxVNn9ioxttfoK1TrzAIV9Bd2EIJ61xzC3bBH2olfXhG
         vscxirJddld7dKU2dyjigWBxtHEJfVPUquzxeZ1giyTY8JATlSn3O+zFAbHAmXLIDveM
         dT4zZHq/YqmXt2EldP4J5vuenbhh16mkhxTqoF+ktD7ROk1bqr73znAJZVRrFBLRcnSl
         sNWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284881; x=1715889681;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5eQ6XGkPYgeissWdzFADaWCQSCh1US1lB39uUrru0zE=;
        b=p6przOrMgla9pv/z5y8+1VbcK6gM6lXME4NwHC4LUX2k+Qq+TH+/z8ew3Gl/I5eUJ5
         yquX6up6HpGPtpCgeRkoeCCVC1++eJQlgovGvJwFFbGdyYetowomyRWKt6oEnXfAe1vG
         ehcBDExVeuCL3qSNw313+Rg8vVRxHy3oE1WGZcLHyXOShNnHNxVc4pCT9inJ5w5VWNlI
         YH3ghR+qYaL4tOLgoHX6Zz6vQBhVAnhf/MqAuZ2lz2W+b4jM5B3kpqqt3EZXSLkhoH8u
         uiguj7n34GQq8NUuzbjEdVCOUSNBuRWouxGSWF4Glo4uWPmYnRiMWZ4HbWd3eXmcBT4W
         cj6g==
X-Forwarded-Encrypted: i=1; AJvYcCWY58FO4uc90twfzI2etKdwSJ5cX8bC7pLvdkqdCgVWdMicID5dT0AXr5yxyF5oCPVVREv/GtcjA9/fmP37Ke/A6rw8d5H3YXXABwcjVP/r
X-Gm-Message-State: AOJu0YzjxI9OsTWUxWv9Gca8ujxDO1IzkyYo7uTKu36YfqwzgkC5/B50
	yi929b/4hYc74JO6lIoDW5w7d6WGHHEzbTRb2e3YILh3TEAb1DuHWKIig0/VuKLHWHC2jYBECug
	IoQ==
X-Google-Smtp-Source: AGHT+IEKmXN2OtUcDH29uDFP6MEwl8SNHUgfbX774CgKav0w50QMF09nqWEqskXHszGXL8AiwTeDuk75cw4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:2e04:0:b0:deb:8bc5:eb5b with SMTP id
 3f1490d57ef6-dee4f2de0bamr140844276.5.1715284880822; Thu, 09 May 2024
 13:01:20 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:03 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-12-edliaw@google.com>
Subject: [PATCH v3 11/68] selftests/clone3: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130124_561768_03F39158 
X-CRM114-Status: GOOD (  11.40  )
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
