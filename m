Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 097A1D262B2
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 07:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QRGVymw8UUFXNromdNA+44IFbJe9WUOPR26thas3BZQ=; b=Y4Z7zyQYqjckn7
	eCuUWxlT/qtxNwcdXLk5wL8nFPgrtGtEIvg59wBkl7HkAezW8wmh0tc/FdQIHs8u132lPIDAtlOVY
	girhRBozai0F+RWzU+VGz8rjuNIq1X7ZZP9J7dZYWeGQLUeE30AFnG6xI/KWppE/GlBGUps/Ilh2g
	fUGu+8844mL3KcimR3sA/EC+HhlVHXGq8hhGSEtG17zKWYY4ui9sl+U3cUAdVp7WJ6dZrri+GoKUU
	v413IZPp7aV409cpYt3wO017OgiDo9IMgNdBFDTlHKY560SkrI5TW/cvYtmAvzFyhi90+ZYK73K7+
	BfaDB1aPMWWLZXwWmClA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSdQ-000000050vY-0suQ;
	Wed, 21 Jan 2026 07:28:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viSdP-000000050vK-22aD
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 07:28:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8136660051;
	Wed, 21 Jan 2026 07:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5937BC19422;
	Wed, 21 Jan 2026 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768980490;
	bh=QeG4nnxg3Z51cpWjKcP61JzmFp2YGJm8LfLD4oaoy8U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iFkOGEalBip8wI2VzLFYM/E8GwHwKaeM/gCFpYtsExzrPGcxZZf3APVaozHgT1N3b
	 w2OTNd5OyGlfK092no+0aaC9jQmvQ0zTpbyIbnLLT5/yvKoEKKgeSyThM+BQq8q0fb
	 IJUyRHDqpFg1RLlaH7SMCZS7hUX4iA4IQJbtUx/EgZiXhd/s4p6UOMaVOF+D43tsAJ
	 SftIrIAuSwQkfHnqEWqemPv1y/6qaM64z80erQ2e5eiJBvVoYqDQGOOnBeE8XMQwET
	 u70L8ggOfpoUlB1KO9jzXYIPUwegebE1KiqWTIZQWCXkqdAejIhhWmqBi/8sjyrdhD
	 rnVPgw2Uc55+w==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 21 Jan 2026 15:27:35 +0800
Subject: [PATCH 1/2] dt-bindings: mmc: spacemit,sdhci: add support for K3
 SoC
MIME-Version: 1.0
Message-Id: <20260121-07-k3-mmc-v1-1-ff77c07bfdf6@kernel.org>
References: <20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org>
In-Reply-To: <20260121-07-k3-mmc-v1-0-ff77c07bfdf6@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>
Cc: Yixun Lan <dlan@kernel.org>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=860; i=dlan@kernel.org;
 h=from:subject:message-id; bh=QeG4nnxg3Z51cpWjKcP61JzmFp2YGJm8LfLD4oaoy8U=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpcH/96qp2jXu4fXgJ8Y6kFmPxqTwCqDVE42OWl
 x74C6WGSS+JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaXB//RsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2LPQ//ScM+Sc67IfaSp4iOiDDdA8oCud9EFwgJkD/DGkeNiRB+0fRIvjdGs
 4dK7dVm5y1tje7gL+q0SUH+tq3tJlGAQIkPTzmNE+TGizoO9keYWNoyuA58L5SqnqHxnziM2xZz
 TVLWMorOECa+AcBTnlNx/ShDQxxJFo7cdnsQLJ5YI2e83RuSI0ZAc9QPwtEfSXWE2yqHOOHplHF
 YZGV/oyaCCqjBqp0GOzS9m6AiwHzihIUeGZ1LWEtMhDMWGgGGnzJylJEGPCtCmQaZ9oNNAzBpVN
 T+626hIrDGofvgKHL229U7+8iVQ0mtJGGWLb2fchkaZ4hfvERapTnwPArBhAPck41049WiFijNV
 ajzs4R65t9dsU662l5jzyWCP0kEfMIk2lvtMOU7+LpNCv/vVeNRvuSU1reR6YFp1tm6jLyJUfxj
 qupXpeULsEPBX14sg+JoXIr4SujowjF+r5OGGLm5ukhBQ8H8p4r52Eknja1M+XjLNO0Z6Ye1l79
 uCDLZ+5t3aVLrNAAjg49lfJlzHC0QoS+I1uj7VNPtJCjTFjG4slUBxxTKOl5QXAzuYlNIBtomv5
 XJOUvr01JoGjF1tLwEtQnZy7iMnKFlFdAWk5DuQIekXzDP93IZIP4Wv7aTgHFfHpiToXEesCCPs
 TkSjqO2yYgBt5JlF64IvuMrs0dnK5U=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

The SDHCI controller found on SpacemiT K3 SoC share the same IP with
K1 generation, while fixed the broken 64BIT DMA issue. Introduce a
compatible string to enable support for it.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index de4e9efeb666..9a055d963a7f 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-sdhci
+    enum:
+      - spacemit,k1-sdhci
+      - spacemit,k3-sdhci
 
   reg:
     maxItems: 1

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
