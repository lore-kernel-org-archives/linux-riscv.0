Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7BB6C46CA0
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Nov 2023 15:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v5URVIFNxtJJcuhpbImSCnzPEcGSxaKI3HfDqYVaM8c=; b=kteZ6WANlR9CcC
	mSK3PK2egmyCMh4nWaRCZlWR0U6k2yjic20wPo+0x98UbbbanuysSu3Kr4EneuVAs0SGlAjHRjgFs
	uYwKlpJnfQmksJx/ABubbigPYiNJPMBBqLPdvk2Rp0gbI0UME/SzsjjxJA50IIFJ4pQ1VQ+vbtPEw
	cAl7NQ84SrQqGfrK6AzU7XBKXTzTRoe7BqH6hFHCHpPDUnM8ybSrNGsIwYtO/ZlvexFaiYoS8DID8
	OqIumOxO5WSQAu4bEkIpM7HDFc208xEP7yF/gOS5+aBBrokP+uzD3yhY0pBLd3LYr8Y9aLO+9H0vg
	hqcwJ8Bk9yD3laO5LtWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipY-00BBZ3-2F;
	Thu, 30 Nov 2023 15:19:56 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8ipV-00BBXQ-0g
	for linux-riscv@lists.infradead.org;
	Thu, 30 Nov 2023 15:19:55 +0000
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 54AAA3FA56
	for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701357587;
	bh=umcOEKGECYpQBlUdbsEVmcT1M/LVbcCDI05+VTUKHOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=q89PzaPaCLrDbDdYoX0ZNI8BV5BrspOZHplJhtCJD8Zy2vjqGGx8yfbTV31yRJbA4
	 mo2LToi623utNaW2eMY0GLNEDRLs79jMZTVFdgs5cEGBt4/yOKsEroZ6xJly2+E3jp
	 mXXOWPTcX2yVsNnTC26I3E/7phcxtBj9o05bFBav9IQjbOoF2x2xMAWa9g/XR9ENbe
	 5rL3V114Lby3WA6iE9+cgDzCN3KEEbQmrwU5z+fme0G4U81joLZnKLfQ9mShI3DktV
	 dPrm7fIE8qYQr+sJvnmBSidkH0JWoubYUNx16mYiGLn/PnTufoAMRpp2Cj/CAyezE+
	 psb08PsAXHONA==
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-6cd856dae82so1117836b3a.1
        for <linux-riscv@lists.infradead.org>; Thu, 30 Nov 2023 07:19:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701357585; x=1701962385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=umcOEKGECYpQBlUdbsEVmcT1M/LVbcCDI05+VTUKHOE=;
        b=T5LH/qC4mEZVAzgiz2cygTMVF76uIIIBBmZ0sArZdpPuHwmJaEEHAtYPb15g8/11tn
         TDTgHHf8N7F1uJGPcRgt7kdE/A8/T39YGYNCgY4NCFKB4jSUGS2ZWkfeiIz6+8ES6+PT
         H0FDHLeAxCQeggYW46HasaYcX/9SmvbM8Vl6HYNtjTCUvSdiljWQg7eorlnOUFENFlQY
         S/64lDDVVsLbAP7Abnc27g6/zx0xCnUgUusOoNNz334Boh10s/gCTHy7Ti3oGb6t52cQ
         njoF3aBssGBa+UMzVeCnyywUJFV1uVOZCiuaa+LWNOcrxm4X7IUjMR/tHCPx0EMQmP3S
         BW8A==
X-Gm-Message-State: AOJu0Yw80gGtyQEyTK5M08yRFc36KVKmS1BTInwQAStP9MvK7yVGi1Nj
	dLOSPR7ZN1l2d5pLqtSJ6TdOZIfLvMekg3dzFCsCvmN9ztQ51fQWtHTSvSZrs2hzfEzwF6DAHqA
	4tQCsHCqNTJu7WSQDzQQ4vb3yyLknXV7Z6jZttpwTrPELUkv9sxVNjg==
X-Received: by 2002:a05:6a20:7f98:b0:188:290d:17dc with SMTP id d24-20020a056a207f9800b00188290d17dcmr23726545pzj.60.1701357585114;
        Thu, 30 Nov 2023 07:19:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEh65TpHQMiSKOAY4Ol//p0hGEk6OSzzktrSG601vYWHN3rGxFgZXjz0/38VtdY7gQaQkl+JA==
X-Received: by 2002:a05:6a20:7f98:b0:188:290d:17dc with SMTP id d24-20020a056a207f9800b00188290d17dcmr23726523pzj.60.1701357584835;
        Thu, 30 Nov 2023 07:19:44 -0800 (PST)
Received: from stitch.. ([80.71.140.73])
        by smtp.gmail.com with ESMTPSA id y125-20020a636483000000b005bd3d6e270dsm1356002pgb.68.2023.11.30.07.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 07:19:44 -0800 (PST)
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/8] Add JH7100 errata and update device tree
Date: Thu, 30 Nov 2023 16:19:24 +0100
Message-Id: <20231130151932.729708-1-emil.renner.berthing@canonical.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231130_071953_510342_941EA1D9 
X-CRM114-Status: GOOD (  13.36  )
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
Cc: Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Geert Uytterhoeven <geert@linux-m68k.org>
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

..and its parent for dtb_checks to pass.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=riscv-soc-for-next

Changes in v2:
- Add Conor's ack on patch 1/8
- Add my SoB on patch 2/8
- Update commit message on patch 4/8

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
