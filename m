Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C6DC3DA7F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2024 00:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8mfY/mgIqO/sdDjpmdkBjNFYyNnTrnR9rq38k7j/KYQ=; b=oK10hNTA02E4Nn
	jy6jGhz4mKt8BnxewPMPZzpdxxu/xptDemFHhhSq4NoHH0sNII7Fk5uZhT9s3gzaWz72Yp0KpH1d5
	BqHRF2N2rgQeixpda7Y1F7qRvtl5RKXX6q3/bzD0wUAJmm5kQr0QmWRQ8y7kZVq4NH3tAon/6veim
	knuMJkfI7erEOPPKweySWYPkTF5nhxqBf65tf/GFm8RDESrbjqhjaHOSkzh9RL/MqeJc5dwRwwxqo
	M0GEXyQ+FbvKbBfQWtlcDWPbhwryRfj5uKAuNktc+yAcEvvzPNu5C9BTjJKe+UUIc85vDnXsGfZ0B
	3XPMOxHSXYFacfSXLc/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajc-0000000D5dl-1yQe;
	Tue, 30 Jul 2024 00:29:00 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYajZ-0000000D5dA-0yLQ
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jul 2024 00:28:58 +0000
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 30 Jul 2024 00:28:04 +0000
Subject: [PATCH v5 01/10] dt-bindings: vendor-prefixes: add spacemit
MIME-Version: 1.0
Message-Id: <20240730-k1-01-basic-dt-v5-1-98263aae83be@gentoo.org>
References: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
In-Reply-To: <20240730-k1-01-basic-dt-v5-0-98263aae83be@gentoo.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Yangyu Chen <cyy@cyyself.name>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=971; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=nHwvYdywHpy9Ex1SC+u0mjF5PBlfctSYARSdCiel5hQ=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBmqDOeACQkmqNz8RccLujgUX0H3zYx9CMmaCSK5
 edxiUR0V/mJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZqgznl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QaMEACIVaYkJ/6ugxM3Mc
 IRux6DVrB8QxxjZhp8P4LIpJTDL/M9P7yAdTGl8RmHntSFrL/rEvjjGrTLsSIi19ee0WwltRXXG
 7z0O+gUJPsF5QzhTxd9h9neFjHqHVVLxcPiNdSDAZ1ibVw8z8klQ7hGq3oxstJN7bYWD9Q4z4gG
 5GwxHGpm4aA9YsXHr/GFvk/cwuJ411ndWEAzxbzSVs7mDG+v6JDSJQjbKIUldSVe732JZkL/tVS
 3LlO8J0Z/djnvAb7WDo4GWBho4hJHr0pJhHQsOKgSaA+vzfAcTyCtENLKAjrBH5+hLnwoOv7KnR
 WUf4zZV/lIWXvqlg6NTchNvxB8vYoN/PaGrGCmuJPraHdsYJAfhX3ZKuBwQApAGaI/Y6Ja70e0Y
 XbO5lwiepa3ihDwMEpHlEmvnNiOgbzzD/Pyu9/26MK8nmHWLPZDmSFBoyMAbFKDTrs3wGlJAf6X
 AK+bn2CHEeyh9b1RF+Fy6iMYMXdUFscCDg+l7/7ML1MiWpMlZ96gQ7q3joJVAUM6MB7yP7joczg
 uD/Yvsi+N1ODPFAZ8V6hrDQGf1dj1QPmYPYXsthvH0RXrVTLtCW3T6thGmcQ2pBm77gwtErS9lY
 ZvAmmw4tB5aIS3sPaK4ul+MvTLIGb2QTz15wqN1iAmVHyw6uGCLBmpKsIQO7gFcch0kA==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_172857_344895_50160CDD 
X-CRM114-Status: UNSURE (   7.10  )
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
Cc: devicetree@vger.kernel.org, linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <jesse@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Inochi Amaoto <inochiama@outlook.com>, Meng Zhang <zhangmeng.kevin@spacemit.com>, Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <kevin.z.m@hotmail.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Yangyu Chen <cyy@cyyself.name>

Add new vendor strings to dt bindings for SpacemiT K1 SoC.

Link: https://www.spacemit.com/en/spacemit-key-stone-2/
Signed-off-by: Yangyu Chen <cyy@cyyself.name>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a70ce43b3dc03..30043488328b8 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1382,6 +1382,8 @@ patternProperties:
     description: Sophgo Technology Inc.
   "^sourceparts,.*":
     description: Source Parts Inc.
+  "^spacemit,.*":
+    description: SpacemiT (Hangzhou) Technology Co. Ltd
   "^spansion,.*":
     description: Spansion Inc.
   "^sparkfun,.*":

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
