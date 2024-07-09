Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0A8C3271E
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 03:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=etgJFFHupnvCll1HbjCmMqpODg6ZraXUsyvriLIsx9M=; b=mv/0q2M5IWp209
	748qyjQkcyiJqTOHrtoQcWbxKTfengPdMcBBjP/nPYALA04iCOZv280GZmSYECXtkF4NWYdeK5ZMj
	kZfy0q1i4/q7YI9uBeYEQiwFIUp+3k7YFiPJ2ZkCdJ1/XFlaCmxL9E0gL5yTAPl2E+oVCbYM9Xre7
	bhQJ4m8pQ335J8fBbmhelwx+0bXOeZvSgn3lFcpNEtysD/n8Rol0+o8zZecm7ZqpCW7mkDGKvAliX
	wYrp04wLGhAdBAD+GUoIm77RmVk/SqHLEKhC1fQyDo9Dq0GS3ibZtmZ+7iKzrMJLgTXRS8BV5INbe
	llHYgCN9RYL6w906qdpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1P2-00000005jPl-1cs2;
	Tue, 09 Jul 2024 03:20:28 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR1Oz-00000005jOl-2YhA
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 03:20:27 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 09 Jul 2024 03:18:48 +0000
Subject: [PATCH v4 05/10] dt-bindings: interrupt-controller: Add SpacemiT
 K1 PLIC
MIME-Version: 1.0
Message-Id: <20240709-k1-01-basic-dt-v4-5-ae5bb5e56aaf@gentoo.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=991; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=uv26Rjh9IKMB5x/gGwi/qL4b2tY6fy8LbhopCFjMJXU=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmjKwstwzcUEYU8NlT2gqRSHmCNdfMUwr/ZpvA9
 tC+o5qz+z2JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZoysLF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WuDD/4vHfXbieC7cc7EMY
 0AZYSeXlIzq7OUSDl9ewqlJIR7Q5+qslh7U7IsAkEOGJu2pChIZ4aMFBwwNv84lzVU3pScwacDl
 Lm0662CZqVTZwmatcXWeu9ZEHKC03wxit7haeBTnzbJ30XOk9bWCDZHlKaW5PE8pNKycufI7HuB
 4juHWrUw+tWnwVdCOaucC8K8Icw6wgVeTqwLAqO6ZwnWPH4Yh6XmQQGbUwXdyPWII48muNoM2Qf
 L01tG243KTIug1i2s6Gxr6zUI8dPDcnvPAj8Se4ETJn5yblh6LjYM88LjK2hJMllxKcy73EKbEs
 dOkQfc4P7b5A6dn2NZJXGhpPEd5umWwVcgHyCqLJ6nHIiLJOkL02GfqNsy+J6H1rwvPpdISvg6L
 xHFCU3gc7e+maKmvpF/DHLqDw/FDl4fVUeCqp/tEoNx4mrM5umU4cz6ZDryyA6BgfyhcZH/1yFe
 5ggomIhUtYMnjRxrhM3tOJboJrqa9iwGYIeiRWhBwETJbZ4epOlbxO/2aOcb8bSs0BOs4VXRVGa
 nFwUciiPcPsGFiVSmaKxHehji220OxbccmmT4RZMbdxGrT+IPAdW6N2+uHdS2nJmV3KiXCLSbbb
 hFi+h7tlfgYbZpQcwa8VTan8ZE+011n6SH47BgN8lDznQRF0DGJbQY7ps4arjIZhAvRQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_202025_712504_4434D123 
X-CRM114-Status: UNSURE (   7.04  )
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

From: Yangyu Chen <cyy@cyyself.name>

Add compatible string for SpacemiT K1 PLIC.

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 .../devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml      | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 709b2211276bd..f473ca3479efd 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -59,6 +59,7 @@ properties:
           - enum:
               - canaan,k210-plic
               - sifive,fu540-c000-plic
+              - spacemit,k1-plic
               - starfive,jh7100-plic
               - starfive,jh7110-plic
           - const: sifive,plic-1.0.0

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
