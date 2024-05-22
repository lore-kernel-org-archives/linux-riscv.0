Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F27DC25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=mVLNz7Fxl7rdAdq+wcX/6G7KrJ96yM7lk/bFSkwvzXc=; b=H4WMqOSGGp17YSeFoJWrWOZxhz
	kXNZ/tKqEapiRAlaG5uvuSII1kOgS/hGjBf2PpXYwMZCWeP+trBk8q3gQ7cDol8h+kXv2buE6C/Se
	Mk5cqc4avNe69TRSzprUk9byJn1JV4+XV1IQ9n1mGek3S6rhkvUF/iVwFcQIQUQ3to4j5hEOZgrPS
	/jgwTrR9mCVgm6kzmEGRdlgpv6VnefOEvWQm8zzQN5jEiN6iCl5UbG3BD5UYZOB6Q0l1Cxs4s82dG
	heEUwQzdZIAP2ob0ktrA4zLC00pAhGWlCGAOkRi2uQc9n6PnKZQF7sMJlwAzHzEsgxjKbvDhQ+MNK
	kswnniZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aRR-00000001XlY-1ZhU;
	Wed, 22 May 2024 01:06:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aP3-00000001WIg-3110
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:04:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=qBN6dKvcn7a1ilrAwfzcd0ocDzyyL7QD4f+HvB8bOIQ=; b=otMY5G1O4V6OiEfk/BaA2uhW29
	v+dGCC8Dc7I1RuXTfpZCcQ+PxcvdJAQSTjMZYoApd5DwMXkOSWVLDNCBMfA1v3Ewp8aTo2OatZv+G
	B9rZF+yqeN34czZIp8niMHRWBTYrU6XA6qa/IFAucZnw1/eB94GNDbOoqWZfP3fkE0UVEzD/A3b0A
	/3K6+rmKyE/cb20oaM/Q1Hldu23Bi93Fq9u5H392B6K36bMCsvDfJrCarwUjEAYuRzUDsHy8Sqaym
	gxDRFLYWq5ZNTNnbKNJhzCuaX48nzxBplGGNNsVw6kzig1Ib8L8uqKxGq18KOpCaxG+PUf7Q6efww
	jMaapVuQ==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLK-000000087kR-3mHD
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:04:22 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2bd605b1fcdso3616553a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339608; x=1716944408; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qBN6dKvcn7a1ilrAwfzcd0ocDzyyL7QD4f+HvB8bOIQ=;
        b=PJ6AeX8aHxY1ynHUUrXwINTZyT+7504grcVsKj06GRyvt7KMq3i+NCaxIN1CwUsJYO
         Nmzx6m3inggRuGLiCSNx7GaOiSF+evcBOjqdALCHQk28y+CJLc3taFMCHdFbNEFjaChy
         xulQIHsIG1xcm6z+ludKPtqLFNvQ9AYvEWONI0ONKs75VEpSu8xtMXD9YQM41E9xKk6L
         kWWs4CLYTOnlN+S1vdxhW0wZ1xJ+UC5T6Z0tEGJgVkeJ1jBq7kMh2dA+SJAItNsFRorM
         DK/6CvclXDqx5Y6+sSSsE3s4sYGTHe6Z8371TxohuCfwQrfn/ACeQixMBWjKq9Ju+7fn
         0+jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339608; x=1716944408;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBN6dKvcn7a1ilrAwfzcd0ocDzyyL7QD4f+HvB8bOIQ=;
        b=HO4Sob6x5JTBB4rdg7EVt0pu5Asvq7yB2767xcLbgleFuBY0qL/ZuseYOtXAskuJfM
         tfe8TC50/KF+CABI4j1LXiOR4IECk1qM5srEreltOXl2i/rphPVuqBtwSx2hacXHd65g
         gz6oy2Ru8vQH4iMchWF18gc5pyjv96Zg45Y4C6LWpqVRuNYIpUXWyE39V+eQB3NY6j7b
         h22qXYtQ5RbHy3nuMw72cgixox47PtWJVunrZz+gQeFjGoTsejfNAumis5gPZnBusL6t
         mIGPsUxLOXZDfBXC9k4cvzFRq8fds/Zm3WCuKto4csRL4XQTL3h+knBYRM4S0Wv04F/n
         8K/A==
X-Forwarded-Encrypted: i=1; AJvYcCV00qwkgnRKr6Phg/B15V7agPNFOKeBDAx/f0SGmm8/s2qzkH+0SHK9XyyhNPoyx8+cW4JDb606S24fahilzgt5jq/PI8IWHgSiiQIAdedn
X-Gm-Message-State: AOJu0Yy61y54JIRk9hZJ15EcJVw724XsZAZVPCxlt45epuvwGQ9rVLNq
	RbKtZdtqCMVYq6qkrXYAIQUXQP0Q9Iiin+i0V9RAUeX0jy3lwYvDH8Xv1pZHctqqJaESQAi7Uq0
	BWg==
X-Google-Smtp-Source: AGHT+IHt7Kr5feX1gdf4rvQKP41zb9M+M6WWZuA6mfud336Es8VWWBsR3GXtiDGmwzCkNXAVdnqYPJZFEdE=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:9f8f:b0:2bd:9285:c147 with SMTP id
 98e67ed59e1d1-2bd9f4a593cmr5758a91.5.1716339607777; Tue, 21 May 2024 18:00:07
 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:58 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-13-edliaw@google.com>
Subject: [PATCH v5 12/68] selftests/damon: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	SeongJae Park <sj@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, Edward Liaw <edliaw@google.com>, 
	linux-security-module@vger.kernel.org, netdev@vger.kernel.org, 
	linux-riscv@lists.infradead.org, bpf@vger.kernel.org, damon@lists.linux.dev, 
	linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_020211_557251_F270E6EC 
X-CRM114-Status: UNSURE (   9.18  )
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

Reviewed-by: SeongJae Park <sj@kernel.org>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c     | 2 --
 .../damon/debugfs_target_ids_read_before_terminate_race.c       | 1 -
 2 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
index 0cc2eef7d142..3f0dd30f61ef 100644
--- a/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
+++ b/tools/testing/selftests/damon/debugfs_target_ids_pid_leak.c
@@ -3,8 +3,6 @@
  * Author: SeongJae Park <sj@kernel.org>
  */
 
-#define _GNU_SOURCE
-
 #include <fcntl.h>
 #include <stdbool.h>
 #include <stdint.h>
diff --git a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
index b06f52a8ce2d..611396076420 100644
--- a/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
+++ b/tools/testing/selftests/damon/debugfs_target_ids_read_before_terminate_race.c
@@ -2,7 +2,6 @@
 /*
  * Author: SeongJae Park <sj@kernel.org>
  */
-#define _GNU_SOURCE
 
 #include <fcntl.h>
 #include <stdbool.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
