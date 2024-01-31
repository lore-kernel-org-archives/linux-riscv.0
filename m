Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BBD4C47258
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n324553XL8KawcTd+jtxCJcwOBtsEgCpOVkVfKPjDdk=; b=GqfMX3ZWkzW1ps
	a9KpM1QEEkFbNdOzuM+8/cXL1uhMQzP0PMHvUeVKuOYuYMtPOyCmbbLd1f2lpvztL7EBiGpV5wqnp
	yZsS+8xC4clXiAHR0gR9+o0hcf/g+ejnR2vdF+hLwMyUI23GurBrbuzq7hMOTCconcaydaANrULMj
	G2+3wJqWLE8uADAU/u2PkBd0oSUq8kp298AF/6wzhqGxRRhksz6AyDkdf7A5kicHr1wh6fyE+JXKn
	kqrce7oe8aC2lVagaJd73LntslG3/1UP0Kl/+0bQEaBRIWztkckssMRU89o4yXj+q4rI5mD8rGc6k
	F8j+Gp28OqG35H2roJRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAny-00000003evY-3YjG;
	Wed, 31 Jan 2024 13:39:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnt-00000003erD-1MHH
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:39:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CBAFB61781;
	Wed, 31 Jan 2024 13:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18641C43399;
	Wed, 31 Jan 2024 13:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706708340;
	bh=nT7t1XLpap1ul5rw857k0oXQhboz5a3rxYW5uzDwgG4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fwUo7kYA7TwG/OOhXVdApV3nqAOmy00VRVZJlU4sJyC9nDmDJH6pgEi24h2pIrXX7
	 XBH0RY5F1vseRIOicRyw5LFZzVaBZS9gewLc3rWYBhJza19ZUtCHQ3SXVPwoH5Xf2N
	 +7uXsD4Zx5nhx3GrNIJmT43iuM1ESY3dCTdrfoeR/ILjwrWoiiyqiZZ+pJme4ifV12
	 KGbGx5yZIWOLWF2xwxLSV9eejVi3VXMjBzuUb+F6jk7COUVTHiO8Ud99eUsS5sbw9V
	 esxOLPVJ1cdof1ugoCp6G1N+yUhFPRlhp2+OjUmb11+MlOxGBoAbhGhQersYrGD4uG
	 WLy62blC7XgAw==
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
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 3/6] riscv: dts: starfive: visionfive 2: update sound and codec dt node name
Date: Wed, 31 Jan 2024 21:25:57 +0800
Message-ID: <20240131132600.4067-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131132600.4067-1-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053901_452059_1975F276 
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

Use "audio-codec" as the codec dt node name, and "sound" as the simple
audio card dt name.

Suggested-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index b89e9791efa7..11db93966dd6 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -41,12 +41,12 @@ gpio-restart {
 		priority = <224>;
 	};
 
-	pwmdac_codec: pwmdac-codec {
+	pwmdac_codec: audio-codec {
 		compatible = "linux,spdif-dit";
 		#sound-dai-cells = <0>;
 	};
 
-	sound-pwmdac {
+	sound {
 		compatible = "simple-audio-card";
 		simple-audio-card,name = "StarFive-PWMDAC-Sound-Card";
 		#address-cells = <1>;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
