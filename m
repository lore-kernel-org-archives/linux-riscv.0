Return-Path: <SRS0=OMI1=QP=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 723A2C282CC
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:52:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4280120869
	for <infradead-linux-riscv@archiver.kernel.org>; Fri,  8 Feb 2019 01:52:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/oSDYnV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="g7jOktQx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4280120869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Wwcz078Yq5eWf5E8dRn3/C+g0rYBpTKeuYaccvG74Pc=; b=X/oSDYnV889sGVzkL0gBrUBGcm
	rwPtnAYuOyy43l6TiCraUPKqaZviQQXpRrS4tH8+J1dsCmrod881wDZDWWjJ1BhvDs51Q9cbBZlEP
	p24qB+YIQx0cwM/JUDXWLgW9Y38GMdZ0PGSLy+eZNb1q3Edh6TeurjCfCSnRPXsDJ8ay0wpyi4Elv
	1cvYvo7hPCVSKopfBQ1u1FdCBgQ/UjwYxnlqMUj0JE6o4X4Dz9gSxGpollPIC43I7VG/ywDX1qrWI
	u9+e0qJm/+vgrx7cCDPGIQEukrH/QiT2zMl5UTfjCBAeOAPx02M331JAtwHTZ+9JnSSl55acMQK+P
	ecEhH38Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1grvKk-0002p2-VW; Fri, 08 Feb 2019 01:52:02 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1grvKb-0002Zy-SZ
 for linux-riscv@lists.infradead.org; Fri, 08 Feb 2019 01:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1549590713; x=1581126713;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=ZvCXzp8StVNSMAn/qR+TnMWcDQTO4o6GC0MhJ3P3W7o=;
 b=g7jOktQxfI9UCrESbgoQaqgowdgBvHDByG/2QXiQOsJCsOK2+E6Gs7GD
 Yqv6+XzeWpgSYHptTDbiuFlAGXLEkh83Qxw6TIJyov6TXTkxnygMvwT56
 nfFFOkPf65AGWMduPGhXmf3nNHIs21S1V4ugHdg5u9YpxeJLh1g5KD5S9
 E2xsPiyVMSOXwxJiBk4UHChDAJmASsrblK9Pg8vDZmp4nf2cdhW30oCii
 IrcpgaWAwDbHmjugdpgchroruVVRJnM0oBH7qGFRFx6r+rKbTfFyE6zMu
 Uk5Iyvmf9UVSdmE9Ceh4yeD+b0sa50gTuUYGOZqnYSm+OPe3b6gWxMWk9 A==;
X-IronPort-AV: E=Sophos;i="5.58,346,1544457600"; d="scan'208";a="102533287"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2019 09:51:37 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 07 Feb 2019 17:30:20 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2019 17:51:38 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v3 PATCH 8/8] RISC-V: Assign hwcap only according to boot cpu.
Date: Thu,  7 Feb 2019 17:51:21 -0800
Message-Id: <1549590681-24125-9-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
References: <1549590681-24125-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190207_175154_286196_48EDF50D 
X-CRM114-Status: GOOD (  15.22  )
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
Cc: =?UTF-8?q?Patrick=20St=C3=A4hlin?= <me@packi.ch>,
 Albert Ou <aou@eecs.berkeley.edu>, Damien Le Moal <Damien.LeMoal@wdc.com>,
 Jason Cooper <jason@lakedaemon.net>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 Zong Li <zongbox@gmail.com>, Atish Patra <atish.patra@wdc.com>,
 Palmer Dabbelt <palmer@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we set hwcap based on first valid cpu from
DT. This may not be correct always as that CPU might not
be current booting cpu.

Set hwcap based on the boot cpu instead of first
valid CPU from DT. Add a sanity check to identify if any
hwcap do not match.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpufeature.c | 52 +++++++++++++++++++++++++++++-------------
 1 file changed, 36 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a6e369ed..ed8f0c28 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <asm/processor.h>
 #include <asm/hwcap.h>
+#include <asm/smp.h>
 
 unsigned long elf_hwcap __read_mostly;
 #ifdef CONFIG_FPU
@@ -32,6 +33,8 @@ void riscv_fill_hwcap(void)
 	const char *isa;
 	size_t i;
 	static unsigned long isa2hwcap[256] = {0};
+	int hartid;
+	unsigned long temp_hwcap = 0, boot_hwcap = 0;
 
 	isa2hwcap['i'] = isa2hwcap['I'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m'] = isa2hwcap['M'] = COMPAT_HWCAP_ISA_M;
@@ -43,27 +46,44 @@ void riscv_fill_hwcap(void)
 	elf_hwcap = 0;
 
 	/*
-	 * We don't support running Linux on hertergenous ISA systems.  For
-	 * now, we just check the ISA of the first "okay" processor.
+	 * We don't support running Linux on hertergenous ISA systems.
+	 * But first "okay" processor might not be the boot cpu.
+	 * Check the ISA of boot cpu.
 	 */
-	while ((node = of_find_node_by_type(node, "cpu")))
-		if (riscv_of_processor_hartid(node) >= 0)
-			break;
-	if (!node) {
-		pr_warning("Unable to find \"cpu\" devicetree entry");
-		return;
-	}
+	while ((node = of_find_node_by_type(node, "cpu"))) {
+		if (!node) {
+			pr_warn("Unable to find \"cpu\" devicetree entry");
+			return;
+		}
+
+		hartid = riscv_of_processor_hartid(node);
+		if (hartid < 0)
+			continue;
 
-	if (of_property_read_string(node, "riscv,isa", &isa)) {
-		pr_warning("Unable to find \"riscv,isa\" devicetree entry");
+		if (of_property_read_string(node, "riscv,isa", &isa)) {
+			pr_warn("Unable to find \"riscv,isa\" devicetree entry");
+			of_node_put(node);
+			return;
+		}
 		of_node_put(node);
-		return;
-	}
-	of_node_put(node);
 
-	for (i = 0; i < strlen(isa); ++i)
-		elf_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
+		for (i = 0; i < strlen(isa); ++i)
+			temp_hwcap |= isa2hwcap[(unsigned char)(isa[i])];
+		/*
+		 * All "okay" hart should have same isa. We don't know how to
+		 * handle if they don't. Throw a warning for now.
+		 */
+		if (elf_hwcap && temp_hwcap != elf_hwcap)
+			pr_warn("isa mismatch: 0x%lx != 0x%lx\n",
+				elf_hwcap, temp_hwcap);
+
+		if (hartid == boot_cpu_hartid)
+			boot_hwcap = temp_hwcap;
+		elf_hwcap = temp_hwcap;
+		temp_hwcap = 0;
+	}
 
+	elf_hwcap = boot_hwcap;
 	/* We don't support systems with F but without D, so mask those out
 	 * here. */
 	if ((elf_hwcap & COMPAT_HWCAP_ISA_F) && !(elf_hwcap & COMPAT_HWCAP_ISA_D)) {
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
