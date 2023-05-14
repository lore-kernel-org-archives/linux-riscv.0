Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F274C7EE26
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2AtHOqxA/hamg7HccbNEMniDPYL4L92Hyw5st9oITag=; b=OUQWoHABlvz/t0
	5fNOSafXJStRcU7ydeP+gKlgQ0VswjyGF5mK/wtYYrVFTLOonK0dJ+IatAK5FPFCXbFVvGUfWh3H3
	ta4LelNoh2MMobSOR3o5Nu4hybdrBLQWfjk8No/2KY3dRDD+GUxjrMJI0f+tPOa5tjnz67slO4frb
	90j9lS9K5IyNgzP40IOh8iIPqpYNp81kE9rZVc3ZiapV3hwjZS3GZFqZd8A2DKP7X/QRZxAZoWz7d
	oKTMfl11ZUA8hN/H4WYrrZ/BhBFRn4wsjnZCOLa8Y2idAwjOKIQpTf7TbRW2TdHUUpmyABGvJj03l
	SLGXVyM6+9f8t0JMMW6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCc-00HYi4-1l;
	Sun, 14 May 2023 17:08:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCZ-00HYhb-1G
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C1F2860EFB;
	Sun, 14 May 2023 17:08:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B860BC4339B;
	Sun, 14 May 2023 17:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084086;
	bh=8o3w2PNumfMmW1nsxUiJwSK+1Wm7LHqx/wBqf4PFRQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O5ZZbKnsIlXkTLOeI1QacOmEvmEyixkY9kbZWpuTdNWmf4NoMEGTv2jeC1Ps1LjuZ
	 IGdUqraKi0wMpt2OxQI5ohFHgmsRgXqyiJA13e/uwut8x2xMHeFUOobW9+/o5DHP2q
	 ykJLa8RhFZjDFQsXf/7INdH1OsFOGfXnapeBowxXdTEUvQBwRcyIMtMOmgH1IfMyW4
	 wtVEgtYnOBvuxQyvQpgJgqaeeneMKq1U89uNtE0wa3M1M8t/kc3pS2if+R1HuYb6NP
	 yFdTL6QcBBMAwsSc0PLPyXyAR8xWoeuNPE1FmunEAgZ96Q3kvsuPflFpF9Ti5VDFpT
	 ZehySqUGPS9+g==
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
	linux-serial@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 01/10] dt-bindings: vendor-prefixes: add bouffalolab
Date: Mon, 15 May 2023 00:56:42 +0800
Message-Id: <20230514165651.2199-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230514165651.2199-1-jszhang@kernel.org>
References: <20230514165651.2199-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100807_523038_C1BC59C0 
X-CRM114-Status: UNSURE (   9.07  )
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

In the following commits, we will support bl808 SoC which is from
Bouffalo Lab Technology (Nanjing) Co., Ltd.

Add bouffalolab vendor prefix binding.

Link: https://en.bouffalolab.com/
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 82d39ab0231b..3566346f2f9e 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -200,6 +200,8 @@ patternProperties:
     description: BOE Technology Group Co., Ltd.
   "^bosch,.*":
     description: Bosch Sensortec GmbH
+  "^bouffalolab,.*":
+    description: Bouffalo Lab Technology (Nanjing) Co., Ltd.
   "^boundary,.*":
     description: Boundary Devices Inc.
   "^brcm,.*":
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
