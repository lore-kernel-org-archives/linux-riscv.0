Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C5FFC0018A
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Nov 2023 02:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15qxt39a7tkOqAIXugLAbA5hHZdPona5oJw2C88MBh8=; b=StPjy0kA2BEg4A
	2vTwng8433YG7dGe5YzVGQhL92vfy55EUQxzSTC/v2oLGtffHL2HLKsXqtJfcm7QCFeB+shlbjNZ3
	ZdNr/3xR389ZUWLp623TIs8Q/Xee7G9DHC/vh6N89K8JFTlnftszbnS0W3fXWosoLsX5p1ScZcUR4
	fmpApNHx5I1KVdPTus/LWNYZ+d47hfyTCCVYH5Gccevk7p0c9KzdmO0fmQBAzHqCHGHFniFEMkOsw
	lT0CCQiZDjuZ5Zr0Mm1nHVZWp91i8wMEImc+//+zHGIA5yqcNzALcu0jOPGecs/LeIh72eO7sCxo0
	bZNom6Qs3H1xiBBwrsbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNli-008a1s-2u;
	Thu, 02 Nov 2023 02:49:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qyNlf-008Zzz-0v
	for linux-riscv@lists.infradead.org;
	Thu, 02 Nov 2023 02:49:12 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c9b95943beso3714005ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Nov 2023 19:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698893349; x=1699498149; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6aHgY7dVjq1emLLBr9I0qdToBO/wwiRz9A+uR2RPk0=;
        b=A0KSWS69QQj2Doy+U/aAYWJFhzEwrjDoZScgWTy8PWoLvh/yaHmO4Wbcm5JrWWlG1T
         00IU1ImC6TtHtY0H/GA6QEtwFVEThUD5SL0Y3QeUoRjLURrrDtod5fZz9rojfLfgy6kX
         XAlkRIjYyNjuVAexOJkhVtUsbL3/K3cftfbhLbK2v3U3aa7r/ep9ZoArVa2UQTKK6xgM
         V2isLNRuMdXvVp5HU1+j7eAEsLURWBterX6zAGjHnxVV2OL2r2u5Cf0EMeFuZXFXB+wO
         LCq9vL9c/W8TJUaSegVk7W3/yXxZtrBJCsvVoMjpwMd8iNj1BpO7+/xWtghDXUBz26Fi
         oeWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698893349; x=1699498149;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6aHgY7dVjq1emLLBr9I0qdToBO/wwiRz9A+uR2RPk0=;
        b=WM/oO7VXXimhvQPcuw8IM4HsRI4N7SHPch4KmDIRuWZBXcjIGMbANGe+rHW0wMIbwH
         2iKO03uosgEtQrwyn0RbPqWMzVEts2U61vzOJEztOYY6iVMff8/hLNirnJPR2rVZKow+
         pEMiyxuSih6so13BoTTUIb2Zo6NPaQRiI3PLDONlujGWNb/8VD8NF2VtQxD9UY+v6F1w
         R61/KjKm+xx9HIMXlvG+n2pqGJbkKz4kUCNa+NxRKP+jcr4QQmavFjJRFsUDM6HExIC9
         fcruDW/rWuwZvwU9EDhVB1mBgmIVR6hjhLffd16DTlcCGtOdX6Kz6JeY3cS9m0yvjC44
         hFCg==
X-Gm-Message-State: AOJu0Yy/YrPBiEfnWPQ8KqDGLh3E/+ul0y918WDwMaCDVDTZhCxpC01O
	mwFjgc5zZh7rbOFyIaVW4+10ow==
X-Google-Smtp-Source: AGHT+IFJRRc6LBUGsDW9ZAGafzrBM0gNGpEPwmu96hSFHU2mmeWEtKtj688InhZr3neYv/dkS/dxwA==
X-Received: by 2002:a17:902:c78c:b0:1b8:954c:1f6 with SMTP id w12-20020a170902c78c00b001b8954c01f6mr16004599pla.36.1698893349593;
        Wed, 01 Nov 2023 19:49:09 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:7e4c:4d4e:6943:bc0f])
        by smtp.gmail.com with ESMTPSA id n4-20020a170902e54400b001b850c9d7b3sm1925787plf.249.2023.11.01.19.49.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Nov 2023 19:49:09 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Wed, 01 Nov 2023 19:48:52 -0700
Subject: [PATCH v4 1/7] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
MIME-Version: 1.0
Message-Id: <20231101-th1520-mmc-v4-1-86e0216b5994@baylibre.com>
References: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
In-Reply-To: <20231101-th1520-mmc-v4-0-86e0216b5994@baylibre.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698893345; l=855;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=sdi2GBRazAXQCmzsLeFCtwwLCyPq9k+jdkf3IoMSdfo=;
 b=H4G0SP7skk6Qkcbi+uapfpuNbAmQTW/dR3ZoBNmECYpgjatiRsb97dClg0sTNqpZ4Jlitliv7
 IQ3UFs6gNtTCBp7USBUipzcGlL3y+nqr907S94xunPmACrwIsm57q05
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231101_194911_323252_20DE11F8 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: devicetree@vger.kernel.org, Drew Fustini <dfustini@baylibre.com>, Han Gao <gaohan@iscas.ac.cn>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Jason Kridner <jkridner@beagleboard.org>, Xi Ruoyao <xry111@xry111.site>, linux-riscv@lists.infradead.org
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
