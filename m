Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19D9CC4321E
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 18:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NUKnuOU/HOiR3R6S/JWee+4b3gHvaLE5TLH5hewS40=; b=ed1Adt4f/jy/Vq
	Yk3zdnkr7dwQoaB0ZZJlJCex9tly1aDywj/j25W03+YnLTR5NGrRiExoPaToSDRnAt42Js/qgUoJg
	pCadTOlZZy9uJUgrzjqKBX6qL11fRJeypKIMPg9NOxZi5XomwdC9fURMqJzAXflrP52yQTrZFH3zB
	8RGqV+NmVtltGok0Vow2xss6Ft/ESDVToDqvuGhSkQNsFjw0AR4P4eCghFlhfCCt09Pe9tak+LxM6
	7POdbrfuIAMjr3+MpSLRAciRjpLOaI2M2LGWkkjIgjjGkFzpVHqlFwqq0ibd/QBhy0Y44k7QGP1qG
	/qEkjIgS59IlEjZh4H3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RTY-001OAS-QC; Wed, 30 Nov 2022 18:06:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0RS5-001Mwv-Vc
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 18:04:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8082961D2A;
	Wed, 30 Nov 2022 18:04:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 477AFC43144;
	Wed, 30 Nov 2022 18:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669831496;
	bh=aWS431RxPAePRVMhSm2JmuPDwCYve4mSOvoqk39aooc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IxddzEriFuoQxLFHlPju0wVpIb4GQkBlxo4ms79oP3DGmib0Ysdvi3AIp0VSeUNoL
	 2GThFQsz/g+XmgRUiUUxSl/4aQQKGsPUMx7IUi0sHWL6dQWPSxAl5N0LUIWA5t5WKV
	 KPJM68MTJz9WkRBomxdV2WqLduCBYSGRgjxqxQ7gOo/eiSjgXlqQCTeHFsRIwxN8DN
	 YTHnISl0XJ9d9CVR84ishl2FIuDuAoQMBD/0DIVMeDJlZcu1LwYUF/IzCjs6hIT3Wf
	 Tj7yvEbaYtM9BgQiCdWM7XgfrNYQFrwhI2K7o6leuS2hSo71z4TbEuNSrkVf4Hi2Vg
	 5GDQ8Dz0YgNcQ==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Conor Dooley <conor@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: riscv: fix underscore requirement for addtional standard extensions
Date: Wed, 30 Nov 2022 18:04:22 +0000
Message-Id: <20221130180422.1642652-2-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130180422.1642652-1-conor@kernel.org>
References: <20221130180422.1642652-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_100458_104381_72834FFC 
X-CRM114-Status: GOOD (  12.91  )
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

The RISC-V ISA Manual allows for the first Additional Standard
Extension having no leading underscore. Only if there are multiple
Additional Standard Extensions is it needed to have an underscore.

The dt-binding does not validate that a multi-letter extension is
canonically ordered, as that'd need an even worse regex than is here,
but it should not fail validation for valid ISA strings.

Allow the first Z multi-letter extension to appear immediately prior
after the single-letter extensions.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 90a7cabf58fe..e80c967a4fa4 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
