Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B4FC41513
	for <linux-riscv@archiver.kernel.org>; Wed, 22 May 2024 02:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KWJY+/xFtC83jSX4+J0PyjD0j+eGR+uYGeOJ9O1+iNA=; b=wI6v8vLKZBqYM/p1L5jaVco4+v
	b9J/tZ1QtRyEUfePDdQAU19+okvDgONkwhv/gACxJ74QzR+ZaAc26X+RUEp0fyqSerz+5qga1SdeW
	vj6cc3Gmq7Tl/uV81x9QlSBFWRbS6eIDJEEWK+fgiClLkN887dqTLcgJ+LKz45vHumd+T2CUYmFJJ
	sE0C56OAqwWMYsH2fbucaCeMy11fzPb8INTHluxRpvLFkxjcAY7IgYfwTNlX6jVSZ+AandZiPmNRC
	KjQwkWXSzsCK4N4Z0lyfxFbFK0uFDoFRNeRrhxZcVFnM3BhBH0dBXrhvE1e591ZNcOSxs/TvMjRKk
	NmFZu3gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9bWk-00000001jXQ-0AJ5;
	Wed, 22 May 2024 02:16:26 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMr-00000001Ui4-0UnH
	for linux-riscv@bombadil.infradead.org;
	Wed, 22 May 2024 01:02:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=dUmmygsAekCvb1sAxXTt/LLFhqw2XmquX3PYUBGtKuc=; b=qgUmlkQ92nhQ32qvkOIBRJnneH
	j7VRb38PsxHOnMqnbyvwEfnkrrxm1by+8pMl8hCWfRCKM8NzA3eSPEwJoNmXFZbuO7nHAD2VKnwRd
	Xix3zSpnMXC6dwmqvMac+Ror1DRJ8PoGRnwpq0UmHgwmT9/gbWlTzC7EVK8/TaqYwDtGBbWM4eIeC
	GlSmxh3p8MvXAOZauWZ6diAG91ijW6qQx1gSCT9rofVPlbX7QFv8s+GKe6cPG//J1YNBoXPr9N3ly
	fwU/1AQINwnm7+naGw4PxUnnXX79Cy+XzL8WVuzn5bCQyDwtdgToM8UxbodZwK+U28v+f8cwbAyS1
	cTwE35DA==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9aMm-00000000BAS-3NJF
	for linux-riscv@lists.infradead.org;
	Wed, 22 May 2024 01:02:07 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-6f6c27f142fso1456229b3a.2
        for <linux-riscv@lists.infradead.org>; Tue, 21 May 2024 18:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1716339722; x=1716944522; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dUmmygsAekCvb1sAxXTt/LLFhqw2XmquX3PYUBGtKuc=;
        b=Q0F2BAElFCa85vulj+r/fYKb7KNa35C4UApbfwI45C+ZSu1Ul+RFlBTNHc7PaW7HXv
         sOheapbE0FZxIAS/Nzit0LNDcjC4X/ZASQ0Mx5LJaaGDBCwO/xUbWXvep9zoe6nF7YaM
         WXYqE4d6MC4tcel1FEvUJU2AzjxyqfOFcku+nnqs057nu86Y+I0nA9ViV85fSqD4VWcF
         pDaVxBxfLznPhx93wt9yoQ1qrESmbEeZcYIEDZ3xDzqP2Vj5ZU5lTrEZH3hRt4q7ZPGy
         T1I1/prG7Gl5ZfQny3ET9/5f1BLrdRxU/TAJRGoQuESC0l5YcM7kclT7ERNGxYZYfxBZ
         p19w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716339722; x=1716944522;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dUmmygsAekCvb1sAxXTt/LLFhqw2XmquX3PYUBGtKuc=;
        b=hJNq6+vOo54ctGtNATgmn37KSBaFBBClwsdzNTHf4EDeEUqOgONGEI3qF71xdxBsyQ
         Xf3aUxxPVB4oOgcWvSc4o6+b+0yfV2s0jhRs0WSGjdsxY0cYXc2txmpo0Z1PZ1evtWq7
         XjV3BNFNXFZXwFy5oXGGC2F8Z38NYjS3ed73DlxPxbvSrZ4+kYniWbTzKLzWBsH5JMqi
         Lhi3+vVqJKyIDxV5apd4tGqty51wp2Jv/N0aHYdI7ab3q746cHw9LkPlxoYcEhN/WcNS
         psl+3YqyjLQJC/1NsfxzqfQxRcZPaPHXlmfsykyidX/1LD9JLDE9Cx13JWj1YxbemTct
         1fJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWlFDEZZEMgRgzJ3SqvECyeUBqbXlBw7zTQPrCq06ahDeRHRmb3zWQixzdVLbXHPf+V80A28WXGgmcORPGwbBQunNJiUOro2O5hcThyoXk4
X-Gm-Message-State: AOJu0Yx1yUoAU5SVqY0jv8K2PQT/ytUy38jLH/hwdnIiCSX1BOGi3qxZ
	9oujQHDmVzLe4PnzNCCDipTa3mt3u+7h8SlS1WB/dEzuYjr2OF9oY9+oyf6kxL0LcBk2wrmzcPh
	NjA==
X-Google-Smtp-Source: AGHT+IG4H8QACvR6bgMlwjQZlJORskEQiHsnadZ28t0SHRUcGChmPWb+2uVYxv2B/0aMSfdVlBWp3ChsGV0=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:ac2:b0:6ed:d215:9c30 with SMTP id
 d2e1a72fcca58-6f6d64c9235mr20041b3a.6.1716339721836; Tue, 21 May 2024
 18:02:01 -0700 (PDT)
Date: Wed, 22 May 2024 00:57:37 +0000
In-Reply-To: <20240522005913.3540131-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240522005913.3540131-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240522005913.3540131-52-edliaw@google.com>
Subject: [PATCH v5 51/68] selftests/rlimits: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240522_020204_883965_605C3270 
X-CRM114-Status: UNSURE (   7.70  )
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
 tools/testing/selftests/rlimits/rlimits-per-userns.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/rlimits/rlimits-per-userns.c b/tools/testing/selftests/rlimits/rlimits-per-userns.c
index 26dc949e93ea..e0b4f2af9cee 100644
--- a/tools/testing/selftests/rlimits/rlimits-per-userns.c
+++ b/tools/testing/selftests/rlimits/rlimits-per-userns.c
@@ -2,7 +2,6 @@
 /*
  * Author: Alexey Gladkov <gladkov.alexey@gmail.com>
  */
-#define _GNU_SOURCE
 #include <sys/types.h>
 #include <sys/wait.h>
 #include <sys/time.h>
-- 
2.45.1.288.g0e0cd299f1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
