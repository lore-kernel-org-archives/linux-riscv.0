Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B65C43217
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Nov 2022 13:19:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CnPzD9ixFOeztmNp5epJuOYNL2fkMwQDeeFu+1Y036M=; b=LUWc74N+iu32P1
	D0MnuiIh4FNXs3Fh/VIsEkk3yuvRbfks5b9c1o9IuK3HIaDkhScJHndSkSIkxmE225caQvp8YponK
	kyzoB3EJkJ9/OFIvo0H1ITEDyv4Lzw6kIR2T+TBUSKHFHvR960i5Qt5l0L6pv5vVfKi28p6UzcvKb
	hGUqUSGesmNti+PfsCUpoFmS4pnJZge8I/vxGscCqySpd//HUgt25HARa4RyLQsJtXpkdUliw7l6P
	NSq7gIOMVhQg/V6Yn8rqHlLcgr8A1YbjIO96MOyveem4wqmbN3kNRm7Fitorq2587tL1bABxqPYfX
	Irzjb+c8Ja6w4dS//tzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyC8g-008hOD-AB; Thu, 24 Nov 2022 13:19:38 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyBwI-008be8-8G
	for linux-riscv@lists.infradead.org; Thu, 24 Nov 2022 13:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1669295210; x=1700831210;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FiSAjUP//jwoQTutDktLJhnEZAB0uB5Do8E7m18RsKE=;
  b=TrXY+1j7SNBC7aaDj05aGEGvDSZH2wQ1t5WOPi0m+4pQTWgFOm1C/7ov
   Zl+YToHq2/egGq0LncaE3uHyNmjnPsS4Q0ISMJ0YfeYJZqpRxfZdg39Va
   nmYpjuu3LmD21U6YfNB8CWGWllSezvFex9RipWcUCeNNjni6NQYO26dRr
   pe331GOGLV8f48LILSXD0KQwfAGjolh8loERiZIq3iMPfxbdngPRqO8+a
   kpHONxjca27KbHf22q0nCY9IFy3nhUohclxCRb+qwBS74CdfC4ohpZpYk
   kJ2WOgVqBGE6G10heuiGOvFXvbxERmaacAm+7Ma8/XyaHUTvxVkxy3oyJ
   A==;
X-IronPort-AV: E=Sophos;i="5.96,190,1665471600"; 
   d="scan'208";a="185029601"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 Nov 2022 06:06:49 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Thu, 24 Nov 2022 06:06:47 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Thu, 24 Nov 2022 06:06:45 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: Conor Dooley <conor.dooley@microchip.com>, Conor Dooley
	<conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, Andrew Jones
	<ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] dt-bindings: riscv: fix single letter canonical order
Date: Thu, 24 Nov 2022 13:04:41 +0000
Message-ID: <20221124130440.306771-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221124130440.306771-1-conor.dooley@microchip.com>
References: <20221124130440.306771-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_050650_385484_C8211BD8 
X-CRM114-Status: GOOD (  10.00  )
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

I used the wikipedia table for ordering extensions when updating the
pattern here in foo.
Unfortunately that table did not match canonical order, as defined by
the RISC-V ISA Manual, which defines extension ordering in (what is
currently) Table 41, "Standard ISA extension names". Fix things up by
re-sorting v (vector) and adding p (packed-simd) & j (dynamic
languages). The e (reduced integer) and g (general) extensions are still
intentionally left out.

Link: https://github.com/riscv/riscv-isa-manual/releases/tag/riscv-unpriv-pdf-from-asciidoc-15112022 # Chapter 29.5
Fixes: 299824e68bd0 ("dt-bindings: riscv: add new riscv,isa strings for emulators")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index e80c967a4fa4..b7462ea2dbe4 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -80,7 +80,7 @@ properties:
       insensitive, letters in the riscv,isa string must be all
       lowercase to simplify parsing.
     $ref: "/schemas/types.yaml#/definitions/string"
-    pattern: ^rv(?:64|32)imaf?d?q?c?b?v?k?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
+    pattern: ^rv(?:64|32)imaf?d?q?c?b?k?j?p?v?h?(?:z(?:[a-z])+)?(?:_[hsxz](?:[a-z])+)*$
 
   # RISC-V requires 'timebase-frequency' in /cpus, so disallow it here
   timebase-frequency: false
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
