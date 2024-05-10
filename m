Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCCFC25B75
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CHEHT22WfQLW2RjXUQ3g+ZS0NFaL0F9MLorJLgLmYjw=; b=mrD3+ObpbyO/SK3LtJYWA7YS07
	OAIMlkgVL6ypYM8JukYEb7NFRuggNwvXydCYhRpYojS9jiAcvGzjGPWpttv8yx194az/VEDOkTVDf
	mz0nFL/FXTZRxC0nH6QEk5phFTKEUhap8zlZPDmV+FMYN39Xeial+ST7gOdvMxYULRwjkptbAXrJl
	MAcjxdq7emoCO1mIxcoeuzQk7T3qR6A+mmsxj1JA0y9DMJ9S7cHoFwuavG15uIiRIZu1xtdwhc52Q
	eZxhlwhh2XFc/iKKgfxekCvuVf2gmQJSwZdGP0Yb5p/3TVOTQbjr9xW0M5KwmRKdTpNqbbfGVNgLs
	Z37Uz9yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esn-00000003akO-2luU;
	Fri, 10 May 2024 01:17:09 +0000
Received: from mail-pl1-x64a.google.com ([2607:f8b0:4864:20::64a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Dpg-00000003Mq4-1orP
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:09:56 +0000
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1ed941c63b3so13484665ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299786; x=1715904586; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=F6pzUPfc9dzXnDgIcrAO1vEqFEJkqCnVb2h/9OrkRu8=;
        b=AXSaQH9X/mq77bB6XJnAhavInF3xB/NkY/i0PM2wTY1KF5PjmhXW+HqRd/iZNlAdwF
         OsqXIVrRYSk19JvGdfuOXG8byGUL2yZ5bIQVl3az+JLU+eRZ4UPzmnzepirFGQlu28Kg
         P+mKVBeP1Gw0Po0WDD7iae2WOGlHzC/XZSjZ8I+Mo8mv0SwRts6PSUhcYp8qi3oHlhyf
         WKzxlbM9FYpDdwTyaPxgzZuFqQ88/XXajaoS+tAbRn/hoaFm/zYPVDKUAYnCdUxLMZmH
         GIeRBK6Ynm5Vib2zw5Jh/l2/zl2oB9VZQfNA3XArmW2F82ogZNrPIVzN6HG4JQyBL2zJ
         F2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299786; x=1715904586;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=F6pzUPfc9dzXnDgIcrAO1vEqFEJkqCnVb2h/9OrkRu8=;
        b=LDX2IuqcAH1suc/eeUfmCoMymlQmOGxxoo67NHB3n0eHuXkckM+kGmksfek50ScfR3
         PSUFN7a6JUQzF7eYJg9Vo365jXHKjure6gBCsqHk6xuOALpKuyp6HBghBcfbNJ8XYPAV
         DKYFS+Hyw8dv5aD/BCbcCrF7NQ9Jy88qilhFAFl2jN99l780+SCxr5CmXooIwS0w5jrZ
         JXd2XzgoYo5xVJ/edqljdAN9yGt2BUT1Iuv6on1yWhV3YYZnqa7Qc+2x6VL4OckSkKbi
         6Qv7rt0Rv/KXVCoqK9aRGO2ny7HR0kjejqxRFq0LFzwz+l0SM1h4e3uGBIakzpbwEsSD
         y/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCUPOo38ESP/JA/e9ZX8uFdnIoZXBjNszzadJB//mxkreMjPIsMP2qe5bft5E1/156rVvFjuazXKSL2C7IbBnYS+XTVGRc+Ld70mr0iNqPX3
X-Gm-Message-State: AOJu0Yyh4PkR5fEEDfdBZErWOEB/YYxaXc+SZ3hVXZUjVbRAspIH2IZk
	sa9Jciw7AB9M41VEY1hhhIi5awT6tTrMD/FXW/DmVvdZtpVOM0zdr+SH8Bee0wLShFTbS7wnX8A
	UJA==
X-Google-Smtp-Source: AGHT+IFRiEIaxUZf+B09qoF4C7spnjmBUeOfByi8Z7hCbfbBT+bOyMsubD1CDFgj4SuGnEmEdt3tFwdeaFk=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f201:b0:1eb:51a3:75ee with SMTP id
 d9443c01a7336-1ef43d17fb2mr26315ad.4.1715299785832; Thu, 09 May 2024 17:09:45
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:31 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-15-edliaw@google.com>
Subject: [PATCH v4 14/66] selftests/fchmodat2: Drop define _GNU_SOURCE
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
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_170952_758290_923F918C 
X-CRM114-Status: UNSURE (   8.72  )
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
 tools/testing/selftests/fchmodat2/fchmodat2_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/fchmodat2/fchmodat2_test.c b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
index e0319417124d..6b411859c2cd 100644
--- a/tools/testing/selftests/fchmodat2/fchmodat2_test.c
+++ b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sys/stat.h>
 #include <sys/types.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
