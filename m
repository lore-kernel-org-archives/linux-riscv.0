Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D1AFC001CC
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 06:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2m/++OZ/j8aclA36Q+hjxK0+qF8ZBQzU1dVMhtK9F8=; b=Z2w6FYUFwNckJe
	4FhRX8/6Zrr+SMpyGlpxVsA358GSwob3W/26h/kHgN5nDe/L+A3GLE6ie6dqy+cO5trop+XxEumob
	TTo7ZBODn9V/xT3Dj34do4VXGxuy9hKCZra942DOl1rsbyWqbjd8KDZVasTHw/H/d1qaY09mDotj3
	Cb+aTa/9lOTvLJBHR3hVMKgmNBKtSNnOEp4vEzcfnQaMGAxh2aMKxHare/Bhs6nmbD35vLaZNZ+PJ
	maQ9YnnaHquYVVHxjTNrlFRmSrC5w8kZ69wN1w2PUGwR4n/c1cE97tl0PbluCvzj2CRYOB/Fj49lx
	MrS0kJ1oU48BqA1yxJ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwz4A-0000000EteM-0UAr;
	Wed, 17 Apr 2024 06:46:46 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwz47-0000000EtdB-0R7d
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 06:46:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DAC25E0003;
	Wed, 17 Apr 2024 06:46:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1713336400;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=C56Ut6AwxxgRCtKAR2dRDxFR3VgYxqC56KrmxNaKKpk=;
	b=ZS6Aln7oXzQupDbo2b976Q2CiO6il/RJFNWEAeRsH35wn/fu2TfQUaaQqvqb57jZCH6VS+
	gT8GEQ9vhQF/jHesphzZZ2VEOoha/0PMfCh+HjbJx8E7psZfLOb1rbNd+pgHiteCzmx89d
	Ym9KuzS4FMqGHeiqpLiSxYLY2WpuQiw84iziwa6WCwHcBKX9zPKWYBp4CZc/a1PDcDgx+q
	AB/8uNVjEuAJ+UQWN1jM2ET6aVrgOfg4JIRiboDdnacE2Osw7fKRpok+uPoTHjiLOTtvBP
	+o4TojoMHG/Tp5l43O3jxK/0l7VXfc7P0R6N8hMZyXCDFwGiPrHfy8cy4SxtOw==
From: michael.opdenacker@bootlin.com
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
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
Subject: [PATCH v4 1/2] dt-bindings: riscv: add Milk-V Duo S board compatibles
Date: Wed, 17 Apr 2024 08:46:25 +0200
Message-Id: <20240417064626.3880187-2-michael.opdenacker@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417064626.3880187-1-michael.opdenacker@bootlin.com>
References: <20240417064626.3880187-1-michael.opdenacker@bootlin.com>
MIME-Version: 1.0
X-GND-Sasl: michael.opdenacker@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_234643_309211_01542F85 
X-CRM114-Status: UNSURE (   7.11  )
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
