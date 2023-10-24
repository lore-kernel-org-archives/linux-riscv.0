Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38EC5C25B48
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fasw702KUHA82r1x6ipHGf66MQMTrjvPSD1K5MsnBxw=; b=lXuntVR7GxS6uU
	77eQB3I1SYxjfpI2A0t1K/IRZEnQDvqViEE117BGzZGMhAfLOqyTTPSdeEdreB7UVF7CDJzd26XT6
	cipcK2WIky7zCBinAy6DcLvlVJO4EUDOVSoKJtVD9cKJL9lBfxzrIhtWgrGXgDT7q75XyKilT1tT2
	zk5lQPauEhHgcZK5hqDBtMAKZAua2BlvSlmDev4rPE6F7XfVZ2nMlvIk0RYd9AObsRE2CMlkhUcZg
	T8SyUXlwmnnKFC5EivXvtZ4JMPZq0Kov6kpaZad3RK+vd7YyVBzSVrj71xzIYO22yHRUxOObfNBg6
	wlFO47mSCjUY1ihLcxvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJD1-00AIIZ-08;
	Tue, 24 Oct 2023 15:20:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJB3-00AGV1-27;
	Tue, 24 Oct 2023 15:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=IJ7uYec08eqfuMxFZrHnSEcaft5KZu54sS7ZNCcryYs=; b=BsOm1B0aUwT62YUHPFf1yjm6dx
	G4QtRLPRDJv3q4Am4VuK/J3NDjOX/TFpGrmoev0PUDCtKVUcYhU0J32tZ16Ff7iAT26C2OGvQYtro
	Euf7c/bT34k+P0/qmYelHyDVpgReHua46g+uomopObTX4J9EYmhCtQXpHDRZ4ezZyNsaKKluc8CbM
	XjaghwpDWOTjPMwkgOsLgMOkzx0yoGYX/jazjLFNFm2r4seUoWpUpSkf8Hhl9HrWnp0sbTJe8ibbD
	QUcp7u5ZfQyoXILh0/Pnk+0sSa/bo1HLrP/HSbtxFD2N0z7CaOZA0bL1JSN5A+Dk3He+sq4aMLeP1
	10k5gjJA==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJB0-00FbIf-05;
	Tue, 24 Oct 2023 15:18:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IJ7uYec08eqfuMxFZrHnSEcaft5KZu54sS7ZNCcryYs=; b=jYvWVqlCApkWNPfR6cAqR56m9Q
	q/uDG0++Gf1LKwvUATqH2/HHLsrgwdtJ+BeV/LcQUy3mgxTKjZMMBCasy377IlLdVDXBTutup20Bx
	AOHX+6RfU48ufAu5zcB7c+JBDj4iJugXUbd/X6bNVHKqnCmmg57lACiIs8euHoCBoxARM4DmumVWq
	hFbEk8A35olBO2FvYluxan0xYW5q81eExG6xzwEsoS7UksiGwOQzBQwIkut0ZB1E+f3olnozZwwr1
	W1q9gkoD44/mckOaqrqcVmwEeE8Q+bTfGfC7EfPQIexJLoqWTRu23M91wNstj743bbzWCtenM0PWp
	+v2LYvbg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:46130 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJAj-0004Tf-20;
	Tue, 24 Oct 2023 16:18:21 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJAl-00AqRM-2s; Tue, 24 Oct 2023 16:18:23 +0100
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
	Len Brown <lenb@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	acpica-devel@lists.linuxfoundation.org
Subject: [PATCH 26/39] ACPI: Add post_eject to struct acpi_scan_handler for
 cpu hotplug
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJAl-00AqRM-2s@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:23 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161838_293051_BD9FBB5B 
X-CRM114-Status: GOOD (  21.09  )
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

struct acpi_scan_handler has a detach callback that is used to remove
a driver when a bus is changed. When interacting with an eject-request,
the detach callback is called before _EJ0.

This means the ACPI processor driver can't use _STA to determine if a
CPU has been made not-present, or some of the other _STA bits have been
changed. acpi_processor_remove() needs to know the value of _STA after
_EJ0 has been called.

Add a post_eject callback to struct acpi_scan_handler. This is called
after acpi_scan_hot_remove() has successfully called _EJ0. Because
acpi_bus_trim_one() also clears the handler pointer, it needs to be
told if the caller will go on to call acpi_bus_post_eject(), so
that acpi_device_clear_enumerated() and clearing the handler pointer
can be deferred. The existing not-used pointer is used for this.

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Joanthan Cameron <Jonathan.Cameron@huawei.com>
---
 drivers/acpi/acpi_processor.c |  4 +--
 drivers/acpi/scan.c           | 52 ++++++++++++++++++++++++++++++-----
 include/acpi/acpi_bus.h       |  1 +
 3 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/acpi_processor.c b/drivers/acpi/acpi_processor.c
index 26e3efb74614..b6f5005985c3 100644
--- a/drivers/acpi/acpi_processor.c
+++ b/drivers/acpi/acpi_processor.c
@@ -459,7 +459,7 @@ static int acpi_processor_add(struct acpi_device *device,
 
 #ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
 /* Removal */
-static void acpi_processor_remove(struct acpi_device *device)
+static void acpi_processor_post_eject(struct acpi_device *device)
 {
 	struct acpi_processor *pr;
 
@@ -627,7 +627,7 @@ static struct acpi_scan_handler processor_handler = {
 	.ids = processor_device_ids,
 	.attach = acpi_processor_add,
 #ifdef CONFIG_ACPI_HOTPLUG_PRESENT_CPU
-	.detach = acpi_processor_remove,
+	.post_eject = acpi_processor_post_eject,
 #endif
 	.hotplug = {
 		.enabled = true,
diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 4343888c76d5..adfd24f4d00c 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -244,18 +244,28 @@ static int acpi_scan_try_to_offline(struct acpi_device *device)
 	return 0;
 }
 
-static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
+/**
+ * acpi_bus_trim_one() - Detach scan handlers and drivers from ACPI device
+ *                       objects.
+ * @adev:       Root of the ACPI namespace scope to walk.
+ * @eject:      Pointer to a bool that indicates if this was due to an
+ *              eject-request.
+ *
+ * Must be called under acpi_scan_lock.
+ * If @eject points to true, clearing the device enumeration is deferred until
+ * acpi_bus_post_eject() is called.
+ */
+static int acpi_bus_trim_one(struct acpi_device *adev, void *eject)
 {
 	struct acpi_scan_handler *handler = adev->handler;
+	bool is_eject = *(bool *)eject;
 
-	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, NULL);
+	acpi_dev_for_each_child_reverse(adev, acpi_bus_trim_one, eject);
 
 	adev->flags.match_driver = false;
 	if (handler) {
 		if (handler->detach)
 			handler->detach(adev);
-
-		adev->handler = NULL;
 	} else {
 		device_release_driver(&adev->dev);
 	}
@@ -265,7 +275,12 @@ static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
 	 */
 	acpi_device_set_power(adev, ACPI_STATE_D3_COLD);
 	adev->flags.initialized = false;
-	acpi_device_clear_enumerated(adev);
+
+	/* For eject this is deferred to acpi_bus_post_eject() */
+	if (!is_eject) {
+		adev->handler = NULL;
+		acpi_device_clear_enumerated(adev);
+	}
 
 	return 0;
 }
@@ -278,15 +293,36 @@ static int acpi_bus_trim_one(struct acpi_device *adev, void *not_used)
  */
 void acpi_bus_trim(struct acpi_device *adev)
 {
-	acpi_bus_trim_one(adev, NULL);
+	bool eject = false;
+
+	acpi_bus_trim_one(adev, &eject);
 }
 EXPORT_SYMBOL_GPL(acpi_bus_trim);
 
+static int acpi_bus_post_eject(struct acpi_device *adev, void *not_used)
+{
+	struct acpi_scan_handler *handler = adev->handler;
+
+	acpi_dev_for_each_child_reverse(adev, acpi_bus_post_eject, NULL);
+
+	if (handler) {
+		if (handler->post_eject)
+			handler->post_eject(adev);
+
+		adev->handler = NULL;
+	}
+
+	acpi_device_clear_enumerated(adev);
+
+	return 0;
+}
+
 static int acpi_scan_hot_remove(struct acpi_device *device)
 {
 	acpi_handle handle = device->handle;
 	unsigned long long sta;
 	acpi_status status;
+	bool eject = true;
 
 	if (device->handler && device->handler->hotplug.demand_offline) {
 		if (!acpi_scan_is_offline(device, true))
@@ -299,7 +335,7 @@ static int acpi_scan_hot_remove(struct acpi_device *device)
 
 	acpi_handle_debug(handle, "Ejecting\n");
 
-	acpi_bus_trim(device);
+	acpi_bus_trim_one(device, &eject);
 
 	acpi_evaluate_lck(handle, 0);
 	/*
@@ -322,6 +358,8 @@ static int acpi_scan_hot_remove(struct acpi_device *device)
 	} else if (sta & ACPI_STA_DEVICE_ENABLED) {
 		acpi_handle_warn(handle,
 			"Eject incomplete - status 0x%llx\n", sta);
+	} else {
+		acpi_bus_post_eject(device, NULL);
 	}
 
 	return 0;
diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
index 254685085c82..1b7e1acf925b 100644
--- a/include/acpi/acpi_bus.h
+++ b/include/acpi/acpi_bus.h
@@ -127,6 +127,7 @@ struct acpi_scan_handler {
 	bool (*match)(const char *idstr, const struct acpi_device_id **matchid);
 	int (*attach)(struct acpi_device *dev, const struct acpi_device_id *id);
 	void (*detach)(struct acpi_device *dev);
+	void (*post_eject)(struct acpi_device *dev);
 	void (*bind)(struct device *phys_dev);
 	void (*unbind)(struct device *phys_dev);
 	struct acpi_hotplug_profile hotplug;
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
