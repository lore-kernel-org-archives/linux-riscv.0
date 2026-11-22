Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD9A6606A333
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 13:34:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WCesBoiK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j6ubBjpE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=R+NxCHdNjMOkLFM6Mhb2UOe8C71JfFf2AyrqEC2lrak=; b=WCesBoiKIBmTlPWDBVRbJm8piX
	QjuFq31nvkdg5Lospj4mPJlxbiRwOw8iBZN1rPRjYBEhxOmFUPQOSdc53/trLFHnKcUz/hW8q+f4B
	8YYEXtMtYYMNj9aaoSjUmEaseLR7TOhtCYer8IdSiW6mxbpozsU4YzhLSMjm/CRx0wy2Q+fzQm3ra
	xIa8YJEieZY62Cg//uoApPOlMVCMsiIqg30gOU4obxpk+O0rsxB9aUS9Cjfdc9m7SDe0+nD4IU8YP
	UQW0UTjGR9KyvUzhOd+yiYaYC3ho2G7Ld0F4dnM7ORho173UtErKKLXC0ky2Xr2vsRg33qpr6bH87
	xtFaPdrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7hr-000000018co-3rwO;
	Sun, 22 Nov 2026 13:34:11 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7hp-000000018cU-1G4U
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 13:34:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 146F843E43;
	Sun, 22 Nov 2026 13:34:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354449;
	b=dR4c3IbOXTh8suB+rkifGzrLzJMg3FCj13idiWiKWvCE64GchHxtvrxM2t5JY26S4R+f
	 Ob7C8g07AwLaVM7TUL7Ro08ACkNcSeWyMcBMH5oDtJ0Du3jPfUmcN/KH6YdQpHW2jKKT2
	 glNN1opUIVwkM5APVUwvQwYkBpK069zCXcSrTmGdC5tR1Odub5ShJEir9/MfjEr0X/jCA
	 nU390SPi4or/i2irMiYUrV+DqHuH7rv4liTksqGSEXRGHnJEjWA66PYFeT9aCmVKQM9Pk
	 gm/39YxGstgX6mEsEvjDPbxQWm9Q1Phu87RV+0k40CvtySN8asriByMTsDmBkUKbwsQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354449;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=6gKdivfkDsuonkEKXD54e3FJFyho7ssO1p7f34zC4sc=;
	b=NSz44hxRApW3N5OcgeQdyx6gQTmRVTuExs+QDvtRopcal37Rg0hwsTIfpVp4tI4yXb20
	 60xRNCzQWK0Kiqz1gntU93z3FWnqcD54NaELKvI8EOWba7CUcAzXX7IEwTxtdpBtIktMl
	 sbzecyiboW0NAZQpOxEAdHkAOqOBSbgOaJd/pz2w41pjNuenFmrwYbSmNfAbBZvc8kqdi
	 uJ9Y3+CZ69xDaH+elMBLpGE3AXHvh2afWUotRD2mr9JUOrhXVeYHSPtSVZ7DYudv6dU6m
	 ufVaZXbSzjzwa+jTvawv8uJeLjv8kzHcll8rcnp0ckekPgzvuctYToIcfTWt8Nj8cnw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id AEBB41F000CF;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354448;
	bh=6gKdivfkDsuonkEKXD54e3FJFyho7ssO1p7f34zC4sc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=j6ubBjpE1Di561SNA2s9h/kbXL7cjk8KGbIFotssHdQJfdSEBvqhBxsyWudkUS5wN
	 oKnK9rBNQEg1uzcYj+43LR9liFy6JwisI+Pfc/FVReBAfY4Zmjmdu7bXNowd5LsxTw
	 ttq+5xbPL2DkfB1E5/E/49O1CKYGW+vVVxW+FrQGf1uSyG08ugD82eVm03fqDmItdr
	 YsBH/ZlQD8Pi2weETXkfO4tHIHQhppR3VNQLBWkU/nacgJQbNgkyb1cSxkdHkMePWJ
	 +074xkCYUobitkqUQBDRj7ioV2ACwzUfWszqWK0BxgaewhSLfzUqfYfHb2hwopUV4t
	 jS+oRYLWe8T7A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3E39A4C097;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 22 Nov 2026 21:33:52 +0800
Subject: [PATCH 2/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261122-sg2042-evb-rtc-v1-2-f222c64cc7b9@iscas.ac.cn>
References: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
In-Reply-To: <20261122-sg2042-evb-rtc-v1-0-f222c64cc7b9@iscas.ac.cn>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Chen Wang <chen.wang@linux.dev>, 
 Inochi Amaoto <inochiama@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795354439; l=1232;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=dsm+CVwClowTlroI3X7kDbQ0hyzBtl6KTIdw4zXB9XQ=;
 b=qwqJvbtq8jL/cGsYM8JQ5HPgmkdDxYsgXikkAtQRg+8ODgaUl/jaCYQw+zMP2WMCqCC0RHIFp
 3TSfMaGnVjbCUT8AKnKw9LwtrktPsPZ5cbSA1MNiai9u+pAYm1mpbSj
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

The SG2042 EVB v2 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
and add the RTC node.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
index d8c5814f22581076e6b5114f762d4fd090681b80..0dcc53b519971396a5ce734108ea0386fb186726 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
@@ -124,6 +124,17 @@ &emmc {
 	status = "okay";
 };
 
+&i2c0 {
+	pinctrl-0 = <&i2c0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	rtc@68 {
+		compatible = "dallas,ds1307";
+		reg = <0x68>;
+	};
+};
+
 &i2c1 {
 	pinctrl-0 = <&i2c1_cfg>;
 	pinctrl-names = "default";
@@ -189,6 +200,16 @@ sdhci-emmc-rst-pwr-pins {
 		};
 	};
 
+	i2c0_cfg: i2c0-cfg {
+		i2c0-pins {
+			pinmux = <PINMUX(PIN_IIC0_SDA, 0)>,
+				 <PINMUX(PIN_IIC0_SCL, 0)>;
+			bias-pull-up;
+			drive-strength-microamp = <26800>;
+			input-schmitt-enable;
+		};
+	};
+
 	i2c1_cfg: i2c1-cfg {
 		i2c1-pins {
 			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,

-- 
2.47.3



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
