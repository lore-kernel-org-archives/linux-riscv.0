Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69944C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CPTK+sbj2P06UP8LbGXhTTgNn/JQ5BhoOOZt/tan78Y=; b=N/ztvbWxUCN8jAqzNJOoB9nOdv
	uRfGucV+Knh0sY2yNsByyfXOa3LlLCeuPglVZR6Rx+1vTpZko/8RXKunDtOYqkXxlYB/+6xSSNKX1
	uEsfJnC1ab0VvSnt3FIUTuSn+usG09CxoJgDwsBmusi4yrf82eNIQJiar68IU/jajBsdjJocURxrg
	PF9HD/6cWd0gWU5xMVDM4w+7i4Olo3HrOAITpQMp3UkVWn96cQff5YvLwCxHwjmAM3GlT+cOvldR9
	YtybMFJC3xCSKoSqwauK6g8I2YkFv/Xo9qlhs8jew3Bl3b5iNfogkIXI3n4FihaOtAHqvPeMejGi0
	y+md/V8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A0u-00000002dnJ-0bAn;
	Thu, 09 May 2024 20:05:12 +0000
Received: from mail-pl1-f202.google.com ([209.85.214.202])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zH-00000002cdM-1Lux
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:37 +0000
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1ec4c65a091so9647985ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285007; x=1715889807; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+ccXjE517WZwlLlM0behvDO/LOfu8pdZVCqhExHkVOs=;
        b=yzEx/CZLrIZkl3D3pTEizImjHHg6jxNGRw+YfBDc6rLrAl4npMfwG5LKWk980xnvqI
         Vtc/+80he66J5QQRNUM5CKEiLp7ygftPUjt5YFISjg7EUqZau7sdMp5eVShx4Lxx8ZrM
         MqRQyhKMHQg/qZoD8BMd7pYmoutRedUZb/PGdYY3RS+QmEO0OfcFkYQlxQaMXk/hk5Iz
         9GmeMHhVPu5T12Hfl3QiRh7nM6g513qEwu5+BGeZD6+mUHOeLWZ1E6McFTpM87jreKE3
         3Kp22mQ2Ldh+5MayFW3btTD6hefU27x3GLSlyEGUDvWtUgsYopp8oLGHVaU/QZknoawP
         8xQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285007; x=1715889807;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ccXjE517WZwlLlM0behvDO/LOfu8pdZVCqhExHkVOs=;
        b=SKANo+76whQbzpSDJxR/bKU3FkbnH8+q2QBaKnlKxEtoRNzEnVw8BoWNjSqO5ElieN
         VnlaFmzxqXndUT45G81ezB1ouK4EVSm5FeLDjfQljGWRzuJtfUb6CElHouUH6717s1QQ
         QBSf59FIRY5Q2JFWNE+MwcSxIRLwNozATU0BznuyGVYA1W/kNHe8JInJWdNwhBeBPvdQ
         GRhgrC9iM5MNL7gXEQWNslr02nCwVMkLslnuMNzQw4mwbk4qHviZEITpl5DT2BrJD6du
         Uzfmq+xgHvcur91R5QmF3VU7cHmY37iF0R82pasfJm11L7ef1A2EoEMHR+SGnI7YDyRj
         nTkA==
X-Forwarded-Encrypted: i=1; AJvYcCXTc9wyozkoYF/ug/JWQNJAbnjxX0vLdYnMVCflB/IrJdc8tf1H8DTcmY7y+nfEbmF7MXy6zRlk37ufATKYcNhNdU7Wh7D2JKK4GvYFU6fh
X-Gm-Message-State: AOJu0Yx/MBYQeXSXGl5PlBt5wqDRD+LGjPp5zpnIUDK7Am6SQ4vYQ9kQ
	QzSxkMki2inAFsNDXXCTYJx4VMmgPRA35dGowGgwUw4Lqkv+aq9N+nLaA/F9bHuATfZoGJ0bF+o
	FEQ==
X-Google-Smtp-Source: AGHT+IEmYCo2fAVcVFzbT06uCl1b7km+bYO6VkBBGQbcdnBxjbxybQ275C+Yl6mrmjNooG8Mn284PxdVRnw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:d482:b0:1ea:b100:df14 with SMTP id
 d9443c01a7336-1ef43f4ca81mr428645ad.8.1715285006518; Thu, 09 May 2024
 13:03:26 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:46 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-55-edliaw@google.com>
Subject: [PATCH v3 54/68] selftests/rseq: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Peter Zijlstra <peterz@infradead.org>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130332_019992_D26C0409 
X-CRM114-Status: GOOD (  12.79  )
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
