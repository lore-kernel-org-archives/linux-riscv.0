Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08BB5C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tTH3+bn3VV2BcJOw8tLiHfQ8Iyfn4KlJyS29kHuWFIo=; b=NL0mt/hnDvmFw5
	3zXYjcugMcDONAWHBAvCoUyC61omNBDfUm0DLxdSnGUSt8niz0zXg2MHJgXSO6G8BaPnsg7AYUuuI
	24eQepp5E8FuZVybUYAUSdCM9eOmD2Ztvi03w30vhSltWwlRE0BCXvmThJ9RCPkO7aJ6aXI/qZOPW
	cBlmrLfIdqbWUDga3BJoUmK7VHOu0PWVV+V06DM2BX4aYbVE02cHPxT8wxJt6QsuuewM/b19HGeKR
	waPIy20FOENhzCo+F87HwSJvwnncM9YPH7n0+lAXpnmwb/iylRM5RPaCJJ3rVqL52bDMKdjRWSRJA
	+eFyyIyNxrLTnpnqKGgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7B-0000000Asb5-026X;
	Thu, 27 Jun 2024 15:32:49 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr77-0000000AsZ6-486D
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:32:47 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:17 +0000
Subject: [PATCH v2 03/10] dt-bindings: riscv: add SpacemiT K1 bindings
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-3-cc06c7555f07@gentoo.org>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
In-Reply-To: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, 
 linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
 Meng Zhang <zhangmeng.kevin@spacemit.com>, Yangyu Chen <cyy@cyyself.name>, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1231; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=0ZjMf1/zFz8nSN0KohGoIaKW8DB3sA+2dQaSsEZNxvA=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXmVyqk3XHGF18KdlOJHjwS1qLj2fyXfZJNU
 Fgq7053byyJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F5l8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WVJD/oCNQBiPOWQ7vhCKY
 1MLVFyY1/NHqG40hGglELdn1zaG8shgO+/g82wa6bOGZl36WH4iZ1RlrAb/6jfRZG3oxa8dz11R
 AqyQXaFyqV31Qr3wN/jgg+fpS0HE3Q8Xui0LNfSVlPwHXIBezAPAQkvCrAuI/cyKJfrC71LO07q
 OaGKskyYMz0b/bsII1PSc/kfiXb0YgrbZovc5+Y5gJ7pArvrJms3KtT+tC9hdAVy6Pwj8INGSDB
 QjVfyjd7GwQjULx72lqJYOsK3bKPgyftmqd3a3HfCP3NSyTJo0lVnj50D3nO6ViLYtQJ/FRSgQ0
 jcaLj4GJCfB/kaJGbiGKLskgW+jc0t41vl7dxVcrnkF/dUjPgDgoLfW5ivX3T10Xtt5qF95mUEa
 0jlnG4/GkDmkXqJVI7+9hcylkZqb7fdd7QvP1aWT4qMIjf2x9wptuOSSXcoE4fWVhaYfpbRGi+F
 YC/hx080WgRQ3EfSzxq+AaQh2jD1rdMEjqiUqXtfSls9izSVN0F28gyTcjL/pH5Nx5yeuZfqzHc
 atbQYL7avYxxhRXWjEV0yUi+KBnwKiRGWXx5fbslIThSOh0BCbbja1GaJ3U1nYyFadDT8x1PHj6
 qUFM7G6ba1rpA8wTe6joV3Xy/GzF//f2DtCTTa8/Ju1qWJ5NTIXFS2IN5kFmaKFZ6FPg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083246_094973_91938E5D 
X-CRM114-Status: UNSURE (   8.68  )
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

From: Yangyu Chen <cyy@cyyself.name>

Add DT binding documentation for the SpacemiT K1 Soc[1] and the Banana
Pi BPi-F3 board[2] which used it.

[1] https://www.spacemit.com/en/spacemit-key-stone-2/
[2] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/riscv/spacemit.yaml        | 24 ++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
new file mode 100644
index 0000000000000..3b151fd02473e
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -0,0 +1,24 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/spacemit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT SoC-based boards
+
+description:
+  SpacemiT SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-f3
+          - const: spacemit,k1
+
+additionalProperties: true
+
+...

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
