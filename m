Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C719C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=7z8pppl1T3X61C08N/dckM56IMsAdZOjIxc7uUMuPTc=; b=xYVbjW+oTAe2LOoWQ8WGBcJvQO
	cMBLzsCqDOC9xCCXvysah4L5X/a9+Rr7zb4mCMfbU4p40VGG7/prPWrvONN1VcE80W6l2HsyRPv7d
	T8Rly9dWLfXZdit0AUsEjjj+czJ7fuJhDmixUGQffUAXc6XsnZHtosMvQjKTDWAlwHx6y7jbsZROx
	Vza+7IPmvzytlDSljaXnBu7HdURuv0eZAi9VRmhGPOXTUjQyuEEA/ltvaYR5mSVMXc+Vy2W5bWOYU
	IxsmfdUgNV4qvI/1EgkvSjHNRZMfcUUTFThTLg+Nnh0jsX9hF+OBqWSUkWHWTCYgUPOg98hIura5S
	lN7DxK0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zo-00000002d7R-0onP;
	Thu, 09 May 2024 20:04:04 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59ye-00000002cBH-19qo
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:04 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de468af2b73so2153710276.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284968; x=1715889768; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=DejFIYPZQZTsM/+LO58ySZeQn2kJiejmAm2sMCMuO7w=;
        b=HyBOylzv75tNyV62JCfRa38Bj2rI1nX6LWTUEpnjUKNRdqC+dgxty1jgGJ2mokf+7N
         /7n1Btl/T7nM1wLjz48MDoT0RqNTsQVtoc9gGqgApawWQc2BWVfBGs7Zpb9vAgm0fJVA
         nnl0QPx7fv/TD0r9ohL3HrsGGVZAX0RNZRg7Jj2mu4SJ9k2ktHqFmuO03RcOEUR1r7ld
         vl6JlapivS7usWIaON/Y8xnD557LnsT2r+cd2p0Y8970sUYH5JwU9OerQSukazzQrl1W
         TDofL7/XUUGhphfQuwQz0EaWhaA/Xf4/K/WRyTASDzccI93bWUKs8IpqnThIkyNSVi9s
         NYXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284968; x=1715889768;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DejFIYPZQZTsM/+LO58ySZeQn2kJiejmAm2sMCMuO7w=;
        b=Ta00XccSlXw1fUobYDS0vwjHyyFrrO/fbttYWVFlZ2qRE/ohe+nB8A7vp83jAIEH9f
         TnDJFH4VRh86DjL6NI+fHC1vRhT0TY8HaHYJqGhNtpfmOhDdVkP0n/AQdUtu/c5lAkZ2
         ibAkyLTeqtp5t79oRBTV3UuTBn+0ku2y8K/23al0lSFnS9MChMTRl5fKvLFfhqfMi/kW
         zlKPCCKAIaBY2F/6k8FoTIFjv31y7919ubAELaP2qeUs+9QhQ/asQ9vVn4ppOY4OPcqr
         Yf6oD2qZMyBww/gMDwEDKHls2Xk5R1DL8dpr2ce8i1U7BlhCJiJMkcJ4xfhf46DUuJBo
         pjdA==
X-Forwarded-Encrypted: i=1; AJvYcCXSF6BbtIwtu9skNegZJ1n569IAL/crQyvAvmzsGCy4Aa07aknYCTKEDmmJVQ+uC3EA5CZlwK0Yh556XujwhVYipKS9YmPOSok90zxCUV1h
X-Gm-Message-State: AOJu0YzsWXnjXRiqKBr6Y6blZB/e1dMZm961F2Y0z65kFBgjCNN2sOoT
	mRuJ5VGF89E4lezMa55SMjElJCa+OIkTqK5zc79GsXs0xTMn5eIslxBk4ly4l5uBPpEysOmExiD
	zvw==
X-Google-Smtp-Source: AGHT+IEdLp2VxpSy+gBCP+tFT6yMYHSt804gceq7vlOW/cOE2J14dukRIxLzbVA95cAChpE8hv9KqkAbp2k=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1546:b0:de4:77ab:5fea with SMTP id
 3f1490d57ef6-dee4f2d1110mr162718276.2.1715284968047; Thu, 09 May 2024
 13:02:48 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:33 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-42-edliaw@google.com>
Subject: [PATCH v3 41/68] selftests/openat2: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130252_806909_E449801D 
X-CRM114-Status: UNSURE (   9.94  )
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/openat2/helpers.c            | 2 --
 tools/testing/selftests/openat2/helpers.h            | 1 -
 tools/testing/selftests/openat2/openat2_test.c       | 2 --
 tools/testing/selftests/openat2/rename_attack_test.c | 2 --
 tools/testing/selftests/openat2/resolve_test.c       | 2 --
 5 files changed, 9 deletions(-)

diff --git a/tools/testing/selftests/openat2/helpers.c b/tools/testing/selftests/openat2/helpers.c
index 5074681ffdc9..3658722c889c 100644
--- a/tools/testing/selftests/openat2/helpers.c
+++ b/tools/testing/selftests/openat2/helpers.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/openat2/helpers.h b/tools/testing/selftests/openat2/helpers.h
index 7056340b9339..ecd20a3d47ee 100644
--- a/tools/testing/selftests/openat2/helpers.h
+++ b/tools/testing/selftests/openat2/helpers.h
@@ -7,7 +7,6 @@
 #ifndef __RESOLVEAT_H__
 #define __RESOLVEAT_H__
 
-#define _GNU_SOURCE
 #include <stdint.h>
 #include <stdbool.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
index 9024754530b2..51f1a7d16cc9 100644
--- a/tools/testing/selftests/openat2/openat2_test.c
+++ b/tools/testing/selftests/openat2/openat2_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sched.h>
 #include <sys/stat.h>
diff --git a/tools/testing/selftests/openat2/rename_attack_test.c b/tools/testing/selftests/openat2/rename_attack_test.c
index 0a770728b436..477125eb64e2 100644
--- a/tools/testing/selftests/openat2/rename_attack_test.c
+++ b/tools/testing/selftests/openat2/rename_attack_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/openat2/resolve_test.c
index bbafad440893..48fa772de13e 100644
--- a/tools/testing/selftests/openat2/resolve_test.c
+++ b/tools/testing/selftests/openat2/resolve_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sched.h>
 #include <sys/stat.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
