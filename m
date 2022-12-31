Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4970BC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wOekR8g4ewS0wfHCyuYFh4Z8lMnbAO/HsWVv0rhv1H8=; b=Lbkivwayc9BCId
	a2Rb5XYhdvh7RxSIwLS3WCbWEkhxw1MBC9Pz+CjHhVhKyPyY4MclgJwupWz+t1K1NP4oHCXmT/1DH
	A1/nM7bcBBXnTf5WGpIKFXsA59+OqJM7Mwpb7cj3jnocRgQ43ccDrUnLYnRHshptr4ZoFhva9dkbt
	Nsg4BnRkCrfz6ZLxuB70wNPQdsozgDDq+Mv8z8KH+aoMKeynblL7gaKyCLGNJFoOcuUnoLJzC+SGy
	NpkxxQ8NWTXGq28Wxph+UYdJY802v371pjooCC0OQEWGGrjOpywH959yMwf66fUAjniCkWiZzoO0H
	lm0rMKT/jZeHjDr1lETw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlSD-00BYNE-5O; Sat, 31 Dec 2022 23:39:53 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBlRH-00BXg4-Gp; Sat, 31 Dec 2022 23:38:57 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id DA0625C00BA;
	Sat, 31 Dec 2022 18:38:54 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 31 Dec 2022 18:38:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672529934; x=1672616334; bh=z1
	WCshbGb9fwiGuVdzVroIaH2YpnFBDx+tGRyEoLwl4=; b=eINxSgvXyA9czdxcZK
	sPTD770vcv0sZKsO4sQaOvYoD6Q0ciOgUsdY9f6dgKCIvf8HHmuV5BLWQ3EcDDBz
	LdrAdB8x1FpxoeJhm11j1nRH0fCb1W8DdMDsoBhKkMnb0f7qwHbsNUNTiFB5CdS1
	P7FbF+iw3oeynFSvrD4WgmMcNdUAlpM83N+pdNd/akKn+9xbhpra5uBzT3ifN4Qe
	hNc2EJfGkYaSf7MzFHSEQ5szhEYl2ampJGh3mstM1mKiBjHaqANjX2w0DQv8Lvcz
	4Hx1yr1ZYP56kujqzwR9c95dy6JFAi4n6oFMOhIOvvrk3NoH1lUVvudXFBPRsa9v
	z1wA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672529934; x=1672616334; bh=z1WCshbGb9fwi
	GuVdzVroIaH2YpnFBDx+tGRyEoLwl4=; b=Nw1JPUIcZ7bWcpYQWSAApt2ioQJYi
	A7FbzLvb/YX7f8JZfJDTU4AF8Z9Dpqdt0aBCBgVm7bNap9s907wJtbgG3NtvQbRQ
	l5RWSBCbI4jjqJIFgP7tZNn5A+6kiTZwmrX6QhebJqCWRc/s1AG26o4ZoMx6vpLY
	LKiK23Bbt+uzo4ROYLQipHh/cTuK0WT/g+gOApgXJH82tCCz/0nD+SZ/FlXgXhY7
	Vc6JB/itiJXpBmYt18ztDpvF9IjvVfdB0nBeCAFq4+L3NqFHGKNUNgGLu0H+Jegq
	VfU5h3zrMW0o8y3IyWVYkVH18Wcs8bE3a3EXVVQEgFwOH4+O/aBdWqKSg==
X-ME-Sender: <xms:DsiwY2l8qhe8jYmrvd6XdMV6RhtpCtwQpNeO3M4eyNYPjjFjHmdzQw>
    <xme:DsiwY91qH0Y6bG_lzLyghjCJaBY-TykvxR0Nhsg5BgtB92LtmQFf7cFXMsJmr-loV
    HXPOQX5Sq1dBRg0gg>
X-ME-Received: <xmr:DsiwY0pmfzbM7RC4hQrsNGgAnT1Lu_dApd8KGtkQIgfo6qYfMwEy8HdxO0TUK9FkXlMldeIP18Xzq8CJQmKTvWKT_5X2l-9ZXvjW86ZNVmDPsBN3THliN2-sX4DIlHRPuf4qpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:DsiwY6l1QGf6uZGlQ7JFPttBgCDFDyvYzBW16KYXfHcBBAnRWTuGJQ>
    <xmx:DsiwY02zNyLcCzsrTtbL1dAYyIQeobgJlRIelB80yPSxBjMSJ2SEpw>
    <xmx:DsiwYxsisS54DwxO29GZMnMaYLHY1eGuR_CNxZs2oWqf_eWvItsy5A>
    <xmx:DsiwY-PIZm5O0_ONhLYtVMoUR9LiwRzWGQnts38LgCqP94Ay_SY08Q>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:38:53 -0500 (EST)
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
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v4 01/12] MAINTAINERS: Match the sun20i family of Allwinner SoCs
Date: Sat, 31 Dec 2022 17:38:40 -0600
Message-Id: <20221231233851.24923-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231233851.24923-1-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_153855_705270_02DC1C18 
X-CRM114-Status: UNSURE (   9.96  )
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

Allwinner sunxi SoCs with a RISC-V CPU use the sun20i designator. Match
that pattern in addition to the designators for 32 and 64-bit ARM SoCs.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a484ff31bd2..2fa0182f2711 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1888,7 +1888,7 @@ F:	drivers/pinctrl/sunxi/
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
