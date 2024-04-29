Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966A9C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iMy/4mQkUdoBEtCWcoJQZqM19tcZPUD/I9iHWoUQpic=; b=Pt1wM4ud2uLZOs
	rbaWiiIl9KsANgRq1SJEOhTENgoaoE2vVK1Ki+0Scle2DGoXjqkUq4dqEKqWJXRQ8kodmBfnsOW5y
	H+/Bz4+BsKEjLHyVej7VFgu6qB4rkFls+zUUuBfCEYWri+iwTa4eluj8ODMiY3u0kAin69bQBIWL8
	zZBt0s16XOdDGUI3ni3wdb5QUvp6iDZwgVfevACDaHYfLCOcr2Hkl6zzH3REVIQN/KI2n9w+3i23O
	/ZhvHOP9cbS7Hy3btEuXiurwU/02mSmd+SZ8AHXCThkXwf1Yr1C6auZhqVTOdQ/S9Rcrz4Re6iTB0
	Eqlq07zIrGHCux9QyYqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErP-000000012lR-2eI1;
	Mon, 29 Apr 2024 00:27:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErK-000000012ga-2DTf
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:27:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C3BEE60BDE;
	Mon, 29 Apr 2024 00:27:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A8A9C113CC;
	Mon, 29 Apr 2024 00:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350420;
	bh=z5O26Wd/mN2CPMO2FozsGOCw0zDYK5WOLHYQMcySy8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pS4rRd9f538KuN952oyshxDxaZsPlJURFYl1hst+rQpnfTDu3dpXzXbKySKHverJs
	 zN8NNk3D9uly4RZ7QTncBMGZeJbATAyEYdqF8crFo/doiEIBlDonmD189Xt6uPNVIu
	 F9KR6nGtyp4VvI4IgHKlcgT9qczIF4Qx0I77lZ/PipaFbUi07M5JqW+EkbuMlPDe3Z
	 nOwhN6Aw6UgIoVc7BbWgoebHavBRLVQZKPfmtx9YmQ87npm76H0NUUfA2+0IXnuGc4
	 +J4lsYvVpI3q58AzXdF/J3e/mIR/eylOkDyvnHA1tlXS/PhUz8kr85LrbL7+8+0adJ
	 u/NYCRg0WVH/Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/8] riscv: dts: starfive: visionfive 2: add tf cd-gpios
Date: Mon, 29 Apr 2024 08:13:14 +0800
Message-ID: <20240429001317.432-6-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172706_643144_BE150BF5 
X-CRM114-Status: UNSURE (   9.41  )
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

Per VisionFive 2 1.2B, and 1.3A boards' SCH, GPIO 41 is used as
card detect. So add "cd-gpios" property for this.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 910c07bd4af9..b6030d63459d 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -303,7 +303,7 @@ &mmc1 {
 	bus-width = <4>;
 	no-sdio;
 	no-mmc;
-	broken-cd;
+	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
 	cap-sd-highspeed;
 	post-power-on-delay-ms = <200>;
 	pinctrl-names = "default";
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
