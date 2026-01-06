Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59851CD0431
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 03:10:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VVCh8iVv7BGiLKx4Xyn0H7L1W+/Nvnc/IRAbEz+Pt/U=; b=BhMyLqN2ZmYzQy
	JWE+j+d9RKgpXy2QMuTzCiUkj87FqO/JmXS15Sly94/YzsXWemLkzqrgFGC5zmRf1nFiOAMoIk51l
	Lr4WmxmTR5S34Y97j84ZcCR7VT7qbRYMxVQWQw4mnvT2tXfbbxAukqHHJi1Y6ZkBYXMFlm7hPQm0/
	lyUCvH9zlHAUUa+U4CckMt/SEe/Agb7Zd6eiAgyK/Jb2jSzNYTSdOwfGO2olIyNHyFx/G86J0Q+u+
	4RmQabrUQT8QGJyxWJ3teUavUD6OSITA5sZcy/UhpEobvNCKr1kAzs7sigc3QfE9gpyhjYTwBTyKm
	Zj+Nxc0NN/DnhPYIN3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxSM-0000000CMhZ-2f7C;
	Tue, 06 Jan 2026 03:10:02 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcxSI-0000000CMgQ-2LDu
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jan 2026 03:10:01 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 4F85E340EDE;
	Tue, 06 Jan 2026 03:09:52 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 06 Jan 2026 11:09:32 +0800
Subject: [PATCH v3 1/2] dt-bindings: gpio: spacemit: add compatible name
 for K3 SoC
MIME-Version: 1.0
Message-Id: <20260106-02-k3-gpio-v3-1-4800c214810b@gentoo.org>
References: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
In-Reply-To: <20260106-02-k3-gpio-v3-0-4800c214810b@gentoo.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=850; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=dQLEa7ecvgpS7Ee7d4NqYI+6qr0ttpGStWj+q/XjdRI=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGlcfPWiy8NgN1lhlSPSdjwYwFCYtvfH/5DNrT2W/69OX8ofR
 YkCrwQAAQoAmRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJpXHz1GxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjExLDIsMl8UgAAAAAAuAChpc3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9
 yc2VtYW4ubmV0QjVCQUI4QzlDMzFCNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqu
 pHWU277RixD/9RsZ4ahmHy3L2ndFBEy1vVFcQAtmJGnq0gTXtHFrWPd65233Xe3XCsKJbnkHq/v
 fH6/xL9qxBqVfclJgdN1NNHYRX6lk2sIJ4U+e4ZUj4O7eeEmj98mLz/pYj6yhI8AjfZUtxf8a6H
 ydknlqYSc+HGBpackCa0wgkpy40N4KMf5nY/3RyoElzbmI4Rw9OfuuD9OENFWlyXd7kf5YC9jTl
 qwgdmCnIQMTCLNusDVqPNk8eeLpzAbYiXIJ+KCI2bv3dK+9nTDlkZsLLZhOvyG6/lDI4VmxIxs8
 EcXHRc7is1kFXe2KvGkkucIBmtkRqFQ67xEORW07cMXn23GsCDJuKzm5CIOU4oWD0cWwp7tAXyl
 uA7jUBH2AqYwogH4BCeTZvilcsf4rAlpaD0QdX5t+Q9jFP9h7q0zmrDI5XdH9G2jr7Eg5BXfOYK
 SuEWbVjoZPxYjwY/a2iiUbaXI9e+RG1qNBOrQ/hAnU1BbxZCPY3vpJfzSWSP2iSrh2IyXh2njNE
 s+pqz9l6L429B4XnPy8GjlkMDXY2m0Wv/eQXFxQ+1eBu5X+yibGqd+EhfoqkYR4q0e9ZXiceQXy
 0d7taRhVSErRAi0hJ/2EXKbiRH3KlU68LcVreCz2I5uD0I+z67triiyeFyVIsXSUEF28EYhZXJM
 E/HuANwew1L8Cz4zp+4Eg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_191000_561740_52D910E0 
X-CRM114-Status: UNSURE (   8.12  )
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

Add new compatible string for SpacemiT K3 SoC's GPIO controller.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
index 83e0b2d14c9f..24d22d95665f 100644
--- a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
@@ -19,7 +19,9 @@ properties:
     pattern: "^gpio@[0-9a-f]+$"
 
   compatible:
-    const: spacemit,k1-gpio
+    enum:
+      - spacemit,k1-gpio
+      - spacemit,k3-gpio
 
   reg:
     maxItems: 1

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
