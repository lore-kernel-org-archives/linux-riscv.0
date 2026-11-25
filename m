Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43BB1606A321
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=27TcFY7m;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GF+1Udnt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=qozm2lcOffUPz/WiNaJnYp1R/5g8+mUOunaZbWLdh88=; b=27TcFY7mYzwHE6NUeSfP9ljgS5
	oKEvc+I90QRv0peOhWKDUu14dG3hsA4Dc9k33muBwVB35nBLEkVdxmg6lvenDMKOqD+z9p7KrtWUV
	6TeMDZqDU0GrM/wiKEb5ekQTzH9fI5cjVzB8EHeAk7b1koD5S+7Phec7vW80MCfCusDywn9tfB8SP
	wKAbDcyPGWxazXad6/aEMaCa7YdGRXvJzQKI8pmh6tfCo+zcEox9owERmKm++jblFcx+Kmnl2UWkF
	/Da99mU6kidrhKj7JnWjN98utyfeaTiejgauTr86xqzERN060LTAWxx7ca35e1Q0wwlEl7+trnvco
	2FoSfNOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iR-00000008vmb-1YGj;
	Wed, 25 Nov 2026 07:46:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iQ-00000008vm4-2ZAr
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 07:46:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5ED7C44311;
	Wed, 25 Nov 2026 07:46:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 910BD1F000C4;
	Wed, 25 Nov 2026 07:46:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592814;
	bh=40a2SxR2F++aAWEGeCskAj0ReXgihjjN31vR1BVlWBs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=GF+1UdntSeWb27lATOJUYK0ZM85tb2IzGIUc7ccDmhKFbXh9Yl7friVx/RE9TRE3e
	 7gRbCNxKOcOlUJIFo7z1C27olhEsNZi5vO7+yE1LX/XiHuDTob27h5n3rbyUBHS78E
	 V+5gfLmdXdcxQnMu15mENMmo8iGpai1RXROtG9mTKd734JolX2Vg06tUS/wt3pKe3m
	 AaQJbdcEAxdWUIszuLFrBavE4mhJu9bKKoV2XuYjUCiZDxnht60Iy4Z7XVODmzf0T8
	 /NUfAg6lEbnCDGIEODMZtWHb+ysu1MhqDDxXSXw1S1GWO86KijpUTDnQBJ/lI+ZSyK
	 FJQsxoMfI9ZMg==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:17 +0000
Subject: [PATCH 4/4] riscv: dts: spacemit: k3: Set CD pin bias
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-09-k3-dt-minor-misc-v1-4-dd887a8eb326@kernel.org>
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1072; i=dlan@kernel.org;
 h=from:subject:message-id; bh=YNc1vItrgHYyzAJZXdA+z/8Pr3LgzudsQKQoxQGoJGI=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJUlQ5XNwoXk5k7IVVIa5jI7eZycR9IEOiyi
 8XgfVh/C1GJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSVBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+19pg/+LKShy0zh5QYLystrUsbPBbb+zQGtCzzE246Tailkiy8GVhITAb0Mp
 d56vguSjRLlwg4OzyI19a7D7SWv+SKVW3Mcf1Hp90ZlA3s6uLkjSTBIoLDLNZpKZx6yYYTP+DoP
 46MnFNF12ljI7pApVHuF3n4+PnCqMJqpfyh51RyRrlaEOAsODrPLOYzwpZyJwsE/hPav1/0h64C
 ka0a0+MbOdw1w7Nbzp7o55tVbJQB0gbLuyRlva6QpichzKS1gk4lqpaFAQSxjRANk4m1Ew8TFvJ
 f2+6AI3M/+19g8mbrgKBBkPyMObfo8rFtXRlgQtHZFr6gdOJV9lxOmhHhxk9ktcaDeKForS+ywM
 6xEvwM6/1ypa4VgDkbbAArp59Ht9YWJb42PrYc1rIY68XknkOrCYj3RVt6ER4TCGYsig8WfOPi1
 xfOWQ3yz25U9WV5n+0dACHOzuUtRUQJZXBJnoIRj//6vKcIwuqeAzrE3kPxmGnbW68YCnSBWJG8
 6Mqgwqyy4QHC1mfATASLZzPQznZmZD+Hu0ylCQsXMP8tTt5nRnU375gG2ZJoGcc84uJ/10TaOkT
 Pt/ct2a3F774CrXNJSFbEa86qEcrZZhjO0+qy1g7+8sSUsIv4h0ECha+U3Le6zLRD3pf16wgaNo
 22o68gYAMZktPmSvIpGdLqs7z1HTG0=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Explicitly configure the bias settings of the CD (Card Detect) pin
for MicroSD card in CoM260-IFX board.

During the GPIO pin request phase, the pinctrl driver disables bias
settings in function spacemit_request_gpio(), this happens to work
in kernel side, but doesn't for U-Boot. Adding a flag to fix this.

Signed-off-by: Yixun Lan <dlan@kernel.org>

---
K3 Use same SD card slot as K1's MusePi-PRO, which needs PULL_UP.
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index 65c6f49f8591..598a53461afc 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -240,7 +240,7 @@ &sdhci0 {
 	pinctrl-0 = <&mmc1_cfg>;
 	pinctrl-1 = <&mmc1_uhs_cfg>;
 	bus-width = <4>;
-	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
+	cd-gpios = <&gpio K3_GPIO(4) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
 	no-mmc;
 	no-sdio;
 	disable-wp;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
