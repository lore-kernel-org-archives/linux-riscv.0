Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DFBCC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=4VNYshvHvhtndQbnoZt5pBD5EfuegaBleWYQeBSDC/4=; b=BurCvXGvZXvQ+LALvp4UroHhRq
	dODTinPcP5Q90IofVUUbn89IzGrqUCjuRYfub3urC8dtfwpr3n6JLye6XIIKJ8lBj6zZ6ObLQXmZl
	KTh+D/77BrhspwoLly0kouterK6HhUBCxOl15cY2sosej43LhYVI8goWsoUWmUZFiYlbjbWriS4p0
	isS0GGzqN+e2F+yLKow8wVwu64RRnSwfXutwdJHcdjOhvaCmuV4be3nGCsVXVbZIpYZb9WpIUCFbF
	L17kOAbCEeekIm+CGtbMuJlfULEyL41tjlpSY2+obTX94s15QQyCiif4NLHPsL4JL+qL5xsYIC8db
	FQjBIK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A0h-00000002dfM-2FjS;
	Thu, 09 May 2024 20:04:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zE-00000002cdi-2IZp
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=CAfxn4Mx/opUGbIFPR6WnlOwclUxypYBhNIAU6ceeuk=; b=kePsUyWl053IALHRScFsrbL/VB
	1lz0aeVmCqu0fJ2ji+bSLz3WNgQMJ+UruRU7y7SAO2DrY9om5MjF6s/8lRKaS2EIRIkiixgssDC4C
	B64vWcJP8WSX3HDgCQt8FwFCzY4Uvc0qZbqIfh35lBXG0HRseptgR3pvUZY/YM5sPCcYEvqynfXdb
	VupqrmsBok/RX1dejHgBP9PEXmM2/ydJWeq4GvoOWN7lZOh9AKtZZ2/ClgCR82uR46rLwMXxQD1i2
	u7UBJsTV9wWRbbeTmuLa/GNBPCNLQCDOHri+TF1z7VDgP8mslA/b4CTSGykkuFV/rCagd3zeYhp2f
	Zel8faJg==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59z3-0000000309x-1t9o
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:25 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-de8b6847956so3121529276.1
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284989; x=1715889789; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CAfxn4Mx/opUGbIFPR6WnlOwclUxypYBhNIAU6ceeuk=;
        b=kOHGq0ZnOlT2MwKErUVw1K3D2hH3rV5RcWa5a1OXMcxoVPYF5tCdlIV+WOGX1+f3hG
         wt4zqFl/8/04KP0T4mmnMf26vk38M4nvZsa1AeTDR7WP/xxxkd5nQLN5t8+axqdTnaAm
         L5aG6rBX1HfwuQupTyssaBou+PVqS57loJTIQRAWfqBUR4QWbOm2kuGr+7v7YpGARAAW
         PNUlzEauh7F4BAfWxdEXmfKkF0FjRApa27zCjXG441bzfkMU/95p6pz3ittaWlGs+Cf8
         gFN8qWAT4wXcqk3R0SAYTXWYtZiiMuVR6C8eh83yKvqjFyBq+JQwB83wbm+5qwGppH8z
         BF2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284989; x=1715889789;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CAfxn4Mx/opUGbIFPR6WnlOwclUxypYBhNIAU6ceeuk=;
        b=G8Cx8LyRMbQJOfVcKtVHTGb0yj/qxe3kPnqar0Hglw0v2Caenl6WiJOWdKFsYP9gRa
         BYTJbIS7b+IqCcVzmDruOTK/tT+8rhSgJVQln5jCJwMz97JnEWGRla2/ee5XiefhsFMB
         JQuhzKZSeM34/eTCGDDBwhmV80UgOHPnom1OuAI/g8vgxsASjPIyHXFyKsDsq7pK11ac
         But2E5r45BHGE9Ap6Z66COyME8XZJVGaD5IYUz4B/syXorcf9AqDjFi48rueSEaFFpZn
         q6b7UNVOTgJsY1UJ+D74cAOvFvbJRd+0ANAIEoeulhSXYRxiroyIjV8al4hMeKDPgBrU
         3nEA==
X-Forwarded-Encrypted: i=1; AJvYcCXqlm8ivR72/gghUQpc2rAFDpZ4P45ozQclQY5IE4OBXWCfkW5htwtqBRb9v2jcakWkRN7v640l/tA49W7hpzxa+tHdQc7XfdWgPyCCLfLp
X-Gm-Message-State: AOJu0YwQdXaCH0TqQfceMQMklO7v4WJStsX4Jnxb9qegtCTuaiJWnTGa
	FiCPvAKBaxXzYYSEAvFDu6d0JGdLZkypv0drAmu1IYeiVPHZiMInaVVZ9F2trvDEeiVQTRTQAvq
	wUg==
X-Google-Smtp-Source: AGHT+IF3u/75WI9MMRWQjVk+dcqFHeDZV83U9cH95eO4kO/Itl/i7zpPn9ZL2gHtlxqWHTW0V4QEbN9jQJk=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:c0e:b0:dda:c4ec:7db5 with SMTP id
 3f1490d57ef6-dee4e57a059mr218127276.4.1715284989462; Thu, 09 May 2024
 13:03:09 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:39 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-48-edliaw@google.com>
Subject: [PATCH v3 47/68] selftests/proc: Drop define _GNU_SOURCE
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
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210319_206764_CF1C4B3A 
X-CRM114-Status: UNSURE (   8.82  )
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
 tools/testing/selftests/proc/proc-empty-vm.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/tools/testing/selftests/proc/proc-empty-vm.c b/tools/testing/selftests/proc/proc-empty-vm.c
index 56198d4ca2bf..f92a8dce58cf 100644
--- a/tools/testing/selftests/proc/proc-empty-vm.c
+++ b/tools/testing/selftests/proc/proc-empty-vm.c
@@ -23,9 +23,6 @@
  *	/proc/${pid}/smaps
  *	/proc/${pid}/smaps_rollup
  */
-#undef _GNU_SOURCE
-#define _GNU_SOURCE
-
 #undef NDEBUG
 #include <assert.h>
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
