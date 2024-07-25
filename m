Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7986FC3DA49
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jul 2024 13:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LNLg0fYVZr8eseSEoLgvVAKnUDNzqxnjycuu7msSPtQ=; b=uqFkfDZxWRGYpF
	KZFRHMRjyQbeeHTqVngtLAz9aNdJgk0TTYaZ0tEWRL7Yt/wp8M7mR1c+LGgYupQbYEeZTEoUQ71zs
	stsmbvH3uBIA6p4yPgiDV/fJ2WX7ndIM53jwy/BDNr1wvPK4zfkYw6DLMNWQ3pbKxzpwG12vYIhmj
	COVK+8c5W7uA/zOl2kYQXOG6iSaFKXSV9+pa8UIkxdt2apG2TcLywE5WNRx9pV47Fp+zF4wF1fdmj
	gSpbGF6CQ/O5P2dpbpmSOJZbct4QUu9IIhIt4DHV/5/XgtMCeDpcPiJ94yO6dQ9ol76bHVemqrcaP
	3Q/kwXgURDXo+GifJkmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWyYS-000000015gK-440g;
	Thu, 25 Jul 2024 13:30:48 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWxOX-00000000sGF-2Tm2
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jul 2024 12:16:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1721909790; x=1753445790;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=64IhmAs4hcahlJtSrL3eGxK7HYUcs5RdttPIEWaVbDc=;
  b=R6/CgnxVZml6hpOyVmlMDOxCNfbpcN4egzWIQN3iTG2ZEh0WsTlAt4Vj
   5ZQEgcIIx3n02qXjA+qp3xOtL1Z0RtZGFm3MgXUdhJLcZgwfi+dJN0HQZ
   CaUVY+lHHxP4N+rLyhzhcVHibpivCKHc3BziiCpshavpVCiflfV703wJO
   HC4MTRaXTN4WoCJbAgyE13MOpscBSmbKXj7qG/k7vkBQx3HxSXyGjq0lk
   5hB0w6bysjXo5QXIzLALUWqI3jzXNYAIErAbDs+Sx8NJn54KimozXHnP4
   aH73a1NXf15myJy8L7dj33UcUY/vB/RUsdgs7hX3UHxb5j6EdhNj7s+WQ
   Q==;
X-CSE-ConnectionGUID: 8P89o1u9RvODQlJQJtKtAA==
X-CSE-MsgGUID: c8ejOUDnQOqBzey5a9a0lw==
X-IronPort-AV: E=Sophos;i="6.09,235,1716274800"; 
   d="scan'208";a="29678850"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Jul 2024 05:16:25 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 25 Jul 2024 05:16:19 -0700
Received: from ph-emdalo.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 25 Jul 2024 05:16:17 -0700
From: <pierre-henry.moussay@microchip.com>
To: Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>
CC: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 02/17] dt-bindings: usb: add PIC64GX compatibility to mpfs-musb driver
Date: Thu, 25 Jul 2024 13:15:54 +0100
Message-ID: <20240725121609.13101-3-pierre-henry.moussay@microchip.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
References: <20240725121609.13101-1-pierre-henry.moussay@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_051629_698663_E167CCA6 
X-CRM114-Status: UNSURE (   8.80  )
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

PIC64GX musb is compatible with mpfs-musb driver, just update compatibility

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
---
 .../devicetree/bindings/usb/microchip,mpfs-musb.yaml       | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
index c5e9ce2e7bc2..c8785a6c893e 100644
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
