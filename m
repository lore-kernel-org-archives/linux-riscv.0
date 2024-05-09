Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C9CCC10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+pgWBaApIuidSkyWjz5tzklfbjTQh6b0JEdHY1+zrc8=; b=iNRpN0qzm3LuNDHj4tGdzn6Lfo
	ik0rB/ZkdjYnaP5vo5wbnXjfQcCb9gFL3RPme3pk5zruwrMpBmHmgtWWlkdHpUffqa/MBoIjjGlTV
	lni6Jd2WPYFev9TJ94gHravU7N6UlaBRhVrZuxAUsFBlJLWG1TGJqu6JpSW/E492/6iCcZw8yxEEo
	JczEwUxT3+erFPxOr20Eh8Dt441rDECMNEEb4D32MyJ+IZGd+Ou3I377i5BtPQ5STEjjIaODnt4+6
	MBsj0cnpLUCubFWryH9ozditwHdtfre9GzqOtben/VtkExnke2NE0AK/V4O/g1gffAcC4Ong7+xhK
	W6UlxnQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8K-00000002uJL-1XJb;
	Thu, 09 May 2024 21:16:58 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yU-00000002c5X-0UT8
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mGN3dzX1Fg/8DMWBisk+V0BflWzMHd7DBmLWWSrLzcU=; b=RpAl7pWj3jkltxCp6k9qGSSIv8
	fyJwbK9zMo+qr6STDGTgryKcBb3WWZis7IkawJj3B8CrhgHmWBNZpwaJX1VSHcjZmPCp5aLR341TN
	wmHCYKdSMRTfMg3cnVwO5uAHjJEzwGEiYQA7hgyCmA2Jac/nbdc8re6U+nHhrHCVmL8xrCp6xcv9a
	KXNVM+/ppBWXaFGDTR2U0fkauiIu1HXP0Jliq2R/v9msIl1iMPx6Jjr70uG3idT6mkkiwbcGPTACG
	GUkgZbPqJSo0b4rtecmVCfFbUB/AbIc1cEJLvmX2NVgZgLxS06luTHgxOEWvJziGMQMSoDt5+uDQ/
	KWmxM9Lw==;
Received: from mail-pf1-x449.google.com ([2607:f8b0:4864:20::449])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yQ-00000001JhM-3hUF
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:40 +0000
Received: by mail-pf1-x449.google.com with SMTP id d2e1a72fcca58-6ece5eeb7c0so1082531b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284947; x=1715889747; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGN3dzX1Fg/8DMWBisk+V0BflWzMHd7DBmLWWSrLzcU=;
        b=GpkLsslsCasJG60jaBNfSVQnoW7hNs45HY9s00t46hCyP7u2AT11x8IOqn0JdC7i1l
         cdiz5usoBzYLn71NOJUalZt8RgJcm3Jo6UlDbXpoKQm2hGzNdVZpGQibqJyF8vHb0OhX
         OLBoQ1ZXdKSHv+vVQXJL+4ihO5ZckepQvqM5D0snHLsc+m/ctKY2sjkl8dJOQbssA/Va
         IY9S516DhgsAZ2f+7DAbr8Zz4qJIIK3PFt1i6Sr8+JZFvdNXHHaqm0rUsAmpKovGx+Wy
         q6Ns0kMToNcmKHD2e26NcDlgh2fIeFc/GamTDgNhx8D8EKpl6mO6xS+gkkMBSGB5kc/d
         nPeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284947; x=1715889747;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGN3dzX1Fg/8DMWBisk+V0BflWzMHd7DBmLWWSrLzcU=;
        b=GdxY/d+1/nZixbu72ckhBolMnmfCkghnfNgIZef0IrMGaGwNKz4oqRHOWljDzpdgrv
         W8rwdDsbwPYYTesSh3yMjyB50u6pVDnV2ii+/6ha3k06siu8SypZVoINtkupWFTLiqBS
         /pmQ34hHYoZy5kvWsBZqp2VM/MbxBFMSj5gdj2li0b46pTRkp5tePedtCnP04pfwDpMB
         sxptFkiR6+Jq6IbIAnNC5NQKKUoxPc3k5gznxZgYzDugVRBZmmAzuliIACsKYhGE+J2n
         JUcUV13KGPKu025GLbLDimhSBk1qeKIZuauxh9F7lUQtR6UfoBc5F3IkHYWfXGYX0wjb
         jmAg==
X-Forwarded-Encrypted: i=1; AJvYcCXMdtJ7kdHXcmMRSJoWE27bmq6egvWEpaGWxUVPKZZ5GwxM2jLOhiR9YrDTy54nYhNWTye1yGBxh3Xs6R6F1MJqdyAdH91AG14fSUm+K5Kn
X-Gm-Message-State: AOJu0YzRyoAH0c6DS1vHxhMn2Fsy+Q+IUDISrlmp28D4Wbr6VgTx5neS
	cwJR1v6eI8etEWZ+0TvdiE1AlL6iBiIZ2WYbvgt8/dDRxiZvfEcj1DY78LzBUiKcdxyUUJI0DzX
	Xzw==
X-Google-Smtp-Source: AGHT+IE13kb/DRTCsG66In5JbdvATNZ7UNmIfPfoP+M9Al27cmAukFzPSkQdhJiJAXpJTvsnAezDpKm1rN0=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:2da6:b0:6f4:47dd:5f41 with SMTP id
 d2e1a72fcca58-6f4e040fefamr9101b3a.6.1715284946869; Thu, 09 May 2024 13:02:26
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:27 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-36-edliaw@google.com>
Subject: [PATCH v3 35/68] selftests/move_mount_set_group: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Edward Liaw <edliaw@google.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210238_944008_E3E24274 
X-CRM114-Status: UNSURE (   8.43  )
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
 .../selftests/move_mount_set_group/move_mount_set_group_test.c   | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c b/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
index bcf51d785a37..bd975670f61d 100644
--- a/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
+++ b/tools/testing/selftests/move_mount_set_group/move_mount_set_group_test.c
@@ -1,5 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-#define _GNU_SOURCE
 #include <sched.h>
 #include <stdio.h>
 #include <errno.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
