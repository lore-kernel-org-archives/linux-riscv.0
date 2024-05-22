Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A099EC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kOV1wYm37cFU/+UonSXV6DNx21os9uhCwS7/9GKbgr4=; b=O73sMIfI+1vdEBCJrB3v3XhhbS
	iFi9JzsaVnceUcfSyKInNHo3YQrXL+yoJzxXNZYmjPvSoIqTUw3HKdHBrdpFkbpcYJmXLZYPv4dlm
	+x2BtxTZ9H9zodsXE1/UQD1oraqOvmK/VfnTKwQ8ft9ppZixLntf/ZfTMEqG+uK+uMMJ2fn7EkL3V
	lt9f8nBAp7xXzY5i73NWRoj9vgNKgxC5ak1BKgsmHMOS6XcXxlZYqikFPfABVOTN2DNwXi0nJJB7J
	2fpZhqbRGWDtVvx0VIk8goYT2CHfKsQmQvGFq5fHv53aSeEcYlEXsfy8zX8JpTt58sOAGVKCk8bkn
	Z/NxuHIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKl-00000001T8j-07Kj;
	Wed, 22 May 2024 00:59:59 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKf-00000001T3r-35bZ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 00:59:55 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1f2fbeba118so30862445ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 17:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339592; x=1716944392; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hrpFzBzOl35j2xYdfjQDxhIeH3idaCKna/k1DUsQtzA=;
        b=iEKxM9Jj0F5tBD1oBY8BoXprtMQ+kiIjXZveg8kyR6qAXXNKyvsr/x1nUR0sEUxY2i
         F60+lo2AhnR40/G535gDlxwwGY39xRqNzegLsPpnPl/B9qct6HsDSKmRgG/2PkMr9yzO
         +2Md27WGJVSrzugzhHw6NaqpNo/3eCHrzpARlZChhHjY2FoFiw+ezeVZ07XQU5s6DHWS
         SwkYmljhNpJDiatN9wlQpjhjRJzwuRXt2v+Tm+Rf2BT62CLBPi8EkM5X/a5AIFN9PejQ
         ZyJ+AkRJo9gtJLCFXYlxPuuMBZqLELo1c4oNPG8bHkDiBwqN+QlogUehoEUxsZRklb3l
         JKDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339592; x=1716944392;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrpFzBzOl35j2xYdfjQDxhIeH3idaCKna/k1DUsQtzA=;
        b=i7CH4ENUS8vu4eHGQUqpktRwClDu16TuKkRuSb63jPMOuNMwiSx5FC3N1X8SHdlNO1
         5cqKtpg91rXKAXR1aIPKTnxbGkFNMn1MjCMikxKtzaG6WJ5lPnYq4LM4lRxzgbsqACjY
         SL6TEr2qE9wkAo82Jv3qLsde1lnNXGmxULJozKAuYDoM+RUDBl3E/TsDDX+9g69zX/6r
         h3yf3JwQ0v9FcA8S/9bp18askupeFfANvyOyqjxFGFuddtvgBp9NqRs23z6SFacodeJW
         Kl8mC5kBF7JVeuqbwEVCRgobn+3VK6FZvfVP4mu+P9yY8IvQa4h5emYd8YOCsB9HtVPD
         AdYw==
X-Forwarded-Encrypted: i=1; AJvYcCUHQZ7phL0sz5NQwVDoNzM9vDLpNBoPLAgCOVklekL32Rj0paMbd46rNVqfFfHO+xz/umqcIZCtwlJLCRuKQu8WwEpKr6hRI7rgWw2BIweh
X-Gm-Message-State: AOJu0YzIN2S/0OC37VjzS7VAJIj2VvVm02G7pg4w7Y3DdmRcrfQj8I9Z
	KPlpmGyiu+4rL57RV0SCvni5gwxrYEAGWE1t3qmA14ppvkBQBQ/z6ZSkxf+/2B7CMM0lwL3domN
	NYQ==
X-Google-Smtp-Source: AGHT+IEoluKrJmOyFwoaPpDSDecfFtDU30gApMNSHC7b7ZSfhyGyK+abS6RqlmYIGQxtFLFdPmJSYbqqJdc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:903:192:b0:1f3:35e:7dcf with SMTP id
 d9443c01a7336-1f31c94c59dmr524115ad.3.1716339591969; Tue, 21 May 2024
 17:59:51 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:52 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-7-edliaw@google.com>
Subject: [PATCH v5 06/68] selftests/breakpoints: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_175953_920125_894CCD56 
X-CRM114-Status: UNSURE (   8.98  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
