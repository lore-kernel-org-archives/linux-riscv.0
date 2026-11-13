Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6361F606A54E
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 22:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zcMMxDpr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PCk/d6YQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ZQKP8NXlDlsMBVP/MvKP50c4DRYm1nNlAZhkLq6W3bA=; b=zcMMxDpr18wYxgAunXE6LPSDgU
	yzyH7BFPHFQy63NMYUYsPd/rN9GrJL3pbkhqoUWib9CyP4UJDdYzNA5QTM3Vpy+FgzmwoN4TFOiOB
	ztRmbhX6cjFvC1R3CWhOU/9EiI9gfZEkrf1/nf638sMGk/JDie2hhyFFYVleUd6YO5pO9hGBksOz8
	18HIOm4us1MVxZ4j2cGbVoVlO9qLCBQTkf067Rcz1JG1MiK3ebt8guOuV6FBN4e/AXVFzvguxePFr
	h1g0D3IVr38Lm7MdoNaVqKYGnDTMXxQbivtV0+gyiEXiQ5suQiHaSnBFheIsUt6b2QKxjKU4Nsowe
	WQD4gEfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzqI-0000000Ei9x-2JCi;
	Fri, 13 Nov 2026 22:33:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRzpy-0000000Ehk6-3wxw;
	Fri, 13 Nov 2026 22:33:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ADAB946A0E;
	Fri, 13 Nov 2026 22:33:37 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794609217;
	b=Lw80/v2VkspQrval8nmgEQp22tTaecaFR5kKpDMuV0O59LxmBfOXTCmBbknzoocMcovy
	 OkMv617+ZDJYtTgD9UbPG8X4f5DvbbfjHpmjkFLGmCW11yI3H+0UggCflDWQ7vNYsMaC2
	 JAkDI4iSOg94iM1WaKvLZ8veIYClW5JpoVw4aCxDk2ogXDohRMZSWcaY9dALRgPPYlVXz
	 KiLRu1Thvz0Y0aVL0NJ+BTmI/BqL088iRolvTrXEWPC0QGEfQRIdkvOFnt+ssLbncQfZ0
	 agQ1goGuYzrhDSFXW/rf0Kmd4/rR7ZmrY/8/q9WClEYwfLqFM8pnZL8i4OV7nEWLwjA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794609217;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=ayF6vBRvkksclTHjPSyWasOw4KoXplwINp671BmeISE=;
	b=V4GUySn69WcZUh7ubDZKaYOhzfL2yQi6ocyS7OO2kNzg7fWEb4kVjH/Gtgg6RgnMG1j2
	 JwCQz80fQb9lplCTnGFkzVA6D+do7ddI8hkazKFuB43EaV7JaEoSaW1o/S5zp9W3o7Lht
	 hL2kf0UTUyURKlTj5eYZTQ1hChHJCkgG+TZZ8hCC98Fd2hPmtGtiAb7ThakbV5dqPz5VK
	 0UktpfaTOWwiKVhWZklFNiWcCdfjsPC21tl5PsFH38i1zwre5c6I2o3/pgK/wOgRYDq5Z
	 gSvCsmY7Bc1eWMxUI5A+x02/aLmtovF7EZv88DQPyKO6DfWeJzh0cCpfP79Q+dRoJRw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 0614E1F000CD;
	Fri, 13 Nov 2026 22:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794609217;
	bh=ayF6vBRvkksclTHjPSyWasOw4KoXplwINp671BmeISE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=PCk/d6YQSWF7We7dBRL29c+DHY1FupE7tjodyOmNBtMaXeqmb0k8QnARUpuTPDw2d
	 ybjOiX2SX7n743zJaikT//Ojxp3GlQ1eH6jRIdYAYvMbHaODrsvQlnLn5tfECjjB+k
	 ypnvCitXhCID3LYzsyDfHvCHnd0b1qfdKvOjW+BpbtgC4yJ6NaU03s1Gao1nd6PZAg
	 3Ez7P9HyXAGTFO7hLTLSaUajMowr+xXZLzHDoSinpevqLttNWsmmbdmew1MIU3g/0A
	 h76EowCWGQZTkURZU+vkEXrp8GfanBwt3aFDA6eVyAbStCiTMwX6TivGXe+I0ztd/c
	 SKIN9bCMyoNsQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 689E449B7C;
	Fri, 13 Nov 2026 22:33:33 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 14 Nov 2026 06:33:36 +0800
Subject: [PATCH 10/19] clk: sunxi-ng: sun6i-rtc: allow another 24 MHz to
 32k divider ratio
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261114-v861-v1-10-eb71ec3ee523@iscas.ac.cn>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794609209; l=1317;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=4J4UFeD/eghp455M83eHVDqg8JSEWGJn1Ho+53uK9kw=;
 b=bxWPhg/JyaODgEHvYWbpaZH47om1EuJoYhcMyIKsswhKOxOfeMIeHT2Vc0XRwXRU3X7LU3/uc
 m6Q1MIe7JxADYv5O0YTn0lRP85QuG5yZexTgEa7RBlOQGEcBUeb3z0M
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

The fixed 24 MHz to 32 kHz divider does not divide by 750 on all
variants. Allow the match data to override its multiplier and divider.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/clk/sunxi-ng/ccu-sun6i-rtc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
index 0e40fd5fa624..b3619222fef0 100644
--- a/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
+++ b/drivers/clk/sunxi-ng/ccu-sun6i-rtc.c
@@ -54,6 +54,8 @@ struct sun6i_rtc_match_data {
 	bool				have_dcxo_status	: 1;
 	bool				have_phy_ref_gates	: 1;
 	bool				rtc_32k_single_parent	: 1;
+	unsigned int			osc24M_32k_mult;
+	unsigned int			osc24M_32k_div;
 	const struct clk_parent_data	*osc32k_fanout_parents;
 	u8				osc32k_fanout_nparents;
 };
@@ -436,6 +438,11 @@ int sun6i_rtc_ccu_probe(struct device *dev, void __iomem *reg)
 	if (data->rtc_32k_single_parent)
 		rtc_32k_init_data.num_parents = 1;
 
+	if (data->osc24M_32k_div) {
+		osc24M_32k_div_clk.mult = data->osc24M_32k_mult;
+		osc24M_32k_div_clk.div = data->osc24M_32k_div;
+	}
+
 	if (data->osc32k_fanout_nparents) {
 		osc32k_fanout_init_data.parent_data = data->osc32k_fanout_parents;
 		osc32k_fanout_init_data.num_parents = data->osc32k_fanout_nparents;

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
