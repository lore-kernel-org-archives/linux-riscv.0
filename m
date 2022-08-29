Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FDBECAAD2
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 14:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4AaTP2eH+ygK1fR0K12nPf7C385fHkhF6a99fdLwPiQ=; b=lV5Ao661U8EMXe
	f77vpVauT6BiRiaBc2xVGWkOxVKguEMhz0nwa+XV4aV7IEEYrl+OEUTmyaFss2fC9LFrbWiOICI3x
	QJ808yEK4e+dIJbqfWZwBiaWgZLT8FHIacX6CKbe327fQDv3DxcCXywHKgi+KIOG/vqc53PGCNcjl
	PUiPV+cqTnE93k1bmmkU8jN2fyPUQU7m1m05w9SZv5cHp4TeJoxVCqs3lxbt3JZsbsI/Pp/kDM7/s
	okt9Qug+LoL7m1B+KWAjzvrqlorm1ah7kD9w/8dOoNSWLxrYN8Ue3nSbW/kmYHrp2mdD9MYh16i1d
	OOOwneKtIrqW3cAioO0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfKv-00Av2h-8q; Mon, 29 Aug 2022 14:01:57 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSf20-00Ancf-Cf
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 13:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661780544; x=1693316544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Dm77TZdDOsxyEUyf3mIDyCgCwIVjRlmyzDrQ7gf/weQ=;
  b=diTF9wP2K8xL1tboD3GgfJxHHF6kfGCBPC5oZ+w7EqzskPrbv7yWHcdW
   hP5qg4mLEK85AO1xO/wvpyG4EEGHw2R3hjyXapIzF9BwA8ncqf9VfEs6b
   UOU6pKjomn6ik0R4ZqrCu9zSpglL7YADt0K0CkBEBnQee3/+GQqL4BWYK
   dEUKgJLPJLxnu628pwWMaPIE01qqxl/d7UbvzX7xCqtU9/cL5TXT3aY0M
   cXZ5EialIw8M4sH4OMR0lagLzauPXJyU2g9JI6pDwjIqO0DVHd3DFCYqp
   Q/IXV1pgIKRgTmF3gX2/McREhcc83kNU4l6hHYkIYPzhz7vHWtIqubzrH
   w==;
X-IronPort-AV: E=Sophos;i="5.93,272,1654585200"; 
   d="scan'208";a="174633417"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 29 Aug 2022 06:42:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 29 Aug 2022 06:42:16 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Mon, 29 Aug 2022 06:42:13 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC: Cyril Jean <cyril.jean@microchip.com>, Lewis Hanly
	<lewis.hanly@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] dt-bindings: riscv: update microchip.yaml's maintainership
Date: Mon, 29 Aug 2022 14:41:04 +0100
Message-ID: <20220829134102.1248504-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_064224_577208_6317CC90 
X-CRM114-Status: UNSURE (   9.72  )
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

Daire and I are the platform maintainers for Microchip's RISC-V
FPGAs. Update the maintainers in microchip.yaml to reflect this and
explicitly add the binding to the SoC's MAINTAINERS entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Two patches seemed overkill for this, but scream and I will split them.
I figured I would take this for 6.1 myself on top of my other changes
to microchip.yaml.
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 4 ++--
 MAINTAINERS                                            | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 37f97ee4fe46..9eaa21769457 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Microchip PolarFire SoC-based boards
 
 maintainers:
-  - Cyril Jean <Cyril.Jean@microchip.com>
-  - Lewis Hanly <lewis.hanly@microchip.com>
+  - Conor Dooley <conor.dooley@microchip.com>
+  - Daire McNamara <daire.mcnamara@microchip.com>
 
 description:
   Microchip PolarFire SoC-based boards
diff --git a/MAINTAINERS b/MAINTAINERS
index cc549debe20c..7d788e064390 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17572,6 +17572,7 @@ F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
+F:	Documentation/devicetree/bindings/riscv/microchip.yaml
 F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
 F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
