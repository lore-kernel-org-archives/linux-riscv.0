Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 637C9C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yxT7mDEUxiVSgg7TyHPWcs8CJUsAmdERJ/qYBZ/UPEA=; b=dFyJbuXsLcnm2I
	mvkgEmSfZjTAZQ3a4pfgS/EUhisCmQwS8gjy63ptDPZ7638x502AEruBfWZzvW4mQtHcYaH4Uw3O5
	6VA0t9kftzeMk2HJ1TOD8GcIO+QISush5+ejBm3EuHReNdcwZRIFPa7nPevqelvcfXWplboRJD9is
	7Cv3/Lx0EoXDZXsR3O0JkdTA2VRyA76D00zmKOqCkh/+kBUu2xYaxKgtWQwJ50yhLkoc2Z/AbNfWF
	EyCBMraJtHxgEIPCr2tZEmrgPCGzcaKJupeCZ8uFqFeSVBtrSPrtHd8+eY5lNkobaaW/I69Albas+
	cVMCkpJe4jllDWbV9AQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOiU-00EgFZ-32;
	Wed, 13 Dec 2023 12:51:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOi6-00EdvI-1V;
	Wed, 13 Dec 2023 12:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=+X6RbS8+FdE0yTZKPB4LhEuZYWtnagnPlrAoFbcwPjQ=; b=cohuG+LDvNgpd64HbLmHbpKUXp
	wxNPAKD5TR46g/lZehPoGpq7YgfCZwNooh/ByyYfKpefpXR22aovnRqW+RA5WU39sX1qqLVh8BcUU
	5Oyp825+gDNk6o9i4bApxpmqhlprYwzRvHWBe1G4qqjNvgDLrXmVxXNuL7tARCig7gykj6zvJRS3T
	iY72a4kgPGGJk4roa71Dwqclee4H33OSkqc8KZf4fj1ho/agpVWByd5HmSjd90KLhZYN00hAE7TWu
	qEDie8YSn6l6pEn0A/i2aDLiTck5BDTRfVj78USvT8+8H0wMV+gtHVoMS/AKx3eMft/2tK3i6xdSM
	4U/yXaAg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36780 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOfv-0008Cu-1l;
	Wed, 13 Dec 2023 12:49:19 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOfx-00Dvje-MS; Wed, 13 Dec 2023 12:49:21 +0000
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
Subject: [PATCH RFC v3 02/21] ACPI: processor: Add support for processors
 described as container packages
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOfx-00Dvje-MS@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:49:21 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_045134_527742_37FA7791 
X-CRM114-Status: GOOD (  15.58  )
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

ACPI has two ways of describing processors in the DSDT. From ACPI v6.5,
5.2.12:

"Starting with ACPI Specification 6.3, the use of the Processor() object
was deprecated. Only legacy systems should continue with this usage. On
the Itanium architecture only, a _UID is provided for the Processor()
that is a string object. This usage of _UID is also deprecated since it
can preclude an OSPM from being able to match a processor to a
non-enumerable device, such as those defined in the MADT. From ACPI
Specification 6.3 onward, all processor objects for all architectures
except Itanium must now use Device() objects with an _HID of ACPI0007,
and use only integer _UID values."

Also see https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#declaring-processors

Duplicate descriptions are not allowed, the ACPI processor driver already
parses the UID from both devices and containers. acpi_processor_get_info()
returns an error if the UID exists twice in the DSDT.

The missing probe for CPUs described as packages creates a problem for
moving the cpu_register() calls into the acpi_processor driver, as CPUs
described like this don't get registered, leading to errors from other
subsystems when they try to add new sysfs entries to the CPU node.
(e.g. topology_sysfs_init()'s use of topology_add_dev() via cpuhp)

To fix this, parse the processor container and call acpi_processor_add()
for each processor that is discovered like this. The processor container
handler is added with acpi_scan_add_handler(), so no detach call will
arrive.

Qemu TCG describes CPUs using processor devices in a processor container.
For more information, see build_cpus_aml() in Qemu hw/acpi/cpu.c and
https://uefi.org/specs/ACPI/6.5/08_Processor_Configuration_and_Control.html#processor-container-device

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
---
Outstanding comments:
 https://lore.kernel.org/r/20230914145353.000072e2@Huawei.com
 https://lore.kernel.org/r/50571c2f-aa3c-baeb-3add-cd59e0eddc02@redhat.com
---
 drivers/acpi/acpi_processor.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 4fe2ef54088c..6a542e0ce396 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -626,9 +626,31 @@ static struct acpi_scan_handler processor_handler = {
 	},
 };
 
+static acpi_status acpi_processor_container_walk(acpi_handle handle,
+						 u32 lvl,
+						 void *context,
+						 void **rv)
+{
+	struct acpi_device *adev;
+	acpi_status status;
+
+	adev = acpi_get_acpi_dev(handle);
+	if (!adev)
+		return AE_ERROR;
+
+	status = acpi_processor_add(adev, &processor_device_ids[0]);
+	acpi_put_acpi_dev(adev);
+
+	return status;
+}
+
 static int acpi_processor_container_attach(struct acpi_device *dev,
 					   const struct acpi_device_id *id)
 {
+	acpi_walk_namespace(ACPI_TYPE_PROCESSOR, dev->handle,
+			    ACPI_UINT32_MAX, acpi_processor_container_walk,
+			    NULL, NULL, NULL);
+
 	return 1;
 }
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
