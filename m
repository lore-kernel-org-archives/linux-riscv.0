Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5365C2BD09
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jun 2024 15:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eDCziQ3B43MbMhD7JdUZ9pwSWxIjfAj7WWNj/6fZwXk=; b=tPleCk7L5VSreC
	YGEh9gdgAeD4V80P13ZH60IPvImPTgsXarIfkp34aVr7DXFbIM0b4E0Z26ejdRlMJS1RN+fdxqEe/
	27JKBIMxGx9Pf5XriPr+zJ1A+G4o5krMexzHHsPFqgpTc8PQmB83rK/sFCaJ5fpQ1/niN66LdUW02
	g9KKwBFURD7YfJLNiB4Zqi5JolZi+wDPfJPQ3ytqRtYHwUbvw5S2z1D5SWImDcs9kCiN3aweRTtt+
	p1HeCepiRqP+5TQXxChzuPBmSpZ2BudoyWx4k98ZlHS2knyJAaL1/bH36oJQw3JE2q9nVpTyI07j8
	OI8ltiRTULUgvnvkthww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7W-0000000AslM-0qlb;
	Thu, 27 Jun 2024 15:33:10 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMr7T-0000000Ask7-1Zuc
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jun 2024 15:33:08 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 27 Jun 2024 15:31:20 +0000
Subject: [PATCH v2 06/10] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
MIME-Version: 1.0
Message-Id: <20240627-k1-01-basic-dt-v2-6-cc06c7555f07@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=912; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=PY2po3Bj1ntABWK9fjq/vZkGFvJuu4tsugdfHT2EW8c=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmfYXw/GQEZbe7eW7M8+DhxCJ+QctBkEXA5bFaA
 iwAqjq4eJeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZn2F8F8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WgPD/4+Xbup6V8OAAoD4k
 qsXY9JGINTyKvqveMpMIKBwYjhSI2xFLL6fQ5o/Qd5uVBa6NuyZnHSwXUqnKeVWnSa7nQ9AL6Li
 RRpZdXw9951HgEpzQwu93CUMha05DHboE+tgPOTKWiJZQ7w4sSUpX+X1Xm+uBupzejqXiARkMRM
 HPm00GsJtlXHPHIBdMNucOq6Vojshvt+bGldVGmncB6yjwMqIYmraJYAdhSSFxK2nWo1s2mW5aj
 v0V8UdidueFQM32jH8Eq0J/zfJ/hj7Cv3Shgrmw/xfA8C4MqD9H1PiT4i/kdQTKtF99cPTrN4QV
 pCcGKhKu58alylHYsf+4yw7vyfExK7TkhhuCylLOp2rRl73UM20OVokfG8EYUJLujBK4bs+xJUo
 QkoaPnBoK/pKp9J7i9VAzKGsaMSjZgkAYcS03exdLpbebNTykf8jTX3UuaaS/EthFTTSk+qhnJh
 eSU8relM4j7kbYb4fJSEY8kOyWUX4YxaYGc0RK0BP2F9BMvXxLyyviFzGrANrZg6TUI7rTph5lX
 p0WrOM2L0ptY3TS30TacRg8I2uwm0/U9dzheSh8V5Cf9wBFUsCcYX1NvmmtMjq31Rp3EYHea27Q
 ST3galSSdgOcT53TaAQTJDMQQ7sdXZUCT4Pj5+fAodawZig2K3sGNIm+npRfoDmSKVTQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_083307_494865_4802ED09 
X-CRM114-Status: UNSURE (   8.59  )
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

Found SpacemiT's K1 uart controller is compatible with
Intel's Xscale uart, but it's still worth to introduce a new compatible.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/serial/8250.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index 692aa05500fd5..0bde2379e8647 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -111,7 +111,9 @@ properties:
               - mediatek,mt7623-btif
           - const: mediatek,mtk-btif
       - items:
-          - const: mrvl,mmp-uart
+          - enum:
+              - mrvl,mmp-uart
+              - spacemit,k1-uart
           - const: intel,xscale-uart
       - items:
           - enum:

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
