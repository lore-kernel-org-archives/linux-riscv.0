Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AF1C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Oct 2022 22:18:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fjnY9Pc4MbaNDHqrGblfnnAZAjiOBijAM3JnE3epHPk=; b=ngYH46Wme4e0mM
	PU7270nxQyT/DUk+bTnzsxlHccoTdpIy6GbrGOeLO5n1Sh7I9/ZpmY6fl7BnghTsnz3QGkBUa0iP1
	rxBl5OCtq69S5X+T3LdGIMQGOD241daUV305BhZTHRrP6oa8NWPFNWBtm1cWs9LvqgpO5dAcn7z8S
	lbXZB1kyt7iSiAIbJlgYD/U9uZRZjGtLHuOAFgza4EavP/CRZm0Zl/IKfh0EWvv10b9fnwKT1FFfa
	TjphIT+ypKsrYb/Wp4kASGymBRMCagtNr0aZDe78xxtRCXG9A2I+a7cqmCJt90hTdfAF6U7IXxCmY
	uEhSAtUKLnVei2l75VJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi160-002Qqa-LZ; Mon, 10 Oct 2022 22:18:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oi15v-002Qnb-Ad
	for linux-riscv@lists.infradead.org; Mon, 10 Oct 2022 22:17:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 49175B80EBB;
	Mon, 10 Oct 2022 22:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A027C433C1;
	Mon, 10 Oct 2022 22:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665440269;
	bh=7LGJPTe7/kF8u7IBR97wJZM3B9B5cah+/d132gPvC0g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uYXmRqqTVgMATfjPmcT9SAsqNl7DMMfDUEdqHMfUSqPj+4Lpw48JKLAkGqT/S8T5S
	 HyG5kJRpDStib9rISZfim9apgXqV0GJITfS+GvnDU92Bi4AV6AHz80jPbNz45rR4FJ
	 2oXYJg6ja+p8qatoC8Zp7I8sUjcJn7pRPQLQwrns0StJV8FJWhpEzYRn0aiqlkTFIB
	 49hsj0CuCcINTXKQaBxPA6nnI/bqBKxq9NU6KZ0IYH5kqXcfiR5fHVNiVsZLsWTb3b
	 EeWjc0JyySqPk7zZp7Ye+W5lXy1n/W6iG+tsG44uIFiVPEy+6XwrMLEb0yKEgPAcp8
	 9mkBvGxKvVgDg==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [GIT PULL 2/2] dt-bindings: riscv: update microchip.yaml's maintainership
Date: Mon, 10 Oct 2022 23:17:05 +0100
Message-Id: <20221010221704.2161221-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010221704.2161221-1-conor@kernel.org>
References: <20221010221704.2161221-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221010_151755_537900_62F6A583 
X-CRM114-Status: GOOD (  11.93  )
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

Daire and I are the platform maintainers for Microchip's RISC-V
FPGAs. Update the maintainers in microchip.yaml to reflect this and
explicitly add the binding to the SoC's MAINTAINERS entry.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 4 ++--
 MAINTAINERS                                            | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 1aa7336a9672..9faf8447332b 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -7,8 +7,8 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: Microchip PolarFire SoC-based boards device tree bindings
 
 maintainers:
-  - Cyril Jean <Cyril.Jean@microchip.com>
-  - Lewis Hanly <lewis.hanly@microchip.com>
+  - Conor Dooley <conor.dooley@microchip.com>
+  - Daire McNamara <daire.mcnamara@microchip.com>
 
 description:
   Microchip PolarFire SoC-based boards
diff --git a/MAINTAINERS b/MAINTAINERS
index 94cf47ea5f80..b3415857a812 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17651,6 +17651,7 @@ F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
 F:	Documentation/devicetree/bindings/mailbox/microchip,mpfs-mailbox.yaml
 F:	Documentation/devicetree/bindings/net/can/microchip,mpfs-can.yaml
 F:	Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
+F:	Documentation/devicetree/bindings/riscv/microchip.yaml
 F:	Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
 F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
