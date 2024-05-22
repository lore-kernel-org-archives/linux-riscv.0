Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDD56C25B78
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RU2ePyxfyBP3Nlus6tCaNrNTgGPzAjPhCtivtcNgbFc=; b=Yr0MGOK4CIUeVVZKD41xr9v2K8
	wiX8Mc8gy0BFtLUv+I+ii8MJCuLUc1EguKQJQsHHg0rdk5ch+lKYzfVs2VlnMH9qFlGIzKqIrkNvb
	BgNaTv3TA7KaC3ZHWPRZytGB7zLXKMg476NeGaJGm6m4OLF7OOKAWwqt8HE2sCxj+5kWThO0cCC+C
	GQjo+cWgmR13Ggo919K6xPEFc3hKzq5JKU3NM5xgW0na1kuZhna/Cq/9Fpf08oiNWKex+nR1ueuAJ
	1aSLIFKzzdrnTKPbhkICv/WI537gbjX2W9u0M4OLrjET7mR+1IHJ3MsYfBoPWhOXO/ufXhZzmeH1g
	9SXxBhzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWd-00000001jSq-18mm;
	Wed, 22 May 2024 02:16:19 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLR-00000001Tdq-2EoR
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:53 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dbe9e13775aso23643823276.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339639; x=1716944439; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8mMLRxOyMxZ1YbjHsp9Gtp1tVJ7YpTB/MrMb4PdfarM=;
        b=gb8bR3EoJHUnEUIGQLQ3WDM0ArgmnWA3G85TgWKe1sCa0A/dX0MHhvkdK5KlRyIO1N
         ppROnJwE53gHu2oBGGTsaJiKQlq2Ns7a3mIfdutxydSsWFGwXAxcw34GnuqN/nmLQewy
         pJQoXkbTLzkEJXhEGD3ePMuZZ8gW23LOcyiz0tAAbQUcGRJi/DP8gDwlu6XFq8mWi34D
         8nI70ip6WpRNS/Uxx61tjk2YDxiuCr+SRt72Ob2WD5hJZjgAUrM0PzWL8rSOWFOwQll+
         88fMTpPXXQUF65GXeSkPp6tGQlGB9PQM2LmgnSXsXkIskkIlKcOvPyGubH1AHcriRzWT
         G3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339639; x=1716944439;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8mMLRxOyMxZ1YbjHsp9Gtp1tVJ7YpTB/MrMb4PdfarM=;
        b=xHA0sbyDm5QWXXYkCcEGtetVbhrSLbZwW7q6AHPHC6oiObgPIzMramiyLXgvNCY7kf
         wfW2C01ulIstRleK7KKbq8MsAGUT1FUEGTKxh9pj8e7lDVdhqTT8e6cX1PfqtIF9Ofz3
         +RZ1nO7x14xd7kuCYfYGjJGwg+XUs7KMlseh2u2s9FVlNUtOpTHdZ/aeKxWnzUVx0dnp
         8x100rrPLuH4ymcj4HXjbeQ+JgexShAssZ+wUl/ee3lEBHLwqqVfBGNNk8z503Xx43ws
         r9aUmcvWvjVk48pQm8CXcFXQ8kqieJVk5mbvGfCFoNlRRABx3xFh+KtR3M66vwmkZYGw
         xtQg==
X-Forwarded-Encrypted: i=1; AJvYcCUBNDrfw7y8mUEBpsYTa8GL4zd/dbNDtDUC44fJJzyiL3TpQ9PGD9xrPiBQblv+Q0yuwiZOamH7RYTgXCZTZ1EtXWAjmEFu2DmxUHTKuKL9
X-Gm-Message-State: AOJu0Yym6rOwC3ppIAj4zUAuTBEdVaadmcVSD21iLGfhkEI08/LAsQUQ
	tXpH1bbPwt8/H93Wq70t+ZlCsuACDOzQGa8h8KRYIhppsyavkbGcSpJ6ykcrd3xCE8Zfjoor0I4
	qEg==
X-Google-Smtp-Source: AGHT+IGJ/NmC5MVevhEcAlb8Vh5DFH7n/e0XuYCFPdZ/GMGUx8MMz7Y1Uyzaqxg9/3KNaRheKGfY5j48R7o=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:b86:0:b0:dcb:e4a2:1ab1 with SMTP id
 3f1490d57ef6-df4e0db5b86mr217160276.11.1716339639505; Tue, 21 May 2024
 18:00:39 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:11 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-26-edliaw@google.com>
Subject: [PATCH v5 25/68] selftests/kcmp: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180042_019890_AC70354A 
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
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
