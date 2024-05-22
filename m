Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94DEFC25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=714xfUCD81wBAYDl2MvXyZAWByDM4W96ZPyjiWU8e7s=; b=CiJsuAow7gsYVTolyc0ybWyK1s
	Iq9UgDwMtra9JqqXEoxJWbAbNVJ80Y+1EKCjH3I4vEaHzWkDR14yW7Fo8hUOKY7ss9qwDmmnqzTax
	9W+JZx1j13xadKnEDktBimqFKKG/Q1NDcLSGepCEqBuYIPPvLooOnCXMj5t2IsDzUKB3D9kIEzeWz
	RzoTAoLknsaU9qM40wyvDEaesa87KM/fODiXVrq3L9UybutLDP2vFDpd2rMys7kblc5PxbQra0AbN
	R9IP1Jn/86X4JYcHUE2PXkidtiV2A1PcOBJfpTt0mlacYmEfUlhTDIptEt6ylpbp98tdmKBVfjwau
	RqGzPrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNy-00000001VQN-3eAO;
	Wed, 22 May 2024 01:03:18 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLg-00000001TnN-1r7r
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:09 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2ba1cad5c7eso6003241a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339653; x=1716944453; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=oVf/OpY3d2Q/Mya51rq/+c3LTiKmdxaF1eraxGBViHY=;
        b=fDcOa3V9q5iEDtXeoFISemYSytZOLyUko8VTDRmzX03MSIGVbFWAAQWLekg8CyMZtQ
         mRechw1o5eJ9pOG/2ms6iF5JVJKcaDvAbOULAa5Dpw+TxwskGGZogr69SH/f73UGch/t
         DiAug9LCL9RKq+ep6s6uvZ/kr2EIlqa9auW1iQfHlfq9qHzcCNmhJEPp7XX97EDymR5x
         NFZEW7fPXO0/gndcSZX4EIdteP9VWxVXmd5j83b/j2+uNjzqEk1aSrvzdwAMHh2qpMGv
         E6DLMItKRtkSYlThVHV3i7TRpSQWphH/5VEa4ttIS8SlFWaHm3rFxEWQeTooHOwm381j
         yUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339653; x=1716944453;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oVf/OpY3d2Q/Mya51rq/+c3LTiKmdxaF1eraxGBViHY=;
        b=oJwqposB8IQ6R7wd5AFL7j+UOvrn5q7F09vMXfTKYC+i/T4q3rR/1l5QWhiyg0YWX/
         GnKmV6P5MyuuRdGi/qHjwenc8EGkBufwYWeQVvhvc7U4TpUgWo4DfKQv+mNPXB7KCekV
         C0Z8l2sAy5zx9Tk+jnjLR55LPIkvM4t5gz8mM7E9xx5djP/htl5Yc36PmPLOGM+DLcQC
         /j+ef+/iqMQi3e4W22d39ieD37VRFPfSVnXzXYFC6yWUL5ZZIh6QztF7QjRvkhoJosst
         ilK6Fgr4xM213PbVYtcLxgyqwb7Mm1jbRGWDYphg+Xs8dYwjafceiroVWEp9U/gs9OYV
         /siw==
X-Forwarded-Encrypted: i=1; AJvYcCXreh+cIX/exbxGcNiUJ6EOVHBhpoDLwKIU1RpssNhDnvtyGXhuCVMb/vqcMYwj5N5wjy6iPsLhSILhf82/vcykAkJfxOGDds7ppG3Qbnb6
X-Gm-Message-State: AOJu0YwcWxEOtvaonxLrPn4hzNOXKfCyKOvQ1bT+GnFOsywm3o1SM07z
	VweoB8ibn1acalXmag5RGqSL5+cx1lNm+5T4E604w9Zjd5J0qdsYSmwBZdM1Fkn90MLYC/VsIUt
	iIg==
X-Google-Smtp-Source: AGHT+IERmvjUACU1dGq+usdhCn15n3wBhF0S7qzqPTxOiEhahwny+LRi4B/1JnjPnSFaHmLZJYt2JZRastY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90b:1195:b0:2ac:992c:4c71 with SMTP id
 98e67ed59e1d1-2bd9f5d9a10mr1843a91.9.1716339653260; Tue, 21 May 2024 18:00:53
 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:16 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-31-edliaw@google.com>
Subject: [PATCH v5 30/68] selftests/mincore: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180056_856706_3D15FAE6 
X-CRM114-Status: UNSURE (   8.02  )
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
