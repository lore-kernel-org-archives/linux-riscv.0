Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EACCD1299
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QnVoBsEUPwEeNPoauugoi8j2crWqgjfcVuF4UiWE3iA=; b=aMqmL+A49F/UAx
	Gz+tv9gybCEldBZcIC/qXO/2IsHfq0P2lndvaIjIJ0AgMZpLVgyAm9MqQLWTCt5LxFO5bXMyA5vKP
	naF5U2hQ6pZfdNnPZlZmGHvAyFzQZX2tXv79yi+4enCFodxECQvpr5iU0yt3GQQMb/SwPbCDUz6bX
	eVCvJAshr/v5f1JKOyi6PfhBbzhnA44dBlZxi6BjhSP/Im4S7nOlxnS63sR7ZxFblj91Xt+jEDnal
	sXMHACwySGzKioZojOze0iR9vBPbKmlycIFv+jK25jpvTjHC9OjvdkW+WCuw++UFNk7y282SNbj0x
	47rHEeKTdg0btLwOqPug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Lb-000000006rC-0IBH;
	Wed, 03 Apr 2024 20:36:39 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7LX-000000006qA-1x4E
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 20:36:37 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3416a975840so156976f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 13:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712176593; x=1712781393; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xLEjGKF78CUq2PdbZJuwrHAC1zTdpWI7ya8sqwxy9m8=;
        b=BNEQqcRGYTc2gNpsYm9nSTiaYRaLBvXhsVgmWJ1jhGbbefiUN5qiLDfHItBlxYRu2f
         +0fIWA7K35Kmqvc+olVh0x6am+nbbDdOQaiDOKLfYI6dk04U8odgDIGVSlPUBTxLnq20
         kVuU5nc6AqrxwR4RWcIyAFjLlUlBlEKyf2aEOGn6ZX8wI8fFm8iBW6Bn5gpRcyyJ7USc
         VYQPmvjyCY0ktA4vcpuiVeaQpoTM8FEaKprzyizBuk07l+F9LrVOGTmBggDdcaY2TItH
         HnJ6MCf9656f/NOTt1gxYF7jbv2EJjcD8shPJ3/7AIhPemBAqdZBzPA4AbzwYcyq2e4j
         ftCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712176593; x=1712781393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xLEjGKF78CUq2PdbZJuwrHAC1zTdpWI7ya8sqwxy9m8=;
        b=Xap3DZ0yh7cotSAn5iwTbhdoWCxe/pa4rqHWgMtd5nK99vksXDX/6mWHqbzjWe9/8f
         TuQRsXJJxPNOfv/N628pDf0BuEKqOxYp/xsX8SpRW/uylmWuZmBElF751NogUZcEazX7
         Y0FhhLH+SESZyiUOlLwlxXYHJYXcJ7YJQ3ulv9bs9q/N1Lx5/jRrKuAQMDxh4mHj0NxU
         NXqDnOn62HxSjnJcrjgXbAfvBRHnaPmvGCvPnjVVk9xPov4GE05UASDd5TtCFJzMbl/v
         bVwkqyGhQ/WhonCje3J9KDBaRpZ+eonpCd9GWrEVJRUkftbxDV0lnuMpctvFbcL7xkRY
         N6kA==
X-Forwarded-Encrypted: i=1; AJvYcCWtMf4FJuEvP9n8YL7Hidewx8A9r7rQfzojyrVFFbBOVwYMPg83VoDbGmoesIPKa9iXmLsoSS5cZB99sGB0gplax715M+hXb46YOrD4jSEQ
X-Gm-Message-State: AOJu0YxFuYWsel8RVtG1RI39V9EcxYJRsAUfR4BRYNcSRGS/QXQP5RVx
	Sxv+ZQHyk8DHC7Dfy/gnZl1m0D/Vx9b2B4KLNfGODS/Pz81ylzlC
X-Google-Smtp-Source: AGHT+IGFrBKPW8fc9OizmttpoV1U88eOngqII6WaSNdlGNm5E5Z1fGV98RHkN3M5pqZK8yCujgoIsA==
X-Received: by 2002:adf:a1da:0:b0:343:9d3a:cc2e with SMTP id v26-20020adfa1da000000b003439d3acc2emr433983wrv.0.1712176593283;
        Wed, 03 Apr 2024 13:36:33 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5eb:3d93:f2b6:25e8])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c468400b00415f496b9b7sm244910wmo.39.2024.04.03.13.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:36:32 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 0/5] Add IAX45 support for RZ/Five SoC
Date: Wed,  3 Apr 2024 21:34:58 +0100
Message-Id: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_133635_532167_E6EE0882 
X-CRM114-Status: GOOD (  12.59  )
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

The IAX45 block on RZ/Five SoC is almost identical to the IRQC bock found
on the RZ/G2L family of SoCs.

IAX45 performs various interrupt controls including synchronization for the
external interrupts of NMI, IRQ, and GPIOINT and the interrupts of the
built-in peripheral interrupts output by each module. And it notifies the
interrupt to the PLIC.
- Select 32 TINT from 82 GPIOINT.
- Integration of bus error interrupts from system bus.
- Integration of ECC error interrupts from On-chip RAM.
- Indicate interrupt status. (NMI, IRQ, TINT, integrated bus error interrupt
  and integrated ECC error interrupt)
- Setting of interrupt detection method. (NMI, IRQ and TINT)
- All interrupts are masked by INTMASK.
- Mask function for NMI, IRQ and TINT

This patch series adds support for IAX45 in the IRQC driver and enables this
on RZ/Five SoC.

v1: https://patchwork.kernel.org/project/linux-renesas-soc/cover/20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com/

Cheers,
Prabhakar

Lad Prabhakar (5):
  dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document
    RZ/Five SoC
  irqchip/renesas-rzg2l: Add support for RZ/Five SoC
  riscv: dts: renesas: r9a07g043f: Add IRQC node to RZ/Five SoC DTSI
  arm64: dts: renesas: r9a07g043: Move interrupt-parent property to
    common DTSI
  riscv: dts: renesas: rzfive-smarc-som: Drop deleting interrupt
    properties from ETH0/1 nodes

 .../renesas,rzg2l-irqc.yaml                   |  17 ++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi    |   1 +
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi   |   4 -
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi   |  75 ++++++++++
 .../boot/dts/renesas/rzfive-smarc-som.dtsi    |  16 --
 drivers/irqchip/irq-renesas-rzg2l.c           | 137 +++++++++++++++++-
 6 files changed, 218 insertions(+), 32 deletions(-)

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
