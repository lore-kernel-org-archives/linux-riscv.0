Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DABEC46467
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Nov 2022 23:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2TyiSIN4tSmybKTfuG1TJhELz0M4R2jrKdC8TSWFgfY=; b=K4f2qUbWDmYhSW
	IneEBO9EDbsloel5h1MSAarNwsJTg4rdV/eZ/wA+Kly9Zaqp54Jn4Cl4qmAJPb7GKzVmgYtmU+tPI
	S1n1x0syN2rwUNURz3AVa6FYJ0PkzqGCcLGpS3WJOmDl5JHvkkA5J9neHKjVLYJGa4sANB5rVN2SH
	S/ggQp4tk02lGYRee/przTH8xOwr/e0GvnIuboV9lGdM4JvwrJen7nV1cWi4tqGD56QpKj+JOkpXp
	juZNMy3o9MC+9uW7dxZ6/OEJklRawWnI6eLlwimXUiO/3f5zXaNEJEB8sBA2KYvvK9fb7hnpdQQDG
	DHaeONCccy03opwwpB9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiPr-002v6r-S2; Fri, 25 Nov 2022 23:47:31 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyiPP-002upG-Vf; Fri, 25 Nov 2022 23:47:06 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 5A05E5C0102;
	Fri, 25 Nov 2022 18:47:03 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute1.internal (MEProxy); Fri, 25 Nov 2022 18:47:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669420023; x=1669506423; bh=oc
	0vqOxK1/ubxsXqJRc0i0XePMXd2FLoXsdGEJA3VdU=; b=cDOSrn7HJKWbmYj7r/
	9yI5ULM0q+StizVKU0Eq6TuZgOr038kWzW+LwnaREwNYbe0IqAKGYiVZ0Hzoxtuw
	LyfpyF2E9cDwqxcAVJrjnRv8Zfpitsi38QNyLhKhh5zwd3ZypU8XGS1npbrxAfg0
	TWFV7k9ZLIy/qADf88zj+84/J/MePN+ogfPYuvEIIlevFXbpCgb4iDv//FO1foYg
	JzXSLDU9DHduLBeAdE6M/LJg5LiMMwmAiI3Oo0TmCG3lWjWK+4NUCwkYFW7FhXKL
	1MDUIwJPOjdZvQDoS2RGcImJPh5P5pIlLd4bJdg5LC4mXPiDDbtYUOpFWnmaZjiV
	/DAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669420023; x=1669506423; bh=oc0vqOxK1/ubx
	sXqJRc0i0XePMXd2FLoXsdGEJA3VdU=; b=p0wuJvSCFfV8OqAkErXyz6sNTILUa
	Isyr6j1qXYU5XbxNbCrw105TVGMhovDkZJneWU3glcnV/15GYBJ5WbQru6uAksbS
	UZ0tIncqCEPzYDcEKwFFFPQFyKmMJSVv1/BtEi83WJov7o2gnURiX7yzPyvnAvYg
	0bBbw78Q1ux53e5FrZEefUXk7mHi29oJ6X7deAPhBYC5dZVBA8aVu3rD6KiJs4jM
	Lhq1mhFprenNOte4rRSlFzAxa4WZSkX0XzwLR7UqVlc1nu2hbcoWKrQqAWgAF50b
	D7vipOHt9N2++N3Sj/EB+zMED+CUjtN0vyHIFIh5IbnjcsMA8hJXmNUUQ==
X-ME-Sender: <xms:91OBY_lnoVcXCG2ckxn2_ffmkzT_dd7n_NMq1QN04KWQuIQ1cueuPQ>
    <xme:91OBYy0XpWJzNtTTSmcHPiTVI0mj7julC6p56LaahzLrC7SOalnkw2KLzKT_k4Y7K
    ulbDkfOM1L1YXeA_Q>
X-ME-Received: <xmr:91OBY1qk-a3rApzP1B2p88dd2MqyQjj3dCalGe8S8uuRY6MEiIF-jIt5oI8nBrlhA-As2_tx_453lwg170BAK51PA08KpYnd4NkNBDOSALHfKeAGpDB62c0HIdPN9WDZ52o2CQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieeigdduudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenfg
    hrlhcuvffnffculdejmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddt
    necuhfhrohhmpefurghmuhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllh
    grnhgurdhorhhgqeenucggtffrrghtthgvrhhnpeelvedtvddvveeikeeiffejgffgueei
    teeileevlefhueekjedvvdfgieevkeelfeenucffohhmrghinheptghlohgtkhifohhrkh
    hpihdrtghomhdpmhgrnhhgohhpihdrtggtnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomhepshgrmhhuvghlsehshhholhhlrghnugdrohhrgh
X-ME-Proxy: <xmx:91OBY3lCzzB5ZtRN5gFkHsOwpJOTPbbGt0T7HWQMwQc5QxlxiPsf1Q>
    <xmx:91OBY93Hx2_F1fIClOG1ZYCndOe2mI7xOGmipAHBNmsUFBsn42MuZg>
    <xmx:91OBY2tDQ3yxaioSF5X9dxplY7LV0Tv0I7k-ZP3aww0GRDdjLIsHMw>
    <xmx:91OBY4G7255r_PrbDHaXUzNQKKvzrFvsVoR1v6tVz8dfYVDHrdLInQ>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Nov 2022 18:47:02 -0500 (EST)
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
	Stanislav Jakubek <stano.jakubek@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v2 02/12] dt-bindings: vendor-prefixes: Add Allwinner D1/D1s board vendors
Date: Fri, 25 Nov 2022 17:46:46 -0600
Message-Id: <20221125234656.47306-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221125234656.47306-1-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_154704_546342_CD68CE71 
X-CRM114-Status: UNSURE (   8.20  )
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

Acked-by: Rob Herring <robh@kernel.org>
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
