Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8302CEB2C1
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 21:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nSMcY3wKI1u9ctNTPm4Ud5fA/qjZiFzy+z/QqBupAJM=; b=cEYJlo+6+5llpK
	gexm03wNn19zCuexRARCqwApNQ7kiBXUtMOr4T8WywgI4kXF4Me+oCYl1VUgepIQcxaq2YB6GbfbM
	YwkdXqlsEHVic1dS7NXg9rdXc9JNMjvIlDVd9ucVjsJYUiYHv9i/wUBIdlHQwKxq359cg9L43WlEs
	RqsAkUT80mzytBDP2EEPOfc0BPdBuacx7yFz3BQzny/HjwWY8qi11cFm3rHW5U+sQglFMmbWX+4HS
	XtVH4Jfcegf6UYFVTDJsA4hVq3s8fe4+TdaHHANjdkLK5fU5lw6N+SklW7nL8k4bHreYwHCR0JiZw
	0WmMl9k3vfzhll+2flZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svNVQ-00000000q9g-2IBL;
	Mon, 30 Sep 2024 21:00:32 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMQH-00000000g2u-1oDe
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 19:51:47 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-7d50e865b7aso3691091a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 12:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725868; x=1728330668; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Yln5HQpd+jTguQQBAuIPN7v4ItFqnLr6QvDPCaJ0BvQ=;
        b=WYytkOvpKjuqEgCNaS3+azW2FblGoYw+8XLTcL7ccJaz61KG1AB0U1p3OINdaVae0y
         g/VpJPoFHgzyFmzCEtVI/5dexawWnY+dT4s1ffBn9UTgX5qEYkJ/X1aUySHrP5q3k5y4
         NOZ+xA0kVXfg2tqCp7ptIQfOovCNP91y7N62ep/6Zi+79bD+D2xh6xySf/9kPuoLusDE
         0am5k2AejngeXUZG9uWKM0SgwHmYOsh5qvh+wEIbHpCxvvZk2tJC+F/qly0CHuWFXdhq
         Y3Vpuq+1nyFyy5GBYZSOHd1O18hhXj+3izbeJhQxLvDf1iJs5U8B0b3ynItlhCOdioTd
         2T2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725868; x=1728330668;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yln5HQpd+jTguQQBAuIPN7v4ItFqnLr6QvDPCaJ0BvQ=;
        b=ISaEJSrrN3HT3NHEjnvg21749rLjKH/poaQVXJ1m458VOdpka96MVM/fPy1FcwaKFH
         SbPdDggUqSKal+shIwCt5mMYO3+oCEFdZU7QMMh4SV4KhOW5/+bEQI2vyjccJcsQgJ5C
         Wl+v9kTQS/Cblwp55Nel/eXThKUSJDkV0CBBD0FwJ99WWCd4P+K/jqIZd91XJPb7LsvT
         7MAYMgpRgwZL8GwCX63VGK+AyGxntfBTMfE0RGd1grFQAyezZt5npAgVUnShwUWt5DHt
         Rot0Sgd732CftWg3Lma8ipNaPVDdn4fjgJNW7R/doIWVIJVeTFvxWXE7e57a3w321o1Y
         kjLg==
X-Gm-Message-State: AOJu0YysHO54O4JaOGipnAMQVGmqAnYXQgktcZhxRSpnzNd3Qe2NNm/N
	o+siHT+FdqCeFpPyHWKPsgZbRW3tDKBYbdIpkdFyOvMTmP0RO/II6D5pxyNCLUc=
X-Google-Smtp-Source: AGHT+IGjSiRDXQRXRfRw15I52J+IDAcx49BXevj+SDiQr0UdMIcFCaHqsd9DDGnyWkz+MxRQ5YxVJg==
X-Received: by 2002:a05:6a21:e8a:b0:1d0:3a28:7589 with SMTP id adf61e73a8af0-1d4fa6c392bmr19195635637.24.1727725868006;
        Mon, 30 Sep 2024 12:51:08 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:07 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Subject: [PATCH v3 0/8] pinctrl: Add T-Head TH1520 SoC pin controllers
Date: Mon, 30 Sep 2024 12:50:50 -0700
Message-Id: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABoB+2YC/x3MQQqAIBBA0avErBN0tKCuEi1CpxwIE5UIpLsnL
 d/i/wqZElOGuauQ6ObMV2jQfQfWb+Egwa4ZUKKRk5aieDWgFJGDLekUzqAaNW1olYIWxUQ7P/9
 wWd/3Ax8jooVgAAAA
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_125109_514177_89171838 
X-CRM114-Status: GOOD (  13.74  )
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

This adds a pin control driver created by Emil for the T-Head TH1520
RISC-V SoC used on the Lichee Pi 4A and BeagleV Ahead boards and updates
the device trees to make use of it.

Changes in v3:
 - Add Rb from Rob for the binding
 - Rebase on 6.12-rc1 which enables AP_SUBSYS clock controller in dts
 - Update dts to use AP_SUBSYS clock controller instead of fixed clocks
 - Remove unneeded defines from the driver for dt unit addresses
 - Link to v2: https://lore.kernel.org/linux-riscv/20240914-th1520-pinctrl-v2-0-3ba67dde882c@tenstorrent.com/

Changes in v2:
 - Add thead,pad-group device tree property
 - Change driver to use the thead,pad-group property instead of the unit
   address to identify the pad group of the pin controller being probed
 - Return -EINVAL if no pin group can be determined during probe. In v1,
   there was a bug that instead returned an unitialized variable
 - Link to v1: https://lore.kernel.org/r/20240902-th1520-pinctrl-v1-0-639bf83ef50a@tenstorrent.com

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>

---
Emil Renner Berthing (8):
      dt-bindings: pinctrl: Add thead,th1520-pinctrl bindings
      pinctrl: Add driver for the T-Head TH1520 SoC
      riscv: dts: thead: Add TH1520 pin control nodes
      riscv: dts: thead: Add TH1520 GPIO ranges
      riscv: dts: thead: Adjust TH1520 GPIO labels
      riscv: dts: thead: Add Lichee Pi 4M GPIO line names
      riscv: dts: thead: Add TH1520 pinctrl settings for UART0
      riscv: dtb: thead: Add BeagleV Ahead LEDs

 .../bindings/pinctrl/thead,th1520-pinctrl.yaml     | 176 ++++
 MAINTAINERS                                        |   2 +
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  87 ++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  43 +
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts  |  28 +
 arch/riscv/boot/dts/thead/th1520.dtsi              |  65 +-
 drivers/pinctrl/Kconfig                            |  13 +
 drivers/pinctrl/Makefile                           |   1 +
 drivers/pinctrl/pinctrl-th1520.c                   | 907 +++++++++++++++++++++
 9 files changed, 1306 insertions(+), 16 deletions(-)
---
base-commit: 9852d85ec9d492ebef56dc5f229416c925758edc
change-id: 20240930-th1520-pinctrl-d42163ea2c11

Best regards,
-- 
Drew Fustini <dfustini@tenstorrent.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
