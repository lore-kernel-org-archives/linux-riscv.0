Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86FDCAC59A
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 22:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mcg5xuiiYl0W2gkb7pTjNxrM07aggoiziv2LrqBGMV8=; b=DH/ZFkCn+PCplA
	JDykc4/+uKMME/IT6uz+a0dHSZUcAVz4pQzFUxysfIEHYs66C4X+KSNM5ZuGpmLDZIf1HXLhaYbZg
	afM+oO8/fe/duIo/tfd3UW98vNyaqsc+mylehbwROmqp9NX61VogCjf4i1Q+C4g62taXgXfTlJ7cD
	Sh62bhK3uFdyHhN9R/LL8/4nIwU+5V47OD7fHMFBX2vhvASNq5wxJEF+z6oaEQYtgk/OpU99b1DDu
	XqZ8izusZoHl78F/Awciyn3Ey3Gt2ds0TDsgHqGq33+RY1BoMjl/Lwady2brBAOdGqQUIC/Ag49Q6
	eenNgibaK+9pi29mkXSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JI-0000000F99y-0syk;
	Wed, 17 Sep 2025 22:07:32 +0000
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uz0JG-0000000F98C-0CeE
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 22:07:31 +0000
Received: by mail-io1-xd35.google.com with SMTP id ca18e2360f4ac-8a60481c481so2070439f.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Sep 2025 15:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758146848; x=1758751648; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jp8RbtGYlwCTIrM7MVPtV3vKCoFBge4Bz36KG46LLsA=;
        b=gtkz+TZoQQXR4nh0R3fd9ST9Jj/Z2ck/FdjJQf75aQwxy5022MlZ6ybcgPRL+SjpPn
         fvi9wntHEI7EJxAtpGXHMIxM0PJr6L96TQKB3gHc9gfFLiKWCt1h3Z5wvu3sYg6Xfgyp
         0UZrOS+1zg3JTr67rN11jBnESzUN+QyVZP19VRKLD/uGLTYMvmu49WcHG5joxg9w0GYU
         9NwQYocErpXkuXCKsFG5bP73oQVdYSXyRjHk2Svp1W0xxMeK+X/xgoOvOZxtFPC0AGv0
         WAc+LPw9anBBIDXHR+4JcsjFinp3GD0iMIhz4dHa3VvTY28H0LtLY4yW42wpdITFNda5
         exAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758146848; x=1758751648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jp8RbtGYlwCTIrM7MVPtV3vKCoFBge4Bz36KG46LLsA=;
        b=wGF1JoUB29L9msIZZ5Ju81eA7Vu1D0vubnH5+HPZ5KnpSbipGQBGaeSfsJ6bXiL0+7
         jmPj4FeHPaedl5AJ7CEEMyO2uI6CmYZZSpJmfFNYVNGJJKczBXAk1GRTwTG0j6ZCfHgi
         RG9Ud/xyJmqxkMDFmWo40oxIJOj2xgUBJyUO+WpCCWxLTsoisA1FyAiDXAa68wgiqGNc
         DAkIT0fkOeUE0QJlT5yqb6rTaKAGLepM4pGC7uuHKu7oZNvBTzNx0cpVttMWgVzmH/cW
         S533TIhAIDK3o6KVYYL06vm2Skc36jjvAKVW/svQRfSmlvy07fvbSLJP6xRaym/JCNp4
         /OVw==
X-Forwarded-Encrypted: i=1; AJvYcCV7TlBsSHgkMulTAvRsfFRxbcfK0nhUG0MGb0bu1m3tHp19cxuYlosNiQGXGRr04UDoR43ICquq5+U8MA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydlsNIHqgFUL3WMvgEvHvFAUa5kPCoVsr+eFXyKaadhN8o9pu1
	3r5NfROEVoWWfyyQ9j+XP0ZMcGAwcCfjPMHMc6gLGMuLMyZx3R4jqnPz5uwY8kmcsBc=
X-Gm-Gg: ASbGnctn177u+fKFwkWVBkqSffWKidfywoupc4ekPnvQFcClZHxJtFpMmmt2RxnFTdi
	73W/uA6bBTqnrBvt459NYEZ+VIqdQtqBQhzy6Xp6co6ehoox+fOvpZ1Qts7KC/KE3WETrE3h4dy
	Ct+Cnqq0yYWi9Lv+AL6kG8qxg9kYOD9g6CZ73XEH9SDTxUZcsE5YqiOUpOitKT8vzqRJuZHGgBd
	9rkQ3t9rZ7Nmeu/s7wGdA5OXAImyfih0fTZ3huISxxuTYyrTQuNhY6notTVcVhXAVXn2KV7dMYF
	d/XlSSu4+ck+dpAV+BYxB5yGLaWiZO0/P5Qwp3xx1KkvD3BMxTWJ3AZ6WiMUHzBl1kQf28vqeW9
	rXWoyfXUV1Y3J5bk3udLSDzULL4jVIkWa+8enoF6u9SeTdFlSo9KH7rUIZyhRGglvXOdpc0hLBH
	jgvZ3y5zBJ1mxziWQ9bUY=
X-Google-Smtp-Source: AGHT+IHKI3XQBkBxfHfdLx0gpZ16Wz3vuAMqg+Tko1i9TXarf8MFb1q82xDwIkDYWvOkJteES4wzxA==
X-Received: by 2002:a92:c26b:0:b0:414:117d:3186 with SMTP id e9e14a558f8ab-424449d9c55mr15071065ab.13.1758146848530;
        Wed, 17 Sep 2025 15:07:28 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-4244afa9f6fsm2346335ab.22.2025.09.17.15.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Sep 2025 15:07:28 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	dlan@gentoo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] spi: support the SpacemiT K1 SPI controller
Date: Wed, 17 Sep 2025 17:07:20 -0500
Message-ID: <20250917220724.288127-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_150730_211744_53002412 
X-CRM114-Status: UNSURE (   9.03  )
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

This series adds support for the SPI controller found in the SpacemiT
K1 SoC.  The driver currently supports only master mode.  It has
two 32-entry FIFOs and supports PIO and DMA for transfers.

					-Alex

Alex Elder (3):
  dt-bindings: spi: add SpacemiT K1 SPI support
  spi: spacemit: introduce SpacemiT K1 SPI controller driver
  riscv: dts: spacemit: define a SPI controller node

 .../bindings/spi/spacemit,k1-spi.yaml         |  94 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |   6 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  20 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  19 +
 drivers/spi/Kconfig                           |   8 +
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-spacemit-k1.c                 | 985 ++++++++++++++++++
 7 files changed, 1133 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spacemit,k1-spi.yaml
 create mode 100644 drivers/spi/spi-spacemit-k1.c


base-commit: 590b221ed4256fd6c34d3dea77aa5bd6e741bbc1
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
