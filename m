Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D36C0015E
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jul 2023 01:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQg1ahSSjll5Xr5rlqJEUaeCfdj4HWONTDkyuQFXqjs=; b=sL5UQYSuNdkfXp
	TvaT6nV+zwm5GSxjh07eT7iezxPkAYez3W0/WePx7+jjAYVYLqk/dHBzGiO205KgZPjWqXXb+/wvg
	OoaiaxpDLGeEW558y6jwckoGzZXUC5DJDnONGSSOLBx7vIht4ss5xsHtMSefZI6SXOVsiRmPcjpYk
	TAX/wHkCiHUgIWU3CW2ZLRwk6/5800aoD6YTa1G/ohmjxcC1mXvGXs7TxWxJyD3i+zDD8cHyJ3zrC
	nDhfyz38UGEz/ElaTueNUZix7MdC2GKK3MoWwHUFn5EAbFqapSa2s7b2EYLvkpV3mc6UKK65n5+eo
	32lDr92PhPkxwYcvi1yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Py-005nW1-2Z;
	Tue, 25 Jul 2023 01:00:50 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO6Pu-005nTo-0Y
	for linux-riscv@lists.infradead.org;
	Tue, 25 Jul 2023 01:00:47 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1bb575a6ed3so1529737fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 18:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690246845; x=1690851645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GEp58o5jHhf4WpbbQN22nWQx0p8/zKOYMNnof7eHdFk=;
        b=vQYUIaP3UkOWg+UUsUvtJtrQeBkFRh2XYqhD/95/TJDC5tf8+Sxd4VYFWC5Qzp/DEa
         1+J3CECCqJYhp6+EgvglH4ZqQ0VBS168afINnhIjGsD5jZUh9tdtFonMC3JwySuSgkP0
         kdHC0TcCRCsnjY0EOZrhB3MFX/e6Gwf7UuEsCfMXSkHKkJ7g+Ht+16r5YgJdFstm2sE/
         vdBabJh+hBe0a/u3QHX92/XIRR3HGtSY4N82AJLpFMIZJP8KAM76Bi+b6OqGHsP5uaxx
         YTcNykj6Tplcgg0qhI7b4Twowz7OWDbyWitEkx0TdwG0P70Er1rDwN8BW6EkJJBM23Z8
         nz1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690246845; x=1690851645;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GEp58o5jHhf4WpbbQN22nWQx0p8/zKOYMNnof7eHdFk=;
        b=IPgEDuHubXF/sXwxQJLx41r4B0qV2o4U/OSxCsFPy7rzsLV8TJYOum//rg3UX53Y6R
         NxkWd6nyQUoSfqXx9XAPoDCFcG6+8mJDIN/a8nHBQLFit45ltQWZiFNFFgEPECN4NX3S
         wt+cB2NyjwYHPVRj/TmEFsviImuQcDeDS4+7pU8maPPN/8XF4dQTk7/gw64GApkB/EiP
         v343hOEr0K1wgeRBn95F3hq1bm71XNhl1a0Pb1N8cuS7ZBLYD7XvDg3AEkzfqaLGdotF
         wbwAFihizOSPKB+wv0rJWWsYUE8EJPGC94KEVjlf7ArCrK7QkK1fyHddalwePZbxkOnK
         +qnw==
X-Gm-Message-State: ABy/qLb9TPyOWNtpm6WgokWxrS/nCcJt3KWjOQHPyWZj9OoSjs4fTfRJ
	8zlzLVxKkLXCQEDKH3ld3u/byMCPPRLl/XDBMv8OOA==
X-Google-Smtp-Source: APBJJlGYcDIG17o3mn7rt/BZ3kSGI2riAzNxr3+T4CZvjH8BN0WgGybsiUplpUKV0LnPk51YAiQb0Q==
X-Received: by 2002:a05:6870:a2cd:b0:1ba:9a49:d967 with SMTP id w13-20020a056870a2cd00b001ba9a49d967mr12042723oak.23.1690246845066;
        Mon, 24 Jul 2023 18:00:45 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2cbf:9196:a906:e222])
        by smtp.gmail.com with ESMTPSA id h18-20020a62b412000000b00682a75a50e3sm8576900pfn.17.2023.07.24.18.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 18:00:43 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 24 Jul 2023 17:59:15 -0700
Subject: [PATCH RFC 1/4] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 compatible
MIME-Version: 1.0
Message-Id: <20230724-th1520-emmc-v1-1-cca1b2533da2@baylibre.com>
References: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
In-Reply-To: <20230724-th1520-emmc-v1-0-cca1b2533da2@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690246840; l=752;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=N4XyeVof9hR52mLfjwIJ/Ek5oPrydhGBm0Gy7EtJsFw=;
 b=0OVYnsUPwsHTJB6utTUVvs+L8qB3QLAy9tLpLZXXUDTXz4CyeazHaGQ1XaIA7MYQNO7XeP0HB
 NVJqdcnkvQpAIxMHf7GEH1Vd/Pyve0bmoxyOFWcaiQtG8jPD3agvxxh
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_180046_211245_3A875C40 
X-CRM114-Status: UNSURE (   8.04  )
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
