Return-Path: <SRS0=NTR9=SO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FF6AC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 137132084D
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Apr 2019 14:40:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="TzO6HTcv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 137132084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Iqq9Yf8on/kE3ErrRbZm3/YJ7AZf2SGE1J09BXl/Hw=; b=TzO6HTcvHAGj5e
	ZdG2N2UKQHCHKmuZ5N7LT3iMOFI7rc98Hx0nF+LFGKztDpPiP3/6PTFHw5WqlQpzDOWGsl/+WdqTl
	oob1B9KuGvI+bAh/zOzyLeZC7AwrzZR0sjHxpr9xFQ3XM4Q5TU/ldaz2/FbnyzWG67F9kGn4R2Db5
	UPOWqdXPG1/9smcdyk6rN1kOTCc7hntHkXpgajm7D7pOPgcMoXMMvDLSMglUh7Ms3KRqY2yQ7XNT2
	OGXQHTSSgAIJk1vkI8mxfaqGfMir8Rx+YqXUxy22VilW5Y97m1GTK/dxtF0SeXrg/9EPG1JVabMCy
	4seh+KuFp3KO4iOk8OcQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExMH-0001Zn-4b; Fri, 12 Apr 2019 14:40:49 +0000
Received: from 089144214194.atnat0023.highway.a1.net ([89.144.214.194]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExME-0001Vn-Af; Fri, 12 Apr 2019 14:40:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 12/12] riscv: call pm_power_off from machine_halt /
 machine_power_off
Date: Fri, 12 Apr 2019 16:39:48 +0200
Message-Id: <20190412143948.12478-13-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190412143948.12478-1-hch@lst.de>
References: <20190412143948.12478-1-hch@lst.de>
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
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This way any override of pm_power_off also affects the halt path and
we don't need additional infrastructure for it.

Also remove the pm_power_off export - at least for now we don't have
any modular drivers overriding it.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
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
