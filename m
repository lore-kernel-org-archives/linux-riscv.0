Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0E5CC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 10:53:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6170960EB4
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 10:53:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6170960EB4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6WI7FQ+/mhp6HXkDw3TcBGEgQnscPn8qVOqJCzhN/I=; b=eY5pfDh9RjAR7G
	xMXyqNJWWheRYBwLh1DD9qIqrwbcR7sYmS4YI9DEnpPffUYOK9jo3tVFzsZuK8VM0hK/TQ3M0KYVa
	80JXTAhxaqirIDDjHAXJDN+6eHctTFv+y/x6zdY3ou4PmzBcR7kGYXKWOCXli4mkrex82Y9mO07lL
	Rn3eIIBWIDfdqxyrggf80/Gyj5Z+u8hvHwqkfw8OFcwzsxgAl5mo3np0oMN/w4BmK6CGHLXyjl20d
	CqA45FxqH/sq+miVdhJ2mrv31sDCh/ejDmydRiiIFpyxlxtK5nAsDsbPCzj/2wiHglJFadaZnOVZv
	r61/G+r+TFTNTtppJVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZsvJ-008vGq-E5; Mon, 11 Oct 2021 10:52:49 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZsvG-008vFg-FD
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 10:52:48 +0000
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HSbF70BrXzWZFj;
 Mon, 11 Oct 2021 18:51:07 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 18:52:41 +0800
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.8; Mon, 11 Oct 2021 18:52:41 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <palmerdabbelt@google.com>, <linux-riscv@lists.infradead.org>
CC: Tong Tiangen <tongtiangen@huawei.com>, Kefeng Wang
 <wangkefeng.wang@huawei.com>
Subject: [PATCH] riscv/vdso: Drop unneeded part due to merge issue
Date: Mon, 11 Oct 2021 19:05:59 +0800
Message-ID: <20211011110559.72892-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_035246_700103_8C84274A 
X-CRM114-Status: UNSURE (   8.26  )
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

It seems that something is wrong when patch "riscv/vdso:
Refactor asm/vdso.h" is mereged.

Let's fix the merge issue.

Fixes: bb4a23c994ae ("riscv/vdso: Refactor asm/vdso.h")
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/include/asm/vdso.h | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/arch/riscv/include/asm/vdso.h b/arch/riscv/include/asm/vdso.h
index 208e31bc5d1c..3e295212d746 100644
--- a/arch/riscv/include/asm/vdso.h
+++ b/arch/riscv/include/asm/vdso.h
@@ -8,14 +8,6 @@
 #ifndef _ASM_RISCV_VDSO_H
 #define _ASM_RISCV_VDSO_H
 
-
-/*
- * All systems with an MMU have a VDSO, but systems without an MMU don't
- * support shared libraries and therefor don't have one.
- */
-#ifdef CONFIG_MMU
-
-#include <linux/types.h>
 /*
  * All systems with an MMU have a VDSO, but systems without an MMU don't
  * support shared libraries and therefor don't have one.
@@ -29,9 +21,6 @@
 
 #define VDSO_SYMBOL(base, name)							\
 	(void __user *)((unsigned long)(base) + __vdso_##name##_offset)
-
-#endif /* CONFIG_MMU */
-
 #endif /* !__ASSEMBLY__ */
 
 #endif /* CONFIG_MMU */
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
