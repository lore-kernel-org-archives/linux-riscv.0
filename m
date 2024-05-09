Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3EA2C25B74
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=BwXx5u/Vvtvv4kN6pLtTWN8xQDkeBmk+VxRbFwSdh2g=; b=GCpICwIyiCLowdLWwP/NRoHMNp
	hHkVMDNk3g6rm2IcPQBNM0Mm68AUtIVjR1H0TKSZaZ/0atms5I7/b38TNRBu+sL3TkNak/8tk75Zw
	FAC34mNl8Kr5gRFMVAwfaGNFwJfFESOBnPBaZXgJl9xSAU8otGXzHOKvD6OfW/PmbGh4HFfoguoGM
	+kvW+bOSln5KcXeVYgdlGmcEV0j4wInzwf0S6sf/lNrSD63wt96Qaj3jbV75C6kXP9uP+lHXcqirW
	NgkNlwWEGlgACuVEH+4967an+irGp9SlfsYbbCJ6F2kSG5DYjeLHiwACDhce3owDbhsEDj2h0FsRR
	T/xYkR5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8C-00000002uCq-1nSJ;
	Thu, 09 May 2024 21:16:48 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xs-00000002bYS-0Mp1
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:07 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61be25000a4so21363457b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284919; x=1715889719; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bCAetgsy5/zofnz+8UMPVpCBKs2hhXfKubjl6/AwDCQ=;
        b=lZZ7s49lvuP5T+bp77LYsmwD2+tr6yA2T5Belap2Fx5Lqh2sRYz08+DetpgW7PbT2M
         QTzQN1eNr4u9BQysQv6MVFWAXQFU6cm2Bs2T8dS3PEC3f/k0Ljn6opCfd4sVY4Bybkuw
         SaqnrYfu/LIL1e3Qh0+RjXTFfUn0jhp2xNsfrDV7fImQeBkA41C3Wu2bf4C341Mv0qpd
         FBzmUnecxw16T2nfrpfBnR7sUV4/htcaFqbjYeZkYfjEF9cl2IeduhKBtDy2TiB/fQ3X
         tQevRwKK1abDoRH4xTx15c04ZeEZpUNoW5NFj7vy/2kQO2GkIYJkFglq0cGTv+Bht1ip
         eAiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284919; x=1715889719;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bCAetgsy5/zofnz+8UMPVpCBKs2hhXfKubjl6/AwDCQ=;
        b=ecfOLWnbIhwN+w6Oiq5a4/yADoYKYSGmHlvdSeG54eqrBnPcRtlN60jzrMrqvjea7M
         JsFAPcqz2iGjgfW1AWgf69/MSGoKR2fYU27nlu6jOXJaRvYou1UTFBth96J008wk4WXh
         tTMsLHZZJ9aFAI9fFJk8mP59LyRGKhKHMn746xmkd8nnazINkYIuYDux1fizvCmJSnzP
         We/aQWMr3gNRtKJ9ZaTlh+kTnpETU4ernJ72vvIvp+PNDAPlzYMHjfo7YiV12vPO1hRi
         cQgyDQRhZ09Xe1e/YaFG9OLTky9UtwsDwZwmX4tD6nnI6qlcjQ3RwDz6+Oc5Dtrn3qSO
         HTVg==
X-Forwarded-Encrypted: i=1; AJvYcCWtmf1MVYhyetujoM92pTyJaOwb5qurlSOElJRgM4jfBwNCi1hO6iiOebg6nNgsDN8wr6S0huywJuVp6wsK5PnZc4iw2bo3QHO/fdxAtDr0
X-Gm-Message-State: AOJu0Yx3PFJmzgRBK1+QkjpXlTxcpxt6ux5iClsWQ4qummXDN5uEU/RJ
	yH5pluB6GVDtFG4nJ2QPZnK3Zy9aPgWVuZo9IIv5auu5MTBOm1yiqn9rEk4/aMvWyznuZ16aCMH
	7aQ==
X-Google-Smtp-Source: AGHT+IEOccdP8zaf02kaUFiSefNhqGNYrWb2znEKmAbmEDy9741vUefYHtBjwkO9wTStl7g5XBDfQZrMi8A=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:690c:6f8c:b0:61b:ea12:d0b with SMTP id
 00721157ae682-622aff85f0cmr1704757b3.2.1715284919580; Thu, 09 May 2024
 13:01:59 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:18 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-27-edliaw@google.com>
Subject: [PATCH v3 26/68] selftests/kcmp: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130205_506950_8F84C9EE 
X-CRM114-Status: UNSURE (   9.35  )
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

Fixes: 809216233555 ("selftests/harness: remove use of LINE_MAX")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/kcmp/kcmp_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/kcmp/kcmp_test.c b/tools/testing/selftests/kcmp/kcmp_test.c
index d7a8e321bb16..f0e356139e1f 100644
--- a/tools/testing/selftests/kcmp/kcmp_test.c
+++ b/tools/testing/selftests/kcmp/kcmp_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
-
 #include <stdio.h>
 #include <stdlib.h>
 #include <signal.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
