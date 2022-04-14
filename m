Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD22C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Apr 2022 17:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S+XLIiN+md9sWZhHD4f85BcV3+0LQFNNk/eI/q9HLbg=; b=Zx9lr6sUJsL72K
	kzpRqrTmaf0SVyM7297R0HbNmqbtRWR/QAOTq0Tc/Jn3yIHf5OncYSa58OyQMDPrlyGkiD9pG+6N6
	xJdN1kZFtKb+iPiOqjz4Kme1t0y62nDmlMnaOJoHUvqg1d8b89zcTTobYDkE79BHiaSv5b7PxycSH
	dFodFbgJLmxoY7LES0/I1UwurPGO1HjgZAzSZciyguK5XCuI98qFzobqglI3pM8pCtiauMPsLP4XK
	R4+NI1Dz+wiG3LcawnVXZJ4rFDGmOBjBENX7WSNrSVzoaJnlAnHMWVB6rKJh0DRgWUNLV/gm30fO2
	fc0rtEwLBDsArRkDNqAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nf3J1-006cQz-0M; Thu, 14 Apr 2022 17:30:55 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nf3Ix-006cQK-Pe
 for linux-riscv@lists.infradead.org; Thu, 14 Apr 2022 17:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1649957451; x=1681493451;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=eLJN+n+sefzeIkkG/0s0IS3RfDLV74k6PsaZqR+kLa4=;
 b=jYV8/9ihxVrJypDx+p/X7ZgLuX3e02aF4baW9jBW94m7RglcAMNmWG2h
 We2K3lk7qg7jUs6OLzWnc4OZ3C53hNHv3C9rORG4EKSXdzUtjHV9So80C
 I/EG8T/Gts+8CqF7wxAMu5Ae9c3OFn0tVsKRzvuMI0CEa4znhGr6V4SsQ
 V1l2lVbC9T9WttE7aPXz2mMAqLmeehPKIXGct4ZUK5LxUOWT77MKArNvw
 3YYxiupy0iWtzqfL5X0qcfvW+PjOSzJ/TZtkBeTDSGgvkdorFLM47R+Wf
 /Z7wJceCnF+yEsF8CAqcZaLF9bDrHy+uVDFYjssWkjuWEPOIyXysSBWWZ A==;
X-IronPort-AV: E=Sophos;i="5.90,260,1643644800"; d="scan'208";a="302123479"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Apr 2022 01:30:45 +0800
IronPort-SDR: 7y5SAWUQCp00PmytfFYzURX67+rDDedry4Rk7huTIh5Vyl9Q3ukSx46yyUHRAAh+gxxQKrYFsB
 L0w5571aafWh0urk8AnOON+JxXqth58HpZEFaPdpVExwa2Mq7KMQKtxWrtRyRzXucprz3U8MI2
 xaCWRq/l0fSytMD96eYCsqcHS/yTjt7G0VgK0sIRfOYCZDuvVTRqUjWK5UfYDQgBfa96rZtZ9j
 SBKrDs2vrezldnE0Yus70WP00yeMfYgO//I8Wf2ZhUtgZ4o0Wz+RMq/M2yE1Mm/hmR3IljltBa
 G5Hdz8eArzQTSvkx7xlxFVFa
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 14 Apr 2022 10:01:57 -0700
IronPort-SDR: gCeL+5Dge0/qy3IdizvAF4owKWVBvmoWZYyILIqiJR4hDwX98k7atRjmoCKcQKCuD+xRmvZHUr
 4dZMNGZpWw4RypBHm3q7+rep8LYHxoTKQBtoDptLukcBew53BLByPb7p0/C3GIcDzvka34x9RK
 wCMFH0rtgda5sgMRYBz2AN229EwJa5i01jpOSrTYWF3a5ipGKCvn4NgDQmswvify+6li4XqEYJ
 SLcuJqCh7DVv18wqtH/VIw2u2hO5/00xO3hn7E3boCMDrhQYoDUh72sZsL6YpXDq/TzE/I3D6k
 Aso=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.21])
 by uls-op-cesaip02.wdc.com with ESMTP; 14 Apr 2022 10:30:44 -0700
From: Niklas Cassel <niklas.cassel@wdc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Don't output a bogus mmu-type on a no MMU kernel
Date: Thu, 14 Apr 2022 19:30:36 +0200
Message-Id: <20220414173037.1381927-1-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220414_103051_958174_F73DC4F0 
X-CRM114-Status: GOOD (  11.19  )
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

Currently on a 64-bit kernel built without CONFIG_MMU, /proc/cpuinfo will
show the current MMU mode as sv57.

While the device tree property "mmu-type" does have a value "riscv,none" to
describe a CPU without a MMU, since commit 73c7c8f68e72 ("riscv: Use
pgtable_l4_enabled to output mmu_type in cpuinfo"), we no longer rely on
device tree to output the MMU mode. (Not even for CONFIG_32BIT.)

Therefore, instead of readding code to look at the "mmu-type" device tree
property, let's continue with the existing convention to use fixed values
for configurations where we don't determine the MMU mode at runtime.

Add a new fixed value for !CONFIG_MMU in order to output the correct
MMU mode in cpuinfo.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 arch/riscv/kernel/cpu.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index ccb617791e56..ecfb3e85ffb2 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -138,6 +138,7 @@ static void print_mmu(struct seq_file *f)
 {
 	char sv_type[16];
 
+#ifdef CONFIG_MMU
 #if defined(CONFIG_32BIT)
 	strncpy(sv_type, "sv32", 5);
 #elif defined(CONFIG_64BIT)
@@ -148,6 +149,9 @@ static void print_mmu(struct seq_file *f)
 	else
 		strncpy(sv_type, "sv39", 5);
 #endif
+#else
+	strncpy(sv_type, "none", 5);
+#endif /* CONFIG_MMU */
 	seq_printf(f, "mmu\t\t: %s\n", sv_type);
 }
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
