Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DE0E9381F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 06:06:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Message-Id:References:
	Mime-Version:Cc:To:Date:Subject:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q6/Y+oEwpkKDNIgJ9LiiNfCHm8Rd3WmaRD9WqwsQoBI=; b=PSm2iX+X6Fo8Eu
	UU6IbOaiEpaeMXL5QAlz8ynriyNnvQR/CRB3b6nQYINLDMOLQ6q99tYiVQOK6+SnddECMKQ0f3idX
	xCFOBOD0xFQSY3azukQs26q0ug5TedLEXUwzaeB3rYTiJbegbPoqPUTVxEzE1byFwrS6/rnmU0/L5
	NskTV2oH0tyQPaEFINi7bWy9QyRy6YjiO1X9LOWp+WJRhqEcJ9ZjJd5zmSk9XbOA2PMClUoGfq0LN
	bhtZ6+9+GlH2Hcn6iVKhrkSCd63MVbRjkQ74+14gZ8WmRDPkVvjj2ngZRAxvECUrv6IvsWtZlHdfM
	PO1eYJJsLAPQCE4UicSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCARZ-0000000F2xF-1km5;
	Mon, 13 Apr 2026 06:06:45 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCARW-0000000F2wo-0xmJ
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 06:06:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776060395;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=tSL4bEWkpMYj5yOXHwmGIAfJEzPdNlEws+iI0QHUxto=;
 b=r9u7ZQmubnD1UdHxPMVTMopVGb/muQyTsYY7rUE6RU5HpkwFxDHiN6a7W+1/g2UyJd1O44
 RHEm4SOBleNpiI3Y/f1Kq4WR/oB+Jl+KQo+9EBAB+OQfVAL0xrn+2AtROsKkTjwUG7Fxf7
 RD+Ga5sEI3OcfycQxqlJy8XCDayBoCvG4PMgE7iu/D0xHULGEXKRlouvxwN6ggd8Rv7MPZ
 WqZcgUBzenDFjNchouHLbntgvRN5VYk1Us8SSrpv9x/4G5nvVSJ6cRYkv8CkvHdJRD9rAA
 YeQRKF+9eNsd1uPaoV6DZnhdcR4V0y3AWD87VHWb3wSCiXxwESkY3E3uI9txLw==
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH v4 1/2] dt-bindings: riscv: spacemit: add deepcomputing,fml13v05
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([61.141.250.238]) by smtp.feishu.cn with ESMTPS; Mon, 13 Apr 2026 14:06:31 +0800
X-Lms-Return-Path: <lba+269dc87e9+5900b6+lists.infradead.org+sandie.cao@deepcomputing.io>
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
Date: Mon, 13 Apr 2026 14:06:16 +0800
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, 
	"Conor Dooley" <conor.dooley@microchip.com>
Mime-Version: 1.0
References: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>
Message-Id: <20260413060616.1235999-1-sandie.cao@deepcomputing.io>
In-Reply-To: <20260413060524.1235982-1-sandie.cao@deepcomputing.io>
X-Mailer: git-send-email 2.43.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_230642_338717_5650FEFE 
X-CRM114-Status: UNSURE (   4.91  )
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
