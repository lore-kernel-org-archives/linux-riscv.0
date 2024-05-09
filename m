Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C388EC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Q32UoLQI93PSOSrFkdjqSpUtVcU/8OokWEi/377r18s=; b=GvgO4BPXkyOgE8R/hJEW7DYccE
	7p/LJB5Tv7ulEbizlIEmpKHvTPVtyBU9NV/2Gaw0W69U3h3RSWURfEYLIu2eQPHALe2ZVIbZxTeP9
	AZS5g6msFA4Z9jhUjeLhcFncU2JiQcc7SLhgk+o8UeZo+FR0ir7UtOvDxg41bz8NBkxQMUmNLhOYf
	gxrNs6/4LY2t8AkNbqL4XP0cJSQJbcp9xSbfBpEytrrh4KQ0eb5uqqdGgugo7w8/ig8VQec1cD026
	897GoInTey/zFnGAJ6a/kAVaQIZTxBOWQaTbxmdUiM0GTfkldPLnBA1ng/XLgz+P6Ewx29T9ZNlfr
	DpIpPO3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A1n-00000002eXZ-3zlO;
	Thu, 09 May 2024 20:06:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zq-00000002d8b-1Kty
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:04:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CpR2fXzwrU5rpm47H0npQ28GT7MWJnlw5HNOpJYAkd4=; b=jNURB0xnne5559f0a6KN0S5ixO
	MhyXCNuMdwYmTwIEbjUv/BCwKERn1muvLfcTcAQ4/BXMZctOkLGCmJ/CrB6MiqcGWsoMCeq3skIPs
	6dE4SSZnC8CWYA/Z0MRbrreMOGc7eEUBltLDmwW1Kkw9N7VGuFUTCL+lx4lRKlkTgjFE1xne45alr
	yWDeJys2XjQPyPiLKaCGq6L4nI270WurOdWw5mHxm3R0Zg0ooU6MaaC7TluaVv0Ndv41kEdNEJMeW
	Re/vLuYEMSXqSzoaayLWL2GwdACegsN7QLbheNla6Re6vaslRUAOPFPGhQKoUwxpXWdeX8Ej/7gIP
	b7MDknoA==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zk-000000030Im-2J8f
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:04:03 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f46acb3537so917664b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285037; x=1715889837; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CpR2fXzwrU5rpm47H0npQ28GT7MWJnlw5HNOpJYAkd4=;
        b=RuzLD+cwvKxYypzCJUko0VRgF1V4g1kEVEblKD7+RT4NV/wYRyNx2bCJx+9vJHiqZJ
         /xJaArL//AHail2suKMOtOm5l9GlcKXyjH0y1kjX89FV7EqYUdpzh8HATun5VevHr0dL
         bNsqy8zwgwAaC2vOwjb9Kv0kYxxvM+DfOPJZ+6ZtRscOCzDkc5b0D7dJa5CuQ4ajAv3D
         3S1YtPFB2tIPCps4+oH06tZHmMGMq1dU6L+ljMAdqrDsbHGASGSV7jdemIx3LkZIN/Ez
         QBVuMTbwDu4fBC84R1rzq5w7zrmlQY7Fq3TN/XiZYpwUXw8dZ1033RenHZHgoQ2VqFii
         9yAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285037; x=1715889837;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CpR2fXzwrU5rpm47H0npQ28GT7MWJnlw5HNOpJYAkd4=;
        b=NPGsCGe1klJoovlxVx6hy5Z+K9GPEdSgxqsS6aKrcHM9+uEKECIc7BWwCJLqL77Mn0
         sfaaDQ4TlXMF73V8zqzeKk2iWsjR2SnppkL01nr3DHJqSqvIK6liEEZJVK1Yp/dyp1Lb
         72yl0OhHMtze/sXHmgBcOZ4tnwwf4R6tIyBvCza5tj0ki7nrnzwRjei48A6Drl/jfOIw
         JgMWhSRCSps3E1X3STsJR8CTDzORVpOXofmOjIUuw9VXuZ3pb6wkzXvNQsMwkyqWhiAG
         TNGAcfto02aKjsbGpHZNyvVLVId0V6nPLA6vGckzAaTwoJcezR2GvAyungo2sMei/2vq
         R64A==
X-Forwarded-Encrypted: i=1; AJvYcCUYGqqfbcvDe/51wDTlhzrXU6kzOCtKO3PofAG1gjmexnj+skE9wgAhnyp1zwQXFwjlZo0pMMFrfYInjbl+hkz5mC3VaY2QPntto8lFNwNp
X-Gm-Message-State: AOJu0Ywi/1hTTwkz7NQNhVKfhFw9j6aR5yvSj7lfodK0Vw0izJ0piyoX
	L1fg0ZzHlItF2qdE9tTx7woJjaH011rTK/sZuLOt/WoQqvbiojpRyXERnRAKcbGgC5tH9TUxTcN
	4Mw==
X-Google-Smtp-Source: AGHT+IFI874f+n8iDrukMUj0e5vTHsv4XlA10buWf+xTINM7U+orl2HvrgNvuh4I0S6pYnKJpWbZKr4P2nA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2289:b0:6ea:f425:dba2 with SMTP id
 d2e1a72fcca58-6f4df2c7942mr54587b3a.0.1715285037144; Thu, 09 May 2024
 13:03:57 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:58 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-67-edliaw@google.com>
Subject: [PATCH v3 66/68] selftests/vDSO: Drop define _GNU_SOURCE
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
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210400_938516_8120B8D2 
X-CRM114-Status: GOOD (  10.47  )
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
 tools/testing/selftests/vDSO/vdso_test_abi.c          | 1 -
 tools/testing/selftests/vDSO/vdso_test_clock_getres.c | 2 --
 tools/testing/selftests/vDSO/vdso_test_correctness.c  | 3 ---
 3 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_abi.c b/tools/testing/selftests/vDSO/vdso_test_abi.c
index 96d32fd65b42..fb01e6ffb9a0 100644
--- a/tools/testing/selftests/vDSO/vdso_test_abi.c
+++ b/tools/testing/selftests/vDSO/vdso_test_abi.c
@@ -14,7 +14,6 @@
 #include <time.h>
 #include <sys/auxv.h>
 #include <sys/time.h>
-#define _GNU_SOURCE
 #include <unistd.h>
 #include <sys/syscall.h>
 
diff --git a/tools/testing/selftests/vDSO/vdso_test_clock_getres.c b/tools/testing/selftests/vDSO/vdso_test_clock_getres.c
index 38d46a8bf7cb..f0adb906c8bd 100644
--- a/tools/testing/selftests/vDSO/vdso_test_clock_getres.c
+++ b/tools/testing/selftests/vDSO/vdso_test_clock_getres.c
@@ -10,8 +10,6 @@
  * Power (32-bit and 64-bit), S390x (32-bit and 64-bit).
  * Might work on other architectures.
  */
-
-#define _GNU_SOURCE
 #include <elf.h>
 #include <err.h>
 #include <fcntl.h>
diff --git a/tools/testing/selftests/vDSO/vdso_test_correctness.c b/tools/testing/selftests/vDSO/vdso_test_correctness.c
index e691a3cf1491..c435b7a5b38d 100644
--- a/tools/testing/selftests/vDSO/vdso_test_correctness.c
+++ b/tools/testing/selftests/vDSO/vdso_test_correctness.c
@@ -3,9 +3,6 @@
  * ldt_gdt.c - Test cases for LDT and GDT access
  * Copyright (c) 2011-2015 Andrew Lutomirski
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <sys/time.h>
 #include <time.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
