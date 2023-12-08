Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA16CC10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wJZT0HgmTqYVXzEwNX4S6EPxlNqNBcwERH+T9v/W19k=; b=qIsZ+xqNVaZjrS
	XDblFECLzNnw/oszmvRqeLEfn7WrS2FYPqNagRS23sX/BrsgaG5rFu3m37GHT5houzMXVcaMZGehH
	l4FnveBH6hmyaS3ymHqbKCq1Ra0eJBTiLrXF4gLXqKD4e6gsOVzLcavOPnyXJUFv8EMUEOAWMqnis
	nOcd4XIaqR0UBdknOp+Gi08y7ON/apOilWy96nD955EhAWA8/+M6vBj3TFH9P3kB6502lHgzHaxgC
	QsXiAX24Dp2rhz9uwu7T+szSmzH96ogwFVF5aZtB7gnxUXDnauCDPrXSaKzE2XtpXPnSbznx0Vs6m
	PXVq5PKNS/YBlHgA+iiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdNx-00Fyms-2N;
	Fri, 08 Dec 2023 16:07:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdNu-00FyjC-32
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3A6DDB82CEA;
	Fri,  8 Dec 2023 16:07:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E5EEC433C7;
	Fri,  8 Dec 2023 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702051633;
	bh=l+iYlhzI1V2FhQLYDTCT5LQFhsRaalvLOJQNHs8UnaY=;
	h=From:To:Cc:Subject:Date:From;
	b=KNCU4cb35WDwu93cB3SM8DcP2zbk9Rw4CA6C2Ax59i0IC27KNqmW9rRDdbtIn6edz
	 12FevqUToKn/8IkjVdUFCYyRli247ZNlzsbriwkEktEsdWon0RjsurX9eCI6NauqhW
	 gxnRgB6WAFhVN4C3iyCnloOxpAhKabVdRwTfftwRCKZh1Bqd8xvoBlJ3Ez4+PX3viV
	 JHzNhvX7p5DK1gSM8JPjJS3K+JCan4x8TEMXQgdOOfQg8n/wB4LEI4AYDDcoZUasxl
	 9oNWrVU5wvrh//wo4JfvqGxxCafVk3Ft9bc1TLkuThy7y1o3EvnCZMu5KqMMadcEUm
	 mIDxqdoMs2tPg==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] dt-bindings: riscv: permit numbers in "riscv,isa"
Date: Fri,  8 Dec 2023 16:06:51 +0000
Message-Id: <20231208-uncolored-oxidant-5ab37dd3ab84@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1382; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Yfy+NplT1sN2TXz/zbddM1bvj8bnuuv0sxpAm2Qtv0Q=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnF9pLhD9eWvDvKqHy4Rfbk8WOGT3O6V4fElvrM+TDFn /n+nfjsjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkTRwjw7wHzheyokXmz9Qy +/FfQfnC3NO7njmVns8r/vVfyqkx1ZOR4aWQjcLsJzPvn3tX/zHv4BmxXxG9NaJ2K5vshNOvLZy 7kw8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_080727_112512_9B10B480 
X-CRM114-Status: UNSURE (   9.26  )
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

There are some extensions that contain numbers, such as Zve32f, which
are enabled by the "max" cpu type in QEMU.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index c91ab0e46648..92c31245d3fc 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -48,7 +48,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase.
     $ref: /schemas/types.yaml#/definitions/string
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:[hsxz](?:[0-9a-z])+)?(?:_[hsxz](?:[0-9a-z])+)*$
     deprecated: true
 
   riscv,isa-base:
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
