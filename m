Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA559C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 17:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nw5kFmmVkF+bbJF3l2ItzUawoYEz7E+ikh7sd9T6TqE=; b=zv7zQHanPVZhI4
	AjzQcW7CbbD2KBlS9AxxH34wn4CA/LqxTJ7vqZL1O2afiMWrquW2mZWUI6pT91oIx/3iES/lQj+e1
	px00Ig7PGYgYzYpE48MzZl70NW0oEZzCFTFLZ1wZr/lqipVnXHDD+KCLkvTtAcklLJKwq8nmEQspU
	At/LEsmX6UZxOpAkHl0KDQneTYXlq60xKhHsmbCq97EKpuIc7o4/CQgePqWhzzbMcu21U6iY+4Mhx
	u7s51A9zaMO3xfGbwRFG10fCTSEuc5Tfm4Wgwx2HNtKEH8nPuigwqhCIllOIBXTT7OJQ7jeqeLQB7
	RWQjPMwskrtD9/DQOXHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FXK-007i7k-B7; Mon, 05 Dec 2022 17:45:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2FXG-007htI-PH
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 17:45:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 68CA4B811B8;
	Mon,  5 Dec 2022 17:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D5B7C433D6;
	Mon,  5 Dec 2022 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670262344;
	bh=FJ2eLc+/uvQtLvi0RqLWMq8XBxp4zHfWRfsPOxpEs+c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dytuqIlUealQUxdTAhY+8ZYE3V8rGSp7iu1KElSnR/Y24IhoesCGKp/+Rt3hrFTBn
	 7fYb4N87KzfwacJim7ecefII2dS9AMKznszp+2sSVfarUSjESNVzoOP+Y4aWqiCOHh
	 ak8NCsL1daSs+lQvLQssAlTpe7cOb6y94b3nFozwvdXS/VKPJxkIltqyne+/KQKmju
	 TMiLeDxbWtidxR7d08bziajaZq+BxfhXkxYrUcKkviuBrleUngoHGy6ThieD3vx8c1
	 ZxVYpnnoucHPxS0Vd+hnJBc7tXxOepQYLfmhMl2cRIBahpcpCHA8ULXIZM7uLzVrd/
	 3gHBTekRuCkog==
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Jessica Clarke <jrtc27@jrtc27.com>,
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
Subject: [PATCH v3 1/2] dt-bindings: riscv: fix underscore requirement for multi-letter extensions
Date: Mon,  5 Dec 2022 17:44:59 +0000
Message-Id: <20221205174459.60195-2-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221205174459.60195-1-conor@kernel.org>
References: <20221205174459.60195-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_094546_999758_A6D19D34 
X-CRM114-Status: GOOD (  11.85  )
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

The RISC-V ISA Manual allows the first multi-letter extension to avoid
a leading underscore. Underscores are only required between multi-letter
extensions.

The dt-binding does not validate that a multi-letter extension is
canonically ordered, as that'd need an even worse regex than is here,
but it should not fail validation for valid ISA strings.

Allow the first multi-letter extension to appear immediately after
the single-letter extensions.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
Acked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 90a7cabf58fe..97659bb71811 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
