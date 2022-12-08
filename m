Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11512C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Dec 2022 09:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TrJ51XUE+fL4FmITjCqcjPKLw8q7/i2Ov7dQrwPVWjA=; b=NF/d3t8W/crXAE
	ZTDjEFrpitNUWUZPMtteaQ7lFcYzq20sVdMfjr8AaWYfQD9abGW3rVN2ofD7JJzKnMXStP4lZI7yl
	7brt9YqZnS09gBOsQ+tjgVxtXaiS+9772QD+Jk4mUiGL5ffAsyd5bkU5GsCU0NzXM3VePo2rs+GNs
	lCv3xFLXJnQxwBZWWgR6zq5O1/vghtrVAsGbEF2MPsmGRONWSFASQ/hflRIzaS43dTbDZWBH9bwry
	pmRcZ4sc4Y83MJPRh6MGMarha6wuEgejzt+vbauXtEXATTzDYF/8Lr45ludbANTyFYBaEIEpqyycj
	lkmqhwo3BBmIrJJT3Nvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cr7-00AbD9-JF; Thu, 08 Dec 2022 09:06:13 +0000
Received: from wout2-smtp.messagingengine.com ([64.147.123.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3Cno-00AXb3-RT; Thu, 08 Dec 2022 09:02:50 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id C70ED32002E2;
	Thu,  8 Dec 2022 04:02:46 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Thu, 08 Dec 2022 04:02:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1670490166; x=1670576566; bh=JG
	w0CLwJFa2mZr+m37NEpZYVUBjHBKI5WIz9XbIZnTk=; b=wvBIW0DvyIQbRAs30J
	jlkHHoMrwMIBsqzx6UX7BjDmqSMcun7h+lW3DEFvEW/F12vgHWuuW8Ah/NuydmBJ
	ekxL5bRyPsmAOo2M9TPmKT2aIl4uau2pyN5XlqrArpJy+U1stQmy0GBwMOeAp7lD
	NJYPP4W04qt6j7EugrSxpSSrfHLrbGOM2Kl+LsK1LQ/Mz1WN7ypqeRG1xaSLO9O3
	EP2+5DSCeigzO5Dh4LhrFr5CBdSiOgy3x5nNxhpbKhiUcPUITNnNrbTucEgy68Jj
	KSjjzLpX+Nd3RE4y2JvtlBT+Z2uOmBVXq2KLbqoKs12UF1LcQAabBLl3wxPUmxxJ
	Gbkg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1670490166; x=1670576566; bh=JGw0CLwJFa2mZ
	r+m37NEpZYVUBjHBKI5WIz9XbIZnTk=; b=Ek7osepW+po1q9BnKMowh0x7B5GTx
	3bEUebCShPTf8KYHot+5kA7JlujyNGJElI2vkFNrsAoG8lAbIx3gAty73SB4n7PV
	GHjiYtIL8CCsgU8BR3xyFmCq9U6PjsoXSF7o+1VSWs41JT4WG+V+1FnDHlhfFAjC
	o8kq2eDoSwkOEuhevicnYFc+6gQ3PFJfYYs0rtP8unfooPDuW9ZqApMsE2GCCivE
	EYjgpmltJcsJLjkFEG6NnFFcTAyObw2sMhrDqk1ij0qzo5xxkqcoop+lZOas1mLa
	6j7wQ9hVNM+8W6TVKTRUXHwRCnZkhZFeY620+ZFDAIAv+1PhtwNmMTRhw==
X-ME-Sender: <xms:NqiRY-PyG6OXOk9_niGbbqOmwr7cFkhoMh_j51QoVcQ-bNYoBKphQw>
    <xme:NqiRY894WJog3CZsdIvwWaj6gNcrLrREmoAAaNxv2YXNpR8dNDaOuTlUL_fnoKMOT
    P3fFYZoYNANA5M_8g>
X-ME-Received: <xmr:NqiRY1TCaQx9XIxhZbLJvQbP-6xMSuoW2HMLqXVDrAdh-cl3-_M9J1b2HUP9Qng5P3IiPwAES3eddQrwzF7PKHL1RBRTcg8ATVcOMS8_t8AwBBcZpBMQkWtDcOoz3x4v6-qPeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudelgdduvdelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholh
    hlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepleevtddvvdevieekieffjefggfeu
    ieetieelveelhfeukeejvddvgfeiveekleefnecuffhomhgrihhnpegtlhhotghkfihorh
    hkphhirdgtohhmpdhmrghnghhophhirdgttgenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:NqiRY-uh8o_-mttOnNxud2pWvNzGp3nKtQSVJWTroT6A0iC67iIo5Q>
    <xmx:NqiRY2fXr5ISFB1CvAWT5UpntxMFh4hMBPCi48UjrZV5LUilGhU-CQ>
    <xmx:NqiRYy3dP9ZBHKQSUoY5BMLGesIYyqwSYNL9TvxrldgrorxHJP7cgQ>
    <xmx:NqiRY5vxTt-SOckaDgEmOK3HvBOIESt_eHiWB0z_ofM4fFjnG-6Wjg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Dec 2022 04:02:45 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Cc: Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Guo Ren <guoren@kerenl.org>
Subject: [PATCH v3 02/12] dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
Date: Thu,  8 Dec 2022 03:02:27 -0600
Message-Id: <20221208090237.20572-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221208090237.20572-1-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_010248_964160_D4FAE958 
X-CRM114-Status: UNSURE (   6.71  )
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
Reviewed-by: Guo Ren <guoren@kerenl.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 592e43911a07..f2c67b7418e4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -262,6 +262,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^clockwork,.*":
+    description: Clockwork Tech LLC
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
   "^cnm,.*":
@@ -1430,6 +1432,8 @@ patternProperties:
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
