Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE9DDC3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VvQhIruBQQlQGa+0xfmr2Zx2q0wxAfaClNBeaCxG6v8=; b=JWk0l9+w004oP9
	ivSlMvuNWl0DP/+VGugbQgeFXiicfgY6H17AYEtZvnQ+b3lSqpjGTWPZzlMpq7P1sfPm8DWr0eN1Q
	71mVi61KUmw3PEyZrzdvh7DK255SzBV9vDZz2xJOgSrXqX1X9IEni+1RCvDMgXsSwRjoyrqrlwNfI
	yACyEiPI6vwklqY35WDFs781jQfiJLqLX4Y0ugfGhlZRK+gfnPqLx+M/MLNkR48kRoIS5KA462FvB
	ywtrP6JiHKnHkl8Hgqpes4JeQ2NcgQz6Eb4f9Bx/hedG7DUEObd2aE1C5vpc+a8ZT25cPw65GsGFT
	qo44umFL8EYTgeJ/BTsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Oj-00000005jFN-0rQZ;
	Tue, 09 Jul 2024 03:20:09 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Og-00000005jDm-2vrw
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:20:08 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:46 +0000
Subject: [PATCH v4 03/10] dt-bindings: riscv: add SpacemiT K1 bindings
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-3-ae5bb5e56aaf@gentoo.org>
References: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
In-Reply-To: <20240709-k1-01-basic-dt-v4-0-ae5bb5e56aaf@gentoo.org>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1387; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=npfgDVRP4ulLNRkxF5xAkZP/Tlf1HQh6E5OWv3kLTAo=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwl1olP6PkNb09RY9R6a+2b6KcslR6rjkpwo
 XP2Kr0Ocp6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysJV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277axbEACYHwqAIGjSupXIEa
 YeVXp/alZzj4lL3AWjM0bpIYiDp9pKctWC9ra5sF+ueseFyBiqW7otJ526mRwyBiAXmQm7TIXRT
 HmKpcXB2l9MkHIJCqSTL9wKWpzjX9Ry5H7VRzM8vJRm9z2JlFaPX1ErF3h1i8FVzxcuon0/Qu6O
 0ank7l4qG8xMvcUc1WzcWChrkQiBPPjbX2MSPDMlDbktPawCLjCAXdeUaLsOHOFIqwG4CGPUmRL
 1s+yOSHYh1HWQzO5P3tFCZWg0i42uJiGJmbM/YAbsnktULf880MYaRQawwOGrIut8bg1EhQMqBb
 tO9rQ7Utw1G0b164D6FGHlKJOeovmRVg9a1uyAV16EJQxnXzH1sX5Bvxneo9I8lfTHGqRzyBaR/
 Zjzu5nhGyvlvv8Ie7lM5vYLDB2zR2PjvtOkscYAVq2QOK/MP/NK1p/m5q2SxcgUmwVXeLKbAJUO
 pnMiSulPGJTY/+WEYDMrMR8C0mY2/cjvc/n5vwURVmmkxN0C/ulQYueOZ9jDwvPICnU4wFRuHLN
 QLhRUH4LUowA1yn/3jpw/NBPLTBMOZqw8viIQrCPViETC719Rcht6XK7/C5ekO+BOiEGUNFCvwX
 svEMcncFpiMsQmQkShS+9dFuAtZFuDl/eRyX3bbff2gRdc1NieasVl2TOxf5pQLTAi/w==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_202006_806817_00776269 
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Matthias Brugger <matthias.bgg@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add DT binding documentation for the SpacemiT K1 SoC[1] and the Banana
Pi BPi-F3 board[2] which used it.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/ [1]
Link: https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3 [2]
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Reviewed-by: Matthias Brugger <matthias.bgg@kernel.org>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/riscv/spacemit.yaml        | 28 ++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
new file mode 100644
index 0000000000000..52e55077af1ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/spacemit.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SpacemiT SoC-based boards
+
+maintainers:
+  - Yangyu Chen <cyy@cyyself.name>
+  - Yixun Lan <dlan@gentoo.org>
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
