Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DF2C41513
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ttf6JdqbzbNBI855RPiWGNHit+P/Pl6mO1hUH3ZdhG4=; b=mmcUnlb+i5SX3nyrPYVsOQrM3z
	X4nnR4wh/jaM7fjDEF+yr8ibVUYdI1PXsSyJmUsxvFphTxLRHSgP0QCD5rzbRBdOYu/BsKCiSi2eY
	1mt8fN9P627AYlEVPDhgJXv4VyKeVvwO4i21Du5dXU6EaWEcy3NHB7iZYqkSAhqXw2bodRHdMRosi
	huIzt3xT15EuuxXA8t/l0HRHTRy+P1GvRBdnaFbWSPppHT1bBXrV/zye00/4TZDmV9xm+mBvWX4XI
	yz4BJB5bcoREnqLQNS00HZp2DbNQrVkcZEDqDO1YnC1zm8eOnEB2JX3Ih3Rt/g6wTCw3V+79rcFmA
	/J3SvEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B8G-00000002uG5-1kmu;
	Thu, 09 May 2024 21:16:52 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yQ-00000002c1o-2Zai
	for linux-riscv@bombadil.infradead.org;
	Thu, 09 May 2024 20:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ibFWC41ZV4jKFs0EDjRGi9eb9rYUWbe9LL5jTVHUEjs=; b=nRxbyEwd+o0G+ahgrUAwYL9K8/
	6MPhkUJ64POwgFbEdy0NDO3br1+YTYPYGAUUSwrXB50MN7hcgxPMgMy15gHQAM60EcYiZomA2LIAH
	AyQJbkLo/U/2vMQy/KahVCYBN81AT3PxizddsC1Bw+8qVK64vobN2mjg+eu87Uighao8+VM3uoh92
	4ZheBy1weQvP5SlfCDYIlTl+aA4jzJtLrr5gJNT3F4nSe5R/4ELlGDoJx3OaCAhcMK2SdzASWY7TE
	Zboe31dVSF+N7iR685bEEiu+iSoYKB94xJoIHFGYjTsF/9vfmqnEtqqO0sujaEyTsa+znqgSGX02w
	ZzlET82Q==;
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yN-00000001Jgv-07XG
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:37 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5ca5b61c841so1268047a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284944; x=1715889744; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ibFWC41ZV4jKFs0EDjRGi9eb9rYUWbe9LL5jTVHUEjs=;
        b=J4kvZyVmqY4dFnvX/avGJH8oV+NFoFkdHB4KRqrTnR+9MSCFCcPmRjvfplaqDOS3YZ
         ZNrnXN8pfNf5FbIg/jECR3jS3kdkvDFveOXGMUfLl0EhTBMb7VjCt/2N/snmoznI5VEV
         /mH8q7Z7zbHA/grSKN7AfByY3204j4sFbHbPyJRioKHR5u2AXc/hLC6pn0kT4kFK1e2/
         XWKyJbO5ZkMQZbpYIl/iXYZ00ijqAPy6aLbnJ5yD2QPADiU5oasbs6nU6W9bTxAzlvzK
         kvH6sDX5uNUEshly6SHPNv4IdxBvWjxrzfbWqF9rvMJXq083YqbiHBcd9/7TLVy8k62M
         ZORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284944; x=1715889744;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ibFWC41ZV4jKFs0EDjRGi9eb9rYUWbe9LL5jTVHUEjs=;
        b=af8eSOWIAyfKn70iaxP/foobG91yEMxPoyUKHTy8O5VN9HHHI/gitXJbkFFS3zwdd8
         ICd5He2UPZEegIv0UiO+5jXQ76qouc73GviXjLTaNu5ZkEqXkVPVkdPtyVT0gn9oQFXy
         C4rbpon88ivxVaX7mONDq0a0mflECzUrrNdkihktsBjZRU9U7ly9v2ZiBoSRz+QPHP8T
         bAP0RgJCUCbPRnXl5RF4lvoVXid8zblWrOrq2jhkIAUsY3eI8qpiZSY2ophiUW5s++Fc
         pEdfz7lBmnFFM4+NHi3Wp5n1YMfRzYcoRo8zWqPmcqu7JslvnHyyETtXhfBRswkSkKKd
         JsWw==
X-Forwarded-Encrypted: i=1; AJvYcCXzbaaY7lggdMRzUo7SBCAMkao59mVioijS30KvGve8Tf+nteGor+A8guSjgcn7MN50qojmeWxKYWd5IMoFcy8e1EbfgFCEIUgfmhjxZwmZ
X-Gm-Message-State: AOJu0YwkgXyinSJVN2WrgfZu4OLGqBWb494f4JGivKPoepzhYCIgSbQI
	/IGvNSh1w9NEZcFJjAvZNInaw0E2qxittHk8O3Lh5g1urhP1zrMkG6mw3h440SzITlvrZXvkdMq
	bCQ==
X-Google-Smtp-Source: AGHT+IEPkGuNPe4HIZuj85oVFOfPMLkPB6Cm4SK3VLdEwwtMiQwP0MRi57NnzjjqYrYIB2JiEx+9LJND0hk=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a17:902:e549:b0:1e5:e676:4b0d with SMTP id
 d9443c01a7336-1ef43f4b57cmr17425ad.9.1715284944391; Thu, 09 May 2024 13:02:24
 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:26 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-35-edliaw@google.com>
Subject: [PATCH v3 34/68] selftests/mount_setattr: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Seth Forshee <sforshee@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org, 
	John Hubbard <jhubbard@nvidia.com>, linux-fsdevel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_210235_086026_E4DBE830 
X-CRM114-Status: UNSURE (   8.37  )
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
 tools/testing/selftests/mount_setattr/mount_setattr_test.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mount_setattr/mount_setattr_test.c b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
index c6a8c732b802..d894417134b6 100644
--- a/tools/testing/selftests/mount_setattr/mount_setattr_test.c
+++ b/tools/testing/selftests/mount_setattr/mount_setattr_test.c
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
