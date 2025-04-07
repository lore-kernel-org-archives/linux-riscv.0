Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01394C36002
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IZfLE6B88uvYYpxzD3D1ngpgJaZu7VSNc+CJFyMUI/k=; b=dgfHtjQ/G7L7Vw
	Z1aKG5MOHXvWSPJFDaSqCSOrRp8Ky9l8hT9PjzWBKvP7ASCeRLwPtJbCIsksYTpy+fHonoCG/ioPV
	cpi7neeIzQDr7xQmzaScnRlHKRumO28cKbjDExB6zAVC+bihNx2HlufDFruU3kUxA+54ZsHKk+J87
	MkXCHrOQViclqsHdJDy6Mrc1E5EeNndqX2ESCQnKJuZcKsYKSs8U4a965/GGI3PwFKc+dZmrBWqfk
	woOv9v+3rdOfLG+bOYjL8498tSxA09LgPJ0vIR+24VkAJF2k4Xrki0+mcnwucwYb6WoaPok1o4+wX
	voeflLFOQcfPe00x7yXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axK-0000000G5NS-3bJz;
	Mon, 07 Apr 2025 01:07:18 +0000
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axI-0000000G5Ls-3K8O
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:17 +0000
Received: by mail-qv1-xf30.google.com with SMTP id 6a1803df08f44-6ecfa716ec1so39430936d6.2
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988035; x=1744592835; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=igVn5a9lnYZiv748Bf1nucU57+aqB/uXYfi3TAKJX8Y=;
        b=RNg2cqy9UB/HrHdegjM+lb1P6woJuec4TYclQWW9TqrB8g3XAn/9Ym7GSsSovj6tyM
         PvCVveXPExT/BtUQU7T8ZHXh+tbcy/+0h0xxwjovASjwZf7lVKtLAt/XfOQYfxSj+Oea
         06bvB778yR7OR8FAwBKyaIa4VJQE3sLeU84GQhy4k76MZynl/KPi5T/RrKeIFtpNzTCl
         99Hrn0Nw9ilY2lpFWTYKb5hgLlQvx5PEStgm2OuyMQjKKpNZ8okhjljUELJeAqJEzqft
         rboRTkTH4En7BJvvexRIDfRAhaABGfyP5/ZwBDRnU7dYimOHKY01OvAimvPn4L7e4y/O
         yPxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988035; x=1744592835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igVn5a9lnYZiv748Bf1nucU57+aqB/uXYfi3TAKJX8Y=;
        b=apw+VqITyBpmoKPcTEa1zBy7g3AJ/ulZkcQyCZ7AJOLOEHkeK2A31i8cqFy3zCjbh0
         U6Zm2nLXGrIrMsWHieRjp1YXxJre99R1FuISMQuwr6NMBsR/xL/X+iAOlE+0xdRqgcg0
         NbC5dig08qbpPgtGZWHPXqh7eEfPMFrH+M6l5sp5Ouk2U2LT9AbSeVWbjWtn0EDa6EWi
         ngj9t8hfge6kcXU6baCQhMwvbrY/0lzl2il833/w1FR9cz9NGhIpCEC0mR4a0LngFHTa
         KTqxFqcwcGC9t6RTDEKYm7BEJRj+F7ZqPLfopiJAbQONzAFBa0R7x4spoQGAbN+QZ5Fg
         VfUg==
X-Forwarded-Encrypted: i=1; AJvYcCWF/6VbL1ECT94vnTxE1D0wx5ghS+J2GQwcC44J/xQZZD2v6zRkcsQKip4N2KrtxGn/7UrwSCsbMhrO8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzkw7rI9Y3kMwAGhbd7HvXvYrV0Km/JPq/ZiZ380l08Y2k83GVt
	2Jfz9/szi13+Rc5jcCh3Dqx+LnPWBPVD6TblNXLOE3B006leSvQ1
X-Gm-Gg: ASbGncsU91qBV4L8nWHWGbqTUg1UF9+btUOybJ8msO3f1HNsDOT6hV0fSnb8LnRjWgV
	Pl2oRFldYvy4zkSfnksfQKuwlW3eHcI5+ZDu9w6JRgqMHWzrEQGekOvMcY2C3+aqw6iCFmNKPtw
	8BS9MU0KI9ZHn2AH2ludUOQBUq03YCdClfeagqfLhnwUDUzvj3UMcnPfdUI5S0WCuA39BGprh2L
	kEYFgVbPUGBySKwaV0NvBLkD+MvfmBWmFCSwIP79qztG2GqyMVfSiFHaxH+d/PwkZK2Wg++6nI3
	H5hcN5iKokPLssJvB63cYaW9zBtDfLg=
X-Google-Smtp-Source: AGHT+IFNNT1TQk9hNsU8tcAP1XaXbTB54YiVS5jZhvg0FI/49XFrqaA3CzgEc9xU3GgDXEPKZXqRgw==
X-Received: by 2002:a05:6214:2268:b0:6ea:d6e1:f3f8 with SMTP id 6a1803df08f44-6f01e7f5c1cmr141067116d6.45.1743988035598;
        Sun, 06 Apr 2025 18:07:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6ef0f010bfasm51815846d6.49.2025.04.06.18.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:14 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 6/9] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
Date: Mon,  7 Apr 2025 09:06:11 +0800
Message-ID: <20250407010616.749833-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180716_847113_86E1904D 
X-CRM114-Status: UNSURE (   9.25  )
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

The sdhci IP of SG2044 is similar to it of SG2042. They
share the same clock and controller configuration.

Add compatible string for SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml        | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index e6e604072d3c..47b5fc1b8e07 100644
--- a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
@@ -19,6 +19,9 @@ properties:
               - rockchip,rk3562-dwcmshc
               - rockchip,rk3576-dwcmshc
           - const: rockchip,rk3588-dwcmshc
+      - items:
+          - const: sophgo,sg2044-dwcmshc
+          - const: sophgo,sg2042-dwcmshc
       - enum:
           - rockchip,rk3568-dwcmshc
           - rockchip,rk3588-dwcmshc
@@ -74,7 +77,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: sophgo,sg2042-dwcmshc
+            enum:
+              - sophgo,sg2042-dwcmshc
+              - sophgo,sg2044-dwcmshc
 
     then:
       properties:
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
