Return-Path: <SRS0=SpZ8=KF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCF40C433B4
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 11:53:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A317D60E09
	for <linux-riscv@archiver.kernel.org>; Mon, 10 May 2021 11:53:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A317D60E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IVLPZ1WOlaTPapYHR0xSnl/O2HbZsXi8AgYkI1iv7gQ=; b=KmaHQpzXfS44CA91Niiw4fYagP
	s/eOKB8GjHOSVjEjgnEi2oJOUmcwtS3QZtP8qp6IZk5mhRk7GoJkiHdRv6cFjup6/fpdoDl7R3CXT
	kUIOQiwuMiDrLcFyNXVsrIHDMqy9+38FOmEmSGEv944DGq2YJjXWbQ/VTwxpIrgYgn/yLYQMDbotU
	q5s85DmspAFNV/M9RJnEm2yOqnShDk7IlOFRUrJ6nzJmQ0r6PhmVCkMA7DPndlbB76ctOOiGjk7yr
	0C1xWRuuNk8rNWHFomI2yImDSK9dcH7sfuwvpNLB5avPL2A7GSfbTYy+omkvqmILpki87LCsD9LgB
	QB8KOMsg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lg4TZ-00E9bd-Ns; Mon, 10 May 2021 11:53:29 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg48w-00E5w8-74
 for linux-riscv@desiato.infradead.org; Mon, 10 May 2021 11:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=Aw/uiGDy60xiXKwhhrncUJ5DVL42OlrGh3mbCSN9UjQ=; b=RTzuaR3phMo9AgAHhgpwQM1C9s
 809Fs9DMCT0c/9k7iY1eroz7VK0wAObJQfAhDCqE7QVwxqRRUS15fRxZ7gqK/zGhWI9qG0higHmUQ
 0OW14fwD6TEZdcx55u8JPPxcdd9eYoe+7s04M34Eoq/4R47YKleawNa8/A7FGk/n9HeixPC89KJsl
 iJpacMB9NYeFvtdj1UaanISLanrgDJjHnwLh8LEwci9KzFg3B/0qwrREWrqY1stLDqZa6SqSqLxD5
 CSLs2VyNABsuY2I4iz3oLo2lljKYPsAvttJ+jnbMChWW9NjKavOHyJj+fNqJz2B8tw0RvI1JQE/Yt
 u/OJfXaw==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lg48s-008cdc-Ss
 for linux-riscv@lists.infradead.org; Mon, 10 May 2021 11:32:08 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FdzNJ4Kwxz1BKkG;
 Mon, 10 May 2021 19:29:20 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.498.0; Mon, 10 May 2021 19:31:52 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>
CC: <palmerdabbelt@google.com>, <atish.patra@wdc.com>,
 <paul.walmsley@sifive.com>, <anshuman.khandual@arm.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH] riscv: Move setup_bootmem into paging_init
Date: Mon, 10 May 2021 19:42:22 +0800
Message-ID: <20210510114222.42195-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210510_043207_108955_08D0DBAF 
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

Make setup_bootmem() static.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/pgtable.h | 1 -
 arch/riscv/kernel/setup.c        | 1 -
 arch/riscv/mm/init.c             | 3 ++-
 3 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 9469f464e71a..2017794d0e64 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -533,7 +533,6 @@ extern uintptr_t _dtb_early_pa;
 #define dtb_early_pa	_dtb_early_pa
 #endif /* CONFIG_XIP_KERNEL */
 
-void setup_bootmem(void);
 void paging_init(void);
 void misc_mem_init(void);
 
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 03901d3a8b02..4db4d0b5911f 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -276,7 +276,6 @@ void __init setup_arch(char **cmdline_p)
 	parse_early_param();
 
 	efi_init();
-	setup_bootmem();
 	paging_init();
 #if IS_ENABLED(CONFIG_BUILTIN_DTB)
 	unflatten_and_copy_device_tree();
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4faf8bd157ea..136d0342b147 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -119,7 +119,7 @@ void __init mem_init(void)
 	print_vm_layout();
 }
 
-void __init setup_bootmem(void)
+static void __init setup_bootmem(void)
 {
 	phys_addr_t vmlinux_end = __pa_symbol(&_end);
 	phys_addr_t vmlinux_start = __pa_symbol(&_start);
@@ -866,6 +866,7 @@ RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
 
 void __init paging_init(void)
 {
+	setup_bootmem();
 	setup_vm_final();
 	setup_zero_page();
 }
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
