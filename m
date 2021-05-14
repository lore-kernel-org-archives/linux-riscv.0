Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3983C433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:39:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B820F61407
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 09:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B820F61407
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/xRDUXpuoqpTPzmrh0lhHd/EXqWg/WxQmXe4DCJ5ZSw=; b=rdZxBqEG6zGaRhBRO6Md0/rxRh
	Fj2vn9NHvSEj6Qkoax6fZkg7J63aM33kVkHAakiqlxpV6A3NPDmJmy1VcLqKu8MTp0kU4L9s1Q86m
	cR9PMfC8sLO9AO0QtO1a6du2ukQYto4x60dH+TzaeydKaG7lWHvSuoXFLJAzO2Z+w1S9L8aBA+guS
	Bji6Dmn/IZGoKNOvDRyIaYK6Ie+n5ZJ0qrtphhVx0IJO9A9GHhN0dntkzBD/MRXZ5HEomvQPvQhAj
	+3xtD+A9knqCbdoVKF93mR0UAGLHlD8iT16Z1XYY2twUqmVfr1vFy+IB4yoqCFdWTFoMwv2zSP41Z
	EzJ9S3ww==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhUHv-007f8d-Ro; Fri, 14 May 2021 09:39:19 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhUHu-007f8O-AY
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 09:39:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=ClFu7stGHQAENbOTcuMhdhhutkYTbleX/0OHL+wmLGE=; b=F1t4Yq0ExnjSbU83JvPdffsLBm
 mXthfIh9b7S7daiqx5j4Xzm9msWq6Uc0urnShjvfckoodapcqjZW6tVD4YBuz08Ux8/m/i28eOR4A
 8XGD96RcUGsqESlPHPnYdXc361M5vBiFOXqMGXPIjn2H7c6N4Q6HK+tQ3LGQ34XFJwBQUpFee0t9y
 68+Bd05j9rAvZQ1y0hCTwpQjh4LW8T9mjm8XPZkAttDFM0fU6BrUhbUaZhpTrkM990POYjptexZot
 1tUbLDAgJP6rw3CXK7/UzINXpXL0+ndm4IjcBdaFSY4dLZCxAkzNHw0SZbunw1m3iWltfy+LI8KzS
 jQ34fmsA==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhUHr-00BrrP-H9
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 09:39:17 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FhNgF3LyfzqTXF;
 Fri, 14 May 2021 17:35:37 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Fri, 14 May 2021 17:38:51 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <paul.walmsley@sifive.com>, <anshuman.khandual@arm.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH v2] riscv: mm: Drop redundant _sdata and _edata declaration
Date: Fri, 14 May 2021 17:49:08 +0800
Message-ID: <20210514094908.42809-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_023915_748520_1ECD1D42 
X-CRM114-Status: UNSURE (   6.93  )
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

The _sdata/_edata is already in sections.h, drop redundant
declaration.

Also move _xiprom/_exiprom declarations at the beginning of
the file, cleanup one CONFIG_XIP_KERNEL.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/mm/init.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4faf8bd157ea..3396e9f1b8e8 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -33,6 +33,7 @@ unsigned long kernel_virt_addr = KERNEL_LINK_ADDR;
 EXPORT_SYMBOL(kernel_virt_addr);
 #ifdef CONFIG_XIP_KERNEL
 #define kernel_virt_addr       (*((unsigned long *)XIP_FIXUP(&kernel_virt_addr)))
+extern char _xiprom[], _exiprom[];
 #endif
 
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
@@ -176,13 +177,6 @@ void __init setup_bootmem(void)
 	memblock_allow_resize();
 }
 
-#ifdef CONFIG_XIP_KERNEL
-
-extern char _xiprom[], _exiprom[];
-extern char _sdata[], _edata[];
-
-#endif /* CONFIG_XIP_KERNEL */
-
 #ifdef CONFIG_MMU
 static struct pt_alloc_ops _pt_ops __ro_after_init;
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
