Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E336EC25B79
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=yDta1P6QMSkRab5hVhHKmqLARegRv8KgBCUqaD3MJtY=; b=Vr3Tmnwg6pIY2z7p2qyIwqdUCg
	xIpYNDBFWlO6Fh2yDeVREOvb3pCr6JGJmkZ95fKAh699W8Im9pUIuHcjKgFMr+62sHpSSJWNsCiPo
	Lh5vi5Xtxn48huWQhoACkMMq6Q+HgaoEqwNr52vJZ560Aeof94ft4mL/a+Jqq1cPkLvRw8WiIemb1
	v1XRuWA7fyZjMVfADOdZDp5EBqmZd3DXz1uISWkmvgzjJ5s09ykAWCw9Q/y4vd8Xh2LZ2/oliQtXW
	pGbFSS7YNr46gbdUOdF9tXfNVlweZ/lF5+BjPzBNxEJX1YljdukTyvjoXejn+kdhsuwwgw7U/Z9Eq
	q16ixBoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIn-000000036KM-2DR1;
	Thu, 09 May 2024 22:31:49 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zd-00000002cvP-37vm
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:04:02 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1eec5aba2bdso11205265ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285030; x=1715889830; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BYMEuhcBRYdrdeW7LE9Reeo43EZwSWrRoGWRRX0Ndg8=;
        b=0QuXNaggvzj36okTjz3niedAYDIlxlmeZSL2PsnmkfKYJ8UiO3tVlfd6Pd2rfhYEJi
         xZ+Zcyvo/KURoDmTPnOYu8sgbHDU50ofmt0zolsePTfeC5h50IjIh7nUPD9EMXqG+jVn
         Gtk4s4kXtZH5mJHQhOteBcRsWxduZtDj1x5r6nYKBiDHiOhiRxr6Hso1+rPb6nZx8ILr
         mLawpm1KL0KxziW5WsZ3+gJAcAEZdMR4F1p6jzJSGemZR8UnKiGjnDaidlgQw1He6gCr
         W0jauKUiP3/r3Ru+bZmdaMohR48LcluBHNkrUNXi2FemIBoiKuBqv9LFDTUKeDA/GbST
         slsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285030; x=1715889830;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYMEuhcBRYdrdeW7LE9Reeo43EZwSWrRoGWRRX0Ndg8=;
        b=uRzoVciV160nTwmH6VZNu8CRgHFH8uz019BGk0/owzbVvxtQiAnE+GFPdACTT9IU30
         HetvpNAA+pAxlHtaBoRndz7taEgRWX2beQdNNBRaA0pUNxWtzITADIf0NyBFOCppiSQ+
         HBw7xx8YRpXQIZHIFT6DX0512xy4nXM5tALOnaACLY07veIzoxp0KmYVH2xycudH0UoK
         ocmDq7wQAYvTNETRMThpXrwQhKVxMi1D6McREzNW9+KNQ7v7S7tiDOPWgOLsgTvWxcYL
         ek9phpgTdwKmFCLq4hJ3MZapSw6v7pV3FxnbKWGwHvdVdL36fKa3c+tzjhw4CPDqOjuD
         P7OA==
X-Forwarded-Encrypted: i=1; AJvYcCVHx52Y6sOaY5rv1SlgPNwdkIa9n3N6Cf1fU2qtdyWK8t40q+DTEdVwIwYLwmm8QhqGbD8ONSgP1OC4VdF7obHWmga3QCwtZ+i6nn5iVckl
X-Gm-Message-State: AOJu0Yyod3WvTIEXApojnCKOXeoEzx1Bs3386IjD83dBwrPD49iExwSz
	OaM/jc05tbhCCjtHGpFjls/t7X63a4lJOy+RHGqu+HmwyVCs4dsdttPf+8xXo6wPdTPRjmq9lJh
	UgA==
X-Google-Smtp-Source: AGHT+IFK4/DhkdFo2+zYDUlJPAtp8Ut0S4wXPjECFM86q7sbokHSPV+dZI7pDpMCgQzT+UzCnASUoNwUkRo=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:eccc:b0:1eb:5b59:fab8 with SMTP id
 d9443c01a7336-1ef43f4cbe8mr20555ad.9.1715285029544; Thu, 09 May 2024 13:03:49
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:55 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-64-edliaw@google.com>
Subject: [PATCH v3 63/68] selftests/tmpfs: Drop duplicate -D_GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130354_103778_C43B8FAE 
X-CRM114-Status: UNSURE (   8.78  )
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

-D_GNU_SOURCE can be de-duplicated here, as it is added by lib.mk.

Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/tmpfs/Makefile | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/tmpfs/Makefile b/tools/testing/selftests/tmpfs/Makefile
index aa11ccc92e5b..3be931e1193f 100644
--- a/tools/testing/selftests/tmpfs/Makefile
+++ b/tools/testing/selftests/tmpfs/Makefile
@@ -1,6 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
 CFLAGS += -Wall -O2
-CFLAGS += -D_GNU_SOURCE

 TEST_GEN_PROGS :=
 TEST_GEN_PROGS += bug-link-o-tmpfile
--
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
