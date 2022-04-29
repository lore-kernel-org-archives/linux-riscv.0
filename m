Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37C0BC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 10:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0UbP2+h5Ui5Ema3kw6+oR2uhJr87Gi7DKPcv2UUvQ90=; b=ae1VvBo0H7nyEA
	xiP083Bpkv5+q4Z7tJbVa4bGz5x3RW21bPgaMgMmcSKxtXMJYl8P++D1p9eMgjNNPB2cb1iDUnsFx
	qXoZuieGadeaevoxegxher80oBnQlL1ijkOpTiu2NK6724+N0p2izumYu6XVPMXVK+vWCXDVVPe/p
	9Ych+YJL8vgCE+iSZHlpg+G/Lb3M3xLloDgacw2KKnQWLFbcGgEugbftftTF7kuHgYa9bzzZmsml9
	SKxS5H0n9m4tukGniKhywsRo0x1MiU+9gxMhYRU97hjNmGcOpZTjyVwjy6A7wuy5amZCy5TvkdCzv
	ftYGdpAcGDiImbrMS4VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkO4S-00ArS7-Q5; Fri, 29 Apr 2022 10:41:56 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkO4J-00ArKe-Of
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 10:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651228909; x=1682764909;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2K4Cj/6H3P1EYlVHdrvWMRjc7qbuEecaire9pzMT7ws=;
 b=sTSsVMottt1PInuvl1U8n0oyt8lf8RjGV44VCgl+NUExwNeBQyYBD+4U
 P6nfSoInyzS5+idHLi7kxhyvJkSvM0+CK/OW5hLmndnLdXslJ9NiGaEtU
 y3QD+AeRhnClzyApMzcDBYd+oQjVyFOPJjD0mj7MOtA55afQDB3ZdhVz6
 79KX2Gqtob4GCGsE7Tjxk4ResWiuZ7Rw4ThJDSzJ5VDoOhGSCZ1PKTa+R
 LX2zYECMeBWf5xQxetBGFOTJggBakPG69fv+5LTcpzzx0Hl0DhfTbNTmu
 wekV3+rNQzX3zZ9fNlsw2/p+GCP+NkWXQ6yhGwqT+kThxMa2JIhRNpZi2 A==;
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="161799776"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2022 03:41:48 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 29 Apr 2022 03:41:46 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 29 Apr 2022 03:41:44 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>
Subject: [PATCH v1 7/8] dt-bindings: riscv: microchip: add polarberry
 compatible string
Date: Fri, 29 Apr 2022 11:40:40 +0100
Message-ID: <20220429104040.197161-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220429104040.197161-1-conor.dooley@microchip.com>
References: <20220429104040.197161-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_034147_832777_48A4DF28 
X-CRM114-Status: UNSURE (   7.40  )
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

Add a binding for the Sundance Polarberry board.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index c9d8fcc7a69e..7f9296991a56 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - microchip,mpfs-icicle-kit
+              - sundance,polarberry
           - const: microchip,mpfs
       - items:
           - const: microchip,mpfs-icicle-reference-rtlv2203
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
