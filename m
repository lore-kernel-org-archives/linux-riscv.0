Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E045BE7D0BD
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Sep 2023 01:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pDwNSiK9VuIIa9uYOpoNK2FC5BnlqV4AI7q6v516qow=; b=ASHShK+SHVPwUY
	FejDbdy3ezWFYAcFQ6ZgmalGDikUe/u1B03a2FoyRUWmm0GabJdn3zcN59Z12ylCMGw6aPsduQaxP
	GSAADxqi6jmBNWOREf7OwbjiZX7P2piebdcckTfY3Wv1SSweuPekUF7w1tTAwi2lqRLeQDGcWsfpv
	mH0f7B1EJsPyheG7+H0NAPrJsDAisxKuk1VESdoTahmjg9619T/igdJZsP41b3ja6yNieK8F8QLJH
	F5jmMVXVdh5kv+3m87c91xAKwwknyjz8qsKD+LjkoEJg6d2DEUGGmnYL0ezT+456Lh5dfhSgEF8v6
	bQrT3emXa/LUcNtlZBOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK5-007aYw-16;
	Fri, 22 Sep 2023 01:51:13 +0000
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjVK2-007aWi-1L
	for linux-riscv@lists.infradead.org;
	Fri, 22 Sep 2023 01:51:12 +0000
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-3a88ef953adso1006277b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 18:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1695347469; x=1695952269; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AdU57Jx9PEmIXARyS6MsKYI5yf8mmNXKxZvGJyz9CZ0=;
        b=s74GbAhWhEoo2Hj+a+7/J8fHEWrdCNwiRUTqkRbZqiF/A3J4IvfI6g3diw+VDkQITw
         1/73Gzu51v36g4iNcM25Giw4bkBmjCvZ8LmjPKQtVkq6SbWu+MN6BEOWKOf9QKOy6T1q
         rBaL9rCTuPYPZlaOvUzxUMut5bo9uVSAdinosHSLU9bJXjgDaHjgYw/Rat6qWugM3rXe
         NsIoE1N5mBmX+T2YBT4pMyA0WVChsvCXimomDCE97ZYDan7tcih7wFg6ycDZHE2G9TNR
         iwKppTije+GklH6gWrJ2ildDx5u1qLhYjHFwJSaCQ6I41wWtzMHVjm1aBmX7Lx2OJfAv
         zbIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695347469; x=1695952269;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AdU57Jx9PEmIXARyS6MsKYI5yf8mmNXKxZvGJyz9CZ0=;
        b=oVd5kZMB1fAw1tF7TymJgeSbDqMlRDPJv/4SfQEXTtN05loSKBu9ysmjPAFDpBfSg0
         f5szFtQsERW7To85x80m6UP/kcuHk7/eBn+FjgMPBx77AtbODAFNHUuEPKry89MEEyTM
         Zo/PzQQBnh3l1dN98byGtt3xU/us4CtQHSAtjQH5QE2qDKWjN41kZ3jEg+HkEJPzR+8h
         uOBAiAcBAi6xyAh+qydMxPCWyily8t6aMQc5XbnKgPU9/r5IAVkpODMPdjdDvl1226gw
         y+1TK/fZUHqnQJQ/CphHMK6bMNMDzBykL7Q6Nn6whaPB56e4kk8tWZEKVovQAQxiyr7t
         I0mw==
X-Gm-Message-State: AOJu0YxyTDf5lmT1G7yeZptQFyRMJOlAa2y/E8jGujNcfB8TbfjMuKdo
	bcJPWyzFpvRLIflAmvzI45juKw==
X-Google-Smtp-Source: AGHT+IHBIOCNTfL32DX8sqcPvGCoAvfb0oRHov683BI2vSEw1XFpc+I3dbfeffGIcS9K8qEUO9NE9Q==
X-Received: by 2002:a05:6870:3293:b0:1be:ccce:7991 with SMTP id q19-20020a056870329300b001beccce7991mr7369865oac.13.1695347469207;
        Thu, 21 Sep 2023 18:51:09 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:fa26:6227:be1c:67f0])
        by smtp.gmail.com with ESMTPSA id y10-20020a63b50a000000b0057412d84d25sm1973856pge.4.2023.09.21.18.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 18:51:08 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 21 Sep 2023 18:49:48 -0700
Subject: [PATCH 1/6] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head TH1520
 support
MIME-Version: 1.0
Message-Id: <20230921-th1520-mmc-v1-1-49f76c274fb3@baylibre.com>
References: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
In-Reply-To: <20230921-th1520-mmc-v1-0-49f76c274fb3@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695347467; l=1067;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=lVStiUHxeHbyNt2+zib4d2cdPudtKK6oNMBUQREoPOc=;
 b=Q8id6rVsSYwP6E+iXtE8EEJBdpfTwGmm0EDwKwz276FYyD9CgqZLnz0ACffcwGavDc/d0fScS
 a4r/IUtRvh1A4kShsI9oBwJNbY9Otbdr+VEmtnmc12pL4kS6vyLRKBn
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_185110_678804_F20ECF52 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add compatible value for the T-Head TH1520 dwcmshc controller and add
thead,phy-pull-up property.

Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index a43eb837f8da..46b768d46712 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3568-dwcmshc
       - rockchip,rk3588-dwcmshc
       - snps,dwcmshc-sdhci
+      - thead,th1520-dwcmshc
 
   reg:
     maxItems: 1
@@ -60,6 +61,9 @@ properties:
     description: Specify the number of delay for tx sampling.
     $ref: /schemas/types.yaml#/definitions/uint8
 
+  thead,phy-pull-up:
+    description: Enable weak pull-up on PHY pads
+    type: boolean
 
 required:
   - compatible

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
