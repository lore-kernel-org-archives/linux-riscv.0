Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D216CC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 09:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kqsCGMrP/cPECKGnx6SYw+nRyeqCCtW8EgT/SzCUmJ4=; b=JQuWOzX8bzIzaS
	cOaogbDZJrXSidsHe03chAQzQuf3NHZORTN4xWwZZYpwOeUDMyqPjxZIyTNWcjP/2kjls/cH1TMFv
	dXyKW6vNBHy8bB2/8sr1FfNj0uhQYJ7nyH8Hnv2jvZuYYHilx9WYowuffPHDlFssMsFPQ4UfY7mdt
	OvcGFRnYnYGyD0KlNhn8K4IBrPc57gIwBe9RRq8sMIXMOpqGKkoxyKzqM23BlONcGljBDvpbEHXkF
	oEmgY+nSmdZ3DpKOW0CGCKpwZGJirZi210BfUUKeFWb4UfXyuIGLrt10UwZpD/KzC1GcySEylc6Xo
	JIL4ZNHSkvLcHtF8g32A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfSl-0000000BezZ-0rlf;
	Tue, 16 Apr 2024 09:50:51 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfSi-0000000Bez1-3blt
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 09:50:50 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5aa22ebd048so3055860eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 02:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713261048; x=1713865848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2p5OSXn24EKOZqy7EDcmeeMFADHFv6owcaxiqAYNSKE=;
        b=V5Ru6Oa7zrFYxr0/sL6mtz3pNZHzTTZOliGHk3y2bQwqdRpCNQimlf21iUgwra899f
         sqQ16mOVFum7pACiFq0ZHfFghBYEBlDtviTHw8qVaD4zB4jaqcuunsJ0XJBVAPpI57Nt
         Jc6qnDRY7vlOetq2k+LaqqWasBQTPLMUm4gQpW03WMEdEId2kBQhEtc9+SUm6ritLFRo
         5g/mdUQFsITOJ8d03JQFGk5uCByk9NwxjnoUXn72AEI3JdrDeKDgsurppKUuWhZYtNCK
         x8VrmzK04/n9PVFyEOcFbwMzjWdm5LkYeX1We6RO3iUtGS/wzkbtUkCBXEy9JIdlByQh
         l8aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713261048; x=1713865848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2p5OSXn24EKOZqy7EDcmeeMFADHFv6owcaxiqAYNSKE=;
        b=Gd6MA3bmZX+xeE8RwPXjjYkSBUkeYOdCPJTVHmKOQ0/M5FlKmc6ZSof/+VtxP91RRv
         6thdCpculmPRblj+aORrj39HjoNozPmqzFlzHgdZoryZoV3tbUUPbgZUG4iXJ8MDW1ST
         NSOnqH8b+DegxGvMsl+nOXuLoOVvRCzfa41oAJVrUZFy87mtRvAk7BkboccGgqsbtmBI
         CMzPkyqUnCzESereYUWPPCb42Bnc5Za710pBsi2qIhaIFBcXe0PT07B5Uen2rME3aAAO
         vaWKlKap90g6iI6+yJ2ZN/eUQNdxuoMLjpj6tNsL6kdAdauZkOe8yzlTBIzm4UHJbcbQ
         afLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrSXJrG/UbDLEIpDWE6oGtsgZKxj/58mzuFCn/mHGhrVwdORnFjpQrVqTrbndN4lGjDvskCquTyT0c8F7RjWAYRRt+UURK7HYpn47mg02I
X-Gm-Message-State: AOJu0YyZO8jM1SiSspqA1905fZooXeyg4/ahgj3cnVQPpowowyGVe2Xi
	piZDlJ8qzJ8jBNOASy9SZWaCO4JcmY1xfwz4b16/64NOzLBC58AA
X-Google-Smtp-Source: AGHT+IGUJuaKo6/23XXIC/onjoXbCFQXGz0jHnqblFr3WK+l8O/XfNWE2Bm+VrI66kMAcwyD+8R2Ew==
X-Received: by 2002:a05:6820:217:b0:5aa:6a1f:f673 with SMTP id bw23-20020a056820021700b005aa6a1ff673mr13329923oob.1.1713261047983;
        Tue, 16 Apr 2024 02:50:47 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id dc6-20020a056820278600b005a796851f5bsm2458798oob.35.2024.04.16.02.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 02:50:47 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 1/3] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
Date: Tue, 16 Apr 2024 17:50:37 +0800
Message-Id: <032c06642b01f06c86ba8bcd2108d18c005b57eb.1713258948.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713258948.git.unicorn_wang@outlook.com>
References: <cover.1713258948.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_025049_095390_B01CBC11 
X-CRM114-Status: GOOD (  10.46  )
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

From: Chen Wang <unicorn_wang@outlook.com>

SG2042 use Synopsys dwcnshc IP for SD/eMMC controllers.

SG2042 defines 3 clocks for SD/eMMC controllers.
- AXI_EMMC/AXI_SD for aclk/hclk(Bus interface clocks in DWC_mshc)
  and blck(Core Base Clock in DWC_mshc), these 3 clocks share one
  source, so reuse existing "core".
- 100K_EMMC/100K_SD for cqetmclk(Timer clocks in DWC_mshc), so reuse
  existing "timer" which was added for rockchip specified.
- EMMC_100M/SD_100M for cclk(Card clocks in DWC_mshc), add new "card".

Adding some examples.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      | 67 ++++++++++++++-----
 1 file changed, 51 insertions(+), 16 deletions(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index 4d3031d9965f..a04ccae216cf 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -21,6 +21,7 @@ properties:
       - snps,dwcmshc-sdhci
       - sophgo,cv1800b-dwcmshc
       - sophgo,sg2002-dwcmshc
+      - sophgo,sg2042-dwcmshc
       - thead,th1520-dwcmshc
 
   reg:
@@ -30,23 +31,36 @@ properties:
     maxItems: 1
 
   clocks:
-    minItems: 1
-    items:
-      - description: core clock
-      - description: bus clock for optional
-      - description: axi clock for rockchip specified
-      - description: block clock for rockchip specified
-      - description: timer clock for rockchip specified
-
+    anyOf:
+      - minItems: 1
+        items:
+          - description: core clock
+          - description: bus clock for optional
+          - description: axi clock for rockchip specified
+          - description: block clock for rockchip specified
+          - description: timer clock for rockchip specified
+
+      - minItems: 1
+        items:
+          - description: core clock
+          - description: timer clock
+          - description: card clock
 
   clock-names:
-    minItems: 1
-    items:
-      - const: core
-      - const: bus
-      - const: axi
-      - const: block
-      - const: timer
+    anyOf:
+      - minItems: 1
+        items:
+          - const: core
+          - const: bus
+          - const: axi
+          - const: block
+          - const: timer
+
+      - minItems: 1
+        items:
+          - const: core
+          - const: timer
+          - const: card
 
   resets:
     maxItems: 5
@@ -96,5 +110,26 @@ examples:
       #address-cells = <1>;
       #size-cells = <0>;
     };
-
+  - |
+    mmc@bb0000 {
+      compatible = "snps,dwcmshc-sdhci";
+      reg = <0xbb000 0x1000>;
+      interrupts = <0 25 0x4>;
+      clocks = <&cru 17>;
+      clock-names = "core";
+      bus-width = <8>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
+  - |
+    mmc@cc0000 {
+      compatible = "snps,dwcmshc-sdhci";
+      reg = <0xcc000 0x1000>;
+      interrupts = <0 25 0x4>;
+      clocks = <&cru 17>, <&cru 18>, <&cru 19>;
+      clock-names = "core", "timer", "card";
+      bus-width = <8>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
 ...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
