Return-Path: <SRS0=ksV6=Q2=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B161DC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 11:40:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ED912086A
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 19 Feb 2019 11:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c9lXZP1y";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="csNkuCjU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ED912086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=pIX6vIHM5Fc+c1r+ezKRAvbLdEKzFxMReI6O3aqz7fY=; b=c9l
	XZP1y+/r8f8nVlZIBjPEwekdc35vov8bIjn4M8QByLsJsJbXFmPpVose2RvbNAwIe70MRivnY8K72
	GbPQBVBWuj2QG92o6rarzfAgHIHu0OsD0Av/bsKpvIoiRK8XhnhZbAUBKbytjQElM+r4hcFKDvWK6
	ypDuTl8AuQOFwXIkSbxWVeEg7aeFy+KKllijtYtg+jZcNlLr1e+bPeAfikWuEhOq5y1v7zzWJ8Fot
	K8vaP5F+8RlRar5qm0nqAZw7xaGK3X3vxowm5yeWDBl92zxZUUNVnCei9MK4Ml9alRmtxA48061Dc
	tpxazPn8rQhqsxkTTAqJlyxCEGobrzA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gw3lX-00072Q-Po; Tue, 19 Feb 2019 11:40:47 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gw3lV-000723-5q
 for linux-riscv@lists.infradead.org; Tue, 19 Feb 2019 11:40:46 +0000
Received: by mail-pg1-x544.google.com with SMTP id s198so10033002pgs.2
 for <linux-riscv@lists.infradead.org>; Tue, 19 Feb 2019 03:40:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=DQZHSSspZBlsenwx5k5O9poRCEoCd4P+xUehuph/A9U=;
 b=csNkuCjUKGsXUpAI1PL2/U6szs9hyeTkh9euBYymEkdYBep5pyzOlMSkrsjEI4z77S
 J9Lq9z7Fgr6mS4iG5LpBgJNoLx4I2LTCB7glT/LXhiUptGpYS7uu+TjlsPaLyA45R4tt
 HPyujdnm7H4RMlSEFT0Bk9G6ctVZo+5R9OWo00gSpf54NSFRR/HRwhqLcgKRivwpXvKy
 gKGRgH5PfBSd3nyLrZre1Mem8YPMyan0SGoV45KCAFaqxGTf/Zr7a76pP7qIz0qoX8Xg
 VWbuOYGm7yNLQ9OV8paJNG152aPPts9H/iOsURpkv2uBBrDSDjnzay3FjgyhlEUM4Exu
 Tq+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DQZHSSspZBlsenwx5k5O9poRCEoCd4P+xUehuph/A9U=;
 b=evumwaE3ABXpkSHcake7jmNCDN7zfTHNqc+wdVNr6QifDIlRvWXpffe4XSHHw/m4nY
 p9RWhZeBpSJTuqLRonSf9a5/ObY0rApK179/0+W5kSnhTanbzaeABOwdLIEqowLhkgXE
 oljos9gu1YGimOp9eF3+CVwl9TaH2embZ9Y/B1UzDdpolCn1mP0d2pgwjyAcQ3EhOUPT
 3dBga3tE2+wRdpIkAvTlSCCgTH5CNjU8U74egVqA38QI9pkUaRjJT5pukbXJtl09PnlV
 bIJFsnmQK33QMpoH2kLMYq6rVoZ0xXZLZ6xpMoPDl5LQT32RBpPn1BF2zHOrjLBNzXSu
 x9UQ==
X-Gm-Message-State: AHQUAuZ5eB+KSNFifejmhLzT5b1FHm/9Zi0v8MLzHFQIQMlG8ZrtXXTw
 Qx9yJpf3YLvoec2a5svrX79BZw==
X-Google-Smtp-Source: AHgI3IZclla3/S38bs8rCfTC1zJTe7P4s7pX6RBtEQGf/r8s4L3fqc0TDfoVZ+3j1ctCuFiW0RaD7w==
X-Received: by 2002:aa7:83c2:: with SMTP id j2mr28839490pfn.119.1550576444085; 
 Tue, 19 Feb 2019 03:40:44 -0800 (PST)
Received: from buildserver-90.open-silicon.com ([114.143.65.226])
 by smtp.googlemail.com with ESMTPSA id t3sm32250678pfa.50.2019.02.19.03.40.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Tue, 19 Feb 2019 03:40:43 -0800 (PST)
From: Yash Shah <yash.shah@sifive.com>
To: palmer@sifive.com, linux-spi@vger.kernel.org,
 linux-riscv@lists.infradead.org, broonie@kernel.org
Subject: [PATCH 0/2] SPI support for HiFive Unleashed
Date: Tue, 19 Feb 2019 17:10:05 +0530
Message-Id: <1550576407-17778-1-git-send-email-yash.shah@sifive.com>
X-Mailer: git-send-email 1.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190219_034045_242750_D847970D 
X-CRM114-Status: UNSURE (   9.54  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, sachin.ghadi@sifive.com,
 Yash Shah <yash.shah@sifive.com>, robh+dt@kernel.org, paul.walmsley@sifive.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This patch series adds a SPI driver and DT documentation
for HiFive Unleashed board.

Yash Shah (2):
  spi: sifive: Add DT documentation for SiFive SPI controller
  spi: sifive: Add driver for the SiFive SPI controller

 .../devicetree/bindings/spi/spi-sifive.txt         |  37 ++
 drivers/spi/Kconfig                                |   6 +
 drivers/spi/Makefile                               |   1 +
 drivers/spi/spi-sifive.c                           | 450 +++++++++++++++++++++
 4 files changed, 494 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sifive.txt
 create mode 100644 drivers/spi/spi-sifive.c

-- 
1.9.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
