Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E134DC25B77
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=AcVODsl+py3nxYyZLBDkT9iPWvBfQmRYGyn6trcGdTU=; b=XmAQg4sMFcXGWqGbLmXbQ8Sf9T
	GC2KnnwU3MMSEQQM/JtxbNlT2bOPqt9K9sIi+tb2Gy3qt7C8LkpRM5cf1ltZZg4EKjjj4L4ouX0z0
	8ae9qVFH1IkiAMCSDiyzmLzerGgDMwJIFsE+Cu5YJbWWJuLkeLYFEr5yTfJkB+bd2jijr4mOSQccY
	8Qd8e9dkurnHDgVAwyODNPIE9pE9cJLomFFzDjEe2D7G1ZJOZo/23NMza1KhJBlPy9jBw+PweJAo9
	V2Jt+rIvN6ma6TCTBg0Nabkon340CGrN53wUQ9wLi2v3twh+2SzQQgKmPCF9lobL2r/o4fgPi/9Ft
	Y/tr1iNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIg-000000036Gc-435M;
	Thu, 09 May 2024 22:31:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yx-00000002cPE-0Ayr
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:03:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GvmtJI8ym3OlQtCXEUxM/omnRwwmEG5jK8JE00ZU37Y=; b=ag+qQ2Xgisg6qdsg+8ES5fPI9w
	wIQ/fXfmi1UP9paAZ1N3Af7+c0HXZT/zqM97r3VLd+Wb1q+1GtDQ54QxG90S2nRcoRTX7LfpGUFf3
	0tpbOchB9kgvtx6DtGRTw4Lw0WcOSu2oPk2HNEWwjxQ5a1LVcqlsZWmQrNCvIzl7o6Fiv4iS3RjWE
	yYnlQMge2sMJHJiCOHy3cTKgvAMLnI5+dXVCfp+3NSr783RdYni/pgXx8Z/ApKH7fvWcnO4mYyEcg
	DYDUUds6LGPOrnrjPBDDbdqx2CDeGXAmSJabTmQWby/OaNLsxUpBdB35uU/TjkcmA0u0Bz4qy/Jtj
	BLyhIjCA==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yq-0000000306p-1JZM
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:03:06 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61bea0ca5e2so20580277b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284979; x=1715889779; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GvmtJI8ym3OlQtCXEUxM/omnRwwmEG5jK8JE00ZU37Y=;
        b=chs9UuYZg2mYt4vWJkBj0BJtWdAaFF55B4+yQ72iVqiCkAjZ6IOuQlNokd18luwvy0
         RlgInf06OIYbVdbpZFX30qXNlAGZPxxTJNL8NxOvbUOTjnqlxw1jWyLBwlzL6iy8hdo+
         2shUWNf5aicAQ40nDUcM9lY+ekJ6U1v3K5LTROErglAR0qFf628dHiTX1idb9x+pJk4u
         z/GvEfS039xsu55AaMm4gv6NG4QLIGMA3n2SPyxMCEPOebdztH7nRZ7S+JFNt4ee8UU0
         E2kKCSNz9fv2vkyUvw83GYpUmI7ldcK3dH2uA11JypTSxGUjJwk2muh1LYpFEyHjCJSI
         m5LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284979; x=1715889779;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GvmtJI8ym3OlQtCXEUxM/omnRwwmEG5jK8JE00ZU37Y=;
        b=Sjqu1vWEAhBJ+/fOrAsJDRv8ug+FMrDm9T4H5y/SsjQ3aQJERbC2/eT4umQ9+hWz+b
         8USJKuW5WBARQMxMv4Ja+eVstilTHwcbZ3z3jYGz8Zs5bE05d+Uet+7eqSgtOCoYxp+K
         EuAaAqjWYpfU85ek73OBz8k04kKAFdQVNjvFFmdF5XgYSu9CMZBMcnP3X5/L1gDqWSxU
         0kB/9N4UpawnHXHSg5E9rTLbnv7ULBAy3fBNKXNHs6LfiZzAUP+a/bZi066x3C51PsCa
         U0o05cJ6nxjof4fMoqLUrZ1ghTOA+8fcF/37APW1IPxY2d9Kh0v8yK7e02U4UVhl1quH
         nFsw==
X-Forwarded-Encrypted: i=1; AJvYcCW3x9WH9O+QYnrnymVmKa3f2AX6MZ+gbMK2aTReiFZSU2/N6Asf1580eZqW4DWCwJLGO+Dt/vwyzM6cTiLDz893sDNXBp7cvcq3WuuaOTFw
X-Gm-Message-State: AOJu0Yzb4cciG7rKG/DXS+Sa2QG635wz91PiBTSVw7B/cgmQpJmh2he9
	sGNxA3ccsI6p0UydcZPbWTuGt/dG5eHWneEtuAqRbToVT47EuA/L9j+jtQZtY1GMaraGD4ToeEq
	HsQ==
X-Google-Smtp-Source: AGHT+IECWXJfpRwj4dOARyjNpf5qmoqsg21f1i+unVXRq4Ddyrt1gCo+t8C3Okd0lmBC5HYwEwRa9oXboTc=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6f87:b0:61a:e7f7:a4cc with SMTP id
 00721157ae682-622affa4dc7mr1321267b3.4.1715284979174; Thu, 09 May 2024
 13:02:59 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:37 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-46-edliaw@google.com>
Subject: [PATCH v3 45/68] selftests/ptrace: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210304_934963_9A378853 
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/ptrace/get_set_sud.c | 1 -
 tools/testing/selftests/ptrace/peeksiginfo.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/tools/testing/selftests/ptrace/get_set_sud.c b/tools/testing/selftests/ptrace/get_set_sud.c
index 5297b10d25c3..054a78ebe8b5 100644
--- a/tools/testing/selftests/ptrace/get_set_sud.c
+++ b/tools/testing/selftests/ptrace/get_set_sud.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include "../kselftest_harness.h"
 #include <stdio.h>
 #include <string.h>
diff --git a/tools/testing/selftests/ptrace/peeksiginfo.c b/tools/testing/selftests/ptrace/peeksiginfo.c
index a6884f66dc01..1b7b77190f72 100644
--- a/tools/testing/selftests/ptrace/peeksiginfo.c
+++ b/tools/testing/selftests/ptrace/peeksiginfo.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <signal.h>
 #include <unistd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
