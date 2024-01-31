Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A057C47DB3
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cY6El/CPJPDHncI9Xn9M0M/cJsq53qeMazMM3S8fSMY=; b=MsN69yH3adknAz
	piJfuDseOpb0AMRQYo88pNGU2VSQYq0Pa9AFQ1Djn7FyOLu2n0erh/Dys9dsUdY41Tlpb44N8eD74
	bgnCy9htpjMrEgG3JEYMRckYkJEJWMkP0Wg7XBpy2HnBw1K4LYZruWRYS8VgrpZG5VFGtaVpRmZd3
	hjezKmadEP1vFdTATtw37DHlgamJC18Oq0TnoTkGIXE1/uknMQ1LDEG9A4deT44/m6+O8aECmyOYu
	BfdOLJeeoKlaub72Dsd3xC+8TlRzrhecnGDnsA41bN3TtjavRXxmCAuRuuTzZzWTMvM3kkrWW2vvE
	GmtHNMhkDebMdS/g+1ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnr-00000003eqd-3vnx;
	Wed, 31 Jan 2024 13:38:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnn-00000003eoc-2sIY
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:38:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FF3861782;
	Wed, 31 Jan 2024 13:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE6BC433F1;
	Wed, 31 Jan 2024 13:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706708335;
	bh=cveEm9XYzqaufx9fWhL/pSd3M6JBh+uL9vWXxxLn510=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MQO2HbYn8TlZaNSKK4VljVZMWR1KBBRWjUcgtw+kXim93UgjIQV2U+4gvoa/XJ+Go
	 /fwRSuVJ4QvbVjVuIWxWr4sMCzqZ1Nv+5HlYMAqF2Jwq6LIUrE7tX3cs9XofB0QFwa
	 kZBVldQZU2ZIao0vzTfcLZ6fbFleNYxKUaNg/d8z+MG5Eu4Dc7UZ3O02FPUCJtZ9ye
	 /6F/ohRadWj5PR+0LXtiibDE6INNH5LltmYu2Ww3fkYhd7M3PJL9VMIuIFpPLFSQBu
	 ixf8kRIZZksXqCwFLnbgV5lynjNRpZjJgDvtv1Ybw09Q9nX9DJJEgp/fFVEptl7VB+
	 gci2Zl31Ecrcw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/6] riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
Date: Wed, 31 Jan 2024 21:25:55 +0800
Message-ID: <20240131132600.4067-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131132600.4067-1-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053855_811807_37F59038 
X-CRM114-Status: UNSURE (   9.74  )
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
---
 arch/riscv/boot/dts/starfive/jh7100.dtsi | 2 +-
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/dts/starfive/jh7100.dtsi
index c216aaecac53..b2d36685db5b 100644
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
index 45213cdf50dc..5a6ff90685e5 100644
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
