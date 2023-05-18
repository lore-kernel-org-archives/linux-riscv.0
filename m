Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F1EEC77B7D
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 22:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FUdl6g1O2CauwxRbJIneqRLqsY9hZurqYc2+VqBU9tM=; b=HYFpuO7PspUE1j
	ANQ9ShDdRGG/Wyu0I0DHX3Ytb1IRstNhqPVi+LYl9T+Rvs9SaoN/2lPOq6EINC0hUPGadTDexNDFH
	c30Ae7ZUwmVOePY54TXnDiINycymi52FMqNQ8mOlnvOawS1b6ERNwkUoYPGv51e/R+DJ2iDS+gOxG
	Wtv/BCG9lWGE/Yltx79kftKy8SWuAMm0UQL5/HavxbLrVUS2wDq22Q19jABPkWUd1S2V+WWYxTV0f
	XtEfvnioaD8QYi/XI6BUiY+Ucq1ZGWW1zPuC/adeh2WLuOjfzqRWy3i5fVUuqDz3RPaS0oUczRz2O
	xEFf/hV+2HzGytOLcKsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI6-00ENMl-2a;
	Thu, 18 May 2023 22:40:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzmI2-00ENLw-2c
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 22:40:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 681F3652B3;
	Thu, 18 May 2023 22:40:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0236C4339B;
	Thu, 18 May 2023 22:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684449605;
	bh=fNH0U0ddPL23+LjG48XKUMBUKxpBGJCAGbRKa87Ufl4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dbiFitFBc7gFgnhgzVC5lXQv2V2vK7sJQX8iNAZ4RKobb2GsUuZukbt3dQS43017b
	 jX2q02gTlgMzLA8sxX98q3xGLHyF67y0YgXs5pG6Q9eBZC1Q7s302V+257+/sYiQ9/
	 DjPuUci2qYzvEMKcZcEs1eyqqAtUpnKBSSBMdVgcuC1xFgeAjYewR1QRO5Ary58hYl
	 y55p8Y51EpCY/WQzxYE2RyGGgACUE99VNS4731zg5cQ8gck0ECk/6nxmSdclFPyVhJ
	 vso8lJiyY5+iTm/2GAKyhrjbnyHRAbKqWc2R+IFzb6FdCXx5/65kywCbvfE30PIxwX
	 GWo9jLSRFWDkA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v2 2/8] RISC-V: only iterate over possible CPUs in ISA string parser
Date: Thu, 18 May 2023 23:39:03 +0100
Message-Id: <20230518-stratus-book-ceb796b447b3@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-moneybags-rebalance-1484db493d6a@spud>
References: <20230518-moneybags-rebalance-1484db493d6a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2387; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gfrG6vfeIhkGsSfvYittGSJQ3UDpu1c3P9oIItwWh6Y=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpK9k3bjZd48/KpeDh0n6EfeIaNqakx/KVhqG7BMSLb AK7jb91lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCL63Az/Y45xMts0LvPelcYX LOeq6SMa8+1d1HvbFLdLEkbJx7/8Z2Ro9wi5JiR2c/2GpVk/tk754SH5/+TLVZpORfy+Z3b+jHn DAgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_154006_921633_99A34862 
X-CRM114-Status: GOOD (  14.38  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Sunil V L <sunilvl@ventanamicro.com>

During boot we call riscv_of_processor_hartid() for each hart that we
add to the possible cpus list. Repeating the call again here is not
required, if we iterate over the list of possible CPUs, rather than the
list of all CPUs.

The call to of_property_read_string() for "riscv,isa" cannot fail
either, as it has previously succeeded in riscv_of_processor_hartid(),
but leaving in the error checking makes the operation of the loop more
obvious & provides leeway for future refactoring of
riscv_of_processor_hartid().

Partially ripped from Sunil's ACPI support series, with the logic
inverted to continue early on failure.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 00df7a3a3931..3ae456413f79 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -12,6 +12,7 @@
 #include <linux/memory.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <asm/alternative.h>
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
@@ -99,7 +100,7 @@ void __init riscv_fill_hwcap(void)
 	char print_str[NUM_ALPHA_EXTS + 1];
 	int i, j, rc;
 	unsigned long isa2hwcap[26] = {0};
-	unsigned long hartid;
+	unsigned int cpu;
 
 	isa2hwcap['i' - 'a'] = COMPAT_HWCAP_ISA_I;
 	isa2hwcap['m' - 'a'] = COMPAT_HWCAP_ISA_M;
@@ -112,15 +113,19 @@ void __init riscv_fill_hwcap(void)
 
 	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
 
-	for_each_of_cpu_node(node) {
+	for_each_possible_cpu(cpu) {
 		unsigned long this_hwcap = 0;
 		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
 
-		rc = riscv_of_processor_hartid(node, &hartid);
-		if (rc < 0)
+		node = of_cpu_device_node_get(cpu);
+		if (!node) {
+			pr_warn("Unable to find cpu node\n");
 			continue;
+		}
 
-		if (of_property_read_string(node, "riscv,isa", &isa)) {
+		rc = of_property_read_string(node, "riscv,isa", &isa);
+		of_node_put(node);
+		if (rc) {
 			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
 			continue;
 		}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
