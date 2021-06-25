Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DC1C2B9F4
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 10:20:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 497B461439
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 10:20:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 497B461439
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0/GJLh3P9jlnCAUc/jmMnXmy/s3Sl76B+Gb7OE/E5to=; b=ZsmM4mRPBn8k4S
	bCAw6mtF1Dk/DfZEvn1P4xG2yCfjkZfdFYl9RIQPItvkW0IZtFZMYLmfNRsjqlg/7kBg52r7vtx3q
	ukH63znLNISecVXU/UfxUYxA2wrmgup9hh67WubkowiQPXvbiOvbPGzjdIhfnVFInG1SmRYVLlroH
	MBunHUiu315IjFCuBHQFKZoSFp2eKgyz0sZ6oFvVeCCkF+3fKdIBMBH7Qc56BjqDYvLZkLWLMql8S
	9cBtiMQV+6avVOMsj6u22FPrnfLo+d9/I1SjghMigrL2c5qFQamUV9yJN8fCEEoDVub/Xlg/oS+96
	v9nyWTWHpPK29uPukvIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwiwI-000uwJ-Tx; Fri, 25 Jun 2021 10:19:58 +0000
Received: from out30-56.freemail.mail.aliyun.com ([115.124.30.56])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwi8j-000etz-JX
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 09:28:47 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R511e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04420;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=6; SR=0;
 TI=SMTPD_---0UdcBifd_1624613309; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UdcBifd_1624613309) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 25 Jun 2021 17:28:39 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] riscv: xip: Fix duplicate included asm/pgtable.h
Date: Fri, 25 Jun 2021 17:28:24 +0800
Message-Id: <1624613304-119429-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_022845_879969_37BF6331 
X-CRM114-Status: UNSURE (   6.23  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Clean up the following includecheck warning:

./arch/riscv/kernel/vmlinux-xip.lds.S: asm/pgtable.h is included more
than once.

No functional change.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 arch/riscv/kernel/vmlinux-xip.lds.S | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index a3ff09c..af776555 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -12,7 +12,6 @@
 
 #include <asm/vmlinux.lds.h>
 #include <asm/page.h>
-#include <asm/pgtable.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
 
-- 
1.8.3.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
