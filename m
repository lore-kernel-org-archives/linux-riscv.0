Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD43C7EE22
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 18:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JuQw6NUMcRc/o+PPKSEX3RCjpqGeDFH+Yw6bdXt0Mio=; b=gWznca7rTGo2A2
	iBbjua9ZHgXllyJMBM0RCppNPvtwpEdVuOjkjjoCwZAmVswVlu/rvVzD/hPWLY+z+sAFPjjD0MDT6
	NmdLX7r3mA93LWWklGf5qoOZ11whKkVCMoF6+ex+usbVm7IFZwSKyXpUGE0z6dVKIyStorNkIDBoX
	pT3ptwhWKm+ksk9fOoHQnyq6NZWjntadB5WL1i18JLWkHfuZyjo+Ke2sM/uwQdKLKpH+fN7cf9W3A
	MBJtC+0EOKvMDW2dU9eHPRMJdBskXsdnLyktj5YdkXBOOTeiRFHRjRb1gdxOK/sdL9Ycv25kb/zLG
	zH7d2Yklse5uHSf/bTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUS-008VRS-2q;
	Thu, 04 May 2023 18:15:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pudUQ-008VQJ-0p
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 18:15:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D3B3D63529;
	Thu,  4 May 2023 18:15:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8DF29C4339B;
	Thu,  4 May 2023 18:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683224137;
	bh=9JfENNR9tgTK4UNoFGHEIVOabute+dkxlDAuBXGtQfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fYhAo1ODIkVmQoBwdGr6i8SBu8SxzKTjjSwKijH1/c3LjkHLo5JMnPGPSyWnQ+9jB
	 8Wi27iw1ls6YTTVHt/NyrA8uj8766MrsxulcasaRyntfyI6lfIChg49rXdXflb9i6i
	 HU1ZTSqwtDQVFX/BJ1NNDHdPrBRGI4Yd/+8uDlsdoj6OmgoNXSe03cy6DMowU1BSIM
	 uP6DZ7i0dMk0Zv+FG12HRGE9w/fh3UXHK0bH5nIeha0Af3zgbx1zgQW9XwGxufF2Yt
	 0eY+G0pvXb2NE/kAS9OU8bWqWahqmr2f4ja00dnrYCC91H8/bkO+xEHKLOyDgoJEtV
	 Fg/d9gtlvJGqQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v1 3/7] RISC-V: split early & late of_node to hartid mapping
Date: Thu,  4 May 2023 19:14:22 +0100
Message-Id: <20230504-wrongful-unvaried-d4588e49df5d@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3273; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=mqXlw0fgDUn4br2UCAGz540cPsRpVLpHCsPCQP13VEQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCnBX/9l/l5VrbIpLWiuXZGU3sbuO7GzLrTPXPsmWVn+j alvbP/9jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk6TJGhheLp/1UnCDG0yqY MavoUPzffC7B1ctezl7sc6uwUO9TznNGhp92nlIFU6RjQ6OdZovNkApWWcifek33ZpP0/8MO4X0 9DAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_111538_375154_FE65F183 
X-CRM114-Status: GOOD (  15.54  )
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
Cc: conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Some back and forth with Drew [1] about riscv_fill_hwcap() resulted in
the realisation that it is not very useful to parse the DT & perform
validation of riscv,isa every time we would like to get the id for a
hart.

Although it is no longer called in riscv_fill_hwcap(),
riscv_of_processor_hartid() is called in several other places.
Notably in setup_smp() it forms part of the logic for filling the mask
of possible CPUs. Since a possible CPU must have passed this basic
validation of riscv,isa, a repeat validation is not required.

Rename riscv_of_processor_id() to riscv_early_of_processor_id(),
which will be called from setup_smp() & introduce a new
riscv_of_processor_id() which makes use of the pre-populated mask of
possible cpus.

Link: https://lore.kernel.org/linux-riscv/xvdswl3iyikwvamny7ikrxo2ncuixshtg3f6uucjahpe3xpc5c@ud4cz4fkg5dj/ [1]
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/processor.h |  1 +
 arch/riscv/kernel/cpu.c            | 22 +++++++++++++++++++++-
 arch/riscv/kernel/smpboot.c        |  2 +-
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 94a0590c6971..3479f9fca4b0 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -75,6 +75,7 @@ static inline void wait_for_interrupt(void)
 
 struct device_node;
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hartid);
+int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hartid);
 int riscv_of_parent_hartid(struct device_node *node, unsigned long *hartid);
 
 extern void riscv_fill_hwcap(void);
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index f4dadbfecd04..7030a5004f8e 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -20,6 +20,26 @@
  * isn't an enabled and valid RISC-V hart node.
  */
 int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
+{
+	int cpu;
+
+	*hart = (unsigned long)of_get_cpu_hwid(node, 0);
+	if (*hart == ~0UL) {
+		pr_warn("Found CPU without hart ID\n");
+		return -ENODEV;
+	}
+
+	cpu = riscv_hartid_to_cpuid(*hart);
+	if (cpu < 0)
+		return cpu;
+
+	if (!cpu_possible(cpu))
+		return -ENODEV;
+
+	return 0;
+}
+
+int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *hart)
 {
 	const char *isa;
 
@@ -28,7 +48,7 @@ int riscv_of_processor_hartid(struct device_node *node, unsigned long *hart)
 		return -ENODEV;
 	}
 
-	*hart = (unsigned long) of_get_cpu_hwid(node, 0);
+	*hart = (unsigned long)of_get_cpu_hwid(node, 0);
 	if (*hart == ~0UL) {
 		pr_warn("Found CPU without hart ID\n");
 		return -ENODEV;
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 445a4efee267..626238200010 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -81,7 +81,7 @@ void __init setup_smp(void)
 	cpu_set_ops(0);
 
 	for_each_of_cpu_node(dn) {
-		rc = riscv_of_processor_hartid(dn, &hart);
+		rc = riscv_early_of_processor_hartid(dn, &hart);
 		if (rc < 0)
 			continue;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
