Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E06606A680
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Nov 2026 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3lWrGBvL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lq1qEN/J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4PLDhOknvoa4s0VHA+8cTSDeVEO2Z8Od8WO47ah8jyw=; b=3lWrGBvL6SZ/i4DXwsmdhWw8X+
	KQhB4oYKBWbUO0FwEw8zKB+jBrYYdIPJ68a8YZ4zabxHQZHa63DRwkWVwJBd6ycVNF+JkBAaeKLvm
	QS3ej0L9lMxEEnJFeMdWC8F4C+U6wCym1oOWuVzL2cxp2qIv8r5OgAckwjKInCQWc2QqtFk5Sy+iH
	sczMkfUKpf5vR3WOfN5rsLLNIuGneuw2QFruV/DymQsCaZ4oqVUACbJirns9zN3hgQXY1KaENyRE1
	CUkogFGdwlGmChtCVJL94d2gkeL7e35IbNTdwLdfmva28r1us4EgOO9KNfWLlaYXyx1re/X4iOoXn
	+hosAnNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7hp-000000018cc-2ehD;
	Sun, 22 Nov 2026 13:34:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xV7hm-000000018c7-3dc4
	for linux-riscv@lists.infradead.org;
	Sun, 22 Nov 2026 13:34:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E644450B4;
	Sun, 22 Nov 2026 13:34:06 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795354446;
	b=jMHIBEybbsybiXmrDJg+LfQVGdG9txx8aiKcDz2+/ha3Uc3le9gZhTfrfCxpOhW1rVsG
	 rtSKMs6ZQAjeezhqOUjlDxdsFnyXXigB5cPfNsKcSsoNZp2kM8I6Gn/Tus/82xYk1kfS9
	 3zd7rJ3SNonfRrXjHP/wNAZiILpgZ4MLM0uwXOklSn4VrC4Me0ZWZ4K2MV+IRpZrLSU+W
	 7FznNUy7RXwG5Oa5meIUi/pRGx9QDdHMAkBGNRWwXEU0dNT6pW00IshZWnU7bOD8d+cN7
	 fpa8oYApfQachR3J+6qgNECsThQydvQFGQeUPUGtElj4MynNnWSe/4B1hw8s2MCxR/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795354446;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=gMCCxwapX0wLFgOIJMrh4/ml0ip9+6qLy9h+KSGlzfU=;
	b=OqmTD+XRN2TNkB8V3lrfKDrSgW1Ywnx5+2ZV7kwYAFJPeDFlqqQQauJkqfWP6R4fGy/p
	 cQUjkV6oK6fttyuURDmLHgA6wJ5Qh5RodMU1hrh0mc0qeulpeZ22vhpsGOjcL3EZLjaiQ
	 5LuWnqgQoAy3v7/qmwZMT2BbYu9sMBOB9UvM0+3ax3EKEYax0bI+c/SbaKL//QGdH9Y67
	 sqGhXtw7hWVLR3Pd3/VX5wQM5nubn43aIKQjEQYOJWVMdoCxAQBakgdyATnhVYnrpezom
	 0l19g7qNmuvygrxCk221NDKPBcBlyBvDrMIytcTvLNET8skjIpRuQL5IL04EBqad80w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 93A0C1F000C6;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795354446;
	bh=gMCCxwapX0wLFgOIJMrh4/ml0ip9+6qLy9h+KSGlzfU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=lq1qEN/Jq8/cqb90pTneAzBRFVNS/IXCG5WDmpptcKc9lSnmz7KPs4261PerewweE
	 lFt5GhxOB0/Za+JZOEyaBRO6Na2fVMYXL0+wUVB6PHuzbNqX4kbeKVCXnRKrcb8+1a
	 KL5C+vhOxpC6Yv1wcNCfuwMEGQi6Iw+UWhT1qnE5tnyXZ8HOchLfqtu1KMh6onq7By
	 TNkzmCmBU+k7w6dU6cKvyDD3rWt4AbncyUQK/QA9ewlE4w3HLT2mtRmwREOmgrqHGk
	 WBshDOVpcgvluKztclRjhwkYeoa4Zx09x/TkleCyCkP+Eq2Dvazl8Q/dVU4H8qypyo
	 vzTpIWdUpW4wQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 243564C09B;
	Sun, 22 Nov 2026 13:34:00 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sun, 22 Nov 2026 21:33:51 +0800
Subject: [PATCH 1/2] riscv: dts: sophgo: Enable the RTC on SG2042 EVB v1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261122-sg2042-evb-rtc-v1-1-f222c64cc7b9@iscas.ac.cn>
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
 bh=foorF6NO3hCfAAQawSmE3Gdk20RzS76lrMy1CfpZjgk=;
 b=cJ6yLZmLonKACyxV28t0hTJqeKVe63el8UfnQJxWzALnhhfIkyl0zGATvW1vaYkt5ZlYSnuth
 F0qSxColP9MAN5r58rLVgbYz8U95AmUZtWlZeRO4CATzk6Lq+5VVzp+
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

The SG2042 EVB v1 has a PT7C4307 RTC at 0x68 on I2C0. Enable I2C0
and add the RTC node.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
index 9f403e564694eae14913f6ab23080a6333df15ae..6ddb16eabc48a51f457449d245d63a3840b2fdef 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts
@@ -136,6 +136,17 @@ &emmc {
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
@@ -201,6 +212,16 @@ sdhci-emmc-rst-pwr-pins {
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
