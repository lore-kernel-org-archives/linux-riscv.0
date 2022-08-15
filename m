Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F67EC25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 05:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3k0IA4IBYftSIBVxG6Ei4OOXYFKdbHhRNdOna0LJwM4=; b=R/+rDFxu6OPV1z
	TNn0j7YL7K4agGz+Uk5dg5243JLQobFZ6mUcVIVYgE09mWqn5K201aMkf93rquO5xuWvdWRaEGtex
	JJlBeLOvb9eti4/YIWtMxHmKh4O7p+B4YeK/Igqc8J061JN7JXaDJUyQ+3STvVUzNYnMd/23SfD36
	gZin2sFuv1+N2w6VCNyNY1+dQFgXeQOc29/Vn/xUPhxnoVAvLBRzXQWtzxguq0eBqi72wPz8KvMFY
	cv2o9PKal2klizJ2bzEsDwtQsoiS4SsTNpQYXNwQqk3aUIx9XZh9xFOK7MsuavNAxGNc7NCEm7LPu
	mxPJnl7Pjb2jjHLvwD9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSL3-00BQLh-FS; Mon, 15 Aug 2022 05:08:33 +0000
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNSKy-00BQIN-F2
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 05:08:30 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id E802632000F9;
	Mon, 15 Aug 2022 01:08:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Mon, 15 Aug 2022 01:08:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1660540106; x=1660626506; bh=1b
	8wvlOIqq08dzssrbjKws+JgmGzBWVPDh4Dm1RTFCU=; b=jWF0lvKSrnMxYNz01X
	1WCXUHnk3Xx7veBUORmXijOreUbQeBMioHxw1iCFYTS9Dpj9XCnCghsIOmQYKE4c
	7qKDJCtrE2M4Da0XxiGjL/cDVV5/f7vNCbTkUT6xLIY9ZA30wrLXMWLf81sJb6+q
	LJkn5xhph/bdZmkC2lbgN8/OuXAwfaqZbxGnprsIuQmrKT4EfzIstjiXg1PBLXYJ
	ZBd5jG4ZIBJmp9WLEG4a+buj4295tsOc3nLQHRtTT9+SXCl8vbkOwttSmuGyO5wE
	1xuTQYEnJVZZs/ixtDkqPOEvz8xVOkUAU4DRXWLFjSQhYI+qqvtUR/adqav5pLNi
	5qzQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1660540106; x=1660626506; bh=1b8wvlOIqq08d
	zssrbjKws+JgmGzBWVPDh4Dm1RTFCU=; b=DhBNH1UDadbs/vc2awR003MB7DSL3
	j7PgSENLFy+gg4XtsE9Tk1uxiFtjhYTpnwsBmhOht5i0HRu97L0qbC7o76RH83c0
	Eaa3Zg8JoS0hXxAbtLcbUzuW35oNccb3BRymKKZwp4hgzErSdTCmuCgqFT6+q3Vg
	qOVeB7K/wPkEyLL76gYA+931QMuOp+PV29rroAjojGposxO/SwqRBdnlO9enLyKG
	IEayl1qUMcUwVPm5Le36RAuQY3ZbefiRnau5uFfnm+IX75lu14AsygJKGF1vF80V
	ziHDC2okA2Tpk21pKcRdESc7atcutvfOuKIhfw2+h3DoGzp7IP1YVnNpw==
X-ME-Sender: <xms:ytT5YgNuDI3W1pB6y9oem49C1zc3Ya5kyU6FKrT56XoNy5qJ6VoA2w>
    <xme:ytT5Ym-l24WuXrLdwU-FwGJpU1AISmXIlOso2Q5JnWihq3vEPW6BRiqFPFG7CCRv4
    GyXtW_w3uBZ9SB7Pw>
X-ME-Received: <xmr:ytT5YnSC2xC0Mifh65yzfVHUVA0Kefg7EOeNfTPvIfCM993xCeayRoSEV9G64fpVsVPfzThb7U1tAUQf8auqSpvaDka3elPn8XaupzdRWjdRZ46c6FL6TiAvZHMS-ZZ6ZmGwDA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdluddtmdenogevohgrshhtrghlqdfhgeduvddqtddvucdludehtddm
    necujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmh
    huvghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecu
    ggftrfgrthhtvghrnhepleevtddvvdevieekieffjefggfeuieetieelveelhfeukeejvd
    dvgfeiveekleefnecuffhomhgrihhnpegtlhhotghkfihorhhkphhirdgtohhmpdhmrghn
    ghhophhirdgttgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:ytT5YosvfoRm0rG_2DYgvoFqi386Mvcpb3HjO3Uf3EfZlib0UNdnDQ>
    <xmx:ytT5Yofk2GLlMebkzICcryKPSXgVmAxM3Ne86KT9PNrSTGmrOUDmbA>
    <xmx:ytT5Ys0zBTM7IgU5King9sZzfzTPHoawLu96qaLV7tcKFanc3RtniA>
    <xmx:ytT5YpWmbYjQkkx0sChh1uYUvLtQF4k27wMrtuTtSPkIICyz9HUuTQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 01:08:25 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Cc: Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH 03/12] dt-bindings: vendor-prefixes: Add Allwinner D1 board vendors
Date: Mon, 15 Aug 2022 00:08:06 -0500
Message-Id: <20220815050815.22340-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220815050815.22340-1-samuel@sholland.org>
References: <20220815050815.22340-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_220828_653127_A1762608 
X-CRM114-Status: UNSURE (   6.86  )
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

Some boards using the Allwinner D1 SoC are made by vendors not
previously documented.

Clockwork Tech LLC (https://www.clockworkpi.com/) manufactures the
ClockworkPi and DevTerm boards.

Beijing Widora Technology Co., Ltd. (https://mangopi.cc/) manufactures
the MangoPi family of boards.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 2f0151e9f6be..52d076ab6c48 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -258,6 +258,8 @@ patternProperties:
     description: Cirrus Logic, Inc.
   "^cisco,.*":
     description: Cisco Systems, Inc.
+  "^clockwork,.*":
+    description: Clockwork Tech LLC
   "^cloudengines,.*":
     description: Cloud Engines, Inc.
   "^cnm,.*":
@@ -1412,6 +1414,8 @@ patternProperties:
     description: Shenzhen whwave Electronics, Inc.
   "^wi2wi,.*":
     description: Wi2Wi, Inc.
+  "^widora,.*":
+    description: Beijing Widora Technology Co., Ltd.
   "^wiligear,.*":
     description: Wiligear, Ltd.
   "^willsemi,.*":
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
