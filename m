Return-Path: <SRS0=OP9P=YR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FCF9CA9EAF
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 07:21:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 118EC21872
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2019 07:21:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OKx6dliB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 118EC21872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Gq1rvwYq0S7dIlJbRummFFJ4OFi/DJvA2ZLEe7/lvcc=; b=OKx6dliB+VDTGh
	Q5S7pogJ3toemp6uNtjEd0F4g3vtinpELhxMrMAKMbq3HwkuPijMBHx1fjDr46xlBq6hypMqO2eb8
	7INDi0I/VoiXCvT5gGCGjgJwHVZ/33Bs254POXfnaAL8hrlv37AXpIrhwpN5seog80z5hGetHiky7
	A4EXdg3RJAYn4xRW3uGedcObgxXMzKsJwxqQ05DkbuyzHWgiGDtut1qzuCXTJhZAB7nESgTeQ3K5T
	Nf2BtVqsxAsFcw/xBZ7OUqomxRva77fsyY5V7iVaQdx00HAU5DKOkqNKdg70uLZopLRPEh0A9l9U+
	q1m33Zw/f0z7v5Xm8+3g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNXQy-0005qD-PZ; Thu, 24 Oct 2019 07:21:24 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNXQv-0005pR-MY
 for linux-riscv@lists.infradead.org; Thu, 24 Oct 2019 07:21:23 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 89B7791A5303F06AF5F6;
 Thu, 24 Oct 2019 15:21:12 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS409-HUB.china.huawei.com (10.3.19.209) with Microsoft SMTP Server id
 14.3.439.0; Thu, 24 Oct 2019 15:21:04 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH] riscv: only select serial sifive if TTY is enabled
Date: Thu, 24 Oct 2019 15:20:03 +0800
Message-ID: <20191024072003.87116-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191024_002121_928634_1896A848 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@sifive.com>,
 Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

There is some warning if TTY is not enabled, and lead to
build error, only select serial sifive if TTY enabled, and
this also makes randconfig happy.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/Kconfig.socs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 536c0ef4aee8..c1043799e194 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -2,8 +2,8 @@ menu "SoC selection"
 
 config SOC_SIFIVE
        bool "SiFive SoCs"
-       select SERIAL_SIFIVE
-       select SERIAL_SIFIVE_CONSOLE
+       select SERIAL_SIFIVE if TTY
+       select SERIAL_SIFIVE_CONSOLE if TTY
        select CLK_SIFIVE
        select CLK_SIFIVE_FU540_PRCI
        select SIFIVE_PLIC
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
