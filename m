Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F41606B794
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fJsb6B22;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UtZMtRuy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=KOqYIfSpZE6KW+8q/0tmewZCEJZHUQdRAQICqZ13+V8=; b=fJsb6B22/z28U7TJgbuLMBwQaE
	zSBGE8DQ213Uh8bpGPBcbHrRGDbT8J056TSQ9dhgVHt5GT6CLN9vr3vkTDYb29TuZtdowHnvM5kxg
	p0YQWtlk5jnU1PjBxfKDRiY2fExMVwICFrSNapW8nSEtld92vI7VyFC7gdH+4oEKBl0S+IoeWK9m6
	bq3bxFLmrRkKGYdYNC3APICgXF2emzdIeWoU7uh6zF01UEm1Eno94hWLUd8r0VNexn+ZGc+Oie5bu
	pAfAp3Tv20s7/XQylPsMKlLymevt2aJYPBSyvu3L+fmPHkz0z2iziq/9HtyZSnbCM/xMHuhqplOWf
	MPLL9lzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpw-0000000Ehi2-2MIk;
	Fri, 13 Nov 2026 22:33:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpu-0000000EhhA-25C9;
	Fri, 13 Nov 2026 22:33:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E37A4406F0;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609213;
	b=rx6seLmVjtfP07fRicajwW4gcx5wTTRbDzYT/2gEVSZRGbyPFLYvc4JlMdzz9wPMVm1a
	 o4Wuma0RFECZuk23+K6yj7gf8Gz4WLeCKlH9CFfJRe/GPpNr7vJAr2eg1TMTpEDUpRwtP
	 Za15H9KpVjHzMgQf/1l1/k7d+3haLKmyom/SUlFVrTA2UVxDndp5dK0N95zUePAVTdB/S
	 V1VBxMJkp8/OknttbjsfI6FY2z2RxQXnPDWU95byeomE+1lRfskkZn5dAWF4SYPIJ77Zg
	 0Vx41wCqd0Q+oY5pTh1jUq4nKJ6Q2NJDfYwYRZyIFRbk9Opx9y7y/aqdldWRRIir2Mw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609213;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=HyiTVbeXPQu8fkPfhfD3gHjXLJEZSVzM7qOeO91NGRg=;
	b=VWI/WkEdcF2Xlv6G3k41B0/FezxAS/CfJTmpL2XNORrf1xYrtNvDP1vaZnlCf1iqvuKY
	 scjDd2YAE39vLXSGev5jkdeMhGTU7sQvOTxr6OgIFyJV+vO4L5PBb7s2Ly8ozZVSDcYlO
	 otUPDdpbO8cuphtgIPD9st5EG0kcXb3XghlZ6Mc0FpjXYjXMzOFS69zUeCsL+yFZHpvo2
	 mes6Lea+P/yUQT5WV4GlpqlTenXCVCLSQArjsIoo+Bf1J67BEdQUMhug6NZwxixaHzrhu
	 IIgylUwAxaEqud62qoLY5JfYgGpECXS3FlMHizW6NqYEQwSDENqmBfSs2Z+SFxiCReQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 314461F000C4;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609213;
	bh=HyiTVbeXPQu8fkPfhfD3gHjXLJEZSVzM7qOeO91NGRg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=UtZMtRuy2RreIXnt6Vk6e1sTpBtQ42hqFvY/BLiBEfGCx4AjqmVAkYmV1ALjqjy9F
	 VGgIrQa6TV9iILRc4ZtrjGqseyIhml3nkASLmeYP36fJvdWR9LL9EBW+VzRgV3yO3x
	 jq2yE/dyD/YyOHwxa4uhfZ4X1693xNj+zD3+JrYHaY1Fm8ztHfdJ8/60mc6XnXjYCu
	 K0aeGfZZd7k9Qbb2illPSJSUWJ5vfFBIl6K07SLfMHdo1VKv17IiphIZoIWI+kxZK3
	 8UlXv/aS3/U+0yePxo51ddZFjPOJPCuM4iGO8axqUf3gSXu9ph6wYw8O7tc5eDeV7I
	 wK9bQSwv3aBVA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 9E3E349B58;
	Fri, 13 Nov 2026 22:33:32 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:27 +0800
Subject: [PATCH 01/19] riscv: sunxi: describe the wider Allwinner SoC
 family
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-1-eb71ec3ee523@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=987;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=iIMXHW4ncH9rYCfV6gqeS1VFiDJbleuDtC++QacYRuM=;
 b=1qagKD3rCKA24HqW1EY7WOksbBJolj6tNk+/fSKplFvFfQFmuICjc/3HRPonNK6YXjTtHCQMd
 k+l2SiI9Az4DbHj5RDb1WJdE+MlgzAKOR89f9hwcRwjPTczallY0Cjt
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

ARCH_SUNXI is about to cover the V861 as well. Update its prompt and
help text instead of adding another option.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 arch/riscv/Kconfig.socs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index cecbce0c4983..4cf3b24467e8 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -61,13 +61,13 @@ config SOC_STARFIVE
 	  This enables support for StarFive SoC platform hardware.
 
 config ARCH_SUNXI
-	bool "Allwinner sun20i SoCs"
+	bool "Allwinner SoCs"
 	depends on MMU
 	select ERRATA_THEAD
 	select SUN4I_TIMER
 	help
-	  This enables support for Allwinner sun20i platform hardware,
-	  including boards based on the D1 and D1s SoCs.
+	  This enables support for Allwinner SoC platform hardware,
+	  including boards based on the D1, D1s and V861 SoCs.
 
 config ARCH_TENSTORRENT
 	bool "Tenstorrent SoCs"

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
