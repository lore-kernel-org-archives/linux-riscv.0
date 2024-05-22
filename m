Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 640F4C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=O1VXREbnnGu9qfc9rrnX8tduAqozpunCHCfOsdRqAHE=; b=4Uy+0jl0PEVZu1y2jgNtlDmYOQ
	RGARm8Jhne3IJ0wRbbonc+qmdtT2iOMZysN8J1o3jemvMjABlWoKtWAYLKk+SwkYDs/JKKiUdyOHm
	wpvY/V+pBsoDBAxS/iruRiJaPSvMkaoc38oxsu4lZ1rj6gGkHW/uzo5aM5+Zooq0QLjg2TELLT89a
	v82ae1EBk9WabXgQ9jH4ZbKjoA8QyUPH/2DkYNGsa9vA66kd0iEB+eX6NNieoLC28l4VGRn3NI/Dm
	CJNClvFz1CtMc+gyTicOwCoDJG8ojrxpT8qrMjQbjxVT10ngklFU7mk41eXbrbjVtu8WMPg+zFOSd
	2kBJlbBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLz-00000001U1j-1aRW;
	Wed, 22 May 2024 01:01:15 +0000
Received: from mail-pg1-x549.google.com ([2607:f8b0:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLC-00000001TSj-1R6l
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:38 +0000
Received: by mail-pg1-x549.google.com with SMTP id 41be03b00d2f7-604bad9b2e8so12370830a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339624; x=1716944424; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=NK4aimLzcbzcHbun/AiqJMn6SwzGMo+GBjyX7d91cEw=;
        b=UqFUTv3Xur1EBz2UtUc/7SkhDg61fW/YTa9BkHClnabtMdVfvCWU/BB9CO9ptxLbLh
         IZOjsrV22q27xDs24Cmke0YIajpcaX9eXyWAKIlHIgxZ+ZxBILUivJSvfmdsGL9cTsr+
         G0TaifPxtoOdg4EytkOSLWzOrRWthTxXhGZ6U3AEA6bIAEoHwwww6A0MsaM/W8hgREad
         cn4wXhCZ5GX3ZnGh4slJEPbqnMyl0OMJWo756typXBxvbRqKcb3FyDieQJH8Zvj9xKO8
         6i1Lc5HvJrohiVymFdlya/3ZIYVtxkX/mYfbySU+QmX0KX6eOAqVC1jAfG0163ukNuQR
         r3NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339624; x=1716944424;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NK4aimLzcbzcHbun/AiqJMn6SwzGMo+GBjyX7d91cEw=;
        b=SG/4hyOZJalqzu3x9iOvO7fRaFtIZWfsi1mDVzPKQYlHQM/PgjgDsG8W0vy8Vrw67A
         v7r9n7LabCCfDW6mTHMSkVorEx3qN2Fm7a6VcrAjmiSArBlH5RP/RLiV6Qho2Djs5S3I
         Vxgr1LCONVn9BhLqyIolwpOXsYClvjnGs3a6KWNyAWbYLLxvs2QwCPXLeZH8MC8k7lp6
         rfnKt6nHEAnSTTGp6dz2httnvwzJTGtsLODlnc960FOxaZwdaK0NJQNVfalPRmh+9/wL
         qVePGTBp71cLBuMWy1tVdTqg7r6muPVQJ5k7JV53XLHXfLl9u9A2ds8CBbScTEhVTvy0
         ughw==
X-Forwarded-Encrypted: i=1; AJvYcCVSr0dfH1RzuHlF02IEeYrnNfdufyYtrIaUQ7awTJJNq/T042y7Z7wnpHtsLmqNnVfis2P0L8hqDVEGTg2k5HkdRnyFw+ymZgd4Cu/hBuMz
X-Gm-Message-State: AOJu0Yw8vrNGuOYrhy78cQelCNaPMuYg9CE764154j0y5v9cA7pr3Rez
	I8FpB/xS5xkU4yJvn1Mf2CrrhoyEHXTmouSTmQPgp4KemM7CCDUkQt2/JPtG4Roz2dTzqhm/sLr
	5NA==
X-Google-Smtp-Source: AGHT+IEfubfbv0g1n6E/xjRKgWJVsI5mDRaAB3rAehbhcdlOwRi+21CKT/tu9kKkmJpP9Jll2mvLmtGZyiQ=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:e74f:b0:1f3:135c:f70f with SMTP id
 d9443c01a7336-1f31c97ec7fmr402795ad.6.1716339623577; Tue, 21 May 2024
 18:00:23 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:04 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-19-edliaw@google.com>
Subject: [PATCH v5 18/68] selftests/firmware: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180026_582734_B84FDE32 
X-CRM114-Status: GOOD (  10.11  )
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
 tools/testing/selftests/firmware/fw_namespace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
index 04757dc7e546..c16c185753ad 100644
--- a/tools/testing/selftests/firmware/fw_namespace.c
+++ b/tools/testing/selftests/firmware/fw_namespace.c
@@ -2,7 +2,6 @@
 /* Test triggering of loading of firmware from different mount
  * namespaces. Expect firmware to be always loaded from the mount
  * namespace of PID 1. */
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
