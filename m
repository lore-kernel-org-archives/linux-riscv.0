Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3995DC30653
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 14:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZ0gdkcV2/mKyphuuLaV1K9aajR9m1rktbPhLU4QW8o=; b=MzuXSWoUTNlQ+N
	1thgYLsfE0TE9U/EEzoChD8YAet07pQuT9F9jcU529eiCrd82ZRkwj2ZgHg/H9gDb0wY0WRwt/M7D
	8uhbtkGDuY6y3dLQEbKNaiexHL1VJKy4B1plCLDjXr9rmyb2pKnphzLIOCW4TSWY33w4vz4avtrCA
	DJi98G6lsL62wb6WWWp34fs8tTEZi1WwojriRufLSyS6Xg/ICYDjh2N+KL/V8ydJisiwl6dKXFtcn
	kpzVQjL9IAoCTa4S3tf3nNCFtDCpWvBB8THxaYsE/o7wBT1r1dHICrruUVfTLOC9CZK16Gg97R90k
	WFJYhsBBlBcYDM+u2hBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1QB-0000000AZ2W-3vMk;
	Wed, 03 Jul 2024 14:57:23 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1Q9-0000000AZ0t-2pXh
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:57:22 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 03 Jul 2024 14:55:09 +0000
Subject: [PATCH v3 06/11] dt-bindings: serial: 8250: Add SpacemiT K1 uart
 compatible
MIME-Version: 1.0
Message-Id: <20240703-k1-01-basic-dt-v3-6-12f73b47461e@gentoo.org>
References: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
In-Reply-To: <20240703-k1-01-basic-dt-v3-0-12f73b47461e@gentoo.org>
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
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmhWaHMmSptOnr/OPT3AL7ue3HGBaaLS9L6fVFt
 SmnHVQleB6JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoVmh18UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277TWoEACZ/cu+fJlqsyNJnx
 zb++o56J7JkhUx7IvfXl062IMdW/16flA0fZCuVznqtzEALWHEDUKMplkXcxyusxoytQjoSspAN
 UjKI5bO2a2R3995xsYewM63V1i5EEdGvs4IZueDzkN7dLOpQIzM452jeTNM6DOVQeJlOrbTWONM
 ySCgpQzVZ2Gb/p0/QyMLkhJeqV5U0DyzVzHAc7kUE+YOaJRFCoaiOPspL2sO2bhLAAKc/4xDw7l
 3H5aPMi3+gJ6xCtVKucV07OEbpgYp0rBKXiikZY9HvitxnAIMzgXS9CKIOsmvLAvH3PNutfUJSk
 0PQ22qQH6zx1C2maj1ojzOeUj9lGkALmyJKY9ivvETG75PrL/DlCUz+ozTuZkoKupLI+voy/rTz
 nycpbW/9+oxNtpqRPPQ8edTH6AhBLCzaMBZAgHBwo3nj0reF6UXJy6JrbRC/BgMUNE2w1MHMNTk
 m2VIRtmAhDzey3EjUG5UuVlhaRjHR6/6kkKQhJbzuJjIdBcw6/lgo/9saepI/nczXVe0YWDR1Zv
 EzRwIojWDj0tu0QTpEzInCvR+M7Lo929MNS2nCeBo2sgYHxNTXB3HytCTwgq4B+IycIZdoepjaY
 WSPmGv6TIW4soqf7gGWIt/a74+2T4n/blD8un74YnH2gdxDETiosG4KMjRSslAoIqARw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_075721_799761_83284980 
X-CRM114-Status: UNSURE (   8.78  )
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
Cc: devicetree@vger.kernel.org, Yixun Lan <dlan@gentoo.org>, linux-kernel@vger.kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, Meng Zhang <zhangmeng.kevin@spacemit.com>
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
