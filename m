Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECFADC43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 13:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BR2h51F2g6znNqERnlXUwT+cSr5e8aevc/T8/J4jRU8=; b=hZQ0XQvx04/yeP
	5eRm0BtN7JYwCl0y8qEmJSVaax6BXuI/1cSkqvj8zd+AIqyb4DWJ/drE5P5z/dHeV+upb2KDJhNr2
	tFja/FO93BOeZTkTR1d5iln/yMlHphQ7pudAlgnaAr9YEnlHkgFyDyMYR3fM7fJgl/QXLgI72lqZV
	fPon/OxXzGnRTwxZXqF6DSJlc3dslEnGcaTJziZmg58WY0SfAqUuD1UwcovTP9PsalxxZ5SMnFxWq
	gxP69h37LRExJFGlJZFvuXVe2F5Pxdklde7dow5O6MSxwbN5gpW0vQPQYbIJjPIibocBltX/lXY1l
	l7wcJqn849K5hjJw1+tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyC8X-008hJZ-2W; Thu, 24 Nov 2022 13:19:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBwE-008be8-3J
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 13:06:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669295206; x=1700831206;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=jkht1lqZ+yao+3lR7ZjiS5rsmbUp+VlY/aGj4tz6xiw=;
  b=vZSRB/vrqLIKAW0wvTSHPdSH/gGIgAcFy/pmppL0b/Szcidir6NFsiKN
   ZXqDcOTXy/jDGZwPXRPM84EP5lO482xaxpzmAlmjEiRmLqFD0DZEY5P3n
   q+nu4nvLZM2d4VHwxVfb8ig2gPG3RnlIv73gpw3E/sAyuqf8T+CbRfCkQ
   J9X+Npl5xG+M8XsqVru6v7Zv76hLm5hnbCNuq6fKfvXxtsYbRwgO6RQrx
   ooEJTlXcnyKhJl111zYNPiZgZTfI+V1elQ9EZU+NhL6jSeM5o6sDav7Os
   jIDbf37vl0t+bzW00IvBx/r9YAqLTnveBt1DSsGIGzDaieq2uI/FSyYEN
   A==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="185029556"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 06:06:45 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 06:06:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 06:06:42 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Andrew Jones
	<ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] dt-bindings: riscv: fix underscore requirement for addtional standard extensions
Date: Thu, 24 Nov 2022 13:04:40 +0000
Message-ID: <20221124130440.306771-2-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124130440.306771-1-conor.dooley@microchip.com>
References: <20221124130440.306771-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_050646_255899_6416212D 
X-CRM114-Status: GOOD (  10.17  )
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

The RISC-V ISA Manual allows for the first Additional Standard
Extension having no leading underscore. Only if there are multiple
Additional Standard Extensions is it needed to have an underscore.

The dt-binding does not validate that a multi-letter extension is
canonically ordered, as that'd need an even worse regex than is here,
but it should not fail validation for valid ISA strings.

Allow the first Z multi-letter extension to appear immediately prior
after the single-letter extensions.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 90a7cabf58fe..e80c967a4fa4 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:_[hsxz](?:[a-z])+)*$
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
