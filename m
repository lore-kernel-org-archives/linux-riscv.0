Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8449AEE01E0
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/R/yTwbpFbHzftBuM8H3Ypk7ZWMImZJHZblOGCTiBQ=; b=sqoDwB2L+PuE+R
	1bVLt+N1oceAXOX6BptH+jMwKlfoS6ihwS9UHTqYvBRHgr8zcxUOMBr0pZv8w7RYw82CrK3o8/EVr
	4WZNbSkHLF0dgOQopyAnP1QILNN87W6BEj0mASDbKwPPMU1p+p9BobPQ2r9c45FppENec0JMoZcDN
	gKXuSCafWMncyzLXrDTrNQ/OdjkPpyzqRKOdg760/B8Sc25RzziC+f3R79uonbnsC95e0yuGVTtfO
	rvUMvEo6eGopntR8tTK0VSgmZSt36vs6w05DEkjxiZLZWHFDrt9to45VutkXLehRBcTCVYejO6PqY
	ZMTXVmS/KUekqJ70tFwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSuz-006MVm-2Q;
	Wed, 13 Sep 2023 16:40:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgStj-006LDV-0n;
	Wed, 13 Sep 2023 16:39:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33FD11FB;
	Wed, 13 Sep 2023 09:40:04 -0700 (PDT)
Received: from merodach.members.linode.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3895B3F5A1;
	Wed, 13 Sep 2023 09:39:25 -0700 (PDT)
From: James Morse <james.morse@arm.com>
To: linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	kvmarm@lists.linux.dev
Cc: x86@kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Russell King <linux@armlinux.org.uk>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com,
	justin.he@arm.com
Subject: [RFC PATCH v2 17/35] ACPI: processor: Register all CPUs from acpi_processor_get_info()
Date: Wed, 13 Sep 2023 16:38:05 +0000
Message-Id: <20230913163823.7880-18-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093927_349519_931DE6F0 
X-CRM114-Status: GOOD (  16.20  )
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

To allow ACPI to skip the call to arch_register_cpu() when the _STA
value indicates the CPU can't be brought online right now, move the
arch_register_cpu() call into acpi_processor_get_info().

Systems can still be booted with 'acpi=off', or not include an
ACPI description at all. For these, the CPUs continue to be
registered by cpu_dev_register_generic().

This moves the CPU register logic back to a subsys_initcall(),
while the memory nodes will have been registered earlier.

Signed-off-by: James Morse <james.morse@arm.com>
---
 drivers/acpi/acpi_processor.c | 13 +++++++++++++
 drivers/base/cpu.c            |  2 +-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index a01e315aa16a..867782bc50b0 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -313,6 +313,19 @@ static int acpi_processor_get_info(struct acpi_device *device)
 			cpufreq_add_device("acpi-cpufreq");
 	}
 
+	/*
+	 * Register CPUs that are present.
+	 * Use get_cpu_device() to skip duplicate CPU descriptions from
+	 * firmware.
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
index d31c936f0955..677f963e02ce 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -537,7 +537,7 @@ static void __init cpu_dev_register_generic(void)
 {
 	int i, ret;
 
-	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES))
+	if (!IS_ENABLED(CONFIG_GENERIC_CPU_DEVICES) || !acpi_disabled)
 		return;
 
 	for_each_present_cpu(i) {
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
