Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12B8DCF6497
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/IOBl/a7lorMoKnX4U/ol56yUX19iFaxGlB60+4SYw=; b=mvXMRRrUgZP8qq
	Nv4VpqQZABLLmo4A0QP3lK2Net4oFXO4dIEyo6LrA/QsXiVRs5cKRKN/3gtIOfbdUdv6gqHHksWMj
	IFGF28WR6hX5rXZtsihaGPc4n+0s95S577IjyRpUR4/cP4A9XVnPvPxFvlQgVlVX789w2gGELEBro
	8AjCIhtBB8OCtCYU1ZLiZZU1BZjzzpjkbfHp7Y9cE1V8qmkCrf3UDQvanXCDpQHuY8w+Ek4cc+2DV
	hJGrvXANhrLaOkwHC+sj26CdQ/yYdyhtTbUHIFCTDrkmni82SI3RTAS/1/mXFENWNa25L9rcBp6i6
	FO+STJvrTqypR2gBDmzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDH8-0000000Gdj9-2iOL;
	Mon, 30 Sep 2024 10:05:06 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD7m-0000000Gb10-2BYO
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690126; x=1759226126;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=2IUWeqUfg54ZM/aTN3euYstkCkPDbRVAH5h9f4drcdg=;
  b=iok+b9Fw6ROEpBPMFB6TL2JnOvFoQc0t5fHhuejwESSapFqTY6PU0XJe
   mt3evWeTuNhTVmZLkwVYFn/ZrgCLIlOgNE79S+wPUJjkJybZFXKs6Dsmu
   XfUzzvq8JthgpS48KVMaCMUZIBsgGmRHneisr2LIcoQwqDibnQSPu4yj4
   5ay0gnOVlwyeTGUORMGie2RGJKc/bNhQQmTWUjREChjm1cuI3M4uah73I
   D5k7DO1inVMR7iyQRg27ZM2zLiq079EVNhCHUfCn5l4M3tL2tS+e/AzXy
   uvpvW74YYYQNpOhmXn6BpfYuD0f6AgZjPVOiB7cxaZ+mlO0pOp+tCS4mD
   A==;
X-CSE-ConnectionGUID: xGA0e8NKSjGIdIb5emHvfw==
X-CSE-MsgGUID: xN753j2QRd+kvlfvg4o32A==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32997882"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:02 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:00 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 02/20] dt-bindings: usb: add PIC64GX compatibility to mpfs-musb driver
Date: Mon, 30 Sep 2024 10:54:31 +0100
Message-ID: <20240930095449.1813195-3-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025526_713583_C2A9E9F4 
X-CRM114-Status: UNSURE (   9.42  )
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

PIC64GX musb is compatible with mpfs-musb, just update compatibility
with fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/usb/microchip,mpfs-musb.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
index 27b909de4992..a812317d8089 100644
--- a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -14,8 +14,11 @@ maintainers:
 
 properties:
   compatible:
-    enum:
-      - microchip,mpfs-musb
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-musb
+          - const: microchip,mpfs-musb
+      - const: microchip,mpfs-musb
 
   dr_mode: true
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
