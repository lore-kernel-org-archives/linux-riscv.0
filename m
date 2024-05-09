Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74812C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=CqwKJJlWo9+kUVo2GxkzWvQUF/BOmRaZmbZOk0bgvUw=; b=VFVdFtDvUYmBLds+8Wg8JGufHC
	/Q3ZuW+0ioQCx7T+2re7katGtm/9EAy230FDXjQexN5awNxkOQgFtt6Vlq87sYWYDnDe/VIP9jgk4
	IDd0+gSCHxXoOmeTEvleZTp5R2sGkdhIywebcVjscrTaHH5Q+qLJPSen88w6O/Gn6T53K3dJNz7zF
	0lOpW4aCO0lsSAAp+FV9p66OU69hwmigIAyMBEKcadJ1ENHLTHDPw6l1+DeVwam3aZbztKpc4p8Gf
	pNv7s2uPEsbXhsZnb9kwCFIGJYT40CnX/FnL/ctJVOtyyCvIomqQ5klt4xCl3qUPTwa0S0Pw5hR9O
	rzIV2kkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIp-000000036Lb-1q78;
	Thu, 09 May 2024 22:31:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zt-00000002dBj-3iGm
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:04:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QQBoWhnW3eSJL5OjfxzO0lzEIXAyAkfzlFMU1Ex8yOg=; b=FskdYHBoFC2NKTtRMxVzsvCNLU
	8RWiWUlT+1XEdKUF1i0IJPz20LPbdJuXEUNtIb4MV2LWYohIEBLZ2q0jeUVLSSMSgFHG9TNrhqS33
	Pz+RU5AFMyyKmjNiAiaGZUlRP6HMc3JGVn6TTAixxXxakfRrueU5Qqmk+kcWqzvMtsDlkKFSop9vq
	RQdBHFm+KgsriKQGjOgVbXdiHaWeNQzMdHkKhPLBmeHMBMYHqlBT7Q3hKjBab8oWxhNpWvVDYqjoj
	CfdsKIbXFv4mTUjzVUJaFe5UE0I67iPxV3F3xbdIog87FxH4004pR6n9DpYs1zyOAD+F4ozcy17Bi
	qzrPvvGQ==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zm-000000030J0-1BKc
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:04:07 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6ece5eeb7c0so1083730b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285039; x=1715889839; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=QQBoWhnW3eSJL5OjfxzO0lzEIXAyAkfzlFMU1Ex8yOg=;
        b=XMREGiuFFMxfaRbPsMD6wfBl3t3ACbU3l/UFN+k989s9OGcREbjUZpff4UwQEwvXrN
         9L0o3enhMhZzL8NcK2WRp1AZ3lsCw9I2xt8XVX6f+8cZGgmHgFeJCxiTGu+yH2lFQAOY
         4d/TvOH+0wDP/dK3PQxPam2AarQaxM3cuDzVIUy3OkvUOA8RDoVBR+v21jWHPvH8eDIm
         dwCbxzXwWkpcFuDwL+InuAgxVeEZgNyD3aJdAFYgNWQwpvYsX1Z/KZ3nruwIS6+rgdSj
         pswENgFNLmvplGgrbmOWqXuwiMcp9TEtKVLDXeZjq5LYOAiQqlfCqXqOvuJIJiqWBGmZ
         aDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285039; x=1715889839;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QQBoWhnW3eSJL5OjfxzO0lzEIXAyAkfzlFMU1Ex8yOg=;
        b=L6aYlPt+LXVKF8/AwI3akhdN9sxF23ZHJf8psxL0uM1QNk6r5fkvot/WfCUK5X5n5L
         7HgbEmCCW5Rps2t2L/fv3Ihf1xIE8HYQcJMXpyeQkHA2qjekJxdmpujD+CmAX0R7Wol0
         rmzduUX0nP40IbPhcfZhE3BcePWfGzivZI4rLnKA24SadofYyEjKuBGFU45QMYoyJkk+
         P3FVQvS9filQQGIWtqOKqav5zz1zSskYT1qi05pQtCW4oQoVun6RJtT1EHRm2A3sO9F+
         3YX0ikD+PDfpwTWVFwxB1AO1YyME29iRq2lkKMlfZyGj6287zuhko3jyDfnzmm9qwXgA
         Wi2A==
X-Forwarded-Encrypted: i=1; AJvYcCWQB2ISaT466ap+oXilb50ibPkovdELc6v9SZhilAdlBvAkNNRbb2rVYrE9c2I9EIfF7fsmYACLmliMRl9Ca0gVkBF5fCtIbz55kgWLnGCf
X-Gm-Message-State: AOJu0Yxwcdjh6EwgKM5gESaPrni9jcrY5ayhLUWVLicpzJYAHisYScTK
	GuIfeKDkDmu+IK8Sr/Xe++ZUOnh+rm7cGjeWXSU+/knhJrzVlxjhVryu2hRVpq4x/Qo6A8fYxAg
	huA==
X-Google-Smtp-Source: AGHT+IHMhChQUGH3o/y/Xjd523PA1kFSsocfDFneSTYQRZIsze/kEjlVNH96NGo8Y5vnkXmCBqnyZyOLRsw=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:a91:b0:6f4:d079:bb24 with SMTP id
 d2e1a72fcca58-6f4e0296acamr10866b3a.1.1715285039543; Thu, 09 May 2024
 13:03:59 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:59 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-68-edliaw@google.com>
Subject: [PATCH v3 67/68] selftests/wireguard: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	wireguard@lists.zx2c4.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210405_087826_1807427C 
X-CRM114-Status: GOOD (  10.09  )
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
 tools/testing/selftests/wireguard/qemu/init.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/wireguard/qemu/init.c b/tools/testing/selftests/wireguard/qemu/init.c
index 3e49924dd77e..08113f3c6189 100644
--- a/tools/testing/selftests/wireguard/qemu/init.c
+++ b/tools/testing/selftests/wireguard/qemu/init.c
@@ -2,8 +2,6 @@
 /*
  * Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
  */
-
-#define _GNU_SOURCE
 #include <unistd.h>
 #include <errno.h>
 #include <string.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
