Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3ABCDC61CE4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgac3riY89X40jO+C/MwCCcKSwwMdPn5P75VYz6TWF0=; b=Kkj4Ixmkk9147X
	j16KaIwjAu7xSh67s83Gf1XuVkOJKR0Cl0UGTJiuzTdFGrjtz3AzuPBBmmrOG4rFVojoSRirNNWjP
	4VAPknaYGTInvwV+WS2/zNZS9Xksv+tuFh/CVxCTVQtOs4Q3h79CUaAzr4DLFr0phokVzyY1fukuF
	Vva+QBMk10QYoJBRcRV16e8/WSZYKrxkSbCevsNXtE7U48Gy9fUgQO1HYvWKnhQQhUiE0lJtWiJni
	nrhnCp26oOdvty0ps/XHo0pHqj9gVUfnYX0oJ1i8h5q+fFaMbRxxBZLq/mWjMi+YLdNqLfaq1+b/t
	x9RTtJ5LJ0Vqz69GrM4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxk-0000000Fxge-2nKv;
	Mon, 24 Aug 2026 06:15:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxg-0000000FxeO-0Ner
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 06:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA7F7600CB;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 825D3C19425;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787552110;
	bh=xoVFtZfwFUn8ctUKrgx5JLL2pQj2N3ofLqH+aau927U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=USbvkkCBJQiP6h9hCXLE24Hm0lzbj/M90JFx4RYxJ+oRhBsAinbYtALBuLtytfCqR
	 6pDIVJd3ETdyND+bOdgNsLfWPEd4nMErxBFTrFKZpRqSCIsOUUxbyJ4ONiKk/Go5qw
	 9bRlADfd+Mi9eGTyng7aHvRUwJaT1rcYXXYv2I0iUzbQzcI75X76+yP+yrfX0kuFNp
	 ElFvZNIxksDjxWsUERNR5AjRMggUNIQFZ5BFFXmJdDfDhddUzFvMVZcyptxMgz0eut
	 wUxITfLuE2SsaQbezaRWwSofYaHihEWmmmPuw+hBba++UKzCbB8HKVO/OPpDIi3686
	 2QPkX/KR1vMig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FDF2C5DF8C;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 24 Aug 2026 13:54:14 +0800
Subject: [PATCH 01/12] dt-bindings: riscv: cpus: Fix yamllint style issues
MIME-Version: 1.0
Message-Id: <20260824-ultrarisc-dts-v1-1-61ab7aebe9e5@ultrarisc.com>
References: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
In-Reply-To: <20260824-ultrarisc-dts-v1-0-61ab7aebe9e5@ultrarisc.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Mark Brown <broonie@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-i2c@vger.kernel.org, netdev@vger.kernel.org, 
 dmaengine@vger.kernel.org, Jia Wang <wangjia@ultrarisc.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787552108; l=1425;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=Q697DFC7ysJh9zCppPk9O+0gvj0yAIUmzUczo/IHMyc=;
 b=or1xxNfTcnovPzCMzApsOwWbacOhxI/q+gccq7qhyvzRWq2X2lx0MS3b8g6Wxi5KIU0117ZLQ
 IUn00ulNlwjCPLJm5EosC9d3iWABnhGYcGZ3B6wMnXld66Os6azzRvh
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

Wrap an overlong description line and normalize the inline dependency
lists to satisfy yamllint.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 5feeb2203050..0da219ae6769 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -117,8 +117,8 @@ properties:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:
       VLEN/8, the vector register length in bytes. This property is required on
-      thead systems where the vector register length is not identical on all harts, or
-      the vlenb CSR is not available.
+      thead systems where the vector register length is not identical on all
+      harts, or the vlenb CSR is not available.
 
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
@@ -151,8 +151,8 @@ anyOf:
       - riscv,isa-base
 
 dependencies:
-  riscv,isa-base: [ "riscv,isa-extensions" ]
-  riscv,isa-extensions: [ "riscv,isa-base" ]
+  riscv,isa-base: ["riscv,isa-extensions"]
+  riscv,isa-extensions: ["riscv,isa-base"]
 
 required:
   - interrupt-controller

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
