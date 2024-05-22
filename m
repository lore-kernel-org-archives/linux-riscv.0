Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24383C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hePPQInXeib2DiU9wpDYNBFIJSzz3YtdLiDBQOmR0c8=; b=DHw8E6EpZdfQIGtt5Z/KUdy3oo
	4tmXwdlK3tlFsjSugVQzdr3PU+Qgu6D6zUtINo4uSsg6GFH0M95rV0U3251riRDmNFWhPzPLXmvJy
	9G6Bl876VPnv+Rtz2bC7iUQQdLCnmemfayoqc4YM0zWgLSfo8JzYEajHBEJmhSkxlIiKpqK1gP9iw
	PQ41e65z2vzwcSi06N3Ub3et5DMe5Lge62Fybmyq8covKo7bEuDzRtjwx1Ro7YFJPZnuDJW9YiI+/
	niChhRCiJBEP8QUD2/OfDXSyJuS6O8i9X9iTTivlaCi5JJEKGtpU0I73w0fK1MG9qPJ7ZGpDao9Hp
	Qk5tRtqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKn-00000001TAk-2d4w;
	Wed, 22 May 2024 01:00:01 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKh-00000001T5Z-2B8r
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 00:59:57 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ee13ebef37so135780995ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 17:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339594; x=1716944394; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=AWjM7OsrUPOawORB4U9wbeNgOji92nYBHhW5FcjXqmE=;
        b=MscZc+GeXIHX7AVvZ68t5UpC1RpEkOmT95IJaE9GfItLQIRvxRbOukG4VDdsICzHqG
         Rab/deYQbbVkTPCfgRM1l0NP0PflrTyb/GDTCDZerzrVpY7J68OQ5qZaeXy8Bt6XKcwR
         Ddk47j1ixK8W1Lu6BRv30/z/GqKN2xi7j7vvq0g1ncvUfRSyAYJRl6ohs+edpd9EZeHI
         nXVFSDAv9MIVdUjYcdO1DluqI/A7k4Q0oqHNN7TkQiiU59YKwvxj7RGciYKF2FqblFf1
         tal2TnFhZRcHEE4GsHdNsTkftJGJ/Xl4tanMdyC/gYetUm2Qr8ofgk6kcHwOL9i+aar0
         r1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339594; x=1716944394;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AWjM7OsrUPOawORB4U9wbeNgOji92nYBHhW5FcjXqmE=;
        b=R2ENmDEf2L6/akzgtmjoQs6mGR1+4GlJUylKRZ14AiamuutIDprvYPpov5n0YqPXPd
         olGhJpyxj/JspukVf8CtptdIHIxC0O2uUxw/HGkPBgXFXN01X/jzoNI/jbtLXNv30wv1
         YWKFhLz+BlTzw98zBA6cD4ZruHd2Y63/Sb0u5Y47UQBGWqdJkqPAnzBhvy0BjntQmXMF
         vsYljxXrt2JQS7cymzJZf5k7BxDGAkZT2WoBv9CKFm6QvzpfY8ZjPKwRnZ0hWU/H7b20
         p5nH45fXvpNsoazYmbnTsiLM770TLZANp1yfa4pDY41yoMSb47nOySfd9gloT5Web2FW
         M7/g==
X-Forwarded-Encrypted: i=1; AJvYcCXbO2/VzmF8HUVxoh0wH0sCL60UkdYUm4ShJRzx5dcAmnwyuY21orXXgbB8s9wubgfGrubPQpaTfg2p1me7g/+dSqsgELr/Io+xuw0gaWau
X-Gm-Message-State: AOJu0YzuzUQBgQYCjaWdW/j5dpLXgCGTMoAsZgpIwkn+UVWYhR0VKYB+
	aIQazuZN7y1q380Sc25LwaZ+wDdhm/jwJNiY/daol7Rkh+pfGHet0WLETIjooAf3MEIw/K8Qt/L
	dBA==
X-Google-Smtp-Source: AGHT+IF+dXCrqU49ux2SHmZgWpvGHIfsSKPUFGkKjMCQnUfR9LpuorqbJFmyzygHKtz1jlIYWFlRGrTJeR8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:da86:b0:1e5:10e5:344 with SMTP id
 d9443c01a7336-1f31c964eb8mr40835ad.3.1716339594265; Tue, 21 May 2024 17:59:54
 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:53 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-8-edliaw@google.com>
Subject: [PATCH v5 07/68] selftests/cachestat: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_175955_750855_5DAD427E 
X-CRM114-Status: UNSURE (   8.53  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
