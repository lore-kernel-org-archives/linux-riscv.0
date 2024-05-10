Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3EFC25B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0JB641mqqPy+2xyhpXAl9TGdoujhkwXtT5bFwmXaXR8=; b=cvg/Ix+X2UA2cdDXxoiocr8wko
	k1G4SKbK0MOdTfUZZhdLNyNwZtxtkMpg908VI4PtjA4iR+qNA3idJIX6epVTQH7JGuKifqckNo7UB
	dotdXOkwa1W2DnREl8DA/40He0EaBNF0F8RHc0EMmRX+l01cTyy/9VFhAiqNp/ZOXzBootC9e/F5h
	141KJj4X4EqDi2kojfj3xvo8ydOqwtm22XNp/kjWPIGci8km55fffYFEixBqCI1vypyj4S+2TTYYm
	yQmjgIu2TwLiugN32M/ox06Nr2Iq1lanfoYk2tFTH9PRT6k8yxfTJ1dL3YnxWJjHElWDOiJvubCGQ
	0LFjy4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Est-00000003anU-2Ji9;
	Fri, 10 May 2024 01:17:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqK-00000003NO1-2EO2
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SutmlpPmP9Es0tW/Bsy7cVTmBXZ1L4QLiWxkdHQf5QM=; b=Ce1WVtrKiPgDiA0VIqEEjUd7nR
	hCHqwwLHNWYoRe7Upngd80LXnlgF11ZR8aTZII1CcSQqhvQAslRxFFi4lS2rlVqjmOwdaFaRn8mwB
	Kx7fVQ+bUkHI6zfb/3GQj2AxFQ3suJWtuDxmfsqKyN0PG+Ps+P8azq4FDCz7awopFbkzWyLwp5az/
	7dJ8sZo94LanEdA5xxS4SsdcEBpQvyUcVqu08SSUmB7tUbjji78m8Cw2vkHZFwGqMJ+WsVsDkUhzc
	Al0936mMHAnp/H1TQn08aRy5vTC8o/TmKWQIvucE18asJzz/JzmQyZSiHjUgmwLbVy2M04JnfEQS4
	dmqeBWCw==;
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqF-0000000366S-0TyM
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:29 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-61e2b365c9fso1275215a12.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299824; x=1715904624; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SutmlpPmP9Es0tW/Bsy7cVTmBXZ1L4QLiWxkdHQf5QM=;
        b=TTo+3SbOm+dJVAEieuMT9OBvPij4Ajnc3po6a4P4B4glZ2NUSCYIQkvxiLFhXYTPF9
         XZJZR939HYPOkOl24XZNlMipYvlGmLz9FDa22T58faoqH7vcDge1y6EOq6i/k5LSosMG
         4uxqtyGM2M7Rge+Jmbh8MWKsJQnHe5FAx8FFmAWx9T93d0vGxsIyztNaFDG5YdSuwqjV
         +hUIlR4Ohnmr9H6qnYm6GpIzqmJ4tlMj5TDuJUSQrry2XLU2OvaUgL/ti7nD6NOuWr/m
         0MIyJH7t4Wfnrd/+cTJ9/wn63P/G9AQ73mFFxrkpDoahZH78uKts0yLM3v8i3leayIIJ
         yKzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299824; x=1715904624;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SutmlpPmP9Es0tW/Bsy7cVTmBXZ1L4QLiWxkdHQf5QM=;
        b=FhKSBU5fctak5eu+kvcgP773jDHFyQYpLjviIUbBlR9Fd+SJSmsEaVqDwDKbnKrSVT
         UTYNouRSo5jvZe3ctZoRnV+HtXPM8XW5WJQdJd22M1wXJGsLDNQMAS4RIUo0ZODBonbS
         Dms7Sav7ivxeoBilhnoqY986rAVLJzcO+nc2yRR4Fs55IEZDIAJ4tk2JtzTTIEGH/SxK
         SfTt6i1SnDmaDmpVH/dby/xFF+MxfA3b8R/9N4VxWoi1U4y4ZFthz8l5mDazZnpFzmVW
         7gRI0mNWQ1BaYQQ40S9QgmNOzRik7OTOwSlunwE8YwhHCKef4q6ABXJDXFw8qiIixyO1
         Q5cQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEyHat5PJhbLscYkLbhog1PIcJcRvfCATF88Vf9ntil0Q7lTC4kGeaJ6btaQkSm3VSCngKkLqesf7XxBPc70x+xYtV7PUnmvhCYrbN16GG
X-Gm-Message-State: AOJu0YwCgm60JP+Svqx67NTKMPhOJaaubdXRAbc17uEnQRfHPxxc4Yrk
	smJehl8kFneVHPC5Hy7FyQiNhJ0NrgyA0MVzOQ+buluI5E4NIjr6jF3qUw5veQ9++A3AMg0kXBI
	9OA==
X-Google-Smtp-Source: AGHT+IEIehrU24eX0OqHRRhdZYUKWiYPftWJSgc7Y5tXd+qwfEKusHhkJB66OOWULkmBxo7GeAf8QgciojM=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a65:614f:0:b0:5ee:3ef7:a3c9 with SMTP id
 41be03b00d2f7-63744e04e8bmr1976a12.10.1715299823409; Thu, 09 May 2024
 17:10:23 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:46 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-30-edliaw@google.com>
Subject: [PATCH v4 29/66] selftests/mincore: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011027_752822_4168CFB7 
X-CRM114-Status: UNSURE (   8.06  )
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
 tools/testing/selftests/mincore/mincore_selftest.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/mincore/mincore_selftest.c b/tools/testing/selftests/mincore/mincore_selftest.c
index e949a43a6145..e12398366523 100644
--- a/tools/testing/selftests/mincore/mincore_selftest.c
+++ b/tools/testing/selftests/mincore/mincore_selftest.c
@@ -4,9 +4,6 @@
  *
  * Copyright (C) 2020 Collabora, Ltd.
  */
-
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <errno.h>
 #include <unistd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
