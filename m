Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 252C7C369A2
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 23:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H0s2jYKY+P1/18elxew0/4bm9MaNbIVIzithGSodswE=; b=eP+1V9M1/jeVQ3
	/WjWBR/pyh1imW4+SGuIxfPmuqtc4mu4a4lsEBX7ap57zZBR1Jr/UA9kXpZKpN9ds9PuDGS7G8l/g
	mgptf2ktYZJijcNTZhWm9HxfLNZs/3n7e8tpzpXYaqqKP+RE0Gw8TNJR5uFw69kayIRAQsD/TH+Qr
	Pl0wXYvwLrI3RAVi45tjIs4acZyfVvI723dPdQnyMG+CnlwGzTfghUtYL5ud0VGoSiJ9xSz7g4M9H
	BFwYZwvYgAqlHmDYTCS8fusHZcIG2OSlqK6k2pq0K3D7fcnDs8evg/QgUlz07gqffN7qCOjUkXz62
	yuBz3irFyb9AkGpsYANg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NrV-0000000F5QU-40X6;
	Fri, 11 Apr 2025 23:32:41 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3NrT-0000000F5OV-0Njl
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 23:32:40 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 34AE73432D5;
	Fri, 11 Apr 2025 23:32:31 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:31 +0800
Subject: [PATCH v8 4/5] riscv: dts: spacemit: add gpio support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250412-03-k1-gpio-v8-4-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1793; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=YrlYG0PuIhX+fM4QE2J+VecM1LCm6wkTyVul/SahGUw=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZuc6Btsz8hWNLUclrAWt/vtKUFU9gDludtq
 lprgt5hbNeJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mmbl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dTSD/4tMEKx7GOf1vg9zz
 3MwpLQbUebhEVKxHuCpia83gNOTyNRUqHgnkSIfo6KrRMvIac1rcdd6e0kH36ivp33chnXeULhq
 g2yM2bybYNAlKBUegggSwITZSQ7O/I2mP1Bj8nlJzF66TvxEwrYN3pSeDNr9TX2HGPp9QV0CmbF
 /Mj4y302f7CGzDkup4CKL2CPZpigk9GZ/An4pcAUBT6u+XDSREQNHNKpnGyoVaK0MoCtPQgBC4k
 XfpLWKv4m7Ffl+fcB5derFJEEtCUhgtAYpJ+5qa9qUuwI9RFwwCiMP5xbW0wit7YMTpUIz6FX6C
 6WKSUI2+yWtFhYWtwITSq+dlLYDB6OFvVTUF1/fwEPQM2cC62UcmUtTxLzrFpFuSYf4Vz6BWzzA
 13Y4R+jJph+fZi3NRBvrFZ9AnQdkMTD9f9F7G0fj8y8djyhFy9xzI8K0kWX69PJ42u3DNYsKtlG
 6iDaVBwAJvQfZxEpM/+deZ0YsOS1Wdo9iux3b8TlBKimtkZvhr477YESXo0MbIoJqq0ds8oYKye
 EYYMfZjyF/san6oPnnPRMYioYmva9dkR+SgabXG+kHqra1QXrgFGe9lyWX85epGZViqg88S3bMI
 8ESy3j/hdsgO6V5TCB3RWt7KGMt3Qs57QlYlYqQYAIoI+1BcOai8G0kWK5rC7jrEYvwg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_163239_166968_9FBA5AA6 
X-CRM114-Status: UNSURE (   8.40  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Populate the GPIO node in the device tree for SpacemiT K1 SoC.
Each of 32 pins will act as one bank and map pins to pinctrl controller.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi |  3 +++
 arch/riscv/boot/dts/spacemit/k1.dtsi         | 15 +++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index a8eac5517f8578d60cb45214589ccb45ac376b9a..283663647a86ff137917ced8bfe79a129c86342a 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -7,6 +7,9 @@
 
 #define K1_PADCONF(pin, func) (((pin) << 16) | (func))
 
+/* Map GPIO pin to each bank's <index, offset> */
+#define K1_GPIO(x)	(x / 32) (x % 32)
+
 &pinctrl {
 	uart0_2_cfg: uart0-2-cfg {
 		uart0-2-pins {
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index c670ebf8fa12917aa6493fcd89fdd1409529538b..ff86a02c25f2e0818a48ed56c75e911d8612f6d1 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -404,6 +404,21 @@ uart9: serial@d4017800 {
 			status = "disabled";
 		};
 
+		gpio: gpio@d4019000 {
+			compatible = "spacemit,k1-gpio";
+			reg = <0x0 0xd4019000 0x0 0x100>;
+			gpio-controller;
+			#gpio-cells = <3>;
+			interrupts = <58>;
+			interrupt-parent = <&plic>;
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			gpio-ranges = <&pinctrl 0 0 0 32>,
+				      <&pinctrl 1 0 32 32>,
+				      <&pinctrl 2 0 64 32>,
+				      <&pinctrl 3 0 96 32>;
+		};
+
 		pinctrl: pinctrl@d401e000 {
 			compatible = "spacemit,k1-pinctrl";
 			reg = <0x0 0xd401e000 0x0 0x400>;

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
