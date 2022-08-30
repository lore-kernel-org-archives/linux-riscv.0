Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FDE9C0502A
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z6bHcN32CUyYKQU2SM/Oe2KFq6ZLj85MlfL9Pwe0jGg=; b=ohm3q+pO/leKY3
	EeBS4mAmBBcBcDGv8zvFraLEGCji637A3kqbrAgmchsfF/dLnlPiFQFEMBHdQx9vsHu24oT555ZdJ
	Xf1+EAOyaY9EDrUR2AUO8GDSWU6qJFdZePgSZ+NQNe3YbdxGq+p8iwP/cVa61+pXf99HtMPn4TEND
	5gxttvgx9mF4L+c6nhKKE1X0dBwN7oJBYTP1ryOVeIiWEyCmwkZ91UT8KuTfqDW9YvRGr5rkWlvkq
	49fZ+kk+etYzSz8P4snOB9Z8hWViMx1CJtGSdahjj39moO7G1TzXvl6Es2LhXRbBXb8V0b6sIVMpI
	0fGXM9D/7SuddFYKWhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0N6-00GpsG-QY; Tue, 30 Aug 2022 12:29:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0N2-00Gpq6-3u
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:29:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661862571; x=1693398571;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ug90OKgSPt4wB/1ZmaIV7HmjkMf+svSqXqp/wpq5qsQ=;
  b=n2zoNfVMRqpGfWVFvqVIGw3QRG/glzVKtdkDaQZekESv12fxRsSy+0mQ
   db22PI7Uy843D6EVVBrcBOahGhu13aLFU4EtoNI+zXU1NlNHBZRrpsypc
   6PSI0pxfN9ANa/fZeevDQSQf/I9EpqLw/KFXRRKYWy7dnlTa/fFABgCZw
   Gt6DkW+EzQOLdL0oKa4KiNKDFSgmufr3DgotrEEXhpGXPWcWX28heN6nr
   W9rybroTNfMaRFGG5HWSvOeqQKXRKh+XOOoVeN3Ma8ZGZYJ9VPPoyi5Wo
   fCJneRAHHDQUTE3w1A1hZkSLxSfHZXcgW9Obu8tSwjSIc04hTeMXSYF4R
   w==;
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; 
   d="scan'208";a="111375730"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:29:30 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:29:28 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:29:25 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Hugh Breslin <hugh.breslin@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/5] dt-bindings: clk: rename mpfs-clkcfg binding
Date: Tue, 30 Aug 2022 13:28:52 +0100
Message-ID: <20220830122855.2207752-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830122855.2207752-1-conor.dooley@microchip.com>
References: <20220830122855.2207752-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_052932_248803_12C87960 
X-CRM114-Status: UNSURE (   7.94  )
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

The filename for a binding is supposed to match the first compatible,
but the mpfs-clkcfg file did not follow this policy. Rename it to match
so that when other mpfs clock bindings are added things make more sense.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/clock/{microchip,mpfs.yaml => microchip,mpfs-clkcfg.yaml} (96%)

diff --git a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
rename to Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
index 016a4f378b9b..212228734ffd 100644
--- a/Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
+++ b/Documentation/devicetree/bindings/clock/microchip,mpfs-clkcfg.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/microchip,mpfs.yaml#
+$id: http://devicetree.org/schemas/clock/microchip,mpfs-clkcfg.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Microchip PolarFire Clock Control Module Binding
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
