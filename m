Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEA8C3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZ0gdkcV2/mKyphuuLaV1K9aajR9m1rktbPhLU4QW8o=; b=ydU2B/atBJwQBb
	Q9/LLerT76ON2+2lSzkTIVLwoTB+OsnP/K59DJ43/P9DBb+AaAzN+ndPn17qAl8AbV5kjdCJurkWB
	XaiHacMgJhQx5ibLzP34gEMttb0cvlw8pbHXAYzSRI0sq7096Y7EbsjEX8W3pu4t/JnTUtiqX8n2A
	PxGyddmW0iPlQEWBzNQIZMuI12SskDIFJnmS83igt1wYQQ9pTeL/SSM+vEkVjmioml1+3DGhLvtQo
	wPbrgEOY5BlFJgLvc4+zPvhslKP2vKQXY+f/vLkdCJ3/Yn9EnhSJ7UEILNvr5lHqxEYm+bErErFGO
	zVnUVkzI5mTItePyPIeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1PB-00000005jVW-1bIZ;
	Tue, 09 Jul 2024 03:20:37 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1P8-00000005jSv-2CZQ
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:20:35 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:49 +0000
Subject: [PATCH v4 06/10] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-6-ae5bb5e56aaf@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=965; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=5e5axpOVSop7tU9RM2+kMzY3QIqZVpK1c93FNqEco2I=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwv21FRkk5FkIYocAXIKY/maxMvJHKDmj0+0
 ppH2Lb/LSmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysL18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277d8/D/9cmhj7g51nGosQSm
 pjoPG7rr9IJWuIEGgX6fVTGNhwQtTeILUZjBSc3X6MA6PBWSsLTIS4kgySSPPiv4irQY13Yp/El
 tqi/K7X9+4s1ewiWBPVI6yUzyHJiTi8iIeIOcOSMRT4bOP0nuBvRQopYf925i3e1N2bW/xqiaxf
 5CpNQWYNrDRxCv4FKHCwY/Znbwo/yaOGz9fy3hJmlrPGi2NgGVID5JwtbfriOY33jTtmGc14ZDQ
 XyMYoSHi+8Lusga8qyfGoUAfDL33M0wAMH5LvfhBclPI1jMPnHhOCnYKQaNoKZ2ZRQytDK0/2Ul
 NruqK7pH68f3lXrVMZr5IAofXR5kozl4/aDDrSXDFexb8L789vnH9X4Bk+1yEnADDeBRo27Ev/b
 IczxFjlxjnf4d/RomXBae+gTLSAe05PCDGyJP7o6Ap1Or5FCKHXLzFSD+wLaZVY8O9mT/JXZdoC
 YgWGvNaQ4cWeck698uauzFNGZMHW32MhH5QxXMCAz14jzDbVSEw/y54PrlvTl5qlxNdOR1lAh8c
 t+ICUnmOJeEiuZpjRRSfOHjIQbQGvLPNVcM73o7fx8Z60tFXLzrjq/GidIkp4yD2yIDGn2oflx8
 +JI/T1NA7yJRHmyQaIOav9IvCtC2zr9XfODTiWhPEZhbozU+3SElZZvIZiS26svlXPdg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_202034_633324_C48EBA20 
X-CRM114-Status: UNSURE (   8.64  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Found SpacemiT's K1 uart controller is compatible with
Intel's Xscale uart, but it's still worth to introduce a new compatible.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
