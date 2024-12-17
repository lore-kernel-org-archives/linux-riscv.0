Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9224E77187
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Dec 2024 11:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eLsWBHpzG9INI750pR+2DyIBPCgfLGO2vc1THpP2fYU=; b=Y232Oijs5qmR4X
	SawFYuyHrysXdcUk8XV/kDeR1xtwpYpz04kJH7rf5RB6tKwC9FaNH0eUl4rkux8sCqfM4t8/Y/fcO
	y09pdw+1gUqfH9ju+cyG9oE0yKwFmLp+DB7WW7UXLn6rYLRSjkFYLiaPINgjH45Mj8c0wmvEAu5UO
	oaJVthTNF8JyX/wgfuMK1kp/IMiMUX85vgetRBWFS2O1VwwaJA5qmzrAiF8X+FHP68AcH1IwKDdZZ
	8OGfdiKcm0rvQeExcmT3iWRb5Edo02EklLyulehN5/ihC3Bhyzg8GtFTAyG375eQRhJrM14ODKNU2
	8fXb1gG6noerlNk9VOGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVnl-0000000DG7h-1eRa;
	Tue, 17 Dec 2024 11:31:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNVnf-0000000DG5c-3McO
	for linux-riscv@lists.infradead.org;
	Tue, 17 Dec 2024 11:31:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1734435099; x=1765971099;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=xWSs+CCHo2cnkHp+YQIYQ9pyFy661acsmyXS6RC2uDQ=;
  b=Yyt79KOxcfYuFCjlwssBORUnLkBzp1DuC53QYqiAgwxwTv3YXzAriRAA
   2ybdEPesrf8szesj0TvDbc3CzEG7ho8uHFJW+uiPy7QRWhGlY5Uq+vzc5
   cdgoOvyXWNSnIFCQE5x94FSeshKeRBXY3ADQYqFsiEcjkFWseo/cfBLMf
   bPSzNVDwSlIcxKCEmzSe717fFRROYYQiJqRSHzDp4Y0ElSpwDXIlr/vqk
   G4krajtSNbBb5EVYx2WKw5OBqp88PV7RY1pnQycG420E2bS0hVlx4Q9TD
   zH3ClHAMEklmud3GUs7cIAhIdywlDicVZY+jaBCJSSSo1POIjC7EFAn/F
   w==;
X-CSE-ConnectionGUID: AFXRsVMVRgWVCl8fi3oPIQ==
X-CSE-MsgGUID: EywZyCDRSGiWVctJaBBzsw==
X-IronPort-AV: E=Sophos;i="6.12,241,1728975600"; 
   d="scan'208";a="39361179"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Dec 2024 04:31:37 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 17 Dec 2024 04:31:08 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 17 Dec 2024 04:31:06 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v6 1/4] riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
Date: Tue, 17 Dec 2024 11:31:31 +0000
Message-ID: <20241217113134.3508333-2-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
References: <20241217113134.3508333-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_033139_847343_06183FC2 
X-CRM114-Status: UNSURE (   6.85  )
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

Add Microchip Technology to the RISC-V vendor list.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 arch/riscv/include/asm/vendorid_list.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/vendorid_list.h b/arch/riscv/include/asm/vendorid_list.h
index 2f2bb0c84f9a..a5150cdf34d8 100644
--- a/arch/riscv/include/asm/vendorid_list.h
+++ b/arch/riscv/include/asm/vendorid_list.h
@@ -6,6 +6,7 @@
 #define ASM_VENDOR_LIST_H
 
 #define ANDES_VENDOR_ID		0x31e
+#define MICROCHIP_VENDOR_ID	0x029
 #define SIFIVE_VENDOR_ID	0x489
 #define THEAD_VENDOR_ID		0x5b7
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
