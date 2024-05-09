Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F8EC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PpaAOgZj6HOjcJvSMAajK4vMld+W3W+Mc24NO0rXMLw=; b=ntacT6DiN/N8zYt/DfJ7SIqoKW
	tiHyGbpG/AxjsvPpyk/c4hwUXbwzWSsdlz9QzAQpmZkvd7Hdjy2vs2i3ntkI1hYFdw+YV6khF5YVq
	8mR1DmwaavRrmoozPKE1wxBbz3hV1CgUbSUyWeETUaGMFzCm/PgBE7Ow52JDeG8wbKQBUiWxK6C4J
	OGuIa95T8ALv0DUVIMSOi5YR408Rj89/rekS3QPWE5+4eE6hb+rfN9Dlvae0hOpHM1URgWy7yeiRe
	ikjt+G9n/9hxuipmGZYsr/P+Nnl4s/+EQUdinIQJrZ0vEjWhqbmMgsCoPDOVze/LEOw6PqY8VICfD
	jHeqPdhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A1b-00000002eNA-2QJ1;
	Thu, 09 May 2024 20:05:55 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zX-00000002cpv-13UF
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:56 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6f441afba80so1382417b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285023; x=1715889823; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=cBjkXNzK2r5lGJvUOfu3vMHyc5JfgO83lVLsEeYmChI=;
        b=AAJDr0Rz1xFKJ87Ldnok1DHKHK+bR9HpxD+OFZrxN5UJmdMzAYDWKaortR0K69Aey0
         FiIILWlI0EXoq7ZNRwWod9R4biXcx4jIza5NwO+TP88+Knvu7jinreVALmgUN9pOcys9
         MHtZFkdmia9wjyAmWdpygH6wQpup6KhpCEbUR96VjXK9lIDCqhzawNt9SR+XNOKaRe55
         JKtbvlzO7EzkosF6L9EnWtNENyAidpQc1OawcCtSm1ti5g6up+G43kYautmJtRLH17m6
         Uj703wlKkVdOWTrnr+aAlcGBhWYIETGIiy5Uc+jLj9Z+o+YNGlsmmokrr1NgC23nFZUq
         OGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285023; x=1715889823;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBjkXNzK2r5lGJvUOfu3vMHyc5JfgO83lVLsEeYmChI=;
        b=UhP6w3mb5B15nx+Y5SG40PcMy6qmmUUiPmMpDjfzQFG4EVeO3vkx5PoLrRjmdr3+G2
         YZS9L2aez5AOcseKhUIOuLzcP3Gt+2u21+wU5SHdbEttRHmdZK+eAo45+hpEo2UuiK/P
         crE6GyzNUD8kQ4+la/XARTE3JLuIL+seK7CTCG5MoZji7rJ/cekSQpu9V2Sfw1kQ0TUF
         waNd62CO4TPF2fXw3oaw9DUrRgOuTS9Ey5b+4zGyZI+Ibb49SdAfCvBTFspha9ivSfhB
         WXFgPVYewgIserqW+4IGzueORtBmL0bdX88IksRPny3eZfSCvTKO94YGqPDhnBLfarPi
         xPaw==
X-Forwarded-Encrypted: i=1; AJvYcCWyXjLmfsWeD7Pj+VRcpyAyIZH0CNVVXqQ34x9+Ri4Eoeo2//zAFAswz/OplTddWzqOxBOvHshn5m38L2EIS8q63l2gume0m6HEmzLXOP8s
X-Gm-Message-State: AOJu0YxA28lBsZQ7P/174dkk+fc5tuYSyV0BYBCJf1yol5V3DDOAc+JC
	W3IE2yGn8Tb2dvMxOU6TFYjce+ILyTasvhkPrbfWKio1l78B+jzZeb/cJDyM0QjD0uMkQoU6/0J
	NXA==
X-Google-Smtp-Source: AGHT+IFZHqmGcMmIyQ8Ew9M5MvOLSCaa/rYeCHYejX3W6r2kpgzCJiC7K7sEuCco6nJD6eLOUsvfi+zaNnE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:a17:b0:6ec:ceb4:d9e2 with SMTP id
 d2e1a72fcca58-6f4e01b9126mr37287b3a.0.1715285023604; Thu, 09 May 2024
 13:03:43 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:53 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-62-edliaw@google.com>
Subject: [PATCH v3 61/68] selftests/thermal: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130347_676608_A9944DF3 
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 .../selftests/thermal/intel/power_floor/power_floor_test.c     | 3 ---
 .../selftests/thermal/intel/workload_hint/workload_hint_test.c | 3 ---
 2 files changed, 6 deletions(-)

diff --git a/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c b/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c
index 0326b39a11b9..ce98ab045ae9 100644
--- a/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c
+++ b/tools/testing/selftests/thermal/intel/power_floor/power_floor_test.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
diff --git a/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c b/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c
index 217c3a641c53..5153d42754d6 100644
--- a/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c
+++ b/tools/testing/selftests/thermal/intel/workload_hint/workload_hint_test.c
@@ -1,7 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <string.h>
 #include <stdlib.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
