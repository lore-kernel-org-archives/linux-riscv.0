Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75650C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 16:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UYGousGTAIh/X0tl5ounVbsJ756jssxUyLd6xfg6pMw=; b=njapWaIB5N+zWE
	Yb4iXIeiA+8rtIRp182WIOFocbsP4yH6MfmcIWeFui2DlTtAXYnDR6srSU8OYoKe5gcrtuDHSHa59
	GmD41s1w8xUOVouCowVmePhZVvP5meYZB7vqkWrfFIfX1mbW43iWrOxvy52TsnoAEZ5k6SYaNmf9/
	CIXZpc717ccsph1yem2RHXEO3fSomwdRxZO4/UB/0E/hAg8L7Lo+7nIO4T6P0Gc41OI+/FDt8bWle
	bDcz21kbXES7WvuQkDAtkr1Qeq106g9Dv0aRqg+e38u+B5JVd2CeRMMJ47kK6mXtDNgh4RpIz+aAN
	EKCmwcHFCSlHcNfUNjYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf14-007e8M-6G; Sat, 31 Dec 2022 16:47:26 +0000
Received: from out2-smtp.messagingengine.com ([66.111.4.26])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBf0D-007dde-3I; Sat, 31 Dec 2022 16:46:35 +0000
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 644E85C00CB;
	Sat, 31 Dec 2022 11:46:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Sat, 31 Dec 2022 11:46:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672505192; x=1672591592; bh=1D
	BP+rGGLrXexyIgtUoV3nBhVt1qdh7rplGwtcADlbA=; b=e5vzK2/pbB8gZeo7qF
	c60+an/Kwxd7BMvePWfJ9q3xwb80doRZb4xwwU8UETvmwxhTLkhkF1kOtXrYlo2f
	5YEJItP+f1VjKbff4i1/0pdcEUrky3zmUIZONKo88TTSCPWJuDAxPRpzaCdSukmx
	rThbjWpcwGKoZwD6+jefZDW/CsiTqsTocbDH0LOney+5DdkGvgePpIGiKv9Arayx
	mxlHs2ryCWK9+xEOxY3V330oL7TSMtQpdnkJmK99Z7T0rCdF1DGH3nx+2wMS+Mf4
	NNaW2MjOnqeo2FRViHuwuqwo0QEvCM79IDBEux1nziwCHvhD0sgUEr+lRwrHdTxg
	WlJQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672505192; x=1672591592; bh=1DBP+rGGLrXex
	yIgtUoV3nBhVt1qdh7rplGwtcADlbA=; b=OmRoilvKB3hnuYsCxnQPK9mXHGJl1
	OO4BkDOFFVeDfqf6AWkCOEgTFXWzutaY+GBE7Fi55ZIIVVm9HAHZViLJ0GQFFvAt
	U5s+ki5nsRMqRliLSLPLAOOZG9FhG9kdR+rryp7F/lDU63FgxCoRp5o0R+3LB2Qd
	1DdbkBmoTOrzTCIQCzys9mthJoW5sE8aC2vQikyZYVdo7k1s2XmhJ5z+mNlqmwU6
	hU3QTdCIcNnCSReX0eDfsyK+RMCc90eZSfZLrvUJBnD9TO/UJQ/MkAyE7/R6T6dh
	t0QaoyjR9Y5s6AvucVUU98YIXf0nFzgGHZZgc+suPXlsD9kiY0m1p6Vgw==
X-ME-Sender: <xms:aGewYzSOKq09gkyWPv8ncOA3_579N_Ah4E0zNmBmSI2m5GXXkdb8tA>
    <xme:aGewY0xgx269-Ay-W2mbHpmXKaCJtALPRJn6J4eH0Gyi8Efj23aJ2bKsjArs85ASx
    jFTaWc3z341YSHZMw>
X-ME-Received: <xmr:aGewY42g2PAfXjlpGZO9EutL2_LmJlPTjwHzAX6vS476DacuDjOuF5Ey8mMDdmTj7IxiVkGQrrvWE1a4YQvAaJg2u6cLwV0nAKZZX9M0kMi_W125bSdRg2Cmzje7ozzKwehWaQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieekgdelvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:aGewYzB2Wrl6y9fgbpxLIi0WfqPPgfKZXowQqB6qb3wp2ls4_7Z_5Q>
    <xmx:aGewY8g2NwLGMuh1tdFTyBqb3Trm-9ZnKrqE2yhrYfEIfXtSjykmpg>
    <xmx:aGewY3qfAP6pQPZ5WvI3qOinQ3d3ZL3jl5Hm_zPa2xlnywr4KM3CnA>
    <xmx:aGewY1YJcGNoln_Fl3udknLlditU6uqvNakHroFUmA_1ILHMVu3AlA>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 11:46:31 -0500 (EST)
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
Subject: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain references
Date: Sat, 31 Dec 2022 10:46:24 -0600
Message-Id: <20221231164628.19688-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231164628.19688-1-samuel@sholland.org>
References: <20221231164628.19688-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_084633_261693_D10CF02C 
X-CRM114-Status: UNSURE (   8.97  )
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

The Allwinner D1 SoC contains a separate power domain for its video
engine, controlled via the "PPU" power controller. Allow the
power-domains property so this can be represented in the devicetree.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
index 541325f900a1..d5be7f604e8c 100644
--- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
+++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-engine.yaml
@@ -63,6 +63,9 @@ properties:
       CMA pool to use for buffers allocation instead of the default
       CMA pool.
 
+  power-domains:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
