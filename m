Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A57EBCF6497
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VG+0hB+xbSmBQ+cHW6gAgoEFxrTs+1zDDf+VaV0K4dE=; b=HZsqEwtBJI96OE
	sKpgBIPMTu4D/O4X3Dso2l0XfahSmXy8pJO2Xq6Xm7BrHD4+LR1fQ/l89jo6A0wJ4vhOH3A5YwR5r
	/nqWsLE3VCnQYDGYrxcJR3lVn270q9g8aC9VFonJU/Lc/7MbxT4A+DyrT8l0EoqnN4U9hv2Pd9wWQ
	NGlvKlnK9tIUfWV1GFPwAbquUVzkYfM9OXb5kVWwvTZ2IgNE/JfcYRKk9i4H35sVE7h7/BDB1+gNT
	Gj1UU8Bc/HOI6i7wfLaKbRjQQIOU27TicXnOp5x2whSlfMM7mNmRC7K6879gxcQsDCBOyK/jZbo9q
	8DxkSIsy0+3xeduTpgIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svDHO-0000000Gdxm-3gy4;
	Mon, 30 Sep 2024 10:05:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svD7p-0000000Gb1g-0QYc
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 09:55:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1727690128; x=1759226128;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=d6Utj+JguD6h5aoqdJ+L9X7NxnZGnIVxFRe79x6iqbc=;
  b=UpjKNszKg/TFNwBrMd5z7EqXuOolippC6TcQ32LZQtCo0aRT0+i/fg5L
   opOv0I7BIY6IFj5LtKVv40h4bE3a/POl7GEo4KQc/0ug4lTxb2paLVv5a
   oaiB57Bk4phdPhTD1wKp3Mbc1puLmM/j9UBqRcRdm/IZDA5TY+ic22d2J
   SdKErgqG54HejYcYjKJZww2QN0FLSF1j03ABzTUdn2z3MJPrkL2DBaaaA
   NzbDba7lIqMcti0g4IGDWfLBlb+Wu6xZud7+iFm8Wdy/YA+LxQPxdMxhB
   l1dqdcNgioGEbJjIY2yVcop2blBfeNTPURdUcu08EkoLkJfjQs6YSWsCE
   Q==;
X-CSE-ConnectionGUID: XiGZNwQLQnOpHGCFR5gKFQ==
X-CSE-MsgGUID: 9AoJVu+JS8e8q4pSHU4uWg==
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; 
   d="scan'208";a="32248830"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Sep 2024 02:55:23 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 30 Sep 2024 02:55:13 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 30 Sep 2024 02:55:11 -0700
From: <pierre-henry.moussay@microchip.com>
To: <Linux4Microchip@microchip.com>, Conor Dooley <conor@kernel.org>, "Rob
 Herring" <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Samuel Holland
	<samuel.holland@sifive.com>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [linux][PATCH v2 06/20] dt-bindings: cache: sifive,ccache0: add a PIC64GX compatible
Date: Mon, 30 Sep 2024 10:54:35 +0100
Message-ID: <20240930095449.1813195-7-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
References: <20240930095449.1813195-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_025529_241310_83DA64F9 
X-CRM114-Status: UNSURE (   7.20  )
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

The PIC64GX use the same IP than MPFS, therefore add compatibility with
MPFS as fallback

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 Documentation/devicetree/bindings/cache/sifive,ccache0.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 7e8cebe21584..9d064feb2ab1 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -47,6 +47,11 @@ properties:
           - const: microchip,mpfs-ccache
           - const: sifive,fu540-c000-ccache
           - const: cache
+      - items:
+          - const: microchip,pic64gx-ccache
+          - const: microchip,mpfs-ccache
+          - const: sifive,fu540-c000-ccache
+          - const: cache
 
   cache-block-size:
     const: 64
@@ -93,6 +98,7 @@ allOf:
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
               - microchip,mpfs-ccache
+              - microchip,pic64gx-ccache
 
     then:
       properties:
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
