Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32793C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=M+nd+M9zSgxe69eXmMO7ZJMIiUTEUCJb9+9qPkE8k8k=; b=4boMkx+ktiCNQVkZyq1OsmKxJC
	ASKHuFlUUfk91NzNBif8YSYA3RaQYcl8FGmgjE2juTefJKEATAFrLWQHwn9nT6T2jwjBI07Dgyhlq
	rOsL88yNB/IoX+9pSurGdKw88qxOQKN4nHNABjwTzns72MYrZmzsCxrl8P/wSDbpv68RH6y5/dcNF
	hlDlvk3ltda53Z8TBOpujOfacV1Hkwbr1Qhf1KQGi/D0CtkdQHDAaEwUfSypzXxBXB33f0ykAYuSv
	BRi9m9FV6Mdhdt/kE8pWVlvFm5jaQYMLyCyHU+cvBhjtzfGjRNXpc9q6d9/8aYG1p3yDzOiToS6ta
	ckGKTPXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bX6-00000001jro-1hz8;
	Wed, 22 May 2024 02:16:48 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNO-00000001V2K-2fbp
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:50 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ecd9a80d84so3105215ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339761; x=1716944561; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=7mo4/yLDmfOkTNt7Zkt8yFpoQggSa48jheWSJnXsenE=;
        b=WgLScRKeIkpocbSLy/wkgty+GmN5kFgunQBI7F3vgGxJyV8Im2bN1FkoaQy9SAAiqS
         45cQtjDZ57n7WiY1g9i6f5m46vuZNwkdYz1mWLHEl/uw8/4W8f4twmguBkFC39+MfzU+
         nl7lfX3Uwt9YSByoRt/Po5XvzTh1psn8HoV/2cJyt9OZYps0i0hONoFB4N1/OWhy4s/i
         Up2jyIWwiPMfXLwSBVH3nM4Xcij3Xt6s7IqGB/FhWud8IMgyJUEen2debE91U7wfelCJ
         A79KII3I4YftjPmYSM1IsIzY2yypnAMNGhtlTAK6xEMrzPax12tqGFHz5sjX6+SWYFkQ
         RiSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339761; x=1716944561;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7mo4/yLDmfOkTNt7Zkt8yFpoQggSa48jheWSJnXsenE=;
        b=GgPR4pe22wIjrRFfKCZzGlLpeSonuCpWA8/6yUJiGE2PKIZ5/1kJAWty4Kysp7gRsr
         v1ybNGCVdISGmKe8OX+uJ83mw1aKmo7Y2u32yG9k70/ZoM+sT7fwI1vQXSzhcnwxsFJI
         X1PgZUgLj+R4ERWVLh6RgnqaU2Na6Ql5HoctXRTqDBb0CzKOKv9pQFP5PKZ/9EqDPyaO
         jODz18kPI0WLo6baHOSvnZ8WxeoVG/yDUOW1ZaO0MoczrlT8vMViPFTCcFev6+RbJher
         qDgMX6GWwf4avZVybwQ/9ySXa+I4r6XsIe6VtU609MwY8ZK9zZA41198dG6ao7EanaZX
         vJUg==
X-Forwarded-Encrypted: i=1; AJvYcCUN7qrty9iOMvJWS0B5IdKKTgRwGdKSziZaOmR8kVnzBoF1aRpSfN+jdkn70tYJ1ruBNyzLlN/unYms6GfDFlzoXo3qYS6n0Ial129PsZbQ
X-Gm-Message-State: AOJu0YzZQq+iigRK438QKXq55W/9pvR2GpaRJED/xRgPn5ZsDexKGdv9
	2PnXoA3+8cxM8Zljc9GAvQr9k5kAAomsG///+dbWtm3Qf5/OcsczgZS5nVukr47Ym+pYAiSGe3W
	ALg==
X-Google-Smtp-Source: AGHT+IHvHptwu96UPU1jruYsJ05usROficf41w1ArAsId6Pnpj0UoVYTI+LNCGXzh+YwI4pYDWG0QxwbPfA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:d482:b0:1f3:c14:968b with SMTP id
 d9443c01a7336-1f31acfacffmr231515ad.2.1716339760811; Tue, 21 May 2024
 18:02:40 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:52 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-67-edliaw@google.com>
Subject: [PATCH v5 66/68] selftests/vDSO: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180242_784583_CD653BE6 
X-CRM114-Status: UNSURE (   9.49  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
