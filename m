Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2261ACFD31D
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 10:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+wqmDdfe1F5SawyfuK/o2xy+jNBuxnp91N+fuZZ+27g=; b=j1p+jnn5AhHHjG
	zDW0wLkWwaqbpKYmW5VVkqN4KClli+3/r2rGMg5ejEtOd0Sv4j/npYVY+Hyf3fALJQm12hQTGsR5C
	cVgTAMsrVIiBGNOUmmIfhjnDhBfFF3fHAGfFIxsk9vQjOES3dC6Pm3KFRXHO5fKlzJKzqQOhfMcZk
	+fmXFHk95acNKgJESBkNLv9wu+oP2yGIpl4v7XEVTSpg3gxEr0zHyBDMbyxI5UCranT0K5vnLnuDx
	t1ekvDjK5PmFDc7v0ukKO+aI2kGzhiwkCCSOtceU5b/jyz/IyVeWY0sizY+S3qh/sI4jZvVSPkF1q
	uxxjycwlURhrzgQ5PGFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szD3f-0000000G0Cd-08b0;
	Fri, 11 Oct 2024 10:39:43 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szCst-0000000FyML-2fP6;
	Fri, 11 Oct 2024 10:28:36 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5398996acbeso2217019e87.1;
        Fri, 11 Oct 2024 03:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728642513; x=1729247313; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xyNP1UPTt08MhflMIcOH9cW9Wb20NwuSNmK2SuTswyY=;
        b=QJ2C5OAjOiLKkST8xb0oU+rImm70NsMLa+FJLcMssSqi8KKC+4k67A2CqQVnN+cW0h
         p6zfJ//91iVuQgRsUGcL6ENOdpche5ExRvYSVi5yoB1P04+Vdmjt1tZKvDx/c0vQNgqr
         /+HZ0ICFkJSTNRkFSmEpNz1kqnJXTJ4yYTtdRZF900A7/Nd+mhE8Otbf/9fdbvWwoOSU
         HwBzbJX3a9i1FRflA/sNHxzCz5rdEwd+9valmfiWXsMjQD0O2NUGq63jfmfpj1XD1vwc
         w83FMkMxNJYZYXa++3QeYJhn8odvcYqnY+8mjEzzRd4xhXScNaP4e1G3NKSNYdL0v4gZ
         Vycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642513; x=1729247313;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xyNP1UPTt08MhflMIcOH9cW9Wb20NwuSNmK2SuTswyY=;
        b=of1gW6ByV9kXaFB+i73Qwm6uUwihBFYUBLWrgghqEmSqpvkcjzggxAVqyXl5WTdjCT
         7q6xrF1iPlPQnFV0Fw7sFvUPc0+Bnpt0s3mu7EIItFol+t7qobNTS40w3v3NfVlxHxGk
         6Zofn6HO6I9iBYKDc7THt5sN/t7neM9+A6a8tlwSldL5sKRZ1i0AAZmXg/9dGGyM4UNj
         yzIeuCrn06PGvacY2W7AZC9hhbZ9qcdN5nLKk2Ej/OgbvY9fMF1gzgZANU/oxxvRUH5R
         /pnKjMAEwO6e8XGSOMgash79sq8EpSsvPjC27t59tnrgwIyDOEeMZH+UmCYxbhcjp5Pi
         vEbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkSfNXZudbVyERPtXdhhJJzBGReMwBeMho3SIvhfI05kmxcV43FC7iv2B2AruMVqXbPy0M1A1UOSLbVc0=@lists.infradead.org, AJvYcCWy3nwVfsqAiHqLdpGb8dEcIjPtlUuweEis15Yl7bI+7oLx2llRI/LVLXjdZH3lQdrR+CIncg70dv408l7Y/P+O@lists.infradead.org
X-Gm-Message-State: AOJu0YwkD1uhZ4QcjSmqFlp9Y5P9AJPGsKcqIz2cg2l650+pBdo9CXel
	lFVTcOLkwdEEgMsGDS80f95AOxty9738O9AqDSjAQ/HMHCp4qwM=
X-Google-Smtp-Source: AGHT+IEj7jxxNUdcfFsGQxfN+JScaynbmfxoEPbLymkkExP6c7pgjdIctqnlqyXUbcu8dqFC0K1sLA==
X-Received: by 2002:a05:6512:2204:b0:539:d428:fbdc with SMTP id 2adb3069b0e04-539da599f64mr944067e87.55.1728642513016;
        Fri, 11 Oct 2024 03:28:33 -0700 (PDT)
Received: from localhost.localdomain ([188.162.200.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb8f1003sm552534e87.233.2024.10.11.03.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 03:28:32 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v10 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Fri, 11 Oct 2024 13:27:31 +0300
Message-Id: <20241011102751.153248-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_032835_696063_7DBC54E0 
X-CRM114-Status: GOOD (  11.37  )
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

v2:
 - fix dt-bindings
 - fix a remark in the driver

v3:
 - fix dt-bindings
 - fix sunxi-d1s-t113.dtsi

v4:
 - fix a remark in the driver

v5:
 - dropped unused varibale in the driver
 - fix dt-bindings

v6:
 - add apb0 clock

v7:
 - fix a remark in the driver
 - add maintainer

v8:
 - fix compile driver for 6.8-rc

v9:
 - fix a remark in the driver
 - fix dt-bindings
 - rename apb0 -> apb

v10:
 - fix a remark in the driver
 - fix compile driver for 6.12-rc2

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
 5 files changed, 486 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
