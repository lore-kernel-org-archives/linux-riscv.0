Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D75EC3601E
	for <linux-riscv@archiver.kernel.org>; Sun, 13 Apr 2025 22:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=psesvYVL57PLS+TqiRbC4C2NGc0t9AmR7iXPYM9B9KU=; b=eLIzi1MTsDSJXt
	kDjOCfNO6QYD0nnkBrHvhACDqfVQHjoNT0Ac9kZUEqn+R7qdTcyOrRFnh9q2AgnXIcF2OphIwir5o
	yE4z5sKI3NGktdZODBB7hKhxUeDygpF3iA3HoYvakxSAbXt6BFPk1cx92jzOIt81DaJGNdhTx3Wwz
	AaN+GlZPIUZldoCKhMIRz8LZWi6ZBbgrWIX4soIXMf7VzPZ1LLDhZbe+KfdR2kVlmpoC72mt5+uZF
	Y+RfOdPWE3RHqTCn3tbfyQUILuI7cp99DEDFeUAEUF6zpaTYp9BCTp5JAoQNdaloY8Jl7eRlv3bCV
	R/c0D8+xwqAHozn98qzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45w2-00000000GK4-2xfE;
	Sun, 13 Apr 2025 22:36:18 +0000
Received: from mail-qv1-xf36.google.com ([2607:f8b0:4864:20::f36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u45vy-00000000GGR-3yD5
	for linux-riscv@lists.infradead.org;
	Sun, 13 Apr 2025 22:36:17 +0000
Received: by mail-qv1-xf36.google.com with SMTP id 6a1803df08f44-6e8fca43972so44187596d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 13 Apr 2025 15:36:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744583774; x=1745188574; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vQtb0pSGVQGTtXkIrJkeCkQBuvZKt/sx/lVi2mJE3r4=;
        b=g9B7HAbkejivavuSPVAAq+yLbZJUeTBdNJZGo2wgSrggSbCjvn0e88Ytf9jjIv8hyU
         T4P61I2W8rK9fbuik4BIh4l6BXsBo3IIehFDax4ja9BbOtBQ9smJwoTx1bv+kDAPisj8
         G6ZVcSMiAs4e9JY7kc1jTusyIXMZ8I3R0/W7j8j81nx5W0rLZPByubY+zV3s+hQ/tB5F
         JMdAYwi2KU2AnYBGcV0OWA3V5QxqLfDEHbEfg7cIUeKGsMXfmqJL0ZYtftWBZYyEi76y
         WLeEtAMcH0Ofv/HfYyq2nB+BShxy7c0lF9g8/8ra3D7Az9aMhXcYh04MRqRo8QaZLdux
         Tfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744583774; x=1745188574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vQtb0pSGVQGTtXkIrJkeCkQBuvZKt/sx/lVi2mJE3r4=;
        b=uQP44VJl0bi7JWeFbEZste/3YQP52bpV554NdEskdeezj2RqBBsAzvblCHd/qPOGFN
         C3lAikAKosN828uwRwKTnAQx89xec3+NDdHimCqh9BRnWywq/nfombcpxx0if/krRcPo
         Zl9FnC/QSH+FQjg9Fo0srKu/0LW+qadBytu7Tee2l5PPlutQCIUKR41154rZKOuzDQRM
         /HCJRx9AFqjTKWwYCymmc0Qdt4gY9zZbObIC2Hcp3E8Q/wXC92oM7J7VW+xxqesTNcJA
         jgYAt2C1nNjqqmabbvZ7OF3PHctb/CjQ4zu98Rondngz7eDMYAJ3NXYg4BDhKlP+UOj3
         qQyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqfojyJBSo58Dv416P2IIk3VHD01pgFJkMCJNCtyq8REVk4W0yGCL06rdmA1vbq3zZxaT1PYBio0PfTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWTLrbGd6YrVbedcTG+keUxy9NnnZeqqskvGCRt1VUN6rs6fGw
	E++YE8CpeeZTB2lYWaznoleboSInI1NGSYgKPT/wYZWxLXF0ugC9
X-Gm-Gg: ASbGncvg9tmqWbpo4dxBf4pZv3FEGobku8reHYOYmEtGnT5nwqdm22lwVx7dYLsMlbw
	/WGuJQcccyGcvWv8jQ43Qwh2/OCfNYCcYbF5Hd+7isNvQq14gvegD+sjNsPatxPxGaAGdmfKOI7
	jSPY69HnK2dKzsqCoJMyG5NFoG5LP7ry6mAC6tnq6NqEGUazuqOMZjTSyKC+FkLvjtHzzLZkPRc
	a9oT8w6l5jiu4ll+1qiVdjFKuoQv4hZ54jP+5Jc1hWR7rRKnt4ZGYILO+xOfCM8xiy1QPPjEz8/
	ID7FPprGcx/8K9YP
X-Google-Smtp-Source: AGHT+IHcbYzXgxBWScH80KwGFOQiw4xCi7hWgB9/z1qenwglZbRcB30OmSj5yMnaB0Bpc9VZ1St78g==
X-Received: by 2002:a05:6214:e85:b0:6e8:fbd9:169a with SMTP id 6a1803df08f44-6f230d000cdmr144479206d6.11.1744583773712;
        Sun, 13 Apr 2025 15:36:13 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6f0de95f7bdsm71938186d6.23.2025.04.13.15.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 15:36:13 -0700 (PDT)
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
Subject: [PATCH v2 07/10] dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2044 support
Date: Mon, 14 Apr 2025 06:35:01 +0800
Message-ID: <20250413223507.46480-8-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250413223507.46480-1-inochiama@gmail.com>
References: <20250413223507.46480-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250413_153616_327394_357FCF6A 
X-CRM114-Status: UNSURE (   8.64  )
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
 Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml b/Documentation/devicetree/bindings/mmc/snps,dwcmshc-sdhci.yaml
index e6e604072d3c..5fb347167004 100644
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
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
