Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1119C41513
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YimbmQSTsLDNGjJmoe0tlH3Q4q6uGZ8F0xADpjdjjuc=; b=ALEYRymRQ58RvFNOyCRV5EW/pV
	zR3yLKt9ofGNwZRLpIdj//ofHcVlzPk/S4MamcPkcDr8eUKg0cxJV62dojdXTUJESqv72izJb7eGp
	YUsRfLdLixsnO0W/OB8iCuumKKWUO4VlB/DuBE60GZzXcwS8UFzULcF81fab2ajnKOpOixOkM8N/r
	RITTv87dZwpIPFb+NYXzS1Ba7L03HyaBfimdZWwA53fxoNiI0hBkZxhIRzSw32oSi9YMxEmyjVk1G
	FcRuO0t2rOaBdwIrEnvgL0n8G3DG0GYPippel9wGl7My5cOYwWNSaPQBo4wY3syv7cyYtbwai8DWL
	gODLJW7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWe-00000001jU3-49fL;
	Wed, 22 May 2024 02:16:21 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLa-00000001TkI-1owx
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:03 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-df4e54990fbso57516276.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339648; x=1716944448; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yAQSiPU3Xxpg5se1jVwrYALJE0mXKiuWYh1IlCTKguE=;
        b=smoETAEtV6sPPbhOm2cbganzhsNMzQ9u3HB880PWRmaLppKRSKJZkc92q1SHoYrZNu
         YPNwZ7Ts3kBJBNzD8K1Irs/qnZpZ/ahFsupy93YhZMEzLJw4BF33+4KlbXnfb8pUf4B8
         Dt9JDqr9GJCtYbHCPDZeCWJtzubcdCXEVKm2VMu6iDENybxYkcnUbRCJT4x7nisLyf/9
         gWOBjP7NPgK48wVJKXe8YB0nhYxjNaGCXTypfcGtARc51SI3grE/ipg1Gl27lN14RRi3
         E0w0Q4QT+d89gQYE15cqOslQXL2lgPG1jovzHv+x9QkM9Lc1ZRsWbxJeHospIOFzS2Wb
         xK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339648; x=1716944448;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAQSiPU3Xxpg5se1jVwrYALJE0mXKiuWYh1IlCTKguE=;
        b=fS/M7ISPl0F3D1OKb1Qa46CQ5ofxWULC3bqFFxLrceEcXcqsJLrTuJBbycMEHUUoxM
         hNrHEPFeCRPasW6SQYIrgim2QHQiy0sPuBBId0jgMFUeZjgDtinuT91yxEPQWW3/YTqm
         WwC8Ng8cqQuS3rSq/mi0OkKexbvH/LKPzTBpYXctqkyDr5rft94Z6cDHqyGbqCrCx0Gs
         4ls9Dk2gS4RUk7auYXkeIB0q04CFDOXJ0mc2rgif8wXGsVfV5hvYfqdqb2CtA7NfPVds
         CDLdCTNRHuniXXgTxaHpVMxkOj+6uiMoxgOGYLWx0YEZHJUVRN4JG1guyA9zufrmWvMl
         SQSQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzY0w0lyePiI7W/sRn9PmcVxEnu9XPYaUy8Qd8Sc4unBrxI3InyMzJ5aCvA/2FLsNSJWelkWkOTdcRzmxk/FFCJZw/ZAdUY8mfnwVWckyK
X-Gm-Message-State: AOJu0YzHA8S9QQkDKRUvIFFYDT74LOZkXA2gwRQlmciadboC5jEB5K4y
	2EKxHFsL9mRwlkrdHKOt5ahjP3PWSnKwruogq4xFlsY10xh+ZlM9JOvfcqFMFmgL8cZMTZU/pY1
	6Rg==
X-Google-Smtp-Source: AGHT+IFjr+dMdwwjSeyKVtDvj71h4a27dlU6zI/2JB6uVxDlz76u2lFmfPLoHDWhwCSwvHwm9NN5UxukkLw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1083:b0:dcd:88e9:e508 with SMTP id
 3f1490d57ef6-df4e0ab542cmr224908276.5.1716339647973; Tue, 21 May 2024
 18:00:47 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:14 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-29-edliaw@google.com>
Subject: [PATCH v5 28/68] selftests/membarrier: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180050_771594_38C2A322 
X-CRM114-Status: UNSURE (   9.28  )
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

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/membarrier/membarrier_test_impl.h        | 1 -
 .../testing/selftests/membarrier/membarrier_test_multi_thread.c  | 1 -
 .../testing/selftests/membarrier/membarrier_test_single_thread.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_impl.h b/tools/testing/selftests/membarrier/membarrier_test_impl.h
index af89855adb7b..a8a60b6271a5 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
@@ -1,5 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#define _GNU_SOURCE
 #include <linux/membarrier.h>
 #include <syscall.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c b/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
index 4e14dba81234..c00f380b2757 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
+++ b/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <linux/membarrier.h>
 #include <syscall.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/membarrier/membarrier_test_single_thread.c b/tools/testing/selftests/membarrier/membarrier_test_single_thread.c
index fa3f1d6c37a0..c399fbad8efd 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_single_thread.c
+++ b/tools/testing/selftests/membarrier/membarrier_test_single_thread.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <linux/membarrier.h>
 #include <syscall.h>
 #include <stdio.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
