Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8778C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o5PEKtkhg6BorEmbaAkFQ9M2VBs4VIEyepHRFZbe1qs=; b=sKkCzk3vMGi7iB
	m6VUrnf/3W1nV+KnUWMkHFn67GyPV3Cnr81N7xYFeRizkx8fCuHCxFspEJTefWy0DPuLJ+i+v61ae
	UJtIsH+YKJpzVCHG5xMfuymrJaqAVFBInXvsP7eIvr6xcwUdFv5xBvLdtI9fYACeULqd2PZlaVY1I
	Ymb+WJPR0gN5u2pUZJMucLvwiv1xg4GsZs+3NWn132WDUu5DTAf8YOSfJQVOTiEUuvFZ2LTleOTMz
	lETIAlbmhzAWuyzwbvNu65f++fPTeqGmJrlQQyZTFHIoZwPJjfackrr8+53wvhyVzPruWj+ILrhyH
	Jd1rxHELiWLL2rgiNvGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJCb-00AHyv-1P;
	Tue, 24 Oct 2023 15:20:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAx-00AGPT-2x;
	Tue, 24 Oct 2023 15:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=4b5HegDKciHN9mls7Lc2XkvXRncQJquMBML+u/Mzhus=; b=XN4PKer1A8KCC+iMBOn9ITcaiy
	dsKuXPdTYPn14cZ4dBR/ypl4Zi4zlBpGMrNhTRMWZiVsnEI+Y8bvei2A3HYcoCuVNl11POTAqTsBd
	bzuvRrrLSs4nZG+0A0guwSNnZVTV5IeCuxNKAIcgHgqbVnM/OlERLvhat/0Qc45WcFgMoRx+6eSkf
	b09/Zx2QxoiwQEAsbnRq6Pz5BkTg+kPPUvC4EOc2bcodo8c1ZZvIc33d/VQ0pNzGQGyJaYs4ZmUuR
	WymJFG1h/DK5M8PWA3fEVmNilRtQ6T2gW1gHm9lZtbNsJmZDEkO1pneVNCmodOS1SN6ijSTyQg9+1
	m7MiMiXQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJAt-00FbHJ-1k;
	Tue, 24 Oct 2023 15:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4b5HegDKciHN9mls7Lc2XkvXRncQJquMBML+u/Mzhus=; b=uc2nzMrUE3t/feqmNPw6wzUhwD
	zNyvrYknjodQxhuBS9Y/uZVr2Fhh1qDmAQ3jFj85Tbg1Cpvv0zPd62W4gvQkUb5mYiKLs0H6yjrC5
	PlsAMVktgdo6rE0Ziby+VQG0SIOKigLfdK/FcAFabzkFXd07BmFDxdCSRI9dTnZYYgzgm5VHObd8t
	lNJx81+9Naw4KOZvpgyTYTYhpeGZ1x7Se8E/np25G4B2DG2N3PCcZKrqV7OV1XNQXJ6tHscUNEzDO
	9yV3ztYshVstk1Xc8sho4zuDFgcCVNRjzr2L1QP/LfXrFIr84zinCAaf3DISEiLFVEhhS8LRYlppY
	PZEWtDgQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57442 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJAZ-0004T9-19;
	Tue, 24 Oct 2023 16:18:11 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJAa-00AqRA-Pt; Tue, 24 Oct 2023 16:18:12 +0100
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
Subject: [PATCH 24/39] ACPI: Move acpi_bus_trim_one() before
 acpi_scan_hot_remove()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJAa-00AqRA-Pt@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:12 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161831_724086_3280E3EA 
X-CRM114-Status: GOOD (  13.83  )
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
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/acpi/scan.c | 76 ++++++++++++++++++++++-----------------------
 1 file changed, 38 insertions(+), 38 deletions(-)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 06e9bb4a633f..4343888c76d5 100644
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
@@ -2507,44 +2545,6 @@ int acpi_bus_scan(acpi_handle handle)
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
