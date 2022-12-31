Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C367C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i6Puz7Kwls+1meUIUrKRxZud1M+cuKhkxO52IJ1Wfzw=; b=WDXtSCdEs6rU1r
	ja1sEPpFPwLhLTh8G4V9cysd3sCTHofCj0h4uNKFvgVeS2BVudlvJAgwnYpoJkVTPqd/NNqLIDtOU
	l8MT6OpNpu+GHIfDPja5euvkunJ0DajdSLhR5Z0h/wfwmUycwpUcbPU+bRqOW1mQOT9fN+tnvVDNb
	DQwOS0t24lRYi3q0UsUf0FGFgg92xMU8Reb+hEZu0TCtSThdHmUBI21OKVudv2VPKjt9IElM5MeLs
	Gn/34ZeaQlN2yH0LBBE8jzuC0yuzT6Onw2ap8tBb0X1BIdvRB8c+O+rgHrRadAe4qTpNpuGi2UF6I
	Qmx54wJh2ItOfXXxy9eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlT2-00BYsa-WA; Sat, 31 Dec 2022 23:40:45 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlRI-00BXhv-Tm; Sat, 31 Dec 2022 23:38:58 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 4A0C55C0086;
	Sat, 31 Dec 2022 18:38:56 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 18:38:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672529936; x=1672616336; bh=wq
	SQ4eWO6wTVB/5k5mQwEiKQFq8qPE3bzEg36ush5R8=; b=LGnfHkhSOtuBXjNEC9
	C7sxR+alGpG0FGDFToo8Jg7YZZAYxNKe5qRbo6ni/USe8uIt5KWoTFsWczojQydz
	uPPY4lEXbRcDvU2GShmhXk8CT0S8b1pp9RHFZOufoU3yGxwYKq59qzmgQBH5Q8D7
	IabeIuNMxqWl6sN39ZqD5sk5WVdcQ1jQTRd3/bpaV2Gx+wMukg/4FPDH85py4OXC
	z95IvLWGgKh6in3NPpwWlFO2e6KL5sAmj4KSUoYGo37JCa8gseXpeoJ6P+S8BUcy
	mhdcFEkyFh9FbWbOvfADN4Tao8qhGTu9KWY5Nm8+/L141EEYW4epazb5sHMfPihy
	Y1hQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672529936; x=1672616336; bh=wqSQ4eWO6wTVB
	/5k5mQwEiKQFq8qPE3bzEg36ush5R8=; b=Dj1OtC59q4ygCBO4VxHwPMNKNoslP
	L8xgc0ZBF8NJuyRd8VV9dDgvv7vaoy0H3F8CVUZdTZ4TU83wFsdLa2gXujlkLz/N
	L97kxi3xtSYs9dsYNiSvRqVbd3WHL6kadCkO4YVfgvnEeAMnuOCRtp7cp9ctGnaV
	mNjVZzM8zohlD2Z/HR/+hA0Azqs5vBggW2VsDt/0r2frXPcozQyeslGr5Zna0HVK
	fd+SzaEg0sLOVO3YoCeRPJHYNsOFraD0bQy4QMaHgYfGuUVwBDb13ZUO7mlYqj5F
	778jarnZL9U8789fSmeqx4Vq2q+5OIaIaA48uBSX+YZ9tRsg7lgMBpIhA==
X-ME-Sender: <xms:EMiwY_sYLnwgu7U0Bllv5k6GkHdz4C091XAN7qtweo7oEatrhAxKnQ>
    <xme:EMiwYwdBbEOlBTR4cBl5xeQfDX_29BkGdLJMwIMD3WCvmpL4ijw4ijYNGW8EYqR8w
    zWbUbCQtABgDN0XkQ>
X-ME-Received: <xmr:EMiwYyxSWPN-zx-QoCUVKVzf5ymENJbzS8V7-P1pRS3Qpj-vrAn5m5yy3InBiVnBOwTEbZQORSmrKqey9dL2Jpk-h3IzsXIqcXeVHZwrhHVNmCTqZlUDgOGHA0G-MnAO6KTqFw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddufecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdejmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllh
    grnhgurdhorhhgqeenucggtffrrghtthgvrhhnpeelvedtvddvveeikeeiffejgffgueei
    teeileevlefhueekjedvvdfgieevkeelfeenucffohhmrghinheptghlohgtkhifohhrkh
    hpihdrtghomhdpmhgrnhhgohhpihdrtggtnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:EMiwY-Pw4SOHGSqH-g5csz1T9v_qwooUDWxYMy9y94oV8djhgJYapA>
    <xmx:EMiwY_9GJ21hOh4eXb7B45-S-dAiXAaxQpXBw-y188XACn8K4WEPWA>
    <xmx:EMiwY-XwfNlL1MQUCsbQhp-CaBy4dnBZ6LGGd2d6SRNG4nlIRgrf8g>
    <xmx:EMiwY3MK0f7mTb5l7n6EP66BACIlwsK8WX4JuRVZPspOHOD3vPSYJA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:38:55 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor@kernel.org>,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 02/12] dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
Date: Sat, 31 Dec 2022 17:38:41 -0600
Message-Id: <20221231233851.24923-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231233851.24923-1-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_153857_109386_6FECDEAC 
X-CRM114-Status: UNSURE (   7.73  )
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

Some boards using the Allwinner D1 or D1s SoC are made by vendors not
previously documented.

Clockwork Tech LLC (https://www.clockworkpi.com/) manufactures the
ClockworkPi and DevTerm boards.

Beijing Widora Technology Co., Ltd. (https://mangopi.cc/) manufactures
the MangoPi family of boards.

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

Changes in v4:
 - Rebase on v6.2-rc1 + soc2arch-immutable

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index a9fa8f5c6c02..3f5f7b067bcd 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -264,6 +264,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^clockwork,.*":
+    description: Clockwork Tech LLC
   "^cloos,.*":
     description: Carl Cloos Schweisstechnik GmbH.
   "^cloudengines,.*":
@@ -1446,6 +1448,8 @@ patternProperties:
     description: Shenzhen whwave Electronics, Inc.
   "^wi2wi,.*":
     description: Wi2Wi, Inc.
+  "^widora,.*":
+    description: Beijing Widora Technology Co., Ltd.
   "^wiligear,.*":
     description: Wiligear, Ltd.
   "^willsemi,.*":
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
