Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02E03C25B77
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=VqhH6e27IGB6duRq5AOkBe3gjGRCP2BAlh2RTB1lNdI=; b=VJTY/fk6bDTjvOeOzTSm0rCcc0
	Lc7KpqjUMacLH9sFk2NzbK6CPdc+TYlrZVMz6iGOWZ/mcZILIFsVHX3L+9U72gvRQxTHQ3H9mM3N7
	hqJ25C6CNiNM9g4NsmgW7cgQGHKf6LnBJpbpXMuetGy+ryIPvzH1irrcfc3kbastPwG/5iCdRXjsb
	L3SlwjMwcEXlRJNUVWCr69A8b8pwRRgu76ZPKZqCSg1BWSMEd3btTbV+us6/t/ixG2dHjcuYDO+jp
	AFji0/DbYDbKjoJzqGuy6Y1TKUST7htzGuAif5anYdaFq6n+cCD8Fu/MVTs5aVDAnccvyhcz0YEH2
	J4hXVDFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpM-00000003Me0-22ZQ;
	Fri, 10 May 2024 00:09:32 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpH-00000003MWU-05FW
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:29 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f49fc7b5e6so1545565b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299763; x=1715904563; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=x5hVF24XSWQsJ+4cb95KYVo5LMwPzJ3133L9BIUCMMM=;
        b=J2YdE7IAs/CgpjwYvgbBtttQ0oU7HPd+REc4E4TQb1ATUYM5WDUZcyxdMDtoxX+lcE
         FMa3p2SYC8604FQCS5jVwH6MJ8bGGR8JBC5wavJS6kUhMdiBo1hUcek1boiAK7HjGe/7
         PHOS2YsKytxWSKF3soks6uJ4/87N6NSjmdo/5nyRgPxVYupXfYJ/Lu5QAT2dhXab5Ml7
         9CMvdpmaxxVirKHW7lD7S/P5GgrupVYy9f06F7d17esOgw0nAZNP/XEexXzI4QHmzKC9
         UFnh97uAEzzozB44A93KagsNWttvtqgvHj9QWmk95/JqXysC6Ag3tNoRjs+orBUkn0yU
         /1Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299763; x=1715904563;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5hVF24XSWQsJ+4cb95KYVo5LMwPzJ3133L9BIUCMMM=;
        b=n9RsbsJ2hXpeWSdJV6YnUrYJsvALTF8hfduNHedvN9VryxcbZ1yLS1ZYiLPWRLGs1b
         mWzTf9fLsfjxegZ0871hw3INN5jitOk0sl2QGaGyj6QRUC25eyI9zlIJF5DT5aSqf4ll
         1yO+HGM7fUYUJCsGmvY9FjsAQeEJj2iAbwpSpUHbIF3JgMTogFwJ1B3LBX++rMYMOZuh
         E3BFcBCkuuIHfuvqYbWm8S8WMx74aV5K7KQNFGGUAs8PzbM1ErzA9rmqtdFBuSCjx8fG
         TKIXlO/aeIb2+7BEJ7xOw5r7hCBw1VS0rSC5YZDyaiBMleWuFNvagv47b8jgHALVDQdf
         5n7w==
X-Forwarded-Encrypted: i=1; AJvYcCUcTdBd3em8tefnDUkDurAwCFpcjKcg8Zk/Fj86Q9Qvce/HnXLsKNMeVKebWC3gNcR/XzCOCCYIQb8j0OsghP5TjCWn8+JeIg5wwBnEvU3g
X-Gm-Message-State: AOJu0YzmGqeFcajpb04RsRybUbJkwVJNVAPo04m5G0ajv4prZPdDORW5
	PEDDTR9PwD+UUYWWymos/q2as6HCSVBQcxG0tw6C5WN1HiSP7a0f1JTTlnVBeG3ATZJfbkyxBaY
	5TA==
X-Google-Smtp-Source: AGHT+IEoI8M57361krHh5PkKsd9cif4/fJudIIqhtt6uxwIPL0mJF3ug6wUz8Vwy6IK0xIyS4kuYOOUid4o=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:a91:b0:6f4:d079:bb24 with SMTP id
 d2e1a72fcca58-6f4e0296acamr50019b3a.1.1715299763075; Thu, 09 May 2024
 17:09:23 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:22 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-6-edliaw@google.com>
Subject: [PATCH v4 05/66] selftests/breakpoints: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_170927_305708_13A80C87 
X-CRM114-Status: UNSURE (   9.07  )
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
