Return-Path: <SRS0=37zL=6B=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C9C0C352BE
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 12:11:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41BFD2083E
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 17 Apr 2020 12:11:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DKVsUbaQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41BFD2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DY0/sGN4LudDfKo0ISOR9qVcau/AnxPTIjv0bY4bBPg=; b=DKVsUbaQsAal8crethyc05e1G2
	AqbvpgRnQ34XQLl6ruKr2BeigHtreFyn6qXLnz6ZFT1hbc2FE32yoMTKTS4tIftVwMV1ZMy9z3WEt
	ihjG687ZMRKSgDFNVK68dmQx3sGZwBCP3znRGLJdrEQtSmfmr2N7oJMWNPfhxkYWsMUQiO/kCXtEV
	BVYhdxsDiS516kaPSkmppBo+c8HfvY8h3HdemKSX89/5MrkcJM9BcoPc6a0kM0xKjU5SnqehCW0k9
	nDM/xn9fP4Z0NUBaTrVNmZmndxrn/gyGgJYdWbPJlA+JajIKhfCsuZPKDTAzPoClMTGEDJHjIBDP2
	9UOCKixA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jPPpk-0002eQ-AU; Fri, 17 Apr 2020 12:11:00 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jPPpg-0002ce-LB
 for linux-riscv@lists.infradead.org; Fri, 17 Apr 2020 12:10:58 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9B89DD7271A07F10F0C2;
 Fri, 17 Apr 2020 20:10:44 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 17 Apr 2020 20:10:36 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: <atish.patra@wdc.com>, Paul Walmsley <paul.walmsley@sifive.com>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 1/3] riscv: sbi: Correct sbi_shutdown() and sbi_clear_ipi()
 export
Date: Fri, 17 Apr 2020 20:12:20 +0800
Message-ID: <20200417121222.156422-1-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200417_051056_864449_657FCC91 
X-CRM114-Status: UNSURE (   7.03  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Fix incorrect EXPORT_SYMBOL().

Fixes: efca13989250 ("RISC-V: Introduce a new config for SBI v0.1")
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/kernel/sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index 7c24da59bccf..62b10a16c8d7 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -102,7 +102,7 @@ void sbi_shutdown(void)
 {
 	sbi_ecall(SBI_EXT_0_1_SHUTDOWN, 0, 0, 0, 0, 0, 0, 0);
 }
-EXPORT_SYMBOL(sbi_set_timer);
+EXPORT_SYMBOL(sbi_shutdown);
 
 /**
  * sbi_clear_ipi() - Clear any pending IPIs for the calling hart.
@@ -113,7 +113,7 @@ void sbi_clear_ipi(void)
 {
 	sbi_ecall(SBI_EXT_0_1_CLEAR_IPI, 0, 0, 0, 0, 0, 0, 0);
 }
-EXPORT_SYMBOL(sbi_shutdown);
+EXPORT_SYMBOL(sbi_clear_ipi);
 
 /**
  * sbi_set_timer_v01() - Program the timer for next timer event.
-- 
2.20.1


