Return-Path: <SRS0=7SDv=VY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4809BC7618B
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 07:10:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11AF020838
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 27 Jul 2019 07:10:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QfR8FEl7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11AF020838
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sjtu.edu.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=1jjQ+VpfUsvpu5WN1UPo8VIc9QdjvdVSES3TgklzH7o=; b=QfR
	8FEl7LJm2sJfnt2+rHNI3BC+u7V+/NtZyvHugWfuP9oP2DkQstFEhxWH6lQKDT/PSr47DDCealPaV
	K/kXlAWs3RGvMHJOoRuHjC773MDQ3gCC6Ntpzjuc3ijLWg3FlqHwNaJOZr+E8pijPMaFNmmc7o600
	lFyoVGGwfBWryFqBTtG3ZnugfQa/WPhkdkI85M6CEkxEH6t3tU7XUENCyiGWWBV8eZ85DKDH18nGA
	h7OyyIDoDlGsCQnxWFpY9eMtAS2dMRgsydUInslS++IBP4kAp/Z3ioSTFdLm4jc4sGUE/IebjxpGu
	CeWpmXQ0hON57C8GoQLU/vDWh7tJ2iQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hrGr1-0003Tt-C4; Sat, 27 Jul 2019 07:10:55 +0000
Received: from smtp180.sjtu.edu.cn ([202.120.2.180])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hrGqy-0003TW-Fn
 for linux-riscv@lists.infradead.org; Sat, 27 Jul 2019 07:10:54 +0000
Received: from proxy01.sjtu.edu.cn (unknown [202.112.26.54])
 by smtp180.sjtu.edu.cn (Postfix) with ESMTPS id E26C51008CBC3;
 Sat, 27 Jul 2019 15:10:50 +0800 (CST)
Received: from localhost (localhost [127.0.0.1])
 by proxy01.sjtu.edu.cn (Postfix) with ESMTP id CCA8920424204;
 Sat, 27 Jul 2019 15:10:50 +0800 (CST)
X-Virus-Scanned: amavisd-new at proxy01.sjtu.edu.cn
Received: from proxy01.sjtu.edu.cn ([127.0.0.1])
 by localhost (proxy01.sjtu.edu.cn [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id dRKgTVampxTk; Sat, 27 Jul 2019 15:10:50 +0800 (CST)
Received: from xywang-pc.ipads-lab.se.sjtu.edu.cn (unknown [202.120.40.82])
 (Authenticated sender: xywang.sjtu@sjtu.edu.cn)
 by proxy01.sjtu.edu.cn (Postfix) with ESMTPA id 9F49720424202;
 Sat, 27 Jul 2019 15:10:50 +0800 (CST)
From: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
To: 
Subject: [PATCH] pwm: avoid disabling clk twice
Date: Sat, 27 Jul 2019 15:09:16 +0800
Message-Id: <20190727070916.2960-1-xywang.sjtu@sjtu.edu.cn>
X-Mailer: git-send-email 2.11.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190727_001052_727031_F38F457C 
X-CRM114-Status: UNSURE (   6.09  )
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
Cc: linux-pwm@vger.kernel.org, Wang Xiayang <xywang.sjtu@sjtu.edu.cn>,
 palmer@sifive.com, thierry.reding@gmail.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Similar to commit 63fd4b94b948 ("serial: imx: fix error handling
in console_setup"), as ddata->clk has been explicitly disabled two
lines above, it should avoid being disabled for the second time.
clk_unprepare() suits here better.

Signed-off-by: Wang Xiayang <xywang.sjtu@sjtu.edu.cn>
---
 drivers/pwm/pwm-sifive.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
index a7c107f19e66..00f6fab5bd3b 100644
--- a/drivers/pwm/pwm-sifive.c
+++ b/drivers/pwm/pwm-sifive.c
@@ -312,7 +312,7 @@ static int pwm_sifive_remove(struct platform_device *dev)
 	if (is_enabled)
 		clk_disable(ddata->clk);
 
-	clk_disable_unprepare(ddata->clk);
+	clk_unprepare(ddata->clk);
 	ret = pwmchip_remove(&ddata->chip);
 	clk_notifier_unregister(ddata->clk, &ddata->notifier);
 
-- 
2.11.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
