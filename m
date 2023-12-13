Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396E1C4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUcGeh+/1DJSFOYjZfSvGtWwyFHgCR3pHyaIygayqu4=; b=rWpOvQO7mmuFbS
	nh/aCX4qeSeWbdoJlRP0l5RM6SMwsiHnDHd5A2xniqJC3Ukj8UTFyVlLaxlqYmUvokw312niQVq9J
	i2VfMcPP6t4h9OEArHC3gzjb/5kxoljufvhLWrhw+x0aUZg+dEeY/IOuez3mHJl6d5tNiL2B8pv8i
	bWDcEnH2pp/LctnfMws/6iCEDt7je6T55/5uWeXDanzJvBSIkLVdIHMAbRyA5Ndma3YRuWtHkdamW
	FygMj8mlgrIoJ9E1bWjbVP1HDtdj/kOsf9lDBU8o+DQm8Olgp/xdGNSG4eOwnNn3sFYSuiqcVo3Fv
	n0VKQIPSOZ9eaakTkzZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOgf-00EeHy-0J;
	Wed, 13 Dec 2023 12:50:05 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOgR-00Ee5R-2W;
	Wed, 13 Dec 2023 12:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=FKb6Tx3YWEOt6/qzVEvWhIjmqk2GL+umifX9jwivsXw=; b=iPvbSxdOfLSl0br81MW2NrQMOg
	4nPsPkQ6ioYh+vwRKIq9OpJY4QNbTdAEf6GB7UFRf+0gTRk5MUgucEOiziY+kSkHDBeecdmVC8B0L
	c6iQFU3lqZGH+FhOPFH5DIaUTmxXQHAr+0C3VAy4iaYAOkdkF3rqAzn+IC0fTLIgt6WA0V/3sq4ab
	IYsKHfp8ZW0yK2+ANMrXtips/qJLG7k66jsh+v5euH+fL4b+DIbk9dCwEb4CwhL4VF0uIc6EOdVbg
	LPmQFlHnNCj8LzfaBO/834r6i5eLm1HnJTfNpwNo+FvjLtsHdn03Q7KZZmRTnOyrzs9wvIsgJcGfd
	3rh7MbNg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58180 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOgG-0008Dp-10;
	Wed, 13 Dec 2023 12:49:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOgI-00Dvk8-8X; Wed, 13 Dec 2023 12:49:42 +0000
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
Subject: [PATCH RFC v3 06/21] ACPI: Move acpi_bus_trim_one() before
 acpi_scan_hot_remove()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOgI-00Dvk8-8X@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:49:42 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_044951_854206_580F2A0D 
X-CRM114-Status: GOOD (  13.24  )
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

A subsequent patch will change acpi_scan_hot_remove() to call
acpi_bus_trim_one() instead of acpi_bus_trim(), meaning it can no longer
rely on the prototype in the header file.

Move these functions further up the file.
No change in behaviour.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/acpi/scan.c | 76 ++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 728649a2a251..ec42fe9d0611 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -244,6 +244,44 @@ static int acpi_scan_try_to_offline(struct acpi_device *device)
 	return 0;
 }
 
+static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
+{
+	struct acpi_scan_handler *handler = adev->handler;
+
+	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
+
+	adev->flags.match_driver = false;
+	if (handler) {
+		if (handler->detach)
+			handler->detach(adev);
+
+		adev->handler = NULL;
+	} else {
+		device_release_driver(&adev->dev);
+	}
+	/*
+	 * Most likely, the device is going away, so put it into D3cold before
+	 * that.
+	 */
+	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
+	adev->flags.initialized = false;
+	acpi_device_clear_enumerated(adev);
+
+	return 0;
+}
+
+/**
+ * acpi_bus_trim - Detach scan handlers and drivers from ACPI device objects.
+ * @adev: Root of the ACPI namespace scope to walk.
+ *
+ * Must be called under acpi_scan_lock.
+ */
+void acpi_bus_trim(struct acpi_device *adev)
+{
+	acpi_bus_trim_one(adev, NULL);
+}
+EXPORT_SYMBOL_GPL(acpi_bus_trim);
+
 static int acpi_scan_hot_remove(struct acpi_device *device)
 {
 	acpi_handle handle = device->handle;
@@ -2513,44 +2551,6 @@ int acpi_bus_scan(acpi_handle handle)
 }
 EXPORT_SYMBOL(acpi_bus_scan);
 
-static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
-{
-	struct acpi_scan_handler *handler = adev->handler;
-
-	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
-
-	adev->flags.match_driver = false;
-	if (handler) {
-		if (handler->detach)
-			handler->detach(adev);
-
-		adev->handler = NULL;
-	} else {
-		device_release_driver(&adev->dev);
-	}
-	/*
-	 * Most likely, the device is going away, so put it into D3cold before
-	 * that.
-	 */
-	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
-	adev->flags.initialized = false;
-	acpi_device_clear_enumerated(adev);
-
-	return 0;
-}
-
-/**
- * acpi_bus_trim - Detach scan handlers and drivers from ACPI device objects.
- * @adev: Root of the ACPI namespace scope to walk.
- *
- * Must be called under acpi_scan_lock.
- */
-void acpi_bus_trim(struct acpi_device *adev)
-{
-	acpi_bus_trim_one(adev, NULL);
-}
-EXPORT_SYMBOL_GPL(acpi_bus_trim);
-
 int acpi_bus_register_early_device(int type)
 {
 	struct acpi_device *device = NULL;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
