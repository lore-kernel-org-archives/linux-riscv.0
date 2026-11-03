Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BEF606A329
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 08:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jlU54Q1a;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JZcSuSTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GHY8dP0+Nk3Rh/WNnubZpPZHzb1IjjCi6c8+pTiFTCU=; b=jlU54Q1adHHmXpT8RIoinJ38W+
	eRWl8oyH3K2znK0AU0tAKNi4xxbRx8QT3iI8T7ZJXv0mf1vW9XFflN0mN4ms1kaW75cp8Y+FjoXwl
	03KZuqKrK6JAyM21MFXKvFdVHxUswMMiqKXXqYCbZQVAKrCFYEI5nF6cpEv8jw6WCvgIFtdGS1sv9
	fv4OfC9roz2ji0SLTpuH3hNZ5nBHdGDsN3oaKsYLClgLWgviRk6Ojqo4rGSShttbTzsdRsjaraXpg
	LvpnkR8efH8P4x+IqvDqvzuU4+vJUDLYmtnkbrBf8TteM715VL6OTez04Hb1+yLrohYu7q3TyfX8n
	ktbLi3ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMN-00000001f8F-3n6L;
	Tue, 03 Nov 2026 08:59:15 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOAMJ-00000001f6O-3RXw
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 08:59:14 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-cd63b18598dso192551a12.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 00:59:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793696351; x=1794301151; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9H0FtVqjAvdxJU4WnvNJ2DEU2rxaugxZZsDOPGa/Ctk=;
        b=JZcSuSTFhr59FWtAN3paMr56dIboxTSqCjcJdhiiUYwu1KbVpZl4YgNm0P/kJ5Nk/N
         p/3LE4/UsvifHE06pN392w0JePP/3K1ThqEwS9ZmuPMVEbX1lLxtrr60Snju35DSs+k5
         DARcZ+gLpM4qSuwc5IxHepjez0fBAjC1qWik1afmie1+lHDR9mlBn4jQgg2S2Zgl0LU3
         ptGvRB/ck4trcvtU/vdgq6VJAs7z396BZaJSIoT6viW7E68obrGtCmZ5o8yPnkERByQE
         C0eKxycvypBuORenkBgFHdPt6S9ghSEn/booAGFxXfqfJJ2OWdRMT1LWI1iu706Mas7U
         gARw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793696351; x=1794301151;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9H0FtVqjAvdxJU4WnvNJ2DEU2rxaugxZZsDOPGa/Ctk=;
        b=06VR7iR9/bxTrGt6Q3Oy/xpfZ6vUz+MLXZz19EHNXtrEMFm1ASk7AAi5ZsFxe+joFL
         RYgHf5c+dnafexxTyCXkwBLwxg6+U1ODH23KXTdby7Hj/2PIQdKuC874GSbi8cfbpCkS
         QAZlwCz9tIqlUtAxJ+wRSQmUYnvWu0x168QQrrJHroKHQyLmN+JfAnlcJSBN8FIRUKhu
         zCsaJRnsrTMiktsf27Sv4vBu3+tu3O6CzkAfpj/twpEzvlHez6qC2hez5nKsWmJX+TXG
         RKgV09l8EUjLfTCRwU1Kuq0iVEdWd6U4u8DkSITcOACC0GCputbb/V1cezt/c1OpKfg1
         +M5w==
X-Forwarded-Encrypted: i=1; AKwUvBwTQjVaxd2TqEyeW8Ks2veloO9HvKZzt0aKMF1x50Mfa/UvTrgn5+Uhd/nLexf0BUmKaVgEYwDQyN4upA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8WUYa9fcEAkvc26uoGGjhHB8oEH4CzhoZxfZsjoZr2LG/pGTB9
	tOzowUmZ6bUejNsXxH1C8nnKkdLbiC8GUThA+ffVVWSjjP7HxqPNCH05
X-Gm-Gg: AYBFou3AbWIwoYmCHo1oWwPg+pJGEM5SKeCsQt6TWxkjghPxX01q3Wky1siy4mJhpLB
	gakmBQwwjcyZEyNjpTjAcCSC0E/D2Z3jPx4W2rNRva8QtSRCnhS3nqnHVb7xusZ+xJWCbc48f1F
	UO/H3nOsS37iwiovAlJOcgEeWVHU3RrtjmXkKl9z5eM0OV8m3EoxrhT4k+DJNWpKdL2+mMaqwge
	/DsHEJVnuTKtuLIOkSiULBZbwtUCwTelFD67EVWx7QD95QO+two1bO4KJei40M2q6G5oMoo6lSw
	eed74GHuc09X+o3aM81nygKK1c6iuZgEJpg11dR40h/bUxRtnOPznBPg90GQhsmsZCRfB+JFtWf
	XWpph9N4gZGRsIJKveMpgMUvyFdpGkEY5hXBuegRcoZTeuAAwnWdCLXqoDmGpOI2SK3yFnWYTQZ
	kZXpihZM9takK2Lp9uHaBWUHuZlFJqVSOBdSNpxxaUlkxSDy5QqhqEar3j0sB1r9pDESa1/bSbA
	fu1HH9sL88QpW8swNuiEylCgOx+J47+m8bhUxgCi750PNRxY5Q5hM+2v9IXbsD9WZdNIilU0nmK
	XXh4TTXO8OaAD8QTIPQQSHK8gAUr1rM+5lD42QFgc84ruKBuIykrMSm9cgZhzpnBmneBWDqasmZ
	S/4tds0LcDNap
X-Received: by 2002:a17:90b:28c7:b0:3a0:238b:db4d with SMTP id 98e67ed59e1d1-3ae897f82c4mr17367231a91.5.1793696350816;
        Tue, 03 Nov 2026 00:59:10 -0800 (PST)
Received: from chenyou.. ([140.116.39.229])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c6740a1sm3345662a91.10.2026.11.03.00.59.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 00:59:10 -0800 (PST)
From: Chen-Yu Yeh <chenyou910331@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Chen Wang <chen.wang@linux.dev>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Hiago De Franco <hfranco@baylibre.com>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen-Yu Yeh <chenyou910331@gmail.com>
Subject: [PATCH 2/3] phy: sophgo: Add USB role switch support for CV18XX/SG200X
Date: Tue,  3 Nov 2026 16:58:46 +0800
Message-ID: <20261103085847.338613-3-chenyou910331@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261103085847.338613-1-chenyou910331@gmail.com>
References: <20261103085847.338613-1-chenyou910331@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_005911_873242_AD13ECA4 
X-CRM114-Status: GOOD (  23.66  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The USB role of the dwc2 controller on CV18XX/SG200X is selected by the
ID override in the top syscon (offset 0x48, bits 6 and 7). The vendor
kernel switches roles by writing only this override, and dwc2 follows
through its Connector ID status change handling.

The usb-role-switch support in dwc2 does not work on this SoC. It
switches roles through the GOTGCTL session overrides, and clearing
B-valid while the core is a B-device with VBUS present makes
GOTGINT.SesEndDet fire back to back, which hangs the board in the
interrupt handler. This happens on "echo host" and at probe without
role-switch-default-mode.

Register a role switch in the PHY driver when the PHY node has
usb-role-switch, and write only the ID override when the role changes.

There are two ordering details:

 - Set the default role before registering the PHY provider, so dwc2
   already sees the final role when it probes. Otherwise it records the
   role it sees at probe and keeps the interrupt mask of that role.

 - Ignore phy_set_mode() while the role switch is in use, because
   usb_add_hcd() asks for host mode on any controller that has a host
   side, which would override the default role.

The ID has no "unattached" state, so USB_ROLE_NONE selects the default
role.

Move the register write to a helper shared with the set_mode callback,
and update PHY_VBUS_POWER and the ID override in a single write.

Tested on Milk-V Duo 256M with dr_mode = "otg" and a v7.3-rc5 based tree:

  Default peripheral, bare board on a PC, no manual step after boot:
    role device, 0x03000048 = 0x3c0, UDC configured, PC sees 0525:a4a2
    echo host:   role host, 0x03000048 = 0x142
    echo device: role device, 0x03000048 = 0x3c0, UDC configured
    echo none:   role device, 0x03000048 = 0x3c0

  Default host, on the USB & Ethernet IO board, no manual step after boot:
    role host, 0x03000048 = 0x142, the hub enumerates at 3.4 s, a USB
    stick plugged in later shows up as sda

Registers at boot in the host case, before and after this change:

            before        after
  GINTMSK   0xd0bc3cd4    0xf300081e    (PrtInt masked -> unmasked)
  HPRT0     0x00021403    0x00001005    (ConnDet pending -> port enabled)

Signed-off-by: Chen-Yu Yeh <chenyou910331@gmail.com>
---
 drivers/phy/sophgo/Kconfig           |   2 +
 drivers/phy/sophgo/phy-cv1800-usb2.c | 107 +++++++++++++++++++++++++--
 2 files changed, 102 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/sophgo/Kconfig b/drivers/phy/sophgo/Kconfig
index 2c943bbe1f81..055cbcd32891 100644
--- a/drivers/phy/sophgo/Kconfig
+++ b/drivers/phy/sophgo/Kconfig
@@ -10,6 +10,8 @@ config PHY_SOPHGO_CV1800_USB2
 	depends on MFD_SYSCON
 	depends on USB_SUPPORT
 	select GENERIC_PHY
+	select USB_COMMON
+	select USB_ROLE_SWITCH
 	help
 	  Enable this to support the USB 2.0 PHY used with
 	  the DWC2 USB controller in Sophgo CV18XX/SG200X
diff --git a/drivers/phy/sophgo/phy-cv1800-usb2.c b/drivers/phy/sophgo/phy-cv1800-usb2.c
index 6fe846534e9c..b4c27ab41a6f 100644
--- a/drivers/phy/sophgo/phy-cv1800-usb2.c
+++ b/drivers/phy/sophgo/phy-cv1800-usb2.c
@@ -13,8 +13,11 @@
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 #include <linux/phy/phy.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/spinlock.h>
+#include <linux/usb/otg.h>
+#include <linux/usb/role.h>
 
 #define REG_USB_PHY_CTRL		0x048
 
@@ -37,8 +40,93 @@ struct cv1800_usb_phy {
 	struct clk	*usb_lpm_clk;
 	struct clk	*usb_stb_clk;
 	bool		support_otg;
+	struct usb_role_switch	*role_sw;
+	enum usb_role		default_role;
 };
 
+static int cv1800_usb_phy_set_id(struct cv1800_usb_phy *phy, enum usb_role role)
+{
+	unsigned int regval;
+
+	switch (role) {
+	case USB_ROLE_DEVICE:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
+		break;
+	case USB_ROLE_HOST:
+		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST |
+			 PHY_VBUS_POWER;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return regmap_update_bits(phy->syscon, REG_USB_PHY_CTRL,
+				  PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE |
+				  PHY_VBUS_POWER, regval);
+}
+
+static int cv1800_usb_phy_role_set(struct usb_role_switch *sw, enum usb_role role)
+{
+	struct cv1800_usb_phy *phy = usb_role_switch_get_drvdata(sw);
+
+	if (role == USB_ROLE_NONE)
+		role = phy->default_role;
+
+	return cv1800_usb_phy_set_id(phy, role);
+}
+
+static enum usb_role cv1800_usb_phy_role_get(struct usb_role_switch *sw)
+{
+	struct cv1800_usb_phy *phy = usb_role_switch_get_drvdata(sw);
+	unsigned int val = 0;
+	int ret = regmap_read(phy->syscon, REG_USB_PHY_CTRL, &val);
+
+	if (ret)
+		return USB_ROLE_NONE;
+
+	if (val & PHY_ID_OVERWRITE_MODE)
+		return USB_ROLE_DEVICE;
+
+	return USB_ROLE_HOST;
+}
+
+static void cv1800_usb_phy_role_unregister(void *data)
+{
+	usb_role_switch_unregister(data);
+}
+
+static int cv1800_usb_phy_setup_role_switch(struct device *dev,
+					    struct cv1800_usb_phy *phy)
+{
+	struct usb_role_switch_desc desc = {
+		.fwnode = dev_fwnode(dev),
+		.set = cv1800_usb_phy_role_set,
+		.get = cv1800_usb_phy_role_get,
+		.allow_userspace_control = true,
+		.driver_data = phy,
+	};
+	int ret;
+
+	if (!device_property_read_bool(dev, "usb-role-switch"))
+		return 0;
+
+	if (usb_get_role_switch_default_mode(dev) == USB_DR_MODE_HOST)
+		phy->default_role = USB_ROLE_HOST;
+	else
+		phy->default_role = USB_ROLE_DEVICE;
+
+	ret = cv1800_usb_phy_set_id(phy, phy->default_role);
+	if (ret)
+		return ret;
+
+	phy->role_sw = usb_role_switch_register(dev, &desc);
+	if (IS_ERR(phy->role_sw))
+		return PTR_ERR(phy->role_sw);
+
+	return devm_add_action_or_reset(dev, cv1800_usb_phy_role_unregister,
+					phy->role_sw);
+}
+
 static int cv1800_usb_phy_set_mode(struct phy *_phy,
 				   enum phy_mode mode, int submode)
 {
@@ -46,17 +134,17 @@ static int cv1800_usb_phy_set_mode(struct phy *_phy,
 	unsigned int regval = 0;
 	int ret;
 
+	/* The role switch owns the ID override */
+	if (phy->role_sw)
+		return 0;
+
 	dev_info(&phy->phy->dev, "set mode %d", (int)mode);
 
 	switch (mode) {
 	case PHY_MODE_USB_DEVICE:
-		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_DEVICE;
-		regmap_clear_bits(phy->syscon, REG_USB_PHY_CTRL, PHY_VBUS_POWER);
-		break;
+		return cv1800_usb_phy_set_id(phy, USB_ROLE_DEVICE);
 	case PHY_MODE_USB_HOST:
-		regval = PHY_ID_OVERWRITE_EN | PHY_ID_OVERWRITE_MODE_HOST;
-		regmap_set_bits(phy->syscon, REG_USB_PHY_CTRL, PHY_VBUS_POWER);
-		break;
+		return cv1800_usb_phy_set_id(phy, USB_ROLE_HOST);
 	case PHY_MODE_USB_OTG:
 		if (!phy->support_otg)
 			return 0;
@@ -107,7 +195,7 @@ static int cv1800_usb_phy_probe(struct platform_device *pdev)
 	if (!parent)
 		return -ENODEV;
 
-	phy = devm_kmalloc(dev, sizeof(*phy), GFP_KERNEL);
+	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
 		return -ENOMEM;
 
@@ -144,6 +232,11 @@ static int cv1800_usb_phy_probe(struct platform_device *pdev)
 		return ret;
 
 	phy_set_drvdata(phy->phy, phy);
+
+	ret = cv1800_usb_phy_setup_role_switch(dev, phy);
+	if (ret)
+		return ret;
+
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
 	return PTR_ERR_OR_ZERO(phy_provider);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
