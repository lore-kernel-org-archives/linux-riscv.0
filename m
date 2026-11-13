Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485A606A8AC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hLqVW2lc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BLIJ6EgY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0p/7VocsWWBzszCZA5B0l7a75DJYLuvJl3mvBkGyDLo=; b=hLqVW2lcDNikemxfaAkwoi6phw
	aI42SRUxTY+wKtZdMAS2q6ECxASRAwUTB3dEySgXCk/PVe1FzIK+xJAwSmfYZotuUJ1jXYHIHvDz6
	DZEu3mJmbWFJmqm+X82jMMo87+GoHVRJ0f7SJ2N+NidM3QMJcTs1MMEuZw0hqSCNARX+QIbJoHXSK
	Rg3ujGJlZxsNo6nAfq1gQHUifhpMVzSyT1RIL+L9lhG2LkJCkb/760uesyXEX2H25hUOBp6l3Av4Q
	iLVg9neYQiICYFw0nWeZRBBa9kaaONlYjZCKC/JG9e07e65Ycd+KWwEckY7XByiQFM88jmVlDODWX
	QUbjukHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzqh-0000000Eit1-1zMX;
	Fri, 13 Nov 2026 22:34:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzq3-0000000Ehoz-19aR;
	Fri, 13 Nov 2026 22:33:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F08B146EA5;
	Fri, 13 Nov 2026 22:33:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609222;
	b=kaXjjr7c8hHX5TeAMq9ys13wzq0mQCJOv6y6RDVzxL6rZSeSCsjR68GMA24Irt2yKoGr
	 iR8SxeeMNt7VLKv6xfuzn9gs/acF7vvQtvAnQrYGUNFyIo5PaG8leUuKxcmcsgv0s4Yk5
	 +K0rdMRpUoQnv8EpnWlL/zg/jeuXHDwM0kOGGuCYyiQ0NKryG4921wqmlNpGAH24N6OiF
	 RxaLZu1cO+fB4wBKX+NUTPwuu/0cIqaCCzrhV+MqMzwbarLpRz+8JdHREDAunuFIqnLcu
	 LZwsbZ/h0jYPBva+tzvwxNM5vDuDmBQgQlywGDJAS4AKV69zYej/lWo4OMTEhvaofRA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609222;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=pI6ZfHbfXlGGFScyQLy8hgCr3exLFr/2O4VJxzewZhw=;
	b=HPwpk7BbrpMbCnvAuxa9ifMIs7cSTevA+Yy4h4Wog0xvYYDhJU5xBRplddVnFfnrmYeG
	 3JPTehvdiOdNYBjbBUUZtIvCC8g2ym6TFfaBm2DVQQ3BFhjKRbZnzOepsB33a5EAhqcbA
	 l99VR9SVTI8//KbcawpR5PyMX9+K3lPaVadWW9OeOoBYHzB2Vy77TlF6FGn6Pl3UjtThW
	 ppHJrbOuZ0L+mzUPLutiYKr8oJuRQGAGfDPeWBjFjqJkxI8pcQnfvqQqnWcrTAcrPgZec
	 xBI2S7iMVmF3aKvHR4G1WR/eVek4q4Dv6quuGSPmWvGT1RPKLUn4peCaHwq0ZLwnO0w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 7303E1F01576;
	Fri, 13 Nov 2026 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609222;
	bh=pI6ZfHbfXlGGFScyQLy8hgCr3exLFr/2O4VJxzewZhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=BLIJ6EgYlJERejEFQdXWkCuzqJieqRcDghDv5jM+s7NQ4waw6OLKpGZ/naoPl1NAF
	 RqdcwbBBtutjmu+B21Jfeg/aoExM7sO/W1ePJrw1wgukfgvVI4w/N6Mwaficckjn1z
	 7NCuFhJLl4y/xvAdrSdQUFEzeYBNy5LUqGtZXi8wxQQuV9Kq1OTP4cGiLynKqyTFAV
	 zzzicTeuYSW6ifF+1P0FXyRiVVlHOC7FIuQqF1ITfcYFh/iZorT2rilwfsF7vYYTHO
	 KmOdTLDrHitS1yz3XhyAfXxs3vIzx6FfGZVE7H9hVadS1KXJ9hJkaY+NjoRGUphdve
	 elVdkckgPX3Vg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3345549B9E;
	Fri, 13 Nov 2026 22:33:34 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:45 +0800
Subject: [PATCH 19/19] MAINTAINERS: add an entry for the Allwinner V861 SoC
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-19-eb71ec3ee523@iscas.ac.cn>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Maxime Ripard <mripard@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
 linux-gpio@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=1064;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=39Ac8hJzpCiQ7XryhT1eADd1ddcM2ysT57oAlX6+9R8=;
 b=yImKJfL/SM0iJ5gXSR0G3a7zEwdVCFqOgmcRGrK1c0Yxaoy5YXunPhnCNkpFmotpUgaYwGgLk
 8PkUGkVB3+cATxKHXuU20wzYPDweSAZ53K3Q6ECQOIXJmC3LIl6Sb42
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

Add myself as maintainer for the V861 bindings, clock and pin control
drivers and device trees.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 MAINTAINERS | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 93abbb315065..dfc300dc1eb2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24031,6 +24031,18 @@ F:	drivers/irqchip/irq-riscv-intc.c
 F:	include/linux/irqchip/riscv-aplic.h
 F:	include/linux/irqchip/riscv-imsic.h
 
+RISC-V ALLWINNER V861 SoC SUPPORT
+M:	Han Gao <gaohan@iscas.ac.cn>
+L:	linux-riscv@lists.infradead.org
+L:	linux-sunxi@lists.linux.dev
+S:	Maintained
+F:	Documentation/devicetree/bindings/clock/allwinner,sun252i-v861-ccu.yaml
+F:	arch/riscv/boot/dts/allwinner/sun252i-v861*
+F:	drivers/clk/sunxi-ng/ccu-sun252i-v861*.c
+F:	drivers/pinctrl/sunxi/pinctrl-sun252i-v861*.c
+F:	include/dt-bindings/clock/sun252i-v861*.h
+F:	include/dt-bindings/reset/sun252i-v861*.h
+
 RISC-V ANDES SoC Support
 M:	Ben Zong-You Xie <ben717@andestech.com>
 S:	Maintained

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
