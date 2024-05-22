Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFAEAC25B7F
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZJlcaCJhoHzWai34b0OdXtYFantCq+RhaEltOUrHbc4=; b=NtKlJBnx2+sgFWamdIYoR2phqE
	0Jz+1lu+TzAtVylbZqxroOdV3Rc0k3tm/qdxoQxFASBLKXH7+7USwfkfnEfCxVG//MTDh6daHkg3g
	/TYfuEojBcygI5PPacS5ayuUMeJiut8FaqYk551yWGEHTTk8rplbBi+7vrvRTbzIBZPhJ/x3e/1G2
	Xf2uuHlnP7EAiguDHR1TPMO5xqBuNwHEBfOgD1mIjTCsE9UyCfnBALduaT4h/hF4jBcT2pxQSmoO5
	lru5E7ofJNQpntuxxeANcQhxYJPWWZPusjDCeDDHrbBGnJyfzILA7m0/xfEhNCFMz2sfYN/jceu1l
	UzEj9EaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWg-00000001jUb-0hub;
	Wed, 22 May 2024 02:16:22 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLf-00000001Tlq-07SI
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:05 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627e4afa326so5025057b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339651; x=1716944451; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=N8L5ENa9saWnWy7VMZgJQvy8O2UHKdWgDS9fdPg7qj8=;
        b=Iu5wqtG9azsVL521qhyrMHbPfP94hVAahIUK4LCNcOe1jtA8amSuVN/ZoxU7icXUP2
         MrOuc0/zYvY2jC06TsdsDm6DfkQeEE9XGVK62IYbCP6uMBImMC/dNalxrTphCzUQIqN4
         PoSb6IoYGdNa55fmDbDSn9ICRS7dpU0ec0WJRJKSzLOoewZ4+SqrJZ09k45QN7ZwKqLB
         3GV/g/B3fmLcz6LEeuV6Op3nMaSvyQ5p0yQqLzJqLdHZ2os8Caz0Y+q4BWJI5W2S2m+T
         3eMwi/yZhLcfDOaIFdOFiR4zkhD5sv3Xr/5uF70F1wSpzmpaOqtao24ia3DYW/RkBO6c
         K6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339651; x=1716944451;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N8L5ENa9saWnWy7VMZgJQvy8O2UHKdWgDS9fdPg7qj8=;
        b=rNzR99sMWBVsXOYg6dXoRS2lpg0ROAQAQuyLXy4w177dxwgYiP+Fa0h7AOV+BzQPOe
         68vsDWcoS+bVSe3Klo8B3Qj+gSTnyNUHFIprafeDNfLNPmQHagUJreP/3nd0wd5HBHlM
         0bCWwtW/e/JNh6mai2tDWbGIxm+kWwHm2EOsCrByQYJsnrHfOLigxxqpovIDdPVMUssn
         VCQvOFIodcmAPti+74ZwKj2LdS/vhpRuUEekAokAQPBVc+YhWSaaKMJXZ02/xNDSipK4
         NG8i8sryVjHjbkVahkB6Yyn5ID8rDRZqjLxsKd6WsJXBneIeN7sfLcBNBXjn/0jMa7D2
         LqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCX20gSL8Ow8XhpaRia8z7ZH7/+o23yBvC7kWb5YFTZrd/fH/sZTkHPSsYi87kj1N1F3l/cLZvYkUyw8sWc8KWPSrF1J5UEKtxT0HxKQwDwb
X-Gm-Message-State: AOJu0YztMxGjF9pvdrtBcn104516XXrnzBpPdwtqqAjoRJTbq97fOGFD
	b9qTkczyvMKYSC526lAt+iIQyuyRxZMKfP7j98c5YJyMoJ879KFRed/Xhrg/c2dPZ5AjWq1bEV1
	CXQ==
X-Google-Smtp-Source: AGHT+IFS/IZw7uE/6kkYjIq+Ri8WqRBtijmIEiJcIQSsTtS4Ny9KcGMsd6Vyi/YUNyZQw3Hok9pzmfMHEIg=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a0d:d5c7:0:b0:627:8b31:e81 with SMTP id
 00721157ae682-627e484a333mr1542497b3.5.1716339650801; Tue, 21 May 2024
 18:00:50 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:15 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-30-edliaw@google.com>
Subject: [PATCH v5 29/68] selftests/memfd: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180055_683625_BF61607E 
X-CRM114-Status: GOOD (  10.07  )
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
 tools/testing/selftests/memfd/common.c     | 1 -
 tools/testing/selftests/memfd/fuse_test.c  | 2 --
 tools/testing/selftests/memfd/memfd_test.c | 1 -
 3 files changed, 4 deletions(-)

diff --git a/tools/testing/selftests/memfd/common.c b/tools/testing/selftests/memfd/common.c
index 8eb3d75f6e60..879d4f4c66fa 100644
--- a/tools/testing/selftests/memfd/common.c
+++ b/tools/testing/selftests/memfd/common.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <stdio.h>
diff --git a/tools/testing/selftests/memfd/fuse_test.c b/tools/testing/selftests/memfd/fuse_test.c
index dbc171a3806d..e35c6909f0bb 100644
--- a/tools/testing/selftests/memfd/fuse_test.c
+++ b/tools/testing/selftests/memfd/fuse_test.c
@@ -12,8 +12,6 @@
  * the read() syscall with our memory-mapped memfd object as receive buffer to
  * force the kernel to write into our memfd object.
  */
-
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <errno.h>
diff --git a/tools/testing/selftests/memfd/memfd_test.c b/tools/testing/selftests/memfd/memfd_test.c
index 95af2d78fd31..ee019b57bb98 100644
--- a/tools/testing/selftests/memfd/memfd_test.c
+++ b/tools/testing/selftests/memfd/memfd_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #define __EXPORTED_HEADERS__
 
 #include <errno.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
