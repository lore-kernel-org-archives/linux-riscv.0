Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4A2EE01E3
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Sep 2023 16:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlVPu81OAF9MVxEglnII+89tG2YF0j7TitXswe+nObo=; b=rt2wsvLzqd1nwc
	ecYuIi5sKpXLYggYUFsunWblANyjaYcNr4WOw5vkWU8yf7NcDRN+wT8SDSmvw9jD/yyt39xm8w1Uh
	E8/+FBhjI2Bns1c7vY5n2TnrzgtkSjNRqcKuC4mOXmj8yyTH93g/l1Ebn2BBHTQJNHyRq0Q12SPPY
	U73uVPF2BnB+mbZEhrZVomgTsEUX4fHyrGKgLHy1Sm4GUJBBaP7xIrLCLADqzmZmR+T6DAj00vesl
	MdPCmt/DUgupm7C3B5VY8z4kbv//r7vcog1dkJesAX2iNg3ECrGXJCgf1YrJpGDAVV8aEa0M8a/yI
	CrAKNvtNo7GWU7BTOKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSus-006MOy-1m;
	Wed, 13 Sep 2023 16:40:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgSth-006LEp-36;
	Wed, 13 Sep 2023 16:39:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35227FEC;
	Wed, 13 Sep 2023 09:40:02 -0700 (PDT)
Received: from merodach.members.linode.com (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3A6373F5A1;
	Wed, 13 Sep 2023 09:39:23 -0700 (PDT)
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
Subject: [RFC PATCH v2 16/35] ACPI: processor: Register CPUs that are online, but not described in the DSDT
Date: Wed, 13 Sep 2023 16:38:04 +0000
Message-Id: <20230913163823.7880-17-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230913163823.7880-1-james.morse@arm.com>
References: <20230913163823.7880-1-james.morse@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_093926_091500_F278D3DB 
X-CRM114-Status: GOOD (  13.06  )
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
---
 drivers/acpi/acpi_processor.c | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index b4bde78121bb..a01e315aa16a 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -790,6 +790,25 @@ void __init acpi_processor_init(void)
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
