Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A831C25B7B
	for <linux-riscv@archiver.kernel.org>; Thu,  9 May 2024 22:31:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XVqhrqIuHSHO60Rl1v0lGTnieVORFBhB/bidtcaBoB0=; b=tj7IuSTpHcmF/jtcV5uiCpgOtC
	R8gBt6pOzpZqPo5+xbQ7Kdom4vwGv+Zdo5Jg9QJSOb4oR4LgTI1Idm+lwWppIJvJyymn9AnfB+xtY
	kEJdG1U0Nb7LDyQO7I9J6AGRHFf+wjCq/gdpiyIfvsYbYyHCwvWwWU7qF3/GmyrOjJNkjbvQbt78J
	CV770InH+13GglXraMGYPiNbTbHVRvSJICEvs30ByC0zUMrHY3WgFUxAY3mAEryiQBDExEBIiMd1B
	eymyDLm5cVhtIt0mQTSLgZrCsKrcI5a9Y1kgEy1yLG1wsv7VA1HIrFQZzBct2Vf8IIyS5dd9ZaPug
	yXZgbhHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5CIe-000000036FP-2whs;
	Thu, 09 May 2024 22:31:40 +0000
Received: from mail-pf1-f201.google.com ([209.85.210.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s59yL-00000002bwX-1JJ0
	for linux-riscv@lists.infradead.org;
	Thu, 09 May 2024 20:02:51 +0000
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-6efefc57621so784437b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 May 2024 13:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1715284949; x=1715889749; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=T4z9tRmkFYCcw5oob96Va/ErGYfm0S2CmMdMe4FBR7I=;
        b=pMRoh/f6y1hDzbg/JB6ApmL1XHaeyGuYNc/v2Ti9XMGmUKHvq9Bk8iFcZufd4ZV2EK
         menOwvZSorJYtBR3gS8OrVo6OhCy/nblBmn4Wp4ImNBz6BWqj1jMZkskVzUEMIICtjhY
         e3GIc1Wy5rNgnsqoMUmXYfg5PoCzW7k7hQX74OsNLvdmV5kFpaFLT9wDq2EbS4ytwNTD
         JW0uNyCkT/9GEPPYLRzYzEKIpfVQGPOoJ5nHJ1K/Lk3pJvKRVpTyjNc3C07pLqlx6cow
         WZ/I1QJqxnbZNuoPapNQBOKR+n8ZHCh2uVEvj3Vaby1VybKLAuAG8Z4khjSvzqYTXSLM
         PBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715284949; x=1715889749;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T4z9tRmkFYCcw5oob96Va/ErGYfm0S2CmMdMe4FBR7I=;
        b=sY+9WF9wa/6x/KqaQ44i7tIiU4Eh9698SDijUIS36MOcnDHGChOY2GJRhVYXKYHH5F
         tNCpqQuXzSXsrZxnqQML0PsrRUcEhG2XBatnIAH595ruI8w6tU3Q8JWh2FYi3IrinQHF
         8Lnzl4WvxCTtcX9aqYsltSAeqFScIlDCjWBaYmurGcGr8ksknP7OgIqsxdBDYNnwE8oD
         mRMrkOznvvAwykytQrwrLPZBtbHX1lDn7Ys3szVow9hek8MDdb5L67y0SJN9aiLtfNxk
         UpWR3TFwg7ow8mJpk1Xjlui90BuIIwXg48fUyjJCBiDSPu0tnrb9SJppVaAh58r2JpUZ
         /Wzg==
X-Forwarded-Encrypted: i=1; AJvYcCW/y8hIpAURY5HD6fPSJPS9X14Kvke++2HCIN9cBI3YwCZhp1VjF0N3/48cSQCNxodI4rr7rw2QOOvApqBY8Ab1ZAbPQVrDQgoB8zy5uZ0c
X-Gm-Message-State: AOJu0Yw9rctsPKtxcJ/LW46+/yFMgg3jII09jEncJdmeCQ8XSQ456n57
	KiTdIv6ZzBIOZzZZniiw0taVyvNK3MxiB0+Y+XhIKb3UUlFobKFg6jk7nBQ8jTAHDPi3O5jc+Ks
	v0Q==
X-Google-Smtp-Source: AGHT+IGF4qz3epyZCqVd8sIgyp87fgIn9moU6vLMHysn53aGUxAkCsTmzzKAv9A4azIh93bvW+KCzfUowb8=
X-Received: from edliaw.c.googlers.com ([fda3:e722:ac3:cc00:24:72f4:c0a8:305d])
 (user=edliaw job=sendgmr) by 2002:a05:6a00:178a:b0:6f4:9fc8:8cb0 with SMTP id
 d2e1a72fcca58-6f4e037e983mr23426b3a.5.1715284949238; Thu, 09 May 2024
 13:02:29 -0700 (PDT)
Date: Thu,  9 May 2024 19:58:28 +0000
In-Reply-To: <20240509200022.253089-1-edliaw@google.com>
Mime-Version: 1.0
References: <20240509200022.253089-1-edliaw@google.com>
X-Mailer: git-send-email 2.45.0.118.g7fe29c98d7-goog
Message-ID: <20240509200022.253089-37-edliaw@google.com>
Subject: [PATCH v3 36/68] selftests/mqueue: Drop define _GNU_SOURCE
From: Edward Liaw <edliaw@google.com>
To: shuah@kernel.org, "=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?=" <mic@digikod.net>, 
	"=?UTF-8?q?G=C3=BCnther=20Noack?=" <gnoack@google.com>, Christian Brauner <brauner@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, John Fastabend <john.fastabend@gmail.com>, 
	Edward Liaw <edliaw@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kernel-team@android.com, linux-security-module@vger.kernel.org, 
	netdev@vger.kernel.org, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_130233_829622_191B0F45 
X-CRM114-Status: GOOD (  10.09  )
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
 tools/testing/selftests/mqueue/mq_perf_tests.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/tools/testing/selftests/mqueue/mq_perf_tests.c b/tools/testing/selftests/mqueue/mq_perf_tests.c
index fb898850867c..43630ee0b63d 100644
--- a/tools/testing/selftests/mqueue/mq_perf_tests.c
+++ b/tools/testing/selftests/mqueue/mq_perf_tests.c
@@ -20,7 +20,6 @@
  *   performance.
  *
  */
-#define _GNU_SOURCE
 #include <stdio.h>
 #include <stdlib.h>
 #include <unistd.h>
-- 
2.45.0.118.g7fe29c98d7-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
