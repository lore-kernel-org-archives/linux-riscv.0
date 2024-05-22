Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5460BC25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=gD7L+y6PccBAtgh6dW1lJJiuVX7L3hKws5KNz/dJR1I=; b=U3PdKbUuqVROgR7IrZmlLaMF6F
	Pic+l5+IzLzhElOqMOnAHAKzpSvfJsTKqsz1O6TY2EHSWZrH1Mo2nyTOfPxlTfNU3hXGiHDtCI7fI
	AA4siZAm31wZjRZZ43Fjl2tiQLuX9DW6Ru/CMENDPQeVctxzQ6qZrkieB86zaVOiFgRwaDSp/6YQS
	MEdNHLijdcvER9vgqIMr/BfT6NmPY5+Yj2pn+NIdxf2zacKmbtHWnU/Sl38ydIc/tvgNPtvyJqEll
	dO7MQSnFtRr3HiCHTUyhtgk4mdJNMS+DPmLRhCS2rtVKR7DlXq1s/SPBiPRIC4RyWUiudNcNzSf5g
	FWe2FxxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aOj-00000001W20-2lG9;
	Wed, 22 May 2024 01:04:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMu-00000001Ujp-1vIT
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kP/Knjhf4SFsVRwH8LUfRCgMeG4hW/KVD/lToAICAlg=; b=Y4dm62yGWSDsokc7z54ILFtkBx
	SQWXklvmuvPM5z8GOu8SIqQyN+fVJbrdz73tzlWT33eyCC4mfZmZ8MfivKeQ6O76LswAIT68MjClU
	piK9G33ySR1VQ+NS2jBNIib/XwN0/M4PSpDgWHwaoKX+iMvrEQmiQU+IDpqHU2fVEKyMbwL7IGXB8
	HbxXxFrcHZY0TquWmNnTe3wgCg1ghQSdr6wxszEglLXzbvJ7cCsDap8f7jmXZ+1o1vbT9gSwB032U
	WTBlXGqwQT/yog5B3eXCrI+w+hHzYIlwFJ8N5pVMC3ARi8lc8xCZBUl/A7MmqdrbcV0yo62cbI0u1
	9a2VEKww==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMp-00000000BB7-3JGF
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:11 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6ee128aa957so12938939b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339724; x=1716944524; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kP/Knjhf4SFsVRwH8LUfRCgMeG4hW/KVD/lToAICAlg=;
        b=TPVHl2A2X/ERyWslnSaFBAxAYoeYpTQ2avcvioK1qoGSiAIYlP6Aj2dP+ESETJ+CVa
         Zjku+8AWYt5L8il+V/rb08FCAkDc48jaoaSKwNu8ozNWhbPDBZCqXC1YP3UzQx+USeZP
         +GAwkpP68ew4lRltrhu2U8hW21i5MRHsfWCjAN9eHNmne6dK6AWjyjQPFWBG7B8A1Lq6
         +L1JbvpfsvLoE+ZOvT/F/4YXzy3LD132DqaDtW92o+hFCD6GvkqWEGBrAMhClA22DzLB
         s5JGUte91KE/1D/RCQR/p1PMrSTpxY2VKrqRdcwgNTeRT0DLl3LMgfnL6TJHZ3DWM1J6
         ggDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339724; x=1716944524;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kP/Knjhf4SFsVRwH8LUfRCgMeG4hW/KVD/lToAICAlg=;
        b=f1mAu+KNOIfVXOvynFYgOG+AMXArjv3n7LnUQPSgO1aKbeVhfZB6quwu1GEeQ/xRWd
         LQkoLTYxo7ZZwvI/lu39PCe7DvI3O8sj0O21OjbYiuNyHy0heEFI4ryJAQZS6peOKxXY
         MvuZtCwkiCxA9Fggp0wZITCcq2JXgqbMk5Tqe7LUOc7nMaWZkymBL4/eT/WtmX+XS2Rc
         F6sRQ5CqjTAMoeovOBRWnNLVcLLhWRx7OYPK7IeBnIhd8BQgJGd32KHoY5A2pzM8xVLf
         A+e7ntXGy5g9Hq1X/b88er8qxFgt3dQs6V6Dups/8CPnkkM1I9M5/QFaYQJFqhLKZzJ3
         UKoA==
X-Forwarded-Encrypted: i=1; AJvYcCUVUFLva3R46nnfRu69mnFNpsY44xL/u191T4IMfbZfy0oNXdaKlRwPpZQD8Ej0koA5Z5dI0sqww4BWepsB589tRe7e3UofTLsxLT0eiWvE
X-Gm-Message-State: AOJu0YxuwOvxYbefihzoS7iPT9+4SdZuFwzJ4Uw5C0K8u6v4/od9IA2e
	F3lJzXQWDczOFEQkZHDZGjl5M/ApWpti7RLnCvSap1hwKWMy0JxJ2aegwTCjKL7swAHRdftPb+5
	4Ew==
X-Google-Smtp-Source: AGHT+IEvDtPSiLTFtlvXPIFv99iXZCCztGsx6QawF9KvaqVTg7Gq0oD4ITtqI3Ma5EdV2kw2opd39yOFaLc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2d1e:b0:6f0:b53c:dfa5 with SMTP id
 d2e1a72fcca58-6f6d64d913cmr1965b3a.5.1716339724459; Tue, 21 May 2024 18:02:04
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:38 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-53-edliaw@google.com>
Subject: [PATCH v5 52/68] selftests/rseq: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020208_020228_E7E8250D 
X-CRM114-Status: UNSURE (   9.37  )
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
 tools/testing/selftests/rseq/basic_percpu_ops_test.c | 1 -
 tools/testing/selftests/rseq/basic_test.c            | 2 --
 tools/testing/selftests/rseq/param_test.c            | 1 -
 tools/testing/selftests/rseq/rseq.c                  | 2 --
 4 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/rseq/basic_percpu_ops_test.c b/tools/testing/selftests/rseq/basic_percpu_ops_test.c
index 2348d2c20d0a..5961c24ee1ae 100644
--- a/tools/testing/selftests/rseq/basic_percpu_ops_test.c
+++ b/tools/testing/selftests/rseq/basic_percpu_ops_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: LGPL-2.1
-#define _GNU_SOURCE
 #include <assert.h>
 #include <pthread.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/rseq/basic_test.c b/tools/testing/selftests/rseq/basic_test.c
index 295eea16466f..1fed749b4bd7 100644
--- a/tools/testing/selftests/rseq/basic_test.c
+++ b/tools/testing/selftests/rseq/basic_test.c
@@ -2,8 +2,6 @@
 /*
  * Basic test coverage for critical regions and rseq_current_cpu().
  */
-
-#define _GNU_SOURCE
 #include <assert.h>
 #include <sched.h>
 #include <signal.h>
diff --git a/tools/testing/selftests/rseq/param_test.c b/tools/testing/selftests/rseq/param_test.c
index 2f37961240ca..48a55d94eb72 100644
--- a/tools/testing/selftests/rseq/param_test.c
+++ b/tools/testing/selftests/rseq/param_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: LGPL-2.1
-#define _GNU_SOURCE
 #include <assert.h>
 #include <linux/membarrier.h>
 #include <pthread.h>
diff --git a/tools/testing/selftests/rseq/rseq.c b/tools/testing/selftests/rseq/rseq.c
index 96e812bdf8a4..88602889414c 100644
--- a/tools/testing/selftests/rseq/rseq.c
+++ b/tools/testing/selftests/rseq/rseq.c
@@ -14,8 +14,6 @@
  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
  * Lesser General Public License for more details.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <sched.h>
 #include <stdio.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
