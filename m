Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54DA7C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ensX0YcYqYjD6sGjGFvQtLR9LisSctF8Frn2sqd5agE=; b=PvAB/kKiq0fa6Z
	F/n+7dvovEmQCoxB8Mxr0jb0rEeRHOLsNcmDutQMyUcfFEHIjiQAyXNH5UaCZ41k6NkEYSVBznCVQ
	FWeXlp4ePkFBxa/cnle1eosjdOcUzwC/14tZiw2ogqwjsoQ+fRVJwwWKG4WJrxprN92UZ5mvNh6H6
	xSZ3LncoJ76nrcUzdbb/CbhEDgox7yBoQk8FiyRDIA/B0NlL8ovRCVzdk/Ph8VuYegdWQph7gWCwf
	dtbYaJOIHZGnIMw9eQ7jG2Rtq0pk8tI24ywtH4pLhkLwQyGJjF4MS1t/eBMldwEki3EFnyazkK0FB
	f68gB7dtw+2GfvXJgMmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7u1B-0000000DiXK-1WAz;
	Thu, 24 Apr 2025 10:41:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7t5a-0000000DXt1-474u
	for linux-riscv@bombadil.infradead.org;
	Thu, 24 Apr 2025 09:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=qvR/g4byr9OfsrS+rTuPzpJ4d9r84ZFKfWCnbMSjrV8=; b=WxyJjeGFU8AkYrZwDC/ivDiYKi
	HuDjD08ZAlJGyuBnht8OOhYrNfYn5J/OpB54VZcTlAzvT43HmD962sgGygQMZleWOVEUUIXPKqFMJ
	lqB6zWo6Jc/JBgKGJ1E0j5t6c3wdf+LI/LMTDbkn9dIuq7OPEGbS82GQK/rId/PaBH1f/QjTEqpxP
	D0jeZW+UG05fxHM1vURejU+12EUh8niL4Se0/fHJP0xZ9Ps5i0pasGzey3rV43iP0u25mGKERIKEH
	gCiPUZo/yWMRjwb9qTxHiF37l2cyB1ie1cTm1oMeeFm9S2vTHd8oM1fJpLASZHpqRstTskcn04LxH
	8YWad/UA==;
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u7t5X-0000000Bh7v-1ySD
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 09:41:49 +0000
Received: from [127.0.0.1] (unknown [116.232.18.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E45B434300E;
	Thu, 24 Apr 2025 09:41:40 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 24 Apr 2025 17:40:51 +0800
Subject: [PATCH v9 3/3] riscv: dts: spacemit: add gpio LED for system
 heartbeat
MIME-Version: 1.0
Message-Id: <20250424-03-k1-gpio-v9-3-eaece8cc5a86@gentoo.org>
References: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
In-Reply-To: <20250424-03-k1-gpio-v9-0-eaece8cc5a86@gentoo.org>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=ez3lQ50wt4PHNJjw/2DzRy5zUu0J1UdIhacJCZQJdao=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBoCgdAmBX5357/jEVqEwzJuLUt67VkPKqKTHAhQ
 CiTV72qE62JApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCaAoHQF8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277QNWD/9wVcVpOMoU7NxOVY
 a/h4ApmeXNliJn4y9hpoPpa72RRi4ZQRB02C4zwDmbDoTD/Saz6NSijXK55SH6679EgSU/BAtLF
 VSexGbO5vXwmMzf0L7WN2fieNJRb3nlj1NbvSuMZ0tjEr8hbByDmEaKmlmd5WDyOHp8+U+Ea8Ah
 t1iqOgmDYmsB0X5kfi2OY100VjPO4CYCiz6y3tU+cVKkGI1kQVihgXFRuAJhD1z2mPfMgd4Y5Mu
 dgF02JChElvKAtQs1zBAPxTzMnzz3O1NkZdTGjqNtXb5GcwbI9SnXf38J4vjswKv4d1HTVN83Ec
 2gl/A7BvQpMZAo3+81fFN+jQFNCdabnfvG/TI+/QTvd6JtER3Kd2Igvc1hPMMH2J91paTS1yV1S
 /sgbd+EZkZBu7bU1rThnXxm8aHKHOIWXBXpCznSbWPwQYn6COQbX6i9ugTYLdlTM/m5EPsHBxLg
 VH0BBjUzq3I6ETnaCurjz1huKn08uwiyjsH+K9uWF+Wlmsp+7pijKOPLxEDD5pN2pfyKItlNr5U
 V442cSP+2jPpzwGCYN/775NAf+CTQseA7Zj6cb0JelG6e/WUEzodVy3qJcbDmZBiLN0P9MrWaup
 b1rUx/bd5NFP+tZyp7BRseGb0WdJxd4zRhfTdlP0CI71WlDYQ3x4sNcCjPmMOpx2CCZg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_104147_713301_643EFDA3 
X-CRM114-Status: UNSURE (   6.96  )
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
Cc: devicetree@vger.kernel.org, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>, Alex Elder <elder@riscstar.com>, linux-kernel@vger.kernel.org, Jesse Taube <mr.bossman075@gmail.com>, Yangyu Chen <cyy@cyyself.name>, Inochi Amaoto <inochiama@outlook.com>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
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
