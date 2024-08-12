Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF46C52D7C
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Aug 2024 15:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fyDQ1lTvd/q8B0JiUMwzZw70rpZk2Aws5q3Sg39uXIk=; b=XG7o39rrHDVfT3
	bApFxoaLJ1O/+pgVUIYtDXmnMZ+oh+PXiR3i8bgzwzpbU4inVhk1EF4agBBgehBW64Ksm79jclwOh
	TLiDxo1A+PCw7zGZr7Pr6AU0/ShdGwZPTwAiyl6K5oQfHB2uNfn0YLgXibZ8S9iWYeW1+zgaLrY/q
	pBe0Dc4PKmc2QeVua1bbIGA7mgLXyD/hOyqefte1XWT09OtUV5DytG1+RDSYDGU4GQtz/T0ZDRMtX
	vBd7m+faDFNKvwNbkUlrKZ7LjupE25RBcBK+h8x2yPwDWrlaeWj3S1iptMD0yn+jv0qgCCCHkbOya
	DhTO8iCrj6VYNHZh5AFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdX06-00000000jpP-3AVP;
	Mon, 12 Aug 2024 15:30:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVq8-00000000YHL-2BS4
	for linux-riscv@bombadil.infradead.org;
	Mon, 12 Aug 2024 14:16:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6D0agwaQ4o15XmKg6FVHl6O2WBebwRVFDKLEMHRaYbg=; b=nhMrOx5BBvNsvulbYq25az5vh9
	EgMp49hhlJWgNh76CqIWsWdwI9xaX45QFxjnypDUesHVMdqZypKQDWoMv9+ENCeWqU3crp/0flIL/
	vgVZ/HGvKKGMgmLTFpEOOIk+JZb/RxdnkbymYdHshGHcfxuplwfN6BQ7RS/aAJ3G4enRbb2K5n53F
	NTYB3WwKsm28wlosT+BTEoQi9PQBxwWAOLI7vGHchYJUYZeH4uJ54zrTuHrR/EMcNkhjvFNi18iGG
	HaiJ8kE/WxDpFpyBpDi6dXbDk15eW3J6GM/x+wgovcocf/w59C5bp5CYXkHFZvhLo5B1i4A+ZBXDl
	LPawFJLQ==;
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdVq4-00000007aLt-1LEE
	for linux-riscv@lists.infradead.org;
	Mon, 12 Aug 2024 14:16:03 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202408121415550c85964b12766ff8bc
        for <linux-riscv@lists.infradead.org>;
        Mon, 12 Aug 2024 16:15:55 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=jan.kiszka@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=6D0agwaQ4o15XmKg6FVHl6O2WBebwRVFDKLEMHRaYbg=;
 b=ddLDs8jiXgx6FfgPtb0cBcHHEceF6B0HU294ClvP5CPmx636z85kSf8kNHZIkqwBIVSHU9
 mRvuhTgYl7eiDftfMwpPTJ47derrFWIdVePSULRvOZ0pYjqp+SoiwoudusIF2jnlYET9lkmJ
 YBTLTvCI0Tb8VfYvMdZ0lbfXnbCjkfUL1c7cxS+EH9TASG8+cHLHXdP4vRJUd6CmQn0WLbsf
 ObgPJ1O7+ZDv3xVBa8tIXlt8GNQ11IOirIS2m3nKHkMIPjgfJtOFj0TJCNxJEUN/NJWLh6Ti
 49Em4Efmrq+NX5W5bC0boI1rux8AIwwOCYCJgAXMvek2U3wXXID0rYug==;
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Minda Chen <minda.chen@starfivetech.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH v2 3/3] phy: starfive: jh7110-usb: Fix link configuration to controller
Date: Mon, 12 Aug 2024 16:15:53 +0200
Message-ID: <3ddd11484ffe22eee3459e1156cb4ee905cb45f6.1723472153.git.jan.kiszka@siemens.com>
In-Reply-To: <cover.1723472153.git.jan.kiszka@siemens.com>
References: <cover.1723472153.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-294854:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240812_151600_540541_5382191C 
X-CRM114-Status: GOOD (  12.33  )
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

From: Jan Kiszka <jan.kiszka@siemens.com>

In order to connect the USB 2.0 PHY to its controller, we also need to
set "u0_pdrstn_split_sw_usbpipe_plugen" [1]. Some downstream U-Boot
versions did that, but upstream firmware does not, and the kernel must
not rely on such behavior anyway. Failing to set this left the USB
gadget port invisible to connected hosts behind.

Link: https://doc-en.rvspace.org/JH7110/TRM/JH7110_TRM/sys_syscon.html#sys_syscon__section_b3l_fqs_wsb [1]
Fixes: 16d3a71c20cf ("phy: starfive: Add JH7110 USB 2.0 PHY driver")
Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
Reviewed-by: Minda Chen <minda.chen@starfivetech.com>
---
 drivers/phy/starfive/phy-jh7110-usb.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/drivers/phy/starfive/phy-jh7110-usb.c b/drivers/phy/starfive/phy-jh7110-usb.c
index 633912f8a05d..89451e740f77 100644
--- a/drivers/phy/starfive/phy-jh7110-usb.c
+++ b/drivers/phy/starfive/phy-jh7110-usb.c
@@ -10,18 +10,24 @@
 #include <linux/clk.h>
 #include <linux/err.h>
 #include <linux/io.h>
+#include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
+#include <linux/regmap.h>
 #include <linux/usb/of.h>
 
 #define USB_125M_CLK_RATE		125000000
 #define USB_LS_KEEPALIVE_OFF		0x4
 #define USB_LS_KEEPALIVE_ENABLE		BIT(4)
 
+#define USB_PDRSTN_SPLIT		BIT(17)
+
 struct jh7110_usb2_phy {
 	struct phy *phy;
 	void __iomem *regs;
+	struct regmap *sys_syscon;
+	u32 sys_phy_connect;
 	struct clk *usb_125m_clk;
 	struct clk *app_125m;
 	enum phy_mode mode;
@@ -61,6 +67,10 @@ static int usb2_phy_set_mode(struct phy *_phy,
 		usb2_set_ls_keepalive(phy, (mode != PHY_MODE_USB_DEVICE));
 	}
 
+	/* Connect usb 2.0 phy mode */
+	regmap_update_bits(phy->sys_syscon, phy->sys_phy_connect,
+			   USB_PDRSTN_SPLIT, USB_PDRSTN_SPLIT);
+
 	return 0;
 }
 
@@ -101,6 +111,7 @@ static int jh7110_usb_phy_probe(struct platform_device *pdev)
 	struct jh7110_usb2_phy *phy;
 	struct device *dev = &pdev->dev;
 	struct phy_provider *phy_provider;
+	u32 args[1];
 
 	phy = devm_kzalloc(dev, sizeof(*phy), GFP_KERNEL);
 	if (!phy)
@@ -129,6 +140,15 @@ static int jh7110_usb_phy_probe(struct platform_device *pdev)
 	phy_set_drvdata(phy->phy, phy);
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
+	phy->sys_syscon =
+		syscon_regmap_lookup_by_phandle_args(pdev->dev.of_node,
+						     "starfive,sys-syscon",
+						     1, args);
+	if (IS_ERR(phy->sys_syscon))
+		return dev_err_probe(dev, PTR_ERR(phy->sys_syscon),
+			"Failed to get sys-syscon\n");
+	phy->sys_phy_connect = args[0];
+
 	return PTR_ERR_OR_ZERO(phy_provider);
 }
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
