Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C833C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 17:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+C3TyJNQEVH3raYmRJ7TSUXPS0VE2fXHpTS4VXruhCk=; b=Z9QesN957JxC/k
	TQjvMkWjihIdPrOj7y7AiEdAK7pYVRVz5FAWtvSTZkYZ7PoZFa+LS2gNOCWuroiQJ/+5ErngEZjec
	/QvggIaYValm8JoTCbPOUVomg140lqCx/ytd4sFICvgkD3hWnGnyVOJiALJ2RKo97YSqXrtNZ7biN
	XSYiTS6CJMhW6PrC6/sF8K1rIbytJBA9XDOzV1iiZ+1EhjqlWn+zxPKJ5auQrs2QFHIb8xUhSiPbN
	Y4P09/svOX56IAt2ImlR0M7s9fvvN5UHer0MsPJclqemg+HlCqv8azKHdczdXevyHy8WFD5FvXUlp
	ibfdkPy5bilNmowkzA9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxGf-004a36-Fx; Thu, 29 Sep 2022 17:24:13 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odxGY-004Zxe-1u; Thu, 29 Sep 2022 17:24:09 +0000
Received: by mail-wm1-x332.google.com with SMTP id fn7-20020a05600c688700b003b4fb113b86so1077655wmb.0;
        Thu, 29 Sep 2022 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=bGeJq6EVRV3G3ZsUhhY+gmUHYWqjyGOmnCpjQGSVwc8=;
        b=gLYR4SOlzMTTP1Yuo339Pc4usVMMKLH4moFTksSgJK9P97c3gobM1GFZCm+7mT6nDF
         VSvuMJ6AzzRGbMb+01ABfYzM70BgOxo2Xsece1cJ+eUeDU+vpOWa53BhWVqK1glNlkJH
         Awv5hhxPlHixJmbkgyFWZkaKpwpuDAVP8qGzZ1WhDt6jCpFQY59JmioeD4Cg2gysi93o
         CdiCeoKS7wj2bbMTgaTGyqPt0cFHsDG4dXHeSfSBvHai/NCxRbPf9wU4OZ9tO7goywl5
         6eQ6txV5cnH5SA/718ywSVGETb2m0BeNczcnC7p0lcikDAbu7ACujMRGVZID3HHgXMD4
         1x4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=bGeJq6EVRV3G3ZsUhhY+gmUHYWqjyGOmnCpjQGSVwc8=;
        b=vLYWKwuBdPRZ4rF/GRWgKYnM21SqF7ntIYK+wYLxcCmC14hIPdiFoDpFGTz3pvmZSF
         qVPPQkh0l7VcemasHLt1Pw7zJwEPvOAAa+NXeQwjvNJztT3zon9tf+ZhGzX5Ee7rUfAJ
         Nw6ZiBhARKujnne0xLfqgUmTkxWCxsHOWE8Z2uWd+xHrzmoLXm2LzdpUjxQeVnKMuHcM
         tXQrV70exP/XZfCBMawCMa/PsPx9ZCyxItDRAfsCAHOeAvs8mA0jp467tg0g/lwCqTKT
         6+RAOU54Yb3OnLMyZw7CN1kNN6eCdDeCnwlekF5BzPCHXDcNF6HJDIeTFj+G2Cm5p3Ni
         9V1Q==
X-Gm-Message-State: ACrzQf0FqYG+kgnRbmfCEFfGZQC85Uo8dptBc/FkTV9lFWeV+8zHii/b
	3n9IWj5NpAelVYFww1oHzsE=
X-Google-Smtp-Source: AMsMyM4iY3w7jSKMj0VFREZ9+1K+daZXdgwz87Pg5hEcWLOWrA7wNoOh3Oiqp3GrESpsDArnm5rI3w==
X-Received: by 2002:a05:600c:4c22:b0:3b4:766a:4f76 with SMTP id d34-20020a05600c4c2200b003b4766a4f76mr11044380wmp.101.1664472241668;
        Thu, 29 Sep 2022 10:24:01 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:9174:aca4:83d8:90fd])
        by smtp.gmail.com with ESMTPSA id d18-20020adfe852000000b0022a293ab1e9sm11815wrn.11.2022.09.29.10.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 10:24:01 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	DT <devicetree@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 0/2] RZ/G2UL separate out SoC specific parts
Date: Thu, 29 Sep 2022 18:23:54 +0100
Message-Id: <20220929172356.301342-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_102406_148327_2CDCD21F 
X-CRM114-Status: GOOD (  11.73  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Hi All,

This patch series aims to split up the RZ/G2UL SoC DTSI into common parts
so that this can be shared with the RZ/Five SoC.

Implementation is based on the discussion [0] where I have used option#2.

The Renesas RZ/G2UL (ARM64) and RZ/Five (RISC-V) have almost the same
identical blocks to avoid duplication a base SoC dtsi (r9a07g043.dtsi) is
created which will be used by the RZ/G2UL (r9a07g043u.dtsi) and RZ/Five
(r9a07g043F.dtsi)

Sending this as an RFC to get some feedback.

r9a07g043f.dtsi will look something like below:

#include <dt-bindings/interrupt-controller/irq.h>

#define SOC_PERIPHERAL_IRQ_NUMBER(nr)	(nr + 32)
#define SOC_PERIPHERAL_IRQ(nr, na)	SOC_PERIPHERAL_IRQ_NUMBER(nr) na

#include <arm64/renesas/r9a07g043.dtsi>

/ {
   ...
   ...   
};

Although patch#2 can be merged into patch#1 just wanted to keep them separated
for easier review.

[0] https://lore.kernel.org/linux-arm-kernel/Yyt8s5+pyoysVNeC@spud/T/

Cheers,
Prabhakar

Lad Prabhakar (2):
  arm64: dts: renesas: r9a07g043: Introduce SOC_PERIPHERAL_IRQ() macro
    to specify interrupt property
  arm64: dts: renesas: r9a07g043: Split out RZ/G2UL SoC specific parts

 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    | 362 +++++++-----------
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |  87 +++++
 .../boot/dts/renesas/r9a07g043u11-smarc.dts   |   2 +-
 3 files changed, 235 insertions(+), 216 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
