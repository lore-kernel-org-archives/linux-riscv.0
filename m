Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6210FCCF9EA
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Oct 2025 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vGW82FdmVtfmFvK9Aqo8F35Uh57bvOkz1IUzWjkF9Eg=; b=jwLpjfbHB90Gi0
	X+3x57jSQKYZPGIF/4KPUhUjSLb1qehJ28Hg6hxbPXLIm5Zv5jc9PLptsAWN5utJ4iGJBgfV2KBXL
	v8Sp3WTg4CQlqaqDE5gtJ7Kv+Aj9Z22CtgNRIv2cKFPrS9QxYxqNNdqR0BxY/lGSyPAQBn+dZ64XQ
	fsCsehPRYxhT7vtOtjdtkKIQQcL9DaG8PzOkJ4/yJ6RiOXgUt5esyzjN6XJ8RY1ppVyC0kgW65KfI
	ZMKUIDANQQd4TSocs2sjINl7hQG9JUVdXkJRcWKwVvD23/pmmyrSwp4xSyJ9+w0YZSV2K1H+pJQBn
	j4iongIAzgd7CS1nEM9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIe-0000000E1uN-1ceS;
	Mon, 27 Oct 2025 13:30:16 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDNIc-0000000E1tO-1BqY
	for linux-riscv@lists.infradead.org;
	Mon, 27 Oct 2025 13:30:15 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-42e2c336adcso19427745ab.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Oct 2025 06:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761571813; x=1762176613; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qJjnQ8pdDtk39CSCRJz3s2YRDUVOeo1DO713ElfxvCI=;
        b=fGRm+Pxeqw2CX0YnuIhDhTh/QuQFj5W+JsRzMUVUJEEoDh2d5K7cmeCxyGS7Hv0ncX
         gQ8H3JppK+8AwGpz1ZIIHu6nn4wyRNrA5OaDUUEUfrjQhEH7VM3m/4Nmja3T3JMdNMmM
         bReM3mNmahL5QeHlCNrFHWeDJ6MG/acVvB7QS4eDwCF51X/ob6e+tbEwycIbHWAP2j/G
         XemPJsPk/D6eOljeiwNrAInPoCKCmsswOeIfIbbhTXT3TU7dniFQxHTLBBmEGFCfpvD3
         oSfx9OCUC3Ee7473AGdSnrIxylPsm2oVb4Zmu52kP7Fzo6r90nAK6I0GdBjUMgSoIeOW
         GgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761571813; x=1762176613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qJjnQ8pdDtk39CSCRJz3s2YRDUVOeo1DO713ElfxvCI=;
        b=wUzBitd2+14NpZLimNZSfESpa6ZAupKRtVs0mou+XbQFU99REG/rdIs19y/lDLveRv
         EQgwGK6gnJLN4KObbBg23fDnHcBB5U1x49JwXzWryYjs6rWuwr/P1Ezxxn3vjPnm4Qxd
         AQHeVLQJH7ng7AXxgEgoZmxG2qEl0bWJybiM9LPGDSOXL4rb4TnJ4rIcyqYkZ4sftDF8
         Ukx04DAiI5JyoVoVziCPX2HXwynBv8tWrEJNIhPb2jTnwvsyVCBZyrQoa6UmEODLplct
         BBXubqEgr63Wm0mlIU2rJUEfHNxznwvKuMvF0xbfMt2cKN2+3aYZpicpXNXxvc6N1WfP
         y7CQ==
X-Forwarded-Encrypted: i=1; AJvYcCV73lFZ3c54kN+N8u6jq9n3ZJqIFrz6JkfSpmCHrTEj32PzhUHAAzR21MZBzDWR+LBf+u2ZNUc67iR1Jw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6eqQWUgNVhW3LN6QhFdIYdVmRHryIt8ztjb8usnOcGIgnkFZY
	9IxOrh9lMReXifuLa1j5Wr6sbhqSIlzJTT6CcWmOTYu5q8Iw/0pMnhNPmUhB+P/FSwQ=
X-Gm-Gg: ASbGncseY82yLBbopQRib4A8JkK+UnK8eSHLHHrR5kGAYGisLxzyZptAJI7iKwJ90Ob
	6yBgzeS+jnY/YFZoJ2jcrSt4/bXIZoLZDKYyCPiiTWZ7e2b8ym7zc7ihAczJ3cFwwgc1mLcqwX5
	1rwF3GbYqBCEhUPVM1/UM4Kkh5oGcMZK75WY0+6vbF1XTIFx/wGKZrVk1UF+S5MyQr1ddlqk/S+
	fWvBY2k/1OtZjtzaGpP7ppu5FgNZoujTpTem+PK1AZMuvv0mMv3SvTyQLKdJyKcQ2OxzM4LFjaL
	MRd60gsrPgDw756Xc+IIEzM6cOTGlgJx43tppT9Krq7j9VbdNLkPlBxTTbx0ewBQgzOiLz6JT+Q
	4udYUub9EzviJ0yY/VHxhSbzZ+tW/07G5tyDUb3jQVVAED0cOzGQQVAj3jilmq45QkpDdknWjh7
	byka47LesQfR4BVCnjPaZ6n2wYzDuqnVxm65XvDdtQH9U=
X-Google-Smtp-Source: AGHT+IFP3NJHkfNDLkwaf4zEjacSbOyB2CKC3rVjLUaScafS/uUg5QntItE3fUUUdGBa9LYYuVS1mQ==
X-Received: by 2002:a92:cd8c:0:b0:431:d951:ab97 with SMTP id e9e14a558f8ab-4320f77104dmr1324625ab.15.1761571813243;
        Mon, 27 Oct 2025 06:30:13 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5aea78e2fd4sm3093057173.26.2025.10.27.06.30.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 06:30:12 -0700 (PDT)
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
Subject: [PATCH v4 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Mon, 27 Oct 2025 08:29:58 -0500
Message-ID: <20251027133008.360237-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251027_063014_337048_F2A5F78F 
X-CRM114-Status: GOOD (  17.05  )
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

This series adds support for the SpacemiT K1 SoC QSPI.  This IP is
generally compatible with the Freescale QSPI driver, requiring three
minor changes to enable it to be supported.  The changes are:
  - Adding support for optional resets
  - Having the clock *not* be disabled when changing its rate
  - Allowing the size of storage blocks written to flash chips
    to be set to something different from the AHB buffer size

This version of the series mainly adds sign-offs provided for v3.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v4
  
Version 4 incorporates comments recieved during review of v3:
  - Moved the allOf block below the required section in patch 2
  - Added Frank Li's Reviewed-by on patch 2, 4, and 5
  - Added Paul Walmsley's Acked-by on patch 9

Here is version 3:
  https://lore.kernel.org/lkml/20251024191550.194946-1-elder@riscstar.com/

Version 3 addresses comments recieved during review of v2:
  - This version fully tested and confirmed to work on BPI-F3
  - Added Acked-by from Conor on patches 1 and 2
  - Added Reviewed-by from Frank on patches 1 and 6
  - Moved the reset property conditional under allOf in the binding
  - In patch 5, needs_clk_disable() is no longer inline
  - Tweaked the description in patch 5
  - Renamed a local variable to be "sfa_size" in patch 6
  - Changed the subject line in patch 6
  - The sfa_size field was not being assigned in spacemit_k1_data;
    now it is set to SZ_1K

Here is version 2:
  https://lore.kernel.org/lkml/20251023175922.528868-1-elder@riscstar.com/

Version 2 addresses comments recieved during review of v1:
  - The "reset" property now only applies to spacemit,k1-qspi compatible.
  - Patch 1 (previously patch 2) now points out that this is the first
    non-Freescale device using the binding.
  - Added Frank Li's Reviewed-by on patch 3.
  - A quirk flag has been renamed to be QUADSPI_QUIRK_SKIP_CLK_DISABLE.
  - The predicate for that quirk now returns bool type.
  - All other similar predicates now return bool type; this is done in a
    new patch (patch 4).
  - If non-zero, new field fsl_qspi_devtype_data->sfa_size defines the
    size of the serial flash regions, rather than ahb_buf_size.
  - A continued line in the Kconfig is now aligned.
  - Patch descriptions are wrapped at 75 columns.

Here is version 1:
  https://lore.kernel.org/lkml/20251020165152.666221-1-elder@riscstar.com/

Alex Elder (9):
  dt-bindings: spi: fsl-qspi: support SpacemiT K1
  dt-bindings: spi: fsl-qspi: add optional resets
  spi: fsl-qspi: add optional reset support
  spi: fsl-qspi: switch predicates to bool
  spi: fsl-qspi: add a clock disable quirk
  spi: fsl-qspi: introduce sfa_size devtype data
  spi: fsl-qspi: support the SpacemiT K1 SoC
  riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
  riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 21 ++++-
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 88 +++++++++++++------
 7 files changed, 127 insertions(+), 29 deletions(-)


base-commit: 8fec172c82c2b5f6f8e47ab837c1dc91ee3d1b87
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
