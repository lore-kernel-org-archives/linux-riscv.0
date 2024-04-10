Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F25ACCD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 05:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NX0QRJ2fBINvQDmgTnF95jPDPDo4txlaHlPDCOkrxJo=; b=pv7K5Xc7q+Ei15
	O9olvPMDW5lTq9e9hJPPngtkTHgg/unfAIlBV180+CLD0hBBsUku5WKQ5cnEFiVbLvN3/lKLjW8HD
	qkKkcSMja0F1gJGK7QtUrLQX2Z7QOqzQstn1/YLWfYei366GQI48/tfI4Lv0scwFeE2/93WQSm47T
	tJOJBNtnMccMRqe30MRapnMRsQ6KsAUs1D4Ypf7oHwbH1s+yU9qlOE7zyx4xBCv4IkfvrRvM+u+Ox
	6bpitVM1O7+vXy3g39k2072eYjrksEoi3LtJ+rblFYOnQHI/fEi2+IjPZVn2RfozGQ3/isSwUFIz4
	qRbdiqB8qUBczve+o06A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruQTB-00000005Bfj-1hsc;
	Wed, 10 Apr 2024 05:26:01 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruQT8-00000005BeU-0DBa
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 05:25:59 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id C971920003;
	Wed, 10 Apr 2024 05:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712726754;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pp6MTv8ndXhkZFAi0mOWfa7deuiDrn7kLeffrdA5z5g=;
	b=MdYUda89nrrNToShetXSgAldJEpsyLQC36tFBUb/UHYzTsDvcF/BeLK/p0FO+at1aNg3xu
	hj1ABRJmB2DsWkUGLeICvDT969+zaoqPWc7lcD24sfdVf2Q2Bxyol5GbJBDDG7LdnCSgQY
	/9i6U7Z7vMnyABs5DU9z9yxF91zH9PBgYTnNNGTtEBICU7C0JPKRgkaeitRg/ygtX21lVL
	YcJQDPO1zYgrn2hgtIKtnwaOfMntWL5HVIGfGz/SLTX85pesxhDtHt0+rtr3M00TclMd0s
	VMjCT0KwDMAlCILpVPCnBUS+0XHx1yIjNGx6ttOqW5DR1p1J6EPibkMB4V8vMA==
From: michael.opdenacker@bootlin.com
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: riscv: add Milk-V Duo S board compatibles
Date: Wed, 10 Apr 2024 07:25:17 +0200
Message-Id: <20240410052518.2945789-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410052518.2945789-1-michael.opdenacker@bootlin.com>
References: <20240410052518.2945789-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_222558_368155_40912973 
X-CRM114-Status: UNSURE (   7.47  )
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

From: Michael Opdenacker <michael.opdenacker@bootlin.com>

Document the compatible strings for the Milk-V Duo S board[1] which uses
the SOPHGO SG2000 SoC, compatible with the SOPHGO CV1800B SoC[2].

Link: https://milkv.io/duo-s [1]
Link: https://en.sophgo.com/product/introduce/cv180xB.html [2]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 9bc813dad098..2bf58bd6f3a0 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -22,6 +22,10 @@ properties:
           - enum:
               - milkv,duo
           - const: sophgo,cv1800b
+      - items:
+          - enum:
+              - milkv,duos
+          - const: sophgo,cv1800b
       - items:
           - enum:
               - sophgo,huashan-pi
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
