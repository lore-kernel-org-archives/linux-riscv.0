Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C448CC021AA
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Feb 2025 12:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKRhjWZfFOvrhyRW8mV2nuNOPQlotX4RIgiAsBjHGEg=; b=kBnfDQwYnD/Bbk
	lODOxzylSFiP1D3YRfrvN3s7QFIq5Bd9zc25GEhQoCBN8bTkBdr/Jk/j6NZ2ccj89itSLP5VPo744
	/kFJ9l58X+d/lN8Uaal+/HqrkY5gkDevtLf7v5XuhUGwf6yQA4cadlA4kllRrd37EvGYFeQbjV5Tv
	vnYMowCHDgLFKltuhU/H5btkmz47xdtQuKfnAKcW3DBcyGAVjPjdVwBctfY06heJ53EkO34b0B99R
	99adnEvUI4azWJuwMR7ZnszhHh+sqlmyYWyyUoc0cz7vK78qoTF6u6P5fuuchBsmyl+nTV+b+Gq4j
	TN6Y7XRo+QDXKo8/ying==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0iC-00000004YAM-3BXV;
	Mon, 17 Feb 2025 12:59:00 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tk0iA-00000004Y8y-1BL1
	for linux-riscv@lists.infradead.org;
	Mon, 17 Feb 2025 12:58:59 +0000
Received: from [127.0.0.1] (unknown [180.172.76.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 82E273430DE;
	Mon, 17 Feb 2025 12:58:51 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Mon, 17 Feb 2025 20:57:48 +0800
Subject: [PATCH v5 5/5] riscv: dts: spacemit: add gpio LED for system
 heartbeat
MIME-Version: 1.0
Message-Id: <20250217-03-k1-gpio-v5-5-2863ec3e7b67@gentoo.org>
References: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
In-Reply-To: <20250217-03-k1-gpio-v5-0-2863ec3e7b67@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=866; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Npl1hf2K8C0HFRJz0IJdWyuqL8ZWAqWbXOrkZ95CiDc=;
 b=owEBzQIy/ZANAwAKATGq6kdZTbvtAcsmYgBnszJm0HWAJxy2mTQGedoLSD4oLkE+RdZtfPiyd
 EkQX8ki7hqJApMEAAEKAH0WIQS1urjJwxtxFWcCI9wxqupHWU277QUCZ7MyZl8UgAAAAAAuAChp
 c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0QjVCQUI4QzlDMzF
 CNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqupHWU277WkMEACWEq0KC8AkQFoqAZ
 M9mCR9BxNBPgd3SeG4MlzCrtXvmAcLK8UhKpf3y1u0QwhovsuBVTZNQQQ2DePrGxbbN85SvtK03
 J6A02R7uuQRVzx2G9rQC+gEJoqtn0PY/e+Xiv0FWyN+QJBmJtvCZFhKY7J/yMPWsaOS0BiE079z
 xd3NwDbQpboI+G43i3RG1wnpHnal33l2MNVHpKYTn8ED88TM5Z40gL8qR7IS5+UD/m8QlP9fduI
 ihji0GxfTVjBDYBk77Nd1W3bH4aS8o6gx+gGwBaeLS3M/7NXjBjfiGwDT85+vi49Z6wgDV/0giF
 /NzujTOAD10PlIMZSvech+gyhViUz6i4lTq4QdVKyTMVvIPgWV4PrJhT1Vm7fN2HftUSkoQo8nr
 10I1Rd3m8J+5L6U6z6dYdYP1ec9tp8kcvvVCmkslF+gr2+pBj3nWnbhJlS1gBObpfeGgtm4ov4G
 yoWLyif56PX1MLBE0O9EqRP6Tr9kTPatpy8crxtLqG5a+BaDWAKgYMNotn6pdujE98Nwzp1Q5vI
 D8fziLE7cLatqN8M1FQNE1/lzIwwmpfLLSNPYuCxJn0s0MNWRsi8hAGCciMJNza+ypzS4RdJuQU
 zEBEv4KpZu396XUQD9Rb+8ac7YvYaRfQMSpdJ/rAKXGL1Xjvi9oXeCC7rFf9jH0mqtYQ==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250217_045858_354132_57E01C63 
X-CRM114-Status: UNSURE (   7.45  )
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
