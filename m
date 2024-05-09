Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BAE3C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=T7MbMRPNaze5PGV+ZNoB0nNyQw0UgJ/e+6JoXqBz9dg=; b=SE1DKybWPVW5zwokYCpU9T8NST
	A/O233nF0HkpV7Kd3BiVQvbzaWtr4vzPk7EWlPjwYn0NByQMm+h3uA+wTBmtIqtSo1N/seA2umBy1
	DGMI4omoHSmRxCp1ywPI2BrM8znlqcvNf1VvF6s5FGbVcJ7RI/6PaAhDPX5Zq+kM3JjDInGrchYft
	E0ApSqYN3p4FCkP0su0YIqtDae95MZX5KwRdhhUtIsNezAi8utCUC5LIZbPytUOHGmZulGHl2F6Yz
	SenTLmH8oi/443LLVUKCKtjesIfQZe5P99fpQRkkYPeI1EgGXhS2KfRXocAYUpN2bU1fT80fQYkeT
	vQmC+RJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIf-000000036Fl-2uZc;
	Thu, 09 May 2024 22:31:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yp-00000002cMv-1gYh
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OdNEpQ1G1MITOV+6oevaHyGJgkLn2dsRDWPkXuUTfgQ=; b=CgPaUziHKzM1nlOy/K3qaBLWt8
	VtXn/vrQGujqRIgeMCWxInGDY1zFhPZa6NUGbe1PU6o3v83j0nBj/JvbyVUtHHvs4kIHGHhDkBaYm
	aTyL56dKU+woT8Vv94vlyJPT9NPHVfj+EIdI4/+toFmFdrcafO8+dJ0V5cNljXNzE4a/f35Y11g63
	fvsiPl8o3k31dLY9MhLHPzmsSao5FDX2QXlyJbAxqVK7dH20vU6sUHewsWQfQL3mqmWCti7ZpZzeh
	zPpDXRXVPQ60qbA4vaQzr+U7iqP3bqH39c0xM/CVvKe/P+9q/fEO4gSHxtlnpidwurLEdJ2q+ORXS
	XzBSoHJw==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59ym-00000001Jls-0ton
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:02 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f452eb2108so1077247b3a.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284971; x=1715889771; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OdNEpQ1G1MITOV+6oevaHyGJgkLn2dsRDWPkXuUTfgQ=;
        b=4vGc3Sh6/JQJEABBZN5I1v7qDy4hzHSMDU8kUIHt79WQLLcIIrIu48rWyRoya3RbzJ
         0PwfKe7oIjGm7wKRtYLRKeIjc9UYEUtksZzy6qgRkb62bA01zXfOJ8I8RVsYQdXVYCB0
         VDGJh9tssPDn83iraaTvE12oppnnSNmDmgiXbV1ttVZZZoxvXiXL8dAeY562QPKB37O4
         2KXysBLAStVWWWsZqnH8gCr/NswIeskfMj7f5MHgfWR6GDUir9RqqlcQNiYiMaS+FUFh
         GV3XbeBrgIJ1FBlu67iDXfTAhVD0fxHDT93btcXKxhTae1VRwLsLl9f6uFfvX8uwN3/L
         YG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284971; x=1715889771;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OdNEpQ1G1MITOV+6oevaHyGJgkLn2dsRDWPkXuUTfgQ=;
        b=K/pgD9a+J6Vghdq5OyvubNxMnNBmP0swQyJPLKXJAaYwgjqlZwoh67CyymqUOmfkxD
         21LvFrRlHVSKQUcQ2FEhTPqrBciPUXtFK0N/CueBdWwKlpLBaeo8Oq9BgX6WcH4lvnsz
         G1xFFlzNp8kzzkV7F76aLc2Y2n2MNqrE6MhH6zqvRKwOr+o+HtZXGUvbGFa7iZb1ZrtW
         u3cQatQeswAo5Q3YQJ7Sd4ZoeHNkDH1E2z9IvrGlWbmSXwy0PcF0XvRR5yE3LmKlNWnw
         G0Nd1p1VEpVJ/eL4AqPeLAQIKutGvYQYFVZ/roRFvT3XhbqTzzqR77XX7vZIfFgmLjMP
         sKWw==
X-Forwarded-Encrypted: i=1; AJvYcCW5voWMDnSiU3KluQRMJUdiPvi7Q0tM6+u20pAV+3FT1XEpOWPHKNT6lYB8BXr+wFku8jSDBB/cCM2OTpou8tIG4TFGABf4zZei8Mytffpo
X-Gm-Message-State: AOJu0Yx/9PvzFGXcSEy7mVpwNxkwUC8zkG0HYi0MTv5lLOO00qlR2AYy
	Tfiy4Lndkv9va1pB+bs1xQ4HFAnm2AQ8p08xserYbBRaxg9y6kWivwAt0MutFkf8SsyKbVygU8u
	Tuw==
X-Google-Smtp-Source: AGHT+IGFUaZkpJJch5RJqd8VEYWv40cir4R81AsilEen6q5Sb/HjCesG1cHRjqEpB4w+v8rVE142bFNevYU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3c83:b0:6ec:f400:95a7 with SMTP id
 d2e1a72fcca58-6f4df44d0e5mr44259b3a.3.1715284970758; Thu, 09 May 2024
 13:02:50 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:34 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-43-edliaw@google.com>
Subject: [PATCH v3 42/68] selftests/perf_events: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Edward Liaw <edliaw@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210300_263497_EFD60AFF 
X-CRM114-Status: UNSURE (   8.46  )
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
 tools/testing/selftests/perf_events/remove_on_exec.c   | 2 --
 tools/testing/selftests/perf_events/sigtrap_threads.c  | 2 --
 tools/testing/selftests/perf_events/watermark_signal.c | 2 --
 3 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/perf_events/remove_on_exec.c b/tools/testing/selftests/perf_events/remove_on_exec.c
index 5814611a1dc7..ef4d923f4759 100644
--- a/tools/testing/selftests/perf_events/remove_on_exec.c
+++ b/tools/testing/selftests/perf_events/remove_on_exec.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2021, Google LLC.
  */
 
-#define _GNU_SOURCE
-
 /* We need the latest siginfo from the kernel repo. */
 #include <sys/types.h>
 #include <asm/siginfo.h>
diff --git a/tools/testing/selftests/perf_events/sigtrap_threads.c b/tools/testing/selftests/perf_events/sigtrap_threads.c
index d1d8483ac628..14d1a3c8cb5c 100644
--- a/tools/testing/selftests/perf_events/sigtrap_threads.c
+++ b/tools/testing/selftests/perf_events/sigtrap_threads.c
@@ -5,8 +5,6 @@
  * Copyright (C) 2021, Google LLC.
  */
 
-#define _GNU_SOURCE
-
 /* We need the latest siginfo from the kernel repo. */
 #include <sys/types.h>
 #include <asm/siginfo.h>
diff --git a/tools/testing/selftests/perf_events/watermark_signal.c b/tools/testing/selftests/perf_events/watermark_signal.c
index 49dc1e831174..19557bd16e9e 100644
--- a/tools/testing/selftests/perf_events/watermark_signal.c
+++ b/tools/testing/selftests/perf_events/watermark_signal.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/perf_event.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
