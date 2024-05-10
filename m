Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DDBC25B74
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 02:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=iFMSC7kmhmB3IzMPWTx7kIxuIfG37Kfg5kEMqxUBgMU=; b=sbXprY6g9AUfiZ/+04CKmcAZQb
	2f3Psikvte4LScFGpKjekqQzA6r0hMeWvSx05SH8SN7EjfpGgAqkPLWiys7MJ3SQ3qEpBdGA6k29x
	TrHC/h7N19+9Xu+PJu0fxPIwtjFd+n6QCeAemGDvhVKGjXvBDxEKO/mr11SjmFK59qABTnVpW4yku
	HF7Ib6tlXTH9K6uWL/mZh35Ddl5+NQZMsvvpLVQkgClw3Bjl2UO7OU6FWZgRv29J1/SegP67+4aVS
	qw0MOW4JFCKTRMAVyW231JAj+KtqYNXGSzPFIbT8XK/wrEJ3Ze7UM9YReR3DSKp7ZKlhxkcQYbZP5
	l2GQTZAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5G3U-00000003kr7-0iPM;
	Fri, 10 May 2024 02:32:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Ds1-00000003Olt-1yJw
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=1+/kjO6igpY5Z9IiOKAmMz8PNt+9Eolw6t7DBSMXgDQ=; b=EhJlhGql5QYHREnsXFs/tfwnbc
	z+9eY5UE2V1X+Ug1c00z+7hpKxfNqSeRhK9n/8KRum2KHBoULtdUyf2X12WRNfo9EHCH27fXw/Ppy
	KrWh3Yw78kguv9++Tx3cWNN96c5q0Zi3zsBcEojE3N5ry0E9l0DKW2vevmDkQbBUWVOHCWR3he9c4
	qCpP/u+pfmZFb7Ls7MalfXgFB/M29WkQ1cArIQrn//qnK/gVGZAtUwCprH9tpV7Kn9W+WTWKzJ3I/
	gAU7CM9mx9vuxLOl7d/CG3G2uOl5emRf4s9JBREj2aA1fcBy0bWmv7VhzkqhPXiZUPWDMZlrwke0U
	mEW/YimQ==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Drs-000000036Rs-2uC7
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:12:12 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f46acb3537so1038163b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299926; x=1715904726; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1+/kjO6igpY5Z9IiOKAmMz8PNt+9Eolw6t7DBSMXgDQ=;
        b=NxbhUNlifWXUk9mZuKG1ts2Q4ivaWBDWtsdv1/R4Nz3Y9mp74ECxfmam+wZ4JOr40t
         K8TW0RDcaZE3uyCa6yxaS+OHcR7uBVe2Uwp5XrFvPCo3+HPlpdhEHJLJfn3msdv4xZxI
         emoWxExVjT/WcHYNxn65twXlqjG7R61Us6jqr4kdI1dQHdRektd4He4QlMsMWurB+oJz
         91uVxv080l8Ji0Jn/zcoVtxnyihegq2T3JV/+ml9vRzaLao2rspQlCLzKl0R9J/UOohz
         U30pF59G6AucMDutkJSkLT5CLQ7s2lYMv7+OFzXNK8CWYe9XVlB9sxnI55PH55xKzP37
         k2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299926; x=1715904726;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1+/kjO6igpY5Z9IiOKAmMz8PNt+9Eolw6t7DBSMXgDQ=;
        b=qKGoi4dKElrI6QvhRZbXXqjpN+7otVTjasCNi3n9EBIqWvCMBObh6T9qgB1VO4TZjl
         ZnDkJORpSsUY0/UOuMmGbC0e3vmLm/cW3fSs7jb4frOL8aVD/Vfjszcdg523I/cDddWI
         CDzlKmCqP9slDnGDvxffQj6ou8TSZnY8XRmSvbq/Gh3FljE89CNdLOfhrwPRZmENhaAe
         WQHKSNzRsD3sOPyEetb8JTkrpOwoEwa7pvsic9gLJNH3+USt/ljq+1Z67hxP8UgT5WV0
         x9UBUQnK/GW1/gCtHyoab0S58RmWh1vtHhVf7eiLp8EdJEjasowBTb+L+Ox6XqQ+Lt9E
         JEOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXjUJf1+HhO3RYCyOFY6FmiOaieEEuZWyXI488Pk4M/I5z5tTLNaJ3hcavvTCKJMmbNFyF4XAAaCAZLjfH2t1rsQFVOsun4qPZn+1nYHkIL
X-Gm-Message-State: AOJu0YxGR0xE0EByUDWCXHFjBDHIY+q995CdoauVxJf6/RYYBR4NQfFG
	XHU+rO4pA3anxAFpwgnOu3HXVQfxZCuHNi0YUAI6PffA9vYMYkIcK48/hNBnPT9DL0JJVrAM+WW
	U5A==
X-Google-Smtp-Source: AGHT+IFqVJhwpwwqiHXuwXmYYl8rNoTCx5/ixsGah9it9PhH2pp2rnYEYGHSA0lrqROCVxUa7NHIESir2HY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3992:b0:6ea:dfc1:b79 with SMTP id
 d2e1a72fcca58-6f4df42b865mr83743b3a.2.1715299926061; Thu, 09 May 2024
 17:12:06 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:21 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-65-edliaw@google.com>
Subject: [PATCH v4 64/66] selftests/vDSO: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011209_183072_28760143 
X-CRM114-Status: UNSURE (   9.44  )
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
