Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7305C7EE43
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 17:25:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUHH8wzd9PxRvRznsbfsm713ey1AAYxgczn3koJHq3g=; b=ffHTJaj94c224k
	FkBlSbhY2QuSFFk+CZ5c0WbDTcAox3vtMGS/KEDYfL/2m9utZnXCWZHNvybkLE3HWP9Z7yVbBTj0P
	oEkdVaIivelawnAZkElBw/NBZvguIEVStkyNbeTcmRoJQdRQeRS/gTtUziwMByX7rNLstByCkxPFQ
	lmEy5Ep4Nhp14uc2TV7dAOmH37gudN9CIQc6BhZe3mTmZ9v9BowVGU2sYSPD+nDMD6s/zh8tDyBaN
	4cfHKUbCMMte1pDr8htjkHTvfL6ytMoYnNyl8FBYzBIjnbRJp/sZDSYz7SAoLeqiMygKyG8vn3UzM
	5j8nkMx33Y06BaQ81RwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q82L0-00Gerr-2T;
	Sat, 10 Jun 2023 17:25:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q82Kw-00Geq9-1m
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jun 2023 17:25:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40156611A5;
	Sat, 10 Jun 2023 17:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C24D4C4339E;
	Sat, 10 Jun 2023 17:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686417911;
	bh=Df043vgm6CnnvUWCZd+vj+oFrnFuv7Ap9nxevuDGXJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PlVvMTAl5OuWwgFYGYz8gC/52wk2NdF46iA7rXrSw9J6FGDTUOoqWDUulA06KN4ie
	 DBVNYIUhuHfMiw1RUMEDKvlAao6ffwpWJF9c90djU5RfdgtdIXW8LXtmWR5vkZkraJ
	 vkT36+XRx/LTsFGHhSk55UTwY77QW0DPQAJrQwbn8EAib7lBp+2wdy7YCFKvYcEN3U
	 KHyUtZxpPzitSXKWK7zA9DnJnIfbdpYiez+Mn+wFOgZSDWS2VzElB4A8WD2aWYcBAR
	 hiYyZ06d0eFZMjHT8TvhHHSJILZsX5S32cnM+/xCywxyAgXzLNG/PLKFeEntYnKL2S
	 6TC8smY0KwwCA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: riscv: cpus: add a ref the common cpu schema
Date: Sat, 10 Jun 2023 18:24:48 +0100
Message-Id: <20230610-pug-spending-d08d12d82e77@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610-snaking-version-81ae5abb7573@spud>
References: <20230610-snaking-version-81ae5abb7573@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xnf8UGz7+fdKaOoNLsbw78HDVnw230rwRyuBbYLfg8w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCktGx9UJssHfHvwY+PljWGJP0PXTU2uu+Pq+UymX9y7q 3kGC6tmRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYyI4ORYRVHoZ/YtQtGPx2u JXFHR1RITHu2MOQcx6JIlwe1n22nqTP84Y9vfS6g+bQtM2Bp7tsFOec36DPtP9bd8PHzhZVv2m6 8ZwQA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_102514_627475_7D8F5642 
X-CRM114-Status: UNSURE (   9.33  )
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

To permit validation of RISC-V cpu nodes, "additionalProperties: true"
needs to be swapped for "unevaluatedProperties: false". To facilitate
this in a way that passes dt_binding_check, a reference to the cpu
schema is required.

Disallow the generic cache-op-block-size property that that drags in,
since the RISC-V CBO extensions do not require a common size, and have
individual properties.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 3d2934b15e80..e89a10d9c06b 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -23,6 +23,9 @@ description: |
   two cores, each of which has two hyperthreads, could be described as
   having four harts.
 
+allOf:
+  - $ref: /schemas/cpu.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -98,6 +101,9 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/string"
     pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
+  # RISC-V has multiple properties for cache op block sizes as the sizes
+  # differ between individual CBO extensions
+  cache-op-block-size: false
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
