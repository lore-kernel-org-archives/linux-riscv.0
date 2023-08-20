Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A3CEE49A4
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Aug 2023 12:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m2BKLtVS9+STcXD9RYI5PX/nHyB9Hjl81gLWg2yTCC4=; b=U/yg2pz4Kz1WS7
	mu7zMZrQT0qatk1G3V9yIuFI6bstWOe/4ZCJun3fgkWQgN65UhN0fPCJpmlw4D7ttAO7MCEZBNvCX
	ljy8jYTiw5tvgkO5cQdmuoGj7ZR5O8xK7Nks4ABt71vXjFdROjWu7UDbs3jJYNunNpnEitZOvlJ5r
	sI7oUbgPFrX/PKG0k2XJyUOlyv5uHSAFrvh/SqXyRGf6S1LhTOG74LgrS2zjWBEsS+3KthC4Opbhp
	bif1OvkVLVHfhocDuyaGR/hAQcYMGMIAEC7u95pNLm3XiQXxMFH647P22+9czBCi4Kc3FRZgtLnOc
	vJGeYm7KXxW7KDNEL7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhJy-00BsaT-2F;
	Sun, 20 Aug 2023 12:14:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXhJp-00BsYC-0Z;
	Sun, 20 Aug 2023 12:14:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7AA616144D;
	Sun, 20 Aug 2023 12:14:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6527CC433CC;
	Sun, 20 Aug 2023 12:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692533647;
	bh=JobfbCNun9/CKRyR25756fW741H572o4jwNRMnpEBdE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uaQRsHHdvpihZdkFmaKkGvL6GuO5xzJ19kcCAozGdotB7TyHu+7wv0sfrEeUd3p/P
	 kC0aQkeztPrfvW1dn1p6HEgbv7QwXjPJSByJE+DQo/cyHoGDiTHTooRcNxOD5DBExP
	 GrArCMKkTFSVqXXPg9xUXOLuhU9Cond7uxNPHnqqwhtcj0+F4oAvCqtXgIOJZyErxG
	 H96/Al6d6rSjR+me62K1oenTfHPY3ZemDVxmVwj2SJ3M+R2kpxCbQ07yguZ4t3CFAZ
	 lzkrBR1NcoO/aElKEUgtyG+e7m18xThaHWHFYvp8vLpUw1SAyM9AVBzOIYsArNwbLh
	 YGGMDo27HJzHQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Giuseppe Cavallaro <peppe.cavallaro@st.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH net-next 1/3] dt-bindings: net: snps,dwmac: allow dwmac-3.70a to set pbl properties
Date: Sun, 20 Aug 2023 20:02:11 +0800
Message-Id: <20230820120213.2054-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230820120213.2054-1-jszhang@kernel.org>
References: <20230820120213.2054-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_051409_259420_28C4670D 
X-CRM114-Status: UNSURE (   8.17  )
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

snps dwmac 3.70a also supports setting pbl related properties, such as
"snps,pbl", "snps,txpbl", "snps,rxpbl" and "snps,no-pbl-x8".

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 Documentation/devicetree/bindings/net/snps,dwmac.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
index a916701474dc..7626289157df 100644
--- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
@@ -659,6 +659,7 @@ allOf:
               - qcom,sa8775p-ethqos
               - qcom,sc8280xp-ethqos
               - snps,dwmac-3.50a
+              - snps,dwmac-3.70a
               - snps,dwmac-4.10a
               - snps,dwmac-4.20a
               - snps,dwmac-5.20
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
