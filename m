Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CDEC25B77
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=F/Gj05fpOpEM35ipvPIbIptTpsIxpQMntVrwMNPn10I=; b=lbW2b2yZw1tIZU0ZrvQ0VgyHPf
	Bwc+OZ7XQOZ/O13KkYDxR9yGUwILGvfuul6/5W0Bsj+dL07DKpshhmBH7OBu/IqK3H+zhNKdE9vZ3
	0cLlX4btNYT97r+ohHd5ruYojBHPz3hgupexydo7ZWShfa0xJndwM/jij648e1Y4ghAfERhBCQY6K
	iwIWinodohHwee+W3amZwQLeHh3DJFiuv2kdfHMZjgbzhi4iQrgLo2hZ54VHVKcmS0N8LWyOaikdn
	CfXj2OwDZmFXdWrWEU9UroPTCURb9qgszBE1l2rL/IsNoNGg6GTkgxMCxhPvBylGnQzlVFqdvzIH8
	mt0SfY3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5B84-00000002u71-28WR;
	Thu, 09 May 2024 21:16:40 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59xa-00000002bIn-1nW1
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:01:56 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-de604d35ec0so2136360276.3
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284902; x=1715889702; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WlZHqG8GOWNVngCs0QnGJEkofrx6wgIMd4fjiXkUQc8=;
        b=B9ayQxR1bHsqNEmtBrhxz/dKfllQedCVaUGCsMhfG/glatO5CXAzSPWxnqnRDmaPJj
         OJ2GG/HP1/RAb6FPkmBkIQrp+JcNoy8yAiOzsrGjZU8FyfxFoftw5pSRDmas6TOFcwEw
         vikmdqY28zY+uv+fOB9aP2l9sclXmMfbZPBSkYlimOsWGvoW0K30nH84JW/UEFCkBSWR
         L4xJ+DT205C5A5WdpLDzWKH6ASop3FXAfVCh9YM9vkNDO1a7/yy3+wK+m5gz+1ylmAP9
         NseQLw3JGK6ZJJvwiYyL3Z9Ws6/z52ZIGfUnUWmgF5HvuvA+fckKYEXlMZdGy7uhxwyi
         Q6jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284902; x=1715889702;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlZHqG8GOWNVngCs0QnGJEkofrx6wgIMd4fjiXkUQc8=;
        b=LoEWIjWEUNvjNvLGWzjrqJ23U7qz1QjsnJfFkMAP+qhmqR3LK95k5ZKsrpeaoopBwr
         lCZiF8HS5iPS9/qLpgb/+LC6JG6UtkNEZVK6uhSYbRlZ/jjoQz2Vgl+oIbCJ9aQakClk
         myzlOcvw7v8OOMcHn8NWAIahxJFggh3ONhr7WcY2ZVwWWdbBpTKnbld6Auc/SouhcELP
         TA0WIjsRA3J99LtioYx3c+ybiUN6ZhrDDI5XgftHZiHmxUDhjYfVZTI+jx6KMjX2KVdz
         shsRCVBxwV+3LGUr7lzj8vL4Uzq93sLXjId3h1bNo5Eucg7XPsgjxZRvPeBYNDTcuzyc
         Xakg==
X-Forwarded-Encrypted: i=1; AJvYcCV98CH/tgirDVfFJQAfweYBHhT4+NRIA0JBPyxGhf3PP9/thhGNCPDUls/HxXnAWRLwFHuILiKILNFhA9uYPO2PjoUueIWKlL/GvhQnprPg
X-Gm-Message-State: AOJu0YygxrS5ToNhCmXf+J80pbndxKLlHxevpAVKg+KniKYJyQf9flQc
	f3QZSDDey6lnyageBruh82WUvuQ2b0icqu3yBVXaQg+SaY5Awt77hF2Kp7b5OCAYkyDHAIs2L43
	1vg==
X-Google-Smtp-Source: AGHT+IHyuWY5940dXI+8MYdK3cHUYO5oPq33T22zpT2ioJu3FvZMtTFAIbDVKX9sxGXi1YbC+ZrN2B4TRNI=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a5b:182:0:b0:de5:4ed6:d3f3 with SMTP id
 3f1490d57ef6-dee4f2e03c0mr141982276.6.1715284901753; Thu, 09 May 2024
 13:01:41 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:11 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-20-edliaw@google.com>
Subject: [PATCH v3 19/68] selftests/firmware: Drop define _GNU_SOURCE
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
X-CRM114-CacheID: sfid-20240509_130146_741187_7FCBF2A0 
X-CRM114-Status: GOOD (  11.24  )
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
 tools/testing/selftests/firmware/fw_namespace.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/firmware/fw_namespace.c b/tools/testing/selftests/firmware/fw_namespace.c
index 04757dc7e546..c16c185753ad 100644
--- a/tools/testing/selftests/firmware/fw_namespace.c
+++ b/tools/testing/selftests/firmware/fw_namespace.c
@@ -2,7 +2,6 @@
 /* Test triggering of loading of firmware from different mount
  * namespaces. Expect firmware to be always loaded from the mount
  * namespace of PID 1. */
-#define _GNU_SOURCE
 #include <errno.h>
 #include <fcntl.h>
 #include <sched.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
