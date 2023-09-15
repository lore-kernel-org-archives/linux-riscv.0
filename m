Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 519ABCD37A9
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 20:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ap0P5ZAP+3Zsgd4OsiBax4xZbshqi08e5BhYpUySxbk=; b=T2EL1tfSiSsnpB
	gmDmHZrg7ApBkHi/h/oOCZQCZkWUrufPfLt8HdXMyBXbn/BW0fcVjhrqc3GJMXgVZE0Mk3K70ej+B
	q5zZfS4oAi2y+TCWEBsVtTkaDo349tRY4Ry8oF6xdEuerSPL7mqbF1OXGLQ77t/QLYPKGhM+ami9t
	sSuZmhlP8Gtc/hVPt5cfqQCJnMO8zEFcYc5bQKiZ1qi9895jMp961JEsyk+Di35XJjMncNa/zkSEy
	7D8A8fsEEHZIklP3QbqNiHd+glg7jtexDNWh8XdF+98MUlyBvc6jm0XzhzxP3Q1K1wpya6V5DdJ4E
	D8gLW9s2XDyrsY+hXu9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFIQ-00BK2t-2m;
	Fri, 15 Sep 2023 20:20:10 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhFIO-00BK2b-0Q
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 20:20:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4424CCE2C9C;
	Fri, 15 Sep 2023 20:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FBD0C433C7;
	Fri, 15 Sep 2023 20:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694809204;
	bh=+pZKuROLmBdIrfo491pE/sQfj9kOoSQEDuZxmmaZMuY=;
	h=From:To:Cc:Subject:Date:From;
	b=pLIVKgF4dnRVJLeCqx8HYhHUY8SvSrIXIlPr7f47FMgsP0kEtUjfk18z2d64X5aA9
	 hsMUFqw/E+wJRjGSBFKA0Z4SsbvhvBlLGFxPRI4rZEXPAKqoIhNyI4cMsI4k3zMDVt
	 +UwrH+gWKrI9VGHWH4ME8qqnwVyj26I750hiwNzIayYdenFvazGKdWFKRx8nNiCNLT
	 OvOCZ7niYRmduAyapBZt/nFg3cbk4FPzF7Og+VkH3ATNbr2HCTruw/TJTvvC+bHgxT
	 8ugq+sbEaBMmqWPuknw6UpgxLNKXs0O6qgXmW8D+8+qoLXA985FF3VeRiIHygwT7Dc
	 lYKBGYj+eyqaQ==
Received: (nullmailer pid 4184984 invoked by uid 1000);
	Fri, 15 Sep 2023 20:20:00 -0000
From: Rob Herring <robh@kernel.org>
To: Conor Dooley <conor@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: riscv: cpus: Add missing additionalProperties on interrupt-controller node
Date: Fri, 15 Sep 2023 15:19:36 -0500
Message-Id: <20230915201946.4184468-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_132008_348724_D63592A7 
X-CRM114-Status: UNSURE (   7.98  )
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

The "interrupt-controller" CPU child node is missing constraints on
extra properties. Add "additionalProperties: false" to fix this.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 38c0b5213736..97e8441eda1c 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -91,6 +91,7 @@ properties:
 
   interrupt-controller:
     type: object
+    additionalProperties: false
     description: Describes the CPU's local interrupt controller
 
     properties:
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
