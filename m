Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8259CCF64A1
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 11:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c1ETCOA61M1Co6PBddJwrIHz+WQ1VfFXajgZq53XZiI=; b=Shm6jBasUw4uAR
	Qi3THLzHG14uiejQWywUBL1wGjhjkIIotjoK5Znrl0RYl2J5zQLBwtAT6dwXIXhshuc6bCGCj+EyD
	O+fIGTYwpL4T0T+/6tEZt/Mn68YaQiror68t35itLKiDDhLZamwt0RSUREoBtNoMZzcoASK2GEntk
	C49JBvudQGoULooCkvw6PbLA0q+gpN2s0g/XOxp86mL/2MmNf7a473WZKWtICXyBWZR2iRWxZLmYE
	hip97igHPlnf1xhHlWORsO+Eu05dY59I+N8o+RxfPhRCJSFTGzthF5PBFCcSGYyvSP0kM9d+7xFZv
	sH9bRn4xnc/rXNGvf2yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svENC-0000000Go8m-1VRJ;
	Mon, 30 Sep 2024 11:15:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD8K-0000000Gb9f-08D1
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:56:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690160; x=1759226160;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VSJkJisGpUSWmMdsupkzWkWby0fbo8re3a+wTWfIqrI=;
  b=DJxXag8ZXK3176j3/r8ewgy9JmqvpfVLKYD1IANbeqZJjgbmgTXhML8H
   BG5vprWOoVM8wHxt8AnzIUOIwxJXA+baa/iox8k2+IKEwxeHbr7LrN5um
   ozMv5XfavQQ7l5yJbVDDVc/JvR32VFwjs+CP/aVrRJXU1+BGv1+ka8EvD
   eAd+k/p12y2nPoeLjB8D0ZMlMFEqKfFbuVxolQQZJQsGOBr5CV/0xBiNl
   JZqFPRmDWTImvwCxySivhdCNedBDLF5dHW7qd8DulwUsxhrau/5G9Zb/7
   bKbfLL59h0nYxJ+kHkuMP8XB95jQugapB1cpRaut1sDJTy9NZSTMx+LPI
   g==;
X-CSE-ConnectionGUID: jBRUFo6rTUOCd1OoCerG2A==
X-CSE-MsgGUID: lHowsV3YQjeRyNJ11Wm7CA==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32997924"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:47 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:45 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Daniel Lezcano
	<daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [linux][PATCH v2 17/20] dt-bindings: timer: sifive,clint: add PIC64GX compatibility
Date: Mon, 30 Sep 2024 10:54:46 +0100
Message-ID: <20240930095449.1813195-18-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025600_257260_48DBDD61 
X-CRM114-Status: UNSURE (   8.43  )
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

As mention in sifive,clint.yaml, a specific compatible should be used
for PIC64GX, so here it is.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index b42d43d2de48..60f03c5ed073 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -30,6 +30,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-clint       # Canaan Kendryte K210
+              - microchip,pic64gx-clint # Microchip PIC64GX
               - sifive,fu540-c000-clint # SiFive FU540
               - starfive,jh7100-clint   # StarFive JH7100
               - starfive,jh7110-clint   # StarFive JH7110
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
