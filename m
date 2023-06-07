Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80029C7EE2E
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jun 2023 20:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoDS85ze/vZ5o/l0+0FxIsxiIIdeWeJSej6+e4N84QM=; b=RHc/O5b2foM+r1
	VVmMxXY3k079zfTLvzjpssVsAFWSr0x2mHtCKusrF1OD8MUnM1v8IlGpXNBuyw/VPkQntXAmE9+hk
	ImB58vGF+/Idxbarh6sJWQwnZDX3S0c1cCjOj0JH9U59E5I6oBjzd3/NWvQSXYvdl3gdphWkitK93
	y4R2mj0GnRCySbbPweLM94+X/7Q7sKjtryD1vDWzwbBk94amGX2zI7HHeKHU2swSxZwOzq2sxSzJP
	9xSpzdHUuqz6sG18cnmA9zkfcW6AsKyOaaiByhUYpLx9RUr0BjZpf4GztEkNxxiAK/0afwcxicp4h
	Q0449EDQNdROvZYoiWXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm9-0077rB-2z;
	Wed, 07 Jun 2023 20:29:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6zm7-0077pI-1d
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jun 2023 20:29:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 17EB8644CA;
	Wed,  7 Jun 2023 20:28:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 240AFC433D2;
	Wed,  7 Jun 2023 20:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686169738;
	bh=vFxtHREVJ9UNBDng1m71MFH7Sb5ddr33ZSLOi8jzDkE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hVU/uMrosox7GhZBtN3DjCMhKJnUZE3rQcYVmRehFgQzXHiqV1CJWoD2BMB++Dfs3
	 y75HSiWEFpNlJtmqvPaIT8jr3AtnFW8NSMDkaMx/yDBNkMU7dqQJAu91ABT0aEtk0Z
	 UEooWXMKcEsp4MDgxp6nearkENg7oWO3Sf1ByOab5n6niw+uu7HP9W+dTFIoO5Gsuy
	 8STDiuf7LJVAOJZ3PrW238+kVFbSjbajIBGA5CpAvBOUC8oNBvi4ffpp2xA+p/D71n
	 svPKzM4VpK3HiZBFrnHW2wCzucMjpWVeN6N1m1WYk8kvAcf7xeH/DrMSQLLq/tzy6S
	 RJBm9GNhvzZgA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: [PATCH v3 6/7] dt-bindings: riscv: explicitly mention assumption of Zicntr & Zihpm support
Date: Wed,  7 Jun 2023 21:28:30 +0100
Message-Id: <20230607-rerun-retinal-5e8ba89e98f1@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230607-audacity-overhaul-82bb867a825f@spud>
References: <20230607-audacity-overhaul-82bb867a825f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=FqaBAVwOvKHQOTc+2d9mFz4gWPu5PBX8oewfgU7Ysuc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkNL7JE9b1ZHx2YWfOowT5n/abnKddnzDD5eONE1I4Aj eqjT1kYO0pZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARmyBGhi8+3BME1ogvqma3 mvMwPkPAUu/d7Iz1W9Kyiyc0+mqEPmdkaN624Hz04roMl8VSr5e1xM71clQ5nrNgX4BCPMOZoKK vXAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_132859_585460_B6C5D4C2 
X-CRM114-Status: GOOD (  12.10  )
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@rivosinc.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Similar to commit 41ebfc91f785 ("dt-bindings: riscv: explicitly mention
assumption of Zicsr & Zifencei support"), the Zicntr and Zihpm
extensions also used to be part of the base ISA but were removed after
the bindings were merged. Document the assumption of their presence in
the base ISA.

Suggested-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index db5253a2a74a..d5208881a1fb 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -89,8 +89,8 @@ properties:
       Due to revisions of the ISA specification, some deviations
       have arisen over time.
       Notably, riscv,isa was defined prior to the creation of the
-      Zicsr and Zifencei extensions and thus "i" implies
-      "zicsr_zifencei".
+      Zicntr, Zicsr, Zifencei and Zihpm extensions and thus "i"
+      implies "zicntr_zicsr_zifencei_zihpm".
 
       While the isa strings in ISA specification are case
       insensitive, letters in the riscv,isa string must be all
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
