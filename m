Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81C00CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 06:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2m/++OZ/j8aclA36Q+hjxK0+qF8ZBQzU1dVMhtK9F8=; b=qayIt0sc1GBJBp
	8b/QhCPKkD/DrUShwQ5HJTOca0lxGlt4ex3XswRjU21FbpsPnt1DIXwfVvGDCxasCg82BtpqO8FGl
	ZY7qhZ8jUabsGNhZ1ApvduyjIS07g0X6NKInVBUs00ZCgXCXukR5R5eL3sQ4EI2jSHuSBqyhyrYTf
	Bb/UYBmucp0a/iMbtSK1hlvs4ZxuEwxKt69mSQGpq+pwbNTHP+AHaXzXXKWQrw7Itx/L/mfXr6wzY
	WM1e2GFplLt2vcInVEelArLhe8KorgdrHtM8SicdySewaPrPLQJ6qY6ZlFf2hNvYV3asfHkcP5G2G
	Q0hjoMGk0PpNlnfB1YRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRMd-00000005Mvg-0oht;
	Wed, 10 Apr 2024 06:23:19 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruRMZ-00000005Muv-2htK
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 06:23:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0DA0120003;
	Wed, 10 Apr 2024 06:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1712730192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C56Ut6AwxxgRCtKAR2dRDxFR3VgYxqC56KrmxNaKKpk=;
	b=Chnr7IK4+kllupfl7AHpVPsMSnPrf78TSiya9/6gf/9kgwr3JvG4+GD0YGvC9oXV2XYO7s
	ii01PbfYbs+MWzHDkHo5G3QzprIYqqxnyeavEn6uwGg098mlCn3ppcx1XnzduLyMHQdwPz
	aNavdha0P/zIFf/idKL/RyDetAfsH3n+YM8rLIZmAGCFJ2bY368sDyPWZT/nZ9oNe08Ib3
	hxvxxKw9kSGrAC8SqtxNu/WQKXlkDCRj4WgRbBA7j5WAAAdVEjgZp8X96JksJ7XzNyYklX
	BjfN6mFprTaeyNVJPgHjKLTn6VJccTpSXUSpkT3HeUyWBYsMlltcSfNbznJ5QA==
From: michael.opdenacker@bootlin.com
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: [PATCH v3 1/2] dt-bindings: riscv: add Milk-V Duo S board compatibles
Date: Wed, 10 Apr 2024 08:22:53 +0200
Message-Id: <20240410062254.2955647-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240410062254.2955647-1-michael.opdenacker@bootlin.com>
References: <20240410062254.2955647-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240409_232315_855802_FE34277B 
X-CRM114-Status: UNSURE (   7.40  )
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
 Documentation/devicetree/bindings/riscv/sophgo.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/sophgo.yaml b/Documentation/devicetree/bindings/riscv/sophgo.yaml
index 9bc813dad098..1837bc550056 100644
--- a/Documentation/devicetree/bindings/riscv/sophgo.yaml
+++ b/Documentation/devicetree/bindings/riscv/sophgo.yaml
@@ -21,6 +21,7 @@ properties:
       - items:
           - enum:
               - milkv,duo
+              - milkv,duos
           - const: sophgo,cv1800b
       - items:
           - enum:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
