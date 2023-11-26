Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C067CC07CA9
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 23:28:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bF7PPFqoztl0vuJunDglrNGhLCWg4JEqKHd0XTHPGdU=; b=1WCOUwQi2GEukR
	9N3uDeJxAlSXVdjRNrgmzub9MzcHpWRL7RVVEt5S2Fwa1Jnbp6I2rCsH19nx9mxmHVXbrUQC09Py+
	nWazlScF/xydu7cietESpFW9IOV4X2R2J5vs4wmtMtxAED35OIy24xUK20lHyDHqXkbAd38T9U170
	uGCmxf+7otlCOoqLs8QDFaktvJU0Ct4NspSezS9YA0X+PdPeO4DZnxNkEpMC3/Qjbitt6m0B6hjLS
	JPg4uTXHINpLI+x3aou2+msh3szmOg2WlAxBGkJ6KkbhPGcHiQIObi2g++hrVrHVQFPx5sF1hl4ro
	Yxk5+YEfxERFBmzez6gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OXp-00Gh3j-0X;
	Sun, 26 Nov 2023 23:28:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7OXk-00GgyK-0s
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 23:28:06 +0000
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id F410D406D3
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 23:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701041280;
	bh=g2nzefL9abJS3V7F5jIo1B7LNOEauW6WFlyZ4XwqLeg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=ZXAYGvLqUevhXcc3XGxd8byPOdHsFNT2CNgt7yqO5n6LX3LktENVN1rqATztkp+a5
	 ZhfQTwfMIuhGmxNT7tcjUA8uvkpAzE7WExo/rX2rVU18H9taTPqIlznAwQkrXAMrUL
	 jyiMZjWuI8FWc+serdj0LJWPbS6uZEldjF6FWaKtoud6Y0btLO4xSxeXv3bK0PJLqc
	 D3zMVbjpwm/WujY2bgoGBULdlSX3rg3xMQGt8peymIK9GdjCZngLVmulexvg/gCvC+
	 sKKQD0WKhpwC7BEGQGblSByvtavIDmTdaV4UcONrB4ez6TFDh6UZtibi3FY/pFN/I/
	 zzsKjckQzKy7g==
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-1cfc3a062e8so9014645ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:27:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701041278; x=1701646078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g2nzefL9abJS3V7F5jIo1B7LNOEauW6WFlyZ4XwqLeg=;
        b=VynDfbuQDIBYQKRr0HQ6IXr1TVcHBpOf57XyTp0djCSUPxaMcsDQJYRlTmLG9KC+Lt
         UbAW553nkVyxNxh4TntK/kWIaCegz39Eu76e9yie9VzwX16svCUMr51PO0ycKUhrcDk1
         pYWYmFMiy27Hwtl4KNgbD7Op9v5KerG3TZs6mZbejO+BSVQYV+2lB6QFqms8CJtbNWbG
         /+9B9rMg/x8/LwxQY8Pg5OJDrEfdKRYQIBfMUjQy+Yfj+JnuWyY54qJrZkQZrYrl/+K7
         pce6wx/zGyU0N+TXFShSHY60zvwP1XjmTUQNwAzKuvwmtSkCe5cdiV3eEGni1SAe7Gqt
         lqKA==
X-Gm-Message-State: AOJu0YxOfXnCPwdZ/P0/hGO1dF0bgG7em2hquwGutWCdHZPY1wjf9Zx9
	GAOKyRSNYFEBXTjK00YMlde/zt7NiZTXNpmdRGPA31r5oDHKBd71HCnd26mzH65+8dqvSAzNGOQ
	99UNsN9W//WuM90EbHMS7ag/Qm/cd7b9TCKg/PGRmhMSE4pS4nnvOOA==
X-Received: by 2002:a17:902:e843:b0:1cf:d24c:7b6c with SMTP id t3-20020a170902e84300b001cfd24c7b6cmr592917plg.59.1701041278373;
        Sun, 26 Nov 2023 15:27:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH60lQE3aZPaurMVIV4axuHzu18clG+N8+FOTOm8l4AK/mfUHBLQos1lPIK8CEhfQ0hwX19w==
X-Received: by 2002:a17:902:e843:b0:1cf:d24c:7b6c with SMTP id t3-20020a170902e84300b001cfd24c7b6cmr592895plg.59.1701041278076;
        Sun, 26 Nov 2023 15:27:58 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y10-20020a170902b48a00b001cfb52ebffesm3123853plr.147.2023.11.26.15.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Nov 2023 15:27:57 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/8] Add JH7100 errata and update device tree
Date: Mon, 27 Nov 2023 00:27:38 +0100
Message-Id: <20231126232746.264302-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_152804_811630_C304B2EA 
X-CRM114-Status: GOOD (  12.08  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Now that the driver for the SiFive cache controller supports manual
flushing as non-standard cache operations[1] we can add an errata option
for the StarFive JH7100 SoC and update the device tree with the cache
controller, dedicated DMA pool and add MMC nodes for the SD-card and
wifi.

This series needs the following commit in [1] to work properly:

0d5701dc9cd6 ("soc: sifive: ccache: Add StarFive JH7100 support")

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-soc-for-next

Emil Renner Berthing (7):
  riscv: errata: Add StarFive JH7100 errata
  riscv: dts: starfive: Mark the JH7100 as having non-coherent DMAs
  riscv: dts: starfive: Add JH7100 cache controller
  riscv: dts: starfive: Add pool for coherent DMA memory on JH7100
    boards
  riscv: dts: starfive: Add JH7100 MMC nodes
  riscv: dts: starfive: Enable SD-card on JH7100 boards
  riscv: dts: starfive: Enable SDIO wifi on JH7100 boards

Geert Uytterhoeven (1):
  riscv: dts: starfive: Group tuples in interrupt properties

 arch/riscv/Kconfig.errata                     |  17 +++
 .../boot/dts/starfive/jh7100-common.dtsi      | 131 ++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7100.dtsi      |  48 ++++++-
 3 files changed, 192 insertions(+), 4 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
