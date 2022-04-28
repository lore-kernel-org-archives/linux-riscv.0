Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ADD9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Apr 2022 01:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2+eQ7BTMCfZpjnDrr1Aleapx5qEwwQzSqYE4hldY5lI=; b=fqEUsHCKQ5B7SG
	yHZyKfMLQ7ILP9+P8EcVBvfINMrmYM34Kk9VQVFRgWZbWYjstHVSUxiUsNv84J+qX9GEnhA+qslkW
	+GCzpj3mongGPPoRnhP2z7nhS6hkQ1sYRjMb+sy5KNTQnCTyVBvzammM7XhVACNCjFfAUpTiNua/h
	fYOeZD2ZT+b2TBQft5o/tPGS2UV909b54AmimCRNCurXw4ePmRBNEyi1R9ijUgeEFNlvYwkt7aXhn
	Qnq4ZRTvG2FYLpGJutAf+gW8WaAlH77YVxVqzCoJabQWT+RJCBhbLvJpuuyYq+3g/tWL/rpFZ6ATi
	LmhihkfsHhnWqO1TMkmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njsbo-004F6r-Di; Thu, 28 Apr 2022 01:06:16 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njsa1-004EEy-2C; Thu, 28 Apr 2022 01:04:26 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 6B70B5C0219;
 Wed, 27 Apr 2022 21:04:24 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Wed, 27 Apr 2022 21:04:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1651107864; x=1651194264; bh=hF
 ubptiKk+WdrpVFqA1+L1fyR6PoDcD+g1uY9JtK+1Y=; b=C8sbB9RsZ8DqF2YunK
 QO8ZGFnsm0sSJwnkZedL7kF4S3V2+om/3RJNfuujI/Aq1EK2YIDEY/7Ky3UGHzJE
 ejhDkZOI4Y58GFf1cSKqH4tPi6ewWlPZ4VmG+u/mD0szPVsurpnLcOucN+0GE0hb
 q7VXHKbWGWHbcsZL1HEE44u1TFwrXgwHcOlHnEcrRewXwIRKYpH87EAtMFUDxCfT
 b9HnbAR+ovOzBAzTOrHuaXztLTSQ/HGgEKd22z0Sf0ar1D5S8O2mHzo/cZy+iDeA
 Ihr3AEVpK6uHm3+XU02NijWue0UHo81iYKvDTr6TKktM+4bxfN9b2sioPeVLQiKS
 jwBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1651107864; x=1651194264; bh=hFubptiKk+WdrpVFqA1+L1fyR6PoDcD+g1u
 Y9JtK+1Y=; b=GjhI6f+Pz9p0zo90iyPRMPtUKuvdgZ/J7OIC35knre2KqvDLmXm
 aVLQ6pGKePTlnZ/FL2u35xYoraNRJB5HInSy4NzVG4u5jbK7X431JxfZDRyIL0Z3
 PCy1m159Oe2HEVJOWtzLIlCmXHB03cHW5ewZmFlHNkIejoaZ34gpo4H92a2GgsE7
 CX+rqJp1Gl401Vy4aqBB7anhzBmE3HGCuIyOdN722wnWzcoVKgyYItDd3ExV1qab
 OI7uKxn3bcsWHXHrpx+vKqmnSojBipRX/90+cgKBbklqg4vsZoE885gMV5zpL5uV
 ueF2u7SRQ73qrzSRB+KIV4ITInzHwcGTK4w==
X-ME-Sender: <xms:GOhpYkzuiH-p_RNEUJ44ZLyxHBO4-cUlnNBoFJv2Tko_7s80VKG97Q>
 <xme:GOhpYoTaazEJH3OU1bwC_a3smKj0eiKGkHh9sH_giXcPOAKTpBKkgmXa8XEwmSZdz
 _i0g1kzTHQ0XoJNzA>
X-ME-Received: <xmr:GOhpYmX6TtK5aKLmKgb_3qIUV0fev2ATMnCqdy1SazcJPHqFt9Ry-qIFI8AaT5Ho7XUBwVF5pdTjUNX1KwfruDs0Qb2TJOQPozkyjjKEytdVNViFecz4xDDVAjs7I1OKHJNbjg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudeigdegfecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:GOhpYijHljBkJp2PzRTqlHSfedQ5_NGUCB75LV80pMV5k41s0F26BA>
 <xmx:GOhpYmCARKzorQwB8vkObTo8V7A812hrtRleBBqLqlVmD5sqWlBFCg>
 <xmx:GOhpYjKF5_09Ka5F4m_B7JUDEAhgj6K-s9kUZL3mbrHHp2-9mshpQg>
 <xmx:GOhpYsQRm8BtqOCvFxTWXTU43XlJ-mz68drClYskBalye7AdoPUVtA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 27 Apr 2022 21:04:23 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux-foundation.org
Cc: Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>,
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Maxime Ripard <mripard@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-sunxi@lists.linux.dev
Subject: [PATCH 5/5] iommu/sun50i: Ensure the IOMMU can be used for DMA
Date: Wed, 27 Apr 2022 20:04:00 -0500
Message-Id: <20220428010401.11323-6-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428010401.11323-1-samuel@sholland.org>
References: <20220428010401.11323-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_180425_219612_104DF288 
X-CRM114-Status: UNSURE (   9.25  )
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

So far, the driver has relied on arch/arm64/Kconfig to select IOMMU_DMA.
Unsurprisingly, this does not work on RISC-V, so the driver must select
IOMMU_DMA itself.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/iommu/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index c79a0df090c0..70a0bfa6d907 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -223,6 +223,7 @@ config SUN50I_IOMMU
 	depends on ARCH_SUNXI || COMPILE_TEST
 	select ARM_DMA_USE_IOMMU
 	select IOMMU_API
+	select IOMMU_DMA
 	help
 	  Support for the IOMMU introduced in the Allwinner H6 SoCs.
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
