Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBE06E77197
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 02:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zy65PhwbKqqGeIgZg9aV9j6bC12sGr8MqkOZh0rFUVU=; b=XTvZBLsUrkv9NZ
	a9fPGQzTxnOfx0K9KBhUbD7NYtdMrO3BHQWNxVH4JH6I3Ts0Agw/9+96Ym+pGl6T8wrkZ67eACuIR
	f9OC0PH8OlxHiKUy2kHK+wWd4SMMjf9iigZ7o/D+qbKt5KTlvCjawzjjcZ26CjVa+H0BJDQlx0XFZ
	TTM4NvxfteUq40hRjLX1Rkpc4MhZvaVO5VQhZy8dKb3rkBpa98qkV1cDHD6RpdMt84dmcktAyE6BE
	zxCl7AZbZ/4LMxqTyxjPkgua2N9MYqB4Hq+nQ5cFy0O0b+6luQOD4z6BWzo79ocAWRxy+Odz9mkh/
	1sI2iGKWFJOrkoFQggoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLQa-00000006oHq-0QVk;
	Wed, 08 Jan 2025 02:04:12 +0000
Received: from out30-119.freemail.mail.aliyun.com ([115.124.30.119])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVLQX-00000006oHK-0wwj
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 02:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1736301844; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=jkbhlsZBTgwdfhhDyY2mVNdz7Ru2qqcr0zjKFyRhbdM=;
	b=Pp1HLgwD7Y9q3yaI4k6IlPyD2dVgzNaZSy7OYXBVCmoRVmPiWAdoVXm8+uxTYsS8LkfZ3UZ9IP/7YgEj0g6h3hclHPh/I7Y1Qo+e0zN1DbyGPGks0ihrkAdfPnebUVTad3iObw8ipxkJQAe4xIsXFnYYL0oIury7GwjhEn2sOhA=
Received: from localhost.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WNC7t7x_1736301833 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 08 Jan 2025 10:04:02 +0800
From: cp0613@linux.alibaba.com
To: corbet@lwn.net,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] Documentation: riscv: Remove KPROBES_ON_FTRACE
Date: Wed,  8 Jan 2025 10:03:42 +0800
Message-ID: <20250108020342.4172-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_180409_464357_410C4406 
X-CRM114-Status: UNSURE (   7.22  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

Since commit 7caa9765465f60 ("ftrace: riscv: move from REGS to ARGS"),
kprobe on ftrace is not supported by riscv.

And commit 3308172276db5d ("trace: riscv: Remove deprecated kprobe on
ftrace support") removed the relevant code, but left out the
documentation, so fix that.

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 Documentation/features/debug/kprobes-on-ftrace/arch-support.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
index 02febc883..d937b7a03 100644
--- a/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
+++ b/Documentation/features/debug/kprobes-on-ftrace/arch-support.txt
@@ -20,7 +20,7 @@
     |    openrisc: | TODO |
     |      parisc: |  ok  |
     |     powerpc: |  ok  |
-    |       riscv: |  ok  |
+    |       riscv: | TODO |
     |        s390: |  ok  |
     |          sh: | TODO |
     |       sparc: | TODO |
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
