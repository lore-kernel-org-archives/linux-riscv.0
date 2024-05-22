Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F26C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=MvDWKiN63ns2JuabldoHUElXoEiQ07/sivRowkh3Wjk=; b=Sy9hH8zM0q+g03R1YuTQzSqvWW
	ftdq0MgHCIibq/UfbgqjZmAi523TnDr9Ekyis0wUFS9t8Z+EEzUU2zU4mkvh6ztG/NCwrOWt5drDW
	Een9gnU/iEA8D04NaWYDbMWIFS7X5Q+4GDdBh0nIrcz5XN+p7yGl981qbvkTrWVpGrwQ5Z/lL5EC7
	MIdshFs8PFDWFALwJI/L3hBZt6S3BeGWPAcwN2sJsyULRv3JRUhLMzayOIXff6PlJSX/pjQntAXwU
	xIMYm8dk7E1EEhRcEjPIAhlyC+/owbFZgewLpU7W09rtFHVCzV8SfhsYjAvpR8bALA/mctdN+cb+D
	FCXI8eiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNT-00000001V5v-410J;
	Wed, 22 May 2024 01:02:48 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLs-00000001Twd-2f5L
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b38f3e2919so308216a91.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339667; x=1716944467; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ks1TxZm74BwnYcvWntsjvOvPgr4COyU4wUcMCGvwta8=;
        b=MCZr+ciWXwGnD9qbIv7eryRE+2HVz2mG1MD6SfcAYslhUvr51ycxRFOGD1m21qsogO
         OPbNLUJcTYOK+pQNLK1hW8p5RN4R5cdG4dYo4PwYziXzQKMIkji5pNiaOrlNXvSz1SyY
         2+MfYG/dh/mSuyGq+f0+5EXJTZM3bHY0Tr11ZSlUtirqMp1//C8C9YO1+7Iq25WQdi9S
         rqI25yp5kL96zP90yalVF26Lrx41dbbDR+FLVsM4k3QT3+amuc9U2BqZ1zvFLYaoYJ8K
         ZTaS1iJ2m9KB4pRQlWwk8S5EMJdNb3gRs2msNjdL0js2m54taZLdiboehb0Y2iTv3nvM
         nbsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339667; x=1716944467;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ks1TxZm74BwnYcvWntsjvOvPgr4COyU4wUcMCGvwta8=;
        b=M2FEOI3D2EWo5xCXNJHqL5657bvh207SNiX5cVsmDFmsrqrTS86uxBL0JdvaMb63pF
         8SbA4TTJBExnvTRzj/T0sjt1e91zBu+9LjeZA7Ci5SNwaoFfp48Oyi0nKdUhMsyP5Oo4
         WDk3EvKQdSEMBmK4spMn8SlJKSD5PERyEhxB0EKksjp8IMjCjeKZmBttTBZ2s8s2Sm57
         jqLPQ3DsOQux5Z0TX/qkH3bHylVaAG3+kpWEzoev6VjLcKJ1tTRFlVaspnIep3e/FVka
         Tl3q/9Ieyf7/ffq7tm3HQ/C3w3RQYNB8dvKWsUuV/mn5L0w34kZ2DfUOL5Qq2D5dOTW6
         0wSw==
X-Forwarded-Encrypted: i=1; AJvYcCUVdeGzJx9q9Mffx5ETqDHihFtTagDX+jxjPi8MH7DLjQguKnr6D9qYxfITPrE5fj4iZcx/QLRSu0yksjoJORdrcWhhQgV5MK7nbh1W6Izw
X-Gm-Message-State: AOJu0YxTqpLn6nBlrPpbChQQkFyjpFDQAWGOVqFIj3BDkcQ6mWQHWYJp
	wnwykPfi03WPVaDq1HDsSOrqijcNY0PqBkacmAs1M6QAa3Nc4sYNYhXk0SZVbqGr5aasCafwg+D
	fZA==
X-Google-Smtp-Source: AGHT+IE2BPpNcURJ4aVDF/EWLlqxZisBRuDQmW3J9W1FLhDsuBG8XYND6sv5FfH6pfqz3Ivw8kpZfbXcVwI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:b78d:b0:2b9:6fd8:2ff7 with SMTP id
 98e67ed59e1d1-2bd601f0e18mr74966a91.0.1716339666568; Tue, 21 May 2024
 18:01:06 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:20 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-35-edliaw@google.com>
Subject: [PATCH v5 34/68] selftests/move_mount_set_group: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180108_940587_E4760526 
X-CRM114-Status: UNSURE (   9.36  )
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
 .../selftests/move_mount_set_group/move_mount_set_group_test.c   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c b/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
index bcf51d785a37..bd975670f61d 100644
--- a/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
+++ b/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
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
