Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D77EFC4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A446020700
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="G/KfzLa9";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="rwFaOayN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A446020700
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Nn5Bz0aXryPwwz+VDY1dgiOnhNRlEmuld5j2wwPETQc=; b=G/KfzLa9hoq9zeyPithJfLqtZp
	o5YzL0Q94uKao+Mj2yn+8Kj9Z0U0P50x6z1fK1OIHnFObukOLVgfwrD4V01c6EtJ+a68iXa2S/xX/
	hfsTca7kf6BlrNX2EiDNFGnyI2HcsN2/8ORvN24vy57Yixm/dOCdMvIjmCCHCw3mv4hQpD4Zjj9Ch
	l6TSJOPXrgybeR6+O1tbgF08onvyFJtL0NuYl0fO6Gt+T8QaIVjMLzP8LZc5oRGLLlxjRxjWGOId+
	QtEoa5lrmUouTsX8HUWphFovJmQchWnyuEgjdJfETp0BeittLbHf3YZeZh/Q4ZsUEkDIGRgbVC+83
	mRdl+jvw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxGiL-0007Rv-T6; Fri, 22 Feb 2019 19:42:29 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGiG-0007Kt-Fg
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 19:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550864544; x=1582400544;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=LuHhF9t57ihPno63oc42DW7mqejQI1UJBdnLjc5u4ww=;
 b=rwFaOayNBU8eDHLTN+X0RKU6FkUzaimDhsuNYJcvV0DMjG9Qvc/J17w2
 nQxLNORwlmvQoBKxAZvezi6o8/p+XlyJo8ujfiUG0FnXtJwgsvmr4Ph07
 4oDLrTMLjynBVexjFQ8NWx33KkBd8C6EF+B45xpewLuUWGRyvy7C2nMYe
 nQE1nzI6TeHO9Iz5phd8ZE/X+RFF9rk9FSyMD0BrzuKdFR3rm0rHQk/pp
 zs2myGkOUW0mNhEi1ML4ZqWKN5y+NIJiEUHG3VUPoUn5h5b+JpTAjnTYG
 BW6DHBqOtijCfpPRxXvMcjRkU0bUzWpNp5+jByjP760Ko8zUMXBI3Yd+t A==;
X-IronPort-AV: E=Sophos;i="5.58,400,1544457600"; d="scan'208";a="101966792"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Feb 2019 03:42:04 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 22 Feb 2019 11:20:04 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Feb 2019 11:41:46 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v6 PATCH 6/6] RISC-V: Assign hwcap as per comman capabilities.
Date: Fri, 22 Feb 2019 11:41:40 -0800
Message-Id: <1550864500-13652-7-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
References: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_114224_699796_46B75140 
X-CRM114-Status: GOOD (  11.28  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>
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
