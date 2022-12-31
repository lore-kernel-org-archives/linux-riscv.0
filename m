Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B17C1C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 22:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5fqrkwkA+jetsOFG4dVjRu+eLKTGcnfUqHPqzA1PthQ=; b=FiPovcVpSxOuZs
	KlfjWq3DAgMWcRLHDmHbVQ46VLkXBbtNZ6RkEplvH1viYnF6gfACPrt2wDxn7o3NDCx4h121OfKoH
	2vkMKdbCRFzhR5XKohX4LKur1j50wzQw/Mu8E5yUvIWMMIPwwzKFe823Yxpl5mcm7gUZls+kzHJeN
	fTbP15JRgnU/f+b4LQQg8t4ZgrePx9/bTP2RgtUqQOxWy1uxVKaX1fO7nU4Mp2/ItcgEH+wFpZujf
	gPrGj6rRRgbLZNUWIqs+q6Ze8yEivim2hXaWn+lVlte+O+87WQcZqoTIkE9im3/YFpazuF+rwtD5P
	Oszolp9K242VpzVZm9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjxJ-00ApM2-4K; Sat, 31 Dec 2022 22:03:53 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjvO-00AocR-4D; Sat, 31 Dec 2022 22:01:55 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 64E305C00B7;
	Sat, 31 Dec 2022 17:01:53 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 31 Dec 2022 17:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672524113; x=1672610513; bh=6y
	DoLylCXIBG0JOPVXlZF0Hhucnb5FXKeM+guk0B0B8=; b=Zaz55lY9MrczFzGGGz
	aSKEyyEdQNL6Mzo6N/ym7i5SQ7CXCSX7f4uq+JGxciPCNX81t2/Fjr+9cfd7a2ND
	kx/Ynj8z7LZhAlJNJcYV0kKBbjppDwhsD7YZ6dEKFzYlCq1dpIuLRh5HWcFiUNiT
	1xu4Gvw745IMQB4bsGRa14pXq+tZz6KtMRHecqNLZx6MiR0QFDp+baylhko6uezf
	xY1LfcDUANe0eX9I5Ll4htcecsz32WwT5VYKaFfZnNkjlunJLuJMowylkp+PRGTL
	kpEIbCTi8hnSg71iMANKdJlS+avLDt3gdPWYnJ9PQqzD+MomI7EZ3lnnG6jUqATO
	jB2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672524113; x=1672610513; bh=6yDoLylCXIBG0
	JOPVXlZF0Hhucnb5FXKeM+guk0B0B8=; b=KRfKr7LE3X9tHXYLtaBKaLo3vPm+B
	5nIl5lxJqXFKG/580orp3Mn1EFPbqEK1k4mmkOuhNNdsZtLIl0c9a40BAggjphrB
	TpTN1pV400ET6sZEaBGc3mJgIvDzvo4fGBKOIzmBQBp45f5WwsxH21yQpp//bQT0
	rJy1J/Qjch9v/Xys6cBrLfNvgkdbg+FtOQV5sDneKFz7C46J+lZ/s6Auu5slTb3e
	4/n3EM2c8VjyguWyPtnooCxWq2cx5OURH7Xy+LwxZ6xtdHdBarebV+gR9c671mta
	e3WFcBv7J4Zdf250gL/kmlkR8Bs5EIr34sale+k0nJHhZFi3ai3FGKCuA==
X-ME-Sender: <xms:UbGwY4RdQfj7YC0F-1ekEVPy4HYBzF71loVn3qmXoskBuvbG_zoPbA>
    <xme:UbGwY1yFf2P7DlIu1XaTnY1z6lSM83Byg5G64DaNqUShR1X0NDoj7XSKzx9_95SSC
    c2pMyih7neskaKnpA>
X-ME-Received: <xmr:UbGwY13ITJ9iQj4vaNYQDd8TklAOnlwvgIDK1sLtir9KPHA02e9vP-uIgBH8YZxqd61d-E7hixpjT_6l8s-c9TI9cw6aedF_NEWqv2tAXZyIch8QeP8TASssqy6sUjazbDVlfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:UbGwY8BJVHB7kW-5GWp8mYXnYlfm9uOiaOByuUl5piLfUS5cqD7xQA>
    <xmx:UbGwYxiraUe2TccaxQu7wil5NxSK0wsbjefgJ5H6BBIjfM3ELcfc7Q>
    <xmx:UbGwY4oFvGKGj5DudnKSG2SZF9roAD9tsM7FGhsubFVmfu1J6-mGJA>
    <xmx:UbGwYwQsB4UHJAaidenD0qNrDXGtNy89VTTs1prTnynqXKndGP4OHw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 17:01:52 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Corentin Labbe <clabbe.montjoie@gmail.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S . Miller" <davem@davemloft.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 3/3] riscv: dts: allwinner: d1: Add crypto engine node
Date: Sat, 31 Dec 2022 16:01:45 -0600
Message-Id: <20221231220146.646-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231220146.646-1-samuel@sholland.org>
References: <20221231220146.646-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_140154_299031_C1D8ABCD 
X-CRM114-Status: UNSURE (   8.26  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

D1 contains a crypto engine which is supported by the sun8i-ce driver.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v2:
 - New patch for v2

 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index dff363a3c934..b30b4b1465f6 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -378,6 +378,18 @@ sid: efuse@3006000 {
 			#size-cells = <1>;
 		};
 
+		crypto: crypto@3040000 {
+			compatible = "allwinner,sun20i-d1-crypto";
+			reg = <0x3040000 0x800>;
+			interrupts = <SOC_PERIPHERAL_IRQ(52) IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ccu CLK_BUS_CE>,
+				 <&ccu CLK_CE>,
+				 <&ccu CLK_MBUS_CE>,
+				 <&rtc CLK_IOSC>;
+			clock-names = "bus", "mod", "ram", "trng";
+			resets = <&ccu RST_BUS_CE>;
+		};
+
 		mbus: dram-controller@3102000 {
 			compatible = "allwinner,sun20i-d1-mbus";
 			reg = <0x3102000 0x1000>,
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
