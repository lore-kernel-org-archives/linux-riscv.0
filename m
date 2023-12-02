Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 937C4C10DC1
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 15:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jj8ZYMQ0CbJEX/JATy+JcmdSbjsi7k3ECbUGufFvgT4=; b=Bif7vTh35a7AF2
	KUjVZw5eRqHS6ga6B3338p+Fp0prB2/iDfRQ3meWLN7WeC9CnReypXcI9kH4oQh7JkLtfhW/7+MtI
	/D2IVuDrkxMEEBf86eeM5p2NCCSw5ejTfoNFdqyhEIQb8HMZxrZE3PLs5g/b9Ag5tShqmb/Gv5dnE
	liOj9/g6T8/jTUE8Dc0x0ckKMcpHO6aK2PjeX6WmJ3WHuMaD43bnFcTcEKlFNadAZieBAHlNuhw2P
	fVCpw+TUhJvGDkwebflxQYHTUCTxWsliCcLv++Uij1dLI8IWiUx4V+7pKrkP+hIkCohOKEiFgV715
	wS7WlyoczYrTwQpfkr7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9SCO-00FrXf-2a;
	Sat, 02 Dec 2023 15:46:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9SCL-00FrUu-0o
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 15:46:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C5BE60A72;
	Sat,  2 Dec 2023 15:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7352BC433C9;
	Sat,  2 Dec 2023 15:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701531983;
	bh=Oh3T5Mw/d1ShgN3QuPdpYAcWUqUHtc0/ANZQUJzPc18=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TLiU/mcfZNFrp0cP5llA155Zvk4sGKsx4jDJAFeHEEaiprDRkEiqqQgDehbKsAI38
	 ftZQMuo6bU/DAV+KjIz0iZaGFodSttkM7+1KWrfOTGdyC91RoT9ek3VTbz5jFO2fK+
	 NC0Py2cFHr3GI6f+hhBgk5Gzo0jxjq/oUaRUsZ70b29OeixT4bLjgG9g6rRZTNoSx/
	 UJmGSeFcVnuFjqvQaetwH3+e018QBBUaaehn/vNQlAFZIvm2q9r8ip6cjxHmosMhif
	 zqjOyZAHxVQhqVUV30oJOUzWO2Zvc9MIpdjNY+BVovIzvMX4jBcqhqGH0Bl5sv06Cl
	 qRJ7JE9i4Hn/g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 1/3] riscv: dts: starfive: add 'cpus' label to jh7110 and jh7100 soc dtsi
Date: Sat,  2 Dec 2023 23:33:51 +0800
Message-Id: <20231202153353.635-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231202153353.635-1-jszhang@kernel.org>
References: <20231202153353.635-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_074629_333686_C648A985 
X-CRM114-Status: UNSURE (   9.79  )
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
index e68cafe7545f..e6959f2d4f1e 100644
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
