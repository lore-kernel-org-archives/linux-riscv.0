Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 757DFCAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 03:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5FTu5aU5bzKwH0XRcoey4MUbUhWPUYCqpKbzNQsDi5w=; b=EmFBL5EvN4fB/J
	jJqRpf00ahm67e6aylIML8DV1vdgJl5FAOgbZwxB4uvS/adxmyEKDXmoZuBct2w5FYXP1suo4iIaV
	69l5cWXGtOgofnQdneRn87Usdo7yNz3Bgv4q8FG2RZYdMiC2AN9CoBhxQJlKgFT+CtxSDPHwbpq//
	L7VlDFIgDF6rg4RAmSFEKV7wjulvZCcj84TMudeDNoBjB0ivy78Z93qWrPOhA0rMe1x4VytwqMwTK
	m2S3NHVFWSG47cGceBiPFgLj9x0XDxWFE+6ttZNSJVtHgJJQJQSTPgHQIOYlZeuv21ydnbJeJz3bA
	nn8P3WpNZvogcJS5hQtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyj0P-0000000A59i-1zPt;
	Wed, 17 Sep 2025 03:38:53 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyj0M-0000000A56l-1Usj
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 03:38:51 +0000
Received: from [127.0.0.1] (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A319A341455;
	Wed, 17 Sep 2025 03:38:42 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 17 Sep 2025 11:38:13 +0800
Subject: [PATCH] dt-bindings: i2c: spacemit: extend and validate all
 properties
MIME-Version: 1.0
Message-Id: <20250917-01-k1-i2c-schema-v1-1-bd276b366d9c@gentoo.org>
X-B4-Tracking: v=1; b=H4sIACQtymgC/x3MTQqAIBBA4avErBtwhNK6SrQwHWuIflCIILp70
 vJbvPdA5iScoa8eSHxJlmMvoLoCv7h9ZpRQDFrpRnVkUBGuhKI9Zr/w5jC62BpqgpmshZKdiaP
 c/3IY3/cD7ZfnZ2IAAAA=
X-Change-ID: 20250917-01-k1-i2c-schema-faf6715d7b88
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Troy Mitchell <troymitchell988@gmail.com>, 
 Alex Elder <elder@riscstar.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=kCJWp3JQo7Ul2VLXlTTjnxcurS4jfdZsVWUeoxEaPHo=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGjKLT+jcVbQ9mbdO+pc6V7MsBoyymoCp7WSndSvDE1LSGBct
 okCkwQAAQoAfRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJoyi0/XxSAAAAAAC4AKGlzc3Vlci1m
 cHJAbm90YXRpb25zLm9wZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRCNUJBQjhDOUMzMUI3MTE1Njc
 wMjIzREMzMUFBRUE0NzU5NERCQkVEAAoJEDGq6kdZTbvtWmkP/1G7yZg775d2eLm6/NDSng5Lfk
 dnzQ0QplcxlL0ZOCEBOLadQmfSeEupPkxzV9BqFcDNbKtCedUGNAQLUB/KeqmPDo7uny4adSBhL
 66sudGMt7WjVxUXh2sC4h9p6skCD91iuOhEz4TS4eYJhWXF2R7pWieIf0I7qBfEAoMr755V7o3k
 e5DnNPoGlOQ53Fg0bPgA+teKfHQCn1bGiowidkboXFO5YLDJv7geWRoUEkj9hdSqE9Ry6A+ivVA
 q1fTN4GNogKmGRSIhlBVxZWg+MPMxW3SiSwYZh+ThMWefgMSowE6HLA5qP+EVkpOtul2Oj2vkHZ
 S2iIrbmC7/HHX2ty4WZNNSeoAC2YzZ951QsgAKsa3baME+gVYdKmHZClSfCbb/nxU6ttaM/TXHo
 EkffZcfv57vGmfIwT6Clj9zaW8EN1+8aWlO5M9e9khTfof4esde1wBBUkG6bvR46OS20AmSUGzT
 7i02riLBSwUy6eo8HCQ3qUg5FtTTnoSv288YUuYdyjkanc7mfN+SMpHYLUGtob5RG1ovSVH5wMl
 BNnlgGb7GsFCWmj8oPL2x8CBAdHn/7BXQw5fcoigfggX0AP/wPd+kpOCNpXK8jtnjJeHBHCCpBb
 1wKI0XYQz/je1IlIQndhnU2GiEScRHe77dkNqSpfPXfR6hLVT0t6z32sOM
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_203850_421883_0B430C38 
X-CRM114-Status: UNSURE (   6.41  )
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

Extend the K1 I2C properties by including generic i2c-controller schema.
and this will enable it to do the DT validation check later.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: i2c@d401d800: Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@41' were unexpected)

Link: https://lore.kernel.org/all/20250825172057.163883-6-elder@riscstar.com/ [1]
---
 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
index 3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3..226c600deae142413277117e25baae09f0918381 100644
--- a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -9,6 +9,9 @@ title: I2C controller embedded in SpacemiT's K1 SoC
 maintainers:
   - Troy Mitchell <troymitchell988@gmail.com>
 
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
 properties:
   compatible:
     const: spacemit,k1-i2c

---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250917-01-k1-i2c-schema-faf6715d7b88

Best regards,
-- 
Yixun Lan


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
