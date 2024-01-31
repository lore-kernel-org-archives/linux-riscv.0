Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB71C47DDF
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Jan 2024 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0R4ryLDuLYyz418CfManBiguRSDqScsbZF4Gy+ilXwM=; b=LjZD01hkED/8bb
	dTMK/3c5YcvYJkaLRsHJkL8YMGTdUYKbaSPXO39Jk6+t4WKLGJGvCYmKZRiSylVmicNyMztVNNzn0
	s9dnErkpoYZdWP1b9/po5NpxXLagr76f923j+/Hh/tU05CEUfBWy7/bZDu+kkDiXS9CkaMOUPuYAt
	xMKLuyfQo66R7ws17/HxJ1L0L7XO8k7W1VXgbtenhqha0okIRQ8zjcHjycDY5ToHiTRNMfqplzdHb
	kdPQkAp0KHGq2Sb1lj5bm9rA/TOmcwednAQgxSDUv9NzwHlFssfwkwrkbDO0sUQOf4MA687zk0ifj
	c00b9yfjNvwGELaIaWuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnu-00000003esT-3JIc;
	Wed, 31 Jan 2024 13:39:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVAnq-00000003epZ-1EWu
	for linux-riscv@lists.infradead.org;
	Wed, 31 Jan 2024 13:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D3C1A6177D;
	Wed, 31 Jan 2024 13:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78AAAC43399;
	Wed, 31 Jan 2024 13:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706708337;
	bh=4YaSmKc2XhAaRmO9Ia1dq+Ad5ogssm1YjCUlZHMFidw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O9lWHjWBEh5lZC5/FLgavIirpXAEYvJWVooFyf41aWm901/r3fyHaK6P3gSOXrN7e
	 cahqDWswIWtoK8TbVuneFC7wwrnrV7KqcWOVVfo7z4SASPMowTIZwdMLeoVWQNoPg2
	 WHO8ZGSbGgwyOJNdJlXzDfnXEWmnZ7Shl+hQ7eUwIYkWL7oOESZBfsz3DK9On0ljPn
	 PP4V1r0uAh8dA1m5qmXWSjtgzX49EYmFpE+4Qt87eRY+50bFerqXBWnIU3hy39iU2q
	 2i2eXDdAM9yKtB3JGZAl9/UTCLPk1bgqTmfLzY/jlghqGzRc96ecUhpwRjovgfzpUb
	 Tv+sEyPfjuG2w==
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
Subject: [PATCH v3 2/6] dt-bindings: riscv: starfive: add Milkv Mars board
Date: Wed, 31 Jan 2024 21:25:56 +0800
Message-ID: <20240131132600.4067-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240131132600.4067-1-jszhang@kernel.org>
References: <20240131132600.4067-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_053858_390352_2115A671 
X-CRM114-Status: UNSURE (   7.35  )
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

Add device tree bindings for the Milkv Mars board which is
equipped with StarFive JH7110 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index cc4d92f0a1bf..b672f8521949 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - milkv,mars
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
