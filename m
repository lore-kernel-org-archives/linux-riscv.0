Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FA7AC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5mAvEinvAU6U/1HYrmTcZMAXAqO2koaJUCPuyh5g/KE=; b=lYAKx5YOj8mrKRyY9FjYVA/9zj
	iH4LvKrrc20OFsz5ydsMEIsI23z5AaR9g7t1OklO/2ohSlR4PkxsVH68ymbg0Pqt8hca1A4rjBMYI
	MdtKuEzk2S43GjqrMjFc8xRgl5TpOOw5GxMS0TYxa9UcfD5OHiGt6bitRcDSFNGyJkkM9352Z1pxJ
	oqnIbbBYCbVrHFXoZ5r9NYV1Ns4EqzuR9RuOkUrpxyXuh5O1hbQb3k5yShD/Q3cgDNq9q8E+yLt3A
	owsd+6pdzoq9MYoCtZd8Q4mu4wF8VSQyx4ONe+MDH8XxPvYWPV0Od6qf3e+H1sKRUH6c0AopvICUV
	dWdXmmRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNr-00000001VKR-0I02;
	Wed, 22 May 2024 01:03:11 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMW-00000001USI-3MFj
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=xNYd9WLAMtXto9r5wZywfmnRKL4Xp7DbTMTwTIIZc1U=; b=Ucn2uioW8CaiYFi42unDKERfUe
	Ed7XW26+qGhQn6iq+gPjFh5y4lQDgCku56v8wzIsclxivHh1zAxn4P9Spte+zDQiaUE/gn4Cfgk0h
	TT4BEtZqzCtLQ4Cqq1hmBf24HDvj0195V/hXDQpYQoVGc3FGrPwLakDZox9N8k5D6pe3mO3VaS5U+
	QCl6QZbc34rvnbaJ3U6MUlj03dVNiVcRkTKukFpkW0pWJzZQX4gKGBlQYKtErhAvIltKBkqo/W6Y/
	KV1I+CBBcDqQFbv3/U2veOk5L3Wd/QAxUvXHXnOX4XVD4m5MB2kihsnVgCD4TUF+vLWwm29SO7wOu
	ZyTBYmeA==;
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMS-00000000Azs-2Ojp
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:47 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-627e6fe0303so2048047b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339662; x=1716944462; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xNYd9WLAMtXto9r5wZywfmnRKL4Xp7DbTMTwTIIZc1U=;
        b=SYcRlkJkQz6JfVHP1sC0EQeVGp+dMJJxGcZz6HUfXxsIkEk8qMgMiYQdWh2YYJdlCl
         UYTI+clDeANl14mDscHSZ6G2kaWoBItEz8Q5ZFPC4Zk99UX/UK2ZgH6oddm8zXO1USCi
         w4AYIW7HXj+PdLcnGAvreKmLmSL2gHaY5CY2lHTuZC4gFfI5CeBX3wjqB/6WQvDp7coh
         ZtK8+T3SRku6JhD86KTry0CLwoAPfFvdVkoUJ/ln39mX7bcAcaAkwSyPp3qwjSpu+IFG
         sWa6HkugwnCED7Hw/Z5CWEWyO/CmMDqZzFC2HVislKrru/DULRqxOQCihzV7+P6N9mz5
         AFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339662; x=1716944462;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xNYd9WLAMtXto9r5wZywfmnRKL4Xp7DbTMTwTIIZc1U=;
        b=WDq3oCsOnsYXa1ayplUX2GaM+jcgx/747V/wEacQe/B3HOue60qJbIry3DgjjCWZU9
         WX8fcjOLSBXDCVUI9QuaUQeHvJPQlQn7SWvFS52g1KK9XQUAQAB6TLsm2i43IfxUJ7Q0
         9jVXHOFobmNhyQRIOGaohl+WprG3AU9COQCvQMeVzIlVMOvjPmQamu2NFSQdYaO0xlgW
         TfoShGCjxt2mB8SHEyIX0ciqDM87l6iZz9Jx0rPuCt5/KJgWXfmS2T1N6j8roBoBdECo
         ZXfqNeDsSJnz/u8GWEX+AvyT4olzmEzEYu5QVQfQPxMmFmKqGgI4KGDsYoMZjfraLfLr
         M+2g==
X-Forwarded-Encrypted: i=1; AJvYcCXBrPlPUoGXMiyhzVJVCVbSrYK5h7y3h52Xgecv0E6U+24iTjUaaHkDKrcGO+6pL5lNDSLvW9/OnrEAR5noppx+5qfs2ekhyah/lsdf6eNy
X-Gm-Message-State: AOJu0YzMTshbAULhRJ81wleOL5XW97Aqm8yL1lfQRodmhabL6bipge8R
	XZJ9P92mNZfeadNSA+YJCxfD/Ye9hGIvqC+1j+rMD+X5ZMLn93gsNmeIjqd/aKwmBS99f8aAKUj
	POA==
X-Google-Smtp-Source: AGHT+IGvJ489QQDb0KgifWCogWHmTsAg74XgHxgtSKVsW0Rsdv0Ifz5z25Fo5jer52C2SyPHmPiOLDqfRaQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:db4f:0:b0:627:dd6a:134 with SMTP id
 00721157ae682-627e46f6335mr1764617b3.3.1716339661939; Tue, 21 May 2024
 18:01:01 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:18 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-33-edliaw@google.com>
Subject: [PATCH v5 32/68] selftests/mount: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020144_745847_9B6B8FD0 
X-CRM114-Status: UNSURE (   7.85  )
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
 tools/testing/selftests/mount/nosymfollow-test.c          | 1 -
 tools/testing/selftests/mount/unprivileged-remount-test.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/mount/nosymfollow-test.c b/tools/testing/selftests/mount/nosymfollow-test.c
index 650d6d80a1d2..285453750ffc 100644
--- a/tools/testing/selftests/mount/nosymfollow-test.c
+++ b/tools/testing/selftests/mount/nosymfollow-test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <limits.h>
diff --git a/tools/testing/selftests/mount/unprivileged-remount-test.c b/tools/testing/selftests/mount/unprivileged-remount-test.c
index d2917054fe3a..daffcf5c2f6d 100644
--- a/tools/testing/selftests/mount/unprivileged-remount-test.c
+++ b/tools/testing/selftests/mount/unprivileged-remount-test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 #include <stdio.h>
 #include <errno.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
