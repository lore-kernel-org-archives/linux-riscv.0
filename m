Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A082606A33B
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=F1j/khJ2;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Jlcl2b+c
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ckoSyRdhdNEEgi+LAtr9ipNJLn3KY+7lAQ1km/asINQ=; b=F1j/khJ2Ao2f9/6lNLor+dQ6QT
	9xQrEVvwnAeNk2qJZAY+ZN9e2WpZAcRBkz8bEA/YqbYdvYdCMzYiHYBcRbUITQfXGcx1mX/MGe0Df
	MtpPD6xm84x1TtYZcpblUyWW+nSC5LIrecjltSFjW8kiP80zCaIQsaqnfaUms85SaBFXHxhiIhdcf
	zgnpmua7yHRxlwjN6l0M2mGp7+QVQwF3v75TfNjfTJQYrxbXPglc0541YKeI26oPA7IlL/oRr7NIg
	rgKQGkA6r8lLYA0q0uU2ngaLPLkLa5WdyClwTQtuFASq2O4It3tITz/JS33S/BMLZEj+FLq0/kCQm
	/A/F8QCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwY-00000002jll-0LuV;
	Tue, 10 Nov 2026 07:06:58 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwW-00000002jkz-0xAC
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:06:57 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-cc758830601so1065907a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294415; x=1794899215; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
        b=Jlcl2b+cDlvDUAvyxPP/+bP+zmc04KaMOTkOb85TtUiMsGfnRaD6T5yPJzPVxCLCZU
         LtuZKE1Oswf2Ii8rOgh4keTlZXfE1f1Pthdr3aDa80zC5GMUqyFVEOXAAogcetx70nHP
         fGobQssW29dQix7qMTLMBXa/Yz4iaY6WXwU8Aba3949rdByArjCp5o9OfdCuos0uT5hj
         I2j9CQb8LpC/EHjSi5M4QCQ94fOzSgMzCeWgxIplwkxssPhgd5uF6/AJPbg+iksvhq2/
         1nM9g//rsFODfqT5SRYb8Qx1zk6utFaWHvomopZOm1HL19W4dFzjHj9KrVKiWLKahfVc
         UU8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294415; x=1794899215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c6zK+GaiWFIPNNFR8ZSdROw2IY+x8dIA3wZEKaYc0CA=;
        b=H2ivVBuvLecwFADmZMeeJ3DesA+3DTNIAQpWJjJ3wVWP11nodDHYrA41oT43kDVJh/
         0l6QHviPz/BcC5EPgiz5tB4OJAL6xIkiERH+9tTHkMiEptgp4grr7R9YVmnPfUhRDovq
         WtsOLZMPePgU/uG6jMuiJnwA2i1a1n4+i3I1zNr1h8oWRVYA4bq7M2RVZfrIaJsgdL7V
         Fnccq8YJN+ni8rzrgUVev4RsaZQJpskLPO6EG5NbmhdaS6ALCF3TJqIZEFXkBap4Q6oj
         yzHxMv3m1b58WbnLeX+hm6Ws6FqVxstPXnOz35e5ij7fL547crHO50IbSO0MJaZxbkoN
         WbhQ==
X-Forwarded-Encrypted: i=1; AL+hErGUbWPM4ViTS+7B2sxNbAgyPmZ/TJLdHdGzTFqcYvUEPbz21wOju2v4oK21hAkAGqv9c6dwiZO2NcSCCw==@lists.infradead.org
X-Gm-Message-State: APuU4Z+8reSN5mxqBWdFcTUnBtigqKPzxT6JDILWGWMF570ikdq4dSqF
	dc2am/50I3qJDaWDrHLwrDHqVxLoNALNC6K8bsUEOPnopEUenboTR8hy
X-Gm-Gg: AYBFou301Ih/3F0O/urT8vaNavDSVV5VhYLPkqQaVLhRWjfO+uaPthWzJr5grCc+TlU
	EkUtWthP6vBv/3acFeSigutvHVnZBfkvUocVMjaFEvt+blmI6D0l3+XCaNdmJQsCgeusihQVnPQ
	p2uKhgzOVkmRQhDdnDwbSS/OEJXmA1dijwHiy7y71aJRhH/5VgNcJJECQpa5CK6Zp48eX4Q2fBe
	LMXQN1+EwIsGk+jT50rCCfUlINiQFwi+5i4IleRFg4V2+5zQ46v88vmLrMeh7RueQpXBM59dtcf
	uhamGfVm1TbLT/W7bHlylfD9b3DeDic16+KllqrTvvLTQ6L6pRj3PMM3299YJN3YNcLc4h6LocY
	IV4wqB7mLpamOlYvNiGPdVTMmKZKVmigxc/fQvMLXEZskF5qe85YztirXqbWScKUePXManvGXlO
	Ug7g7Bh11Z7CcGOBDDkTdlngFEwYnSaanlaBuCGGsgDw0sE6qKvvzixDt8l2Tu51yt62UqTGl2I
	hpOEIsOUwYxBScoVG92Oh2Dj2uBGwp8Y5ZXQaWYpM+RCC47SFB5GlDHgMVG+1Hmu6aoHUDSS4fS
	q7uc9ZQFQAWKABwtDUM/RcCGRAA=
X-Received: by 2002:a17:90b:5101:b0:3b1:12ba:867e with SMTP id 98e67ed59e1d1-3b166c817c9mr2153597a91.13.1794294415185;
        Mon, 09 Nov 2026 23:06:55 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16797069bsm2551932a91.14.2026.11.09.23.06.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:54 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <chen.wang@linux.dev>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Minas Harutyunyan <hminas@synopsys.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Longbin Li <looong.bin@gmail.com>,
	Dinh Nguyen <dinguyen@opensource.altera.com>,
	Paul Zimmerman <paulz@synopsys.com>,
	Felipe Balbi <balbi@ti.com>
Cc: devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 2/4] usb: dwc2: drd: Sync the generic PHY mode with role requests
Date: Tue, 10 Nov 2026 15:06:23 +0800
Message-ID: <20261110070627.217946-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230656_276301_43229579 
X-CRM114-Status: GOOD (  22.86  )
X-Spam-Score: -2.1 (--)
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

The USB DRD does not reply on a OTG phy, which means the controller
should not reply on the switch behavior from PHY. Instead, it should
sync the phy state to avoid a brolen role.

Set the generic PHY mode after resolving the default role and before
updating the controller. And disable the controller clock if there
is a failure and it is disabled.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h     |  2 +-
 drivers/usb/dwc2/drd.c      | 48 ++++++++++++++++++++++++++++++-------
 drivers/usb/dwc2/platform.c |  4 +++-
 3 files changed, 43 insertions(+), 11 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 015a5fb7842d..298b418e6859 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -1400,7 +1400,7 @@ static inline int dwc2_is_device_mode(struct dwc2_hsotg *hsotg)
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg);
 void dwc2_drd_suspend(struct dwc2_hsotg *hsotg);
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg);
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg);
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg);
 
 /*
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 1ad8fa3f862a..1ad3804cbc80 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -9,6 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/iopoll.h>
+#include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/usb/role.h>
 #include "core.h"
@@ -88,6 +89,7 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	struct dwc2_hsotg *hsotg = usb_role_switch_get_drvdata(sw);
 	unsigned long flags;
 	int already = 0;
+	int ret = 0;
 
 	/* Skip session not in line with dr_mode */
 	if ((role == USB_ROLE_DEVICE && hsotg->dr_mode == USB_DR_MODE_HOST) ||
@@ -111,14 +113,11 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 	 * mode and sessions. It is the case if cable is plugged at boot.
 	 */
 	if (!hsotg->ll_hw_enabled && hsotg->clk) {
-		int ret = clk_prepare_enable(hsotg->clk);
-
+		ret = clk_prepare_enable(hsotg->clk);
 		if (ret)
 			return ret;
 	}
 
-	spin_lock_irqsave(&hsotg->lock, flags);
-
 	if (role == USB_ROLE_NONE) {
 		/* default operation mode when usb role is USB_ROLE_NONE */
 		if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
@@ -127,6 +126,15 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 			role = USB_ROLE_DEVICE;
 	}
 
+	if (role == USB_ROLE_HOST || role == USB_ROLE_DEVICE) {
+		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+		if (ret)
+			goto out_clk;
+	}
+
+	spin_lock_irqsave(&hsotg->lock, flags);
+
 	if ((IS_ENABLED(CONFIG_USB_DWC2_PERIPHERAL) ||
 	     IS_ENABLED(CONFIG_USB_DWC2_DUAL_ROLE)) &&
 	     dwc2_is_device_mode(hsotg) &&
@@ -160,26 +168,40 @@ static int dwc2_drd_role_sw_set(struct usb_role_switch *sw, enum usb_role role)
 		/* This will raise a Connector ID Status Change Interrupt */
 		dwc2_force_mode(hsotg, role == USB_ROLE_HOST);
 
-	if (!hsotg->ll_hw_enabled && hsotg->clk)
-		clk_disable_unprepare(hsotg->clk);
-
 	dev_dbg(hsotg->dev, "%s-session valid\n",
 		role == USB_ROLE_NONE ? "No" :
 		role == USB_ROLE_HOST ? "A" : "B");
 
-	return 0;
+out_clk:
+	if (!hsotg->ll_hw_enabled && hsotg->clk)
+		clk_disable_unprepare(hsotg->clk);
+
+	return ret;
 }
 
 int dwc2_drd_init(struct dwc2_hsotg *hsotg)
 {
 	struct usb_role_switch_desc role_sw_desc = {0};
 	struct usb_role_switch *role_sw;
+	bool is_host;
 	int ret;
 
 	if (!device_property_read_bool(hsotg->dev, "usb-role-switch"))
 		return 0;
 
 	hsotg->role_sw_default_mode = usb_get_role_switch_default_mode(hsotg->dev);
+
+	if (hsotg->role_sw_default_mode != USB_DR_MODE_UNKNOWN)
+		is_host = hsotg->dr_mode == USB_DR_MODE_HOST;
+	else
+		is_host = hsotg->role_sw_default_mode == USB_DR_MODE_HOST;
+
+	ret = phy_set_mode(hsotg->phy,
+			   is_host ? PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+	if (ret)
+		return dev_err_probe(hsotg->dev, ret,
+				     "failed to set default PHY mode\n");
+
 	role_sw_desc.driver_data = hsotg;
 	role_sw_desc.fwnode = dev_fwnode(hsotg->dev);
 	role_sw_desc.set = dwc2_drd_role_sw_set;
@@ -214,10 +236,11 @@ void dwc2_drd_suspend(struct dwc2_hsotg *hsotg)
 	}
 }
 
-void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
+int dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 {
 	u32 gintsts, gintmsk;
 	enum usb_role role;
+	int ret;
 
 	if (hsotg->role_sw) {
 		/* get last known role (as the get ops isn't implemented by this driver) */
@@ -230,6 +253,11 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 				role = USB_ROLE_DEVICE;
 		}
 
+		ret = phy_set_mode(hsotg->phy, role == USB_ROLE_HOST ?
+				   PHY_MODE_USB_HOST : PHY_MODE_USB_DEVICE);
+		if (ret)
+			return ret;
+
 		/* restore last role that may have been lost */
 		if (role == USB_ROLE_HOST)
 			dwc2_ovr_avalid(hsotg, true);
@@ -250,6 +278,8 @@ void dwc2_drd_resume(struct dwc2_hsotg *hsotg)
 		gintmsk |= GINTSTS_CONIDSTSCHNG;
 		dwc2_writel(hsotg, gintmsk, GINTMSK);
 	}
+
+	return 0;
 }
 
 void dwc2_drd_exit(struct dwc2_hsotg *hsotg)
diff --git a/drivers/usb/dwc2/platform.c b/drivers/usb/dwc2/platform.c
index ef0d73077034..ab39d6b36b19 100644
--- a/drivers/usb/dwc2/platform.c
+++ b/drivers/usb/dwc2/platform.c
@@ -783,7 +783,9 @@ static int __maybe_unused dwc2_resume(struct device *dev)
 		/* Need to restore FORCEDEVMODE/FORCEHOSTMODE */
 		dwc2_force_dr_mode(dwc2);
 	} else {
-		dwc2_drd_resume(dwc2);
+		ret = dwc2_drd_resume(dwc2);
+		if (ret)
+			return ret;
 	}
 
 	if (dwc2_is_device_mode(dwc2))
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
