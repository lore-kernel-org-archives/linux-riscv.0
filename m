Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63180C04FF8
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 05:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zB2aOIQqZF8Hr479w6dAGbUD6xg0jKKYF9crCQalX0E=; b=2SmnP10rjFcRTE
	Dd1IMPSsO3wCxOM9aYlvBTdgToW3lEN9BGVe+bNZ9j+jTfnBrGYFBbB8n8jyVzRXiKr+2Zy2ZBY1X
	ymCDxKq39Zxjik8HAF9t+kWjjnJNu9Pm12kzC06xs8iJBD8WfX15bLXYaE+8LA9z1Wl4nB0sH0vB2
	l8U5fnqUEkGtUISR6LYkfsWp8y/wRJUa5h4/tkQgDpHvwHsSI7h14iBUR5CTuQEkjr++0XZ5+Y8C7
	SeU/WP+v1MA7unxGY2yLpghYfxRkCo4aYvFroqGo4Up+Y0irA6MAbnDYxS5PKQ6RF6D63dGordWRP
	YTwQYp8r5HIQqSLXdiqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQCg-00000009vIr-11If;
	Sun, 21 Apr 2024 05:57:30 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryQCd-00000009vHA-48qY
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 05:57:29 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B63E01BF203;
	Sun, 21 Apr 2024 05:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713679046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/dDHo+ZHs/JUcsjGJGg/vbysKC5Mw590x28u5YYvIXg=;
	b=E7l3AT3FYz1yTsQXYEgHUxlwDcUxJppyNcyMUtqYOQmd0Ih/jufAbBe04TfkT9r8EXn4/D
	s2KHP3veqSG3ErTVL3PEO1yMYKWBlDTXp9L9+WBbJhCS2zP6gqESEh5zvpVg1hbDZ0wV11
	6hDELEJ0L/ky9dpv6e0HKwCKRG6irshytE7Io7KM+SUDFwl2iPNRdIvCLjcl1Nej1jfTbz
	cvEfms5FFMZW3wBiXWPhTzif7FOHQIZui4h34Zs9q1fapM0sX2/bBmuZYh8Z2cTcJosDFH
	uLP6PcB8zxFpTnWqLGtCXF+xMfm+zTeqIiTTqj7HxA6QZFZWJYGB82V9Ct2zMA==
From: michael.opdenacker@bootlin.com
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 1/2] dt-bindings: riscv: add Milk-V Duo S board compatibles
Date: Sun, 21 Apr 2024 07:57:09 +0200
Message-Id: <20240421055710.143617-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240421055710.143617-1-michael.opdenacker@bootlin.com>
References: <20240421055710.143617-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_225728_184596_2CA959D0 
X-CRM114-Status: UNSURE (   6.96  )
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
the SOPHGO SG2000 SoC, compatible with the CV1812H SoC[2].

Link: https://milkv.io/duo-s [1]
Link: https://en.sophgo.com/product/introduce/cv181xH.html [2]

Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
---
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 9bc813dad098..79546aa21021 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -24,6 +24,7 @@ properties:
           - const: sophgo,cv1800b
       - items:
           - enum:
+              - milkv,duo-s
               - sophgo,huashan-pi
           - const: sophgo,cv1812h
       - items:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
