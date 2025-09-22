Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0188DCA100F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 16:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1qoy/sRgwVrfnZA3gcuPLZl6KBbpTGGfVxpl+cq4/ys=; b=yoE57FJokwWRgZ
	x6dc7D+alcX1UoIGCgGquTRXUmJWp2vc7VUVpa/rF+vcJtDQZnfiuzHwTSSDqI24mUpRFcvwdTg7e
	j7B5air9g7B94nw8EBeL4DXY9fUa2hZPbgFvwHgS1KK6hZFf5NaAPLJebUKzOfQg7b1W1N4N09Aun
	I7c191VvzezDOEiUtsdpmkh3TvU1KgISuHq3FxxloNAZVEXkQOCY5xgeonUzxvPkhl+PhuCOfvX4/
	Tov1I/jflhuqHiMP6UtC6+tfFYllYypzbo2xSxhqSIDMkveElrL34JDlT8/237D9HRk5dG9R+IHZ+
	mGKv86GIA0KSJlysxjsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEI-0000000Axdv-1A7o;
	Mon, 22 Sep 2025 16:17:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEG-0000000AxcL-1GpA
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Sep 2025 16:17:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=VY+UeuZTbe4DuOfkxt1V9gHqp7+wtqNRHgcn1ay/Mt0=; b=jYyo7fR+K7rGlvkOXG9LYm5E4a
	sM+9/4371boUI+SfGpyN89whDGDFgQaHJOM7AdahvppdHaU3MItijOJXZNlwEEZCBRrSGqFUinpgl
	3+BuhShbdGD7+4Q/GNzPNS/svMTkRYAhYZ9Pc0T3I1bHKn/wvVEiUyjEJDYOEbDeDZQWdwnArst/M
	x+KtGVfecxfg4asyhnSTv4sDpC+vH+mTXxd7zwsNu1Ni4aFEV1gWbkdQ3g3bq4uE7W1Lnwkyqidd5
	SMzCSb7i9zntWvP2YiC29MhH2IYHyf8Nwvhy3k0chZPZcWyrWesTTGdIfHWYftwbt+B83g7MtwVSW
	wtdmBzXg==;
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEC-00000008MAy-3qXJ
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 16:17:27 +0000
Received: by mail-il1-x12b.google.com with SMTP id e9e14a558f8ab-425715aeccdso9407695ab.2
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 09:17:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758557842; x=1759162642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VY+UeuZTbe4DuOfkxt1V9gHqp7+wtqNRHgcn1ay/Mt0=;
        b=I+M8i/XFJfr4KgFkRGJLUZx0PNu7UzTkLgKKThPRlnWN+N5reuspYi/+pQ9EQENcMa
         aKAugHgl5cmkiqBF9jfnYUS2COUb5HdpcDJ61/QdOVk5M/wToNZ5ztP9w6w/mjtS8hUn
         tylpWKlxAmFfZICUvC/BaKSQlzdrPIsoA8Qbe87k4i1rVoNi4RcioXiGjP66nb4auJ2k
         UyrX2m+N57EFkuMQRd1Ru8v9hu20fcS/PPsiND8o5Yr4G5ojBX4fP8jnVZWAkTzyKSF2
         H+qb+pAzFQ/7fseiz3Y4woDjezoBKq35V//brw7swPJk9mwSOEwI8xSQF9p8Ja8x79zx
         XGvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557842; x=1759162642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VY+UeuZTbe4DuOfkxt1V9gHqp7+wtqNRHgcn1ay/Mt0=;
        b=kG3/F72HRwQE01cg6FZDhjoNARq/Tb9EdVb+l/3kwCF0y9uDZ/gQyE6sRdMXcj2/pF
         6/AkbUmQpjtA/PudMkZx0Sj9NGct/Hv3tTwn84A/AWsGIGdWKWuoryEPzj8ksHPCG/Bx
         pdVkUnLgYLZIDU8m8/GXPot7zabJZM3jzXyfy5qdgXhmdjvtYjkhpp+YsDkmIhUrRREf
         WIHPfUgVzxkH7lSCkdJtc15cRUES40vEJZy2bsAsT7jsgZjKW9kV/y/9Eq3wnXHBnoGc
         e3lfu1XFa4EeHChwFFFo+gvQkZ+7kn5vw+wSIIUa5oW88IasWF5GGUfBqltsbpiRX8j2
         S44Q==
X-Forwarded-Encrypted: i=1; AJvYcCUXOSsfBCTNAcSDdIUuAcXjNyXwCoSQDisLqnpPS/4YfzJqm4sGHCuLqqWAbAGEFWpzYZSwOY2mhwdR1g==@lists.infradead.org
X-Gm-Message-State: AOJu0YysMkyOxPySVY4Vjwl1Q6jYq7/+kTb9tFwN3dFpFKFC46zVCuXp
	RgEWvKFDTDRr+HfBbAeeMurvtXLgKv3+S7Ra1pojmxfvfU6gOCMmEsoZRRE2v7HuH94hYB67/Kl
	uKNEh
X-Gm-Gg: ASbGncuR+cMdLibABij0nQEfMlw/wmLr2sGBnoLtnoeO79/Z70d4WFC5hWlMef0Vj6e
	BmxfqUmFc4xvmCzhg/vjOHeqz2f22ziu975AIIVXgyDgqPdE1M8q8+gzkSlGY6TV3FDhZBF0Rcx
	l8MK+lZx33M5oWQy8IoSTfvJiQJCzhQT0fsxthD919eHXjgwHpa51rDi5ETWsHKXnKJlFuA+DiW
	jHo/XqmzL7ft23htL9ThnNcjF712plnSLLr1MOXcMirA2ER+nCC8r1q8XxoE8pfQE14I2LZ2xHn
	h8ip3sC8BnN3qLA3WPTCFFKjsABODyRpjUf4dTvh3eSVsQinZEwy83aKc5cxkzjRz5VftjPXUto
	Ic4LxKhCyOe3qGbcEC3S4gexshVk6K3H2CtBSJObWnegFrN8GI2PJOKwTDgpjqOH51A==
X-Google-Smtp-Source: AGHT+IGacLGMErLcsONCaQ7tVN/QLr7qDvYuMf/IioCcbyv5ZtFG8CwlnJVAkhCLzpWTG1DzdwCTxg==
X-Received: by 2002:a05:6e02:1a8d:b0:3f2:a7ef:bd88 with SMTP id e9e14a558f8ab-42481911aadmr188245465ab.5.1758557842154;
        Mon, 22 Sep 2025 09:17:22 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425711d9aa0sm25207185ab.48.2025.09.22.09.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:17:21 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] spi: support the SpacemiT K1 SPI controller
Date: Mon, 22 Sep 2025 11:17:13 -0500
Message-ID: <20250922161717.1590690-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_171725_177994_B96CA134 
X-CRM114-Status: GOOD (  17.79  )
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

This series adds support for the SPI controller found in the SpacemiT
K1 SoC.  The driver currently supports only master mode.  The controller
has two 32-entry FIFOs and supports PIO and DMA for transfers.

Version 3 incorporates changes suggested during review of v2.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/spi-v3

Between version 2 and version 3:
  - Add Conor's Acked-by to patch 1
  - Add Rob's Reviewed-by to patch 1
  - Added imply_PDMA to the SPI_SPACEMIT_K1 Kconfig option
  - Fixed a bug pointed out by Vivian (and Troy) in word-sized reads
  - Added a comment stating we use 1, 2, or 4 bytes per word
  - Cleaned up DMA channels properly in case of failure setting up
  - No longer use devm_*() for allocating DMA channels or buffer
  - Moved the SPI controller into the dma-bus memory region

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250919155914.935608-1-elder@riscstar.com/

Between version 1 and version 2:
  - Use enum rather than const for the binding compatible string
  - Omit the label and status property in the binding example
  - The spi-spacemit-k1.o make target is now added in sorted order
  - The SPI_SPACEMIT_K1 config option is added in sorted order
  - The SPI_SPACEMIT_K1 config does *not* depend on MMP_PDMA,
    however MMP_PDMA is checked at runtime, and if not enabled,
    DMA will not be used
  - Read/modify/writes of registers no longer use an additional
    "virt" variable to hold the address accessed
  - The k1_spi_driver_data->ioaddr field has been renamed base
  - The DMA address for the base address is maintained, rather than
    saving the DMA address of the data register
  - The spi-max-frequency property value is now bounds checked
  - A local variable is now initialized to 0 in k1_spi_write_word()
  - The driver name is now "k1-spi"
  - DT aliases are used rather than spacemit,k1-ssp-id for bus number
  - The order of two pin control properties was changed as requested
  - Clock names and DMA names are now on one line in the "k1.dtsi"
  - The interrupts property is used rather than interrupts-extended
  - The order of two pin control properties was changed as requested
  - Clock names and DMA names are now on one line in the "k1.dtsi"
  - The interrupts property is used rather than interrupts-extended

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250917220724.288127-1-elder@riscstar.com/

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

 .../bindings/spi/spacemit,k1-spi.yaml         |  87 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  16 +
 drivers/spi/Kconfig                           |   8 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 968 ++++++++++++++++++
 7 files changed, 1107 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
-- 
2.48.1


Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

 .../bindings/spi/spacemit,k1-spi.yaml         |  87 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   7 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  16 +
 drivers/spi/Kconfig                           |   9 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 965 ++++++++++++++++++
 7 files changed, 1105 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
