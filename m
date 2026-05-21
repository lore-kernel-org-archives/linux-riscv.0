Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B3FDCD4F3D
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 14:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sD8jrPVCOW38zFBBb0XNn3X1vjaOfEClQVsgkL/4zRw=; b=cpkl9/hEtJoQH9
	7dQ8rRk4ilwiOngy8jM7x2nQyOkD4uhi0PR/umFHrBtXls+RkXA6iw2P9pIQeYpUGliVNrN6Ljfgk
	D944Td+fAE+85u+gpHJkKC/XotjsNh4CpjhtOLeiI1LOhtkQDjYtDK2TPMYI95x3HanqXMeJ+CtMo
	Gm7F+U8GeySX7T84RJcGn2NfRwhKk80Ye929B7K90WFRjuNB6/0wM7rssOcnJguKSKSXaBI6jVEjq
	jjuaXQb9Pp+mrRx5uRaSbcLHHLo36eIJidlXy5Ru+OXODsszta84r7+joCD3fIcAAHgM1mgBu9hV5
	zAgxdNvEyEneSaX9++cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4eD-000000087ah-38vG;
	Thu, 21 May 2026 14:45:17 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4e9-000000087ZO-3cSE
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 14:45:16 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2bd80b3aa13so40118045ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779374713; x=1779979513; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VWXyA/icX3UC/cu3pkBD8KPyWdonFkYMhFuMrf7NsXM=;
        b=CIe8I1FfDqLWn5xZYF0KgVX5fInP/5elQFstsHKrBWXVcg70dmTPl6hRy7rYnugrJX
         aK/cGL6iHnF1KEX4tmaLzIBDoViaxCaLO/3wxMxyRwOf8hP0N2q1+8Ruvs90MkRkIYLW
         d1Kvmnd3laakRxxSqjT+7pi79stxVDwvTnwWT1a0NTZcGgbjCRcUYOdcPGYwfYzkDYKu
         tDI3siBxdwueAcMCHAx98v1WNyPNfl4ImCIRZwg5kTFQch/BlHj8b9DrDoz5hT93sWNK
         YE6heBH+Y5s+I4/DS/K9xtfx/uoAml0Hc+tQR8EPuoRvgsGXk/mmV5jin2wYeV3uZ3gB
         nG8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779374713; x=1779979513;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VWXyA/icX3UC/cu3pkBD8KPyWdonFkYMhFuMrf7NsXM=;
        b=EbMr6e33nx50wMehOeWeuqm9OpTooYZ43zyTxiQDHKW29DghI3judcrtg2jDReQPLM
         NXWY0T8zIjukpGUUjdhD6tZq2pmtB13hCd+9iNo6m+IhlRQTDQ+tM4WZ4riK/dGVU+3Q
         VZzqtEObZvEkTZEoN7VnUrfW4yUih4xH3BgsD4pbJOMtpi1pN5Iq/v1/r++pGEf2Lecp
         32cYSOcnt9WB5ZmULQSSQ8tRL0kR/nHlfS0b+1srnRuhcL8dcAj4koUKonNc7vObEkGP
         K6WHqEInQm2ECm9cmXzpJEs/k3soJn5y3E4WCgd/FzKwBMTGIqf/jfWH3i/NBHozZg9X
         1eKQ==
X-Forwarded-Encrypted: i=1; AFNElJ+wFtysQaRquPHr+rk5Ey+zK7apUgXQQXsWVG5wWGkcZTCQoK6XswuT3/wuY2bB3Dl1RCV3N5053rhbXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQycxYLO7pe9bJ38iOexO6l10v3NX0F5mz3OlJeqyr4ieJ0Iik
	KjSDk54H2mNGiPHw+DHfdVfxjOebwzlVxcX9USdHxRiydTgAXsN/cNvk
X-Gm-Gg: Acq92OFXdSJ1tp+CN68GtWwPsTC9LzwjyDDh79CLWvljlEiVqLWbzJTVqj0zL3lykE4
	T4+02wKBZoL9oTee2dQ7xbZR/RswGvlKDBXXtBjidSpF93llz+KMzEt5qJQdpGJwujPinVt76TG
	V/d4etuihrED3lX2beUj1G0ujWmVPC0AowJ4Gb1wLRpBDcvwudRWvtW7vZbaGw/qApspCOOO4hy
	XSHUk8Xi7F2N+QxBhw4ijIPAyW/FI7Mvpv0FlQWWM5KnX9jzfxFPLKBo/SB5b4Rg/3aqlgJ+lSP
	x/0Bpi558eOdHW8ezwHcfgIJDbrGsjmEqsBHO0ZuT+FBEdqBQy8iFF8cxE7BqPsBiMTsGca3TAq
	McMcwiBvtXHvDfJK9JHVKaqUDg9lycCuCUnB6ic7GeFug4UF1BOsR+ujnyz5WGPavXSvSdkR9NI
	O308ldDxO8cuzuR6IGes+Ce4x4U0VNMw==
X-Received: by 2002:a17:903:37cd:b0:2bc:db91:f5a7 with SMTP id d9443c01a7336-2bea30a8697mr30793125ad.11.1779374712767;
        Thu, 21 May 2026 07:45:12 -0700 (PDT)
Received: from [10.240.146.115] ([2.27.148.101])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea990f667sm13261475ad.62.2026.05.21.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 07:45:12 -0700 (PDT)
From: Zhengyu He <hezhy472013@gmail.com>
Subject: [PATCH v2 0/2] spi: enable the SpacemiT K3 SoC QSPI
Date: Thu, 21 May 2026 22:44:44 +0800
Message-Id: <20260521-k3-pico-itx-qspi-v2-for-next-20260521-v2-0-52bce26e5fd8@gmail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z2NwQqDMBAFf0X23AdxrRL9ldJD1dUuhSQmIgHx3
 xt66HFgmDkpSVRJNFQnRTk0qXcF+FbR9H65VaBzYWLDnWm5xqdB0MlD94wtBcXBWHyEk7zjb1n
 bj/29ZjPblkorRFk0/z6P53V9AWk2ROR3AAAA
X-Change-ID: 20260521-k3-pico-itx-qspi-v2-for-next-20260521-889b94120d85
To: Han Xu <han.xu@nxp.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-spi@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 Wei Fu <wefu@redhat.com>, Zhengyu He <hezhy472013@gmail.com>, 
 Cody Kang <cody.kang.hk@outlook.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1441; i=hezhy472013@gmail.com;
 h=from:subject:message-id; bh=5WzCzpQAfauvNBfuz2h93m3dBjmIB6B+A5Dq0d2HspY=;
 b=owEBbQKS/ZANAwAKAc32nDaAuA3YAcsmYgBqDxptfRkZxF1rnjUhQ8FwCZSHP6DrxrqQCYuh3
 peGvWJVYuKJAjMEAAEKAB0WIQS9XD2kxy1NmfC2u/XN9pw2gLgN2AUCag8abQAKCRDN9pw2gLgN
 2AmeD/9sN6/gePDDOupWgz5WRXZXq2IH9LVJ3VYVv0qO6fQoGTRp/dXRlj+B0jlX8Mbc+we9Ii2
 f+XRROGfSiHjakxGUqSu/F6DpWRMkd28p28GN21cycRHdxeOTLOt76FG6xFNK4SQMFPHLbFa8M2
 80mgRd55xaK6M8sUeH9kOsHwp/xMWctxVaTMK1EHHDUnk+jJzIx2jXF4E353f2ZaebwhpXFJTjo
 IgGw0Ab7qplYN53/QIp6GrY8UG7yOWOGVCCLsYWZI4TZ6mPTGXSuF43wo/alHvZVD9ys0EA5oMS
 AN8f05AyVPtduTYxub51ooGB7er0I77C8rVUP324npcoZV80p55+hmAEMdCAjL5TLcw3HiwuyXL
 6hh+sERko1zGUVUs56yDEWjk8TTT0y2GLnWQUrDKBQc4h5zya5Ii1b9JIno3Z/oGZrTBm51IylW
 yGuVUIa4OhWWEYggVqvQmatXOrHC2ZUfDn38/zC4ZrDPR1iodsL6nBfVZwHqqGr9t8E5X6gbUrI
 fzh5vdU1vJ+S35Bkc/ZXR+zMUq7Ko3+kD+h0mX6C2+E3pFtsbrjHRX0HGhyuko1ECVxOJx1wf0N
 2SWk3UTaxyaoLm/+nDreQq3B84C24n1yGV+vPCnXhB3ggTqcCBgtlKwumHxcGMslxLQM1imOe/8
 GeUeRkkJ6T+M0xA==
X-Developer-Key: i=hezhy472013@gmail.com; a=openpgp;
 fpr=26CA97B1A229C229822278F254AF850165158959
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_074513_909483_AC14DA94 
X-CRM114-Status: UNSURE (   8.18  )
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

Add the SpacemiT K3 QSPI compatible and enable SPI NOR flash on the
K3 Pico-ITX board.

K3 and K1 use the same QSPI controller, so the K3 devicetree uses
"spacemit,k1-qspi" as fallback.

With this, patch 2/3 in v1 is dropped.

This series is based on the for-next branch of:
  https://github.com/spacemit-com/linux

This series is available here:
  https://github.com/imguoguo/linux/tree/k3-pico-itx-qspi-v2

Version 2 addresses review comments on v1:
  - Use "spacemit,k1-qspi" as fallback for the K3 QSPI compatible.
  - Drop v1 patch 2, "spi: fsl-qspi: add SpacemiT K3 support".
  - Reordered Signed-off-by trailers.

Here is version 1:
  https://lore.kernel.org/r/20260519-k3-pico-itx-qspi-v1-v1-0-c32afeeaf741@gmail.com

Signed-off-by: Zhengyu He <hezhy472013@gmail.com>
---
Zhengyu He (2):
      spi: dt-bindings: fsl-qspi: support SpacemiT K3
      riscv: dts: spacemit: add QSPI support for K3 Pico-ITX

 .../devicetree/bindings/spi/fsl,spi-fsl-qspi.yaml  |  3 ++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts       | 58 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k3-pinctrl.dtsi       | 21 ++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 17 +++++++
 4 files changed, 99 insertions(+)
---
base-commit: 6edd9a0d32e1ef81133b8cb5b3bb3157a44da4d1
change-id: 20260521-k3-pico-itx-qspi-v2-for-next-20260521-889b94120d85

Best regards,
-- 
Zhengyu He <hezhy472013@gmail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
