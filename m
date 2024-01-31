Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C0B0C48285
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 18:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Li84DsNWBwwAUr8VVgTQTOsV3N1RtSJXJ9M9hie8LE=; b=lguADOTZVwJOUf
	txGQqm78sWlo3XVjIeZYbZT4G0yRKdMLh8qaQL7oqXmKuI3IG1/2znYY9ffm+CUAxNqruV02X94MI
	uR6WWMRiItRWGOowr+Zyx3bElDqWNNxwycKHtiFhOTYWuUrjCMt5xTlzico7jJ05gjRxMRvnrVLHA
	2qf7GlgsDNQmCC9fweRvk7fKtryalMNSZBm9nPHkYgClDnmM7EHx171uH2h1NIjHtrCSSFp4gJIGb
	uGRSvNSEeJoTCa1Fx2dCCOQTa2zL+imO53xgSnNaW87sQsi5Pw+1UdHWkDL/f59wcGHbwAL6dbFhR
	GZIA3dUUCrNdzYhCLucA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVEu8-00000004yCz-0XHB;
	Wed, 31 Jan 2024 18:01:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDmi-00000004dMQ-0vAF;
	Wed, 31 Jan 2024 16:50:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4FviDP8LNcs5OH9XS9Lgt79F5tF9VpTSbqPgMlkIJeQ=; b=a8T9+UFZh5Erxcl19hYu8LnPoN
	l8jkJTCH5Aga8DZg+RD7ezbHyq4OQdeKkSD6hzIRhev0EyFHx6P+dy6aq64Behg6QOGcwrXp31PcU
	6AfPX8Jas4MhwqjfgDzG/9B7RObj1s/1widKHmpuiUi0IxczEPWs+On8ceu+z7LWHVipSzrH9j+MH
	aVvsx/9nVkddyN/EWYjMHlRk9wKElTZSmbUv2SfQdepcYbj+SFzv+s4g5BVbd1CpZAAuNL4pp1eWO
	8kBc76pSd4xlVd4TjgTaVkulutmldzJsN1KRBnCwIlrQ+A3b+5ptlUeZJLMI+uVTpzpitQ9YbzG+U
	gmLrm9EQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36844 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rVDmV-0003Tf-2S;
	Wed, 31 Jan 2024 16:49:47 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rVDmU-0027YP-Jz; Wed, 31 Jan 2024 16:49:46 +0000
In-Reply-To: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk>
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
	 acpica-devel@lists.linuxfoundation.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	 Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
	 "Rafael J. Wysocki" <rafael@kernel.org>
Subject: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from
 acpi_processor_get_info()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
Date: Wed, 31 Jan 2024 16:49:46 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_085000_285660_9D87BADA 
X-CRM114-Status: GOOD (  15.60  )
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
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
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
index cf7c1cca69dd..a68c475cdea5 100644
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
index 47de0f140ba6..13d052bf13f4 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -553,7 +553,11 @@ static void __init cpu_dev_register_generic(void)
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
