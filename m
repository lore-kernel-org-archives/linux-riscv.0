Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65886C54E58
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Mar 2024 06:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m6Vh5A/+5Fw3h/Px8lDKQHa5JtZQKq9AKNFwuRRi2G0=; b=gL7Mq6QVMN0iSu
	hO2MVOP9M3adY9eTVzKLK1nXMGbDA997PEapmnrI6OpmjHXadQjnJ7NCnWKjxuELPeCgUTiPqrlEk
	6xQihh+FqFUmxnkHudr+XRYFfDsBJFU6WW3MTcsYBQ+5BJcRShG7b2apNvr+4IlX9hmRAWuSZ7Kyn
	lQR5q2MatkITSPXprG+0iKRRpBHXvEzBXJZegHP6drZDak3Q0YnZt01f/S4Z75pE9dugjHmr/bFTP
	WKTruMKy6HP5o7bdLvLCckLZxMO5ab8cAtoe6oPTZhQIQd6Eg0mc8hmzlaOSNZl5ifi1z8pJ0S/D+
	WGOFHdGe/XSW61H/WMTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpke-0000000FlAO-0w2V;
	Wed, 20 Mar 2024 06:48:40 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmpka-0000000Fl6z-3ft0
	for linux-riscv@lists.infradead.org;
	Wed, 20 Mar 2024 06:48:39 +0000
X-QQ-mid: bizesmtp67t1710917284thnfyjz3
X-QQ-Originating-IP: OJizYU0H9xC2851P0uUCE4B9VvMnFvZLp4NnBXJMqAk=
Received: from localhost ( [112.0.147.175])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 20 Mar 2024 14:48:03 +0800 (CST)
X-QQ-SSF: 01400000000000704000000A0000000
X-QQ-FEAT: FwowAM4HOqBGbsidlDrWeFbrU7mQSrccryRonPJnKUAdgGDEvBMlRTq68iM29
	uq2+tdqkrrnYqSmEt+O6L9HTchYkQsHS+2yW6+m0pFY+knIELBlqAhqPPGa2lz3nl8JA2Q0
	0h/+keWpn7HKXPnuC7Yml8Tl1h0T5UF7KAwYxaVPp3IANRi8+VijawpC8469DTIzzCOLnRb
	/oqlJMj/Av1JXjnZYpF9vXF8YzyeXIEXYl3d7OeZNQNxpOk1KqJ/jehf1wui0ObJY3daNH6
	FpLEGUO9QkNFS7xP/k1Oy1dX1EaYeBxtMmWkUp98yOcfOpEDBpCOt6fEfFKivkXrTx2gT+o
	KPTkSTkk6brvPlz5+A/X++JbjAoq6NEvYG/nyvLC2+9qXUSXA6TGnKhqiduiLh+bC8s+M0+
X-QQ-GoodBg: 2
X-BIZMAIL-ID: 553066475430503737
From: Dawei Li <dawei.li@shingroup.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alexghiti@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dawei Li <dawei.li@shingroup.cn>
Subject: [PATCH 1/2] riscv: Remove redundant CONFIG_64BIT from pgtable_l{4,5}_enabled
Date: Wed, 20 Mar 2024 14:47:11 +0800
Message-Id: <20240320064712.442579-2-dawei.li@shingroup.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20240320064712.442579-1-dawei.li@shingroup.cn>
References: <20240320064712.442579-1-dawei.li@shingroup.cn>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:shingroup.cn:qybglogicsvrgz:qybglogicsvrgz5a-1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240319_234837_825688_E2A43C81 
X-CRM114-Status: UNSURE (   7.29  )
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

IS_ENABLED(CONFIG_64BIT) in initialization of pgtable_l{4,5}_enabled is
redundant, remove it.

Signed-off-by: Dawei Li <dawei.li@shingroup.cn>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/mm/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index fa34cf55037b..bab3e9943bb5 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -50,8 +50,8 @@ u64 satp_mode __ro_after_init = SATP_MODE_32;
 EXPORT_SYMBOL(satp_mode);
 
 #ifdef CONFIG_64BIT
-bool pgtable_l4_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
-bool pgtable_l5_enabled = IS_ENABLED(CONFIG_64BIT) && !IS_ENABLED(CONFIG_XIP_KERNEL);
+bool pgtable_l4_enabled = !IS_ENABLED(CONFIG_XIP_KERNEL);
+bool pgtable_l5_enabled = !IS_ENABLED(CONFIG_XIP_KERNEL);
 EXPORT_SYMBOL(pgtable_l4_enabled);
 EXPORT_SYMBOL(pgtable_l5_enabled);
 #endif
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
