Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1D3C25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=WJK7atf3d7JVMpNB+RX96sybLBlb2zfutkpDWdi4Sgg=; b=aVGHiIl95A14HodL+DMDtIpSN3
	aAVxpb/lF/mysP+Iuf90isI4WSG938kW9NgeWWuhBo0R8ZDHgJ4A9FePI0Ym3l0zGQRboBDKWVIhz
	8o3TvRisCXkGd7fiAtOXrvtdBvqaPmbwGBaVIEIQrRRhKL3DFOlTjwKbPfgm3P5S3rnk06FRNYYhY
	ZSLPCGCJ19UF0+bxl9eUes6MWzGUOsFxzv4pZzzXDIy2gRxq1nez8V1IqQzoazRenxypdG4D5k6lB
	Ry4Z5Z4fkyLAU7xsb+TIs9Ij/PsGCqaroie2wbtdaHkRXj+pq6tznqBP/Cq8J+OGAwo8rcXcgxcku
	LknAwNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNe-00000001VCX-2kbk;
	Wed, 22 May 2024 01:02:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMI-00000001UH3-2QJH
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:01:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=a9qeTCFtvuxbGsifiEmJumkkd9/puPZE3ppF8UEgJw0=; b=KB9KTYzcjoFTBAKOC5in1NEgYc
	gnCWQM9Iauekcw91JGFt0UCcZtS/Cq0/RMB2tRcEMZEact/qkmVN8welF/thquWOQmgTTv2a/AYPM
	BNPoreNW6XIQwrMWKT+pkgIjHcVCgQpd1Bw/uiyFAIJSrczL5IXTHFZWNGeKb8XGMAB0vudxXVGOV
	0NontseIOQc+y3ZiqwV8RdEyz6cSUBI+t+5ILtWguWfU+rwMHhChE2vt0lp1u30xkv+NL+7IHonbn
	HZHyZJR2bjfFbEONWX6+hGrQgtXnoRZv5xDdUjEaH/ABB5R8rHpWZcEp3xVP12u3jPGnhCjKDyb6q
	e+VzqCiw==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMF-00000000AxD-1LCO
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:33 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5c670f70a37so12336502a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339689; x=1716944489; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=a9qeTCFtvuxbGsifiEmJumkkd9/puPZE3ppF8UEgJw0=;
        b=0Q3ZYY2JbuYLAOS4xgg8lMtzlsSGtjZ0EclVUpXf4N5yrezNrbna3e4LFYljVW/fQY
         oe71g5jiRbstNfrHwXAZ08sgWuXARE/RtIuSx3v3TF2hIUcdw+w7UXCdu+kfjEUhVnlZ
         R1psun5H74Hs1bjolNrdE/syc2aObdnEZ6pnnRpWhR72gJXARaF7z4A0tOLeZY1Zz0lX
         jVEJvjo7IhWosWVeiaz3c6qJmugO9BaX7RKjBhxrQWK35+lGQ7Su0N60KmMKt5EeRgTe
         AINyEpPDHZmAJ6iFg+g8cJCrFh7HV7IEnF7p/gEImCqXK/7pj4SWpqZtmXTceL5ymoIW
         ycjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339689; x=1716944489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=a9qeTCFtvuxbGsifiEmJumkkd9/puPZE3ppF8UEgJw0=;
        b=B8RDqmJnpXWiDQuxSq0Q/HZJ1TPDRYJXBdj/ZqzKTb2FDdfcRAR05luHCfFxhQrKSj
         cpvb+gpLIqeZb4B9z2NTBi/SkivPtXtTjhK2ARwo5UKCTPt2Q8QL4wVhDTpkn+OnIZHE
         7e34Wi3GE24dibFaGe3iiJSR58fCUyno6ynTO2zgyRFyLe0rgUiAAjpQcMubE4emX/cw
         +Tw6TtXqge1VKHO0aoLOfOwOhhZjy9oBeQMGimLjgMjh9OsLWahYnOXf5oCuGt6/I61w
         c+AmrX1ymr5bBYZhHDEQXNlRSgUB5qKmGTEjk/6TajAs/sl6rBp0OzHepdJOa0dRQ23j
         wUzQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPPlLOkmndy7kf+OfDpSj5A8pcGC2S7DJFsixSSvOMRpyCIXW7wzjF+2qyVH19fFhloVWalR+hl3nObQTUqjIPZk4G//Agg4b7m/yUe+5+
X-Gm-Message-State: AOJu0YwYeLewyMeXRx6aqjqe0LK6hh/tIvql7+VH1NoGVpRPW0M3C9Yo
	PY5b0nw2kl0lTIhfV25eWSxL3GQra35n8bvEm9dbictTN13ca51U2hw6+PL3grqZGAPuo4+wwu6
	isg==
X-Google-Smtp-Source: AGHT+IGEcjqj8zufEeTMy6AMcaIsqkRg6a51FGXyadk70W9VXPBiz86Gg8WH59rMqAlu/ildvCYIItBNoi4=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:dd53:0:b0:658:956f:9800 with SMTP id
 41be03b00d2f7-6764de8cb6fmr2228a12.7.1716339688506; Tue, 21 May 2024 18:01:28
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:26 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-41-edliaw@google.com>
Subject: [PATCH v5 40/68] selftests/perf_events: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020131_503220_2EA4C5D6 
X-CRM114-Status: UNSURE (   7.79  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
