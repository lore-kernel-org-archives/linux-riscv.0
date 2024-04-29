Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEB7EC25B10
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 00:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jEZXU3fix2GSlJcsskE/t4IQIf0RZezAVAs22Ay2r9Q=; b=Zq7nWSqtVxL14e
	ZlZ2J99lLNGMpXWAOYUcZMM3nYCTubxhOyagKvpVdkQJ2MoAO2vLi1atE67W2MMdmBs+1r5WVlVvS
	NpGzB2P8ralXNo9VjRINyPnBQyWl6pF1m6kUlRXxNkXyQLxv1rrFDEiw+LU8ZNE1xUUU2owcwv1dQ
	Rp1mgKrtOeoYDx2lBbk8XkUNAKoy/D7byePrk9epBa6CrCanA1SZumw6nU/vKzddodHBfJsP84+xb
	FzMfhlSuoyTy7o6dmjzGtUQ6I8kb8rsB+FYR7rVS3vPh4kIQPgMfTtZh5faqGcXqxFTdMENgfFD7I
	mGfivpou1wm0Iy4uitmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErS-000000012mr-0ry0;
	Mon, 29 Apr 2024 00:27:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1ErK-000000012eq-2DaU
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 00:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1EF4060BCB;
	Mon, 29 Apr 2024 00:26:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D26AC4AF1B;
	Mon, 29 Apr 2024 00:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714350412;
	bh=JV9sARz8mXFB1oPD9Q4pwlzsDwDsirXQg0InRkhTXdg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZcABOnQw04CLdm4lLPfwclk96h+C/SU8r0D3oYtTi4FuVrKwidES13DjGjymF3rml
	 THUqm0veDndSNbRipgGjxF/Xa+v1tdcghJD+zhPT8Xoo9T3rMSmJQhZJKWmwWqcgkR
	 L3Toqg36ARKie/6XxygT71tBabWIbWTVmuCASoNYSOmuH31yZO0l6P5ISJVtYl9Sqz
	 tOB2XXU1pYZ8tDe7eUi6KQkzH2qxbGJA3L9f0RvwSejYC18PJdXIkD/7f0m4zkA0bp
	 OZkc9rFRoIHmeP+Wi+waCRtdi8nmPPIN10CeP1pnQNcJ3pc8lWnxE0Wzs2weQH/F9i
	 Tuz6dLZnUDyQw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v4 2/8] dt-bindings: riscv: starfive: add Milkv Mars board
Date: Mon, 29 Apr 2024 08:13:11 +0800
Message-ID: <20240429001317.432-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240429001317.432-1-jszhang@kernel.org>
References: <20240429001317.432-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240428_172706_644115_1BF4C19A 
X-CRM114-Status: UNSURE (   6.99  )
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

Add device tree bindings for the Milkv Mars board which is
equipped with StarFive JH7110 SoC.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
 Documentation/devicetree/bindings/riscv/starfive.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Documentation/devicetree/bindings/riscv/starfive.yaml
index cc4d92f0a1bf..b672f8521949 100644
--- a/Documentation/devicetree/bindings/riscv/starfive.yaml
+++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
@@ -26,6 +26,7 @@ properties:
 
       - items:
           - enum:
+              - milkv,mars
               - starfive,visionfive-2-v1.2a
               - starfive,visionfive-2-v1.3b
           - const: starfive,jh7110
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
