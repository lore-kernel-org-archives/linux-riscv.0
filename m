Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA7C1C369AE
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 00:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ensX0YcYqYjD6sGjGFvQtLR9LisSctF8Frn2sqd5agE=; b=eaHIgjBszM05U5
	UKwkai+bBzYvriL6RcC+ZeLWAcvk2h2SjSRivztlmIDfTP/BfUe5TXWlpnvUprfRsLpMGOog/sXvA
	0vbdq5kgoK/syJmzEaVRfx95lBKXaIm5t7X255UY4W0r1ZAd9KXAxbWxTLZR3qAkUdBTUfNHvSWa2
	ZbVW40S/gEWoWkj+OCm0m5qrXwKHdvwzu/nocXrMeyjnSTnybdrkYK8hvuvpAJ1GsFOS8Ccfh8WiS
	dD+kzOKCmPM0MqsCeYvdOH8OelK25a0hoCV4WW/cBVG6be7PAyuaJzUGqJpJ2WHGv4If2nywKZae0
	LBOvtyOa5BtNVLbYgIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Oxq-0000000FBxE-1aBJ;
	Sat, 12 Apr 2025 00:43:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3Nrr-0000000F5cj-1mlZ
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Apr 2025 23:33:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qvR/g4byr9OfsrS+rTuPzpJ4d9r84ZFKfWCnbMSjrV8=; b=oyR9CNPsw/5YTBpDbCS5re+bxM
	xNGqb8vA4Tfr5z7gjFK00HsXP+d3PGs4hO3KS83RJTq27HRO2aRRaVBdKLHbF6P5ZvUemNWoPi+SN
	hvOWgVXo9eqbW9g44bw9vvhpPIXp1JwUZNH0rMw1i1gMzqH0f6qO5d727x+dolpiRgbi0i5UVbeaH
	DzqciEeRp8FV36zFcWtz0p9GBl4QnUQS4WtWrNvmv5O5Odg0O1mYzUcW8aSiXjPMlwxig67j6bPdP
	HAieZB6HDuHoxI9tZ0e6LSIJletDhZV9+SR5/+zNqSmkSY+pEDDctMt57HE2aw84DQIWkuhU2QOvm
	v5egNNCA==;
Received: from [2001:470:ea4a:1:5054:ff:fec7:86e4] (helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u3Nrl-0000000963i-3dmV
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 23:33:01 +0000
Received: from [127.0.0.1] (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CED6834386C;
	Fri, 11 Apr 2025 23:32:38 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 12 Apr 2025 07:31:32 +0800
Subject: [PATCH v8 5/5] riscv: dts: spacemit: add gpio LED for system
 heartbeat
MIME-Version: 1.0
Message-Id: <20250412-03-k1-gpio-v8-5-1c6862d272ec@gentoo.org>
References: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
In-Reply-To: <20250412-03-k1-gpio-v8-0-1c6862d272ec@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ez3lQ50wt4PHNJjw/2DzRy5zUu0J1UdIhacJCZQJdao=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBn+aZxfiI6vSFppUJQZcclFJxoGxukFzknzKGWI
 bSazNSymHmJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ/mmcV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277aefD/9NlWbYn29Msk3Awk
 JEFX4IoCMm//CCjVRGM9538q9qidfJrfb8Eoh93p+BTEL7GH9VJs6QUaXb5xF3jG7rO5vAtQD/8
 D7UjxTtBlKeW2TVsBVVIkPr/mX6utN4uERzdFF9gr/+7tI3TcMWeHt+nPknCAYq74gfdY2t0pcc
 xzW7l9Qpj026YMdE5OpU/obV7jTWPUaSdrISKV+Brj+Z5dQQ2JQt5Av8MMGeH0bgMjn1w79DZxB
 HfFWvzahQOAT7h+HXndZ7QMC3gT7mSRhFk+fH5xWR+rbasYseok12T3CuPm1tslK044v/kkHxCC
 YQeN/byAURzjLDPGFIy+LmNVs4d7IhDR2PVugjlpftNtiFfBlro1hgrXab13IfxbtpmjVs40PGy
 gv15fhqGtrRXvXuaWhPQDXnlgvtLYNm336jGAnWvYN0AUNFMQYEhQv6NYoHOEHbDW7FUC7VSZ1J
 w65vdLBlqOoKotUL/DUGo5TS8zA7rLDdKo0LFIQ5u0vZ50U2HT/FrNoOK+KopKzrEpL9CD60+Wj
 zYRG797irsmcXl/n5IEVPpoxswpUztkAz+3SILGSqjGYh/W4CxUjGYYTlLrNuvCxIYrr4kbYGz2
 YamsKUmzR2HZQHLUFr5KCuns0xWiv2sQE3baUi7A+4gZXTEU4xbMEdxKPQWxO7RKhZdw==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_003258_928802_7FF6AC46 
X-CRM114-Status: UNSURE (   7.58  )
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
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
