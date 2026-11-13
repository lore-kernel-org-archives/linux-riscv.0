Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E6AF606B784
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=p0pS+Gj5;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZSaWrleZ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9g6nl2JdMYrSkmTAVEuz5EuOnoVepzbnLDnePHBiupw=; b=p0pS+Gj5XqxRwXxDwTGO2uA5XG
	wvN/7sLCs3ipBsTYsxHqqqYhYnQHJSHKadJnJ4wbHe53y3JMi7MPDlq3AqC4sBYDuCcGac9uhRxX6
	L4SocANRc9E22pRiZb/ltoJULu7nVTcnvhIPq1PdhuCB9oYaAKWIP3mCmWAFInDx0lLqmUeVY3/Rh
	+dBINa/e8efxoj/DfViIySUwWgXPaTly0Sxj6nSVvwGi8yDXZemsjfR3tF0Ra4GBXHBOMstfmepKB
	WMnkJFG0DzWoFu//XgvFCzPeQeJ3rUcs8us4PYfXN8xYUCi2kme0V4Yv4BYjXqQSiHHVy36d5Bkks
	nXF5ByQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpw-0000000EhiA-3BKP;
	Fri, 13 Nov 2026 22:33:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpv-0000000EhhF-0Emt;
	Fri, 13 Nov 2026 22:33:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9264C4604C;
	Fri, 13 Nov 2026 22:33:34 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609214;
	b=LL0+xU0Hk49TYqE4mSK30ED674Aappii5XdoxNd5rLsVfhaCXZUYZS3xFG7emavqEdqF
	 xT1WZuiSzmimQgdSlClnCxIzMxAXkNj56qTCShi5wsFZqz10/upy+QguU8AkljfTgAFJC
	 /gojXZSjWYZWRzauL4GjR7bwdu72YKNAgyWLny0ii8LOTqApZSWd2QxY9wkSqlBF+pWfG
	 a7KvP8dBet/eCjoQjuVKaayMRLgQs/6Dfr0uMLCAf/87yzE/gC0Y9B+v+06TDGzdeJqWe
	 z2l501+UaJkUAXLOwBSxwtmI5PCmlZt5Ev5mte9uPlCCb23gbpDw4lEkzg4jraKVX/A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609214;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=FXnRXapR/ACmXvl74Zn9qZ1hKnmDl0TJQLKYWII0Hho=;
	b=h6DMezUrutDfvBx8t9bJ9CZ8bn2Llq3Q7R7TuJtQ/B557PnOhCPr5i14W+x//Sb0XxT7
	 aKd6q1FE7/PjbHLeh8t+PamSjPB1sC8984dXNe5uUAQaVF7aKb2Sxjiykv8+LkvmIr/G2
	 uf+87ivg3z79ciwmxG5gWlc3QFPfk8ULmcXEHhLxJj5pW20wgWTrMWpN1HDFo9wzFJHnJ
	 adexuAOWx/zy94dAZq3upX+0rT3pJ7wZz8ktKfP2I1QMeDXRkHtRkcTWitReioYvlua6s
	 W2pLmiSkYZtdPi2XL1xirKz63e4cavmou+xUJ1KadpfjlexP39iDZO2Cf1vLKLodKyg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 5B5901F000C8;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609214;
	bh=FXnRXapR/ACmXvl74Zn9qZ1hKnmDl0TJQLKYWII0Hho=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=ZSaWrleZdP2TClBBvnSdSUTj9K12e2hyxGRYW/o6fsHOcrxu9E6XbfBPf+zug17/A
	 S0pLc74kJ02cXFo6IlUCeHhjweS5hBe661tAz8eBRnRmHk0YbqQUMb3XZGnd8W0DYV
	 Z72LYyYLFvHWos/KHbL5iLoKQHk8ptf1Sf8TWMnK+EHYeAdJcS5Vo+M+0QcAyVGw8p
	 8CY4tgEGRQ8ds6NyL6g4aEKHHfSRIQiF1QqFdMFoIBAvZVDwSb//XoUWMgd9ZIWSxB
	 0D6arjUiTfghJ8NS5yV2Zxb3r/IZdZYquDNwnJ1cOMk11UbhuDVcY0cJ7Li03Ne3cs
	 Pm8jDZbeqE5BA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DB27949B64;
	Fri, 13 Nov 2026 22:33:32 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:30 +0800
Subject: [PATCH 04/19] dt-bindings: timer: add the Allwinner V861 CLINT
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-4-eb71ec3ee523@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=884;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=OLe62R4yWCrvtAQgr9InOXGE/QFfhE/9P80Dh0A9I2g=;
 b=Xvqr8a2EJZbnFzLuvqkhI3hzv9a9jGyJfrPeld/SLx1941Dk4yoln97G7R4RW2n8k8QP2TjYY
 Im7cRBo3xgcC9HCqAUBv0mALJbyrgCjcRxKx3XGE9mZSwGgfteZZi6B
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

The V861 uses the XuanTie C900 CLINT implementation, like the D1. Add an
SoC-specific compatible with "thead,c900-clint" as the fallback.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index d53f52e80d88..313fb39bd453 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -49,6 +49,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-clint
+              - allwinner,sun252i-v861-clint
               - canaan,k230-clint
               - sophgo,cv1800b-clint
               - sophgo,cv1812h-clint

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
