Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1D01C4167D
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igLNKE2GW0HIp78om57lg+qvHRtpukVsRKNsX058yhk=; b=nJduFrA9T/1jtP
	LolbCQqZLKDqCFtaNxk5FXBjhPT4Af7htLCtQq07Ib97oIRmyxV9+/rDmfhbiSvj+qIpDAFb2AdO/
	5TGaEyAVtcpxCWUFfPnIQMNjJmePfyezkRxYDVNeHoEaBxv/918naaEGIsCTNs7/rxvFJvCzE6606
	fcZLUx2Y456Heo0MWQJF5X2C+C3AyTTQ39bVPd/45X4a1W88Kvpx+PD6MhB/DQyvk4cr0fhoYGDaY
	ZratX8bq8LVymhjyoaEJrV0Borhi85Odh0aGwTlgmHsHFvu/MQK7wx1ACqHD46qx/KjI0pkJ1uNap
	s1a77Rlv8dG2oBI/1gNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOiX-00EgII-0k;
	Wed, 13 Dec 2023 12:52:01 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOi8-00Edvj-3C;
	Wed, 13 Dec 2023 12:51:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TBP+R/WnvXUfMyTGAeqg+zDZHJCc+YgTDDU9BjPnE9g=; b=ksm1NKE0scGCsyGD98yGeYXubr
	hB68rislLCulb5Vrhre3UZbE0fxzcZ56LCzd5+Jx/UWiG25ops81IW195eVeI8hCQ5EANLwLRWDLA
	BmC4J9EmHzrINYzT6DlHEOYKjkDSM0BA4JczIJo4NcTNxODYtV4qUZxAeg1J7TH+VUw4KpKxTHLPz
	mpmzh+ajIEmyMMSsM4T56yj66lxMZNRqG8qaewbcE/l7g7lRVI3rtAua0Mp747FPjrkKFWvOHFqFD
	2bv0xOQ5zwDWdKfZo9UeZUjaRSQLgY0cl+j0aJ56oPkOTkQW4csde5cwMAKUOpa9x8rBSwoAiid2c
	Df8GEnuA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:43366 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOg0-0008D5-24;
	Wed, 13 Dec 2023 12:49:24 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOg2-00Dvjk-RI; Wed, 13 Dec 2023 12:49:26 +0000
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
Subject: [PATCH RFC v3 03/21] ACPI: processor: Register CPUs that are online,
 but not described in the DSDT
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOg2-00Dvjk-RI@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:49:26 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_045137_061466_F862E4F5 
X-CRM114-Status: GOOD (  12.47  )
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
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
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
