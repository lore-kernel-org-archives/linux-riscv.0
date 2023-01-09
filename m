Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D42C54EBD
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jan 2023 06:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yj2XV4v2QaxeFdN6WnPpZQ+dQDsjvR7D+ymcY7xiNOI=; b=IazAiBNTaTM0w/
	aM1I/eJAruncX8N4chbeezvO+rTaJDouYyqzrgWSyzqGMC3lMbIz4qZxLTAoEPYOl3Dl0RVNI7+sf
	KEBX49pkYwPJK0+l73HM6wO8oTwmlDh6Hq/ma8Xj0ReXhZMxebZUgytUuZSV63lSHf7dSwwm72Kla
	GJel3bIfVuBTMg7MkUzr0vygBtBAnK57le4M1xDz8LUjbN0Vk95j8VldKjouG7imGe5a/0YLAskrn
	7B4n4ITPEebhWkPXSxd5vw4P8/Dy9XUn3yR2RyEpDQy+OSNNUFekf5v/Kyy19ueNi0G917YnM2I2d
	Tbs8DduZTNzzLwljsdVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElaW-00HaK6-UP; Mon, 09 Jan 2023 06:24:52 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pElaS-00HaIS-Qn
	for linux-riscv@lists.infradead.org; Mon, 09 Jan 2023 06:24:50 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 412F924E21B;
	Mon,  9 Jan 2023 14:24:25 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 9 Jan
 2023 14:24:25 +0800
Received: from jsia-virtual-machine.localdomain (60.49.128.133) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 9 Jan 2023 14:24:21 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>
Subject: [PATCH v2 2/3] RISC-V: mm: Enable huge page support to kernel_page_present() function
Date: Mon, 9 Jan 2023 14:24:06 +0800
Message-ID: <20230109062407.3235-3-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
References: <20230109062407.3235-1-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [60.49.128.133]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230108_222449_046263_972CE311 
X-CRM114-Status: UNSURE (   8.95  )
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

Currently kernel_page_present() function doesn't support huge page
detection causes the function to mistakenly return false to the
hibernation core.

Add huge page detection to the function to solve the problem.

Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
Reviewed-by: Mason Huo <mason.huo@starfivetech.com>
---
 arch/riscv/mm/pageattr.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
index 86c56616e5de..73fdec8c0a72 100644
--- a/arch/riscv/mm/pageattr.c
+++ b/arch/riscv/mm/pageattr.c
@@ -221,14 +221,20 @@ bool kernel_page_present(struct page *page)
 	p4d = p4d_offset(pgd, addr);
 	if (!p4d_present(*p4d))
 		return false;
+	if (p4d_leaf(*pud))
+		return true;
 
 	pud = pud_offset(p4d, addr);
 	if (!pud_present(*pud))
 		return false;
+	if (pud_leaf(*pud))
+		return true;
 
 	pmd = pmd_offset(pud, addr);
 	if (!pmd_present(*pmd))
 		return false;
+	if (pmd_leaf(*pmd))
+		return true;
 
 	pte = pte_offset_kernel(pmd, addr);
 	return pte_present(*pte);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
