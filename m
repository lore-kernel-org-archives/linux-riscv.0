Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1F1C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Nov 2023 05:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=15qxt39a7tkOqAIXugLAbA5hHZdPona5oJw2C88MBh8=; b=sB2R4s3GMZZpao
	u9kV8aYeMFl48DaFrht6/873SRNFIMqlAcScdbb1zgQ/vGSg0nlKj1HsXBFqzSSinY3QqYFBwAGBP
	T5UrJn2TKznUhivx8bTN7XT3Qv5JoSQjkDlkEl26uvYdtiwLNWIp2z6px+N+w0N58x0Uld81ikX+u
	1Hr7QNwssZYuJEXE5L0VOM5+EfaHKnp6rWhBTwK9bzEbczMCjWXg/kgZCd8Ss02HB/XLd6Pi35ynA
	F4t1AXLu3zzs11memYAISAT5f84/aDR6XGU5PWcles7sfpuYjUQHGuc1zzrML2xKyJ78t8AEFw7zg
	a3NF10e+gtghCvdNOJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHm-007u4v-2q;
	Fri, 10 Nov 2023 05:42:30 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r1KHj-007u4K-2i
	for linux-riscv@lists.infradead.org;
	Fri, 10 Nov 2023 05:42:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1cc5b6d6228so12818295ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 09 Nov 2023 21:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1699594947; x=1700199747; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6aHgY7dVjq1emLLBr9I0qdToBO/wwiRz9A+uR2RPk0=;
        b=Geameas3HaIfYS/DdQ9nkfcEulzBxd58wA+PXOhxyZstFSSUVBarJXRDo5f3ULdx4n
         9erGfZJEzFZcReFguyfiEhBH4LV99z5DcpoRdvHZvrFNlcyyBJDD/zWQfxC6ajf0iTC/
         F1HhZ3XqjJKN23NzFaJUc/bmq7ohJS3Nc5xULgf7OTp0AisDi120YjytxoM3GwuXOihx
         WzSoKJ3Kl2wosWqrILPRj5BZg4w+b4YDqeRCYwcMkjlwmZjEaBzitzSAvof284AmYQf5
         S/hIm6auGGwyuFDzSrRD+lANMWLxuVle8DpGsbIkl/U5N7mAuJmzMWxNPJtxdpDDqimi
         cebA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699594947; x=1700199747;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y6aHgY7dVjq1emLLBr9I0qdToBO/wwiRz9A+uR2RPk0=;
        b=Yp/a9Xm7SpKmGwYeWvcId5oCyIntpyLoGCETuFA14jRUhW8I9n7FZBNxwBnKBNT+N8
         8OzTE6dOh/fdhG7OobP/2+1hCvvlgNQzjSc5kKO7SnPKbZnPyrJgEZFP7F8sqIe81xt2
         tfGLzRoLBpgpbAxnWy8JkiReiu8ZwvgXLaR2JaohieAEnuh0q4pHv5bMrHng5ChekowI
         MAKrRD/kFTju3fM9cvRTscv0PBTahXi8o6ynaIGWY7bmQ9U+G4pWcXwRt2eAuczZR4KK
         rdi9qqn2gdkL7kYEaMhEE6CMHCQ5dcly58mnsyWT5jU6CdzH2e9y9Gm6Fu/S4qHf38qn
         4miw==
X-Gm-Message-State: AOJu0YyIkiLF6CQ0q8OJmRF3tqVyNXrVhBW4cYrOIyULzLwSIz0zaV1P
	BLudbDb9zYQF5vuO9l53ZVZ3cw==
X-Google-Smtp-Source: AGHT+IFpFkfHNHBYhJCAUHAcswVdjopAz96NNqXsNMtnhZD1PCclguvJ4ptzgVdeIGhBXO4+11fEaA==
X-Received: by 2002:a17:902:d346:b0:1ce:a0b:7314 with SMTP id l6-20020a170902d34600b001ce0a0b7314mr525866plk.61.1699594947284;
        Thu, 09 Nov 2023 21:42:27 -0800 (PST)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:2071:4479:98b8:cc69])
        by smtp.gmail.com with ESMTPSA id ix22-20020a170902f81600b001b8a00d4f7asm4498845plb.9.2023.11.09.21.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 21:42:27 -0800 (PST)
From: Drew Fustini <dfustini@baylibre.com>
Date: Thu, 09 Nov 2023 21:41:11 -0800
Subject: [PATCH v5 1/7] dt-bindings: mmc: sdhci-of-dwcmhsc: Add T-Head
 TH1520 support
MIME-Version: 1.0
Message-Id: <20231109-th1520-mmc-v5-1-018bd039cf17@baylibre.com>
References: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
In-Reply-To: <20231109-th1520-mmc-v5-0-018bd039cf17@baylibre.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699594943; l=855;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=sdi2GBRazAXQCmzsLeFCtwwLCyPq9k+jdkf3IoMSdfo=;
 b=ugpumf9QoPxX+bSKCeojrp6bqXrSAnaGYhOubo1XOKWuUAe+aPIamwK96g3G9BlWXJHvQsys5
 SM5IH7XCovZCPWuPcsoCJ0439BkT26SbduFWhm4sFfHz07D59YfWw5g
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_214227_882048_8452B8F7 
X-CRM114-Status: UNSURE (   8.49  )
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
