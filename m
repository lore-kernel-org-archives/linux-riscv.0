Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E34CDC5475C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 09:38:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TTtjQVjS4FIg8YtrCrdR39FYCIyLe3+fF/iiyrU1D8A=; b=CDXTT6QdmJmrl4
	dF8Q/K5TYUB2HrEz7XNi6tg7DqmcR6dR5emit8D5oqJzMGa5Gkp5lzpXDBQ3EDh3CSjOv1dhUfHrV
	0cG22fGl/F4ySfOS3h9/b65EPW/r+DCC79UcaQO/HbTNg3tn/oW8ThDBT2vvdrkFeJw52dqVDRSKF
	nI7t+SY0Ocxj5xMZHm65oTkzqtOvrfoAU0uKD2f8UyK/SjbPO53PFxxngvqUJPl6rIOfVTl1EBFTl
	teIjEGEzV33Wt6syddUpVZqFQ3dePdyZoMU3rMKu2QPA7OLv1HyqaiTLD/KGfCVEtq/a9Mnr6/riV
	SkjA2UZW8v2+liaNuCEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF83-0000000Ekvv-0glJ;
	Wed, 28 Aug 2024 09:38:15 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjF62-0000000EkCP-0Gr5
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 09:36:11 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4280692835dso9228135e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 02:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724837768; x=1725442568; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hC9j7IbumBMQnEMKyG95jmRuI5phudBOANwkQ4Y7dbw=;
        b=sBgNJ2CDAwAYVlnZxttrI6cL0eUj0IxsTyfRMHwruTfm7y5LpeHrap8EeaYKme2KiH
         ykYG3Unu4s253pzMuSxvsiiT5f553lol23chxDZwyj5XWnPzwHZNPfdfyHhWzYpKFVTW
         zjFNmX8bqgjJJU2F44BElabBgw9rPE+Oe5nDr3GJTrEAwpUzQNhdEa2sHLIpla9Y/2eZ
         Cr0v+moLYcDf61HrcflTJ91hFJ3RRksKN2D0wrgKzjuiYhT6Z9l7QmNab6CNVwvTh0DX
         2wCz34CifigIxofRTgR2muPXwoM3+yygbNzxXVsHQIwyzhZGpmokiq5w9H0IaG9jSExi
         ZE/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724837768; x=1725442568;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hC9j7IbumBMQnEMKyG95jmRuI5phudBOANwkQ4Y7dbw=;
        b=o9pjtuykPyOYHUZ5PgNQNtRpKzjmSRMzNSamzqqoDBkVTIfNc4gmzZDq3h1vGWYpUy
         YJ29Z6CTNaRWoJk2UVByORrGvUKbV7GJyLlvhcGkZBllo/sFIad6tYfVWg0b2X8Mhv3c
         pcN4ygzydprsFW3GmXq79zqY61TmDfDGJL1D1xnYy8lZZXPcsOgz13jaoOi+PlKndeo3
         n6q7bTZkkCiY26MREoKPwu106a//1k25vz8a3Yh6BdqhZquJjiv9O5CdEm1ITYcviFc0
         k7Wkk4Uy4SGX3b+7TBmpOx3PAfhBKiKn/SFfTwhuvxxgj6MvEJwpjygLKeJFdNpWFTRO
         tx2g==
X-Forwarded-Encrypted: i=1; AJvYcCW+J09apQqjB0tI7P2KBTNFxB1LHvmjX6Je18XN/bIGRvPh1YksE+rnFTDyqP2qmZ3JN5MHZH11LIJRrw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwenfuEtlvLBZwGIeFdPd2j56JVhrFVvrinpAwRD7ER8qWsonyn
	LlWEyXjrp4+oaTX1NO5gdJ19RIH8+TJ9WpN4+BV0Y8yGatnLbudoSCyG1goo4GKa/f9MkLjHv26
	I
X-Google-Smtp-Source: AGHT+IEB05FnP91FMO0l2HovbTESQKRe9ADpJRmnFhcHlQ0GZzcE4pg5vT+W4mPVe8NOnL+reyup/A==
X-Received: by 2002:a05:600c:4445:b0:425:7ac6:96f9 with SMTP id 5b1f17b1804b1-42acc8a55f3mr70030375e9.0.1724837767566;
        Wed, 28 Aug 2024 02:36:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ba63d7d3esm15270825e9.37.2024.08.28.02.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 02:36:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Wed, 28 Aug 2024 11:35:57 +0200
Subject: [PATCH 1/3] dt-bindings: gpio: fcs,fxl6408: add missing type to
 GPIO hogs
MIME-Version: 1.0
Message-Id: <20240828-dt-bindings-gpio-hog-v1-1-63b83e47d804@linaro.org>
References: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
In-Reply-To: <20240828-dt-bindings-gpio-hog-v1-0-63b83e47d804@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Emanuele Ghidoli <emanuele.ghidoli@toradex.com>, 
 Bjorn Andersson <andersson@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>, 
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=732;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=kIOSKTwBhCJNE2xIsjLzrlpi4h7Kklqz+lUuDimv5hc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmzu+BI3YnNLbD7GXCWVvb8IPUEsEVvnR7tGUMm
 fnaF2hkquWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZs7vgQAKCRDBN2bmhouD
 1y4RD/4kIDO9WQFkJe5J0o3puadA1mzoZjLceOTI/W6erd4nCkfkBl8dLOOsbEnNLqQdlS3svLt
 b3P4G7aRcKvhJxZkobZptlNOGxppkpJd4FD0JishQcRytMjO/fFUk70suDUcJBRJ0DjQ4IE3yv5
 0Dt0Typ6dj/ifqw3Y4jRd52LsawOxWfBpSkKGHPgTmpup6nVCsERkF4TY4rweGSasxFVpcXGi9Z
 Pihlg1+DTXQBEfVDFWZe5VuBX3aArl6cHPi9AlV9O2WpvNe2wYaGA8adpUChHqGUS1OQPsJDzq1
 I6FIZS3LCjCEBlFHHuCkchxpWB/3/W7+YqSNfRrS0qby+OCzMH6F55BpTQIAxxtanAJlC62naDv
 9bbxHIppITRogk9zPZTsSeh9IDSbYJ8wFoySiHQ81VlDi1VAnmpPbU7FiQIU+KeLoSGx8woo4b1
 0h46g4jd+wRdqAcUUqgdJ3wexn8BHvEz90abuaSm2KWEDSE+h1iTJ3LNDFnXRszUItkoxtqiqH2
 3HBN5FzPcaPowWVB3iHDgzn7VG6mM25RfaH3NZmvaPkYxoi44gVBwDRhaYzlAkjGwrlCsY4IUh0
 7HhPxrhF21phN/6UOi0Q9FP+lyJaZyhaDn7H33i0AWS30xtf62ttknUHPWO1lQtxaI4DsOwnfr1
 qb+psbOCgQcoMgQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_023610_222891_B6DE8A24 
X-CRM114-Status: UNSURE (   9.21  )
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

GPIO hog nodes should define type, otherwise "dummy-hog" boolean
properties would be allowed.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
index 65b6970e42fb..b74fa81e7d05 100644
--- a/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
+++ b/Documentation/devicetree/bindings/gpio/fcs,fxl6408.yaml
@@ -28,6 +28,7 @@ properties:
 
 patternProperties:
   "^(hog-[0-9]+|.+-hog(-[0-9]+)?)$":
+    type: object
     required:
       - gpio-hog
 

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
