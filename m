Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC92C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 03:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ntv1rWfY5ZmJjoeTTmaaxvl0x6vch253OMvh55j5MVE=; b=dXFIJ2VvLC9D8hZZMn86OgcA09
	afRrhifhBWUpJEutJEcEU2P16oYrZwinrG1XdaNCDkrJCqMK5MRbl0vBl2ILp+ymUlG79HdconcQa
	1hJ5wlVephPilmJw4KtoGfB6fJELjJWabim0cWkUQC0FwsayJ6w6LY3J7FbFCeEYXf4zD3baWBMu+
	qKrpoTDHjeg6V0ujqGtPziTm+AKFqNsLbr8DGxJsTEDX3O1+PqyCw7UG6cm31shSw9X+8kwHjOzex
	p03dTsSwz4zKCcZbbNWpjz34j1JylLAgz4O3CeMns32uWD15eHKpLe6IOiijKBAvJc6cO0V/JT+Xs
	ZtasAVZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9chA-00000001soU-33nz;
	Wed, 22 May 2024 03:31:16 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aN6-00000001Urp-2fNj
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:32 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-65789db0259so6462799a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339743; x=1716944543; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=14hyqItgH27nXrTOpySK5+rM0Eq8K4UXKAFuWetO8r4=;
        b=xxYKg2QLzp6L+Y0h40XejI/KRtdCOrtJHySlEn5YSqhqYPoy3H+7SCqq7hpbZRS0uM
         d5pAKaEIyHJBCuXN9e3elXrTtgtDUICottFjXAYW9l8Bg8iMX9OIo0/Dvi9JkphTtqZx
         ApEM68ivd24g+IztXMRUA8G8eD4z0QhKqL5H42LhGEd1SiKog4CuFpvvHkVp7ywsc2GY
         +uIxL3UlZOVhHpWZlqbKYa8kR04B8Jz+jyjpxwPx7yUdcS1u+ttXs4qLm95tSrVrDWs3
         z+rD9lU/qkLv8W1KDu5mw3lSCJbccRqCx7TaVs5cu569FsCDoOiJUnAHSvLq/6HM+tCe
         S5dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339743; x=1716944543;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=14hyqItgH27nXrTOpySK5+rM0Eq8K4UXKAFuWetO8r4=;
        b=Xn1JnkGl/d+/w/IgBF9jSIhGLQLzAJuO8wvg6j0WlRnNR0kynE29e+ifOexe2euH9s
         5rWNCMdysUCMOfFDb6VZP8yoYXxav0RTWziKQJe48hQaLNu3M2+Kk/zalnu4r/ZBXbkl
         D2sGczHtm/lRLIHAmjlkaMSzQLT3d1oCipBhQB2kCHXooqJ9O4Dg5gy2hZ3iH33QGqQB
         0xv/CpYSvPy8V3V+QXzUZuZslGAIk9xUz+QEDujinAztoj1CEVwKMyKEM0mSGoBjCita
         xaMjjECpsauYOvAKXz4p8CjswITopsxtw7c3Hy/KyliRk0hhc9JOjCsemUPS2i2VMXvp
         h7QQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzSaLLbM9os51P5iGjgNsQinZNON1xTlBgdS1zl/1whUWc5kLW3m2cx19HHnhdK+zjMa3f+a1MvoMkM9CJx+p8PSZHL+D/G4Du2ffFd5Il
X-Gm-Message-State: AOJu0Yy8aaccPLqdWKIfddjoMfXr/+jcZaR+XsRoY8n2qZ1sfM3uC3IX
	zEgZcC6pfzZ8oG3cSxi4OKQ7n50D3Ji3C9n0GFDvY2b9bUU/0RFCGH9KnhfH/pkKVfnSlVomFGd
	oaQ==
X-Google-Smtp-Source: AGHT+IGgEz8vQb6kJDfYmepGef5RK+eICK6sJFyqtVp8ack5BW5MAFsWuVTX7dDchbUYTS8xXBgD80Wr2iA=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a02:60a:b0:5dc:5111:d89b with SMTP id
 41be03b00d2f7-6764dd9810cmr1252a12.8.1716339742654; Tue, 21 May 2024 18:02:22
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:45 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-60-edliaw@google.com>
Subject: [PATCH v5 59/68] selftests/syscall_user_dispatch: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180225_344555_DFC636C2 
X-CRM114-Status: UNSURE (   8.77  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
