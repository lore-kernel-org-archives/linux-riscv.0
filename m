Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7B1FC10F13
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 765A1217D4
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 11:57:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jfA7Idzk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 765A1217D4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+f9Fp+KPcA2b+zZ385MlKrwAaK9N8IxLBg1XBPiB548=; b=jfA7IdzkYFUTrk
	Diy7Tk51BasRccyvfDu0TT6wLoczwu54TeI0IQOiLqg4TZbpGrDu59q1f+fe/GzPtcNlE5c/GWf+3
	n9dLwMSjxyQ+vJk58xjds/RD0tRxxZl8XDxPTQUjBdjScQBbOPFzJnqSzi8o9r3R8DlCta4/jBwyq
	l2qmYSXrngm2D9OH8trHoFM4U5FltSPE8Tq2qGrtrQUSJA+BywEpQ7mQKGznOn04rfDesWp3E6IvW
	1ElE2yI5SqIxked1L4aqVDuGoLuaE8DutEMeS/qUbuQRgnIa2kkBXv9wi5bG34cZzu9ghemOREvjk
	53N55gRkIf3fjm6ThwfQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEYKN-0001EO-NX; Thu, 11 Apr 2019 11:57:11 +0000
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEYKL-0001Ad-8b; Thu, 11 Apr 2019 11:57:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 9/9] riscv: call pm_power_off from machine_halt /
 machine_power_off
Date: Thu, 11 Apr 2019 13:56:23 +0200
Message-Id: <20190411115623.5749-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411115623.5749-1-hch@lst.de>
References: <20190411115623.5749-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This way any override of pm_power_off also affects the halt path and
we don't need additional infrastructure for it.

Also remove the pm_power_off export - at least for now we don't have
any modular drivers overriding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/kernel/reset.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 2a53d26ffdd6..ed637aee514b 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -12,11 +12,15 @@
  */
 
 #include <linux/reboot.h>
-#include <linux/export.h>
 #include <asm/sbi.h>
 
-void (*pm_power_off)(void) = machine_power_off;
-EXPORT_SYMBOL(pm_power_off);
+static void default_power_off(void)
+{
+	sbi_shutdown();
+	while (1);
+}
+
+void (*pm_power_off)(void) = default_power_off;
 
 void machine_restart(char *cmd)
 {
@@ -26,11 +30,10 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
-	machine_power_off();
+	pm_power_off();
 }
 
 void machine_power_off(void)
 {
-	sbi_shutdown();
-	while (1);
+	pm_power_off();
 }
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
