Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D91B606A8AC
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GiwBQ/nX;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GgBd5sd6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=00rIO6YPkE1YlYSwnOlsEGYeHlaj4Wy5v1KnBgwgQjc=; b=GiwBQ/nX7JmcUKHvy/gBC4hb7k
	lssetVyVJjGTONrj6Q8TSE6aVHj1IAzg9Q6eqXOsrpCIjAHmsfaMgIZ67jTVDOfS8XLGwYpgrHLQq
	VikhVr0xsMDbyoCcRqehZCMJoxK0GRzIQcBOX2M+k2CRd8esDkCvE1uVMUSbk4aRuLcvT8tmdyKEf
	8G95BMwbtslSp5G558rJnrcic+8jouW3GJB2jiHMq7IrzAnoCawiDc1bpHVw5LZrpX6YtOLcPuu2p
	IKPDQmS90hyj86beqYO9o/G6ugD2VhTPjisrziL1xCFJnyrLjQV3m44BQakiVHd4bktyKKduniDpz
	+Ut+p2DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzqf-0000000EinR-0xPf;
	Fri, 13 Nov 2026 22:34:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzq3-0000000Ehoc-0OJF;
	Fri, 13 Nov 2026 22:33:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CBF3243ECB;
	Fri, 13 Nov 2026 22:33:42 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609222;
	b=Ai4ThK1bpwD9ZB8Fa3BzV7K90L7VWI8BfdH3Apv8ipz8UhZ0EgiHRxIB6nNbhTiUMrEK
	 2tFFnsJCuwMZ/jQltYwtl/IbAdv8a/dTnUfEXUFFoGynyzBvb0aftDYh22zAG6vLmgkhy
	 ZqujVjVVnzhL6ukmnnRsWeY5ZT5IHE3iW6dDF6wPUErVTN4zhmsORnDkEy7vpB2VnYMMc
	 ynI90C3T6RlpAMNDqXsIhjQqokJk+YNbVUP4HZOLE4QXo17y/6d3Wcrm8M4Zgw8obSZAl
	 P/2z2yWCoQ41QFIxsyK3aPjscmcTvRKr6QiWqNYTWVmDfAOrFE/9MEg0hpnObJ/Fqaw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609222;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=CAFByr2n00H9cjNvqOJZ3pMec76bQwORRhdn9gRTjKE=;
	b=e9zGbSVv5EqKimZ6BIM79T0Us6/mB4ifnUooHE308wE2xZpQkEaPQrJTyy2+x412lXIF
	 RdOi0v4URkmqrriU9woyjlJ1CGS9lz5S617P6mt7pGrU85RTbMSwLIRjebU0AnVWQjY1I
	 miUBFXQIXwIb7/i4071KArJZtYEdojIjNEe079RJJH6WR2UI0KbpHje/acS5zJ8FscR8P
	 NUpkjnioYWjhVBEmgWv0G06U/0YzCjEAgHuXe1MaK/o0U1C1nLxIrQehiUpDhaNusnblX
	 VjmRC+h3Noytutz3ccVj5E4UEE7HWj8w8HGsl2cZIE33VXPeL9qeGOqtplhS/R6GzYw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 3D54D1F000D4;
	Fri, 13 Nov 2026 22:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609222;
	bh=CAFByr2n00H9cjNvqOJZ3pMec76bQwORRhdn9gRTjKE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GgBd5sd6yCT6XYKUFyZ87x2EAwlGn94mo5diQzJabbmBlWv5b3Ew37mukz50amV6p
	 3JRbZr2FJPMF8glmOPUJPk68IcaBlLCRed8JIt7dd0Ma4MSlwVqmYWw/QEseHiFqOc
	 yrz3Vuql5Zb9Gkw7nwXVc57rp0LGsNoI3hzPu7g/rA/pcAZl9YLUww8QzvEu7CUFrW
	 gqUzcdymTeH52mDEmMZzV5/IoCGZGaBtwLEWoRN04k7nGYmF08BHQRTxUUL+rfWAqk
	 R/uDozwsk6yZFQgMiriJQt8+cmlX4aqxH2xqxnc/XLRHEiU2q8HfhgEfomS1332kzG
	 5CdWJfEGPTZsw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0956249B96;
	Fri, 13 Nov 2026 22:33:34 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:43 +0800
Subject: [PATCH 17/19] dt-bindings: riscv: sunxi: add the YuzukiHD Avaota
 F2
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-17-eb71ec3ee523@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=831;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=ooczlTdXN+mxwhOn3DrrtrOaDvXXu8uSmXOercqvMcg=;
 b=R/PxCFRHwUc43McpjXcMGYT1yN8X25eLXw30rD02e5LKxSZr/Gn1YD5tqkBM3/MPA5VI4neiy
 /0dXCag8VjGCzSDkaC2auQA85V+nRQZqYS0WqWgn0TPWr5Ys0vGbcPq
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

Document the YuzukiHD Avaota F2 board, which is based on the Allwinner
V861 SoC.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 Documentation/devicetree/bindings/riscv/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sunxi.yaml b/Documentation/devicetree/bindings/riscv/sunxi.yaml
index b36e313e13a6..9e993a5752e4 100644
--- a/Documentation/devicetree/bindings/riscv/sunxi.yaml
+++ b/Documentation/devicetree/bindings/riscv/sunxi.yaml
@@ -69,6 +69,11 @@ properties:
           - const: widora,mangopi-mq-r-f133
           - const: allwinner,sun20i-d1s
 
+      - description: YuzukiHD Avaota F2
+        items:
+          - const: yuzukihd,avaota-f2
+          - const: allwinner,sun252i-v861
+
 additionalProperties: true
 
 ...

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
