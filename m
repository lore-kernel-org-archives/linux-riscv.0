Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198F3C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6tHd4vZkKUNtpR09ia56McuPUhQZNAcmSCl4QzIhbS8=; b=b6f3X3ubHwryvrsYi70gZKBf1q
	0r1YLFBOI2uOhHwfZGXaW9Ty7EuSR0oa9OCDi/L9GXGf9X2r8b0g1HhbnZxKYafjl54zfEZciCG66
	DOBEa23a9rnpPxx0iHtLDAxqOpFlcSadMp8SMUVwNz0oPDYG6mMtbQgr0becHyl5FSXx5ebb96hgh
	uap0ymlqIXaV+fEBXSIryckQuS34GrmeadnigPkQKlhEZH3NIgKHh4vDfYuROx3ZlcsNQ170gcvTe
	gqfX0TEUwgDPIMUTfJ04X+gJTWZBFYa+EXd9+fh3IgLcaefilrgOm39adeNblADntcw0FiaGJ4rsw
	2DYw2PXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKr-00000001TED-3O3D;
	Wed, 22 May 2024 01:00:05 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aKk-00000001T7l-1Jpq
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:00 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-df4da3446beso1254507276.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 17:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339597; x=1716944397; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ym3nXUXeH07sf/nsYazh/meC97pdGBCDIsOIJ26bWuQ=;
        b=evOgt3JEa5+PYehLjjdSOZ+uIdwHgqVY5cvT+rOq5ei7lfn5Wc9Ggc13UkcrXBdviU
         SY4NTIdtJ1ntNQc0hoZ+t/4KMX8KJT5zDzBe0aWhqXIVxCYll4B74/I//xwVdgt/c6xo
         E3gk/SdPGtAm9O1cylWRjaM4MMQDJag6VORSR3+eycx95S+dKGuJ5v3d4i13FYF2cM0A
         92kjyuCTODG7sAcUIJL6e7wT/HULIlpq86wywJUDLhCQ3DnqrZaocChMmcuShji5aSjX
         AGTLK0N6RyM2ZE3UrAB5pS0p8wcqmSogSFFnkHf22vItqpHZrGbyPDj2A1ooooUqpqzV
         PGSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339597; x=1716944397;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ym3nXUXeH07sf/nsYazh/meC97pdGBCDIsOIJ26bWuQ=;
        b=NpLToZqQjQccAKA8oGS8NE0zKbEkiAM06caMCsipXMA1HJB1bv1fJR9HLZKZq9vacF
         99DPxnRywq8rkQl7JKfhnYjKL26FpkYo6rRalzTDOVj+jfwc9Y+ezjv5v/2kjftXH6Rf
         wM0vft8rBnXuwBDe8/Qsnjm1/GMIpsBEUTRDsEEAkZTJh+FenrNvABqlaq6EwG8Yownf
         zBBGJqB2x5ApzAemhNBmmJboq87mGXdAOxDabtR5GyJeepzoRQptWTLVpyigMMzbw3fR
         gbtOiu7KHG/5jPy9R76TNM+u+GXM4/wK7gyt811ZA4mj/g6ihYVlkBwyH2SEz13fG0VG
         tZEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmmWjf/+JK3WGfqdnfmfTGahGQcJZzgloikfjLIC8UdReQTqTpy6H+8AfMRqWOVjHPd0cOaY75HgAfB+nG7ch7BsBbPrpY8GGHM+d0hgHA
X-Gm-Message-State: AOJu0YyaD4/fQcyt/DGTHMvUvM8705UbFRsNPw2VsF8Xo1vkgZBsbRuU
	JhYIw5BltLvUKGGRwGlntStQfg3sCCIvPnz75kvXhRHLIiPI8pNPTgxbXmoc58NWfBp7ROHpEKf
	+qg==
X-Google-Smtp-Source: AGHT+IGqx4zcon16q0eoDTQDxUtzKaoXEeTVLNF4sRkWHpre7T5XR+6WmP9e2dcSPYpPAo5gyN8nv9JO98E=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1005:b0:dee:7db6:10df with SMTP id
 3f1490d57ef6-df4e0be43a1mr197886276.2.1716339596889; Tue, 21 May 2024
 17:59:56 -0700 (PDT)
Date: Wed, 22 May 2024 00:56:54 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-9-edliaw@google.com>
Subject: [PATCH v5 08/68] selftests/capabilities: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_175958_615296_50AF9CB9 
X-CRM114-Status: UNSURE (   8.53  )
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
 tools/testing/selftests/capabilities/test_execve.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/capabilities/test_execve.c b/tools/testing/selftests/capabilities/test_execve.c
index 47bad7ddc5bc..7c37ae2407c6 100644
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
