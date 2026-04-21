Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C42AF327AA
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 06:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Subject:From:To:
	In-Reply-To:Date:Cc:References:Message-Id:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=q6/Y+oEwpkKDNIgJ9LiiNfCHm8Rd3WmaRD9WqwsQoBI=; b=reNO6wUploBCk5JqSOk+ubZTKV
	6mM2Wt6Mg6OKpB9hlNAq3ab8Z8twCEF1+bAbeZ85JhwXAm0OycEt5MnByONPM+d7384E+JOJVNPC9
	KMt9Phgge2WQgGT1IbfeW5G9psvikjMD32+zmm6eqMxBFSAFIY8d5llsgHboAnA1XJGEph3pSbtj4
	CllNJhR6eBcifAvZM78SyoYKr445lg7CEwfttc2qXrYpty3FK6a9s4mrfbSnGdO6aKA45Rz9qcbBx
	YWTAiUKYKUAhKMCE+9YGaTCoxSKUnzRZHZkUuKG4dPGlWatbPls7/wlIL1jUBygmRemrxkVTn1RY1
	BHDUjDig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4p4-000000087QQ-4B13;
	Tue, 21 Apr 2026 06:43:02 +0000
Received: from va-2-36.ptr.blmpb.com ([209.127.231.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wF4p2-000000087Q1-2rSR
	for linux-riscv@lists.infradead.org;
	Tue, 21 Apr 2026 06:43:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776753773;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=tSL4bEWkpMYj5yOXHwmGIAfJEzPdNlEws+iI0QHUxto=;
 b=kfN1Wm1ysap3YxLdEQ8sLMek9mDHBIK2C6YSpYq8lBjewQLSjlkjst+N8p89KJp3xYc2Kn
 XXHVvWZGxpRc37nMR91xNll3yQbFum/DsEfxi6sHVIYPYUJAaUJ1ivBoUNAuWHua3GWxPL
 fXPiU0vtFG1OrGpxS3oO9Cpp3J36lKDgOJ1Ox0csvqeCAhUpJgUqz38ecx5CowmArPKhS5
 eZGTXl4lXhsc1BdfltWUPXMs0eIfKMaChBXnDjENWrMVQSO9MxvFLXYGc9oKdb8Q+IyXQ2
 Nq9QuwB0f5N4hyKpZZOC+k3Dxqie0LhxXI3hzgmfqBbBPhI7tSkxwRDB5Tw4CQ==
Message-Id: <20260421064200.1582367-1-sandie.cao@deepcomputing.io>
References: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, "Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, 
	"Conor Dooley" <conor.dooley@microchip.com>
Date: Tue, 21 Apr 2026 14:42:00 +0800
In-Reply-To: <20260421064021.1580094-1-sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Tue, 21 Apr 2026 14:42:50 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
X-Lms-Return-Path: <lba+269e71c6b+39ccd1+lists.infradead.org+sandie.cao@deepcomputing.io>
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v5 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_234300_783823_C6870E9C 
X-CRM114-Status: UNSURE (   4.54  )
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

Document the compatible string for the Deepcomputing fml13v05.
It's based on the SpacemiT K3 RISC-V SoC and is designed for the Framework
Laptop 13 Chassis, which has (Framework) SKU FRANHQ0001.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index b958b94a924d..af8030242bdc 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -29,6 +29,7 @@ properties:
           - const: spacemit,k1
       - items:
           - enum:
+              - deepcomputing,fml13v05
               - spacemit,k3-pico-itx
           - const: spacemit,k3
 
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
