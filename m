Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D0EC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=oif5fOemxixwUoVM1EElbSnwZKqIfXIBEyNgHiki84M=; b=B+LPo5gAbIhstmq1xd/SLZi5j1
	mOVZaCfUhH7Bld/6nvOb1tBri6AYsRfMGz4k2iOB961JYXF37qo1loQ0oUiREJqkrJ4v5NzCDaVlI
	ua9qjXIoFr22LVlY0HD3+zV+006AMyEXnRXK9ernaRc5KgjbOOLpSEV+AGOHjIqTySr+R2a/j8jbC
	VouR9NJI6mHlfODcWBkF0figj8avFdc6YIrLcbEnxF2URfPKxvR/Abw1o+ViFgDPUWkklG3+pHVel
	AmoL1PhDTNd2KEABZV611EXNr26EPKq6DQGqKiJqfAjf6YdiauapWxSI0uj2/hZ7sGnOTKAvwyqt7
	lx/chSyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aPZ-00000001Wjb-0nfT;
	Wed, 22 May 2024 01:04:57 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNO-00000001V2G-1azN
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=THfAbUsdCLmnmf31zE9Pe2u6BNmh9uFbN2fzLklxkz4=; b=nvjCGvgvMWKAyKZeilCPo0kDiz
	mHRphSxNHPMnutte7s4QpM9QiY8mtRzdpi3U8X6dCdrombCp0it8RNk1EuO4nbzJcvGmEPBqnIm2Q
	mOMguIoNFqJz3/BgyaRF8WJNdvTWma1byhVwtMmAGDgw10ZwxUi0E8PG+RTT3zhKIJ7K2Dl1WHniW
	g227k5mqbwTeOqvVUG+Je0iaB+4l6yQWVI5KpLylyAY2OyuTL0HKp8SbTIr2E7Hd3X8VtuEeHWyQ/
	rgUd19bWeOD9yztMzUwD7fWTkziFL8yKjh8PEm+Sp6Uzub5ftS/2dhomrCIF7XsiAVgqDyJOL1y5V
	a9h0QL8w==;
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNK-00000000BHK-2rVS
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:41 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-1ee4e9a73a8so138165655ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339755; x=1716944555; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=THfAbUsdCLmnmf31zE9Pe2u6BNmh9uFbN2fzLklxkz4=;
        b=F6Fl1m4SICAcj4KYRRmNzGVi6V15BWJUcNnFKQjxuVSzhOALMDS3fK1uLGtRn76pOU
         GmRpluHTaBYyRe7pyWQPgv7JqKylZoOL+OIyMokXvEwO/Mu7o9feF20jgx70wcfRgOSr
         9CSKa09OSeRAdV/K+ZT32liRn2vezDxwaKo0mZxhN4zTxsWD1t41iDzV0qCJNSCDfAOi
         fFkx842ehyET1iKEgrAWAcch9x/xkYOBuYRmHepaAGgoNKd6ybKWOzGE7WPGZH5LhAOe
         rFph2/fzeA/Wk+xgfZCQquHXad9bkYpa1qZnYsxpFLQgufIQp1zdflnpztw9vryivYe5
         Cq6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339755; x=1716944555;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THfAbUsdCLmnmf31zE9Pe2u6BNmh9uFbN2fzLklxkz4=;
        b=riBEdXdei6m05ihWLGHPwS461I3yK8l4UiZUbCn8NULjxZJZVer6HRxDS7a/ijQD/9
         usTnZzutjekc18rQ3Lw/4p4/MJEAVBW9Vh8htClEKgrLGDh9CbYY1qWQZ5FNW8meVeGl
         jnICnhDykXQXT5IMMpH6+9vTVFoYhFDKvpB0nhOXiTbna7oo7K/7aIPDG84srpg9G4A5
         MCknKFDgY+NxtBXukvzC32w3G195rcn+8tZncH7CM6abUCm7Z5bxRc4+CRlBImKn6hlK
         bSO5Sqd5nyvruTcU9Nzs7jS9dq6eheNF/LVJ10qAqtgtKbkEs4AaUK1bLtUy7I0aNseT
         xO/g==
X-Forwarded-Encrypted: i=1; AJvYcCV8xb2DGEPSpRyhk0MEVL9giB3ZY6v9VVBBCuUGrFbprHdG+UK7m9xvmIH3pZy9RTVjO+EVBWpL5LOhTgp8Jw+F+TdJw/J5EgbgWpoNENzO
X-Gm-Message-State: AOJu0Yza+MwkhSG5itVvJpDgoZL645RbL2fzNQPonuu8IHNnjIGTqaXO
	mXJX5xrOpX0Y1gZ/1FWNobY5GBprwig9zv227BKNoNFtFZXgTnNXG+BWnoAgJr9nCieYGubyYqy
	WTg==
X-Google-Smtp-Source: AGHT+IF2I2FWOecHFUCcN7nKq/bwhFKSfcaBbhOfbRL9O8f91+0Uq1k+MIvBsT42EkpQs0UJXpRvR7cMkog=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:f7cd:b0:1eb:829:b6e3 with SMTP id
 d9443c01a7336-1f31c9672a0mr175035ad.4.1716339755383; Tue, 21 May 2024
 18:02:35 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:50 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-65-edliaw@google.com>
Subject: [PATCH v5 64/68] selftests/user_events: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020238_984704_6629338C 
X-CRM114-Status: UNSURE (   7.21  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
