Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E14E77372
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 12:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+zQDdRmsQ5F27YAXc17ZzIcIB0h5BkrPaf0U/Hvm0BY=; b=PUPvR9WyBIH7kJ
	q5+H59smA52CxRG4wIXHGtD8g/Clrl7TmwGXwQ0hyjLft0a+pUSMAdXLZGhP6ewJjvtgUCRm4nEZP
	8F3IULhr6u1pS5Ix/hFYe0I7E6xWD48W7QXPWmVkK23ExDjzBRLMZINe/xc/8Xx+/wsTpowsrliOr
	vRcWZ4V751hVHFDRElJuM9RZYbFOMDSIdAZJe2K6W5N7R1wADMWx/62SvRrG/0QufwZGah5z3zpJi
	j79/5G3AFdZV2/YF8ZXMjmT2fQo3O/f2+QdzDtnOU3nNGZ2UwqgKbBBlNbO3FROUa7ZjJE5A52m42
	Ym0QLW1gOTp+osGFiBaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZRw-009XLT-2I;
	Sat, 30 Sep 2023 12:52:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmZRt-009XKU-1h
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 12:51:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0ED9B60B1A;
	Sat, 30 Sep 2023 12:51:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A34C433CC;
	Sat, 30 Sep 2023 12:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696078316;
	bh=IOW8Qy8WgXjW/pu+Hsiy+A9zCuQxJj+mnIrMdCsos4M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=N7P+Uc3HY8yOIulo2M6D0Z/azUsN0Gk5ZdZxddChXOOQzRDWJKD4VBDIk4K40wZ4m
	 Ic6VD7noeijn8iAKvm2P7DTmwoxMBpc1M2VTLb9tcH9dMPHPsiSoJEVHKgFbJI42dq
	 uy/gCJ5NytKS1DopBhSI2mK+0++GlS/dg/lULaqsk8V799Zpu3Eg3aVsBfIQO4GHBj
	 bw9LzOyKHlE5TKjV/ShB3g+YwlYurhL2h+GRCbKaUSk8USPDOVb9djIdsA5dVdgWAC
	 pOk2q/wX+IFzKk+2bkdTBYxEkS5K5xZfdWPBj7YixIi9C0kSzjTJO2sDboG12Jb+PX
	 tnuscWhFhFn3w==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Inochi Amaoto <inochiama@outlook.com>,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com
Subject: [PATCH 1/5] dt-bindings: interrupt-controller: Add SOPHGO CV1800B plic
Date: Sat, 30 Sep 2023 20:39:33 +0800
Message-Id: <20230930123937.1551-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230930123937.1551-1-jszhang@kernel.org>
References: <20230930123937.1551-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_055157_607604_DFBE6CE1 
X-CRM114-Status: UNSURE (   7.86  )
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

Add compatible string for SOPHGO CV1800B plic.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 16f9c4760c0f..5c4539881a22 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - sophgo,cv1800-plic
               - sophgo,sg2042-plic
               - thead,th1520-plic
           - const: thead,c900-plic
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
