Return-Path: <SRS0=uc63=OT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5E99C04EB8
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 06:25:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ABD2205C9
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 10 Dec 2018 06:25:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q+zZKVDN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ABD2205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=upmem.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YY02ZCsuELVflL3MwMu/HJMZt7rSkF05YcjJvjy90nE=; b=q+zZKVDNiDWXqTmg/0zDQIxq4c
	ZYGcznH7qALu5PTX21FjCM7I2UAi16hpzvfLH+29Qu8B6djx09EsvmVUauPgNKbJ5iJy9cAV0CSwm
	Dbe/BJmUVDNTAjOKw9dtuH8Jr0YcZtShEooXXK2imlgDVPs0cdE+jj/nQFP+8JBuUCs6lQ05hg+0H
	Ac0IptBymmwkYOCo1QYeMj757l9BfoNsLK98YN5D7p3DcH/uWMDWMHHMOC8gxTWahsh5sKBkUFqST
	SX5LIatJa8/LUBR3ytBrx2q2Urc73bVpWL2RF1O6x58B4gCOvijKJKbgcF274BP+4xL8kD3QHMG7q
	7CjDScuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gWF0W-0004dC-Hp; Mon, 10 Dec 2018 06:25:32 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gWF0T-0004cX-QT
 for linux-riscv@lists.infradead.org; Mon, 10 Dec 2018 06:25:31 +0000
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 644B160004;
 Mon, 10 Dec 2018 06:25:06 +0000 (UTC)
From: Alexandre Ghiti <aghiti@upmem.com>
To: palmer@sifive.com
Subject: [PATCH 3/3] riscv: Adjust mmap base address at a third of task size
Date: Mon, 10 Dec 2018 06:21:46 +0000
Message-Id: <20181210062146.24951-4-aghiti@upmem.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20181210062146.24951-1-aghiti@upmem.com>
References: <20181210062146.24951-1-aghiti@upmem.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181209_222529_996928_E38B4BF9 
X-CRM114-Status: UNSURE (   8.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, catalin.marinas@arm.com, ndesaulniers@google.com,
 linux-riscv@lists.infradead.org, Alexandre Ghiti <aghiti@upmem.com>,
 atish.patra@wdc.com, akpm@linux-foundation.org, mingo@kernel.org,
 mike.kravetz@oracle.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This ratio is the most used among all other architectures and make
icache_hygiene libhugetlbfs test pass: this test mmap lots of
hugepages whose addresses, without this patch, reach the end of
the process user address space.

Signed-off-by: Alexandre Ghiti <aghiti@upmem.com>
---
 arch/riscv/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0531f49af5c3..ce70bceb8872 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -22,7 +22,7 @@
  * This decides where the kernel will search for a free chunk of vm
  * space during mmap's.
  */
-#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE >> 1)
+#define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE / 3)
 
 #define STACK_TOP		TASK_SIZE
 #define STACK_TOP_MAX		STACK_TOP
-- 
2.16.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
