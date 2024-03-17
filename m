Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57752C54E67
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Mar 2024 05:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/WxVAg8NK3XQ/6tweDlwD/EqWG7Sa7MJhAFJyfRY24E=; b=jlKyZoz8Z08qBY
	FhYvTgLlXlcdtwBESg9wOXxfNqP0RCpuY30H3FqL4SeWUqEr0MlBnM5yVDwkbGo5mBP1p4ZnsOcVU
	3NgHteNki0hjmvUvsmc+x3S2RH8liWMGiPD77Hm4BC3X/a9oiGv4lTLBxOZGJpPttLiLTZcsozevE
	ZCwx6ptSDocHBjab8yjXEcBWJWbufikbDxwKg//21h/l6gKVKXlNh2f+ZuyALoUWKebeG6L3M0Thz
	onbmELIbXe0ZFyo4iKoVUkwcpod2DpF4JX9FtDfWDqdzwsoBnATVO0uX3kn63sNPcxqyKbUPphiy3
	vwUI170n+r7hmyI7W0Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rljVY-00000004WrX-3hTB;
	Sun, 17 Mar 2024 05:56:32 +0000
Received: from rockwork.org ([2001:19f0:6001:1139:5400:2ff:feee:29a2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rljVU-00000004Wqc-2sMj
	for linux-riscv@lists.infradead.org;
	Sun, 17 Mar 2024 05:56:30 +0000
Received: from rockdesk (unknown [IPv6:2408:8340:c40:490:6106:2b11:2955:ac3a])
	by rockwork.org (Postfix) with ESMTPSA id CB25B3E862;
	Sun, 17 Mar 2024 05:56:17 +0000 (UTC)
From: Xingyou Chen <rockrush@rockwork.org>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	ajones@ventanamicro.com,
	cleger@rivosinc.com,
	aou@eecs.berkeley.edu,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	Xingyou Chen <rockrush@rockwork.org>
Subject: [PATCH] riscv: typo in comment for get_f64_reg
Date: Sun, 17 Mar 2024 13:55:56 +0800
Message-ID: <20240317055556.9449-1-rockrush@rockwork.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_225628_759769_65E28C6B 
X-CRM114-Status: UNSURE (   8.10  )
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

Signed-off-by: Xingyou Chen <rockrush@rockwork.org>
---
 arch/riscv/kernel/fpu.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/fpu.S b/arch/riscv/kernel/fpu.S
index 2c543f130f93..327cf527dd7e 100644
--- a/arch/riscv/kernel/fpu.S
+++ b/arch/riscv/kernel/fpu.S
@@ -211,7 +211,7 @@ SYM_FUNC_START(put_f64_reg)
 SYM_FUNC_END(put_f64_reg)
 
 /*
- * put_f64_reg - Get a 64 bits FP register value and returned it or store it to
+ * get_f64_reg - Get a 64 bits FP register value and returned it or store it to
  *	 	 a pointer.
  * a0 = FP register index to be retrieved
  * a1 = If xlen == 32, pointer which should be loaded with the FP register value
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
