Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 621BDC25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=i7HulpXplZsVrb2QlNRIZDrgqMc/4UtYyFNMFZJhPxA=; b=Kxqyz5g2Ono5DRHDwR5KZiH+4I
	WltUo6YH78J3XxF5sD9sq7mwWasU00BUqLzvZiOF0emI8xbVlBOD1/YI5NyuXfX4CMzza7NfQx9bT
	cirbztsaXm6fh6aZEi/MggKKrvzp2zsOvUs1boONc/YTyNrH91XfJC688X9C2X/Jl4oIuSg+wFFs9
	pAfPbDxrpcM6tklx3yS5vO+x29Ki15p0Ok58T9AFyoCjFnqkfT5cuHUBm/8ZeseImfw4iR6jZgCtV
	dFAxgpd2mobdoN05fx0xE6uqiSD4ppbG/695LHMzLfVRUG77V/y02oyGa0t5U86fCBrKx77hoFL/D
	fYc545ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xG-00000002b4y-2uh9;
	Thu, 09 May 2024 20:01:26 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59x6-00000002aqj-06eY
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:23 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5c66a69ec8eso1031183a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284870; x=1715889670; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I0i1BJHEHfvwlJBsnQikq6I2sYMm72umBUDvidl3EP0=;
        b=y8UlZD0d05VtOnsM4DdUhfTVIYpclI1P57v1IIi25ge2phT0GsgWXQMZtTh7jOfkmJ
         a3bUCtndA/OQF/W6kTVrPifWUVviCSIJkE0ocu8SoZoMV+6QGyuC7pW3gf0CzwAAqMcA
         uR21U5ubVHhqDYKG2Us6D6LuTkJRFjg658odqnqbxn3C8DIPK7YzA4BVQR0RG3wvw3+/
         oZiWaqT/ZhHyn5BgHxKuH/OG8SsYXu+ehMhMakm0Ts8obtotW7V/wCjgAb86Yq8T4hks
         3uRen8fKe/0GVkEqc8Se+K6BMCADMfu1zAvPz5RtOIIEqkR5YFbRUXeGFp3EdWckF93E
         tm4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284870; x=1715889670;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I0i1BJHEHfvwlJBsnQikq6I2sYMm72umBUDvidl3EP0=;
        b=ZJOyFeiZwK8srnwfCRMxj95UwjSi9DPU4iTzx+PIABlSokIrVtRuwPirmQYSzV4ldi
         x+QFcCQqIc+psVPtvoYNs/GN0SDFypmiFo4IWXYbg1oTw4rDNV7wm/QnfTnUGliNrCWy
         juaW299aA/mq8qXXQdPJ7beOXdwI7pK/qlMndOvkaA6G3qFSI+vpJ+Wz0tTxZWrH4grw
         W9L9NByKMXzyqVIOOYMhvMgMgPxl7r1s8l4SGHQZJ6r3z8Wt10/uln7SbWBmTo8ZT31M
         qHzz9Vc1P61HR2Okjft1jbpyAQgCpvwkOh5QGrOxP2QrQwyQ+q/H8B984bzYGMdpNOGM
         Qx5A==
X-Forwarded-Encrypted: i=1; AJvYcCUwzO/gwIu7KJllPvOvfHVS0k6CLOXy2xvPpENntPcdpXUYQZCylkNRt+MA5N6tLCpfBmgyt6z7kbQazBin76LnO4dYkiWuLPKhVHnxhjlp
X-Gm-Message-State: AOJu0Ywsy+J7FoiaM7YX4CG+kyFxDPvmQBxXrf5A3RdjY/O+Qro2f+np
	Ao4E4zYsYP7aJYPkEDPw0D9barjehslwWJHNeYAS8j7XNT9KgwefxhjDS9dZcJGwCaqAVcPrpQa
	4ww==
X-Google-Smtp-Source: AGHT+IFudhQt1fRt6J0kI3URdQQI5Scuqc2zHiG+e3HEB09m93On8QGiFupoq3VY6GmzMw99gIVvhuFAdzI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:7749:0:b0:5f7:651b:fed8 with SMTP id
 41be03b00d2f7-637427ab755mr973a12.12.1715284869580; Thu, 09 May 2024 13:01:09
 -0700 (PDT)
Date: Thu,  9 May 2024 19:57:59 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-8-edliaw@google.com>
Subject: [PATCH v3 07/68] selftests/breakpoints: Drop define _GNU_SOURCE
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
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130116_263766_443694BD 
X-CRM114-Status: GOOD (  10.00  )
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
 tools/testing/selftests/breakpoints/breakpoint_test_arm64.c   | 3 ---
 tools/testing/selftests/breakpoints/step_after_suspend_test.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c b/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
index e7041816085a..e5a95187ac12 100644
--- a/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
+++ b/tools/testing/selftests/breakpoints/breakpoint_test_arm64.c
@@ -7,9 +7,6 @@
  * Code modified by Pratyush Anand <panand@redhat.com>
  * for testing different byte select for each access size.
  */
-
-#define _GNU_SOURCE
-
 #include <asm/ptrace.h>
 #include <sys/types.h>
 #include <sys/wait.h>
diff --git a/tools/testing/selftests/breakpoints/step_after_suspend_test.c b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
index b8703c499d28..695c10893fa4 100644
--- a/tools/testing/selftests/breakpoints/step_after_suspend_test.c
+++ b/tools/testing/selftests/breakpoints/step_after_suspend_test.c
@@ -2,9 +2,6 @@
 /*
  * Copyright (C) 2016 Google, Inc.
  */
-
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
--
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
