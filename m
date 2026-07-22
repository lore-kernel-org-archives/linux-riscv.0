Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AB0C44539
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 14:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9WeYO3VlqFq12Y+916Br7gxsDiOTMuLWHYs/Qvrnrfs=; b=mU+zX2ubJD+DV7
	9+QoyaJL6vUb6G931chMbv38BgV/MCA7x4xS2QyXN4D09TthgFGg38iapzcK7HktXO26GKgUfPbnz
	s91/F4Bd9Kp+8ota0rVJqxpIgQ/l5i8m8C2x0ahtZlo7ArP7YdzKEbfJmp2+A4EKOrbi3mq/Uwpx7
	fuui6YKIjT+yS/PuRhR7cVFy2q58H7M0nJno5GWxaEz4mYi4bUEXvnHjjhnPL64PPX+vJ5tyQLaVK
	0Ahh9jAPGpzrwCnCiuYLUFXnZf7eskiv9SAD7K6tfB7CpQb9a8sdJp3uVnBWQ1nNIenRPIFQ2+kZZ
	F+FUaOcwfFv24VXsgIdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXVC-0000000By0A-1HXG;
	Wed, 22 Jul 2026 14:00:50 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXV9-0000000Bxza-3ItV
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 14:00:48 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-8485b358552so76470b3a.2
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 07:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728847; x=1785333647; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AfYPTs27MYWGdTxiCTfoJlFIBIXHokfTJQCS/9/yrrY=;
        b=YqYmMTWDXZ/1xIidjpfUrAj6i/d3UE+uE9b6SQ9MJqBPTIHhbebfTuABxPspwDja1t
         LfmnWRWjQij6irUZwyIzfiYx90FctVso1ROA2AnkqwGGOqVn4g07rKqTpl9yYCV2yGHT
         iuzMw/17htAh9R6XSbXHw7GAzbiO0ba7D33DTUTjqUXXrSZ8TwK2pLFvoaiMfcTkvAc0
         lf+SZDwY5Oq8dsYI2D3BtJ5LulNUOC4z9YImeEOqQ1enGdZc+2d+/6VdgjRUEsu0bA0n
         Qe1Og3HV/guyBiDZEQKygesn3tP9psu4V4EiIN8TVrXCyrMIC7nOf4Q/AzTPmfmURoGV
         GBHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728847; x=1785333647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AfYPTs27MYWGdTxiCTfoJlFIBIXHokfTJQCS/9/yrrY=;
        b=kAyHsYeFS1h/pArUklRxbswzA//A2AmP7CYINNwdvDhWyTMjKyozIC9PRG/9mupo7O
         IoEJnxChFBqkKgzOy4l/4GizeFiaCSzgJJT0MlsLtjUFhmKYCOsHSzsIuIUCNA57LdoP
         fQ7OpRylCReXjeoXa244jLUzPN9SbwJBnp7Wdh1FnKYBUdsQ7bxg9JfH3kzzzoikTlNS
         xkY/OnIzfBHf34K/9u9X5BUAwAz/1evnTJ2SLuelyehUC8kBoUg0Z8MhtiL7cM2VUXWm
         ypf2LtkCbtRIqo/zJzBy5vcmgB9KTEkutmRl5Lmsx0zHXOxXCXJP+LsZmQAhkUA631d3
         dIdg==
X-Forwarded-Encrypted: i=1; AHgh+RoABHu9L/3XHZLKSOb3+AlhKEcz2V09+NmnouY+ZYsAzWGMIoC10F1EupQoVkxj7vC/k+VvFzYKFv/wyw==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh3ETUqOvJe1I5W6j5Y42JnacbaKfHs+5u1f30Q3LY2fy/9OTW
	OfyzWwabzypJGOPqEc5azXbrWboLzBx9zsyXZ/hjf3mi7exJz5NzeruC
X-Gm-Gg: AR+sD13IBwK1KDmJj2PjRybeHzWG3Qix8n32VRXlId5mUxJuxQ9nSyl5TiQXKDPZ5Go
	SUGPZfNMdoQMr8FvTWL6NiCKX4+ZyaSyVZDAoprHkkiEgeWxCi0PeIqRgzpiynQik18dxXqznrC
	JF5DFvi0t0lyDD5UHM+Knjq2aiFa4+Xo2VRzA1SHnhCy+9xykaZnN1OndyEX+CFNho5YoSVadWp
	Ko99Z1/foJ53FLtVgq+iCy0IM40V3B3PCKVOpc4gO1K3l7fPSDRDSgvMrSxlsfjdZOyCTCkh6GB
	NN2gxN3bBxU2lvlVfVdvTRjkgh/rB7LEIu8QGxoPF9ZOK9ipyB1t7skYNLA8V2+laYC3PMuCZkp
	QyWIBV6RlO6uwAJ1EeljcAZtkMm9Ao481iBuqfKy2rJkXgoDG/V+wGL4LFyiH1MD5Q/m4H0f/xt
	oHyiZFzTK7JOF9xK3GdZ+JrE8MKDNa2iKqJkejiB7CHy8jryo=
X-Received: by 2002:a05:6a00:3a21:b0:847:8d2d:712f with SMTP id d2e1a72fcca58-84c29239a02mr24030412b3a.10.1784728846034;
        Wed, 22 Jul 2026 07:00:46 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:00:45 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 1/6] riscv: Use arch_stack_walk() for the kernel callchain
Date: Wed, 22 Jul 2026 19:30:08 +0530
Message-ID: <20260722140015.1982158-2-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_070047_832689_CE6908D8 
X-CRM114-Status: GOOD (  10.08  )
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

Replace walk_stackframe() with generic arch_stack_walk() which
already wraps walk_stackframe() and is the generic mechanism used in
archs like arm64 to build the kernel callchain.

Also decouples perf from the internal walk_stackframe unwinder which
is modified in later commits to accept a different function signature,
which warranted this change.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/kernel/perf_callchain.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..93a12d53aa26 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
 #include <linux/perf_event.h>
+#include <linux/stacktrace.h>
 #include <linux/uaccess.h>
 
 #include <asm/stacktrace.h>
@@ -44,5 +45,5 @@ void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 		return;
 	}
 
-	walk_stackframe(NULL, regs, fill_callchain, entry);
+	arch_stack_walk(fill_callchain, entry, current, regs);
 }
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
