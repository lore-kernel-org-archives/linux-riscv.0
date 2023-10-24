Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34C7C00A8F
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 08:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pqRdXBlgAi0RhAjuzXJVDr71g46JZxMm5+O5bp7/B2M=; b=xk+CSERudrjj63
	ZXFUHNxklhkikr5T9Ud7OtACJSbc1EGoY77BYDeu8Hq7H5KMWVmOW0W1bj2CQdzfk3R7YvMH7Fotu
	X2BSUgUOUQBQ4tahUqPC8x0IWTbp2pNwbiW8wd4PmtSGqnRj1erBhgDylTKDEvJ9tci69eBxqUmIJ
	NefjFmtXvLcniM83Cq0hsO4nxvgp9hmjPgWbMRJtO598eU2MeQaI6W52DzEbaz5KLAWhdU/UFDYrr
	W0QuPYzpyj4aT3DL59srCyXRtsI68CPW0bfgVdAhW0FujQc++Vzq6KXk3ALz7g/Vb2m2J3/Ax1tK9
	xoI2pelcbSMsjdE1J27A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCem-009Aui-0X;
	Tue, 24 Oct 2023 08:20:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvCej-009Au9-1m
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 08:20:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3DFA062A09;
	Tue, 24 Oct 2023 08:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EA44C433C8;
	Tue, 24 Oct 2023 08:20:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698135650;
	bh=ZGuyWnKr/kt2Unpu5aE4lFxwccQjdpGfUhSXgCB0iGQ=;
	h=From:To:Cc:Subject:Date:From;
	b=foQZtX4RsqPA1ecHtPBitGHsP5F/J44rftp9gPIBTCVIR7TT8jRUlObURWD/rgm1X
	 Au/Glm3NEO6FjtktwTAPK7/mAEMSeovOfjDghb4zDathzlb7uLQJBsRyy1rkwUqjVO
	 j/V+NMU129W2X3YLHelvhoWmBKGkfwwveFui0ldAIy7Y4PBDa2kbTwQXiAjfvaQSF9
	 exT50YevH8L1HrNL4NWVsUlhKH3A7wBA91EtGVvccTeH/aodA4ayYgCeIcifUAOV7o
	 8mM3qFn0Suypghfn+F8L2C/j/Cv3dh8ewencwUtozKYH8Ng0XsdsqLdnM5L9kaOVPW
	 18PDLl0QEf/WA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] riscv: dts: sophgo: remove address-cells from intc node
Date: Tue, 24 Oct 2023 09:20:35 +0100
Message-Id: <20231024-maternity-slang-fd3dcfb211c0@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1478; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=aQbYiTBBEQV72xMhaZU1xuHZtHqogNH4OaogNL5Blk4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnmdeYXOn9HB6V4Sdvv3hbt/vjRW5/gpatCGMI/W2saX 1Dwd/vfUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlURzEy9Oq/3bJwvbaT0VLd Lpufb5b5hQcu+vTQOMR+otiq49ENpYwMl7St7TZfNt92yPJuwZ/9L3Py73qJh9qt5Dy6NZtv1/M 6bgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_012053_636977_D2EBEC8B 
X-CRM114-Status: UNSURE (   9.10  )
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

From: Conor Dooley <conor.dooley@microchip.com>

A recent submission [1] from Rob has added additionalProperties: false
to the interrupt-controller child node of RISC-V cpus, highlighting that
the new cv1800b DT has been incorrectly using #address-cells.
It has no child nodes, so #address-cells is not needed. Remove it.

Link: https://patchwork.kernel.org/project/linux-riscv/patch/20230915201946.4184468-1-robh@kernel.org/ [1]
Fixes: c3dffa879cca ("riscv: dts: sophgo: add initial CV1800B SoC device tree")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Chao Wei <chao.wei@sophgo.com>
CC: Chen Wang <unicorn_wang@outlook.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
index df40e87ee063..aec6401a467b 100644
--- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
@@ -34,7 +34,6 @@ cpu0: cpu@0 {
 			cpu0_intc: interrupt-controller {
 				compatible = "riscv,cpu-intc";
 				interrupt-controller;
-				#address-cells = <0>;
 				#interrupt-cells = <1>;
 			};
 		};
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
