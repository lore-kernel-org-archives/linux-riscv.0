Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A4D7CF649D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1jmvH3EyVgXuzG5wpR5+P+L38ld7ZInmjo9MKrADOM=; b=aTHJy5O1LOWC7l
	sfrliidfxFvEAHX7wgmX8LUeLsO3zg/pJHnnKaVb5CTBTlCEL3Uzru8BLeNh9P4Zbj3ZlCdyRXaYl
	/qrAUi31A6DtCqfdzQCxsE4SXsqvLhc8YN7SGhqj09LFop+NpFyc7O6ZP9UByAE3Vno8R5u6kDK5k
	ApEKnKebJwFF6PqNEjD1QGKbY7Xku/WAC+t3Hyzldo8dzvt1zkiOhtexGpTlE0qhjFPBzv8kEnhoh
	iT/jjOU9RNuRPDEmzxGnTQhTO0Tv7CBalGJ17acxLTrU3KlEeO0rvaJc2YZe01/zwD7utQGtE8BpK
	PszS1LutR/5Pk21XW7BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDHM-0000000Gdva-0bCz;
	Mon, 30 Sep 2024 10:05:20 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD7o-0000000Gb12-3eYR
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690128; x=1759226128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TpKt6MhMi2zuIrSRA+D1aGCZIk1dlQh2zU8a7MH4I+0=;
  b=SbqNcKms8JDYPcYm0Cy7yNceGUlqz0N/GpxvKYtv+ggNP4XWPbSNQxad
   usclBktBsUZWW04aonMb33zzUeHF+RoaJw/9geZtHDF8t1QfMjDDNKECF
   N098idKWduGHT+G8Bu3Gql+5UjTJ+x8oq4v4nuQZFaftpAY3MCbXXQHGz
   uVMTeBUWYV+hatTJzBt7G0Husd1Je9wfzKSM5x3qeaor8nUiNyz5haXZo
   3Ak5Z17uv1x+f2tokgHmFKVF/J99Q4SoMwoidhH9Mi/rUmVbMQIR/wEUQ
   YT1v3Mb+5UVOW29FX6QILlaFRDVDdcFm5VeeTGJXTxGAaPO4+Gj9fEy+J
   g==;
X-CSE-ConnectionGUID: XiGZNwQLQnOpHGCFR5gKFQ==
X-CSE-MsgGUID: GvNnk9AqTkGOIs5Qegvh4Q==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32248829"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:54:59 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:54:56 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol
	<mailhol.vincent@wanadoo.fr>, "David S. Miller" <davem@davemloft.net>, "Eric
 Dumazet" <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
	<pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-can@vger.kernel.org>,
	<netdev@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 01/20] dt-bindings: can: mpfs: add PIC64GX CAN compatibility
Date: Mon, 30 Sep 2024 10:54:30 +0100
Message-ID: <20240930095449.1813195-2-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025529_000325_87163F4F 
X-CRM114-Status: UNSURE (   9.07  )
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

PIC64GX CAN is compatible with the MPFS CAN, only add a fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/net/can/microchip,mpfs-can.yaml     | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
index 01e4d4a54df6..1219c5cb601f 100644
--- a/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
+++ b/Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
@@ -15,7 +15,11 @@ allOf:
 
 properties:
   compatible:
-    const: microchip,mpfs-can
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-can
+          - const: microchip,mpfs-can
+      - const: microchip,mpfs-can
 
   reg:
     maxItems: 1
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
