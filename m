Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57810C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6Y6fUurYoUpPT9HrcSnR9rq+40M3E97LUOJmuYIlWeA=; b=oUaOZ/snfSBe6l/cGJoctw89N5
	fyi5BxpXEPQ43hzDSU5ZSo9x3ZquZxz7KLSJWZtiMp6Nuls7A4CDTduhn46rgVr1RfeW9LVsA3Z6I
	WkeU6sXzuqueZPXWZG3P8uxzDFhub0jJoyWoMgIeiRXs0iiLmP663MLOrnlu2ffsAS/kJ7bM6lQEb
	wMB3DBVwlJxpCXOB9Fj1dj9i0Jmbd1vz7WSasv/SGcGHHE0jIFlQogI2iI6AzS7M+7+CXO2eDKX2G
	DnDudjh5cnxErgwJpJc0PF2Ho3ZMjddgzmUOX2vorQEpp0q+o7+y98TeP+AjsKoB78s96R9AuzeDQ
	19e8+AFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWr-00000001jdV-2FkX;
	Wed, 22 May 2024 02:16:33 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMw-00000001UlP-2ToZ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:21 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6ece5eeb7c0so11692796b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339733; x=1716944533; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NAsd/Ppca2ejRhM9/9MWOjE3ktFAjB1L9G3cs3vun20=;
        b=qMm7tyDbVKQ9fObRfh9Mlz+/AjfXtHWkRjYpuVzr7Xf4U8Y/f7nHRY5SQK76G4uwY+
         bMPKU/vFt4u/38Aycv05S8VVs5UFaGzN9x+1TRacOjxGpzYMlPUIE9t8IUIQ+qXcud/o
         1asaM2eqrM/iyiY5DPnppbSrcFUqNLTNGiO/EWwTgKsYn02SZtaOsoa86ZH01F/883rV
         WF2CwnUqZE4J1xhPpqzCTcVYx9dq5Z+4lswt6EDtFakmLzaWvC99yfuOkrqvwk23aKXy
         rWi3FH4Mv2wZnVgmeT48XYsdlKybXK7vt3N/ujL7fRbST8/0mwsaE1BPTNAnjFdO1Aw/
         iGtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339733; x=1716944533;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NAsd/Ppca2ejRhM9/9MWOjE3ktFAjB1L9G3cs3vun20=;
        b=xIfikOPbgl61neyKDGvFQOi/lzFzbc1BOXyVOGFDX3iYRUXSWSpeyTTP262LT4ROlH
         Qrq+qIhzYBUOVdYofQ5fMjh0190bCOqMs50YsdNtuemtwnFRf52ga2p6JvjSQnEPCXBw
         8N/WwME96mX9hymKFtStZ7Ovxmb+OBKlervskg2+xxfe9m5G7jWej/sxy5RGrF+n96Ev
         4m+SU2pqTWVNzwKtqIU12Hu1UBumE//Su0eGGuJhPlUTudhOycZHlTWj5Vr+SvpX7zaR
         a9gJLq3pNM7rkELG7kVv/sE1syFaBXxNFZ8gwmhyWraY4xfecarChTWxueRrL4cML6rK
         Sn3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX6OTnPHa2xNw6McS5RJLsWg/Pqgc1uousYwF6LMyCkTbl4iavrOcTVf/SDBblbSAhnbHUWVHA844dC2SU8unsTlqwz2lSoySVAwLwwqy4p
X-Gm-Message-State: AOJu0Yxo7Tf8aXHveEbEsfiF2lNx74yvFfBnGi18X7mgP3l1h7Yb4emq
	wMjyBlArN0C/GGxD5+pKrNGVa9TqOA5WC0Xkzi/LrEOjY2X3tXjo+v+1byPQXujcmrdJkp5puAZ
	aGA==
X-Google-Smtp-Source: AGHT+IHH7wkPUdUjgwa1/oOxKhUosXdZXQHCdxIhj9UD0tOKCukjPqh+CALUTfw2/d4x2W06CEkVNYszUyc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:aa7:8888:0:b0:6f4:9fc7:d21e with SMTP id
 d2e1a72fcca58-6f6d643e499mr24375b3a.5.1716339732719; Tue, 21 May 2024
 18:02:12 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:41 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-56-edliaw@google.com>
Subject: [PATCH v5 55/68] selftests/seccomp: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Kees Cook <keescook@chromium.org>, Andy Lutomirski <luto@amacapital.net>, 
	Will Drewry <wad@chromium.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180214_962326_3EFE353A 
X-CRM114-Status: GOOD (  10.23  )
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
Acked-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/seccomp/seccomp_benchmark.c | 1 -
 tools/testing/selftests/seccomp/seccomp_bpf.c       | 2 --
 2 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/seccomp/seccomp_benchmark.c b/tools/testing/selftests/seccomp/seccomp_benchmark.c
index b83099160fbc..3632a4890da9 100644
--- a/tools/testing/selftests/seccomp/seccomp_benchmark.c
+++ b/tools/testing/selftests/seccomp/seccomp_benchmark.c
@@ -2,7 +2,6 @@
  * Strictly speaking, this is not a test. But it can report during test
  * runs so relative performace can be measured.
  */
-#define _GNU_SOURCE
 #include <assert.h>
 #include <err.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 783ebce8c4de..972ccc12553e 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -4,8 +4,6 @@
  *
  * Test code for seccomp bpf.
  */
-
-#define _GNU_SOURCE
 #include <sys/types.h>
 
 /*
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
