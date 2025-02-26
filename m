Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3B6C021B2
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2025 00:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKRhjWZfFOvrhyRW8mV2nuNOPQlotX4RIgiAsBjHGEg=; b=wJ5zbSEj8c3j8y
	2UrUcXooPt7vhJFX35NMFqUVRwEMqygfOsX72uIku7NH/9dlu2/NXegu9ImRtZgWTfYEMiRluxO5W
	QAEXlRT6y7JGL6QgVYvfSB2nSjCotA8VZgAG9E3vUIaqx+fqYUd8/bB+ylsIZquoVdf77Vtd4rigK
	5b1x1ngGvK7JoiXAmZdiKEIjmj5Vj0AvymVeJhHnI8gkK3YYpGTN6dZCbNgTRDDexETq6kmo5bUMS
	x4KpiqSehavcEJbjPAtTvIWJGyERHRHhKyAWmeXk8Q4BZOgu5iMmSAz1jdZ2Y+twZErARUA5eY5bs
	pEZeg7U7lBFbat3dGpdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5VZ-00000001teS-2TNU;
	Wed, 26 Feb 2025 00:42:41 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn5VW-00000001tcF-2Z2v
	for linux-riscv@lists.infradead.org;
	Wed, 26 Feb 2025 00:42:39 +0000
Received: from [127.0.0.1] (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 22E3E343295;
	Wed, 26 Feb 2025 00:42:31 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Wed, 26 Feb 2025 08:41:20 +0800
Subject: [PATCH v7 4/4] riscv: dts: spacemit: add gpio LED for system
 heartbeat
MIME-Version: 1.0
Message-Id: <20250226-03-k1-gpio-v7-4-be489c4a609b@gentoo.org>
References: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
In-Reply-To: <20250226-03-k1-gpio-v7-0-be489c4a609b@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnvmNZyVtJ2VkRubp+5r3iGXn4YIW33afvNJoLu
 PpABgGjFHSJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ75jWV8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277dtjD/9mTDjJxgSN+JWk6p
 5DGO6MfgMO5FXvUJDioNmC4UiQlPyFCqlrCTIVF/yuh92AVykFESB2Rh6Puwh+w91fYpC0kYKfq
 KAVAI8NWvfDLdPEZB+IRopU2AECe6B+QoEIt5nHROZ0PFMY5uf/kcGe6bP4tjBd43VX/eiBhffS
 Ta+9Tg13OAWa8UmcyxZPAEvEoZpbh1rCXnQhpF728CAOlADJJ9OZECgWqzsUSTwVZd5jsKPe90g
 gujQ12U5Nqkte3haRonoLlMz4HnwugjaWjqWscQcWBK3COEHya+S5N99Uvm+eYjDO122uZMAhlI
 NZDngPEvmcy0+hQ7dbGH7S2ZRZIPR7Jil7lm4bIIlgyfA72gMbVd4H+khRAkQleKFMHMeTFhQSM
 S+xqrOF/GpxYDfYwo4avTCXn9UXdDODkVp/YXfINlIbhZqtElmp/unxc6DAwNtmOJbTAEn+MbSX
 zr5SgVYhnek33iMswimiP/1TL9HEsH7IwmiQpmRnRq25uNqEnV8aah5b37Ob+BgwSdIBsdwZI3s
 sv8HGDG0iwd6y1/wXk3qYm1/cpzKl/S+OHbur869f6yZVGZK0TH2MfaXWPN79r0jewj+qT6MNmI
 MrMRZaVw/mWwkv7JbaLSlvKIEdIfEMFIZm41rDjD4968cui5ENqenHCP0mRxgwHacm8A==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_164238_690234_D195EFDB 
X-CRM114-Status: UNSURE (   7.65  )
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
