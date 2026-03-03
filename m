Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 935EBEDA68D
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 16:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=16lXW7Om+SMb7aAtJ6MxfXTEjThRUtcZ2qXRDnEubRU=; b=bq2VU1i+aEUDbk
	7PZN5gxI43rQoHkVt2WhH5UWfT959UGGOM6mwqET6vBmjZcKfARvz1772uIJ6ebQ3l5Mp9uwUHfri
	bXPM5/XAcRuNWyO0Xmziru22nP5NSjoPhfX5v9bfBH7U0t61cSGhnqX/olDBa4sNqirj9WbD6IODX
	UqnqeSRq3hfGH6ydh5BC5O+M+c84OrCydc1HJBcovhfkKlmCVlH8AyXgvuCvFnZMfhX4JSH2bqPwK
	Fcs8VfFsV9sUY7tdS20mYRNdJo19hx9/1Wd2NssSKN5p6f1qjBkxdSlh2KdHPc3kGr29mRUqHE9C7
	U57ibzeedscQ+c7vfabQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSkm-0000000FamQ-1iH4;
	Tue, 03 Mar 2026 16:37:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSkk-0000000Fam2-3lEV
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 16:37:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 548C260053;
	Tue,  3 Mar 2026 16:37:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AC21C116C6;
	Tue,  3 Mar 2026 16:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555866;
	bh=4zCxRWHuSkku0YSduihXnooyBIGPdu7ySKeLPFfTZ40=;
	h=From:To:Cc:Subject:Date:From;
	b=L+PIsnkDLRWMzQhLSe6Aw4kJcPUMaGafo8ac3Pb55w324b0Gp8p+zD+agjL3lcOrz
	 An9/pHCZGP2GME+b9fbPG4nyQqlVNKyQ7UOaXDd8AXXb8rKqDrAE3DJg8FpiI/9UUk
	 KFahwsm1N0WWea/cmzP7pUQy+1m9uhCYX+n3c3GIzP84Vxkyd2YFALuDaQDFFk7bpH
	 fpxMTwCL4DL9ajWIdlNBFYXjYae0fsIcp+XGjjuMlDUfbro/oMWpTfn7yMja7+xgjW
	 SFJhq8G3Dr2vP5G7F3BvRCK6kqB4AulRQs76CjLmavO7FWNMAbUqSYl41EiI4jqBxG
	 rFOSwfAHYPVYg==
From: Conor Dooley <conor@kernel.org>
To: linux-usb@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: usb: mpfs-musb: permit resets
Date: Tue,  3 Mar 2026 16:37:39 +0000
Message-ID: <20260303-backspace-unhearing-c6cc8cbddbba@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=dpcvPwQiXhJxptNJ0T8pgqXJ5w228xDV3ANyBjxePt4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnL+YJZ/3FZeV7jE3xefTLpbaKVbNW2c+UWZRrMHPd+7 H/PeU+5o5SFQYyLQVZMkSXxdl+L1Po/Ljuce97CzGFlAhnCwMUpABM5No2R4WCT8dZZwrGRv3wD PH6k3Cmb5X0s0mbLu13+rLr1xancLowMDzoTJNKLFGfnzZFYf8z8R9rv5D6VHJelMvz3XrWtelv BDgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

The musb IP on mpfs and pic64gx has a reset pin, but until now this has
been undocumented because platform firmware takes the block out of reset
on first-party boards (or those using modified versions of the vendor
firmware), but not all boards may take this approach. Permit providing a
reset in devicetree for Linux, or other devicetree-consuming software,
to use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-usb@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
index a812317d80893..c4e1c2d73bdb3 100644
--- a/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
+++ b/Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
@@ -37,6 +37,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   microchip,ext-vbus-drv:
     description:
       Some ULPI USB PHYs do not support an internal VBUS supply and driving
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
