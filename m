Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B09C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 13:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tm/alBDBOWwpxZh/ujUhwzCAeKDBm7CO+GVAAYEG3eE=; b=vjnqGY6uz3teXC
	1aCWFrm3QmZEBWnLbdP3zp7f1wh/Lu53HGgCoc+fAEvCosuoStrkzsWFJsb0QbS6I1Pjf7RtEgrfs
	K2pLWwSn0Ho5h76lrKYPfP/95JxNQ9tdSZzZm9VkdokGF+zF1D5noAUYUE9T/HPtfF8McxVw3o+zu
	f0CCXe6X3OiU6Ofak1V5YVeMP9eThge74CGslkZSsHCVd3eVZV/BODjIJ3VdoclqNTEWfr1xiV5Jl
	znfas0V6+SU4r8V01lZaGIPp6CBTdkA4DqZiaHOV60NsYHSWgZ8qaHAN4k1GxdC5S5njPdkhH3cjv
	KcecQtQM+7zm/Fl2wMew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZE5-007iRK-CB; Tue, 07 Jun 2022 13:26:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZCq-007hII-R4
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 13:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654608313; x=1686144313;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=LQDcgmjT2JrQ2Qr18D6DElwaAR7teaFXQLxgT5axHxM=;
  b=WdIaz824ABbdtq62OdOlZXrSTX8lVdd6fbuceBvhtKUtf9uDkw/JQ47n
   yyyG1NYl1HzTx20seCdfRDPPFVZvmD6KwANPylrEnGB5l9qu/wQKIZDWp
   i76xFbC4LBu57zPWHQx4pw/d95kRbI50d58JX1VM2VlnxGBf9vABuaYOU
   Km48G0/t82+VmR9p4R2Zfj2WnEdfSgCte9VHvsYKpH3hsJlJKk1vMmsy6
   E9V1NhVFpc9A17XCsP5hp+p46YTz98xBorf7QYbyDeRpR1ziASYgM/Drh
   nXhdkW+Ta2HMj+/TGs0lzCOzvg95kvytN/nr19kteBiGuStzQF44PZfCv
   A==;
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="167094939"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 06:25:09 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 06:25:06 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 06:25:04 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Valentina Fernandez
	<valentina.fernandezalanis@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH 3/3] riscv: dts: microchip: fix icicle kit's dr_mode
Date: Tue, 7 Jun 2022 14:22:04 +0100
Message-ID: <20220607132204.746180-4-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220607132204.746180-1-conor.dooley@microchip.com>
References: <20220607132204.746180-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_062512_917984_82B203B0 
X-CRM114-Status: UNSURE (   9.67  )
X-CRM114-Notice: Please train this message.
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

The usb on icicle kit is actually configured for otg, not host mode.
Swap it over.

Fixes: 528a5b1f2556 ("riscv: dts: microchip: add new peripherals to icicle kit device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 044982a11df5..121b01c8784f 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -158,5 +158,5 @@ &syscontroller {
 
 &usb {
 	status = "okay";
-	dr_mode = "host";
+	dr_mode = "otg";
 };
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
