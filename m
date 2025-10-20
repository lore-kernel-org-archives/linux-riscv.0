Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B60FACCD19F
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 16:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uj3N2dD6CjZHwWmfKCOfTPp3cLrIl+K+jAkm4hq3SGw=; b=MYIY6pMCGR7gg7
	Udo54uejIsd7MUSIpRpXNbVkNDg8ZnRlf6/QoWMDEYIfgLkf9RMWHkRtFyDffPuffj8ARJJsVFkdk
	VPZfPGyolkzN4ITFZ2YR16aA2AdOZ57gLmR9iYYVyulk2d00Vucfq2W1p9l51JsWubz8QX9Qh+k+/
	FZQnSbU5prL8b3MLxlldgF8wbW6ZVJgVrL0UZfElFUWsChgKt6t6JCumGxYWTOm7aqi7AMEDzjVD/
	Lt4N59hatQRBfKH1E/fpMkQDWea4WUtk0NaCgmLAAifQGVwCYSzUMkj3BKDF2uFWQs0Y5RgKZaztU
	HQx+vUMIYYw/3Iiw6pWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt73-0000000EN9R-03jH;
	Mon, 20 Oct 2025 16:52:01 +0000
Received: from mail-io1-xd42.google.com ([2607:f8b0:4864:20::d42])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAt70-0000000EN7z-1qDU
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 16:51:59 +0000
Received: by mail-io1-xd42.google.com with SMTP id ca18e2360f4ac-940d92d6962so52393039f.3
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 09:51:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760979117; x=1761583917; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1AvuDUU8XTDFjTkk8uCzrLoeu+wpmzYKrOcfQ084FIs=;
        b=N+pLenX2SU8sdbsC84+4BHVZafaOS3Do2GPzIwbSvyCd5RckT6Sb48LZ4AipMzXAx8
         WpjeRF0o9HJcf47OwIwkH9twH4ZkwrrRmWMc+n4d22lSUQe7OMBFjGf+aNCfEPoGxYvO
         wJf09w5mYoGaVLBl8kd9ZO9uAvex5z54OQ3ZXXPnf9GSCVKXCIwpxWzO8bpVETiyGnJv
         /zlCJ7fjWOBozpYZAnmQ9dGgGf7TyKrpcTFCN2KffWaMLg7Bo84xTTnib7a4c5rxsOPY
         NAupWFVC0boJIu4uX9o7UCsotID9Yf/orH73g6hWC/FHnzAgax8Bi9/NiR6X6E5E97We
         RkGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979117; x=1761583917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1AvuDUU8XTDFjTkk8uCzrLoeu+wpmzYKrOcfQ084FIs=;
        b=U/hClNHwvy7pydtc5DxwllzvfmXL4fy4yncP7gL9+ykNubUuh5prreMF3DIFtrTGGp
         aIT9CwZlxgE6d9QnKWXRyJY4pgmzk14/LSrJUpe6y/pyW9+nLHDPh7ylG+kprk+YiABH
         tgCgjAa4neHIImJ3TEdw2nD99K9ZTiHxgtYiZF77W/gai/mS55GNW23UW0Kx+w+RoNGL
         h7wGo/DflWCV9bhYjNEZQMt4SCFAoni7KSH/4r1ENrcMiwCQZ35r/umhDGt5FoftXPQQ
         fGG+3WXIr2ctkRcXYPJiwHe0R7sw5RAINdmY0iunmuQ8DblTWn9jsf4fhUYNm9XMqU6S
         sA5Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzrTjaJSla1z4rgkbEih06Fh1p9mL3tb3LolUvd2Cf1YbRRHKiAZv3GN2c1ETorVJHNb63flYICUg43g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwTfHJir0trmlYCAwUXp9KVa2F4slk88lsqd0uLFkoq5evR/l+l
	SCB3QeajFoggXSyAdk+UuPN4HKmEFWc9SUQeFAhhTNSEPW249QCitXHB3PvcHNKl+zM=
X-Gm-Gg: ASbGncvjI5ASdnelMMH06pbyOOdkc/TGqGGJG8v0KLOe+sQcGL4UNEPf8c+9xos9R67
	xaI6Yh0GUH09oOWBDibkEfeCBkj+9hcef1Fm924sxPY2zPuZCKqxpNKT7VYSP2Lx6lIW8VrMlaq
	6LNyaHBHR57n3jJiK2Xs5excElhgRUl6+XA0kxmuQRuych3kSaalrKctrKgSkG8tLfa+SA0DeTc
	m9s5M1kZM5Ke5jgBbOjTSutmOQg6rLtby1OzuaMShTTaJ34ScEMXtkuxdCafPLiDBry5xa6ooyK
	hiptWJ/aPKEfasAGUFmRBImICzNE6RWrCg9yyPDvyr471CZb6iVbz2uRRp6+gnkXn5K850JNKPk
	LmK2nYoXU0iJKB+foFK3U38neYDF5NoitHuprKX0joUa+yqYtD9LFxxW6N+e1QrpgBim5/B10Ce
	ST8eWTuYwX1obK2a5yJRdrt+d0I7b+b17UsKlt9W2k7nk=
X-Google-Smtp-Source: AGHT+IHkIIUwLfapdvbPcRnsD5CACrEJj9nwaBI41U0v+K+kXPy5pHBwBsF94Q6SPwfqvwS+pU3GAQ==
X-Received: by 2002:a05:6602:13c6:b0:940:d808:8a09 with SMTP id ca18e2360f4ac-940d8088d03mr748582839f.11.1760979117170;
        Mon, 20 Oct 2025 09:51:57 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5a8a9799428sm3116783173.63.2025.10.20.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:51:56 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: han.xu@nxp.com,
	broonie@kernel.org,
	dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	p.zabel@pengutronix.de,
	emil.renner.berthing@canonical.com,
	geert+renesas@glider.be,
	fustini@kernel.org,
	ben717@andestech.com,
	apatel@ventanamicro.com,
	joel@jms.id.au,
	guodong@riscstar.com,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] spi: enable the SpacemiT K1 SoC QSPI
Date: Mon, 20 Oct 2025 11:51:43 -0500
Message-ID: <20251020165152.666221-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_095158_584207_AD97C526 
X-CRM114-Status: UNSURE (   9.41  )
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

This series adds support for the SpacemiT K1 SoC QSPI.  This IP
is generally compatible with the Freescale QSPI driver, requiring
three minor changes to enable it to be supported.  The changes
are:
  - Adding support for optional resets
  - Having the clock *not* be disabled when changing its rate
  - Using a fixed 1K size for flash chips rather than having it
    be related to the AHB buffer size.

					-Alex
This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/qspi-v1

Alex Elder (8):
  dt-bindings: spi: fsl-qspi: add optional resets
  dt-bindings: spi: fsl-qspi: support SpacemiT K1
  spi: fsl-qspi: add optional reset support
  spi: fsl-qspi: add a clock disable quirk
  spi: fsl-qspi: allot 1KB per chip
  spi: fsl-qspi: support the SpacemiT K1 SoC
  riscv: dts: spacemit: enable K1 SoC QSPI on BPI-F3
  riscv: defconfig: enable SPI_FSL_QUADSPI as a module

 .../bindings/spi/fsl,spi-fsl-qspi.yaml        |  6 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  6 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 21 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++
 arch/riscv/configs/defconfig                  |  1 +
 drivers/spi/Kconfig                           |  3 +-
 drivers/spi/spi-fsl-qspi.c                    | 60 ++++++++++++++-----
 7 files changed, 98 insertions(+), 15 deletions(-)


base-commit: 606da5bb165594c052ee11de79bf05bc38bc1aa6
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
