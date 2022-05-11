Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA6AC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 11:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6MJrW2wXrTZs7qFun7NZnutabeBxGk8iaOVk7Uz+ThE=; b=38YqozSpivLdc5
	7+gLdHs8Tlw/F4QdCB0pWnHVd2LH9HAL9+yY1b0Zy+7K4J5X7KM12FKumBX65v3hPx5g6YSni++WB
	iC82HdEt4srtbdC73D6w9dHSRrRkxHBC+x4f/4tWLYEG4BSWXQDmtCLGfstSkBikEU44rSBzQmGWA
	84iqSBghHirow5NhsWD+g/WOewrYRNyyT0tzydQ2p/aP4WFgJshkygm05uSV1iv2xHoAVZ++nZtSO
	u6PAVNCcECL6iS/8+tatY0fAdztBSejjoQfu1DOUywtM4wjk92R6WpQzvJM22LYb1DY9NyGJBvd1D
	Jdl3nd0udZ8HmyOf6nBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nokS8-006UU5-Qi; Wed, 11 May 2022 11:24:24 +0000
Received: from out30-43.freemail.mail.aliyun.com ([115.124.30.43])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nokS5-006UT9-Lw
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 11:24:23 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R331e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=xianting.tian@linux.alibaba.com; NM=1; PH=DS; RN=19; SR=0;
 TI=SMTPD_---0VCvu-9A_1652268255; 
Received: from localhost(mailfrom:xianting.tian@linux.alibaba.com
 fp:SMTPD_---0VCvu-9A_1652268255) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 11 May 2022 19:24:16 +0800
From: Xianting Tian <xianting.tian@linux.alibaba.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 akpm@linux-foundation.org, anup@brainfault.org, wangkefeng.wang@huawei.com,
 rppt@kernel.org, alex@ghiti.fr, twd2.me@gmail.com, david@redhat.com,
 seanjc@google.com, petr.pavlu@suse.com, atishp@rivosinc.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 guoren@kernel.org, jianghuaming.jhm@alibaba-inc.com,
 Xianting Tian <xianting.tian@linux.alibaba.com>,
 Nick Kossifidis <mick@ics.forth.gr>
Subject: [PATCH] RISC-V: Remove IORESOURCE_BUSY flag for no-map reserved memory
Date: Wed, 11 May 2022 19:24:13 +0800
Message-Id: <20220511112413.559734-1-xianting.tian@linux.alibaba.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_042421_908654_AEFEF6AF 
X-CRM114-Status: UNSURE (   8.74  )
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

Commit 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
added IORESOURCE_BUSY flag for no-map reserved memory, this casued
devm_ioremap_resource() failed for the no-map reserved memory in subsequent
operations of related driver, so remove the IORESOURCE_BUSY flag.

The code to reproduce the issue,
dts:
	mem0: memory@a0000000 {
                reg = <0x0 0xa0000000 0 0x1000000>;
                no-map;
        };

	&test {
		status = "okay";
		memory-region = <&mem0>;
	};

code:
	np = of_parse_phandle(pdev->dev.of_node, "memory-region", 0);
	ret = of_address_to_resource(np, 0, &r);
	base = devm_ioremap_resource(&pdev->dev, &r);
	// base = -EBUSY

Fixes: 00ab027a3b82 ("RISC-V: Add kernel image sections to the resource tree")
Reported-by: Huaming Jiang <jianghuaming.jhm@alibaba-inc.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
CC: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Xianting Tian <xianting.tian@linux.alibaba.com>
---
 arch/riscv/kernel/setup.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 834eb652a7b9..71f2966b1474 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -214,7 +214,7 @@ static void __init init_resources(void)
 
 		if (unlikely(memblock_is_nomap(region))) {
 			res->name = "Reserved";
-			res->flags = IORESOURCE_MEM | IORESOURCE_BUSY;
+			res->flags = IORESOURCE_MEM;
 		} else {
 			res->name = "System RAM";
 			res->flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
