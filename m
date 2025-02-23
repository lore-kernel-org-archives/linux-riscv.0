Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1818BC021B6
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Feb 2025 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKRhjWZfFOvrhyRW8mV2nuNOPQlotX4RIgiAsBjHGEg=; b=fw9M7eXZe0wBgn
	ZAH37IZ5KSTaTKs6AQPOXFiQ0c36GxJfUATKgskygogJcUzdVO1wmM3+sl312435bbF2ZfdRDNaoW
	xgI/3zhGn4aMsK6w8kyWKijygGbjnMagrtMtAr9VzSE4mMWaDjpm71jA2pTLNvz5xjILK2LqGK2IA
	iAukpw99mVNYyiOJ2DI03vagv42zMXBb5Q6YJh/3VljipvMfXkpREdrFKL6FXkzFU/s8MhHAax2wq
	AMx0TKjhA1vOenbNNqBSZmMnxH+0J4bgh6gq+v/89P2l22TUJb2loJx3ilsFJaukiE9fKilGSJ+VC
	r+TnLTvVExWaiR966n4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAWr-0000000B25W-36nB;
	Sun, 23 Feb 2025 11:52:13 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmAVM-0000000B1dD-1vAr
	for linux-riscv@lists.infradead.org;
	Sun, 23 Feb 2025 11:50:41 +0000
Received: from [127.0.0.1] (unknown [180.172.118.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6C23534317F;
	Sun, 23 Feb 2025 11:50:34 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sun, 23 Feb 2025 19:49:35 +0800
Subject: [PATCH v6 4/4] riscv: dts: spacemit: add gpio LED for system
 heartbeat
MIME-Version: 1.0
Message-Id: <20250223-03-k1-gpio-v6-4-db2e4adeef1c@gentoo.org>
References: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
In-Reply-To: <20250223-03-k1-gpio-v6-0-db2e4adeef1c@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnuwtstaTnHcyIlwwJ1iQoDw5MUSJCELE0FaGxn
 vbar+q+U+KJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7sLbF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277Tv7D/9QYZOiFPN/p0YDxm
 YMTwB+gLp77a+Pk/aTBd3Q1BBFDUSeh/QqIgL7JVqcXppSrsbCd8AgOxI38PhMy7/P3smmDwXeh
 rvM9uD6zCgNaGLxtZb0Q1N49aBbKSW0o7SAkn4rBOuq3sy/v1G4yJ3jn+fPhKEyuhk++Qr1MqhI
 c2qqWBMieiX+y9ImTan1SUG/PFwEC4QAujuxihknhm80+p1Yazk5Kv9+JC8R8bG3eEDCK2By5Gy
 o05qVWDOAkSYjRzU5mLL1UCbStLV/eqv92zRI2cf4UY8ny61mAZrxnv1cLiGCNB7O+3L2fk2hvR
 txkoYbKmS0omARR3IPUi8EbsTKmJv9aNcoT2ZEUvt95za/myl+el38ZhvdBqCDVfk2HsvBF02f8
 xqeZ/UVjvIrJxRmhINQ9sQDZOGX4wylCH/aEEYSD25uMF48buXyFyn7zRzAKzF8Od/nJIGPpTHG
 GWbw110Bx7pXyFkDAUzE8z6+JWGzHXxafVTzZOK0UiuRsGvMXAWkd8a2Ol4ts1fIw4ldyWHBVwN
 tyOv9K77nMGDcYdsM6b0WD/m9tMVQoQ/BmLxsnuSmhIxAdZTA+68tBipCHjszxZrNGQWZLYVHHm
 xTesnw9RD00Dk8VVrxcu4PUQvfBLLwH0nOX2fToDArsBz8mP0Uvdu4OFVVws0dOWBXNw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250223_035040_521020_27C475A8 
X-CRM114-Status: UNSURE (   7.23  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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
index 1d617b40a2d51ee464b57234d248798aeb218643..816ef1bc358ec490aff184d5915d680dbd9f00cb 100644
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
+			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+			default-state = "on";
+		};
+	};
 };
 
 &uart0 {

-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
