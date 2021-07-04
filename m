Return-Path: <SRS0=6USs=L4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6612FC07E95
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 08:36:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F4F161452
	for <linux-riscv@archiver.kernel.org>; Sun,  4 Jul 2021 08:36:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F4F161452
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.com.cn
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cwmPt65EWTfVkXsJN3NEzM8jg8tsl+X2os50vvMcfUQ=; b=Q6wohfPI6PmDo2
	LXdjZ5fbAVileOCFsMFIDSw/MuiEXI2jOqNusjAww7nZNG2PDV2FTtO+zRsjvrGc+mGUQcpDaKmTz
	Js4atIUCRNuMFRrX8kAmjEWGgAnpvn1ZOfMO7irHRzYbBKDQQ3FXD8y1RzIwhx28/YWP+aRGaTrfQ
	SiAEZUUGZ0MOvIMx8rnNppIb0GaF9awASE7b1MvudDyIQqSeRt5bB80jpyfMMTyQ4B2yxH/yydZYJ
	tSFmJ7g96M9DsUerg3bzNRvIEl2c9q575GKbEcHeEosFuR4LL7c7V/1XDO55urpBvvaxTnaCCI2ai
	Hlrz+uIXfh2krttfqWNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzxbC-005zBa-Qj; Sun, 04 Jul 2021 08:35:34 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzxb5-005z8q-UQ
 for linux-riscv@lists.infradead.org; Sun, 04 Jul 2021 08:35:32 +0000
X-QQ-mid: bizesmtp45t1625387703tlxib56g
Received: from yoga14s.. (unknown [111.19.33.15])
 by esmtp6.qq.com (ESMTP) with 
 id ; Sun, 04 Jul 2021 16:35:02 +0800 (CST)
X-QQ-SSF: 01400000000000B0G000B00A0000000
X-QQ-FEAT: x3TboRXiN5wJAPDuOhDZI1f+28i8YHK5R++KrUZDa4NBm6OUAIEv7uDvSh+oO
 YGBtnWKb10ms2HRa2dTM9gCbr0Hi+su7CzTwWJNMGA8bwFit9uermiOz84elV7NkksIrDII
 UBIU/Cit1/N7TAjSr82o15JXyHegCIJfVHm893Uc8c1Y+B0OYGNu79d292VvKO/pzlSBj3a
 LUgo8C1UlP6hVKDUDXVgDdIl0qSS0HInO+gFOFBwm5YY2kLQPZ8xPKrUKWspPX5lqaJOfov
 GEfLe+TKLBil07dtmW3ZM+qQvQHwCwPC3wDOw4Ip8+xCI1DNvLj2GydqAo9tQYlhGnQw==
X-QQ-GoodBg: 2
From: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: dts: fix memory size for the SiFive HiFive Unmatched
Date: Sun,  4 Jul 2021 16:34:41 +0800
Message-Id: <20210704083441.256097-1-qiuwenbo@kylinos.com.cn>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:kylinos.com.cn:qybgforeign:qybgforeign2
X-QQ-Bgrelay: 1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_013528_308535_17573B27 
X-CRM114-Status: UNSURE (   8.15  )
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

The production version of HiFive Unmatched have 16GB memory.

Signed-off-by: Qiu Wenbo <qiuwenbo@kylinos.com.cn>
---
 arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index b1c3c596578f..2e4ea84f27e7 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -24,7 +24,7 @@ cpus {
 
 	memory@80000000 {
 		device_type = "memory";
-		reg = <0x0 0x80000000 0x2 0x00000000>;
+		reg = <0x0 0x80000000 0x4 0x00000000>;
 	};
 
 	soc {
-- 
2.32.0




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
