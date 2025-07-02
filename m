Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D583C83013
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 12:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tFgNW9ZVdUibIM7meTu09fILcvB9zffTZS4+PU+yTBM=; b=jryfNX7DNwPIGq
	N54EniM61X1RUQfYDbYRRC4esM4qJZcZyCLj3SPdUPEvcLqFgygCivCQgxbtsGc7AFiWFB3bUOmuI
	ePnbs6/XKY5NY7W0bDXErbpOoBnL0Sb4zII5TTrlSA+IjXtQnZirF4cB2v8wQGa3IydVPmvBNIPDu
	NUEjSiCTzgjtfHKSZx5cDbxcAFjkTZN0Ttae7HYAn5zyj35HczgJk7FXSRUVgQWuaHFfCRPnM61wi
	s/j7urf4R++lrXHklG9UcJK8ChQAVbvxGyy3HNidq3P1F5g0xorlWdSuaZIYfNkiBFKc3RbYeVkn8
	hlVDuKr0rphcaSn0jWRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwV6-00000008Ign-2AnM;
	Wed, 02 Jul 2025 12:23:44 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWvm7-000000089ZO-0ULn
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 11:37:16 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-7d3f192a64eso610408185a.2
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456234; x=1752061034; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuzsZX0ECM0P7YFc0RDsIs6MtWj0mR7kFmi3VabZ4io=;
        b=mDnPoSwq2P0uT8GjeOPUtpDs6j2CkF33hUyKddVlgb94qDIhP275tRJ4N6jXa9EkHo
         Q/maw27H15xFERzdTFP84HZbOg3N+kcHSrdG79ptkJTy6dcYlAdp26OCRDxAR6NZueE+
         ppnwO+7TqUbKSVUUlTTE3qZCefGEaqVRd4MwyxXbPOMLn8vjXsaCwzldNfcF1PNg4Hdc
         HT5IjRxwgGDCBFjLwfPs3n+PGdkmnHjMTtMxTPUkNJkrT6a7z6RRqwIk0HgJ8vcRoWJ4
         FXo9NAH/naFOrlYSOb0c92DP1JlfQ6OwUOM0mPYrLUMegqCQWCRKiHsPAO5DhJU/8z9N
         LLnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456234; x=1752061034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuzsZX0ECM0P7YFc0RDsIs6MtWj0mR7kFmi3VabZ4io=;
        b=xNCHzgdRjc9h47346BoQr8uyTEi+3zTYZY5aSh0RUHOYRBqTfh5pwiqW3mF0fQOFf0
         76sMm081dIXV4iZ6cUeKvVbGTav9DaIWYpyWna4GBLtH3bbuX/bO/5rcECvoPjh4Nqhs
         xuSFHUsC69zg0Qd5v1jHWAoccqarU7MdD8lBCfUnoR6hO6qlvt2QKv21Ym78Ualw5JIN
         I0UPOcRTRGM0Iqk/nIopovsORF9LnlpCDNXqiuQZ9cXIsLhbCdT1OXX+n3TG2TFx6aUL
         E/JXvMFXzLgIg6iAgMVgPdi5n7IFG0MV8NgVqmaoip9vTHCdC74FOa947fjgbt2W240+
         0XVA==
X-Forwarded-Encrypted: i=1; AJvYcCXHiJKiWXMjO+458HQLHLta9cDLG4k6r7M4s4BPXe949m4hw7P87upeVhxSrXprt6PMATYv4a/0queE9g==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3545+1p99VXC9y8VC4/K/+d3uLMth1aj563PDwaRd+BmNBJAU
	uKVkyQ3v+p9DEkQVvwa+LBzMptczUECrv0AGNInPAZ/AvoFFW2mUIUFrHcSfx0eASII=
X-Gm-Gg: ASbGncuK48LoiWKbDBhuy8jXGBPEvR04JL/M010Fv/w2uiRbJ6XlDEFWYKarHDg6foM
	5CV6dqgwIR32YNsnvExfDo/DfiqsXnxGTZvjSHPQ2pryK+h5EcKT/lYmTs3pPtWoRPOqMByux49
	pWIxTxJQ7TaBmh5RuUmiu/4HNtKq13/cAbqf7bZzvCihRPWZ6jhqcljNMAC/mOLBSD3FvZCCTq7
	5AUdVYoqovdcIlnKXlYMua8gXD6abtucL5reVjnJyrYmU7Pm0ge9HZBe2xdBKtev6YQN/oRsML0
	T/KpCHF5FIJ8hKnStLDZjKNVIlpVfMC9tvrvqMKSo6Ah68AUKDs4mMPL2QLLCbMo+Wp4gIaAD2+
	Zn9vd0e4R5mFv1PoZMj+74U+LfZb58e4bFB0=
X-Google-Smtp-Source: AGHT+IG2imp757tfBUch+mPjlrSo4FqLZrnMd87ikEDlzWlfKhJEzuvvcBO0t/h7py81wq3vTreWwQ==
X-Received: by 2002:a05:6214:415:b0:700:c46f:3bd with SMTP id 6a1803df08f44-702b1bab600mr37043216d6.25.1751456233867;
        Wed, 02 Jul 2025 04:37:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:13 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v12 0/6] reset: spacemit: add K1 reset support
Date: Wed,  2 Jul 2025 06:37:02 -0500
Message-ID: <20250702113709.291748-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_043715_157052_2AB1C7C0 
X-CRM114-Status: GOOD (  13.19  )
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

This series adds reset controller support for the SpacemiT K1 SoC.
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

The only change in this version is that three of the the four resets
associated with each PCIe port have been renamed, to align better
with their corresponding clocks.  This affects patches 1 and 5.
For example, for PCIe port 0:

    RESET_PCIE0_DBI	(no change)
    RESET_PCIE0_SLV ->	RESET_PCIE0_SLAVE
    RESET_PCIE0_MSTR ->	RESET_PCIE0_MASTER
    RESET_PCIE0_GLB ->	RESET_PCIE0_GLOBAL (no corresponding clock)

No other code has changed since v11.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v12

					-Alex

Between version 11 and version 12:
  - Renamed PCIe resets to align with their clock counterparts

Here is version 11 of this series.
  https://lore.kernel.org/lkml/20250613011139.1201702-1-elder@riscstar.com/

Between version 10 and version 11:
  - Rebased onto Linux v6.16-rc1
  - Redefined several "multi-bit" resets as individual ones.

Here is version 10 of this series.
  https://lore.kernel.org/lkml/20250513215345.3631593-1-elder@riscstar.com/

All other history is available via that link, so I won't reproduce
it again here.

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 +++++++++
 9 files changed, 775 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 +++++++++
 9 files changed, 775 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
