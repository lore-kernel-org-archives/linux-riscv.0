Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A2D6CDB46F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jun 2026 14:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=57nNklpRyMCbJTMB3hKQEBjvXcAHnYqq+nmPmu9GLjE=; b=CNSBixczjcrHVa
	Mz4DZ+rjJ/vXzprOkH/zVGY8wr3FXGJPTFdbDKGJksxb1cE2QASIQHypX8Jlm+F8XeuvCIOmWvpRt
	ArecFNGAX/vP/3S3MGo9pXZ3da90x53UQv3DnNoovkl+zuKuHZzm/AnQxG4NjZBQ1htdytiwkSzyw
	KyaY/tmi6pyuMGPwYQk1nsBjx+R/UnZSJJTfqrTKNGvXyhkrSy3UY5RLF0Vk2XkD7cFh69TW3AoQv
	LfoNJlcy7wmXQkJOEMsDsWAMgazl16sE6gFybCn1fOYmR4E3xfBivMIRKEVfwBRlXbxzy5ln4iZbY
	dl3hketVL+/TQz3SHqag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfR6-000000053Tn-4A4D;
	Mon, 22 Jun 2026 14:15:41 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbfR2-000000053Sk-3tDn
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jun 2026 14:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap5-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=C39aNqUfckICrRYUCJ32OG2byxRISEpkNLemt876ss4=; b=X0tKilYS6zomJR
	E3hkyJNf1I7llPV05Z9be2Ar/qM5UDYXqtGqrKVaCKuX26RUyFnAwf3pGaOxDr0NWy7JPUgY2kRwv
	MlxpOg45gk/N0b421jCN9MBle5Mer68Yc3V441CHMRgGzgLpeZByzgoX2AMges3WUImm2HViocHh9
	bKiBBgRuMTI8uDhb70sF3qYaNgcWeSy/p+vzOqL26NR3l4fFI2epCTzwxWkAXDTYoCho6sBJRkQzs
	RC0AoGv6UghP5lxXDhZChU90yTC49XR2vOd9aRoA07YhKbo8ylSIM4u+lm3CgarkK/reFl4kt/PO2
	ypGCu/GSLeekZ5sb7/Eg==;
Received: from [167.98.27.226] (helo=rainbowdash)
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wbf7h-0053ms-Ak; Mon, 22 Jun 2026 14:55:37 +0100
Received: from ben by rainbowdash with local (Exim 4.99.4)
	(envelope-from <ben@rainbowdash>)
	id 1wbf7g-000000021Gt-3fYo;
	Mon, 22 Jun 2026 14:55:36 +0100
From: Ben Dooks <ben.dooks@codethink.co.uk>
To: linux-raid@vger.kernel.org,
	Song Liu <song@kernel.org>,
	Yu Kuai <yukuai@fygo.io>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>
Subject: [PATCH] raid6: fix raid6_recov_rvv symbol undeclared warning
Date: Mon, 22 Jun 2026 14:55:35 +0100
Message-Id: <20260622135535.481534-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.37.2.352.g3c44437643
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_071537_215924_9C05C20F 
X-CRM114-Status: UNSURE (   8.52  )
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

The riscv recov_rvv.c should have included pq_arch.h for
the definition of raid6_recov_rvv. Add the include to
fix the following sparse warning:

lib/raid/raid6/riscv/recov_rvv.c:218:32: warning: symbol 'raid6_recov_rvv' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
 lib/raid/raid6/riscv/recov_rvv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/lib/raid/raid6/riscv/recov_rvv.c b/lib/raid/raid6/riscv/recov_rvv.c
index 2305940276dd..78e158a3e332 100644
--- a/lib/raid/raid6/riscv/recov_rvv.c
+++ b/lib/raid/raid6/riscv/recov_rvv.c
@@ -8,6 +8,7 @@
 #include <linux/raid/pq.h>
 #include "algos.h"
 #include "rvv.h"
+#include "pq_arch.h"
 
 static void __raid6_2data_recov_rvv(int bytes, u8 *p, u8 *q, u8 *dp,
 				    u8 *dq, const u8 *pbmul,
-- 
2.37.2.352.g3c44437643


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
