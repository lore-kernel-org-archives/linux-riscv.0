Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15AC0C02185
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 03:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9OQSUzdHiUvgbJDh7gIyT+oJ9XqI3RQq/mol3iHh0Kk=; b=r1cy+UVAF6klsr
	TLD4Apud81xAuxFgjcJQkHXnKut0Pnf/9CBnqTUWovQyPvdtIyJcFjD3X+omOJ6RCgeuCv1Q2++QM
	xrc0F2HVYCDyhDDGijVgcAHkkuumzna8CAGBwz+J3dGpKCCok1pr1eh+5qmsdGEKvBnOY56nE6jR4
	chusElVaiEMRB3gVlWPDRpC68lguubaY78chDTXgjeGcvKhP2wBxqjks7lExcgaUwjHzubMCuG7zB
	a+3BAAfkglrk8GK1Bu1zfWKSjj/z+W55Zwv/7L1GKD9RLCcof5RbVgJxqT2gazPtsvMPqgkVfjEQk
	n5SHE7x+FvjoceXKqbhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56w-00000006pJD-1ASP;
	Tue, 21 Jan 2025 03:39:30 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta56t-00000006pHl-3xNt
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 03:39:29 +0000
Received: from [127.0.0.1] (unknown [116.227.99.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id AC411342F65;
	Tue, 21 Jan 2025 03:39:21 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 21 Jan 2025 11:38:14 +0800
Subject: [PATCH v4 4/4] riscv: dts: spacemit: add gpio LED for system
 heartbeat
MIME-Version: 1.0
Message-Id: <20250121-03-k1-gpio-v4-4-4641c95c0194@gentoo.org>
References: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
In-Reply-To: <20250121-03-k1-gpio-v4-0-4641c95c0194@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=lFZgZmhYkcEJpdHbY0qNXCwSjdIAVxJGoIVycN66Pnc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnjxbN7cmieyDopiKBskGZhPewqEhky6rj7e+nm
 r+eTauBPA+JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ48WzV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Z/OD/9Le1iIS9730td45l
 daTvXRkUpRuXJbi9xY2qV0ZFFLd6axR0h+qSRs+lzFJq3FakBWQL7mU3ujJAUyZOaaiXIvnjaVe
 eGzlLSwPZdPJFtMzRDQwD9T8IBmGW5J2/0mbLL86XuGupzjX5rwG1leyGDdDZscFI1twhsfcPzx
 x1ufuRyGDmuHBRGEAkQyXvOxIMOMihF/oyR5rU2eoHrDjCSuz+IZkw8kLiOykjZqx17kqNA36hs
 7Uqyu6SeM6azO14P6AAQMfCYz5dVzNDSvtnZnIukkkmTvu7AGobhYbXf0ADNk5EAVDn2HKi5nSW
 cMawJ52MJzaTmRtMxlrPKfs8wlsj+p9eYRN3y3DdxUMn9SJPJidnXlFiN5SMexTkLzSsXusn3Go
 plzxz5yGxyd24NnuyxAoSYV39l5joX55dYbV7btcFoHN1K1/dCZYQ12Vh6uJhLGWgqf00yjWeo2
 51+BjsdLKo/mV07Qu55e6+yXDOdYX5X+F/6Znd1aF0WllkeSwajalyzS2tzeH+rrB4DDecGQR4B
 AyPgM37APfTQd53GchBqfUkVMbMHNiK6azRoE43WZof3Vi7PGoWkgSpjcYwo2jloavHZDGw0fEe
 B+A7swy22jCgV8v243VgKwZE7ajQujsgki0nZ12DnxXnFLWYErSYnC7b9y/VzjwkWTYQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_193928_011095_8A6BD91A 
X-CRM114-Status: UNSURE (   7.94  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Leverage GPIO to support system LED to indicate activity of CPUs.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 1d617b40a2d51ee464b57234d248798aeb218643..6113e7523109076b99c493c8ac9ba69efd734620 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -17,6 +17,17 @@ aliases {
 	chosen {
 		stdout-path = "serial0";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led1 {
+			label = "sys-led";
+			gpios = <&port3 0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
 };
 
 &uart0 {

-- 
2.48.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
