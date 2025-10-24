Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC0ECCF9EB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 19:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IeMfekzom2rlBxfYBqhhoLweT+il2TyS55faVdCupu8=; b=CHGA1l0ssWU8Gf
	spbMnW8tJ77LQYuLRcCi/So6o1c+XEEnm25wbe0Shz2HCSJwEP06lIrKy5cg0C4gfmt10WxhpmlWR
	0SAdufaJmtT6yGXJxJ1D45I23PwVUYDZKC+uAEchCUPV72GbOpwn5rcZPvE2vO92Wf8/lge971ZiL
	1h+MjW8Ob4b15uTga46vtTesWYPjWppPA/u+hyPta6zKn+Y/znRtGGPsRO5k2ninCibFfQGgBqTiy
	YtB8LzeIMO4kBtA4Wa4GAeswfVIJDzPxXzVg2o8dFKrnDTm6eK68XLC69HFVkOqdE6KNt/ALIWNKl
	gIK0WaY/MSBkS0Y7Zt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGZ-0000000AL4a-2VjT;
	Fri, 24 Oct 2025 19:15:59 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCNGW-0000000AL3c-152M
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 19:15:57 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-430e6ac6bccso19717935ab.0
        for <linux-riscv@lists.infradead.org>; Fri, 24 Oct 2025 12:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761333355; x=1761938155; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5hqIIxYoJfbzcFUkevnIvDyYXIbJhiiIxZ4aEshcKOg=;
        b=fvZZcz0BmAOWEzwquyS4/RwGpfkeYb6HU8x1Rmdmo+Y83LPg0ki0l1V2qeTeqSGP0o
         uGvjbzaiDusds4Mp6mh2We5mMhOaBXEoCCyvg/05F3zxJ13+Rnt+hX6Fcn4IfQKl2bCH
         wkWdHlOQJ0JEtEcPUnJPn6HXpkJdyyxWGuDKy/lskaJGpqOYpV5JJJ3714D3Ea93DOV0
         BjGBJNME+Kxq717BGELDADF/BZCAG8SzZsdp7V+PW+41xdAYqZgOygUzAmXhAbNLDTBU
         8E3JBv+/BOLVaubVRQ6dMlD0mxMEdQwjJsClYNR4m0jB0aOcRwTxXHm5sPzaX0HlLgck
         5Jmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761333355; x=1761938155;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5hqIIxYoJfbzcFUkevnIvDyYXIbJhiiIxZ4aEshcKOg=;
        b=OHRUhVGDWgpxOBdQEHo2rQHOOCeW6yyp4oH0GCW8FuKT1W2AzuQ2KfagHMogO1LTc5
         o/fM9G9YOMFqNVxe8Hj5FFitv7NZtdieABNkQocQn8wcTi9cahJXZv6K7qDfVdXMJxLW
         fqKcbnk7UTnTr9OM9ez0wXrxIznSJgTjLYd3zF0XQTOnLplBTRDda1pE1NjjZpAor1Tr
         FILz9R0mJQrUI4I4CMYHkqW+iSIVkVNgOk4VBe0pgG6Udre4S1gD6eWMRWRGXo8l7Fek
         JQ69kQQxmmDDZUcF1cmVXXhqIcV+YoXS3bXlzHvmv9Z087uw/P1pkR6Kj7irp+QztW8x
         mnBw==
X-Forwarded-Encrypted: i=1; AJvYcCW3kJzBtl4Aj7qcGpxwy+FafgAiGMsoG0hG1F2qi1boUfcolU90m9nX1Ms8+2DzfzB4TxojS4mNQj9nYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw2uTnKCPxJSdOpZzsHU/Cjf7Pzi9aZ8/aYQQTn/ITY/ad5cC+c
	lUGiF7ugD2buCNN1tTPz9tXg+ZzfuDlxAEMssNj3L5eOdaibKzYEAWBJ/E2Vj6mJ1/k=
X-Gm-Gg: ASbGncuv+1YGlt/h807EjUnbQ9XdefAhkgcHwvq82Hq5WF7Pb4BtdTXAy1NP5kKCFp5
	hVMAIavg7jB2OvdQMLkEspazBKqXsAdyE/b07Umcm2BKT/pKHlG7QUCBArRMwHGOC8ok3mrbKmA
	qj8elDrrbbNnN1037iBVY9UzvQi+BwcHpfCHWdpdgv+J2o1aBuleqZSixhsIYaw6IO+Ru623mok
	5lUz8JC4ZXo39rOHcRTjFHXwAahlwplhWf/rlVPaxnwdmXZMX+St2z86URzi+uSzRtR91r4q+fs
	EOyOw6gIgC/PguKBvEwYghMFTnIWpHwHHt1sa0yj1CMZL5OkjJ3wRoE/J11aCi4GEZngfE0IBNc
	9Xa0R2wiDXpSzENDbFq+/2PPPYECcjw8dUejWjaYw8WnAhOKMRHKDeCIhkTtna1OPP4cN6Ir/b5
	dYkDQuSNjJCorwvcxO97YKs1mrGhzbvsR8JfH/qjfcQpTQYyAQ4uwvWw==
X-Google-Smtp-Source: AGHT+IFf6y19COM4VMTPijjo8N/XwohbmjTEdQxUdhW3R9LdR2ndKIPLgXKS2XAlzSenv51Gg++n7g==
X-Received: by 2002:a05:6e02:2502:b0:431:d678:fcb with SMTP id e9e14a558f8ab-431eb668375mr53003245ab.9.1761333354916;
        Fri, 24 Oct 2025 12:15:54 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5abb7fdb7c7sm2427824173.44.2025.10.24.12.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 12:15:54 -0700 (PDT)
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
Subject: [PATCH v3 0/9] spi: enable the SpacemiT K1 SoC QSPI
Date: Fri, 24 Oct 2025 14:15:40 -0500
Message-ID: <20251024191550.194946-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_121556_559771_573ADA85 
X-CRM114-Status: GOOD (  16.27  )
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

This version of the series addresses comments received in review of
version 2.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v3
  
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

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        | 15 ++++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 ++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 88 +++++++++++++------
 7 files changed, 124 insertions(+), 26 deletions(-)


base-commit: 72fb0170ef1f45addf726319c52a0562b6913707
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
