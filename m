Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 049EAC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=seM8999GDCpFqEydvlbDKKI74biJHmRG7Ra7aNX7Aio=; b=tA0GAlJYY7iAhbybh8xSQ/+93o
	jrEo0fCYLLuLjOR9y75Yn/KTzuSoORUjN9UrgX6cQEqcQAqAmRvHnFMtZWu6l/K6lOCzyYnbz3p8t
	Os+A5YftUYu/0gvap0wyqgGXDIIeH4nd+kK0/XcP0DURd+p1+HkuXPS6eGvQMbMnsj4LRx6SHGrmK
	Q7oa9GQKu+41Gy+Mo2tdb3IJUxSG78hIdPnmP88xBe4NDQemkhgN2gJ1vnLd5ZTSy664OixY/AOdb
	XTay2XDF4Y8C2ONyOF1x6787qDc1dfLEpi5ijRlQJroHgVcv2eyvTl7/KNR8uupy504tgw+gY8zTV
	Vqy5MN6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNQ-00000001V47-3pBG;
	Wed, 22 May 2024 01:02:44 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLp-00000001Ttt-44Wk
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:20 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-5c65e666609so12290267a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339664; x=1716944464; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=li4cMkwFpL+HSmSEXdVX350c2G+5+gkC9h0B1FeGGvM=;
        b=dWWqG83lF7ia6Ouzx8nM7h3ruuoIsWH/2DXInUpL5OP2/5JOxckm6FLFUx42ao9MRI
         W2wo+Q1F85h8kuZqZc4DIuJKpw8/I4mGl/qjyn3CaVCAqCTQ7HabOlmVmBEKTimYQ06d
         wcKWLlbzUV1TjGbUB61GP34pSMKt0dc3+5HNorOLP2kZIv7Ns5+Kocv32Gzk7EZortpg
         ShCJ7WiENrBAxYUpXJ2U8dsTkQn2HAxnYl5octiZLOjaeKR2UuCESSADrtUHx7S9ogBb
         5fEorV9XNCxaneHWozMDHfPiEuC6fe+i0lXOmRw88u+kC1a1fPCYXweZBsNT6aDJH5M5
         0coA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339664; x=1716944464;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=li4cMkwFpL+HSmSEXdVX350c2G+5+gkC9h0B1FeGGvM=;
        b=GLqV4M6UaCn7fmiGxOEQPFrlUpelf9SdxP0QzZek0sddcXn8dH5buLjDNTBDTRWoo7
         iFOu8wgavTIf83HsllEPB5hxiFuytqQAmAIT0htcCtrPMpnXSSfHqF0vJdNT9I9J+CFa
         ZeW4Z7ifr1YtZ99PvI6dU6mJFFP2OjMRDJsa7Wy5gmoNgiiggWpKlm0YLQmr/ZENi6Al
         RQfcC0gJnXjIrcB2Bh1zUo1nQCleTk5xE9ZfyG7s2oFHgxI1tM8qLMUk4RwKkEZZt/iK
         /0XJvuqbUz0etPQCGrdmyjkrItN6cUE4ql8/ONklnDqdGIoikk5+hfDT5quN5YhQmjv8
         hiow==
X-Forwarded-Encrypted: i=1; AJvYcCUhVU2zNQkrAtT4MeGbUkj38TW+TslJNg52jDChdx6j7ZRjYSvxqoOXvTRaZV4E00GD7x000z9d7LoHAaYyN58OAC2wF612+IMvo5Ovtn4R
X-Gm-Message-State: AOJu0Yz5xoJNJYk+IfvxOCXxyau1cZ/3KSzHXo8liOcJJULOAV7+43Ti
	UJlwlZWOpspaMqqfT/6pYIBOcG3fbU1o/MPPyAJYl1kHeNwJL86VaD923uBkdnUiDtUILEF0M9f
	b8A==
X-Google-Smtp-Source: AGHT+IEaH9w2a57rqCwXzXPT6DdBOoiiolYlPL4GLEwkxrskFIkwJojwmD2tTcosE6e+p+FZJxRnCD+/8cU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a63:2644:0:b0:633:af0f:16aa with SMTP id
 41be03b00d2f7-676492d62abmr1177a12.5.1716339664339; Tue, 21 May 2024 18:01:04
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:19 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-34-edliaw@google.com>
Subject: [PATCH v5 33/68] selftests/mount_setattr: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Seth Forshee <sforshee@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, Muhammad Usama Anjum <usama.anjum@collabora.com>, 
	linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_180106_687447_52013AA9 
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
 tools/testing/selftests/mount_setattr/mount_setattr_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mount_setattr/mount_setattr_test.c b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
index c6a8c732b802..d894417134b6 100644
--- a/tools/testing/selftests/mount_setattr/mount_setattr_test.c
+++ b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
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
