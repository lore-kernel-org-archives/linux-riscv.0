Return-Path: <SRS0=dvb3=PQ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133EFC43387
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:39:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D18B1206B7
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  8 Jan 2019 09:39:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h0VdzLek";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="Vmn8I9dl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D18B1206B7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XZC93RHIJuajpVVW0d07Lj6xT0XOVJkZMu8gFekjfYU=; b=h0VdzLekaHRSDfv/3e/+7l27PL
	QytIaH4mQt0RKtZoVMbvIOt3yobuxeGYz8OMSkL9z6fhgRBKu4r3TZdX12RcZMuJLABv04xBYPN49
	xwe/QjpSxFl9wycK6ur6yPeY03j37oKGldNUzFtBOYOv/h4O1z3GK7w0RJh0J+nNGLqES7MqmdHFH
	LiMypCI230eeNqcrSjz2JUofOtQI4yo6doMid1IkDy8qXFGOW/8FAIGeujBWjbGAb7aOLAuGTwKbZ
	av5el4zUyrfislV6Ui63Khouo5+ZsRv0rKlx20j4C8D5+xnE2GAoTpa/rC7bDAgNBGydc4EmrSbJ9
	cEq+AQoA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1ggnqi-00043N-3j; Tue, 08 Jan 2019 09:39:04 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ggnqW-0003mL-Jd
 for linux-riscv@lists.infradead.org; Tue, 08 Jan 2019 09:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1546940333; x=1578476333;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=hIYjBsfhX3gB/IHDl4/QkkHLXfbPQQMg3EaMmAjjBhc=;
 b=Vmn8I9dlPdmSZXVVNqPgu9ckgNwyIfcgYqnrc3unxf6uN6+dCXILcSMO
 BmfrTqYFq4Zt3yK207TEC4fNsdbBuWnXhkkYAoLhy35UN8MmhkumZ1pDW
 NUFPH3GDrC8mNZPeuf6ASlm5kQrTIERPdIsY5M6rLiJNJ6HCBmDm1KAlP
 Mp2ZdGFKMmOtHJ4YmMMx+IDLvdYQMIIRXqPXG5gsCC7Fc/JcdVrHhBrTG
 /Hx81g/SVPED6Rm4oVOM6yH3N5GF+0T6IKFBZaDzT/eNKBLGQ51TozyWo
 Krl7cRANc51HKwHFN3ixfwcd3Ys28r/dA3PFFJp+iA21t5GX7OkD+6LL4 g==;
X-IronPort-AV: E=Sophos;i="5.56,453,1539619200"; d="scan'208";a="100000264"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2019 17:38:49 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 08 Jan 2019 01:18:53 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 08 Jan 2019 01:38:48 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [PATCH v2 8/8] RISC-V: Assign hwcap only according to current cpu.
Date: Tue,  8 Jan 2019 01:38:38 -0800
Message-Id: <1546940318-9752-9-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
References: <1546940318-9752-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190108_013852_997798_92D46AE9 
X-CRM114-Status: GOOD (  10.06  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Jason Cooper <jason@lakedaemon.net>,
 Alan Kao <alankao@andestech.com>, Dmitriy Cherkasov <dmitriy@oss-tech.org>,
 Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, Michael Clark <michaeljclark@mac.com>,
 Atish Patra <atish.patra@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Andreas Schwab <schwab@suse.de>, Marc Zyngier <marc.zyngier@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Zong Li <zongbox@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Currently, we set hwcap based on first valid cpu from
DT. This may not be correct always as that CPU might not
be current booting cpu.

Set hwcap based on the current cpu instead of first
valid CPU from DT.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 arch/riscv/kernel/cpufeature.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index a6e369ed..ed6122ff 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -43,12 +43,15 @@ void riscv_fill_hwcap(void)
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
+	while ((node = of_find_node_by_type(node, "cpu"))) {
+		if (riscv_of_processor_hartid(node) == boot_cpu_hartid)
 			break;
+	}
+
 	if (!node) {
 		pr_warning("Unable to find \"cpu\" devicetree entry");
 		return;
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
