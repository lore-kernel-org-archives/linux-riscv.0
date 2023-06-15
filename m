Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ED44EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 22:55:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IUHH8wzd9PxRvRznsbfsm713ey1AAYxgczn3koJHq3g=; b=lnmkO8Z6FfVkCE
	N0RMVJzVrucApDt5rfTuStCV+Z48X0hPK4d4VMr0GU7dzpJNm2F1C794zXBIVUz4AT9kheG0WCes7
	wdaZSV5mb/PJXZCrKLM3fVCgBeAY4s0cQQZF9xItg4lYF7H1s2aA8z6KSNOGKpl9CJ1iy0N18kbEM
	ZBx9zYtpDxNfwt0TDLrnZGfdILlZYe1Rjv8HnlKydXKe/7+UpTlQ/Y44zC9735FRZ60qk84kBF3kK
	PMfEMAnd9m2EPub/O5ZPhzByTO8hZaEFFAvy/XjX6rLluQyxGcCEXPDCM/OFYZkOUTrhiRbMgRnJ0
	Bf+PshuRnqaWm0DfdJCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vrj-00GHnX-27;
	Thu, 15 Jun 2023 22:54:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9vrh-00GHmX-2E
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 22:54:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 301C060F13;
	Thu, 15 Jun 2023 22:54:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A2DC433C9;
	Thu, 15 Jun 2023 22:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686869692;
	bh=Df043vgm6CnnvUWCZd+vj+oFrnFuv7Ap9nxevuDGXJk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YlHWY7F7AYPflO0rB6nuP/YL0uYkct0iT0RW4smQHkv38NoiU3x5EZpgJDHsw712j
	 Vp38wT2BA44kvTWC/0jULlBRzX7oyJ0gqRvCwFmbRzF5+/Zn7D5gHIFdK7d8WePt7a
	 q9c1djYEMs0r7zJj8s7xwGz0mv6MB8TYG89M7gUn8t4G8yg8Jnjb3x58NwsKpozVPm
	 3AaNRwGhHTGoBdtEBYI6wwLFK6egoozkefyYjD4OEu6DKSPMdZwVlAdas2A45Waq78
	 mY0ZCkVPBjhsKLbhiVAtMdc4vlY2tkNveEUAuQ8t2oMb7I/x4U9n6VaQtAffjJhkLp
	 d/7f1X5bty+Pw==
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
Subject: [PATCH v2 1/2] dt-bindings: riscv: cpus: add a ref the common cpu schema
Date: Thu, 15 Jun 2023 23:50:14 +0100
Message-Id: <20230615-dubiously-parasail-79d34cefedce@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230615-creamer-emu-ade0fa0bdb68@spud>
References: <20230615-creamer-emu-ade0fa0bdb68@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1511; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=xnf8UGz7+fdKaOoNLsbw78HDVnw230rwRyuBbYLfg8w=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCndUxebKtwsSK6TCBAy6ShyYUjtPmOi/sPXT+gG59cVH ceOzzzfUcrCIMbBICumyJJ4u69Fav0flx3OPW9h5rAygQxh4OIUgIlM9GT47xnJvjnj5KeFukfl DqfV74nYoee2pvqvxfIPrfsOlGcwTmVkmPxO+7B23oY3m97O6v5sfVKvI5D5qdWH0hm7Kkvl9bq K+QA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_155453_774769_4A12AF4E 
X-CRM114-Status: UNSURE (   9.14  )
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
