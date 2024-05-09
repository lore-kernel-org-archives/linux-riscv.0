Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D6EFC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YlFEaLuA1bz0pyK9FauFQQhp0HJI6a/gSS1KpB8q630=; b=CTuXblyPxeftY49Y8S/RswXWzL
	WLBFuTlhbl/cDaanI2M5WwfEvRDjLt8iNID4YrChkDXP2YRVXj9bEdQpXxSYA9drEE24Owa3qPet4
	6tu3aEalVbarm7c1Epbl5N0ZdXyMOcg5qPqZ19UYmwhQrD0lL5uk7xUUoWtMnsbustWcQOZvYoXD+
	mHejVZIJ810guEHpJRO7UNRMvPqwFeQmirR2Wg+3NaFhoRUrX5G6QhnHm3txZZqIpgrAIJUyG6VMG
	O4hK9+05Zu0yWw4lPd6wm25Rh9R2xXTa9Ig7UMLAapj2ZTN0zULojJx1PKk19p16teqlYKxW3+1Sj
	o1MQvlUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xw-00000002beJ-30vp;
	Thu, 09 May 2024 20:02:08 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xH-00000002b2u-2F4b
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:36 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6efef492e79so1328155b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284883; x=1715889683; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TU/vpufr9a9ZUHQPOG3JePKH031tzM2+5PrrIqHPNIs=;
        b=0c5SpzlGA68RlJ7dnmsD1WnxbrydbrdaKwRu+mDj6A6wi/EP32iLWEIwXyUHMN+/jv
         pQc+a+QU+c5lwn8etinNiVkRlde0MzttIrTMPtfuW5HccEdCTByXc21JAuKKZU6/xTsd
         KVx5FJ9jVvTp0PJxUBKh2uGeL0I+RBz1BAhqcie80kudaqV1iKGD1PvOyyV5e+fzxk7O
         ndeExQGw3fEt03cdN4Mnmt4vRO4g4IZ8FX6fmQRv+w1n2LRgFo+Cq5ZFn3BGbk/I3MCc
         ANk7wrgzi1fUWKG/HLx328ZYSS0O0Jh2DTUPNkS2KMjpry6wNJEbzs5g2QiTyDMylJd5
         XWLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284883; x=1715889683;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TU/vpufr9a9ZUHQPOG3JePKH031tzM2+5PrrIqHPNIs=;
        b=mGQAo2uhI0/PIMuXGe44ms5JDtWiW/VsNUnpxU1RAxOKBF0i3ztZhP8HnYqdnAFcgK
         0Marigbt4rvBf8Z46BxQfcqqqu677CtRAmEseMkdfAtl6DsSYM0/4SqQwaxMkp09qKWx
         PgiMBNLs8nn055nB7wDWhgaHYuvxJXj7eEFder/j0WdvU7kjFKkLKYGR/+O4DKJ3x5tA
         NCDpLNvqIBc3KU4/C/eT7whCESZerCbrLQ4mtMzBK+j8QHp/pM+PEr4s88H9lesPBzuK
         p50Yol4gUZ28gaCKvvoPI3eHLL8cH+r/JbMrJYy8n6bdfo4rLd5dZRvUWG35DdGJhGbN
         Sv/w==
X-Forwarded-Encrypted: i=1; AJvYcCXfrOquj9/51MIZFYlloKRLDtRXrzMMOy3jXPeuzYOc0DJ1av0gXVWgXKB03tYQtRt81OCuOyyFGMAGd3jcu7FFHP7wYwRYxvy849FPbHn1
X-Gm-Message-State: AOJu0YxFDLYOQKjwegs7qBicudk79WvZo8Hu9P1GSabOTZizg9GOO8AD
	dujVwJhwzn9BDQISQ4WlNPxhhgMz/IFEYwOKK5OcQpIRppmnNTV5pk5S2J+me6CrHVMnvj9kZhv
	ScA==
X-Google-Smtp-Source: AGHT+IF1zeNl7G2mrY5GSol57Wmpqj9CLyOfkFGR2ecW54/KxC4a46reBAyc7WewMqRKduaOo7Ktdkz2CAY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:98b:b0:6f3:ead3:c280 with SMTP id
 d2e1a72fcca58-6f4e027813amr25753b3a.2.1715284883459; Thu, 09 May 2024
 13:01:23 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:04 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-13-edliaw@google.com>
Subject: [PATCH v3 12/68] selftests/core: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130128_059366_B1E2C6AD 
X-CRM114-Status: UNSURE (   9.43  )
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
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/core/close_range_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/core/close_range_test.c b/tools/testing/selftests/core/close_range_test.c
index c59e4adb905d..1c2902bcc913 100644
--- a/tools/testing/selftests/core/close_range_test.c
+++ b/tools/testing/selftests/core/close_range_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/kernel.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
