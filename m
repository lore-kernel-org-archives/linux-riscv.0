Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07248C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:19:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ObVXkkispeKOKa8IWrErdagEjyAgkZQiwmi7i8zj1eA=; b=kz0jNhIoWgftvb
	HRYLs/mdWCMqyCR3HOHZ6+PEyzt+Gpjqp6TWVYvdUMdhJp5rDneNiqr9ysby8RgsQlnCXEzJJCYVg
	uUrbopc0uDx/HAx8tzZDrVKwHfMbkEgmo/blVYSEZm7PS051TI5BsPsyPzgIdgW3r6hHLet5r1HlO
	eTfJoylR/8TWUDxYUNsMpVOIZe8cRANvQsJVuQI+0MLkiUOBsHOmaF/Fc/7gVAnLjQSIxeC2AIm9W
	73qePlwWfxx7AmMdVf6DOXKiR+uQLKQ51d+urbNUX+0UdpKjFdYPjZdeCujSkiy0F4CHbS8x8UaR3
	yd9eoaa0eoDOaziGu1Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBk-00AHCA-2j;
	Tue, 24 Oct 2023 15:19:24 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAW-00AFxu-2A;
	Tue, 24 Oct 2023 15:18:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=43MF1NLwRNfhTgg1mkqqRfKprjgdwDcm6G/emV9tDl0=; b=g7ptT6QiSfF8xD2ND6deIcduSx
	1oWNNs2RIYv1m/RJRwbVluHdBvhGUL4sFxBJbBarfzI9j3A0AaPicP3V7vnTwiC+1Crz5pD4H6Nft
	FRD4WrEAWEOoIdWEHVMlecdkHW4pnDuYuRlMEVHxzA9OEEcYXVpMxsLek0LaMaMDK+VDh/vgUmmVl
	zt1jroD3eg5bIY/ABoCikdb7n56d6qlDOk6G/yAspE2zGPnfET5SjHWeEl4ofjtNMiKpuYh+27w8l
	wT87KnyhkgzH6q2bYlY2sJbjZuQQa4MPj1xYVxqhh/Xfh1q/51K2Ghc/azqacAC5+y+ZbcaJQFw5V
	hQsCbhfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50178 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJAJ-0004S0-2s;
	Tue, 24 Oct 2023 16:17:55 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJAL-00AqQs-BF; Tue, 24 Oct 2023 16:17:57 +0100
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
	Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 21/39] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJAL-00AqQs-BF@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:17:57 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081808_719569_9947480C 
X-CRM114-Status: GOOD (  15.77  )
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

To allow ACPI to skip the call to arch_register_cpu() when the _STA
value indicates the CPU can't be brought online right now, move the
arch_register_cpu() call into acpi_processor_get_info().

Systems can still be booted with 'acpi=off', or not include an
ACPI description at all. For these, the CPUs continue to be
registered by cpu_dev_register_generic().

This moves the CPU register logic back to a subsys_initcall(),
while the memory nodes will have been registered earlier.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v2:
 * Fixup comment in acpi_processor_get_info() (Gavin Shan)
 * Add comment in cpu_dev_register_generic() (Gavin Shan)
---
 drivers/acpi/acpi_processor.c | 12 ++++++++++++
 drivers/base/cpu.c            |  6 +++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 0511f2bc10bc..e7ed4730cbbe 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -314,6 +314,18 @@ static int acpi_processor_get_info(struct acpi_device *device)
 			cpufreq_add_device("acpi-cpufreq");
 	}
 
+	/*
+	 * Register CPUs that are present. get_cpu_device() is used to skip
+	 * duplicate CPU descriptions from firmware.
+	 */
+	if (!invalid_logical_cpuid(pr->id) && cpu_present(pr->id) &&
+	    !get_cpu_device(pr->id)) {
+		int ret = arch_register_cpu(pr->id);
+
+		if (ret)
+			return ret;
+	}
+
 	/*
 	 *  Extra Processor objects may be enumerated on MP systems with
 	 *  less than the max # of CPUs. They should be ignored _iff
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index d31c936f0955..6c70a004c198 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -537,7 +537,11 @@ static void __init cpu_dev_register_generic(void)
 {
 	int i, ret;
 
-	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
+	/*
+	 * When ACPI is enabled, CPUs are registered via
+	 * acpi_processor_get_info().
+	 */
+	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES) || !acpi_disabled)
 		return;
 
 	for_each_present_cpu(i) {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
