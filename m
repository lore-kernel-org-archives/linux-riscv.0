Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74C3DC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=kOxFeOizocLbbd8aPUPcwjkYo7Fw4BvzSHZX6aRg5bk=; b=Hy9pD4GA0KFnyDzjlaI2QPsLrV
	sVD1tmx85YZYNhCzwFyam7M7VJNX5YLa/9smx4zUU1UOh2jfcqJyz4pnpIqYeOk72aDHFRi6WrsZm
	DHN/JZQ/0WUILg1/XZCZJ2UbLUIsdnAHKJwuw92J0Xjz/xW7AhOSyabunze4u7hBZsqzYko+MQk/4
	QOoMlpkdfjRdPkGHUllwFp/bdTzWMTta1CqqdyAScw2meSVjUlEfZqbjHkV1NvA/blEstxk6sIzmh
	lHgVFNpMfU/93Zy2eTQ2ZgjiEELpaxFeE3XXhvVhS9uuiDRyOMmR7qVfP1wDzi5gsn5g3udiGMr22
	dnDz6QhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpX-00000003MnV-3l0H;
	Fri, 10 May 2024 00:09:43 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DpK-00000003MYX-0ZoO
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:32 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de57643041bso2464037276.0
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299765; x=1715904565; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=320iwINBDe+YZC8kG822TZZWXwM0JV4KQ67hb3vAZyo=;
        b=y+7rPksevHjo4O1ytmzLdFklzYfV4hovO/6eWHtEa+1qD+6kdfF5xgMStb40Dq6GmL
         YfPHdLCjZbGLmN4l9CMeSuF0hgfRRq5tUobbFBpTsXx0Fpbq2RILNRZ4dMXFmoOEwEU0
         qIc5NxiENyUcP4JhKCWBFnEjpUFPDZXHBv10zjC4JMirQ+fWO5ZaIX6/woGgsyeNelPA
         UhdRXiOcJ790TTjto5lawoFcOqpzAJFmUUQnQkwV6X694ZL1aCSLmYaJcF7qeoFItv2x
         3NIGOGGysCkyB9zBEree+cg0/n4qXboSgTjvWv6tPaSyH8qItqoit5+8GEniNTZu/P+d
         49ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299765; x=1715904565;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=320iwINBDe+YZC8kG822TZZWXwM0JV4KQ67hb3vAZyo=;
        b=uAykmnEKNeabubV2vCYSrs27H/zqpWrrvVD3KDCgYG68b6EwHVQQKF/evyLeP6dUj+
         DbrNm5YsZ0EGCfhoy6MUKdZ7xyhkuxgJ8Wopdw+iClEhud95QpNFeYxjM2Qm5sWPsjbh
         4gvU18jH2Udf/TntiYUUWxzHYs4fWhQB9tx48QsI15il3KPJqjJZAF3a++gOzsFfjl4X
         Ojl3oQR4FKbKbAHWWlkc3Mw87cbpl1d4eiqDd2QAGZVtvt+h8U6bnfYbwCvHbD4+435j
         LnZgQcCP14TOxIY3mh3aOAKzX0RaFEsHQyrnQMjGpOHvUubjjS/cLnql02Q1os6ze529
         bDYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfxWTeDdANsF17Xdy/eeTmgi+PG11Ng/YdQkVNsL3T3sf+peIZoJO6xuMKd3zQCWHiVoGUCCe7ozV1tVUIts51+gGU1zTZdO7mmDYyId8t
X-Gm-Message-State: AOJu0YxQs87dzyGkuIx1cXoDZ5DysPFLKWVB2a7vhIKkeBy0Km9fFuIL
	HWfCXd00kxJ2xytfBux1MsvzmiK7IsWgPyWb/dAwS92QsNs9WISVZJx6RaU0aab9uY9xGfxcLPh
	16A==
X-Google-Smtp-Source: AGHT+IHhdRVjLPgT9pC+WY2EF++s/VK65ryEcaU+G/FrBzkZfRWKSkfQV4/cEEpi+Hrs8H/1X2Pp5ybXSbw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:20c7:b0:dda:c59c:3953 with SMTP id
 3f1490d57ef6-dee4ef7b783mr307444276.0.1715299765371; Thu, 09 May 2024
 17:09:25 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:23 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-7-edliaw@google.com>
Subject: [PATCH v4 06/66] selftests/cachestat: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170930_379109_940F887B 
X-CRM114-Status: UNSURE (   8.73  )
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
 tools/testing/selftests/cachestat/test_cachestat.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/cachestat/test_cachestat.c b/tools/testing/selftests/cachestat/test_cachestat.c
index b171fd53b004..c1a6ce7b0912 100644
--- a/tools/testing/selftests/cachestat/test_cachestat.c
+++ b/tools/testing/selftests/cachestat/test_cachestat.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <stdbool.h>
 #include <linux/kernel.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
