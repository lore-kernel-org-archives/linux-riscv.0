Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9F6C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 18:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lML3lPQEjREbp+wm7NzXmJVEz6NSYUqOiKd6aucH0cM=; b=xsSukIwMzkVPBX
	Uki0RyOwhl/CwH1uFw69p5WOPMhiWN9daOiZzTrKvqd3c9/18DZuPM8sVTL20JePJ2WbyIsyryfx4
	WO+LG3w97YdXpdlZYcEr7fCpM7XQni9ERnqg8b6HDacyjY0HQaIn4sL38C4eZNNATnfX2VuFuQQvV
	VdO9X67f9Msww0v/HLm178rT6jhvoeUXQqrrh2/kGdMoon3BiNeeYL1WAHXIu9TtTUa6mxZcghr7+
	26WQEa9BNe8ecma40wFJEeBROPx+6BXLrHm4hty4ynndgtt2HmkZbZ8pS8D2+II2UlbGPfIsfjekF
	NLEQi19OOIKdqVWDRkJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVEuB-00000004yEi-0oBZ;
	Wed, 31 Jan 2024 18:01:47 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDnJ-00000004dhu-2FK4;
	Wed, 31 Jan 2024 16:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=o6Glb67KDkye22sh0IgMCxcnl6KGrDkZ8W668rj+oDE=; b=uNwhdf+aQwGXAoj/8ZR+IMfI9G
	gC+e/IPVfipWz9zoMxQnmDU1wMD4Wx2H9YhnkbIru2iRYmjXSqC6YJjabWEAVfKZv2VyX+1bufgob
	a03mwaF1+NJMSH56mQGM6CHD8SZ/dYwhkgxoxfV3Y0zLK+/iZ7DsCwTUha7E56wuwuVdTFVub/aib
	w31vNUojMuuBmF/Y681Z0FKrz7qC2vhNgWVWaIobSxmmDDkJ1hv6kwwkhwmnK37vnesZOocvR36WH
	uffGiC9v4wA3huUOmjHMYk7Eec+aS2R8DqrjFePvfj831B00NlS/t0ycISPjoxCBiYVaX5XbhMqpV
	7OL4sDhg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35768 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rVDmz-0003Uk-2B;
	Wed, 31 Jan 2024 16:50:18 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rVDmu-0027Ys-An; Wed, 31 Jan 2024 16:50:12 +0000
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
Subject: [PATCH RFC v4 07/15] ACPI: Check _STA present bit before making CPUs
 not present
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rVDmu-0027Ys-An@rmk-PC.armlinux.org.uk>
Date: Wed, 31 Jan 2024 16:50:12 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_085037_628779_B2164A55 
X-CRM114-Status: GOOD (  12.48  )
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

When called acpi_processor_post_eject() unconditionally make a CPU
not-present and unregisters it.

To add support for AML events where the CPU has become disabled, but
remains present, the _STA method should be checked before calling
acpi_processor_remove().

Rename acpi_processor_post_eject() acpi_processor_remove_possible(), and
check the _STA before calling.

Adding the function prototype for arch_unregister_cpu() allows the
preprocessor guards to be removed.

After this change CPUs will remain registered and visible to
user-space as offline if buggy firmware triggers an eject-request,
but doesn't clear the corresponding _STA bits after _EJ0 has been
called.

Signed-off-by: James Morse <james.morse@arm.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Changes since RFC v3:
 * Move IS_ENABLED(CONFIG_ACPI_HOTPLUG_PRESENT_CPU) into separate patch.
---
 drivers/acpi/acpi_processor.c | 28 ++++++++++++++++++++++++----
 1 file changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 5351095b6968..77d47e6c2474 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -458,16 +458,13 @@ static int acpi_processor_add(struct acpi_device *device,
 }
 
 /* Removal */
-static void acpi_processor_post_eject(struct acpi_device *device)
+static void acpi_processor_make_not_present(struct acpi_device *device)
 {
 	struct acpi_processor *pr;
 
 	if (!IS_ENABLED(CONFIG_ACPI_HOTPLUG_CPU))
 		return;
 
-	if (!device || !acpi_driver_data(device))
-		return;
-
 	pr = acpi_driver_data(device);
 	if (pr->id >= nr_cpu_ids)
 		goto out;
@@ -504,6 +501,29 @@ static void acpi_processor_post_eject(struct acpi_device *device)
 	kfree(pr);
 }
 
+static void acpi_processor_post_eject(struct acpi_device *device)
+{
+	struct acpi_processor *pr;
+	unsigned long long sta;
+	acpi_status status;
+
+	if (!device)
+		return;
+
+	pr = acpi_driver_data(device);
+	if (!pr || pr->id >= nr_cpu_ids || invalid_phys_cpuid(pr->phys_id))
+		return;
+
+	status = acpi_evaluate_integer(pr->handle, "_STA", NULL, &sta);
+	if (ACPI_FAILURE(status))
+		return;
+
+	if (cpu_present(pr->id) && !(sta & ACPI_STA_DEVICE_PRESENT)) {
+		acpi_processor_make_not_present(device);
+		return;
+	}
+}
+
 #ifdef CONFIG_ARCH_MIGHT_HAVE_ACPI_PDC
 bool __init processor_physically_present(acpi_handle handle)
 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
