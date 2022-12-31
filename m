Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8C3CC3DA7A
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 16:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zn9bPRKn8Rax30pOk8jtdBNxKyDv1IkqOGFxGuinfao=; b=ddBN1Zulj1wpGX
	eS7tP5+IV9n6d6ZWkPNSQS/j9o0PpPd8wr61edpfLAN305FVuW8W1JaJ+wUn5jFlryAQ9Nk0PSYr5
	uZjL242V1QMnnkNm1yS9/HB4avijuREmekJCEbUky3SyK8hLGVOBlcPBvCrh4vDvs3fRG5aZGesmY
	W1nHLVyaYvNNzuUrnSqdo/R/a6t98juGLZF5SS0t0D1vhOKWk95Ms4WKmVEVFzkzh9Mjdg5RMSPwJ
	8UEak9XnNk6WfycekJd73AKpIdPETxc7rqSmZIRUwqLQxD1LpYbbnHeldnLyekZ1Yb7ewM+VacCat
	b6T0gFY+NaX8w0/F0Hdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf0W-007drv-JG; Sat, 31 Dec 2022 16:46:52 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf0C-007dcu-4B; Sat, 31 Dec 2022 16:46:33 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E9F6B5C009F;
	Sat, 31 Dec 2022 11:46:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Sat, 31 Dec 2022 11:46:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:message-id:mime-version:reply-to:sender:subject:subject:to:to;
	 s=fm3; t=1672505190; x=1672591590; bh=IPRSVAlAA4D6HDvNWgLVkLiHQ
	Bz7BJqcTy8N5hQX4yE=; b=IOjIQ46SoPZa4vkAaoxXi8FLpSzKMEv0GvyCfxttY
	uXLvl8/ko1QT8vXUHgi2I2FTP+nHhdOWYCsLe2XxzPuzWNDR2B2MlG5w4FixZ6Rr
	0gVDT2bjrGtXIZl3PVmi5TIpKoNCP7XhiGfOuo1JEwUvsdopfe6iVpfBbr8zwedG
	eyO1vVFxdZa4iw4qmckC4MM5tho00q7X0dzcSOvDbpnVQ79gpwJ7D48BMoVRrfsD
	jK1w5YMH91pgxG54lq2b9X9r+oFqdkfEcM7shrEIP8oAoRUJTx2DXOzGt2hYYk6O
	KwAcyBs/UNk0/+r+ykgMYZ3oCi5tCFYmMmk+2kX0lIUKg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1672505190; x=1672591590; bh=IPRSVAlAA4D6HDvNWgLVkLiHQBz7BJqcTy8
	N5hQX4yE=; b=X4sdFJUvDr8NMUsMd3IzTLkUDUtLV0+w4ipujJE78crDQ18stYm
	BFRoY3S/lbDaFFUbr/YhGGVNbPsFhaz5KjXedOIkWgF/pE6StKyY0URONg3Ll/ad
	zNnqOLhmFCDY8nLbreHEvEZar8DZk+2dNnnKn/p3+O725QOErDlhn8TdIBXHoATt
	NAg0KzasRB5N4Nys6iV3ZlNqZ3RrJknMQmJZ5Hc1I4cGgs98/fIuTVS40eRQbQ3D
	iWgyFx8IyXu21GcgRgPgvcy2YQy6Y4FvqqVusXNyl4rFHytPCl5LX41X/Qd+AW0h
	/ppdaTbhNXIx8uIgjuccsnoDvQDDrllK01Q==
X-ME-Sender: <xms:ZWewY75369dzlXIfAHhvDGNrmFzj0pT17PrrQ_9GXEXBPM6QchhMEg>
    <xme:ZWewYw7M9OtC4dTbUucBBIF1Gy7JDrgxGdxwR65bi5vnyrnch9QN7YysJmzzW4aFk
    u3s31nzTYCoA66ZHg>
X-ME-Received: <xmr:ZWewYyfO155MICpCKvnm_a0orWEOf3FTgtbNwiVrG8Vf1WuXv2jOtSsrwBUe3lS6SDEFdB2_05ENWddL7dXca_0ACG285KjXI5lRAirkYbySmx9f1BFczlt2SwWd-pNkmdm0PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdeludcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgvlhcu
    jfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtffrrg
    htthgvrhhnpeekveelhfejueelleetvdejvdeffeetgeelheeujeffhefgffefkeehhffh
    keekgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ZWewY8I88adz0HUqOWw9yKn_XeICq5lRjhc2E2-iEJcY7L5yLZQE5w>
    <xmx:ZWewY_LuaLmQPSrCmN_kUIirZ1xHGzsQM4-zn9vMZAoGh5GFuYThog>
    <xmx:ZWewY1zFWdx9eepJBcNa6DzxkuC9YG-vatsq6myWtDXOlt9YbSsq1Q>
    <xmx:ZmewY0CLMJMVCej659_Tm_1qBPM7xY45PD__soSDEHKWZtA4L_QjZA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 11:46:28 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/4] Allwinner D1 video engine support
Date: Sat, 31 Dec 2022 10:46:23 -0600
Message-Id: <20221231164628.19688-1-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_084632_281673_3287B234 
X-CRM114-Status: UNSURE (   9.70  )
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

This series finishes adding Cedrus support for Allwinner D1. I had
tested the hardware and documented the compatible string a while back,
but at the time I had a dummy SRAM section in the devicetree. Further
testing shows that there is no switchable SRAM section -- there is no
need for it, I was unable to guess the address, and the usual bits in
the SRAM controller register have no effect on the video engine. So that
needs to be made optional in the binding and driver.

With that done, the node can be added to the devicetree.


Samuel Holland (4):
  media: dt-bindings: cedrus: Allow power domain references
  media: dt-bindings: cedrus: Make allwinner,sram optional
  media: cedrus: Make SRAM section claiming optional
  riscv: dts: allwinner: d1: Add video engine node

 .../media/allwinner,sun4i-a10-video-engine.yaml       |  4 +++-
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi     | 11 +++++++++++
 drivers/staging/media/sunxi/cedrus/cedrus_hw.c        |  2 +-
 3 files changed, 15 insertions(+), 2 deletions(-)

-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
