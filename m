Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04CD6C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 08:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3IvfccR1qwrjJjL5aGfxDJ5qZK6EktikKyTiq2W8iUk=; b=slW9B2zdM4BRZB
	w03YYk2blLxRn3AcIQR/K6aOaWiiqK+r/kkid8jcGlR9/iMTO+iWjOET0Pi+8Ecz7CFIHzRRqbdjL
	WoMtEHQFAKQORLVlTgX2JZMwipFBY41vSI3n4WYke7RJs9I7MDtOTPflx0Y81gU5dL1Vc5XwNFQMv
	ldKnrjNXTXNfOABru0q5Rip+j8xXnxUxovYprzzDkCcB0WUESsrWj4Eg5dUYx7f4wK7Ivsy7gMnJJ
	kVAyTkyHFCUBd/7x89c9F2r+sEaNNE4CGvly1E1J0mwKvYIKlL4gQTY5SZv1n24Cu0EmPPxE8EcuJ
	f96eaJLKmfAwUuyOBhPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkJq-00000001S1X-3qXF;
	Thu, 09 Jul 2026 08:41:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whkJp-00000001S0C-0uqx;
	Thu, 09 Jul 2026 08:41:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7501A6001A;
	Thu,  9 Jul 2026 08:41:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E78F01F00A3F;
	Thu,  9 Jul 2026 08:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783586476;
	bh=qsG5euQizl6EykCVTiNXyXX26Cg/4JUOavNuAu0VDOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=UkBIbx0Si1jtMXEu5WTm/aUb+fhGLVJaaNVPmQ/LpOfxlV4lesWQDvJ7A5OkIYdkz
	 Qt0vV59V7I6z2judkBQ7YJECbKCrNzD1DJYAktyRVuMek1QjexXhGn4x9eQLIKzBv2
	 cZhsmATuv6YMIOgtfbUj7Dxii83fNesVyVp+P3a16BhXzZVsLYJc9BcW2dmSvJTp13
	 HdCgeSp1m3H9ywop4TE7K9O69MYAuWPk+Ys30NPeW3IOPGHS+igqHl7/m1IZMji6aZ
	 DlgaxvrzPFgYn6INvwiaJiTy8qF9xpUHd38Z1Bk2nYTiKJIlyHOb/0wOmp2/iePN2T
	 lj+ihhng2juZA==
From: Lorenzo Pieralisi <lpieralisi@kernel.org>
Date: Thu, 09 Jul 2026 10:40:13 +0200
Subject: [PATCH v4 3/7] ACPI: RISC-V: Check acpi_get_handle() status in
 riscv_acpi_add_prt_dep()
MIME-Version: 1.0
Message-Id: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-3-48dae790f871@kernel.org>
References: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
In-Reply-To: <20260709-gic-v5-acpi-iwb-probe-deferral-v4-0-48dae790f871@kernel.org>
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

In riscv_acpi_add_prt_dep(), the acpi_get_handle() call can fail which
would leave link_handle uninitialized.

Fix it by checking the acpi_get_handle() return status and skip the entry
if it fails.

Fixes: 1b173cc4bfcd ("ACPI: RISC-V: Implement function to add implicit dependencies")
Signed-off-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
Tested-by: Sunil V L <sunilvl@oss.qualcomm.com>
Reviewed-by: Sunil V L <sunilvl@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/riscv/irq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index cd83c3035cf6..75170151c614 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -339,7 +339,9 @@ static u32 riscv_acpi_add_prt_dep(acpi_handle handle)
 	entry = buffer.pointer;
 	while (entry && (entry->length > 0)) {
 		if (entry->source[0]) {
-			acpi_get_handle(handle, entry->source, &link_handle);
+			status = acpi_get_handle(handle, entry->source, &link_handle);
+			if (ACPI_FAILURE(status))
+				continue;
 			dep_devices.count = 1;
 			dep_devices.handles = kzalloc_objs(*dep_devices.handles,
 							   1);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
