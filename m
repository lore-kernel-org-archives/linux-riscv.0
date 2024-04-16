Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFF0EC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 09:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WdX2rf9IHfYQErEulqKr7CpsTQGWslZNjbM/39KQlL0=; b=q6Zy8E8V37Btj9
	77qJ/SqPdekac9JlWBKBkbiAZ4jesJozw7zL41l7ZPhpX+HkeCk44ybSvfYCMcygmd2CFioQQ0J+s
	L+GKX6PDaXHeHE8MB7saabv9NYS/d4JEPXQFvC9S0EIlMrMChOizpFwkJz3D/uLz8m9j9jDMG76Qz
	REYWvJJF5lfTDBUTReGNy2lVXsRHJmjMG6ZT54OhXub7gvVZEL1En5dOfxZTQ+2sawUbe6rYwyVqG
	w4MGxcItAMsGFna8kxmoXkb0L3JymohxRC7eVOGZ4bggR6PrWEK+v3jNnY3CRYvSDyoCGo3vbfBRr
	xhATElKkCIWcKDHkMATg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfSR-0000000BetQ-3zEJ;
	Tue, 16 Apr 2024 09:50:31 +0000
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwfSP-0000000Best-0tDZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 09:50:30 +0000
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5aa318db8a0so2755200eaf.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Apr 2024 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713261027; x=1713865827; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzPu/UiUvA3k3gEc6xFuTsUjWTRQgYweYisjZPbivEY=;
        b=bn9LPdU0+WXeT1aFJL5JUNoqdxlsJ4WqQAYeAabsYAeCqHcXz4U+tRTDgpOhASeqPP
         S66ky5sLwZBb8pTw1HZrEVWTPTuFOy5HE2mCub+pizTFluqgADI0zzbpyqueZCSutuR/
         CVxvHTq1Zk80ugQUAQMouHKIwWjSjEKxteiagSUncRC96kp/9ls9U2fPAi9us+3SjXJ9
         sVwg862dzLHUnLNEqcxfNTHbEDqh4RFoU4pxWWMukrWhMaUg9wvf0JDAZ4s8Wly+CPGk
         w8AZbB4ixcfEAapY+/Sv8j+yqOmnfeq4q/JJyv776KrNg8kGBA698ZMx43LG0Mrif//b
         avtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713261027; x=1713865827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzPu/UiUvA3k3gEc6xFuTsUjWTRQgYweYisjZPbivEY=;
        b=J5QpapqJfvek3oArqFmVQKCUW3BEFJItS7UbIW91/Rkkuw5UUt6LGoM7Ag0K0eYj8c
         87IVM0vwzy2QwKhfF2DWh8duTWOqRYX6iKYK80o8kbxiCZ3Fx5XNPGt9CKWeWwziL7ss
         8MKbfgYzkygEbeMKAww5AwqeG/QAAMj3MMIhjSvKdk/9syCYCbKEvttvds0++xmptH8b
         i9gCwnZzNpDsn6FvMfMVzDYHItiXwhS3bwMrBzm/ugkGN0hSIzjmSiG/u56fO2c4W0Y9
         aqCOxtwDbYAjdoG67JXJbEngg86K6piOkuPFk7R1AFxRVNvIax5uzV5i33E7AC0L0NIX
         iSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhsFGYk4BCHbxDy6vj07viS2duw9QDHNG3h92R4KkBWnWIv2K9EPylR2vPIx1+dUtMQ0CAKiVilWa24T/TrH0epibKn1rXO+QhnWXZXoUF
X-Gm-Message-State: AOJu0YyCUSrIz7QViWgFnTezWZ40zVQ8ibApO9cnPNAv6oiEcEvFCDvP
	bh4xoe/csDXNho4+uq8VpJSwbx6L7CBL/l8KxSf/Zc1W2pLJ9Zst
X-Google-Smtp-Source: AGHT+IFnGRfaqTMKMw+sqVlviPGyiJjLh5HEIewQkEWrBktvio2oxeHymaib3oW5wQ8ddqOkyMzKGA==
X-Received: by 2002:a4a:1a85:0:b0:5ac:9e85:59d8 with SMTP id 127-20020a4a1a85000000b005ac9e8559d8mr5605165oof.1.1713261027313;
        Tue, 16 Apr 2024 02:50:27 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id by27-20020a056820201b00b005aa4e48efc3sm2460056oob.37.2024.04.16.02.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Apr 2024 02:50:26 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: adrian.hunter@intel.com,
	aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	ulf.hansson@linaro.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	tingzhu.wang@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 0/3] mmc: sdhci-of-dwcmshc: support Sophgo SG2042
Date: Tue, 16 Apr 2024 17:50:17 +0800
Message-Id: <cover.1713258948.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240416_025029_282062_20BB6DF2 
X-CRM114-Status: UNSURE (   7.15  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add support for the mmc controller for Sophgo SG2042.
Adding corresponding new compatible strings, and implement
custom sdhci_ops.

This patchset is based on v6.9-rc1 and depends on following pathsets:

- [PATCH 0/1] mmc: sdhci-of-dwcmshc: enhance framework [1]
- [PATCH v14 0/5] riscv: sophgo: add clock support for sg2042 [2]
- [PATCH v1] mmc: sdhci-of-dwcmshc: th1520: Increase tuning loop count to 128 [3]


Link: https://lore.kernel.org/linux-kernel/cover.1713257181.git.unicorn_wang@outlook.com/ [1]
Link: https://lore.kernel.org/linux-riscv/cover.1713164546.git.unicorn_wang@outlook.com/ [2]
Link: https://lore.kernel.org/all/20240402093539.184287-1-bigunclemax@gmail.com/ [3]


---

Chen Wang (3):
  dt-bindings: mmc: sdhci-of-dwcmhsc: Add Sophgo SG2042 support
  mmc: sdhci-of-dwcmshc: Add support for Sophgo SG2042
  riscv: dts: add mmc controllers for Sophgo SG2042 SoC

 .../bindings/mmc/snps,dwcmshc-sdhci.yaml      |  67 +++++--
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  15 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  32 ++++
 drivers/mmc/host/sdhci-of-dwcmshc.c           | 173 +++++++++++++++++-
 4 files changed, 264 insertions(+), 23 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
