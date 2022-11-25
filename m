Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 823DBC4167B
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 23:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NZSHSOWhTCTCQ/uDdO3qyvPnlYMtLMXo6od6UA4kd5A=; b=4mRZS02ingaBHo
	uyi+WzKGHWPy2SzKOOXOCL748hi+27GCGlHrBaGzHSlQWin/1A5uqBqJyEzhPqL7BkxCBH1ep4HIF
	xTkVeiaPQZ1CW9QC1AIif2LP5Z5OUXCaJYSDmxZd3Ba3aQcpUcrTPXD5e4yCQzEkclZd2gd/jEGz0
	ej+2sBmDYOHYlM8NTjAPv4bAUM+8HmgNY2Ioog/ZCnhV3OKlHzoWL8LcAD3IUfVKWmkhgP1wGnTWs
	JRSX3PEWQrYqYfuoNCPOQ4M5WJ9CmPEOTKUAyzi8VyfDQLvjpSuqvyU4sblsO6z9F6x9R/LPO9Bv6
	/0aJjceDNFsj8XmjYbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiPq-002v5x-BM; Fri, 25 Nov 2022 23:47:30 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiPP-002unw-Va; Fri, 25 Nov 2022 23:47:06 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id C9D8E5C00F4;
	Fri, 25 Nov 2022 18:47:01 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 25 Nov 2022 18:47:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669420021; x=1669506421; bh=Z3
	8TTIzAyr5NC9EmbM6dhKADA/gpNLtWkistuTXZh1s=; b=JgpJRyE1gx/MMR3yJs
	I+z2xpmnThqZy+bdpVcd6A2Fg6x1wVJkCRSptC4Hb/7Gyl8Or0111EL1E7jGcmz9
	0uEkWVeILUlkCWf/bYo3mHHGV0HBvmuQAak4KkbvxhDR6jPc8VOZopV5eee8AAT1
	gcq86+iPaZi27gRXaDYCDGYf9j/ddWejKbSl8b0P4fs7c4ItRlXlIeSC4j7nLZID
	N5QRjzRgJvp24qzZHUS4CQBvVHf8NeaOSEZjHVrNxUJidxxr3GCp4tajqP2R4rWi
	4qgdqEJsqzh/63bML/C1d5tIY+5LPaobceLhFdCIy1WPsgyLh0dr69oXFKZg2baR
	FwlQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669420021; x=1669506421; bh=Z38TTIzAyr5NC
	9EmbM6dhKADA/gpNLtWkistuTXZh1s=; b=F9xkG2rsXhZETwaLKCoI6xVCy35mT
	Z89KSUoaNF2lsuq5XrjASPzDm/ZpttJIxlch7egjSHAllJAvQwAROL8ODXHpPZpn
	NJwdms+SZbQug+yM54fJYA6wPBurY0MxOv32Pi9oVV/XA9zLrkwkunR6ILKEJyT+
	u12Hf6gpV6PVX5T/DfoRPisvGHHs+d/Omapsi8CPEZGHRwiRgIpcieGETtL400Zl
	g1bbbENM10WV3tPbOxNxNPgboVL+HIfu0PL5id86gU/imtvoPaUhZ87+gZeymdZl
	SM1vn1/vO/85SseQU6L2T7TNesS9UwaEb88NqGgFphvl0xB14D8rLrhbw==
X-ME-Sender: <xms:9VOBY2RTU5OkOOYhRzuXiN2RbG3ePUrjh7YcMMh6jRYjaMhC8GIciA>
    <xme:9VOBY7x1jHfDYngleoAaS6J6v7zi34FpENszlz2XU8bzEQrWqDl5wDxwXtH8Sd8NF
    jorixj2VNfjcSS5fQ>
X-ME-Received: <xmr:9VOBYz1hRaHNY-zsInDfCXUch6IgFqzFYdIFDjrDyCKQZ0FkR88VPNkin4MjI9pjujp_KVi3XX-sQsAd4KzfU5fOERyQsoq9394KvKNsqSgLV9N0BmgrGjY-79I7EwjK7XxwcQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:9VOBYyChBs8jI5AT1nx8QJ4JKSPuiyQ51fS-_k5MfKlSl2qu823J2A>
    <xmx:9VOBY_geWaC4fxY6s_GAYS4V72TdZEE5K1DvIzAqzrHxTLv36l6R-A>
    <xmx:9VOBY-qbS3V9AQimybV5EzzBwPcCuVF2SyXY3s4Tqc6-SewyZB3Kpg>
    <xmx:9VOBY7TzypKd3xOcm74yW0C5V_g4wFXg0qi9CNPzVCAQsmj4Fbjx3g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 18:47:00 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: [PATCH v2 01/12] MAINTAINERS: Match the sun20i family of Allwinner SoCs
Date: Fri, 25 Nov 2022 17:46:45 -0600
Message-Id: <20221125234656.47306-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_154704_544811_6B94C6D6 
X-CRM114-Status: GOOD (  10.86  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Allwinner sunxi SoCs with a RISC-V CPU use the sun20i designator. Match
that pattern in addition to the designators for 32 and 64-bit ARM SoCs.

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index cd2cbb940f11..6a79f736fe35 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1828,7 +1828,7 @@ F:	drivers/pinctrl/sunxi/
 F:	drivers/soc/sunxi/
 N:	allwinner
 N:	sun[x456789]i
-N:	sun50i
+N:	sun[25]0i
 
 ARM/Amlogic Meson SoC CLOCK FRAMEWORK
 M:	Neil Armstrong <neil.armstrong@linaro.org>
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
