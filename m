Return-Path: <SRS0=hJrJ=GY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26D56C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 06:34:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96948238EE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jan 2021 06:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96948238EE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=E1FD4EeeutzYyvjH5X5aUgG0KjdGQTxxpw00QZ7Ivbg=; b=qiYRNdIiS/f6ewORbvXU2rxpUT
	sbEUjfisaFFoVPO3w1gfgpmbNMKyHZ279qaarqscqQqd9mYu3ZMgRSMpcK866ohctNsTiA3pGbyG6
	H3XYXgSjG7iz32PYh3TcPcEYRzNL/q5jU1VxunwFck07Naq4uv3MttZzc7nTYNivZlXd+gNvhtJ39
	F7MdjDbgY+Lsq/rGg9x2fTdPsGDPqhCINp/V36A9+lJBL4dpue4xh/chFx/SWbNwqrSJpUyqCDCx0
	fOQH/cPN+CHsmMhMBDELu6CGzt+Nv5sRY8ZT30Eg8RO8CcahjT612CTY4rBvOneLj4AjJ6dQawEBr
	OlZ6Kp9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2TXU-0003bB-0D; Thu, 21 Jan 2021 06:33:52 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2TXR-0003aj-Gk
 for linux-riscv@lists.infradead.org; Thu, 21 Jan 2021 06:33:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 58E8B23877;
 Thu, 21 Jan 2021 06:33:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611210827;
 bh=vNGgsCI7zczqFpYu62xY9dECe4uIHd42I4++YfliMGQ=;
 h=From:To:Cc:Subject:Date:From;
 b=lYPstG6yWvcqvw1L89t8VLSnNfPErBePn0/+oaJeYs2MP2aBXLIAwVHy94YzOVraY
 l1IM1Ggn8xz81CcOd626yhT39Qdz7hzW3kdWATV61MAmCP6C6eQrpE1NXWi/hOoIBf
 OafSm/rXboaDvv+pmh10LIqhBplbbaY41We7SgQGDFjsmozptEKu9/zAFv0B+R2gTC
 31KY9ioYC7bvuLgCt4Hxi1u2sCh79dG27qpdcQcUIbnqClC+7cFJPeagSKra+VebmW
 RxbbOdyF8I4g+0rrSRidmVO1Zg5DYbxZXQVsefGEHvyIF45iWc4ivSHwpr1PJ6w6kZ
 GpaHJbNAwq6cw==
From: guoren@kernel.org
To: palmerdabbelt@google.com
Subject: [PATCH] riscv: Fixup pfn_valid error with wrong max_mapnr
Date: Thu, 21 Jan 2021 14:31:17 +0800
Message-Id: <20210121063117.3164494-1-guoren@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210121_013349_634235_BB15137C 
X-CRM114-Status: UNSURE (   9.20  )
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
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

The max_mapnr is the number of PFNs, not absolute PFN offset.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/mm/init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index bf5379135e39..1576ee9e5e94 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -184,7 +184,7 @@ void __init setup_bootmem(void)
 	max_pfn = PFN_DOWN(memblock_end_of_DRAM());
 	max_low_pfn = max_pfn;
 	dma32_phys_limit = min(4UL * SZ_1G, (unsigned long)PFN_PHYS(max_low_pfn));
-	set_max_mapnr(max_low_pfn);
+	set_max_mapnr(max_low_pfn - ARCH_PFN_OFFSET);
 
 #ifdef CONFIG_BLK_DEV_INITRD
 	setup_initrd();
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
