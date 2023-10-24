Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23D34C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dPDqTtCWHyNLdpyunpdAWSxeKanVyiVfGoP/V5jYU6A=; b=IAWjOaBS4fFAai
	yON6dQw+DHmp6oMtR1PMkQlNL02v2hvRmVQ2tJFFGOHKrXzoGlTyJLSQ4y0D2I+GLJv+GblSLhg0h
	tmrq3JEU2ayrGjM42Wrasu3tcvgSAGD+cGlR2pqDp2hlS8C7wTrDN/hWuR3ZgQeNSn8a+NE8uil59
	0EHfLLhZFTnrVL1onW4O2fSKgQaLMMD+Tnz6jvwJlBJ4WF6jqrpxUo9VnhO28+jNYCdka53GerM0A
	ASb45IkZnFogGh6QqAqEU1PJ90hv632urjw0Kg5Y11GcNVy2yGKSLBI7RusVNbzD1lb9AjN8LUrkN
	1twtDAEBn+JANj/3Pg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBR-00AGro-03;
	Tue, 24 Oct 2023 15:19:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAL-00AFnc-1C;
	Tue, 24 Oct 2023 15:17:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=f8OrWLTaCGNbyVq/WoK3vwhwe5TfGCU6KyuaNwPXnrU=; b=bJbyRc7Voy4fwHRY8NIy9J4xJZ
	mwUWqP+2nWJKN3W9uCIOui8ux2O5HcsT3RVb3xiBJuAqTY2cNcK5nzoBqWE4/ycvmFAJpNnf4bA8h
	qS6+8DejaAkeGViUjqfLxXl334/8VTictns9i6JOFpScnbqtwK7nzVYjJxhK0vtzPsxQR7Xl+c2ZG
	RiEBG3yjV5XpdpPgkL0inVPG3lrvSMldmrmg1hPEzzpZk/ioVj1/7TccroSc0LlgLoFDynWb1vnk7
	2EXkm6UTat1uwOSl61TpruZcEB7rwSFQ0RgHz+uNmUJMvzbyTeimw9+06WbX6cud7MpbLSg0idSZo
	8RrA77Zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36706 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJA9-0004RY-1o;
	Tue, 24 Oct 2023 16:17:45 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJAB-00AqQg-1h; Tue, 24 Oct 2023 16:17:47 +0100
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
Subject: [PATCH 19/39] ACPI: processor: Add support for processors described
 as container packages
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJAB-00AqQg-1h@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:17:47 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_081757_505954_1B345C4C 
X-CRM114-Status: GOOD (  13.99  )
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

ACPI has two ways of describing processors in the DSDT. Either as a device
object with HID ACPI0007, or as a type 'C' package inside a Processor
Container. The ACPI processor driver probes CPUs described as devices, but
not those described as packages.

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

Qemu TCG describes CPUs using packages in a processor container.

Signed-off-by: James Morse <james.morse@arm.com>
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
