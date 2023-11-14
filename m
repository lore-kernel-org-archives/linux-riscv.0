Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892ECC46CA2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 21:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15qxt39a7tkOqAIXugLAbA5hHZdPona5oJw2C88MBh8=; b=YkrJAkMNbKebDb
	ys+nGxBNFuyWQLwOcdC5/o56fsQHOj/dYK4fK1Ajb9P2uzkZOdwUU2vhN3RTDYd64H23K5DXgNwJA
	UDg1NUvBquuZgMSquIHkyEcO2TOp0rzOgJEzzIothJu2iCu42n/9YISmQIhYFNqoEb3HTe245iVGr
	5MK2NxLAZQBfX5qEUMsntp79wyBs5ZShKD0GV+uLyzd3J6nUC8BcRBkgv1sLoCm5StTwJm/nZ+Nbf
	9DON8RVb5S48u2iPuVTRy7wPDTwQdaVaCR9F8UIrYjXWp7/R1B3A00SYootUm/7JQkePcf6bxiEM5
	kOqI6pFS3ikaSb095mAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r30du-00Go48-0g;
	Tue, 14 Nov 2023 21:08:18 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r30do-00Go0b-1c
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 21:08:15 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3b2f2b9a176so3997961b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 14 Nov 2023 13:08:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699996088; x=1700600888; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6aHgY7dVjq1emLLBr9I0qdToBO/wwiRz9A+uR2RPk0=;
        b=zUH1welO1h2ieAHdSKNIVirzfE2bs2iUSKku9KEWx1pDEj8pridOAV2gIpLR/WAb5Y
         y7S9IzMDQXaL7m1CHS15OQYtOFPGhIoPlV9O28G5sJqyrW1JMaa+j0mFlJFjeS5MLteo
         S7eOnkDGR7wmvbCz9xFMcwc0yBQ37xL8TYR1iHIn+vRhy0MAeDfpOuh0Dn6WlcGPThRp
         3auR4VUDZiF9ElkUIGjzMOEjPW8zCVZxMiDbKzWdqP0KpzB0fHcEFivgxEyhtI+GAQBL
         9KgnFx4uhB2JBLCnZE/wrIAqamlbG8k8FzeAFHpzZ94GOy1kwNaztnXHT8JxYC23kMKD
         et2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699996088; x=1700600888;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6aHgY7dVjq1emLLBr9I0qdToBO/wwiRz9A+uR2RPk0=;
        b=BCz3yiTlbvGFtV2tPptFdjr6Wakgbb5/nSHZ5ZV8RBDd+WODB+FRgKV2Yn/e3DxXL3
         oskzMsiYYeigmnsKputQlDBHmWoyNopAmPzIgXEEdpjlUCs0dq3pj79OA0N4deypynbX
         Xy5VBxexuKZWbTJYspXxxCF4d80fRYNCi0bCBGmVwjA/ipvboSXGaci0xZ8p77GX+A/2
         gPIgGWK/Q0WEkArHaVj0ZRyxc3mPVbt/6S0EVECMOAYP/C4+pucjWLBCS8u0Ge6IlSRa
         3Ysk4OGPcKFGn32qSZuBjJ/1tsCkfdaFRC5xh1RwkQI8nYRhRBS4ubDOXbOjIoZZJkmc
         vOqA==
X-Gm-Message-State: AOJu0Yyz/fH89tZLMP+TyTOKKF6DTVuMwhQVCfLJ+HO121qt+S63UQum
	D4x3hLGL7zuRbSN9EJnwyZN1Ag==
X-Google-Smtp-Source: AGHT+IGC6dCh8CngQdS8ipJ/wmcb8gleqQAhQZL3+1+fy3Z7J6ygYty+lTHTkjgne4uoZ65ptYNAmg==
X-Received: by 2002:a05:6808:11ca:b0:3b5:a58c:cca6 with SMTP id p10-20020a05680811ca00b003b5a58ccca6mr15033179oiv.3.1699996088217;
        Tue, 14 Nov 2023 13:08:08 -0800 (PST)
Received: from [127.0.1.1] ([12.186.190.1])
        by smtp.gmail.com with ESMTPSA id x16-20020ac85390000000b004198d026be6sm3027549qtp.35.2023.11.14.13.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 13:08:07 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Tue, 14 Nov 2023 16:07:55 -0500
Subject: [PATCH v6 1/7] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
MIME-Version: 1.0
Message-Id: <20231114-th1520-mmc-v6-1-3273c661a571@baylibre.com>
References: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
In-Reply-To: <20231114-th1520-mmc-v6-0-3273c661a571@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@baylibre.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699996085; l=855;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=sdi2GBRazAXQCmzsLeFCtwwLCyPq9k+jdkf3IoMSdfo=;
 b=l8NAiEvdoppIB/0jKWUFZB8IbAYQ1k/jwcCXyJuMHrxJvC/ZlLI+hGBofEFwdHm6gNDYhD7qb
 7JMlwY2lmvjCOhL4yZ834jj1QaEgk2BEikRzjTYlyc0nYTCTRTeRttY
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_130812_543269_912454B3 
X-CRM114-Status: UNSURE (   8.38  )
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

Add compatible value for the T-Head TH1520 dwcmshc controller.

Acked-by: Guo Ren <guoren@kernel.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index a43eb837f8da..42804d955293 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,7 @@ properties:
       - rockchip,rk3568-dwcmshc
       - rockchip,rk3588-dwcmshc
       - snps,dwcmshc-sdhci
+      - thead,th1520-dwcmshc
 
   reg:
     maxItems: 1

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
