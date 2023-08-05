Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF9DC04E69
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Aug 2023 03:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T2B9/KTiC7FVTk8CNa+JrwXLaVpilkglJXn5U5Mh9fc=; b=sNRfIEvfgY1yFY
	Rx7pKy9QQmBldVm3Sc+ipjkL+8uUFZJMFMezpZmfsJvEiCRWi8Il3LMPUl5BacRcylIntjPVSI1jt
	KHTJGqvBMOdjCIeeD/pE9CEtPYwtVpSXUsBFB/By8w3ssOvwOyTHPglr/FTtmcu35TsCGDTt9ei4X
	ZXOOWRW53/2n4xJbZgmPDOsUp2cRgvBXm6iFHrO3R3ePBrVaTwE2ntynlbfmEg7m3qP1H/KL5CppS
	AMlopuz3kM5cYl2lJVVyP4QttsZYJfeGj6HPJ8VkU+zBiA5Wy3wHO4ZHJfRx5nY8JSq1KdNcXhW6q
	j+Q55crfBRpKGM1h6xyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7lB-00DcHU-31;
	Sat, 05 Aug 2023 03:15:21 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qS7l7-00DcF1-19
	for linux-riscv@lists.infradead.org;
	Sat, 05 Aug 2023 03:15:19 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc3d94d40fso23392495ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 04 Aug 2023 20:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1691205314; x=1691810114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qKcPemMGXOGkd6e68fBQ7r4rih8Hsd/tMIAFH2zBKKY=;
        b=U9I8H4H2oSIiHiOYExHzDbtlEabitxKvBb85zzo0r3kYZ6LI5LNB4FdOfbfx9fW+CS
         I18MTXDsOia6GwK/EaiQtLBaEXYAxJhtyGV6rUdIpPPTYVLBaHiC58bVnDkZG5khGWS4
         S/Sm67JmUcT6KSvSYPyRUuElVgQqKIeqbz7BNVmjWMJyw5BmNgCZQfXFu0BsSrKP/B1y
         ZJtjE2W7iJVx/r2vONa4XeykBpdVvBfpbg3TnpF87W+C+YCIwUP/jrUbfXVCng7E9Xbr
         CM1oxTtUzu7e4+Iy7+BbFj8NPKmqBxH67qQEG4lno0ULzNVPG9N8ScrbsW3jubkcIbVn
         V9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691205314; x=1691810114;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKcPemMGXOGkd6e68fBQ7r4rih8Hsd/tMIAFH2zBKKY=;
        b=icKY1i1ibeKY6/ZAocP8P7va6Tra4QqDuIr3UIXWxBWu/XDEAR4oGw40xPYBeuTGYi
         1O9xJBRpyXYgGUxZwJKs/WZzNOEuZu+q8aDOjFIrTWKjB7O5GeZ2e4bFEPvz2o1JPCA7
         hYxNbAAJ8k8uSPc3JIVLZ2c9GV9Ufx9TEgTQYOEhnsDNnxj3gYko77dLjJv8TeU2OmW5
         WaOQ9hEdlpRNTGuEsVrdeJjNHLz2z91LoiLftDQj4R7HtAlR9AN9gKKz7/yrnpqW0tY6
         uMntCDbBOgVv2MTn1aB8+oAkzXwniJK4Pfjn7lklobo/kSk4aOkHfYp95bUB6HGLFu+9
         PuiQ==
X-Gm-Message-State: AOJu0YwFnSbCxfMBKEuH436NpMSjNN/6nbqAy1SWx6pkgIvXOYRMDNAc
	z7np4a9KmwZHnsGWKeiqeH6a9Q==
X-Google-Smtp-Source: AGHT+IF727UsB1OR6XS/j1Pmf2w+TyT9qGOvl5s/PK4idgD8K/HaVsCLAuTp3MqO9Y2YOQmfrB930A==
X-Received: by 2002:a17:902:da89:b0:1bc:2437:e54 with SMTP id j9-20020a170902da8900b001bc24370e54mr3797471plx.24.1691205314561;
        Fri, 04 Aug 2023 20:15:14 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:e1a0:2f9c:e6f9:e66c])
        by smtp.gmail.com with ESMTPSA id h17-20020a170902f55100b001b864add154sm2412145plf.154.2023.08.04.20.15.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Aug 2023 20:15:14 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Fri, 04 Aug 2023 20:14:45 -0700
Subject: [PATCH RFC v2 1/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
MIME-Version: 1.0
Message-Id: <20230724-th1520-emmc-v2-1-132ed2e2171e@baylibre.com>
References: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
In-Reply-To: <20230724-th1520-emmc-v2-0-132ed2e2171e@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691205312; l=1185;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=3K5rDs8cYMn2D0gb/trpA7jiBkfDo26+066jZaEVEao=;
 b=s97bIRVyIikHucjhtT5xHg6IE+2nJkWw++h9HqF38zuLSXpBN5TObT50Cq6e4vAfFPT3/ekl1
 v33K7rJ9RVLAuIBoLMoXCyjGyiH993EE9BTsK6JRgLspdZdKbuBOumq
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230804_201517_389434_AC3BB017 
X-CRM114-Status: UNSURE (   8.45  )
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

Add compatible value for the T-Head TH1520 dwcmshc controller and
thead,io-fixed-1v8 and thead,pull-up properties.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index a43eb837f8da..57602c345cab 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3568-dwcmshc
       - rockchip,rk3588-dwcmshc
       - snps,dwcmshc-sdhci
+      - thead,th1520-dwcmshc
 
   reg:
     maxItems: 1
@@ -60,6 +61,14 @@ properties:
     description: Specify the number of delay for tx sampling.
     $ref: /schemas/types.yaml#/definitions/uint8
 
+  thead,io-fixed-1v8:
+    description: SoC PHY pad is fixed 1.8V
+    type: boolean
+
+  thead,pull-up:
+    description: True if pull-up, false if pull-down
+    type: boolean
+
 
 required:
   - compatible

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
