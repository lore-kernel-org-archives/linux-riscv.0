Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76515C10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yJdl670WjBZoOHx7PDaOlq9wIEgDFQVmDnraF+Po3UE=; b=cBE+g4wEho623ccSBjoEvYMJo6
	nB/V2ssLVGN6WjcsepeAYsl7crqrJcDfGDjtGHX2zkPCqIk7mZWjGMe8TjWV3KXDfw1zLM0huAIf6
	Den+vRGv/RM2A/UONeb0KAbsfoGRpBHS/uxNtP6SiBYqnpL1Crp5FcOQL9z2HEdyvIcRUlB+An3nG
	MX81/Xkzlw7VNXq7qHIoqz/L4jmsyy0CAHoGRDn3wuJ3SqhHpWhElESJP1rCSfzbkH9BXPIpounHA
	D3ukOSGBSB3E0SXNR6J7J0pYhrGb3dxYb2folR1jMfKxrVbO7ieEdEofBgiKIdR7ZY4n62RUfM/QN
	Rby+rzkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dsb-00000003P76-0A4M;
	Fri, 10 May 2024 00:12:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrY-00000003OQi-0B1t
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:11:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BLIfPVA39L5GI7BSivGjVMs24Ei0WVbUZT0FyKIU17I=; b=ToSEMRlgvJUqBHIsObXXZd5wC5
	n+8Epa99HnqecNLCoA/ZAjtOr19KrDYqmmamtO2TB0IQWPjCXxiLuv7sN97iBfRExaQpDLxRfE6uo
	1g6S/LpAVYvDRepCD6oAcDOr9aHuSZzF+IakASlKygfUdzwsNM3JjlociE5X6FJO8sdHLFDId8rYy
	1Gtz3Owcof9DuZAIL1PCj0UXFmpcpYZAhCI+fFzRSWFIgHxmzab3X7okE7g691hPMB57zpAydjYBJ
	3Evus8pMhaUKgDsXC1X5RlV+Igqb5EQAo7YhGqxl1QIpn+XShhgXHjw4GGIWaNbVEUv5TricRzg3d
	/RbNHqnA==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DrO-000000036M0-14iG
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:11:40 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ec3e871624so13833585ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299896; x=1715904696; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BLIfPVA39L5GI7BSivGjVMs24Ei0WVbUZT0FyKIU17I=;
        b=h2TPg64jMy0vfb82M4OtLEiS5Ola0QFHQkNfItPWlDwHITxFVidRPj52pP16h0x7pc
         V0no1P5w+BpmPN4DxgvLoQmT+kiSxHQ3GA5QQGvJS46ZBRt1J38ijlO2YZGvN3mNd65X
         XI6TZdHuoaofoLT51CvU9pY662sStSfeeRiFMSp3FpzcCuoHtrgITQN8m6G2J9/Y5Q20
         DTFcQMeNUa2BR066/Mf2loiw+VCCTsnu2MtbJESGCjGV0Dtr5A9wn40gxc0pQs5QuRkX
         kMoRgWH50vK2ZYAfoS3B5VhOsH8qKpEsnJuNeQIcq7DL0akp6F+DRLLUcT4ouCQtnasd
         FYlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299896; x=1715904696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BLIfPVA39L5GI7BSivGjVMs24Ei0WVbUZT0FyKIU17I=;
        b=l1DpMB6XLxem+aqmdcHexRxsgFcfuXVF/qaPqQOT1viP4hmew6H1qFLWf/8a8fRWOc
         ekb/S5i3sRIb8Zs46yThvXONrwubMZZGNhYlf5lHfqR8UuJcPJ9GMLl0fdeUQoT3m7pU
         bZWgDQc73wldnUmUUYJ8DsdwLvx3l9YK0Flrj+ktQJZajYWLqpItAC8e8SV+pmMdJeDv
         0x0cIyMqP20LL1qYac8MzX7Y3NTQ9n0Q51XT1Ibt6y9vOH/M/nMhdcOyf+EY+A+iHLkq
         xeoLWYjfjrq8d8m2Lftvwo0zl0jvRuJLmitAcGAEVypRG2LS2Jij8KsVbkAGBvE6ObDM
         dJbA==
X-Forwarded-Encrypted: i=1; AJvYcCUbuKuOfx/KEQ4Ra4V7qdUC+jRZspuZHJspqQtlypI/uJ1tOIO8xckPANKPluC037MqeHdRVnzn2a4ARSTGTc4B9vYIc8ew8t/o/wD/npM3
X-Gm-Message-State: AOJu0Yz3XVxLYM34atrt08/nK3Ejwgkh7dnbab7u8eddPFyAsEDozeKz
	AUdu6TI0Ghlso1vpllJcTlXRElGCD2BH8h79HXYOEoODqWCav+r6jo3TgEd3YX3xjRZLwBuveBv
	3PA==
X-Google-Smtp-Source: AGHT+IFtfbvY/gKNd590DPbi3Q8xYAZ3vcX3cNU4cCMn2Exsx2DTyqLE5W9LADivebCpRTu48XwgWckzf5M=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:903:1d1:b0:1e4:55d8:e210 with SMTP id
 d9443c01a7336-1ef43f4cf18mr628075ad.10.1715299895951; Thu, 09 May 2024
 17:11:35 -0700 (PDT)
Date: Fri, 10 May 2024 00:07:09 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-53-edliaw@google.com>
Subject: [PATCH v4 52/66] selftests/rseq: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011138_599528_91ED89E6 
X-CRM114-Status: GOOD (  11.91  )
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
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
