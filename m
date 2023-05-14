Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359FDC77B7F
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bofVh+kbCLgnn1gDddwkysF63DsJZVp/nk29/ShzzGY=; b=dTCInBiQgoW8qx
	ae5EFk/MEeLhEpNhtI7wT0JijnqThHkWbKeBCXNTPC6ueSetrvfzXPwQN9Tm3HFTZqSoduLFY9H3x
	91EOJZUqvd3yyBdHw8j1Gr2/7+kk6CzCCb+OBSTx/V3jZCzNmYtliE89Si2iV+Kf9YjQb/6kC5bwY
	7oDmBM4CPCay/Kzh/sbMQQVOK0vk8cNbwF7MfsiE3clHqcnfc9M+HWANnlZi5qt2S7cBYFqN2s2IN
	QJfBckZwyKWIsbpDgRwhe4r4/4m/0r5NNm3VUjXtTnHG5lGacfM94bYpf860v041fXNKdyHw5xst9
	egmyBrrRdhYBoAeMoDCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCf-00HYig-0X;
	Sun, 14 May 2023 17:08:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCc-00HYi3-2D
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4D8E661922;
	Sun, 14 May 2023 17:08:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F43BC433EF;
	Sun, 14 May 2023 17:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084089;
	bh=QsS0GqTEpUgIOl9D4Ma8N/Z521IB8RVwhJGktfvNTz0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YXyhrJbbT/SozDGrfC1Jj3qqZw6mERdNANW6weX6tlGuHGQcj3/hqqSAqhThSyPv2
	 SQ3Nj8WegpEH4uLsa1GzpUAYdmIggVjY5KCYwImIJ3QforBF4bkdKfrRrbHRV3lu5G
	 ItGW5XyY4yZMe17x9uvhItNgB5hqBbOGpgk9ZP5Eh2YcBge/hCBT60pdjUPlDJ3xav
	 Wne+NMUi+u04kS46E/sq8FWyTONJ0en6uA2CRnDE2tIsUcCP7pXuZqhTbHicGjz+5R
	 liPYpb4qqkiP0AmEq6gv4Tm+SLt+bSTPZjhpzKtxHSOuqpZPtf+nZJV+K7yfBdYjCS
	 NHC2SFumzTIqw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 02/10] dt-bindings: interrupt-controller: Add bouffalolab bl808 plic
Date: Mon, 15 May 2023 00:56:43 +0800
Message-Id: <20230514165651.2199-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230514165651.2199-1-jszhang@kernel.org>
References: <20230514165651.2199-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100810_807868_75729275 
X-CRM114-Status: UNSURE (   9.35  )
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

Add compatible string for bouffalolab bl808 plic.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index f75736a061af..3f9439b0c163 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -65,6 +65,7 @@ properties:
       - items:
           - enum:
               - allwinner,sun20i-d1-plic
+              - bouffalolab,bl808-plic
           - const: thead,c900-plic
       - items:
           - const: sifive,plic-1.0.0
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
