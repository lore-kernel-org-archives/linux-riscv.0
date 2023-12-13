Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6270C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=63H8OFoM0TIoQ08euoyEgNJwZ/keqEBqnQHUb2MgKWc=; b=ng57FAIMMi/JW6
	4wOsP/f50FHB0UxSq7Chymh67r6og5/n+e33Q/cC8gYX3QmUAVguW2q2qEm+muju3Y2oOCzx9cViK
	ZFxQYzZKcn5rSfZS7JHp09SPvntCXHYGdYLt+SrEvsgD+aZzy+SDUhfw9ONdreekkJLUp6FEnrI4Z
	jljYRh2uIjlwQUQG5eQL3PKw920T2VSUSCHyzprohzZpZl/cHYpz1wJs7T2+s2Ij70tip3Y1kT9Fe
	3fpUe3hulQgMFdTXU0UlQZysuT+O6IfEZRVpOi66rKNHa3hLfBrjXE7IDw+mNMpjD8GB7CdI+hNGx
	gNMRxNF4xKwmBdpvQqBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhy-00EfdQ-1J;
	Wed, 13 Dec 2023 12:51:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhb-00EfE5-2T;
	Wed, 13 Dec 2023 12:51:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=GjL2kXTMd2i2PnTpLka9uYvIe3wh2ToEdTiKO8t/ZLs=; b=lz3etuZwplEtsavbkGepf9o3d/
	fxqUdKSUMTqbsaqtLZIRbExQziCSQgLLHehDA2Yyq7pGfPiUrzIqStwkLKKdRGBYS/4M0djb8mLm+
	t+FzdJGlmfwS5eW970d6D6PWGt3zslf6ePL+fK1MeV0fFJGyPFke2iNckBkrJ+FZhLREc64dcxe8Z
	9q5+SQXv2/vfDUtp6QpRFSaNbAsf+M4PiGdNwJctT/kPUofS3d3e2ZXxp4c3Ek64rRigdtsoZZ5wd
	Iaajher0O+26DmT5jl6a40RZVuDjkbjhXEskKyFfVyJlMIDJ5pEzb++L6/TO0P/I1Wb1O1qduKgr2
	l6bUEOTw==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhY-00968c-0S;
	Wed, 13 Dec 2023 12:51:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GjL2kXTMd2i2PnTpLka9uYvIe3wh2ToEdTiKO8t/ZLs=; b=GBHhS3atcKbvYSZE+G7lr2xVSQ
	J8Xru9Y54/v9+enWJoWXlcLkIb+UuCAY3g8d/K+IbsmOVNvLtIrmEMFHDoDdsXzBv06qv1y61z79P
	BMxJ8FdjAQm2gM7JfKDvbfwGy4QHuIhxTSAaf0NOkDOS6ChYkW8Uf9bYIDcEVnVr1+Na7zNCxYm8L
	YUxzIokMmeol0Thdj+nFdSCNSPrZTCTyqkGyqhPGFF06oijt4zU/TSoCSo2c0ysNpBZN3e00i+wJn
	vFW+8Z6fY10dFz+JNi6Kg+JJM7xwb/1usJghBrUNHGADIPkPNmb9Nq50ZUdGkY2mjVKU8Os5ZpGni
	bXfksiIw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44942 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOhP-0008Ht-3D;
	Wed, 13 Dec 2023 12:50:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOhS-00Dvla-7i; Wed, 13 Dec 2023 12:50:54 +0000
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
Subject: [PATCH RFC v3 20/21] ACPI: Add _OSC bits to advertise OS support for
 toggling CPU present/enabled
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOhS-00Dvla-7i@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:50:54 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_125100_379235_6739E2BF 
X-CRM114-Status: GOOD (  17.91  )
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

Platform firmware can disabled a CPU, or make it not-present by making
an eject-request notification, then waiting for the os to make it offline
and call _EJx. After the firmware updates _STA with the new status.

Not all operating systems support this. For arm64 making CPUs not-present
has never been supported. For all ACPI architectures, making CPUs disabled
has recently been added. Firmware can't know what the OS has support for.

Add two new _OSC bits to advertise whether the OS supports the _STA enabled
or present bits being toggled for CPUs. This will be important for arm64
if systems that support physical CPU hotplug ever appear as arm64 linux
doesn't currently support this, so firmware shouldn't try.

Advertising this support to firmware is useful for cloud orchestrators
to know whether they can scale a particular VM by adding CPUs.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
---
I'm assuming Loongarch machines do not support physical CPU hotplug.

Changes since RFC v3:
 * Drop ia64 changes
 * Update James' comment below "---" to remove reference to ia64

Outstanding comment:
 https://lore.kernel.org/r/20230914175021.000018fd@Huawei.com
---
 arch/x86/Kconfig              |  1 +
 drivers/acpi/Kconfig          |  9 +++++++++
 drivers/acpi/acpi_processor.c | 14 +++++++++++++-
 drivers/acpi/bus.c            | 16 ++++++++++++++++
 include/linux/acpi.h          |  4 ++++
 5 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 64fc7c475ab0..33fc4dcd950c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -60,6 +60,7 @@ config X86
 	select ACPI_LEGACY_TABLES_LOOKUP	if ACPI
 	select ACPI_SYSTEM_POWER_STATES_SUPPORT	if ACPI
 	select ACPI_HOTPLUG_PRESENT_CPU		if ACPI_PROCESSOR && HOTPLUG_CPU
+	select ACPI_HOTPLUG_IGNORE_OSC		if ACPI && HOTPLUG_CPU
 	select ARCH_32BIT_OFF_T			if X86_32
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index 9c5a43d0aff4..020e7c0ab985 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -311,6 +311,15 @@ config ACPI_HOTPLUG_PRESENT_CPU
 	depends on ACPI_PROCESSOR && HOTPLUG_CPU
 	select ACPI_CONTAINER
 
+config ACPI_HOTPLUG_IGNORE_OSC
+	bool
+	depends on ACPI_HOTPLUG_PRESENT_CPU
+	help
+	  Ignore whether firmware acknowledged support for toggling the CPU
+	  present bit in _STA. Some architectures predate the _OSC bits, so
+	  firmware doesn't know to do this.
+
+
 config ACPI_PROCESSOR_AGGREGATOR
 	tristate "Processor Aggregator"
 	depends on ACPI_PROCESSOR
diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index ea12e70dfd39..5bb207a7a1dd 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -182,6 +182,18 @@ static void __init acpi_pcc_cpufreq_init(void)
 static void __init acpi_pcc_cpufreq_init(void) {}
 #endif /* CONFIG_X86 */
 
+static bool acpi_processor_hotplug_present_supported(void)
+{
+	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+		return false;
+
+	/* x86 systems pre-date the _OSC bit */
+	if (IS_ENABLED(CONFIG_ACPI_HOTPLUG_IGNORE_OSC))
+		return true;
+
+	return osc_sb_hotplug_present_support_acked;
+}
+
 /* Initialization */
 static int acpi_processor_make_present(struct acpi_processor *pr)
 {
@@ -189,7 +201,7 @@ static int acpi_processor_make_present(struct acpi_processor *pr)
 	acpi_status status;
 	int ret;
 
-	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU)) {
+	if (!acpi_processor_hotplug_present_supported()) {
 		pr_err_once("Changing CPU present bit is not supported\n");
 		return -ENODEV;
 	}
diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 72e64c0718c9..7122450739d6 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -298,6 +298,13 @@ EXPORT_SYMBOL_GPL(osc_sb_native_usb4_support_confirmed);
 
 bool osc_sb_cppc2_support_acked;
 
+/*
+ * ACPI 6.? Proposed Operating System Capabilities for modifying CPU
+ * present/enable.
+ */
+bool osc_sb_hotplug_enabled_support_acked;
+bool osc_sb_hotplug_present_support_acked;
+
 static u8 sb_uuid_str[] = "0811B06E-4A27-44F9-8D60-3CBBC22E7B48";
 static void acpi_bus_osc_negotiate_platform_control(void)
 {
@@ -346,6 +353,11 @@ static void acpi_bus_osc_negotiate_platform_control(void)
 
 	if (!ghes_disable)
 		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_APEI_SUPPORT;
+
+	capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_HOTPLUG_ENABLED_SUPPORT;
+	if (IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU))
+		capbuf[OSC_SUPPORT_DWORD] |= OSC_SB_HOTPLUG_PRESENT_SUPPORT;
+
 	if (ACPI_FAILURE(acpi_get_handle(NULL, "\\_SB", &handle)))
 		return;
 
@@ -383,6 +395,10 @@ static void acpi_bus_osc_negotiate_platform_control(void)
 			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_NATIVE_USB4_SUPPORT;
 		osc_cpc_flexible_adr_space_confirmed =
 			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_CPC_FLEXIBLE_ADR_SPACE;
+		osc_sb_hotplug_enabled_support_acked =
+			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_HOTPLUG_ENABLED_SUPPORT;
+		osc_sb_hotplug_present_support_acked =
+			capbuf_ret[OSC_SUPPORT_DWORD] & OSC_SB_HOTPLUG_PRESENT_SUPPORT;
 	}
 
 	kfree(context.ret.pointer);
diff --git a/include/linux/acpi.h b/include/linux/acpi.h
index 00be66683505..c572abac803c 100644
--- a/include/linux/acpi.h
+++ b/include/linux/acpi.h
@@ -559,12 +559,16 @@ acpi_status acpi_run_osc(acpi_handle handle, struct acpi_osc_context *context);
 #define OSC_SB_NATIVE_USB4_SUPPORT		0x00040000
 #define OSC_SB_PRM_SUPPORT			0x00200000
 #define OSC_SB_FFH_OPR_SUPPORT			0x00400000
+#define OSC_SB_HOTPLUG_ENABLED_SUPPORT		0x00800000
+#define OSC_SB_HOTPLUG_PRESENT_SUPPORT		0x01000000
 
 extern bool osc_sb_apei_support_acked;
 extern bool osc_pc_lpi_support_confirmed;
 extern bool osc_sb_native_usb4_support_confirmed;
 extern bool osc_sb_cppc2_support_acked;
 extern bool osc_cpc_flexible_adr_space_confirmed;
+extern bool osc_sb_hotplug_enabled_support_acked;
+extern bool osc_sb_hotplug_present_support_acked;
 
 /* USB4 Capabilities */
 #define OSC_USB_USB3_TUNNELING			0x00000001
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
