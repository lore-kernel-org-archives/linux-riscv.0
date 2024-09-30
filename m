Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4DC7CF6499
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=00DlRTND4gATTNSY6TYo2ow8I30hCRbEuuip7BOTYTY=; b=BuTz7euSbbTkOy
	tNlKWjP24YIf+qflAT+FA7RvghKX8Vfjn1P5LZ414DVorf0W8l7O+c6QKokW+0WGT471XPqhLqu4d
	6i6+DfVGYb0hXBA0yzYDHcF7iU+Cqdb+8pmEUyKID1xDf3U4bCgLtE3EDuhW4FSrWL0WOq1HwxDfe
	055+m1VoYB1R2lXxTEz1UpPJtbJqptNPLiMYeXPcOadSQb+htm0by4vOKm7A/C2PQL7rAG+uBF3J7
	UuG1fE2m1D++65jimRX50ZBGl/YU4v1eL8KV9faoZ61bvyWfKqEGT41GnHRVjXimr6yCBeGumPmb+
	zHAEdunFVb67wPHaGEdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svEND-0000000Go9M-1ote;
	Mon, 30 Sep 2024 11:15:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD8g-0000000GbH6-2IZK
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:56:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690182; x=1759226182;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JwQg6M+ID4S53UTp8pzEQml2wbcZO+V6r5rXfWfGpoM=;
  b=RmBs1mvFxoZnPe5X7Ng+mQ0I5bVwCbeqWB+xeKlOmOcx6Rpdux3S0uUg
   sNQC021dTqVx1qGk0ffQfBmWBYPKbfkVyuDzpJriXtnqNQ4/+L71qbJCV
   +wVRkExGXmfy/wIPEfpx2OkFxwC+NVjDFwwB2FP5AGc4PuPdaJV88+ERJ
   WieFJz+VTQDlLFj+L1DaPbMaLhyy5wmz7sdKNC+kmsMj3dqX3XzweEIf/
   NvdyFOv7T1qkmJKpqnwbUiXhCl4zPOJy91hMk3M3MLf4FbaCFIGBUeVLs
   zQudO7xSt18FF/sLsFPcJn6OZ0xWu36tLdnBVo3dWSNaWJCv11iOBRam3
   Q==;
X-CSE-ConnectionGUID: 05QWoWIkRFGrt6egQKNmgw==
X-CSE-MsgGUID: TB6X3e73RsmkoPvG3qAjaQ==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32388027"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:56:21 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:51 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:48 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Thomas Gleixner <tglx@linutronix.de>,
	"Rob Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	"Conor Dooley" <conor+dt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [linux][PATCH v2 18/20] dt-bindings: interrupt-controller: sifive,plic: Add PIC64GX compatibility
Date: Mon, 30 Sep 2024 10:54:47 +0100
Message-ID: <20240930095449.1813195-19-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025623_086489_3C8731BB 
X-CRM114-Status: UNSURE (   8.73  )
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

As mention in sifive,plic-1.0.0.yaml, a specific compatible should be used
for PIC64GX, so here it is.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276b..44668318a8e6 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -58,6 +58,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-plic
+              - microchip,pic64gx-plic
               - sifive,fu540-c000-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
