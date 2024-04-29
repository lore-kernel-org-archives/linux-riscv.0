Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1879C10F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJPg/6DUudvr2+SXLIe9p6QAkY5xlVELxDZLKrLebow=; b=3q5Fasi9Gu+E29
	/aHC2oegNboIiR80O4IhYTkMEoQ1auCzcUmvGFtrUMdMcNJo8op682IUOqG0XYUT9y+YylWf9Yybj
	hpkEIaYgAWXUDkCJFGS64l+OsOYpMUpE3f+4IjI8INjfdu6NEusWrVwpKJliRzEYg52HBXDb1Fx7J
	Q8jjfMNwGR8EcGM405oxH4aCE26o7VW0hBsLzCnmyAlyzXJyic0FvXNO7aOfaRDmFKkrY7fxS8ZJZ
	dzkclMj6Yg+0dsd9FfPT/xfYCz4TAIIf8D/VchzpFU/b/4uD60DbVC4UUkUoFK4xhL4nKoq+9Y5Dr
	RLCXMGXxs1ErIWNHJ8Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErD-000000012g5-0h1K;
	Mon, 29 Apr 2024 00:26:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1Er5-000000012e2-39Ap
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:26:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5E55260BC4;
	Mon, 29 Apr 2024 00:26:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7B3CC4AF1A;
	Mon, 29 Apr 2024 00:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350410;
	bh=X3AMkYS2CfMdu/dFK6C/Hj93fNJfuxImVPaXP7FNbJI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UcmgcnRlk5rIHJlGJVFhYITXl6GACJ58+t8FxAQ/zuyIssQzkRWrISvkCTP/hpWkY
	 BdaZfPeQ+YN2ao0L9Ai5H7V72IjxyPo33TxwAJeRsIV5JOi12DzbXvxSKvuxWGRu52
	 z/I7aMzYIV2neP5wMq6NOYepXeOw9WPJfg603yTrVm/J5PEK+8qpujMdOk9nw/pNd2
	 MQvlJBIFHE/ap728D6zrRe6fiBL8F6UdCJLsFeX9D2gk+VdCvygaHWToDQeCsYRgtn
	 fRqP+O2y+mVdiHbWaRSbpDLV+0Oop3p+jpPqU/nRI37+PuzOW1aSPFWK5cNNRbRxC/
	 mP1FBxi0GML3A==
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
	linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v4 1/8] riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
Date: Mon, 29 Apr 2024 08:13:10 +0800
Message-ID: <20240429001317.432-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172651_888166_79B24727 
X-CRM114-Status: UNSURE (   9.26  )
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

Add the 'cpus' label so that we can reference it in board dts files.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index 9a2e9583af88..7de0732b8eab 100644
--- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
@@ -13,7 +13,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 4a5708f7fcf7..18047195c600 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -15,7 +15,7 @@ / {
 	#address-cells = <2>;
 	#size-cells = <2>;
 
-	cpus {
+	cpus: cpus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
