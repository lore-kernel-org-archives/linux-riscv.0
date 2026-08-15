Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05064C5CFC1
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Aug 2026 01:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r4dYdrLepdwf+KyOKBK04XrSr/UdoNy2VcHmdoSL8tY=; b=ofXN75aOPA0g7k
	xkAyfpPOKTrh6+LfRiCdGa47Nmvr08UV1QsmiaU8zSamCStTdHFS7AI21ZcN3R0DZoqUGCD49ZLTZ
	yiNXY+AFuYH2Hac+5YEA7z4QwO3dcXDbMrwusc+OKGUc3HXGuP7AHY+YaDVd40HeGnAFiijUaLLt+
	OScqVcPXinp1Fi1ZgpjmwuUkYmzNmexuUGfhzhZJuve2y9sJSJ5pAC3bqlkyUc4Hnt9x1QUz1hikK
	A7Za3v6jiHp2j0nDuBTOPIhhmU2Y96y/+BcrEe2+Y9+Rgw6YKMhRnqLII0n80YvkZYUumOv0xFmtr
	1lJnOFGbWne5MvDE9VVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3eu-00000003Nog-3d9x;
	Sat, 15 Aug 2026 01:58:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wv3et-00000003NoY-2Re9
	for linux-riscv@lists.infradead.org;
	Sat, 15 Aug 2026 01:58:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E335D438F7;
	Sat, 15 Aug 2026 01:58:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5DD31F00A3A;
	Sat, 15 Aug 2026 01:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786759082;
	bh=5lmLAL2bcDbv13JwDq0IXXt8TpckG5QbWoFG1VJqhLU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QT+X+iQGOjZLCxyyTvYYweZ3FPVC5OsQ/aVMDn6T/vYXRLaqhK9b9nWy888RmQrvE
	 ksu6/oLqGnd1bEPP7aWxfkfI1tFTR2YqvAOugdfmHj0d9uemJO46LRyf/NRRG0Dlel
	 1ukJAMVfSVmnMw5h2YGdp6NK9QwPYf5c0ckAGiGbmsdhC9GFlp0+3h9WWoqsZUKAPu
	 T8wv6pl7VaNzmAIEk2UvQ2x0QBIE6E5HO+yeunnIS63rMZ8DPHvz1mrVsna99MeKIW
	 3Epp2oaMTKwlLm+JNJ0F2di1/XME1zU2tOxfmo+o1OsoF87h+9OIxtjl2RLjX6clx5
	 teYTQMx/8Gk5A==
From: Guo Ren <guoren@kernel.org>
To: robh@kernel.org
Cc: devicetree@vger.kernel.org,
	guoren@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	robh+dt@kernel.org,
	conor.dooley@microchip.com,
	krzk@kernel.org
Subject: [PATCH 1/2] dt-bindings: vendor-prefixes: Add Xuantie Semiconductor
Date: Sat, 15 Aug 2026 01:57:21 +0000
Message-ID: <20260815015722.1736831-2-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260815015722.1736831-1-guoren@kernel.org>
References: <20260815015722.1736831-1-guoren@kernel.org>
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

Add the xuantie vendor prefix for Shanghai Xuantie Semiconductor
Technology Co., Ltd., which provides the XuanTie processor IP.

The vendor information is available from the Xuantie declaration
pagei [1].

[1]: https://www.xrvm.com/declaration

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree <devicetree@vger.kernel.org>
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 396044f368e7..89391cb467d5 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1905,6 +1905,8 @@ patternProperties:
     description: Xilinx
   "^xnano,.*":
     description: Xnano
+  "^xuantie,.*":
+    description: Shanghai Xuantie Semiconductor Technology Co., Ltd.
   "^xunlong,.*":
     description: Shenzhen Xunlong Software CO.,Limited
   "^xylon,.*":
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
