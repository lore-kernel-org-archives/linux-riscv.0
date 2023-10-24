Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34C1C25B48
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lob5aExvo4n6402Au0GGOyTc2AXpfBcGaVeX9H/gaD4=; b=lpPGhKbhR9zt4O
	BQfhq7pm3O6LE8mjsLMDY+PYBXuYSY+10Dz1/Fef+Q3/Ht1GFLd8kY3CltjarhKaKc4mB0LSc6uvA
	ofFo49Ii5KXAQUNjieXg/VtdUDuXcG8Emy58HQaaqIGDr31YVPzugbwQhXo2Z6mBLP3vZSwiUNnyr
	gNpLuPfgcJsVmr8YsH/Yevb4hdepfTQulEDTi9mlpJ9/OqV3jUpGnlx5TV6JyDcN1Rt2a2KQTexev
	Uxids3EbFHG4SZj097sv3OW+Qw+ft/i81+DwYT7lklZxzQ5dijD9DqgihBGtF2E6dKwnR7RN7eRo+
	5osSEIUO8m7gtbaHuCwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJDB-00AIRb-1E;
	Tue, 24 Oct 2023 15:20:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJB7-00AGZR-2i;
	Tue, 24 Oct 2023 15:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=CNWnC0tTNPuhROu5TZS+GHZycyp85uHcS0xNgApILVE=; b=ckPiwQFecGpoauE7oZ1OhyRBW9
	rLjrE+7P4yxRTPK/sFpU5Gmgc8pkX7UvY3b3BuPAlF9Lg1YdQcl15ZKe0klP0UWn7RkE9oCSWTzLB
	GNeMMu5NUmxIWUsLIYacEtjgkcscTEJKaDMgI2neP7VKyJ4PwP2jmIyEG1NY+iAIl7m0Y2u4+ch47
	6ygzhTqawUfS11EE0kJ3D3YXRzldiEFtFdBTfs7T6+6035NscLOmfyOZ3/s6A80tfut0t8WDke05h
	gH7Rx9/Mzyag1HNqrTkrdxELgqWcHpKPQFeCsuYxo86BFAywbGB084DGIcWhmmhMZblwuwU2jqIP2
	NxDxcpjw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJB3-00FbIy-1U;
	Tue, 24 Oct 2023 15:18:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CNWnC0tTNPuhROu5TZS+GHZycyp85uHcS0xNgApILVE=; b=auysF/6+X5CraAmh0uKYn72RQz
	MfQ+xLXff/KeM/31BhutwoZlcL72VsQbyxNYq3dpn94RmvR3gmzahgotSLculfToabojp6EEyZ2qn
	gXb3+IOXviSlZB5Ikl332rb1KTNxRoI5072LJ+ChkAjxkM27BbXg+AqqA/PxH+e2ygHzHJSJHw6SU
	vLfpoLPWMHOeYX4g2KpWnoemI9zro0jUoTZLXP6R2edTeTUsYq8Ze5avqgEzJbM5Ei4p0XiHDyeVz
	GHzWsDQ1wGF4QbSlov9XA7q6VRoK6bL26dLVpFHWC461tnoZhCn0U3vH5yjb9eMKKJF6sg9i97tGe
	V+h4AODw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:53116 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJAt-0004UN-31;
	Tue, 24 Oct 2023 16:18:32 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJAv-00AqRY-CI; Tue, 24 Oct 2023 16:18:33 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>
Subject: [PATCH 28/39] ACPI: Warn when the present bit changes but the feature
 is not enabled
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJAv-00AqRY-CI@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:33 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161841_650899_929C1911 
X-CRM114-Status: GOOD (  12.83  )
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

From: James Morse <james.morse@arm.com>

ACPI firmware can trigger the events to add and remove CPUs, but the
OS may not support this.

Print an error message when this happens.

This gives early warning on arm64 systems that don't support
CONFIG_ACPI_HOTPLUG_PRESENT_CPU, as making CPUs not present has
side effects for other parts of the system.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v2:
 * Update commit message with suggestion from Gavin Shan
---
 drivers/acpi/acpi_processor.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 19fceb3ec4e2..b7a94c1348b0 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -189,8 +189,10 @@ static int acpi_processor_make_present(struct acpi_processor *pr)
 	acpi_status status;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
+		pr_err_once("Changing CPU present bit is not supported\n");
 		return -ENODEV;
+	}
 
 	if (invalid_phys_cpuid(pr->phys_id))
 		return -ENODEV;
@@ -462,8 +464,10 @@ static void acpi_processor_make_not_present(struct acpi_device *device)
 {
 	struct acpi_processor *pr;
 
-	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
+		pr_err_once("Changing CPU present bit is not supported");
 		return;
+	}
 
 	pr = acpi_driver_data(device);
 	if (pr->id >= nr_cpu_ids)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
