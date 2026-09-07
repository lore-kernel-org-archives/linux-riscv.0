Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32DCCC79FAD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 09:58:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KJob4bOUWVatgRp35yXf+H+kARMo/cVJICCgwRhqc0=; b=ktyec3CrSl4ejg
	vzgFTHYSA63DNg/YBOPwELayB0iS2n1GXgjnHr6zW2bM/jsyazaXjetzairglphja9//NaHEVgltg
	JVmp3jQVD7+nOgSWbSuOid0qVmwOuMt2Vj+a2MgGAPXiFC5ikFNSEETxeEroxFMzDQM57vPy7cb0X
	wlz1+YwWiOPfJajV+9QhzzsfWW8uC1gOuRej7fhXDV4Ee4dwkpewKeJrSe6RyXQbcQYDwkTfjlp9K
	B533pIvZh0uyCvyIJHdM6uo9RVUkTH0/3APRRJ676ndjfHp5qwCse9vdzfc4Zj59bU9r/I3PtO8TY
	fflx62Bsl5Dz+P7HbR3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7S-00000006PTc-0lV3;
	Mon, 07 Sep 2026 09:58:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3W7P-00000006PSR-0UrX
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 09:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 739EC4482C;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B371C2BD05;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788775106;
	bh=osJ1peGPbLMwCs9cQfspS5sCiI02TKIU/UTXsG1stLI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=IBv5EzfRtJ2tPJE+q6J/2aqN18z3MvgJJonLv09RekmAYzXwLVsMrQ44QWKwWfyE7
	 fJNmBFwGG9fdasbThw0Bwlj+Y7Hl0uY9M047IGR5mozh02SqyqFwz+4o44s09ljgdq
	 U3PUszsV6ltO65Z4Pt/N2fmp9FsBBjMGaeIYvvRpvkboSzv83rZi6MJFBbJI5Tt4NR
	 nLMXZsVAJPGULlAO2UUcYZYZUggRoKQiBlsBSJAIxhKyGBIb/3VfN50zUZxoCeunCf
	 cqAhSLTNzTBv30xKtNORW3i/pJ+C6eCvsNIeToOzV6oMmoH0YHKZnXKaswziUH8GEh
	 Snwt0FNII1x4Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03ECDC79FA7;
	Mon,  7 Sep 2026 09:58:26 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 07 Sep 2026 17:54:43 +0800
Subject: [PATCH v2 04/10] dt-bindings: timer: Add UltraRISC DP1000 CLINT
MIME-Version: 1.0
Message-Id: <20260907-ultrarisc-dts-v2-4-5eb4c97477c5@ultrarisc.com>
References: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
In-Reply-To: <20260907-ultrarisc-dts-v2-0-5eb4c97477c5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Jia Wang <wangjia@ultrarisc.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, dmaengine@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788775103; l=964;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=H5nCeqGhgsZIHGD5OQKUEdhmWR2MLVPLwQY1q4JBFrk=;
 b=qZtQO6xJbyoxFeLqeiG+vgTPNhUyPEuYbIwJnEzAzbJcXnokLi+XQS2BFd26iySduD/N/wyv/
 yYBn2YXqHC6Br7I/x7XTpSZr6fcB0ViDdeu7/ewOh278fFgD6mTrBWB
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=wGVm18siRScehKOkOz0WKxgxDy7IezHEszhnN4/TUCY=
X-Endpoint-Received: by B4 Relay for wangjia@ultrarisc.com/20260515 with
 auth_id=779
X-Original-From: Jia Wang <wangjia@ultrarisc.com>
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
Reply-To: wangjia@ultrarisc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Jia Wang <wangjia@ultrarisc.com>

Add compatible string for UltraRISC DP1000 CLINT.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/timer/sifive,clint.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 3673836e14de..878f267d089b 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -40,6 +40,7 @@ properties:
               - starfive,jh8100-clint   # StarFive JH8100
               - starfive,jhb100-clint   # StarFive JHB100
               - tenstorrent,blackhole-clint # Tenstorrent Blackhole
+              - ultrarisc,dp1000-clint  # UltraRISC DP1000
           - const: sifive,clint0        # SiFive CLINT v0 IP block
       - items:
           - {}

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
