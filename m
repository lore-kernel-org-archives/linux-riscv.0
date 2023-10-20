Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE49C0032E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Oct 2023 13:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AROjuTgcGEhK84zYt6YHFqTq7+a4q2BeOfeOJHdXVqI=; b=nhRqxi9rMBKbwM
	9V+xSkG4B2Y541GD8f14WwaVHMyGJ8bc3cwo1Hrcajs1QRMPZEDH0JSCZBuV0MWI+3ie9PtNIahsm
	ugoFVQbrrfhz5j2F8HVphb3qDfaKz9SvB4y982PkfxuWnofPaESIq+2Hm4jXdURpg/me5cJfQN2Hk
	wHrYZPERYrujKIgcamV3KEKU6az69CzXZWio8J2JhMVVHRSTJYxXs81p299AaY/sir7V1x43KdmgO
	HgIVyX7bjU9UAWh/HuwoZvAHBHzDPJKFRQVvXuQytokWYVOpQSUNTNrzHKh4UaiRK8xvEOg5dRmuZ
	HihkS3bVvGUiIsJBS8Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPW-002Lxa-0m;
	Fri, 20 Oct 2023 13:19:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtpPT-002LwY-0H
	for linux-riscv@lists.infradead.org;
	Fri, 20 Oct 2023 13:19:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DD4D262175;
	Fri, 20 Oct 2023 13:19:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 542EAC433C7;
	Fri, 20 Oct 2023 13:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697807965;
	bh=W8LXgG2ewDrzWiWrLL7NGWaY6JIzkSkX561ng7/xqFk=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h3cIYqErJepDbcFvotvs+dD9sDJOIxPNjIr9G0G0gO2dTLcPPBd/Q4lWc8rD40/jQ
	 GHhV0+lHhUhhepWoIokW5u0UiuWBXVUVNv+W8I6PZeQwpv8ayrjfIkG5jjLKuvGh6/
	 q8L/zU4UNZl2DRFOtmtAZup+6dmV1qOSeHnfkYTeZoGITqn2HToe/0eQ94ytmq1oTs
	 TwvyH0MEYxZv3tOJHhjv/4LhWpU8rqSYjqG+QVwkwXMxoHm+O6LiEODEjr/0qEanC/
	 qyApLdQCv5eAu29lg55ryg2M+M4UU8XWwteu6TiF9L+LwYOQfPfFkGjn5/AamgB03X
	 PAcLTODHfMrdw==
From: Conor Dooley <conor@kernel.org>
To: soc@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>,
	Russ Weight <russell.h.weight@intel.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/6] dt-bindings: soc: microchip: add a property for system controller flash
Date: Fri, 20 Oct 2023 14:18:39 +0100
Message-Id: <20231020-womanless-doorstop-758bb24e3c8d@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231020-agreeably-filing-3d48708e6262@spud>
References: <20231020-agreeably-filing-3d48708e6262@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1674; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QYNqtQRmqa8m1trQZrvsN3s3jWAmJoYnG1s4wHfPYp4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKlGdTpOMQmfSiarRtQZTPukd3Se5pEspmK2pXJpZ/3Lo vvqWY90lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCKaMxh+Mj4snGTN5ivkzmIv s9MyKXzNpi7ZeWEcE18nbLgYUXfQipFhuU7oyujkPwJsdnvuCL58bxHesZMh73jb7MDe6tbIM37 MAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_061927_225260_174781B5 
X-CRM114-Status: UNSURE (   9.97  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The system controller "shares" a SPI flash device with a QSPI controller
in the MSS. This flash is used to store FPGA bitstreams & other
metadata. IAP and Auto Upgrade both write images to this flash that the
System Controller will use to re-program the FPGA.

Add a phandle property signifying which flash device is connected to the
system controller.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../soc/microchip/microchip,mpfs-sys-controller.yaml   | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
index 365a9fed5914..a3fa04f3a1bd 100644
--- a/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
@@ -26,6 +26,16 @@ properties:
   compatible:
     const: microchip,mpfs-sys-controller
 
+  microchip,bitstream-flash:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      The SPI flash connected to the system controller's QSPI controller.
+      The system controller may retrieve FPGA bitstreams from this flash to
+      perform In-Application Programming (IAP) or during device initialisation
+      for Auto Update. The MSS and system controller have separate QSPI
+      controllers and this flash is connected to both. Software running in the
+      MSS can write bitstreams to the flash.
+
 required:
   - compatible
   - mboxes
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
