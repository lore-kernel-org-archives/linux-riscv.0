Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E4ACD343B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 May 2026 15:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cGS+j7DIJU0wb7LmEQUePhXJldtIuJoNhaaMnBZ/W9M=; b=A2xBPU+4vbvImy
	7UjVXX73jOj2ayv6YMgnJqjOfDrxTMVpZnumXsBlNH6ss6JMdiwpifWZMumkQDd2FgjDXp0ww9Lks
	LuNH14SKSZSHHqZ846hXkeA2bZ9WSWO0CbOVFXG8Za8T0VjwLeXhSusqNRLJY6tKIiLeID42hY/Ct
	E132o+CbUoSxeRVt/QUmkcvSpqCOwQAv8OImx5c463iKF5GIdYVaHLMWPW90Dw4lxpfyMxPNZ5i70
	Xd0izC5Z/L1iglBf3kvrU+Ute1kMcf91ppwNSo24moJrvBG/akgpEXGK3bnAU127FfU8WSf+N5ivR
	DiV6ODtsuJU1uqlj4hXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdkk-00000001De3-3c5i;
	Wed, 06 May 2026 15:01:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKdkj-00000001Ddm-1KXl
	for linux-riscv@lists.infradead.org;
	Wed, 06 May 2026 15:01:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C152E6013B;
	Wed,  6 May 2026 15:01:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 501CAC2BCB0;
	Wed,  6 May 2026 15:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778079692;
	bh=cFFUvqeRzdVAF53P+FY0tMvu3ZsPrzg7MR4phUeI/p8=;
	h=From:To:Cc:Subject:Date:From;
	b=ZepbDB8oiJxu928tS3KgTQu3ily3bzyQs5QIvr7IeEmg3DzBHnGdee2CIC9wji45b
	 Ugbyyc2nuMBoYeciYOU3kT0sRAmib/BL1i+ePjHHndAk4JO8G5EUHkrKlyujpgrNVF
	 xChJ0Y2rI8sQWajRKjAiXKxhKrkbJD+ftOIjfax8EQF/Xn+bt/4lnrU8bxDuZQo7jI
	 GyvlCUMA/h6XQjsRRdAda4ibviwsr85PsvCOxqETiDE6oKKvvevKHnNlVo8ebpTl+F
	 5GCQ7y8+jbgBpeOWni7eHwoTEwNmwMZHePeS+5vpuFg2LbQ61CS130lqpmH8IiLvfb
	 sSyy9W/bIw3iQ==
From: Conor Dooley <conor@kernel.org>
To: linux-i2c@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] dt-bindings: i2c: microchip,corei2c: permit resets
Date: Wed,  6 May 2026 16:00:46 +0100
Message-ID: <20260506-bronchial-kitten-e3697fb66ba7@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1604; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=otxeDgA2oPBHhrscDgp3nywgBv6J4dr1+5G8SaJTbE4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJm/w+d+/a952ywrfHlcsNLjk5smn2ypl1BkfCyWIm+kW aB04d3ujlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzkmB0jw3nRC+rr/p4Lk1Rg Pm1ieOzVlxO1brslnu7/XGqvasJvOp2RYaGSR+m6tjNTHt2Z++kj96Vaq9LDLPYXXZcbyK11KNl 9gBkA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

Both CoreI2C and the hardened versions of it on mpfs and pic64gx have a
reset pin. For the former, usually this is wired to a common fabric
reset not managed by software and for the latter two the platform
firmware takes them out of reset on first-party boards (or those using
modified versions of the vendor firmware), but not all boards may take
this approach. Permit providing a reset in devicetree for Linux, or
other devicetree-consuming software, to use.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Andi Shyti <andi.shyti@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-i2c@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
index 6ff58b64d4962..bd63c70aac6bc 100644
--- a/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
+++ b/Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -37,6 +37,9 @@ properties:
       modes are supported, possible values are 100000 and 400000.
     enum: [100000, 400000]
 
+  resets:
+    maxItems: 1
+
 required:
   - compatible
   - reg
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
