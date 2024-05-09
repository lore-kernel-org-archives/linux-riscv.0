Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90280C10F1A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 20:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XUf8UCv8hoTaXK7CdI9w84d0R8FaYheGcmEFuitgr5M=; b=Dq7N+Y/qtMNBU9C6AqoQv9QoLJ
	iu7SQs0M+qVu16kApXISGO7EsGWHeVeyqHuQ0/Ewb5krnF2DKNWzYlZRu6ZlQyRlH6QZzQLbdZUud
	fRw04CLjiHReQVUmsZa1LkxwDm1Tnba8YR0wM9+qchVpo1B7LcHWpJFLuLSytCSEJgfKxo4a6x+LV
	ecjRSUfKd+RicECYzLezlO3iaU/iwV9zYMjX01ccjeI7K2qYVr8IGejAPfrgSuNnFc1iO+5Vgr4I6
	VpoW6gyeHxACGqExrVdWbNUOziXVcTs/VznMO7qmm4HKv+gmc6JiTy9stmHrvOY2z8fwcNGPXDOo+
	DEwyoenA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5A1i-00000002eTb-2SXP;
	Thu, 09 May 2024 20:06:02 +0000
Received: from mail-yb1-f201.google.com ([209.85.219.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59zg-00000002cy7-2YKQ
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:04:04 +0000
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-de59d580f61so2048293276.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715285032; x=1715889832; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Da34EKHnCK9seOvE3VE8u71Ty/vHaksZJ1GNDYeo1pk=;
        b=LkDGyUTScXJm0Ryx4GFQ1wXagVC+NwfWzGbOsYHR5v9rjMgvfZwCX26f8sjqLA8e9q
         Y/7xi+820wMTYIUezlQVTXxv5SKpBSoixDVX19Rf+pTf5Lm/AKcdJolzdb9BldVQbx3U
         5HeCveAtzScyhtMcBjZurr5CE/NPO76OI2N7SEq9L6VJwwAh4iv6AtIQtISTmcDZk8kP
         4rnIdQKbJuq18gb+9+lqHxMUUgOKSp8u3kD/lpGWNJaBqYj1AAEPBRi6xPAxVSWm2pU9
         37O8c8nZY/5I5zfnUovK1zQq3VKvAnK4f2KwoohT+/RU0wcn/UDeMobCiPaU4PKRih8S
         QqAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715285032; x=1715889832;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Da34EKHnCK9seOvE3VE8u71Ty/vHaksZJ1GNDYeo1pk=;
        b=f+Jk6KmOJvKVhoML/g6SVRl9sAemVBDgHB9VluTgIK8V6eD6bRo8rmBxAI0TFq+L+P
         PAHlqE7T+6e2H6mbk+ATFjESnTWBkd60CnyRxVRWQYXI8B6qxpnCVstcI4Ofejq+yXDO
         y0oolekA6iKPlHBn56ogdEO9F04a2TqPZLXFKpo/IBWuCGtQ879DG+BTIDtKgtKlaLSM
         ywuAUejy9Zewv8OsRO+yWQatP4ZfOXPydPcr/8NwuLjnSS5LaSn9TBRLtgOQ4s1yVODH
         t2DwxReOpBFWnNYiFvJmcuBzhJk5XIBT/7IsrojSvtUjBEpx6kPZtyNNR1EVfU9xYFU9
         XhTg==
X-Forwarded-Encrypted: i=1; AJvYcCWpwRP7YRiqkduzgz6GldzVE1RkcQkPvO2wfHJJFvlNdXIJjwFz7aN4+W4vX27nFcqn1O4XjkBEQF2sGdJDOwSsW9Mft5Vh+1YAxcIYC9Mi
X-Gm-Message-State: AOJu0YybLphVr79Kc0DOzbBt4cPQx/YY/7JMSLmmIQaBmkNCmpsxPnTB
	ijCK3FKT4YqF4nUIKdsTBTZmhSIPc+gMYGc0fq8+TdsjvOURAt9+cWF/0fKjVv98j7ENIzAzeZP
	xrg==
X-Google-Smtp-Source: AGHT+IEcrTSWOKSKP/8y5gSbqy8Cg7jq9XxevNNU1pb6k757xhbvcE9eORBsQpvoCyyV8uYdVeGH/q8F0hU=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6902:1081:b0:de5:53a9:384a with SMTP id
 3f1490d57ef6-dee4f53a18emr149007276.13.1715285032313; Thu, 09 May 2024
 13:03:52 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:56 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-65-edliaw@google.com>
Subject: [PATCH v3 64/68] selftests/uevent: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, Edward Liaw <edliaw@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130357_097335_8EA89927 
X-CRM114-Status: UNSURE (   9.75  )
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
Signed-off-by: Edward Liaw <edliaw@google.com>
---
 tools/testing/selftests/uevent/uevent_filtering.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/tools/testing/selftests/uevent/uevent_filtering.c b/tools/testing/selftests/uevent/uevent_filtering.c
index dbe55f3a66f4..e308eaf3fc37 100644
--- a/tools/testing/selftests/uevent/uevent_filtering.c
+++ b/tools/testing/selftests/uevent/uevent_filtering.c
@@ -1,6 +1,4 @@
 // SPDX-License-Identifier: GPL-2.0
-
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <linux/netlink.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
