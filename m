Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A58F6C47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 07:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/Rmcu/+8k1ZDvTfQrlPKSFTXiUEAlJ1o1Fn9fPLHH+g=; b=hic3tWYOhOnEM/
	kj+f4SADll0nIOmXl3F11ubgMnOJNZRSzIGTAt/zZe51IYAFjGnQZoecsjEX1AV+1XoGrOU4xh7Yx
	24AF7T9qXXGDRgEJuGddRzyPlYryXeVUppQG5AjepeIhrvmHoVNDhTf9jjNbiKG0fXLCXSAcWBBra
	r3S6RbbpN7AZvU21dTPGipJfM9GDzKFdN0kEb46gtic2l8zcHf9A3o+nb6NXVEfM3pdOVgo6Fr+ti
	bjCzJPJsc63AkdNnJGpRVtcuv73XRQ/lUj0S7q8q8nLWu/umARHt93bvI2djjmGbfkPaqXh4srMZZ
	1EREDRPr5N1tjn2xKG+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu37-0070QN-2Y;
	Thu, 25 Jan 2024 07:21:21 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSu34-0070Op-14;
	Thu, 25 Jan 2024 07:21:19 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5100fbc27c3so2291702e87.2;
        Wed, 24 Jan 2024 23:21:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706167276; x=1706772076; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rfbdi06WEg6XPP7HBGTF5pjBeEWo6KdfcLseKD4sHZk=;
        b=m6mX5qiUPiSCEOPFn81D4FutG2TOPConD8w3ZMAQiMtJ5Dqrwrko68TF3Pqw4eLnqY
         Zuj6xrxs9wAJYhgv/g3MDk1KZT7VpITSY2TORbKezzZuq+roD+41NZ3+gZEH/48LFHSn
         Q8sMpHhsNZye+W97f6ckbMn7+ow8wQ9fzSGAWrdrPj1bDnaOVYlLlpZGYjh+twtjJ+rr
         aAnOKMFCgQ0kTIfM03bfNs06JR+UrG3X6ZCG3ddgo74dQTMxW8KdBEhSTNYgHHeF+Yxk
         hvUwY3+esK+0PnARarhnjl3x3fswZC40eicp914QYtIgaUUCe0TfVpiWGCNqHHiEZ5Iq
         /BGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706167276; x=1706772076;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfbdi06WEg6XPP7HBGTF5pjBeEWo6KdfcLseKD4sHZk=;
        b=fniUPJ+pq2Z+bBhyakVADQrC9EWECNXuV4u90nXiWIE+ERGTvrxcRmn5OO/w9HX/oI
         gmpTyaGTYOJaIRrCvxOA9rTztGZ7SfhtIrPtP9qJ7kEDDsmtFyZFghoN64IYkpy7ZyFR
         QVb8G0wnPEeX5DrGQ/29K6kpElTDIg8eXk0oIAT7Kh9Iy1bR4ZYdRWhpQq3ha+NPS1+4
         +v757JnbIzeG3KRPhRpHTK+BRcCcUxs1I/Pie4cQS9tL0cSiTMuwzXSYj3yC8kqHUjfQ
         8s7cYRD8bQ8YgvAKs9abQBfbuP2DrFQ6KqyMtIXqixE+uQKxEvO/1raIHweg9NChbUsx
         PQHA==
X-Gm-Message-State: AOJu0YwGKjiKw3C63oAdBuu28DfDQhdwac88tFND05jtZ8AuQf+JozWm
	wpyOoXc/oUcNrOVeRn+FNaVMGgDjcsuHRSVSChY0rzJDXhrC5K8=
X-Google-Smtp-Source: AGHT+IHuzdCwXXJzzYZ0ZphpiXZChO5Xnkj9g1TvGPwPEf24LwgoMu6D+BEIIOzw2PpSJNXyoPZbwA==
X-Received: by 2002:ac2:54a7:0:b0:50e:7c70:f8da with SMTP id w7-20020ac254a7000000b0050e7c70f8damr216409lfk.16.1706167275400;
        Wed, 24 Jan 2024 23:21:15 -0800 (PST)
Received: from localhost.localdomain ([188.162.200.139])
        by smtp.gmail.com with ESMTPSA id x37-20020a056512132500b0050e75f9e8c8sm2780070lfu.98.2024.01.24.23.21.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jan 2024 23:21:15 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Thu, 25 Jan 2024 10:19:40 +0300
Message-Id: <20240125072032.1151383-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_232118_391826_7A5997BC 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: devicetree@vger.kernel.org, John Watts <contact@jookia.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linux-sunxi@lists.linux.dev, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Andre Przywara <andre.przywara@arm.com>, Rob Herring <robh+dt@kernel.org>, Marc Kleine-Budde <mkl@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-arm-kernel@lists.infradead.org, Cheo Fusi <fusibrandon13@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

This series adds support for PWM controller on new
Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
provides basic functionality for control PWM channels.

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

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  88 ++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 380 ++++++++++++++++++
 5 files changed, 491 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
