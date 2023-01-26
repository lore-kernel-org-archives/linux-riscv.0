Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC91C54E94
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jan 2023 04:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VomOF9rnr9AII8Wv/3mxaEtv2rVBKiKeHo0R2nmeIbA=; b=XyBocDnQq7IdbP
	egpDYOW9aQEOkFsagQHDQl7EgPyBJCRt28hypcGgC4wjThQP0YodHKclZcwP5apAUHyDRZGw/iuyV
	xi61uM4ZffzsVmOx5FpJ+oYIVdY0n8J2z0+d/ee/mrviEMikh9Fpw6pvmsfV4UvyqmB4ncKHRLqWN
	eTyHfdsEUW9Bp9lpJqx3h0olfutjWvf0SJlCLXBHkRcA1enf+k4mUitHdSvmM6enScKiFewQZWaLo
	Sz0l1WIB6LpfaAvbadFHD2RriL4HmUaQlb6CnaJzTI/lhzqMLNa+6UXDJccXXOLDBGwHKCtHZ86/0
	GP2Rl00IcesmbN8kRa7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuKx-009bae-B0; Thu, 26 Jan 2023 04:58:11 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKuKT-009bQl-1T; Thu, 26 Jan 2023 04:57:43 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 7001D5C0568;
	Wed, 25 Jan 2023 23:57:40 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Wed, 25 Jan 2023 23:57:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1674709060; x=1674795460; bh=f3
	oasT/IpT0I6FIdvaYChRtQISkb5cTVuFVOSELrKsg=; b=Fi2x6BtbpdsY9nDuwz
	eC3X/KHKds3VnAHYxcGGlNHeSd9HxQsKIu0gzDD26pnMKHdZ/LWJjZO1lDyZ1MNT
	T5T3TZNQCEuZfO4GAVXPw77ARCREyWQWQOPlGeiSjTjUsKNibULBZgrVsxB7g4Wj
	dAHfqIrNJIFOXr8jM6eaA00XECAGOTEAiWLtrvDmb67f7GqixbwcqE1YGCOkxbg2
	6tnmvLnDcOSz6MeywPh30TyxoXg9GvDv+f3XmlmDg8CfSyzMr4hqpISAKXGQdJ6b
	XdG7wyirB/yVa0ZWcFpZo/GsnKv+wrdSbB+cDQ+YuC3eqWKoJIV/tHYyxgo48GXq
	Odew==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1674709060; x=1674795460; bh=f3oasT/IpT0I6
	FIdvaYChRtQISkb5cTVuFVOSELrKsg=; b=HD1684ckEAu5yS6v8C+GdqwVY0fQr
	LLADtxp4U28bqw9nVuqfN+fZRQ5Ev/pkOwfTfacBXGsjEXv4flzI/3iGoIVlRRj1
	WvztxU7sONa0LIY1rKBFuijVEB+UfRqVOXw7CGrQq6j2R+sQ3RIKceFGq27Thx3S
	AWFQhzetSygtk4y+g/CXOCqAJAp7opFJB2A/rbG194UXw/LBSGITQlqWes7zJCIm
	iua2iO1bnju8GZUMPULdyzfLgGYmWDUp060C3eg5aQ4BDYyhyiGfFGjzO2fblYBT
	P4GXXXKJx8eGo4gLfatywBv3sJgz/ukP1Ug3t1Z93AQZXYaCJzQp/Kskg==
X-ME-Sender: <xms:RAjSY9vcpsYDHHXWG3n2GccwCpDzyDRJUD7_BTz3a0rgaibrdCoshg>
    <xme:RAjSY2fnUktqbFiHu_Eg-oRpNYc2PUkN-naoeKXX_pHx1-Er37hDzb_vRFkIx3igo
    3HapDlGGj3gOILsvA>
X-ME-Received: <xmr:RAjSYwxphyrsq3q0zQ8F5a60bJ9-u219ACrFVUchCgo-ma68Netn5OuAR_ZkqYOlcdCskKeO_Ltr7ClZ6Yp4C602MppY4fgBsIYmlOde2rZwAHjtHKZihPf8iVYGE-gFXHrsxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedruddvfedgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdljedmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredt
    tdenucfhrhhomhepufgrmhhuvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholh
    hlrghnugdrohhrgheqnecuggftrfgrthhtvghrnhepleevtddvvdevieekieffjefggfeu
    ieetieelveelhfeukeejvddvgfeiveekleefnecuffhomhgrihhnpegtlhhotghkfihorh
    hkphhirdgtohhmpdhmrghnghhophhirdgttgenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:RAjSY0Pu-0c-C6_u7B9ZtxTDkAU2_qWLEPfRftHR9_BfR15YopeeKA>
    <xmx:RAjSY99oXPqe-Srkq8l2Iwdiyt6JaOD53zOAMjaQXDYSmtTqiIIrww>
    <xmx:RAjSY0WdCzDnCjvaLZZ8ElEsqVPPcC_Ka5HTK1wAXgg3zZK1nHXfxg>
    <xmx:RAjSY1OV4k7JS-mCLO1rEhSDeQBuo2uYPZHMSulWddCV3HyR3YE16w>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 Jan 2023 23:57:39 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev
Cc: linux-riscv@lists.infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Rob Herring <robh@kernel.org>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v5 02/11] dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
Date: Wed, 25 Jan 2023 22:57:29 -0600
Message-Id: <20230126045738.47903-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20230126045738.47903-1-samuel@sholland.org>
References: <20230126045738.47903-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_205741_165838_2FE907BA 
X-CRM114-Status: UNSURE (   8.82  )
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

(no changes since v4)

Changes in v4:
 - Rebase on v6.2-rc1 + soc2arch-immutable

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eac00f1c770e..b7055a43c6c4 100644
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
@@ -1448,6 +1450,8 @@ patternProperties:
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
