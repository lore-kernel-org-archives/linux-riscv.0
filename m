Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 489ACC25B6F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HcCLltEb8qh5FRYlDDr6z+fRPk8oXYGvafmP8DStLw=; b=F9N6SEVhHdUN7Z
	6yknUaLH+xfq23r3GOHnhAu0xWiICf5H9yBmn3VT5ecdKeb1Nrkf/9L6Du48cEejJeyYOf3OY+tPV
	OS2F/q+xZ7SEptDdafHWLsTTw9Ddg+Q3RunsMSdoWE8sGNQMGN3ov+EN2o5kDDiZ8ngeVioIH9nTk
	ykj+rCxf3cR6ZYEJtG+lESKHZmVn1FInhYCjf67UJN5jQ7443WfHkkP2A8/uJZAZ4bMddi2YrX8Y9
	wpwWlp5Hk08ghHAVA0zTpRFaryIPNQ5jA3MOTaBrWdYBY5i9ygI57EnKeMt6xZckrRZVNTgARId4x
	c7eN7QzRXVp4h7AOzFcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBb-00AH1p-0U;
	Tue, 24 Oct 2023 15:19:15 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAW-00AFxb-16;
	Tue, 24 Oct 2023 15:18:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WbkJcP8EfdoxIJZCXfcMKFVW/i0XQ0H+6U5ilPscurM=; b=UFpyf7IBgalvU1WbMK4uFsjopi
	n3QYxKYZyHK3GPF00+ghNLXiOFCtl6pp8wlAjZdeBBo+1hsVMpqhTFYqVSDnaXMgPqZAaLKwUQiDG
	9uvr3egTxe1FOV02vpFPdUDsfkp9i6U6JHam5QzXbOYxN7X33nA9s439YqSld4/s9jCJov8XGKHL+
	JNp7n/Wabc3e93CgHUO+oxPhtxw4O4WRPce1ABFGYGzKuH5/kRJqlr0K6ewJyURrQiZVlLdhSRdP7
	w3C055XibslaZrjOpVNLKJDdeaJjqxnvqA4rMmD9NMA6hA95tQ/sT/XqTlIor9TKsrxuKAy4xVBXP
	pfpMPhIg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36712 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJAE-0004Rl-2N;
	Tue, 24 Oct 2023 16:17:50 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJAG-00AqQm-6R; Tue, 24 Oct 2023 16:17:52 +0100
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
Subject: [PATCH 20/39] ACPI: processor: Register CPUs that are online, but not
 described in the DSDT
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJAG-00AqQm-6R@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:17:52 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081808_409591_63F6EFD3 
X-CRM114-Status: GOOD (  12.93  )
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

ACPI has two descriptions of CPUs, one in the MADT/APIC table, the other
in the DSDT. Both are required. (ACPI 6.5's 8.4 "Declaring Processors"
says "Each processor in the system must be declared in the ACPI
namespace"). Having two descriptions allows firmware authors to get
this wrong.

If CPUs are described in the MADT/APIC, they will be brought online
early during boot. Once the register_cpu() calls are moved to ACPI,
they will be based on the DSDT description of the CPUs. When CPUs are
missing from the DSDT description, they will end up online, but not
registered.

Add a helper that runs after acpi_init() has completed to register
CPUs that are online, but weren't found in the DSDT. Any CPU that
is registered by this code triggers a firmware-bug warning and kernel
taint.

Qemu TCG only describes the first CPU in the DSDT, unless cpu-hotplug
is configured.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/acpi/acpi_processor.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 6a542e0ce396..0511f2bc10bc 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -791,6 +791,25 @@ void __init acpi_processor_init(void)
 	acpi_pcc_cpufreq_init();
 }
 
+static int __init acpi_processor_register_missing_cpus(void)
+{
+	int cpu;
+
+	if (acpi_disabled)
+		return 0;
+
+	for_each_online_cpu(cpu) {
+		if (!get_cpu_device(cpu)) {
+			pr_err_once(FW_BUG "CPU %u has no ACPI namespace description!\n", cpu);
+			add_taint(TAINT_FIRMWARE_WORKAROUND, LOCKDEP_STILL_OK);
+			arch_register_cpu(cpu);
+		}
+	}
+
+	return 0;
+}
+subsys_initcall_sync(acpi_processor_register_missing_cpus);
+
 #ifdef CONFIG_ACPI_PROCESSOR_CSTATE
 /**
  * acpi_processor_claim_cst_control - Request _CST control from the platform.
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
