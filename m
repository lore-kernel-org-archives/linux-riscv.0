Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28A34C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Oct 2022 21:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFdCLmhV+ZDsE5lv6RayqT9yFi40Dbifi2ht2wkDjXU=; b=skz5pObn7LFEX1
	EF7Xt6CLuRlilKm/Ap1/BXpa3IgU3F/AKyi+0U4llgh6taar0VPy1NkT2ClCsnPkVzJ9sR3CJV/Su
	hhEc7i8cQdHPJbsr1HPKd0lRxjNczLX0QR2aXGPuDmmmbZNjUaElfouBWwXps2lveLFaELwbdLRiP
	aETGUy8Ks2ut+3E7dZo+mW/zuY27hUZx/14/XKJhllTPcPIXEvDwDKVS1fq24LBPBX8cKR0WeI4ok
	QzsMxclgSShlXrKiCS0uFuQDfEQW/PYiFpV2zSBIzZ0uoFcNXe1EwC4oP+aBIEIpVnaKtqmx202tQ
	sAKh3qFd6fDxq+5saqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXJ8-00Ew0U-Ni; Mon, 17 Oct 2022 21:05:58 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okXJ3-00Evy1-4E
	for linux-riscv@lists.infradead.org; Mon, 17 Oct 2022 21:05:56 +0000
Received: from localhost (unknown [188.24.131.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EDC66660232A;
	Mon, 17 Oct 2022 22:05:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666040750;
	bh=AaMf44NQLs0FWOmJ2NB4kVWHiWutQgTR2F4DGQiSUCA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wt9cEePWTnKmky3w2jqKP2BTP15iidh99hKmwyyPFVK4MBWhROmtRUonUkShnnSvS
	 I7LDAOyqHVRh/Alp29RBzgyBz36h8PyxAq3z59t9OYcl3nrStywKmxPyICSjr/Xj7R
	 hvchqd64Jsg6KnKaEE6hUxgSxCN9kUVCZILg/GhgaEsLQ0dUGFMoSmtdPKw41/uzT/
	 V24qWkgoQvT+NA+9g0p25EqFxZFf4ezyyWIWqsTcyKb/kcx4Ni0lkXb9QW3vjuGRWg
	 JGeINxoZXhO+vhMhUrnanb+y8iVIcFaIfszjElo7A3uchpO83jnen/Uc4BAIcWGNLA
	 NFnT/3tz4vHNw==
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel@collabora.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: riscv: starfive: Add StarFive VisionFive V1 board
Date: Tue, 18 Oct 2022 00:05:40 +0300
Message-Id: <20221017210542.979051-2-cristian.ciocaltea@collabora.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
References: <20221017210542.979051-1-cristian.ciocaltea@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_140553_402838_A7B5DB48 
X-CRM114-Status: UNSURE (   8.75  )
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

Document the compatibles for StarFive VisionFive V1 SBC [1].
The board is based on the StarFive JH7100 SoC.

[1] https://github.com/starfive-tech/VisionFive

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index 5b36243fd674..5d3fcee52d59 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -19,7 +19,9 @@ properties:
   compatible:
     oneOf:
       - items:
-          - const: beagle,beaglev-starlight-jh7100-r0
+          - enum:
+              - beagle,beaglev-starlight-jh7100-r0
+              - starfive,visionfive-v1
           - const: starfive,jh7100
 
 additionalProperties: true
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
