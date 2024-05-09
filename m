Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C925C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=1cTotijrd7M37nJ/7UQcvUYPXzx9cCJy1p1cIXtJTHo=; b=ZTjm4f1dkf1jv5l95ZOfs/aHgU
	kHCPEoix8ikvEetpAi7ie8HAzjCkkJkotMyAeyA37YqlUkO3yMVjEngLdgELaQnoB55IJ1EHQq8k1
	JGcInGwamRo58PRTmRh3LhUu5JTDyEm57dk3BIsFPdLEHHr02CFHuQJnisjym9lS/2ostv/pbrHOZ
	uWm93FM592h92R1KAOrEhv5cr/jbFt2DZ1pf/R7RHbuqVY6xAGRwoL2S29X/UYtZljwULebSLDdzL
	tsr615d6r+8YkIfoOkPnfm44f5EDPSsN5mX1hoI+CTKCVmiukuN9XQZypPPXyijIKCfuzp3n7rGet
	1NSUL2lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yL-00000002byK-1sqq;
	Thu, 09 May 2024 20:02:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xd-00000002bOy-0gEx
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:01:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G57nowh4j3zc6dZ0oWotSbgcBjSXunvHMbYgrgfrS5s=; b=IEjQ7zpqCnvCR4gnjLi9QsuItr
	FUKvfu/WCGkr6sRUXEhnJi79YW9BuHcSAR/QruNy+TcuD3AgXCj9aLGt4KML4PLkv3wbvTchWyLk4
	FwhNFUGb3kZMiEgHuq+E+z4wEj18OMq7zYAsrae5MHVXo3bqwuz2bWNjfOV9p/8S7SKQWNXpwNvj9
	AMlk8p9xFntcudV6duMIjy9G3jq4PvGhvyoSXUWePqMPTq4FH07lpV7iRwXW2BUbDGhfMOPQKSpXD
	PvuZkYkQ2VqjQp91a6G3LVecR9FKYxwz5zh2WWqPm8kCjHO+vwIw15jdgQdB6f2qzuwKbKbqM76/r
	oVXEi57A==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xV-00000002zvG-0lfR
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:46 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de59e612376so1750242276.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284895; x=1715889695; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=G57nowh4j3zc6dZ0oWotSbgcBjSXunvHMbYgrgfrS5s=;
        b=W/U8A3ACWUhVm9fTEptvAfHdT0porgY9ZRTC0RFZvfwo7ttGovrvNxmQbliOkax6VZ
         /0ztg7komU27W4VA2M6YZR06PFn28gG/C7F05YlOdXH6x+IcvqW7KCu0FC6yVMOhZAfe
         u19fi3VbVbsHwKogPaxewZm4s556VBlh4Nt4zAhGYGfm1J1/zWT23obJXnNGHNsZkGW0
         t/3FLtTeIELfWleH2mnjVgkYa0+HnRNoIGqHisj+/6T1I6CYuZNDsTcGRFCkPZsnFSNs
         d78nmEYhAXUaJCp0zrzt22YcAZHiFAcQNm273XVLdjqGHs45/iE6dFzssgv3gxnoIBK3
         Cabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284895; x=1715889695;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G57nowh4j3zc6dZ0oWotSbgcBjSXunvHMbYgrgfrS5s=;
        b=UmuM6Iby6YF93OVnsxWlOjWEmr9m3rq2YFq7s522GLb4D5JGRHHU/UJtVzkNfGywZk
         8JOwxBlfu7JcnSoTcgfeC3A1uwlFcQhfqedjtNhV+fFFakhBYnmFpmWnOGDYx2s9gv0T
         FK0sHYnjD6XOREbj8VHg/5hRCKqBXRi98TFLtPuIk72HoMoW7iX1U5uAV15jGG4EGBoA
         M2WHr0X6uN7eq3jVSQ8tBDZe8r6AjXG+plCXowHeTFFSxoLZKWrqDG/WUP1T4+cyZxGS
         +beCCCLFDa9yaJFhKtz4ubDlvQm3EjNEuJU9mgn3Xb/bMKnB0zdfzfQ3hbTR20emlaIE
         LSyA==
X-Forwarded-Encrypted: i=1; AJvYcCUo7vFMHjU2cLbYnRHrSajxaQRZOdD1wBOvzdOgQGF7FqcTPNF7r0x4qx0VnkrU6ah2j2evyi34n3CaqZmOCUUTUuY2ZRzTtQj+qZuQsFe6
X-Gm-Message-State: AOJu0YyF+YGFqpfHd+JmArQ0BGzXFrumkAcafwnSq3/h6fcLBSZshEbp
	2q0WT0hxzw7+fyY5z62dc8VmBhCPmp2R1UjMsPF7x7H80KUpT7KRT0ExWuKz0mSL3kZpBn1teFY
	4NA==
X-Google-Smtp-Source: AGHT+IHoch+jGmejTUt/KWjoMuZe6CHm+ujySJjPOe4GFGCIUbS8DO634gokWfmQQFi6/Nyn5DWYlXv4Q1Q=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:c11:b0:dd9:2a64:e98a with SMTP id
 3f1490d57ef6-dee4f30134amr46466276.9.1715284895465; Thu, 09 May 2024 13:01:35
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:09 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-18-edliaw@google.com>
Subject: [PATCH v3 17/68] selftests/filelock: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210142_687343_F208F7F5 
X-CRM114-Status: UNSURE (   9.60  )
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
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/filelock/ofdlocks.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/filelock/ofdlocks.c b/tools/testing/selftests/filelock/ofdlocks.c
index a55b79810ab2..301c63ddcceb 100644
--- a/tools/testing/selftests/filelock/ofdlocks.c
+++ b/tools/testing/selftests/filelock/ofdlocks.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <assert.h>
 #include <stdio.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
