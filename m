Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F5ECCD1BC
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Oct 2025 18:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AY96F8wH1ud4czqAr7xJElCvql58yrexUgn/vMOaQVc=; b=2mO+Z7PfxKBrOZ
	dtDrEfSTY+oVT2JCB/Ls6ET7Qk89Psed08ZGbkHkkt79DspTt7ifUAcx7hUniYcOJBBk+fdmU3bRf
	8hfhrwJOeBznsHWEtIxT6mOYWos9QsrxnpF4gjRqWcyPYAaSOR6c61FVU3SN1WiG06k3JF6waw4Pl
	FnqJjyOLEN5lDbAzkQgNQTKVP/XBvsNnJnZ5RBYYl46jbwFZWMO+mj7ZqHKpr1nEX79lP1UsMlekW
	UTCePmhiJH5Iaf5dW8nSczZ9O2Czs71vEZpjhs7O/QpTBqdCbz/JrLv1S9mvhz5DWbJ5fAxakRr6c
	PPoQsw2Y/cQTmcWjHdmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzb3-0000000789V-3GGe;
	Thu, 23 Oct 2025 17:59:33 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBzaw-0000000786y-46Wr
	for linux-riscv@lists.infradead.org;
	Thu, 23 Oct 2025 17:59:28 +0000
Received: by mail-pg1-x543.google.com with SMTP id 41be03b00d2f7-b49c1c130c9so812842a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 Oct 2025 10:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761242365; x=1761847165; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zZKnZFdnM3oZwGqheXR0h641QYDnGOp0D351J3S+oms=;
        b=2Bjras0jyneDhULnjN/HcXH53oPgmT2Jc78aqO6SW44cYgc2WYGS8wDmIjCeEjcg5/
         4ookJqfTMkXNxFNFMH1SO2RxOElp0UIScFHcmU/rI4CX3Wmi0kqVK247faVUshmi3tbV
         n6UmUZ4+Ecop0HouAMK/d9CUxP9NBPANbwn3h0FCmwEEG+Q/kMBVCNXZY7fqHxHny1i4
         1c/G6amPtHji8PB0XxsZ5IdGO2bsjpkSzChQs0OH1wnOuHyOTmS0sVz0UyWelAvowM9F
         1treATa0QKE/gR4GSArvH9LJ591lg/ZptNfSJy0NeVUIHYM1grlgpDUPjAE6T0y5/Ykb
         TDig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761242365; x=1761847165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZKnZFdnM3oZwGqheXR0h641QYDnGOp0D351J3S+oms=;
        b=Vg17PI2wSG608K4rPIRPPptZSKFVbjcolpaN9LUjhG7nfZ63jdqZK9gLnMq66bG/r6
         Oo2dIpv61fSu+s+d2wFxxX+u01PNJT25dpcfVO5TGji1EDR0pVrporxhesti2MZdivY/
         9JIDLDEj2g/ffhy/1H/nyx2zFdqXu1rlibBSHgNn8nzA2K+SKNAxrsU+JlYitFL8jDhR
         MolxtJ/mfSqR3AFV4B0ICNasxudMUsPDWUp/hYpz8bOCTHGllJ5NGvs4ivhBfaCfDYVC
         qgtL6DQfcRYdWXZ9uk+9okSvgxY6T6s9K/puseXNFSd6M6vMD0C9cwy5QJtEv2wWoeBV
         sSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCXcniiCRTDkAoz4FBvDI3Q5ethF/Jsf9l0M1oZG29GBsdl+ugSOXkKROAq5KxJN0WPlTje1WJP/BjeYWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxkdN9u0CvLVjrRS43nQsmfrOk0fWb2gR3Oo7oUiZE73Q7zkfct
	8btNqk/M2+Z9KQ54ciViSnEwgHMDR7va8JXWSupwFN8F1fdgT0NBRSPk800OD1NBa+c=
X-Gm-Gg: ASbGncv/o+yrRN127ae7mocziaowMBFo5oFJJw96FWq2UPIe9a2AebR4zBP6M/gujRm
	bode8Jw/1se3hUq/CsaXjx7zdTZ40WM8rJJI9EK16MpxI8gmcDf1wgGz2euJhz5Iaa42A72zxmC
	h+zLaxdFUGHzxFdFUknRm8Y1MObPeU9nJmRxQ63pGGli3v9Qh0+OsjuxFQHABNtxPE7Ug5jXlY/
	iqIfdXwFShqPruLu5Xd2GSGk7S5zaHo55ze/fsJ1n/8aRJObUI8tIJ70hy3yovOOtiIdyL+rgN+
	QVvHRad19YRcReji81eSXpId95qIc1bFuM2Y6AK9rD9D5B8u+5aJKzXN6dLc8FNWX2qnCSHLVCX
	vuCLx+N2iePpMI80RGzfe0Y2WOxUNIcJ/cqxmZ3rGplJTAtTG5n/Pj5LX0yjdu6W9McB9OQ4iPW
	Msyp+yKsPI7z9bja0LXeDF4q2Ls3YQMHGKbg==
X-Google-Smtp-Source: AGHT+IG8JoJ2ND1pyiQh1ApMIuQ8AB6jOUuqQ1+8XSa1Ou2nNF3k3D9kPXQ1PKRoMYU7/mYJQIadTQ==
X-Received: by 2002:a17:902:cecb:b0:27e:ec72:f6d with SMTP id d9443c01a7336-2946de3d929mr41775405ad.11.1761242365381;
        Thu, 23 Oct 2025 10:59:25 -0700 (PDT)
Received: from zoltan.localdomain ([208.115.86.150])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d1265sm6447431a91.3.2025.10.23.10.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 10:59:24 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org,
	pjw@kernel.org
Cc: Frank.li@nxp.com,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	geert+renesas@glider.be,
	cyy@cyyself.name,
	heylenay@4d2.org,
	conor.dooley@microchip.com,
	fustini@kernel.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Thu, 23 Oct 2025 12:59:12 -0500
Message-ID: <20251023175922.528868-1-elder@riscstar.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_105927_253558_ECAB29E5 
X-CRM114-Status: GOOD (  12.68  )
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

This series adds support for the SpacemiT K1 SoC QSPI.  This IP
is generally compatible with the Freescale QSPI driver, requiring
three minor changes to enable it to be supported.  The changes
are:
  - Adding support for optional resets
  - Having the clock *not* be disabled when changing its rate
  - Allowing the size of storage blocks written to flash chips
    to be set to something different from the AHB buffer size

    					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v2
  
Version 2 addresses comments recieved during review of v1:
- The "reset" property now only applies to spacemit,k1-qspi compatible.
- Patch 1 (previously patch 2) now points out that this is the first
  non-Freescale device using the binding.
- Added Frank Li's Reviewed-by on patch 3.
- A quirk flag has been renamed to be QUADSPI_QUIRK_SKIP_CLK_DISABLE.
- The predicate for that quirk now returns bool type.
- All other similar predicates now return bool type; this is done in a new
  patch (patch 4).
- If non-zero, new field fsl_qspi_devtype_data->sfa_size defines the
  size of the serial flash regions, rather than ahb_buf_size.
- A continued line in the Kconfig is now aligned.
- Patch descriptions are wrapped at 75 columns.

Alex Elder (9):
  dt-bindings: spi: fsl-qspi: support SpacemiT K1
  dt-bindings: spi: fsl-qspi: add optional resets
  spi: fsl-qspi: add optional reset support
  spi: fsl-qspi: switch predicates to bool
  spi: fsl-qspi: add a clock disable quirk
  spi: fsl-qspi: allot 1KB per chip
  spi: fsl-qspi: support the SpacemiT K1 SoC
  riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
  riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 16 ++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 87 +++++++++++++------
 7 files changed, 124 insertions(+), 26 deletions(-)


base-commit: efb26a23ed5f5dc3554886ab398f559dcb1de96b
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
