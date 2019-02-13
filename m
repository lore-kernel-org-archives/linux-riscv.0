Return-Path: <SRS0=7ZJm=QU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76467C0044B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4ADB9222AC
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 13 Feb 2019 20:18:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hAtcrY9W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="BGYDabWY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4ADB9222AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Nn5Bz0aXryPwwz+VDY1dgiOnhNRlEmuld5j2wwPETQc=; b=hAtcrY9W58rOet1J6h5a9PXTO1
	Fj8u7vwrwRdtkkwUof4Gmp/B/9vnNNO9oF+xst5Ms0zjpGEHRPHCjQsY+Q4skudFrxfmDigDQ4XbE
	fdL1VuyCaCqjHp9PHpbeGdwDbkdbsgKY5n5fR92yOHftyuAxyeypAeJGYPD3027roBlpOG3PVRZfo
	wDYwD0uDJQRM17SZyH8V+CQv9KeDI0z5Mhafj2JX6nWoSGucUTRzpRes6PAKfTahTtH3lAYIRyNqp
	88ehFwWNprRfvf7AhJ+W3YlLUdpq7IX/8zMZzzx7+aHEZGlqJ+5xcajxpq398X0h94+RYbKYkQzCB
	ru1Z5mZg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gu0zM-0003UF-Qw; Wed, 13 Feb 2019 20:18:36 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gu0zE-0003Ca-CR
 for linux-riscv@lists.infradead.org; Wed, 13 Feb 2019 20:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550089109; x=1581625109;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=LuHhF9t57ihPno63oc42DW7mqejQI1UJBdnLjc5u4ww=;
 b=BGYDabWY22bp2Pu1FD9dC0fnk1j3smZ8TRtISOGazsyP45mW+bKlXMeC
 ASxQvOafzsEXn+Gi8iZ7p7x9z+XMmwtuAw6mBluv6kGSdd6TMTnFA88Py
 05SVVheXjVqRKaMW0g8fLMdk7Z23lYB3iGy2fl7JrcCs7WWsPMn+4sigQ
 m3ceXfdjw4s/sRXlpeR0a+YLFmKIsrfZO1XW6ix3XXNIENLwQbgwmp8s5
 qTclzH7bQ0KRANsC0BomTPXz5VjzKoOMVtZdPUijI171gNCNuywZvK/Xc
 7E9UpX3V5A+elDX6vFIAn7PjzRuU3GEtRWZYhiwaWv9LfkFLQTrYUww/R Q==;
X-IronPort-AV: E=Sophos;i="5.58,366,1544457600"; d="scan'208";a="102463837"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Feb 2019 04:18:23 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 13 Feb 2019 11:56:56 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Feb 2019 12:18:23 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v5 PATCH 8/8] RISC-V: Assign hwcap as per comman capabilities.
Date: Wed, 13 Feb 2019 12:18:12 -0800
Message-Id: <1550089092-28783-9-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
References: <1550089092-28783-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190213_121828_889327_C7EFE32D 
X-CRM114-Status: GOOD (  11.68  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Johan Hovold <johan@kernel.org>, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Guenter Roeck <linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we set hwcap based on first valid hart from DT. This may not
be correct always as that hart might not be current booting cpu or may
have a different capability.

Set hwcap as the capabilities supported by all possible harts with "okay"
status.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index e7a4701f..bc29b010 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <asm/processor.h>
 #include <asm/hwcap.h>
+#include <asm/smp.h>
 
 unsigned long elf_hwcap __read_mostly;
 #ifdef CONFIG_FPU
@@ -42,28 +43,30 @@ void riscv_fill_hwcap(void)
 
 	elf_hwcap = 0;
 
-	/*
-	 * We don't support running Linux on hertergenous ISA systems.  For
-	 * now, we just check the ISA of the first "okay" processor.
-	 */
 	for_each_of_cpu_node(node) {
-		if (riscv_of_processor_hartid(node) >= 0)
-			break;
-	}
-	if (!node) {
-		pr_warn("Unable to find \"cpu\" devicetree entry\n");
-		return;
-	}
+		unsigned long this_hwcap = 0;
 
-	if (of_property_read_string(node, "riscv,isa", &isa)) {
-		pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
-		of_node_put(node);
-		return;
-	}
-	of_node_put(node);
+		if (riscv_of_processor_hartid(node) < 0)
+			continue;
 
-	for (i = 0; i < strlen(isa); ++i)
-		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
+		if (of_property_read_string(node, "riscv,isa", &isa)) {
+			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
+			continue;
+		}
+
+		for (i = 0; i < strlen(isa); ++i)
+			this_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
+
+		/*
+		 * All "okay" hart should have same isa. Set HWCAP based on
+		 * common capabilities of every "okay" hart, in case they don't
+		 * have.
+		 */
+		if (elf_hwcap)
+			elf_hwcap &= this_hwcap;
+		else
+			elf_hwcap = this_hwcap;
+	}
 
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
