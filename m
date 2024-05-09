Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBA4C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LJNPXLP9HtT4XImCiBfNo7EpO7PidVP85+bfLRcyswU=; b=RTuGnuVT/vjCP4PT5iCrBkqgRz
	P+hRsHcFeicEgLH+6wMu08F3XjrG7KzrSeKc0wZRYKwnib6e1SbUd1x5TyizpjCrbIGeddPZwC1Mg
	OpeRDkrU0lXF75thUgSCxmlCsHsmZ+yEd3friNHG2Lc3VXLzkiA3NIeQEj120mSTsgh4YKHtqsCvy
	SWmJiaR+XZTo1izM5CMx513THnfoQR3nsTqgR9vZ9Kzf041DSqSSOT2cWFA53rLzlpUEkuxkkkxxz
	TalEnRFFl6Fq81g+e6Tti8w/6AkzKXzDuxeolPvJKnvV+ITMreeHrs9px6eBp77wrqooP84cCbNNs
	A5whkdPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B88-00000002u9i-35Sx;
	Thu, 09 May 2024 21:16:44 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xk-00000002bSX-0lsI
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:04 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-61a9f6c869dso1103916a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284912; x=1715889712; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=29EvGICOAZ0F1vgmDohmB/AvF71KDeoXeGxlYusrQjw=;
        b=HD16dc/XvpKk/ESps3L6jgtIPUN2hG79SV43pvYDfEwjS2gAf7tlUDtl2J5TuGqkwz
         vVS7R768YAXFOG22ObIZGnLj2oeJIjq1yPNae6EeGEnV3CbELw8bqzDSf7GPZs/+0TWt
         1MgzwYKgMC/buliiCLVCAeD0hSUaWxX41D5Xh2MWHR/jsYbtpLgw466LuFrqjnRUXtES
         +y7ts54YWCesaifhCB1+JtqwSqcl86kpwUyQUL9h0cZ5g5z1Qy05RxYmv+M3P4haiz2b
         L/rJmmg4h8kF3FMCqErgIw5d6kZOvdYwGOX6ZVAo1G3JJUYENGuPxyweG6mhH3T2chkb
         fKXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284912; x=1715889712;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=29EvGICOAZ0F1vgmDohmB/AvF71KDeoXeGxlYusrQjw=;
        b=oT7TuseHu+2nSeJWxFG8cqF+QhiuTw2GppD6BA55ICVDs0PZvtbYs0I1Umx4GB26MZ
         GzGkxwCl8w7lOV7k37i9Xu7quzMuWbHtz60Hw0nHrJV4Jw5xOrtPU0TtWKWvgSsZMNHx
         VZmxrdU/Z1zDbq1GZ8pf0Ns7YGQBKNIHN8mhG2Fse491X2y8wUNJ/AEnS4YHQpTKe5t7
         hk7+OhPbNK3gKmlSICZb0TazNNUo4A9RYUgxoGK0AfHXkEosGFkz25gfQKLuXmOqj2s1
         2rwoGvtKl/nrw2hAPDXjOYlblCizXWMTL6dUyppUVWb534nBfoW5vl7xUG8nE2ppWJsW
         FFmg==
X-Forwarded-Encrypted: i=1; AJvYcCWMkMie2y7jP0eKGJDmEF0GexMuMl2POvrwF9s1anuNa9EwxNELJ5CSmPV0eVQeyF2KuWbkNN1Q+NhdnNGL6GBwFooGXxO0fcFNeJoOh5Kv
X-Gm-Message-State: AOJu0YyQk4vkrfbOyUcvICNBFlq5fjekW6GDknpbjR4t1dLnY4MJRs5h
	IuOayZWj1n/eteM2F641SJbq9XGlzA8QDhGWMeorlyPP7NV5mviyMGbYGJk1szXmSaThxk+lHOp
	9LA==
X-Google-Smtp-Source: AGHT+IExsnAklZVtVghvLsMabbdi8FZgDS5AyDRMtR6GiyjsnqQrJZG4Wi2JzFqUxOoc8PAeH7g5t5xlaP8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:2742:0:b0:5dc:8f95:3d with SMTP id
 41be03b00d2f7-6373e5492b5mr921a12.2.1715284912360; Thu, 09 May 2024 13:01:52
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:15 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-24-edliaw@google.com>
Subject: [PATCH v3 23/68] selftests/intel_pstate: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130156_602441_0CB3025A 
X-CRM114-Status: GOOD (  10.19  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/intel_pstate/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/intel_pstate/Makefile b/tools/testing/selftests/intel_pstate/Makefile
index 05d66ef50c97..f45372cb00fe 100644
--- a/tools/testing/selftests/intel_pstate/Makefile
+++ b/tools/testing/selftests/intel_pstate/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS := $(CFLAGS) -Wall -D_GNU_SOURCE
+CFLAGS := $(CFLAGS) -Wall
 LDLIBS += -lm
 
 ARCH ?= $(shell uname -m 2>/dev/null || echo not)
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
