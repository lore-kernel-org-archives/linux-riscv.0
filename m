Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62DE7C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMkmivdicXAcYPUEyW0xd3mG9o6+hcZG5R1sgrLsnHo=; b=wHjwNfIqIabzSh
	xQKhg9QijqYvegjiJ+NF0kaMOcjSvr0P9TXSXBkAwKEkzNkPKUdfAoyhaEGimbUTkzmqXZhHhSLAq
	i6yUXl4wSAqP1icJEXdGHOOUEhBOiqSSL0vwMD+RrB+IO9o/M/0qURcLXx/kC+Ax01XUCHbhKPNj8
	qHanrJnmQssRMEoUQIlajSMrNnz55BpLoZvtU05dHK/iQtXrxiARooyX81tBI6PNzeVk1Qf1OQlcQ
	/Tb+HQJqzN18YulHnSxCC0znt+J8MM8w6i1CSDQbBJPvqawBfKwBbWZFpYg5Jy5XA3918FFFuuqQY
	GN96ikgCsKp5TB3o++Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOgq-00EeSk-01;
	Wed, 13 Dec 2023 12:50:16 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOgV-00Ee8d-22;
	Wed, 13 Dec 2023 12:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kQ4xjAWUxEG0ANx7LMdmdHmPUnFC4tC8apeLWjcG8Og=; b=X90FTAwQnBfHmSIKYLsWfRlpia
	375dpkt1T6mkAwKyEadpQymyIe0dg3/p2GwJurKcYd8p3XZRGklvmexrzgscGSrA+E2Yv6aoT86MB
	ijJOedBgttvzTKBfT9eUkiHEXrz2WuPlFfeI4lj+ac0nHIA6yBoKCgnau1V8tzQjrNKo+vgA5IvnG
	HYzMibJAtMCmVnc6CLNbKTEpSs0Y0S0suWGF9Ss1Gsl3tCiP/+CHBou3NEzC+Zl6kwj+tV2mTQjT5
	04I/JuGQif9ZoTv4TXeya3FEre5X/d4oNidSnw0HnoEtJPLc0iw3ZdEBkG4oHPQUXpWCCbPO2kXKc
	nDBjPYQw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:34582 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOgL-0008E5-0Y;
	Wed, 13 Dec 2023 12:49:45 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOgN-00DvkE-D8; Wed, 13 Dec 2023 12:49:47 +0000
In-Reply-To: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
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
	James Morse <james.morse@arm.com>
Subject: [PATCH RFC v3 07/21] ACPI: Rename acpi_processor_hotadd_init and
 remove pre-processor guards
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOgN-00DvkE-D8@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:49:47 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_044955_675196_7646A0EB 
X-CRM114-Status: GOOD (  16.09  )
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

acpi_processor_hotadd_init() will make a CPU present by mapping it
based on its hardware id.

'hotadd_init' is ambiguous once there are two different behaviours
for cpu hotplug. This is for toggling the _STA present bit. Subsequent
patches will add support for toggling the _STA enabled bit, named
acpi_processor_make_enabled().

Rename it acpi_processor_make_present() to make it clear this is
for CPUs that were not previously present.

Expose the function prototypes it uses to allow the preprocessor
guards to be removed. The IS_ENABLED() check will let the compiler
dead-code elimination pass remove this if it isn't going to be
used.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
---
Outstanding comments:
 https://lore.kernel.org/r/20230914151720.00007105@Huawei.com
 https://lore.kernel.org/r/b8f430c1-c30f-191f-18c6-f750fa6ba476@redhat.com
  For this comment, we use IS_ENABLED() in multiple places in the kernel in
  this way, and it isn't a problem.
---
 drivers/acpi/acpi_processor.c | 14 +++++---------
 include/linux/acpi.h          |  2 --
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index c8e960ff0aca..26e3efb74614 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -183,13 +183,15 @@ static void __init acpi_pcc_cpufreq_init(void) {}
 #endif /* CONFIG_X86 */
 
 /* Initialization */
-#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
-static int acpi_processor_hotadd_init(struct acpi_processor *pr)
+static int acpi_processor_make_present(struct acpi_processor *pr)
 {
 	unsigned long long sta;
 	acpi_status status;
 	int ret;
 
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+		return -ENODEV;
+
 	if (invalid_phys_cpuid(pr->phys_id))
 		return -ENODEV;
 
@@ -223,12 +225,6 @@ static int acpi_processor_hotadd_init(struct acpi_processor *pr)
 	cpu_maps_update_done();
 	return ret;
 }
-#else
-static inline int acpi_processor_hotadd_init(struct acpi_processor *pr)
-{
-	return -ENODEV;
-}
-#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
 
 static int acpi_processor_get_info(struct acpi_device *device)
 {
@@ -335,7 +331,7 @@ static int acpi_processor_get_info(struct acpi_device *device)
 	 *  because cpuid <-> apicid mapping is persistent now.
 	 */
 	if (invalid_logical_cpuid(pr->id) || !cpu_present(pr->id)) {
-		int ret = acpi_processor_hotadd_init(pr);
+		int ret = acpi_processor_make_present(pr);
 
 		if (ret)
 			return ret;
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 36071bc11acd..19d009ca9e7a 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -301,12 +301,10 @@ static inline int acpi_processor_evaluate_cst(acpi_handle handle, u32 cpu,
 }
 #endif
 
-#ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
 /* Arch dependent functions for cpu hotplug support */
 int acpi_map_cpu(acpi_handle handle, phys_cpuid_t physid, u32 acpi_id,
 		 int *pcpu);
 int acpi_unmap_cpu(int cpu);
-#endif /* CONFIG_ACPI_HOTPLUG_PRESENT_CPU */
 
 #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
 int acpi_get_ioapic_id(acpi_handle handle, u32 gsi_base, u64 *phys_addr);
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
