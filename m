Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0DB1C25B74
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 01:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=3YwWWM2i58sJAktmZ0uL3VNbwr8sWI+QKc3UlTbUulY=; b=UMTX4T+4HG+EgUXvjPkMyb4wMq
	6pVP0mmjb22m/VjwHr35+InzOHSrppXpMFOjzcOwxi42a+HkIwqbJehreOW3Lm0tb38LpO+F2VfBx
	AzhLckwKldFuJcFztAakx8Y9cAWMTgR/IxZZdmltVR5M4+a5UCac3rlaHCLWar7cRanz1zSmJszvd
	BqwVf6zZmq4AnJWNj7Qz09OahW/b4R1+dO65QpcEngxjPyJ6KCYxP6yI23t6j1SHHMv9886P8Vkih
	AKeVz0lFolu6B7jNvMgityDdqi/VNGLZ0Xk9FDQUN1H9k0Znu3J1XSXBYCMlQ3fj2cfw2gsWMbWpk
	7gXbDMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aLw-00000001TzV-0uDl;
	Wed, 22 May 2024 01:01:12 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aL2-00000001TMr-1oFJ
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:00:31 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dee5f035dd6so20429477276.0
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339615; x=1716944415; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SekOhk5uN00IhSEFy2Kx0Wz+un/KHciPZvQ+RL+rSjU=;
        b=Gdk5/q8SeqzkHvoPnKqlpGMhEL6HBZGN07E867InbkeYZ0a2HLwTT4yPw3bSh4TXN3
         Rv1NJyqzhTchZ1loEhxZBLUeziGv7a8FBnth1LNQJFBYoV8D/fIyokGaNAsCjJLX9ayK
         0Ty8fmkvEegc627p/ODFfARrBP1hpiWdJQq8VVuNitITlH/TJfdzKItPN0KLjghk0KNt
         IvymQ8t+lQsNiehCBlaoLkE8LBG3H7DlX7fgGjLQMTjuq3uSdzwOJxRGcCJDD7w1Jcef
         A7laSGbmNiWOf1DiIKkpKtWDYYORc2cEU0/+dK9zxCHfcap5x5OmSeVjCVbGqkVGV4Bb
         wkJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339615; x=1716944415;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SekOhk5uN00IhSEFy2Kx0Wz+un/KHciPZvQ+RL+rSjU=;
        b=XLvYtAvBHfZoqjEAmvHyu2LwgcsWS9wKgfCkHYZjI0cS2FUWmHGPImK5ZzOHvOw0FB
         BBnVYQ4QPzTCbYFCOEt+9ZLSoEPD1xLjtjDteAKlud+ePCFGSM2dwN4+BcXcrw46LWhW
         JmLNe28s627v429l4WYtJjJLXBaCIyFbOTOczY4+91+Jtw6/E77bGOgam4J/kBzLyBCf
         sRAfHuFPqv6MqA6zgXPP/yOqSIX7t8nCSC01cadhxSsLBfChUxWZ+ag8KPuhq5mZAWKW
         R/434eeuxYdvJHSp4a2+IzjlytlqnxkEl2Vf9K3YYTC/J0j00izf3jwtdesJ7ff7QfPs
         VvaA==
X-Forwarded-Encrypted: i=1; AJvYcCXDfedPUZOua6DEjej2kxVbBVatUgSN5U3r7rSqiC+1AJv/qljookEJaHRuzikkyk2oUudENhckyFfljzpqDwPQ+XzZ1YtLKqaSqUqQmmD3
X-Gm-Message-State: AOJu0YxC05ylE7fZT6b362xjED1fkSShFopOM/K4ugZADMUSWn9lLf0d
	9vaMxs/u4ISfqkyp/gnLbSsD6JCKDVEjWfIv6ZOJnftaBaZoSAA54mPTkQJa/uiDkyhUxs0fZ3k
	bxg==
X-Google-Smtp-Source: AGHT+IE9bSYLh/E/LGMxrrx+sHbG1nGNJ4Z5EJs4Lw6O6tg4A/yJwqWA/HgEqsXHwdInVe2s+KZjs0ddQxY=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a25:2e09:0:b0:dc9:c54e:c5eb with SMTP id
 3f1490d57ef6-df4e0d5b5d4mr203793276.7.1716339614945; Tue, 21 May 2024
 18:00:14 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:01 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-16-edliaw@google.com>
Subject: [PATCH v5 15/68] selftests/fchmodat2: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240521_180016_875714_B6E1DB20 
X-CRM114-Status: UNSURE (   8.63  )
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
 tools/testing/selftests/fchmodat2/fchmodat2_test.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/fchmodat2/fchmodat2_test.c b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
index e0319417124d..6b411859c2cd 100644
--- a/tools/testing/selftests/fchmodat2/fchmodat2_test.c
+++ b/tools/testing/selftests/fchmodat2/fchmodat2_test.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
-
-#define _GNU_SOURCE
 #include <fcntl.h>
 #include <sys/stat.h>
 #include <sys/types.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
