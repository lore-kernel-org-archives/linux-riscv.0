Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEFEC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 22:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGrzXtXMpLv0vHf4iRSzHCxKICaup/9FINO6HecNWvs=; b=gYWjDMaSqbhaLG
	PKHWc+nYRD9woV/WCmhtTIgvdAgJhfyTPMSd4Rcz0l+ctjfunAyVranmzEp1D/CBexgwh1h95nYI4
	Vj/oScPomlLMpZuAs+sz6ryHyyXlYK4o2ELQtJN4/kSO/yj8z2OW41XlNj/bZ3EfuHYlsx7eNPDAr
	0zF/+KzHBWY5V7qdA+9B5DaFF31zTs+3PrRBPVaIoOI69bHAUIQJErnQIWUkMcNi001RnLrcmXhVh
	v2JUoI6rrWNPLVQ51jaK2T2FXE9GzY78co9RxXIddvIJ+k0cXwQV4zU99L4S3ZMbrPyr7Ph/Db0bF
	NHyi9tiDQpE6t6K6mXww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjvt-00Aom7-Ro; Sat, 31 Dec 2022 22:02:25 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBjvL-00AobF-Fj; Sat, 31 Dec 2022 22:01:53 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id D9B355C007F;
	Sat, 31 Dec 2022 17:01:50 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Sat, 31 Dec 2022 17:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672524110; x=1672610510; bh=YD
	1dCkE7VO7jGYHFV07b3XoPDh4wUwU4Z7xaUFzeNeU=; b=aqrB7VAWbjJJvLqgKn
	L3f92W1zxrXMwyrcy1mjHTF1Je352X9rxEeZMDLBmK42qOGSSH8hWKenyrsrC5Eb
	T3yZayisJBAKP3H4iTWSFvOCyOoGIJMu8oZXwxeafELygWwIMM7osWnP0gCxae4W
	T4jUjvodpZSGmyOexh+KfiRvaz2wmr8krVZoznMU0bCHlkrb+sPYFuaA1GE7PvlJ
	91kGgl2yvZaqmhHsDghMSxPMP4T1EHD593yqsFgjRqY2AMHA9wmw7vcrc9zCbHm6
	jo2g/DeFznGpFGZK55kOXn8pprPsX4qEg7yi2RppoFpsUxDlRwkaDY0sFN+EhDo5
	ogcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672524110; x=1672610510; bh=YD1dCkE7VO7jG
	YHFV07b3XoPDh4wUwU4Z7xaUFzeNeU=; b=b8gJn1LGOHujgdAyncX5kI8yWh0x1
	S9NRtqRTDHj1IpijzpiohRas4bXySk0eTtxX4TDOCtRAO2OwPOHRHstWLugLwAR4
	P/+WoM3VCxLfr0BQQubry+c8/apjF93Gcw5fo03z2pRQzNzkkGuzw51QC6/A+69p
	QNBmHSbSvMsD2vYyZx5u6XoYLPwCjNAHfO9LsxPuA8IieEU5Ei2UI5rRIZGs6dkj
	WF7D/7Lc1BIQXr5qrfdMpK+lhbuevqn6X5mel2OhF2IaxomZHHOlnG1dycdA3yLI
	c0V9iDtips2fyuP4dfRJs3CarrK1WjOdiKQrNB7Ec14cBIA5j32J0qC0A==
X-ME-Sender: <xms:TrGwYxNQhTwq17POsIWNlUNKvGVSUt5wufEiFhKnqRiSFEymDKk5xw>
    <xme:TrGwYz9GLh6ZOm49caoAVsJgFdSP90x9hTsXQErbkJAemtu8wDB4DFpOjnDN3xtxY
    BnKwmOKpxot_3C9ow>
X-ME-Received: <xmr:TrGwYwTbRMhSUVtxWerzHY4qaIF0APaZA69sSPZTNo8L75wwPy6b3-mzGBp28XQdSqdT9u4wnLLVmv5luiozCqEJIUddBpvhG5vnYqlLF8BHLHR12S8o4rsuZdMRq09oDsQv7w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdduheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepufgrmhhu
    vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
    ftrfgrthhtvghrnhepudekteeuudehtdelteevgfduvddvjefhfedulefgudevgeeghefg
    udefiedtveetnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:TrGwY9tEqsZKy2vYV1CHC_s3N8h0sby26R9jMXngPJ7jjQoUl0DZ-A>
    <xmx:TrGwY5fXgzD3svpI0neyE9ZGvqMu_uUfP6M1_VCR4rA3nTy6nFEpwg>
    <xmx:TrGwY50R700_3PQlxptAPCheyjaLexEGpN5KUyae8izDOS5dotzvAg>
    <xmx:TrGwY0t877uvRH0-8T7BqfPdK0sGswPSFOJvDyF1MRwfClybxI5tyQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 17:01:49 -0500 (EST)
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
Subject: [PATCH v2 1/3] dt-bindings: crypto: sun8i-ce: Add compatible for D1
Date: Sat, 31 Dec 2022 16:01:43 -0600
Message-Id: <20221231220146.646-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231220146.646-1-samuel@sholland.org>
References: <20221231220146.646-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_140151_814877_02937EBC 
X-CRM114-Status: GOOD (  11.21  )
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

D1 has a crypto engine similar to the one in other Allwinner SoCs.
Like H6, it has a separate MBUS clock gate.

It also requires the internal RC oscillator to be enabled for the TRNG
to return data, presumably because noise from the oscillator is used as
an entropy source. This is likely the case for earlier variants as well,
but it really only matters for H616 and newer SoCs, as H6 provides no
way to disable the internal oscillator.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---
I noticed that the vendor driver has code to explicitly enable IOSC when
using the TRNG on A83T (search SS_TRNG_OSC_ADDR), but that is covered by
a different binding/driver in mainline.

Changes in v2:
 - Add TRNG clock

 .../bindings/crypto/allwinner,sun8i-ce.yaml   | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
index 026a9f9e1aeb..4287678aa79f 100644
--- a/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
+++ b/Documentation/devicetree/bindings/crypto/allwinner,sun8i-ce.yaml
@@ -14,6 +14,7 @@ properties:
     enum:
       - allwinner,sun8i-h3-crypto
       - allwinner,sun8i-r40-crypto
+      - allwinner,sun20i-d1-crypto
       - allwinner,sun50i-a64-crypto
       - allwinner,sun50i-h5-crypto
       - allwinner,sun50i-h6-crypto
@@ -29,6 +30,7 @@ properties:
       - description: Bus clock
       - description: Module clock
       - description: MBus clock
+      - description: TRNG clock (RC oscillator)
     minItems: 2
 
   clock-names:
@@ -36,6 +38,7 @@ properties:
       - const: bus
       - const: mod
       - const: ram
+      - const: trng
     minItems: 2
 
   resets:
@@ -44,19 +47,33 @@ properties:
 if:
   properties:
     compatible:
-      const: allwinner,sun50i-h6-crypto
+      enum:
+        - allwinner,sun20i-d1-crypto
 then:
   properties:
     clocks:
-      minItems: 3
+      minItems: 4
     clock-names:
-      minItems: 3
+      minItems: 4
 else:
-  properties:
-    clocks:
-      maxItems: 2
-    clock-names:
-      maxItems: 2
+  if:
+    properties:
+      compatible:
+        const: allwinner,sun50i-h6-crypto
+  then:
+    properties:
+      clocks:
+        minItems: 3
+        maxItems: 3
+      clock-names:
+        minItems: 3
+        maxItems: 3
+  else:
+    properties:
+      clocks:
+        maxItems: 2
+      clock-names:
+        maxItems: 2
 
 required:
   - compatible
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
