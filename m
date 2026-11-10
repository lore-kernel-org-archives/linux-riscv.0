Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E462A60A380D
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2026 07:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FyovdeOU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vGzkyScb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GLU+8T+UGvJeoMcdoBGrc6CPvtF8b/FoXLcrmdpiqd0=; b=FyovdeOUJ65VXzeQWEHUijGhuX
	wcsUhMNKK6a47zMykugRbqqmLmGwheT4jHd2UxL4wiCs4DJ1SJr+ZTJUzACpItTbYMs3z3d6JdjY3
	zUiiX/q3Ge9a7pzBJ/hFON7ZBqM2QEVD83JPgyzkropfhbu66R7bp0GcsRCK6pP/hPsk1Fnzs3LA0
	QTOwdVunZC8L00QiPBSBZ+wEYMBK0lCR3uFcWm3SA8irXLBjoYN1PmHj0psfQQHS7C+bldh7u3VFf
	uPLNPPWDBZQiCqS/d8r76fZha8BItcezsbGs8aIkfcVsVbcRMdfU20BVUA1cHsSXKA/A0i4bvYUVy
	t9MxOjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwd-00000002jo4-0Kk6;
	Tue, 10 Nov 2026 07:07:03 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQfwa-00000002jmV-12r7
	for linux-riscv@lists.infradead.org;
	Tue, 10 Nov 2026 07:07:01 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-8a9f9473029so1374082b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2026 23:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794294419; x=1794899219; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
        b=vGzkyScbbHtXBgn88a4K8zPCU5jQN5WNedHLW1N4b8yreTaG8d9zpcovUc/6vRvFHC
         514n/u4rQw6nY7p3MzOFYGRaZ7pYdbu3FvLjOZvx1AGqigE9NQsM7HYtq3fZipK+YxV4
         0hl+R8jK86l9FMW+img+VK0GK+y8trG6uS/ZdegclH+61BGt4ZxYFBHXb2JJRE+bDoi2
         7Zcl/6tLiLwJaqKLVr+2qXy1gkEkK4JzXagD1q78ho9SvTxYwZr0mm62Ihlv8BpCRA3r
         ScIANWJ0O36QS9Q38YPiQuqpJ2k4wMxZ7jr4bW6K9wtlpv3BhadJe7GV4rWEeo/uGISK
         DTLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794294419; x=1794899219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SkuuZSEDVNHqi2MBZkKa5e63wBL2AMVSTh4uSF9XF7s=;
        b=uQCv2aFjv360UnpXxKX8eLBe9EHrm+guviC8URT21vMjtT8Fh+cKztkiyxIREhPqJw
         7LDonDV5LhvfZeacvcScOhHpXQbG/eUFXLOLoq50ay0iLoUt00AG4xymQZ9aaCkkWUJG
         LYzmZKFBDZTA/7cIvy/0jEr1IbC2m/oJ47WBVxpIl+C0alP/PoVLSM1xAYS1IHidjLLi
         EhGxpwmrE6G8Av9Btvql42NTu3TMvVcQgAfH9WptSeV1H4BLvTnJc20BEUNOy8up/6Bd
         AtsculASRpgFSt37p5ocDF7N4fbZxjCV+/jKVGRWq5vTrR5kc5m74zY1BI1Ce4rntSM/
         1hNw==
X-Forwarded-Encrypted: i=1; AL+hErEuLk4OdilNX8JgVSADRKrmzagHbZOfsVnCDBP0gxQIl/k4iKH+1+8fkjtm26AhJHfN1jpUiswJhoa92w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+LkS2Tvh2F3ixBBuHRdOeTYFU5dyX/Hb6p1rf2UhWprrfZ3a1S
	EtfaBfjL3EefyvSW80v/IHDDb1Wk3lAd7KS4msqSwCPk3V+xJz+aJLdc
X-Gm-Gg: AYBFou0CxxP4Iyyoeb6fkjR5wIU1gby7GxdWDGt59VHA/b0W6DbcM591pbpjRvpbmFU
	uhnVI60v9HzdRgoatbT/dE4RNVlJLbTqr+PCI/BfefCSqBdDUFFbaE6IrugPXdggFFtlA9hp9yc
	VPRbYm1O9YJSKm5pRDY2vOwltq4molvaKVwzO4WwA0329V3bmioIUemAjj2Aj11D3Dg3e26T1x0
	OBMATBnQYFgFI5TDNinm9p4wl6AQrWPK380/q2uygegAyQOXFakIoVd2Q0gEjhd6NIkO+KUOGYe
	hjuOGLWFZgb5qRvr4yW60L8DeyyVS4L478sj+OVmi8cBb/jFFtyH1nfWerD69rcu89i6Naz02tm
	ZvwqsEv5yHylfHIBVj8UZzawkO0eAix2ZUesBy1VC2XMfBU+Vt/rYVdr0CzBojuPKF+m/NK4aYM
	1XC1G8foyTyZDRxTeVdialBR6Ui4MWhjlZf1gUmrVVt3WPvzZUOIvw0xWqsipeQky94IGJF1ZuU
	oD+GO4TLxdrr2MaZYgDCMd7JrQj6g68JYkMX15QzCVUMGQterNtXvnDCRHd0isQFQ53iHA3U5xJ
	NMhH7Ts9ot9ua3OT4uFvo/uzwvc=
X-Received: by 2002:a05:6a00:a85:b0:8b6:12fd:7285 with SMTP id d2e1a72fcca58-8ba83bd70ddmr2045184b3a.2.1794294419027;
        Mon, 09 Nov 2026 23:06:59 -0800 (PST)
Received: from localhost ([2001:19f0:8000:3bef:5400:6ff:fef9:667])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8baab8dffb5sm498961b3a.55.2026.11.09.23.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 23:06:58 -0800 (PST)
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
Subject: [PATCH 3/4] usb: dwc2: Add USB DRD support on CV1800 series SoC
Date: Tue, 10 Nov 2026 15:06:24 +0800
Message-ID: <20261110070627.217946-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261110070627.217946-1-inochiama@gmail.com>
References: <20261110070627.217946-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261109_230700_295630_1C6E70CD 
X-CRM114-Status: GOOD (  19.16  )
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

On CV1800 series SoC, it has a problem that it enters the role switch
with a persistent Session End Detected interrupt. As a result, GOTGINT
bit 2 remains set after write-one-to-clear accesses and prevents a
normal boot.

Keeping the BVALID override asserted in host mode avoids the observed
interrupt storm while allowing host enumeration and device operation.
As the BVALOVAL field is device only in the datasheet, this change is
added as a quirk.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/usb/dwc2/core.h   |  3 +++
 drivers/usb/dwc2/drd.c    | 29 +++++++++++++++++++++--------
 drivers/usb/dwc2/params.c |  1 +
 3 files changed, 25 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/dwc2/core.h b/drivers/usb/dwc2/core.h
index 298b418e6859..52ac64f67f41 100644
--- a/drivers/usb/dwc2/core.h
+++ b/drivers/usb/dwc2/core.h
@@ -357,6 +357,8 @@ enum dwc2_ep0_state {
  *                      case.
  *                      0 - No (default)
  *                      1 - Yes
+ * @force_bvalid_in_host: Set the BVALID override value to 1 in host mode to
+ *                       avoid persistent Session End Detected interrupts.
  * @power_down:         Specifies whether the controller support power_down.
  *			If power_down is enabled, the controller will enter
  *			power_down in both peripheral and host mode when
@@ -460,6 +462,7 @@ struct dwc2_core_params {
 	bool reload_ctl;
 	bool uframe_sched;
 	bool external_id_pin_ctl;
+	bool force_bvalid_in_host;
 
 	int power_down;
 #define DWC2_POWER_DOWN_PARAM_NONE		0
diff --git a/drivers/usb/dwc2/drd.c b/drivers/usb/dwc2/drd.c
index 1ad3804cbc80..4f7441a87c85 100644
--- a/drivers/usb/dwc2/drd.c
+++ b/drivers/usb/dwc2/drd.c
@@ -28,10 +28,13 @@ static void dwc2_ovr_init(struct dwc2_hsotg *hsotg)
 	gotgctl = dwc2_readl(hsotg, GOTGCTL);
 	dwc2_ovr_gotgctl(gotgctl);
 	gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
-	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST)
+	if (hsotg->role_sw_default_mode == USB_DR_MODE_HOST) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL)
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+	} else if (hsotg->role_sw_default_mode == USB_DR_MODE_PERIPHERAL) {
 		gotgctl |= GOTGCTL_BVALOVAL | GOTGCTL_VBVALOVAL;
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	spin_unlock_irqrestore(&hsotg->lock, flags);
@@ -45,18 +48,26 @@ static int dwc2_ovr_avalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if A-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_ASESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_ASESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_host_mode(hsotg) && (gotgctl & GOTGCTL_BVALOVAL) &&
+	       (gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_ASESVLD)))
 		return -EALREADY;
 
 	/* Always enable overrides to handle the resume case */
 	dwc2_ovr_gotgctl(gotgctl);
 
-	gotgctl &= ~GOTGCTL_BVALOVAL;
-	if (valid)
+	if (valid) {
 		gotgctl |= GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL;
-	else
-		gotgctl &= ~(GOTGCTL_AVALOVAL | GOTGCTL_VBVALOVAL);
+		if (hsotg->params.force_bvalid_in_host)
+			gotgctl |= GOTGCTL_BVALOVAL;
+		else
+			gotgctl &= ~GOTGCTL_BVALOVAL;
+	} else {
+		gotgctl &= ~(GOTGCTL_BVALOVAL | GOTGCTL_AVALOVAL |
+			     GOTGCTL_VBVALOVAL);
+	}
 	dwc2_writel(hsotg, gotgctl, GOTGCTL);
 
 	return 0;
@@ -67,7 +78,9 @@ static int dwc2_ovr_bvalid(struct dwc2_hsotg *hsotg, bool valid)
 	u32 gotgctl = dwc2_readl(hsotg, GOTGCTL);
 
 	/* Check if B-Session is already in the right state */
-	if ((valid && (gotgctl & GOTGCTL_BSESVLD)) ||
+	if ((valid && (gotgctl & GOTGCTL_BSESVLD) &&
+	     (!hsotg->params.force_bvalid_in_host ||
+	      (dwc2_is_device_mode(hsotg) && !(gotgctl & GOTGCTL_AVALOVAL)))) ||
 	    (!valid && !(gotgctl & GOTGCTL_BSESVLD)))
 		return -EALREADY;
 
diff --git a/drivers/usb/dwc2/params.c b/drivers/usb/dwc2/params.c
index 091bfcfef753..16db9c3c1991 100644
--- a/drivers/usb/dwc2/params.c
+++ b/drivers/usb/dwc2/params.c
@@ -222,6 +222,7 @@ static void dwc2_set_cv1800_params(struct dwc2_hsotg *hsotg)
 {
 	struct dwc2_core_params *p = &hsotg->params;
 
+	p->force_bvalid_in_host = true;
 	p->otg_caps.hnp_support = false;
 	p->otg_caps.srp_support = false;
 	p->host_dma = false;
-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
