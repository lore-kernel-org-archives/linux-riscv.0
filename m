Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D23AC10F1A
	for <linux-riscv@archiver.kernel.org>; Fri, 10 May 2024 01:17:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KvAjHol0zPzPjpXGxxxFZraiJA1UETm0t3On/a/sc9E=; b=KK0clOK3IOEwOuljuyS+Ng8owj
	chr554C798un9gx9WuT7sJ9FRLIr1ElDjcK8lcW4mX8KZOJYjsOISJ/3y8AanoI9oOkoPqSb1kqff
	9R0hFdenihQram7biMm3K7RqAfVrwQLsB9fRkv2x7hLLtIBZjHGzUjgGv+DMGXtyjOeVpWtuqaCSi
	1hbiV8ANeRwBagyWbFJ7ruPQ62YBWp5DGXljCJv4+2i34Lgdm5ng8U0t/a4w8XYhRrT4kjfdFvYgA
	WbTgv50emWodAQrlTU9bVX3o1yoLzIEJ4GZHzmuC9F2W/TF76nFsSPaiPoNhUmqOP1x5TX/WlwV/8
	m17Aqyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5Esu-00000003ant-0S0w;
	Fri, 10 May 2024 01:17:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqJ-00000003NMW-1aeW
	for linux-riscv@bombadil.infradead.org;
	Fri, 10 May 2024 00:10:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0S2ku+XXmuipqzeUWKEDXJqHDc5fSB/5BLcnzpP9HjI=; b=meMuF8goYsAyeF+HeLFh51dmzg
	1Sr2xX2t1Yu8tr5nGr606QfU51vKi4JVU3HkjBkF/tir3Tu+s4Aqaqghsp4zHmqf8corMr1gU/VsF
	V0VxKey5pfnySNop0kyzCfImgLjIQmDwwbKwJC0LGvBwYRG3z6GjaTrZM36sIc6oG2J8X71Vrua9j
	qZTLMKF2LZUaXK5i858Xo25lqIKsRQ+BEqv8QyIO20HtrH1duNsvS8bP6dUT6MRyVuqsyyfne6ltl
	0DXf6keyBQm2iO5ChCGlekW9QiJlnXhYu4NjT32+uGyRjazuoDqXH0CUXcFq1xO72abAqKB5dhKXy
	hwEz9MkA==;
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5DqB-0000000362R-1jQH
	for linux-riscv@lists.infradead.org;
	Fri, 10 May 2024 00:10:29 +0000
Received: by mail-pj1-x104a.google.com with SMTP id 98e67ed59e1d1-2b4330e57b6so1346818a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 17:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715299818; x=1715904618; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0S2ku+XXmuipqzeUWKEDXJqHDc5fSB/5BLcnzpP9HjI=;
        b=ZbmBkyA3xOKliKhp2GQw+Gpdzx3fSRPgrC+XfhMRZBLWBFZS/4WpiATaK/cFF+LLSX
         cAoUYl9F7BYRkFcYKpnckfp8l663gqdy06SsKYt5QeoT+/GNV0FPru/mgb21xjEx6tdb
         8+K9uYtUr5IPyrDzPK4f735WCuvpNkXU1ulh3q1Q6iL0tf5efV+Sw6YuuVglR9hE7HrQ
         EQPmFDVlS79UG1WmmAZfUsR2GDKVup/odqzJQjIVqBhm+NXTkley1ZPPlxJvetelkVeS
         waTJxLfmsPk7KqLZShvQihd1aBYQy4Hy+6+hznc7ex46ZRzpM/qiXNguOVmezICCcSfp
         xu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715299818; x=1715904618;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0S2ku+XXmuipqzeUWKEDXJqHDc5fSB/5BLcnzpP9HjI=;
        b=bGKz7gi4eLxsEUls+a+G4OY3Z9r84qnKRZMzyGys4Q5MRBp4f7FGfWSwu/XQtQGvS5
         9wjwFy5qNCtqWhT1RPRNck7i0FTFLuwOHnpv/1ljOlTRtYOdBbGsjiYL+DBQQFlqaaoh
         GPVIJ6ok+TJVGHsv7JDtCRqPd4D5EsbRiR7evYSeWh8SGxelPKI+CJVZio9z7EMT7Zwu
         yYke8febihy5jP3pb4Q1NExxTdVfaBvYrkIgke2b5O06ekcS88t8MVlhqkIr3Mir5hok
         RV6a0iUFaJckyK0Eno4BjeeUXmV+/2PYYVEQ+WQXavtU3Yg2FEHcEsEtQW+DLkRqOVuy
         6Zwg==
X-Forwarded-Encrypted: i=1; AJvYcCXGrxHe2/JdUCUmFyeoqhIMUj5Rg84GN6dQ7Zm4eODOa9NIitx9rRoAZPLGqUUrV3ZnEXCaUOmMgWIboQeie/rihANDHZVE1r335axk4yfz
X-Gm-Message-State: AOJu0YwjcZiV9sj+S/S6PG5E/th2irbrT2SaIXoE2wRERWgx5n9FccZp
	7gJSQxiRdW9tsWxnGPbVyceoDcB4HEXCusgzUl67n8CAuF9B1AvWDA9w9mCDiDlefxUPsfEqY1N
	Akg==
X-Google-Smtp-Source: AGHT+IEvPxzG+VgbGLQZPyjTunSD2K2OGyOx1fSoHPtCs3xqRWSd1ujURjrAMGTT/wZYgXc+/eF9Tg8NW6c=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:90a:5403:b0:2a5:dd7:1c35 with SMTP id
 98e67ed59e1d1-2b6ccd85d25mr2766a91.8.1715299818491; Thu, 09 May 2024 17:10:18
 -0700 (PDT)
Date: Fri, 10 May 2024 00:06:44 +0000
In-Reply-To: <20240510000842.410729-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240510000842.410729-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240510000842.410729-28-edliaw@google.com>
Subject: [PATCH v4 27/66] selftests/membarrier: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240510_011025_271962_5AB4901B 
X-CRM114-Status: UNSURE (   9.32  )
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
 tools/testing/selftests/membarrier/membarrier_test_impl.h        | 1 -
 .../testing/selftests/membarrier/membarrier_test_multi_thread.c  | 1 -
 .../testing/selftests/membarrier/membarrier_test_single_thread.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/tools/testing/selftests/membarrier/membarrier_test_impl.h b/tools/testing/selftests/membarrier/membarrier_test_impl.h
index af89855adb7b..a8a60b6271a5 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_impl.h
+++ b/tools/testing/selftests/membarrier/membarrier_test_impl.h
@@ -1,5 +1,4 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#define _GNU_SOURCE
 #include <linux/membarrier.h>
 #include <syscall.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c b/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
index 4e14dba81234..c00f380b2757 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
+++ b/tools/testing/selftests/membarrier/membarrier_test_multi_thread.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <linux/membarrier.h>
 #include <syscall.h>
 #include <stdio.h>
diff --git a/tools/testing/selftests/membarrier/membarrier_test_single_thread.c b/tools/testing/selftests/membarrier/membarrier_test_single_thread.c
index fa3f1d6c37a0..c399fbad8efd 100644
--- a/tools/testing/selftests/membarrier/membarrier_test_single_thread.c
+++ b/tools/testing/selftests/membarrier/membarrier_test_single_thread.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <linux/membarrier.h>
 #include <syscall.h>
 #include <stdio.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
