Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC221CF649D
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 11:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mVPSeDRFci5s6gm5sJr/N9/E8pa5pJtwUL8jukd9644=; b=Vz8jHdoXlMKzsy
	IhT89BbxXTxLHoryK9w/8opvygO0Wn4dYfe/MeGKe9ZiWsVn+1m6gg/v3baXe2IiCPtSqHgfld3nv
	um+7eNd6WSyDxCPBFdQfPJQAPz5AFolLAgAQvofCgMcJLS7HgkCGJCTHzi+tRv5C+Fl/TSZAkuLQY
	maRZ2IrIWQPles9aUN47hnnXrrx0vkQCFVgn7GyvWOCqYNowuvJMy7nH/P5HEH8lFajwG5ybhrPaB
	XlGUpaLtY43LKpfUqTY9CptZanLtw0WjpzUoRzzzwRNc7jxKlDxNf3ma6dpqqyA6mczqpSG7VCeXE
	NlFG7JdKiYVw/7ZxcLaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svEN9-0000000Go6y-2HXw;
	Mon, 30 Sep 2024 11:15:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD81-0000000Gb3w-3EE9
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690142; x=1759226142;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5mAwCf2KTKF0dMxMdnGfGIOhZlS6zJvgYeAcb0167ak=;
  b=yOMCZKnA06Ti1rw7ltRedpKpUzyRQcpUxHVhlxljC54MyWRPqHyX96GV
   D1TZl3/HruM4sCKHmIJWcOEvUHkZdZYokxwWA5QKbD5AGTX9D+oFjO8WF
   Ng5p0IUAnjrffh12I9CtggQ4qtlL7HXWqfkhtLO86MLelJ7g63VwJvQDm
   k8U9x1/BRHQm2qst6gHJp+Fy3kdJzMcUg22gcRMpQCzQt62KctDS9q08+
   A4pzFuxtEr7Db1WOoPuK7WnADhrkZz0nbMZfCCoGBb5SBjSelSUnmIpq5
   08oR6Kkps7oKMrhb5XfJLuPIS3QTP5O8LZY1XcO7ifCYabwG5fMZ6Z2Jj
   g==;
X-CSE-ConnectionGUID: VDfGPtv3TTmpuSmsWgS4Xg==
X-CSE-MsgGUID: 38NTJN5vRem4MgjenJ7E/g==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="263420165"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:40 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:16 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:14 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 07/20] dt-bindings: clock: mpfs-ccc: Add PIC64GX compatibility
Date: Mon, 30 Sep 2024 10:54:36 +0100
Message-ID: <20240930095449.1813195-8-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025541_844526_8767A094 
X-CRM114-Status: UNSURE (   7.99  )
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

PIC64GX SoC Clock Conditioning Circuitry is compatibles
with the Polarfire SoC

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/clock/microchip,mpfs-ccc.yaml       | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
index f1770360798f..9a6b50527c42 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-ccc.yaml
@@ -17,7 +17,11 @@ description: |
 
 properties:
   compatible:
-    const: microchip,mpfs-ccc
+    oneOf:
+      - items:
+          - const: microchip,pic64gx-ccc
+          - const: microchip,mpfs-ccc
+      - const: microchip,mpfs-ccc
 
   reg:
     items:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
