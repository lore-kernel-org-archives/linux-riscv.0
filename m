Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2C2C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=/VBNh85YcaAgWhwvUe/9aFLgHkTqdxPrg/2LOcE8jpI=; b=LT7ib5ZVaY2NXVZMqgcWn9e68D
	LqRDIv5xbeaeXdEuLZtjBCsNOIT7NWfy+oCRxGo1s+haW984xiMKnkUTnly7CW/nao3ojiP0tmEO1
	KMPzmPdTnTXS6jtrCLMNk3DTVCEILIa1wv7xnuGd1s/5swefWBEbl0SxNYUI8P0NQHBYHcvz1e0Fn
	T/E6yrqLMgdp0Yyo5VTSu/TDNwutdmXKQ1U683oNiUyfGL5ttWfe/4qgtiZvEiKyu4GnMhN8Zqc20
	j8AjnE0GwqvdlY5832+RS3j317RUrDaynE7Cyf5/HRr0WesE182MWUd0FGIJ7RnSEwi71qPenwPHS
	FLfhRRng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A1X-00000002eJy-2b83;
	Thu, 09 May 2024 20:05:51 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zV-00000002coC-2oyz
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:55 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2b402090778so1224739a91.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285021; x=1715889821; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pXOoN3MSopkhNhuWJaS5P2NJD/isy/FaXh09ek6Y/hA=;
        b=Sw4uOYLQDQD4I8JTYXW8xC0au1urRVzQJQjRnyr+P5bhoapTqmYl63Gzxxd6yBiQnM
         XgLtsb3gTScL9PqmjAWLOSV1Sl9RVByUuTuF7iZ4tdMplCNfFIH3CewceWqVRU8U3hyt
         1K+gIEzlErGtao0aoyNtRPHpx9sC7tf2rKhBaUq5jmyY6u+S5aSB+tbGJUpLM0ubFPjS
         GdPzfcxi3LN9yGBmzhONrCHbpWF//Aj3MbMSJj0jx1cWwPa5tWc3N8qQKTieSX4x3t6y
         e4oGbrBpr/irH5B/qtjw7RT0Cf0qFICVzTbCut9xKzWkBWitVh5k++MIyA3C/hm/3yvD
         OGdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285021; x=1715889821;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pXOoN3MSopkhNhuWJaS5P2NJD/isy/FaXh09ek6Y/hA=;
        b=mhAMjVp8Qx2HNBZQzKoxKzBWF0rIG/gEi1sWzl9EkAMpXKbMG6ulVEqQq47J2qe0bO
         1TrY1skHu88oK4VcI/KMM6D8z72M7GxWoIZg0J5BayxjWpZhzrCTQmUZRYSpq1VEbLJo
         ggBE1jwq/GX92C0b43kmdtuM4+OlHtjRz6NdHZEtu6rruCQR9KXVdp8/ADBlb4x9Mxv1
         jnSIERiBG4q4lNgpreA1yc/qxLJebaR9Ms8skUZ6bqghj+Z+ftgo1D5c/KyQoB8te0D6
         Y8IfwyOGkHs6ZohDnwu3Hew89Ek5sm6iXeurZkQz8D1Rhah0TMQw75dbr+zzYCGHzf2C
         5OwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXV8g8+lo8LmCi+jfzamLnkK7q+jJu+z60aI9MGXfyx/w2B2NteocoQBDsynQPLztJiX+a/ILVoGYoMa86fiHjzh5VClzM0oSMRw/YfGn+J
X-Gm-Message-State: AOJu0Yx7Y8R+Wlbz4NgAGudb0STXwAV5wVNpRHOneBi3W9NS4FHV5ea8
	IDUGxL/HE2UUaYlUrkI0ecV9ZAYykIHIJ9J7Qb/sxopfjkRSvpvr4xrAWC5+VpyY7lRNFQ4554e
	y3w==
X-Google-Smtp-Source: AGHT+IHPDy2B7Q+CjwoKpf02gMQPBsDoEpRJNvucXRSlw3SxwotoMHdoDISdyRaYdWERd49mLg9MawqJFz0=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:190e:b0:2b5:af18:5f98 with SMTP id
 98e67ed59e1d1-2b6cc76d3efmr1225a91.3.1715285021038; Thu, 09 May 2024 13:03:41
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:52 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-61-edliaw@google.com>
Subject: [PATCH v3 60/68] selftests/syscall_user_dispatch: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130346_028791_7C9D915C 
X-CRM114-Status: UNSURE (   9.79  )
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
 tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c | 2 --
 tools/testing/selftests/syscall_user_dispatch/sud_test.c      | 2 --
 2 files changed, 4 deletions(-)

diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
index 073a03702ff5..758fa910e510 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_benchmark.c
@@ -4,8 +4,6 @@
  *
  * Benchmark and test syscall user dispatch
  */
-
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/syscall_user_dispatch/sud_test.c b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
index d975a6767329..76e8f3d91537 100644
--- a/tools/testing/selftests/syscall_user_dispatch/sud_test.c
+++ b/tools/testing/selftests/syscall_user_dispatch/sud_test.c
@@ -4,8 +4,6 @@
  *
  * Test code for syscall user dispatch
  */
-
-#define _GNU_SOURCE
 #include <sys/prctl.h>
 #include <sys/sysinfo.h>
 #include <sys/syscall.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
