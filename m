Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5666C41513
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BgkGUUHq3cSYYBHNEqQjVD9DungLAKfc6BzTZ2JDXC0=; b=SXQ6KKsvISsgTxg86XKLJG1iWu
	2pRjJEDiCiaOHAU4yQ0tiGSf0lgVblGuGFl6FJ7Aeand91fya8aEgcNPSzs5LIQ4ltTxIZWdpZXYV
	DkK7tNeqX9pGovU1eiUfJYNRcM2RPtCKxK34jB24pX4MOJExbjcHxXL2DcNA0h4WcnoTTvML1lTI6
	2LWAy5MtchPXeLz+P+a5OplcPoOPiBpk0f8ga7cPRlTZhYLsRRG27irduGQBH624RR33Ynf5BgEO8
	mn0mJ/s4S7hjFGNpFukIe+P7jS4Mxsvpf2NqplTxyo2uUyh5uxiwLdyM2L79GACiJi8Lixn30xr2s
	AxF+X4EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIo-000000036Kq-1ezn;
	Thu, 09 May 2024 22:31:50 +0000
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zj-00000002czf-2V81
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:04:07 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6efef492e79so1330118b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285035; x=1715889835; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WC7D8aH0v4uQUEV7LLGnAs38/YjV1LtGmErWE1cbhiE=;
        b=db5L1nw380TPaYNjHK/5j3SteOb49GM1pU3qSdLU6OAUYyBsT2rt59dGx7QmYqoKXs
         SNeAiaAsU5FeuYIjewkjVs3Id2yB9QCkaAQrsJ9RDLfjTuSbFNouVg2om+quS2/4L8x/
         GRHMTMc8UOFamXC9V3GjpU/GBn9KOSX0GTY++VigXPZdSgMSAmML4nfu5/gv0jYsqOqK
         wNpMZSQ6hOR/mhbIstJwmdkXUAsbClIK1vxAt9gxg0EHTrhUU6cIlBKTu0XITJCDxgwl
         94jZ7AY2fHInj9rUEBNZ+NxVOEqri9FjvnbfuEnlvHSVc+KY6mumDkJSmH9QRvpUM+HT
         kOcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285035; x=1715889835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WC7D8aH0v4uQUEV7LLGnAs38/YjV1LtGmErWE1cbhiE=;
        b=lph057cA7erBZpIwE03ImIuaojiDNMWvdzXudE6MiWoAEPDGn8zlX/lKsffiNX+THr
         R8jtsh9svYwN3ECokkswjNFlXz0j5eNuNORBectTv+9BYoiADmtNBhJWx70m4FH+74wI
         W7t9hFbJUwJxuZipWvh/nhUiDiaeJEVIaYG9zLglJaUoNfeQC3WEMo/rjL+iDrVg+PF3
         MeRUHed9BE03tu4ZRybGbTYfVao5RSNCk0JibarroRs6RMpYbgOzMWQvlWmiN/TXOdHV
         MMkZPQJVSMK/nrSZ4qyYDYTRfGEO6+9+v9J+RNgfSMAk3O3Nov77HRfAU/ZFjvTnIQ6W
         AfEA==
X-Forwarded-Encrypted: i=1; AJvYcCVjkPFB/dgcKj8ivkUan3Xi2yIUfAiAddp9zfJUCT9HWeGfOhZLfH0oWld6HqxJh0a0mY0MVd6+LXbp7iroW8ivjll1pqdXVaVcMPCRHr/n
X-Gm-Message-State: AOJu0YxE52NSfkUbpAsHZv2ofkzGsB9qCedSkRDB63RAUeVApSbbo2z3
	1mZaeIpG5mxiPy6FQ4DHkEFJSYZevp8g47JKLm9T+pfvFBq6s9hVdXH3HzcrXx+ULyTvUqV6131
	2Eg==
X-Google-Smtp-Source: AGHT+IH2SbJN822nfl37wycvsXND96WvS/1faYgMHWYRV6m5iJpfeL+wLm1M6pioafAmOBMqwtyFIThDOZ8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:3c91:b0:6ea:aafa:815c with SMTP id
 d2e1a72fcca58-6f4e0263dd0mr25176b3a.1.1715285034729; Thu, 09 May 2024
 13:03:54 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:57 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-66-edliaw@google.com>
Subject: [PATCH v3 65/68] selftests/user_events: Drop define _GNU_SOURCE
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
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130400_021220_09280F97 
X-CRM114-Status: UNSURE (   9.17  )
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
 tools/testing/selftests/user_events/abi_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/user_events/abi_test.c b/tools/testing/selftests/user_events/abi_test.c
index 7288a05136ba..a1f156dbbd56 100644
--- a/tools/testing/selftests/user_events/abi_test.c
+++ b/tools/testing/selftests/user_events/abi_test.c
@@ -4,8 +4,6 @@
  *
  * Copyright (c) 2022 Beau Belgrave <beaub@linux.microsoft.com>
  */
-
-#define _GNU_SOURCE
 #include <sched.h>
 
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
