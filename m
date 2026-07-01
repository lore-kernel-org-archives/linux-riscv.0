Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 721ABC44500
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2026 14:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pG3iPeYvQYoxdlBjNN9Fn/nUEy4Bpzv+qrxyHbyC16A=; b=lQ73wS/Fduvt9v
	7746IP6R9YmraBOxaWMcmVd2/0bOIaaQqJvUWQ3rKgYkOzhaQJ3+TMiDohGTyfTML3yH8R58C1VP0
	W+nrrs/KWqoUlyNaWm+IOgPTaQ04SOgk5EBchvh94nCq90OUyxSsthU8ysQZjKrYXqcEqFJns7Bze
	0EOY1jh6tNiAbCM+HAxEDiXWVcuVNudHukKBDqIknntPoEo5p1GpUvIoCtEs7rhTnj2uZIjVRiQQR
	FBCMA2jIKrQ0nDzds/Sr6OzmYfp7B5tK6va8cTBcVja77O1KfIJ089LbzI1zvyMtb9DZVewn1KNfE
	MXYNF1y64bJHzvZNu4ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5q-00000002JUW-37ze;
	Wed, 01 Jul 2026 14:39:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wew5p-00000002JTY-1Nh9;
	Wed, 01 Jul 2026 14:39:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C7B7414C5;
	Wed,  1 Jul 2026 14:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C34DC1F000E9;
	Wed,  1 Jul 2026 14:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782916753;
	bh=Aezc9O//egGLmPy5XC3coGY0bf/LgusaY72KiGQRYwM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=eRncNVWfF3SYwCxob/YAFldce/QWlteAe5ePPFpM/PnpcFZ6IBh7lYJJwmFP9QWua
	 JRhl2kr8fjGXF0u3qoNGDBlxqdpeopSlW7qivNzyM+3wzg9MiRzbpgmqlVdGo5JSz7
	 3iMK/TV97EU/gUFuNSGMI4GgAj1bc3nEuA2P4CpfQKyiJKmcDvJqW/jbNgjOXHQbte
	 m+gBtUQYMOw6XJgPB4Q92KyFWmMqyn1H9fxVCNTjpSJhLY4DinUxgE1ZaRdZ88JIO9
	 rrSXNwo6Gvizhtq5Sk0NHoSjaRY64rYybqUa3ldcW+5fzaR7ksanJurP9SxyW4QUlt
	 mSQaCs2hBycpg==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Wed, 01 Jul 2026 16:38:50 +0200
Subject: [PATCH v3 2/7] ACPI: RISC-V: Fix riscv_acpi_irq_get_dep() loop
 termination
MIME-Version: 1.0
Message-Id: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-2-c5562cf0fe29@kernel.org>
References: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
In-Reply-To: <20260701-gic-v5-acpi-iwb-probe-deferral-v3-0-c5562cf0fe29@kernel.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Sunil V L <sunilvl@ventanamicro.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Hanjun Guo <guohanjun@huawei.com>, 
 Sudeep Holla <sudeep.holla@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 loongarch@lists.linux.dev, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>
X-Mailer: b4 0.15.2
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

In riscv_acpi_add_irq_dep() the main loop condition would currently stop
the loop if an interrupt descriptor contains an interrupt for which the
respective GSI handle is NULL, which is not correct because subsequent
interrupts in the interrupt descriptor might still have a GSI dependency
that must not be skipped.

Rework riscv_acpi_add_irq_dep() and the riscv_acpi_irq_get_dep() call chain
to fix it - by not forcing the loop to stop in order to guarantee
dependency detection for all the interrupt entries in the CRS descriptor.

Fixes: 1b173cc4bfcd ("ACPI: RISC-V: Implement function to add implicit dependencies")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Tested-by: Sunil V L <sunilvl@oss.qualcomm.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index 9b88d0993e88..cd83c3035cf6 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -299,6 +299,7 @@ static acpi_status riscv_acpi_irq_get_parent(struct acpi_resource *ares, void *c
 			return AE_OK;
 
 		ctx->handle = riscv_acpi_get_gsi_handle(eirq->interrupts[ctx->index]);
+		ctx->rc = 0;
 		return AE_CTRL_TERMINATE;
 	}
 
@@ -314,10 +315,8 @@ static int riscv_acpi_irq_get_dep(acpi_handle handle, unsigned int index, acpi_h
 
 	acpi_walk_resources(handle, METHOD_NAME__CRS, riscv_acpi_irq_get_parent, &ctx);
 	*gsi_handle = ctx.handle;
-	if (*gsi_handle)
-		return 1;
 
-	return 0;
+	return ctx.rc;
 }
 
 static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
@@ -381,8 +380,11 @@ static u32 riscv_acpi_add_irq_dep(acpi_handle handle)
 	int i;
 
 	for (i = 0;
-	     riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
+	     !riscv_acpi_irq_get_dep(handle, i, &gsi_handle);
 	     i++) {
+		if (!gsi_handle)
+			continue;
+
 		dep_devices.count = 1;
 		dep_devices.handles = kzalloc_objs(*dep_devices.handles, 1);
 		if (!dep_devices.handles) {

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
