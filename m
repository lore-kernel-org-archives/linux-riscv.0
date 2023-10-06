Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36B35E81DEC
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 12:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ljzQrXidR6g44xXONR/+/GttCMA8pyHywFO2bM5jwFE=; b=LgYRRGOxR3VFCp
	ui4D7zo5awr4/K+DtUflO54DiE03duERrEABwgjLaAYv/ewHZSs+li6Ii0/b1eyQTKX6ISSHS+xJi
	iKzKoNl70JftFMeZ0Slh2LvLGxp2nUpq922xKYCRJDD6jexj2ZleImnmoR/OwToCY4OMcmUbxL5sx
	wJU9UxCCc8Y+2WuLxGENbqWKHiRd51/lHRwpT0D0mgFoPM75R0QrKcUcm+7hAOKS6Wc1NUIpogBh1
	O/wIYCqwKWVNJZXhMjBMYzKUDWY7j1dDz6mNCvnBerxd6imoRSIamfj29pactliYVTAX4w7vIqW+1
	P/ASp72P09n9SvD4br7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvD-005m4U-1W;
	Fri, 06 Oct 2023 12:27:11 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qojvA-005m32-2J
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 12:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 37EFAB82909;
	Fri,  6 Oct 2023 12:27:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A0ECC4166B;
	Fri,  6 Oct 2023 12:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696595226;
	bh=vK2e3eQyu+2RwwEcd/fM4Ck3i9PQ2DpagYXnMZgMMks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dxk2dDWLVPcQeveUPSAdTFi42lTUudLuJqloZTONbgWb7SQLlQqEhAEuzFHDZsEVm
	 /vjayuxdfMKJkf/QCedhgEPmRyhcf2bfjpEg1/l1OmVOKtvdP1QjA+havuZd0LDMwJ
	 iFHK+7KKBsg0jM7Pv5rX5ZQTuckPPP3HlJlkX5U0lB0kIbAg7tn0pO2Sm7ABBMxIOR
	 NyT+1hItlAyHRR9+jg6rKmaRip1cUVw9s8RZkLWl1Yl2G6+HpdBl+poX7UDEE24Dvq
	 JYHFIv1aWKjR0+hUy/3Jr1WFvmPr6q9qoQtAPmoA84k5OSor4ai5CXKnRkIudgXNe3
	 T4BWv7tVVaMhg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v2 3/5] dt-bindings: riscv: Add Milk-V Duo board compatibles
Date: Fri,  6 Oct 2023 20:14:47 +0800
Message-Id: <20231006121449.721-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231006121449.721-1-jszhang@kernel.org>
References: <20231006121449.721-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_052708_890847_40C16D98 
X-CRM114-Status: UNSURE (   8.11  )
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

Document the compatible strings for the Milk-V Duo board[1] which uses
the SOPHGO CV1800B SoC[2].

Link: https://milkv.io/duo [1]
Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Chen Wang <unicorn_wang@outlook.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 8adb5f39ca53..86748c5390be 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -18,6 +18,10 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - milkv,duo
+          - const: sophgo,cv1800b
       - items:
           - enum:
               - milkv,pioneer
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
