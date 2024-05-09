Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71964C25B10
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fMBvcPQfCzGhxcbteeUdufT9X9GooZqtr6yFGCUhfeg=; b=O7Oi706QfoelW4YsvlXJOcfJQD
	DS9kNz3QwsCIms8VkOs/seBJRz30pD5NK5oCchDmnZtjSSn8u7N9yud2kMnsqXQ29TXcp72OZNFSo
	u/JaxL3N3gV2cXi0j5Qf39DHfzlXVdUaROCZwXjuUy1eL99pDO1Zrd0UiAUPH+FMpO0AiUHPipb9Q
	WkFssKcMOWplq1bUE0YT/o2lYQBfti8XUR9L6ltcMX21LqAQXz8cuPFMlJYkgYTMYfx1Vf7J2Q1g7
	gyuzba5KTMaGg+gajwsjX22KNhLCM1eYSmTS24BoZCQtCFjXEM1Ac867gABDwrR6Kuhde/VZXSeOo
	607doHmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xZ-00000002bKu-27tI;
	Thu, 09 May 2024 20:01:45 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59x8-00000002avV-0vTs
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:26 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6202fd268c1so20919507b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284874; x=1715889674; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vKajnWgRPRIusaCsN3ehDRoTdZ5to7bBmZ+li5CBaYY=;
        b=VdikAdRYnN3Msy94AiNhI/+W+6EV/jZfp5EeyOjsVu2ookafaadnTvJBFTrg1AXgX0
         MPCn2oM/1/0qmgt4hEV42kFB4rynuatucGd+wyOWNZTsgKb7V0BCjcShRe8NEa9Vt2jk
         l6jajki/zgILEh0dbkjn5XO4oKPww60qzqPmE1uRQrXzBpm/R5RzScTDwnQYy5j6Mcbj
         wFnUb8/eVBmXGX1iJwZtGHPA6nchIN73Fj+YzRWsi/lQnnpmwWMRZn8D4a+zMYPmy2wy
         EIzttWIjvi+Jwsp4ACjC08c3w+QoWMtaarb81/tp/LOyCd/+r1PovLP/S4PJtzVmKrEd
         Tgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284874; x=1715889674;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vKajnWgRPRIusaCsN3ehDRoTdZ5to7bBmZ+li5CBaYY=;
        b=Og0C8M2xz9Wl1X5pzbWkQ2qdF6/w51ld6X6R/nrwz2ns4WioCgV0mk/dy/VNtuTHYd
         awRMMhZ2N5qzoAz3d+t5pR4H+Wh22IU/GqP4AmHM5EBJ4s1VbDJKWoNtVgEs+P1bciva
         35Vz8IwspWUD5kU65Ee+ePZ3/1tcey9gON5XFLLo5T2PvB7f9XHK9MHqoMpx8jAgZzcD
         4A477Ij5RJr/RXhV25gQMrEVapL+tgI5NHRIDB/xMaclXdEuDyfEPxAKJsmwpZ7/DZXm
         lo4NgzBTtxUQUPxPKfQGftazth7GN9F8H2Q9dLhjT3x9rVOOjSpff/9prFTbgSTZDuej
         SWHQ==
X-Forwarded-Encrypted: i=1; AJvYcCU43DeLtGuYxvmBjMsocOk7WI3XRXVSMd8XgWAhwvfxAFi/xJsrGxT7qJJSW+8oPo/7bnGjYT8BvEhPI3gkaHQQlvtqRlGpEPboVyCgMTD7
X-Gm-Message-State: AOJu0YwBUn4t8yfFXr6FkEbM2bwn6agCYhzes/6r1tMrIKrFewtQGb/Z
	5OCGT+MRfSeDfSx4ib2ugviZXKr5hyGLXmSXNGqVTafe3vQJmdzrNMBHkjLpx9ESTSZSgqCyFSF
	LjA==
X-Google-Smtp-Source: AGHT+IG8BlqL9c7H6gT7HJqAjPMzqcZbchjuSJZoZPXFaFuFxFzRUA/yGwhzK4FApgVn7UGcsEa39MLwACI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:4508:b0:615:e53:1c1 with SMTP id
 00721157ae682-622afff693amr1508007b3.7.1715284874424; Thu, 09 May 2024
 13:01:14 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:01 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-10-edliaw@google.com>
Subject: [PATCH v3 09/68] selftests/capabilities: Drop define _GNU_SOURCE
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
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130118_655843_698143C6 
X-CRM114-Status: UNSURE (   9.35  )
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
 tools/testing/selftests/capabilities/test_execve.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/capabilities/test_execve.c b/tools/testing/selftests/capabilities/test_execve.c
index 7cde07a5df78..e3954b88c3ee 100644
--- a/tools/testing/selftests/capabilities/test_execve.c
+++ b/tools/testing/selftests/capabilities/test_execve.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <cap-ng.h>
 #include <linux/capability.h>
 #include <stdbool.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
