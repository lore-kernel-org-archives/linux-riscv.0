Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC648C61DB4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Aug 2026 06:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RS80kherPQxYcbGaV6C2UHMFFQh/CeURqQVJVj/ifHE=; b=C6NHeFfTVGnSXr
	93hHCLzgxOXulobMLTw//QVwYUho3Bew7khGUi+CpjHO/MXdnIMM+ZJvqCkVBF1OmR0kIti5D08T8
	889HRS2N1LnPczMu+Z6GIKqr6Hjd/3PL83a0qIAEJ77+1Jl2GpNDDs98EzNN1qLHzbi/5wkVm48S5
	gELUAyWO3qjRlaFTOtGUXLTvYoVaNfuUpG361ftOakxMs9qIxqtRf41JH14QbH4zhoanS7WMf8LiS
	UA7sexurgrvfDCMsQRQiBZYQzbf/kVUVgb48DL2PCLgGsGDKbf50j9b/flqYQwm2Uw7Ivz96EsxPW
	DtYQS1tq4Jjj1pvFi0fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxl-0000000Fxh1-1c7u;
	Mon, 24 Aug 2026 06:15:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyNxh-0000000FxeV-0CZv
	for linux-riscv@lists.infradead.org;
	Mon, 24 Aug 2026 06:15:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 495B944FF5;
	Mon, 24 Aug 2026 06:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1496FC32782;
	Mon, 24 Aug 2026 06:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787552111;
	bh=/tORglKOn/6hGNCzOPRziWVwHttzvbuXlVQzocvD4VY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=so7BWFEmHR5F2wte9vg5VuHjetEVyy9NRI/bG6xxy9dOG6Bfy7KOlyNy6lO1pHU0+
	 +ZUSG92wSBwa+SUjgxmsgA8Q79S0LXUFF3RxWLcNOUtGovIhRO13YoXTnCwQEmVUCp
	 R/LpDLvJW47shUxxYtcV8YnhgcpLYfV5c14LQlUH96Bx5ZmSzPHpOwyP0EQoINu/1k
	 RpImfsYR7y5kdQt/4D2WSw50DVoclsaYycpLf2JU0KJfpsNEW9KNgXVV8yKB0/2sa0
	 PaUBmDAgpM4CTT9Na5dZj4B34zq4A7hvI7zP0RhNyBIdeaIdAT68tDovfkdQmjEsns
	 M49TGLyC8/Pkg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1B8FC5DF9D;
	Mon, 24 Aug 2026 06:15:10 +0000 (UTC)
From: Jia Wang via B4 Relay <devnull+wangjia.ultrarisc.com@kernel.org>
Date: Mon, 24 Aug 2026 13:54:20 +0800
Subject: [PATCH 07/12] dt-bindings: i2c: dw: Add compatible for UltraRISC
 DP1000 SoC
MIME-Version: 1.0
Message-Id: <20260824-ultrarisc-dts-v1-7-61ab7aebe9e5@ultrarisc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787552108; l=846;
 i=wangjia@ultrarisc.com; s=20260515; h=from:subject:message-id;
 bh=a3FLG1v/opm8P6Mx7tFBUWeLRZtmVFCN4Uxnx7ELy+8=;
 b=FZb78z8T9rITx8H9711DLMJwoTpitGFde0UxVr48CTWjgXqPmZIps0nVG5x8Ive0NSxtUTIag
 x3P+jfsIl4CDCgsd45dmaaxozFkO1pbWp2oQT4QQIDnp4SGSBiQMxvT
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

Add the SoC-specific compatible string and use the generic one as fallback
for the UltraRISC DP1000 I2C controller.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
 Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
index 467bdcbb8538..eee21ca8d7ed 100644
--- a/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/snps,designware-i2c.yaml
@@ -44,6 +44,7 @@ properties:
               - mscc,ocelot-i2c
               - sophgo,sg2044-i2c
               - thead,th1520-i2c
+              - ultrarisc,dp1000-i2c
           - const: snps,designware-i2c
 
   reg:

-- 
2.34.1



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
