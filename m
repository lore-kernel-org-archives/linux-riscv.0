Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C3E7EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Jun 2023 08:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mUaiYlmOm1hHtOWvvm8a8RNjUfHpH10vbjUXC4P2zPQ=; b=3IQIh4rgPdN3DX
	l0pFB+dlSckXeZhlT9lZq6nZLMXaJ80LQghYAqmunAVCPIZHl14BJunnsXtrT9JrE9RUujSQivU+K
	vq9cJY4fP6s1TJaOh2PE18Zth2rI2qgieXdchrKlo8ajpPo43rf9qz0iWSbtnH1ERc3dy9YhDj2TO
	qtM9hokz1IMMgLCxcfviRt3dOoWvRD+EHkXkrjFy9+B0BnoaKv5mx/jiyytsCsKSrK2iX98vKy4YQ
	4LcyFwYKkjZs4rALaacwQysfgL57ILVohlKwhagpUkUDlbOog0rCyH6VZZqBhj7V7hsFQW+PNTyCt
	5ESzgVEjrmR5yFDbOm4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3zQ-00CYd4-1z;
	Tue, 27 Jun 2023 08:23:56 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qE3zN-00CYcR-32;
	Tue, 27 Jun 2023 08:23:55 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f865f0e16cso5710423e87.3;
        Tue, 27 Jun 2023 01:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687854231; x=1690446231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GDNIl3iXFQ1gjAWKdZ7tZ4fSEMXf+XK06wLBhL78YQA=;
        b=ZsG0eKWLD4RrDhszvy0jCNn5SxS8lRq06BUqbDkRPdWd2dpro9AIC3anJvSNMNGVYP
         qqM2TOST/hDRserCkiIqfe5a96DIVS0mZXNk8OLcdtaCKdMOcIyBDWGQWpJl+3Jurm3A
         tqM/xj5WqaSBs1Z8/2g/lTTXame6RxFD0J55lUEo1hleJ71uRiR6ab2BIV15pzGZsH4c
         ED6sXTFn48+46ZZ+EZgqOTPNWrCNm7JxE0I/C1tsFJGLBc6kCOAWvXcTOJFNk87n7sMe
         iIEkLV862i2rBPa19Q7RYWDOVFlv9dmPfWP3IHmbyRqf+8Sgv5FQnhREAcXxrZvELZ4b
         73rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687854231; x=1690446231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GDNIl3iXFQ1gjAWKdZ7tZ4fSEMXf+XK06wLBhL78YQA=;
        b=ag1K8rQB7IrWY3nuO3BHTK+xqPCq02tQZzrzvIzjgAAKTmoyR82TzQcw8uPeOoeeU8
         1Eoyu8ZrduvlUgbYQ5IkkfsJnqifnCShLNn2uyc7159Eh/ZsVYSHI9I+o7+q2bU7bheN
         ZMR1XFlAi8aHvCTuW0RY5kY2HTuaxvlIhps2e+V8YEYN91dY2XrhiLqqar3A33MDghuo
         Mjl/CzwQ14OMmLUyX6MHnSlEbe6mVD51LHEl8Ek0PcU+Wo7Pz48CBr3Qx8rtEUnocnN8
         q0fv06J7F9htj1ETAu3Vtp3jbSE4k13JCTe9bHn/vPrQ0y1TKfjjOE++BTXXDAb/2zN0
         QTFw==
X-Gm-Message-State: AC+VfDxCFh0eLcskGEiYbde55TnbBVf2FZ0Yim5JfGiNk2U/W7YF/jZu
	EN6M0T+mRGw6l5C7DfeHxQ==
X-Google-Smtp-Source: ACHHUZ73/pqlFjvrz0cp867rPg1rxGDDBjPhXGKKuH8Dye21hRqvSYSwI3xGt9P1QHy84HJNYNoHOQ==
X-Received: by 2002:a19:da11:0:b0:4f8:7617:6445 with SMTP id r17-20020a19da11000000b004f876176445mr12607528lfg.48.1687854230312;
        Tue, 27 Jun 2023 01:23:50 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id i12-20020a056512006c00b004eb12329053sm1420673lfo.256.2023.06.27.01.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 01:23:49 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] Add support for Allwinner PWM on D1/T113s/R329 SoCs
Date: Tue, 27 Jun 2023 11:23:23 +0300
Message-Id: <20230627082334.1253020-1-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230627_012353_975274_C7BF1EE0 
X-CRM114-Status: GOOD (  13.25  )
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

Aleksandr Shubin (3):
  dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
    controller
  pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
  riscv: dts: allwinner: d1: Add pwm node

 .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  86 +++++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
 drivers/pwm/Kconfig                           |  10 +
 drivers/pwm/Makefile                          |   1 +
 drivers/pwm/pwm-sun20i.c                      | 322 ++++++++++++++++++
 5 files changed, 430 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
 create mode 100644 drivers/pwm/pwm-sun20i.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
