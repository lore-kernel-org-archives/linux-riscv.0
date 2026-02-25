Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0F9F4BB99
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 10:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Km0AOLmJlOF6XNeGI9PGQtcKE+AFPk4Gc25MIH59dxg=; b=VDLgwpjoM1WATs
	au2dimJ6BqwOk0tZMjZtnNGvnfp+YunjxxZXci8916duEf3OC1faGlTxwZuAo7SLhsboIf5cQUT2c
	VixBBUTQmMjX/twFs8qcSB1IlTEr0EukJAkYbM2n8U37DmCGCERZmpsOEcMyizfoqSWVT+NT+Mt3O
	TCYNxlbT/9/ISZGOqLimA5b6Iu0d8pVktbn1wFEh/0vQTEzxVEOLctgy/EFdiMgabBJNrkUb+cYfi
	so4A5M/7BiEEWT8auHW5SQ/f5SpRs/yPhVgu5hztCOaaxjbX/vAiv/a04DL2C3DM32Jp1zvCWuU/O
	0qJzEx+6i2SSDKtZ8OTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKN-00000003oxq-1z9v;
	Wed, 25 Feb 2026 10:41:11 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKK-00000003owj-3i6J
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 10:41:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-827270d50d4so464901b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 02:41:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016068; x=1772620868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XR42qk8rq04S2Z+KSvYDZFvfESR4/OwfS07dI/NcZUY=;
        b=KB9QIjyGLmd6XFZpD5ooKcuG0uj33IRjYIduMvp/NjE/FTj5bGmXtV/a04bHL+8HYW
         gUl0EA2zB4yXYZVzy753iNH6sQAkqtKrK1MA/IspZcGxJNiURM8ghmKYMnc+rw/gV7L3
         l9eCXWujB9FBfqBL6jBsou7NPTGGDrjjdmVp+MkRmBm6Qb+KwKIoBIrujdNnAZzYmPx5
         XVvuoT//rIiCBC9mYgEgGUeeRSvoXTMpruGre9Hy/aeA41KwuJ9R/HgAUKph4xJ/X7uG
         y/0ZAFrJlZXRZI6SbP8/x9jVXTYc8M5dnJMkva9BOlDvthQq3c58uFSi1iO250+J+BRY
         NhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016068; x=1772620868;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR42qk8rq04S2Z+KSvYDZFvfESR4/OwfS07dI/NcZUY=;
        b=MJX5EanuWRSfcabP76SC17ZcCkelZFMwREx/GJwZNPWkGiAXOdMmJ8Cwd2ERRsK3Cp
         H74hBHhdamVMGH/yjZtf8cmmiO0Rd3I/c5ir3dfrS0wi1XoPR9OtEOcXntZ+W9+5YDuO
         owOas/cU0UTW/xTiEtH2znr6TI20D1AshTcg7nOummeETO3xLpvP6yHCmBG8iXEYV8t2
         P5T1L70twrz1d4PURrb3jL5vouPxp6kEWagT8mlWVZAFbrcHabKK0nlA5o/z4kZVolL+
         rhjq3jc2uxO8BjsplIJaCynZkQhr/UaTzq0jY3IlHh47gC1Z5cNkKg45UwMnI7B38sWZ
         rofA==
X-Forwarded-Encrypted: i=1; AJvYcCV/B4QBnS6X6Pepvf+uV62tfROeJP5MAOxsIBGsJzwFMApux195Z0NQkHfryh9ybuA0jYo9/AenwsNkCw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjiSoxrnQ0NpAHbS4HfveP5622TBy+ahoJQ27giw7SAvElHmef
	XiDJm+y5pbXyeCFldNgiUFCJcU+N3nWMzvO2CHn9WWPp+rHifJ9txEvv
X-Gm-Gg: ATEYQzzp4NcH5jA35g3I6E+rxPd+HL5nG4Z9LYZ91JovJkmPJ8+tzbunUGygwmOV9OF
	5/koIv+W8kQ51eMOdMn7FT3lSWajREaQFGYqXGsRGNTfWhLFuqus8x1hz/wnC4Awx80nK0hoKq8
	4eeGmHZRZ0nhvZgRPXsLr1dGcZwh5Mgy1c0nieXu1U6CaWaUvZ9iy8C22D2qanuCG7yKzNOfKVC
	au/KRPb1i/rd0BiHjPpaKAjeF1gC2Ephq/niLiFJCjvEx++A9E1PaqjmjsVF6JtxfI6jOdaoxbU
	19gh5VJN94ueb61E+uGpz28Pj9FlOOlitorv5SuUZkxDHP7qTJxeAQzWUmFt/O9qMZKVlGTJODq
	fTPUKjTBPAvW5GWm65SBQU6A0ymzWcvJruK36PqTl0LDcVvactadn56ms3d4EhTzfi3Cgk194m1
	Pj0/eHJt+hweDIAbVBF17dKxdhiqrqXqoA
X-Received: by 2002:a05:6a00:a85:b0:824:374a:140d with SMTP id d2e1a72fcca58-826da8bd87cmr15266094b3a.4.1772016067626;
        Wed, 25 Feb 2026 02:41:07 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-826dd8a1145sm12950172b3a.45.2026.02.25.02.41.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:07 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Wed, 25 Feb 2026 18:40:38 +0800
Message-ID: <20260225104042.1138901-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_024108_926456_9F7656ED 
X-CRM114-Status: GOOD (  10.85  )
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

As the DMA controller on Sophgo CV1800 series SoC only has 8 channels,
the SoC provides a dma multiplexer to reuse the DMA channel. However,
the dma multiplexer also controlls the DMA interrupt multiplexer, which
means that the dma multiplexer needs to know the channel number.

Change the DMA phandle args parsing logic so it can use handshake
number as channel number if necessary.

Change from v3:
- https://lore.kernel.org/all/20260120013706.436742-1-inochiama@gmail.com/
1. rebase to v7.0-rc1
2. patch 1: Apply Conor's tag
3. patch 2: Apply Frank's tag

Change from v2:
- https://lore.kernel.org/all/20251214224601.598358-1-inochiama@gmail.com/
1. patch 2: rename "AXI_DMA_FLAG_HANDSHAKE_AS_CHAN" to "ARG0_AS_CHAN"

Change from v1:
- https://lore.kernel.org/all/20251212020504.915616-1-inochiama@gmail.com/
1. rebase to v6.19-rc1
2. patch 1: remove a comment placed in wrong place.
3. patch 2: fix typo in comments.
4. patch 2: initialize chan as NULL in dw_axi_dma_of_xlate.

Inochi Amaoto (3):
  dt-bindings: dma: snps,dw-axi-dmac: Add CV1800B compatible
  dmaengine: dw-axi-dmac: Add support for CV1800B DMA
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 .../bindings/dma/snps,dw-axi-dmac.yaml        |  1 +
 arch/riscv/boot/dts/sophgo/cv180x.dtsi        |  2 +-
 .../dma/dw-axi-dmac/dw-axi-dmac-platform.c    | 25 ++++++++++++++++---
 drivers/dma/dw-axi-dmac/dw-axi-dmac.h         |  1 +
 4 files changed, 24 insertions(+), 5 deletions(-)

--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
