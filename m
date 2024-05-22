Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C85DC25B7A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=5EMbYm6dUrWmPmwQRRIFqwiO0yM/VypVp3LZu6aBFm8=; b=BE+79msLUBWcgFSqFHG0s4sK2L
	y85RSQC+aHDE56QpUXyCT0k6GtOv+P+9z+QGLx6zmcsYNVpp0mp/8pj/FYPoaEkK0Ny05zOIfeuth
	yp51Kmw1WYv59yP6XFdww4sOR2ovRvWqNa5giaYwOoz6f4NzNOWO5EMSisDysKYPUVkCiY2aK6LL0
	c9PVv/Nx4wSZwLcWTuL1vjAyaTzVRJqOj7TGXYVjdFEVPCLcTRYA6gPCDTb1MkRZ+o/ZzhejQ9Hq+
	IlHIljeVtIejiC91NTw5D7BodCTk4xc4kSyTDxe4sgPU35pw3GMKYarWqD7dIKutV4cRl/ZIQtx8w
	yVD7aiuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aNt-00000001VMP-4601;
	Wed, 22 May 2024 01:03:13 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMC-00000001UAO-1Mh5
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:01:51 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61c9e36888bso235767487b3.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339686; x=1716944486; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=1CKnAn2dTa+C7mVsFNdLeReq6XnLpu/yCbmMKU/FzkI=;
        b=SgvdSb6tS477jJyde7jQ0usxZDR1LE0AZU3pMaDA+xfDYJIAtqcj7z11ITofVWUqgc
         hWM2QpN7jNP+DKpDlmk+jVavPMz70+Xzj+KdG5iczhCJ2ab+xDc6f7gHr6+AcVkkcIqc
         NgqYqvRL7NUkAA5nrNm+bvx2GX4koQ9W3Yx8CxtV9Hn4PNwIUlwu89q/ISmiPuQozz5g
         5xrV+fMRUOdX199l7BAJuShNSvoUJBuMQtgJK9RbLe12DWR1DKfss372IShNFioDDziY
         4vYPM0TKQJz2zC9E5S5m9kc4NOVv9xpPsBUXOsiWqaMojZ3an6cO/BlsthdN588lJqY9
         IcrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339686; x=1716944486;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1CKnAn2dTa+C7mVsFNdLeReq6XnLpu/yCbmMKU/FzkI=;
        b=rrMMEfEt+OjS9ymmgq9zUEHHi5vxB5PtlhTd9Qqwtt/pG9yoROMw2AzJ+2VusAx+gF
         hOYGD/D8FGmO63y0X4cNWXioJ/UtfTrD0ocgo98QvBZ3z/Sv9r1xFF+2n7ZuFCStAgdF
         wYDXz6BmHk7Cy8IqZhswNSNbz+bhdjR/Dn5colgABlo8VH/U97OoywG8cIXlN/2AxSMS
         zFpY9jsZ2vyBiANM4mDqQZ7JwbovtefIdcAdfwLHH2gzXUzOkZm8WJdhgWau0Ix7aEMz
         5TrnLyFQik9D7ENY8Na1RGApcfuZBOMo6ItzTKvZuy5j6epf7GyQYNgILJ460afi0J+g
         bKBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWq+c+NwjgERQ2yPJ2p/BVJLbW5XnFBlyVv4kpCu3Ew0ryG1sbu7H/94g3d/yESybrScf+dB9CU9fywaZcsGlz7diRLpsW+099LEdHSQewK
X-Gm-Message-State: AOJu0YzlE8EXrA9MLiylVkYiwvVQEeYGED9+1os6CuREKFzZCW8IjQLh
	uNHaMYbxp39OztEXaxWZ6aiznHu7e7+Z1Ij5wMCWcBgxht7RpNKjAIty/pHK6Z+wkqW+iGASqwI
	AGQ==
X-Google-Smtp-Source: AGHT+IEl0cJvO4b6yqb1eRVPUMmZua49b0zW20Ko2luMd4dbYyTTwbryVnAUNZaV8WFB2p44rBWO2LcSGkY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a81:918f:0:b0:61b:e524:f91a with SMTP id
 00721157ae682-627e48c78damr1602947b3.10.1716339686071; Tue, 21 May 2024
 18:01:26 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:25 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-40-edliaw@google.com>
Subject: [PATCH v5 39/68] selftests/openat2: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180129_050659_5D1039F3 
X-CRM114-Status: UNSURE (   8.96  )
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
 tools/testing/selftests/openat2/helpers.c            | 2 --
 tools/testing/selftests/openat2/helpers.h            | 1 -
 tools/testing/selftests/openat2/openat2_test.c       | 2 --
 tools/testing/selftests/openat2/rename_attack_test.c | 2 --
 tools/testing/selftests/openat2/resolve_test.c       | 2 --
 5 files changed, 9 deletions(-)

diff --git a/tools/testing/selftests/openat2/helpers.c b/tools/testing/selftests/openat2/helpers.c
index 5074681ffdc9..3658722c889c 100644
--- a/tools/testing/selftests/openat2/helpers.c
+++ b/tools/testing/selftests/openat2/helpers.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <stdbool.h>
diff --git a/tools/testing/selftests/openat2/helpers.h b/tools/testing/selftests/openat2/helpers.h
index 7056340b9339..ecd20a3d47ee 100644
--- a/tools/testing/selftests/openat2/helpers.h
+++ b/tools/testing/selftests/openat2/helpers.h
@@ -7,7 +7,6 @@
 #ifndef __RESOLVEAT_H__
 #define __RESOLVEAT_H__
 
-#define _GNU_SOURCE
 #include <stdint.h>
 #include <stdbool.h>
 #include <errno.h>
diff --git a/tools/testing/selftests/openat2/openat2_test.c b/tools/testing/selftests/openat2/openat2_test.c
index 9024754530b2..51f1a7d16cc9 100644
--- a/tools/testing/selftests/openat2/openat2_test.c
+++ b/tools/testing/selftests/openat2/openat2_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sched.h>
 #include <sys/stat.h>
diff --git a/tools/testing/selftests/openat2/rename_attack_test.c b/tools/testing/selftests/openat2/rename_attack_test.c
index 0a770728b436..477125eb64e2 100644
--- a/tools/testing/selftests/openat2/rename_attack_test.c
+++ b/tools/testing/selftests/openat2/rename_attack_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
diff --git a/tools/testing/selftests/openat2/resolve_test.c b/tools/testing/selftests/openat2/resolve_test.c
index bbafad440893..48fa772de13e 100644
--- a/tools/testing/selftests/openat2/resolve_test.c
+++ b/tools/testing/selftests/openat2/resolve_test.c
@@ -3,8 +3,6 @@
  * Author: Aleksa Sarai <cyphar@cyphar.com>
  * Copyright (C) 2018-2019 SUSE LLC.
  */
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sched.h>
 #include <sys/stat.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
