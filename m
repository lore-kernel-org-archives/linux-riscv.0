Return-Path: <SRS0=44w3=GO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09A7FC433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1791223DB
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Jan 2021 12:35:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1791223DB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IT6OsCHPX8kDyd9hI1YVyng6RJt6DkNzi+niLn6e6/Y=; b=rrs0hPzzA6zjRjbIbLZvvxHEW
	Uu3jNYtkp/2duSdrbK6T7IDqMPkP15HBcA8YhKxYOTQxHpL1guo+CKFigGS4A5kChQW3pq3RDlUf3
	F73jz4vbD2IBJ7qnBfVt6y280jNzrzKeUtKsJq6l7sDp4xAPevsrDpT97zSsYUkldzSxYL0M+6Wlh
	rLlEyL5sLr271SmDShusbU/M02UTE6IZQbOzjgJPQewKgQBn1Y7/12aUFk479SLzSkk8wrNDgkd4h
	7wVAsBrSo+HDUN35EGtuTSg6NhTCd/+NTXoi5twy0LFvkxZElHXa4UoAt+cNN5DbP2RQMTF4+S6vB
	2Nujls7PQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kywPS-0002iZ-B1; Mon, 11 Jan 2021 12:34:58 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kywPO-0002g3-EM
 for linux-riscv@lists.infradead.org; Mon, 11 Jan 2021 12:34:55 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4DDtRb2nXLz7SqV;
 Mon, 11 Jan 2021 20:33:47 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Mon, 11 Jan 2021 20:34:38 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Palmer Dabbelt <palmerdabbelt@google.com>,
 <linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH RESEND 2/3] riscv: Improve __show_regs
Date: Mon, 11 Jan 2021 20:40:13 +0800
Message-ID: <20210111124014.182957-3-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210111124014.182957-1-wangkefeng.wang@huawei.com>
References: <20210111124014.182957-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_073455_337289_E1EA54DA 
X-CRM114-Status: UNSURE (   8.14  )
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Chen Huang <chenhuang5@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Show the function symbols of epc and ra to improve the
readability of crash reports, and align the printing
formats about the raw epc value.

Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/riscv/kernel/process.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 78bb3a00d249..d8c099aa1337 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -44,7 +44,12 @@ void __show_regs(struct pt_regs *regs)
 {
 	show_regs_print_info(KERN_DEFAULT);
 
-	pr_cont("epc: " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
+	if (!user_mode(regs)) {
+		pr_cont("epc : %pS\n", (void *)regs->epc);
+		pr_cont(" ra : %pS\n", (void *)regs->ra);
+	}
+
+	pr_cont("epc : " REG_FMT " ra : " REG_FMT " sp : " REG_FMT "\n",
 		regs->epc, regs->ra, regs->sp);
 	pr_cont(" gp : " REG_FMT " tp : " REG_FMT " t0 : " REG_FMT "\n",
 		regs->gp, regs->tp, regs->t0);
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
