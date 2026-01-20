Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 193A6D2ECEF
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 01:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rmDNon8jyibFpPTVIghQWeyfYu9oP6UhQeXjSvGJr48=; b=RBBeckUUlFaHRO
	Ig4jDaix2LL+obKpYTRD7GK8HNarEavxtU7agWLcskVyQgLt0wiG+BizrNs6W/v+oPdRZ+W66TE5c
	MlTQtUJeX29UAGChaAHWhB9AsOMLk/ETDqW0dI8tNgO7fncO0X4kowFWwUQf2vYm7yWYQdFEMSPD8
	7Qnrb6S2BcfhWnJoOKOBggv0rzBdp/Sh2futOg6Y3spxUaNNu/YtnZYydVzKo3eHAz9eHGbYqJhdz
	sRAs3sqy4vN1rNcc3yiwDdQQfJRnkoUUq6/tyc8nvH8Y76fkQgMx3J/CJxwsB0EIe4TegDpo2Nrop
	CRf3q/wOz1jJY2NcCz7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0gO-000000032vw-3kes;
	Tue, 20 Jan 2026 01:37:25 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0gJ-000000032vC-0RNP
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 01:37:23 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-2b6bfb0004aso6707261eec.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Jan 2026 17:37:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768873036; x=1769477836; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OBib4TZsFS9AcrU1FokovNxktrga1IgUe5Nw342C6rE=;
        b=RkAb+iECRP6eVe2Cy/6eTfR7nM6KVeVqToRFA/i2eVSwTML+4xNX5HZrdniWWA0wqk
         sjVFlR62z8ILhPsCKsF4E7VfOOSSw4ZZ6dDUOdT9zPlJXtVl01Eq9H5TuDMOJs5EfnX0
         AFbqFsPLRjJz0RwFw8+JhfXcQ7sou/LLZhwistsPGcbgh1p9vkBkidzl35NIQHUD/Ny+
         gCvQ4HIpOKj54xWgGbNlxww81DBwOnZWnxj2nrh1TeWN3O0sv3Z0xE+aI74EgIpDdwVV
         EpQEhWQ0xcfq2ZjIDTyZ+vjA+FOJKPnFfvRo1Pk/V+I2xR49cpJ1LME0/2kC7fSatFdq
         tcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768873036; x=1769477836;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OBib4TZsFS9AcrU1FokovNxktrga1IgUe5Nw342C6rE=;
        b=Mk63yJFS7qTDTRSfXGS9Pc/zQS+ldpytExuKZq72oCwV+48soZMOGMKePYX/XL+LsB
         1nZ3Ihns2P1XB+UAVmdT+q2r8FyRVvaR5yelzEdrX2kuO60YDGB/vumOOUidPcQNfpoj
         zwL2QrQOyV7Tp7PEA3yNXsb3s85nAC4g4TCUB7z2kLiGKZ7njUoxbvihjt7wsyiI7Xdp
         UlbjLKiq7twH6T8ovL7DaAz8ilDD7GtARX6y5BLUdj48tcnI2yqmO2zbVuo1scI0Azjy
         2DNTTO4yiex8iXqVt/5LCrOYhoig42UCDotgWZhoFbadwBVuA3ZTa+h6IgBdYvtdPcnm
         UxKg==
X-Forwarded-Encrypted: i=1; AJvYcCWc2dCYpMASxfH7Fp9jW8ovk6KFT7NYJ1DZRohTBv9Bpe+603y87NvqhASN5DjSDl7MXYlcwc1qnILn7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVZTDJD0Eh8j8AhOtGQkKg1B2pGeJ9UF54YXYmu6wf9Hu3hAhY
	Yoh//txHqHaRG99B3UZM3EPjbBfHslEDfpN5TVfK7rNM629oYeizT16F
X-Gm-Gg: AZuq6aImep9ISsWJWqZWfRxY348n9aZdUtJXyrvrO2Q6Lnrbrth/Lyi/Is3Pg4BkDEd
	HhwHr9GOfK5+Or8Z7k6VPuT9p4zpDZAOSKHdi0obFQjJao3vPDnScaUk3zzHgv3lJ/wi+CtLWiM
	zl2O7W0tC+hkNB6DWmEDWzNGNHBa5nqc01p4IBgpv8zP2drcpPMB/4S2sj6phXJPS0+PwAYUOEY
	ZI4OOrqrFwAi9w3MqzsdhrqPh6DUZQpGKLRqa7ZciZtpGyv/9865ZfscLMK+I/isBkBsimYGcAM
	FqukDaBUDi1hVdpdi818TjLMge7oBKbwRmb30wwFoTCmP2qy9kakc4FvsIuSru4qBX84LSDExId
	kW8Qq+jrNy609GTYPZmXyTFbYf/uE3AXhjifk9bFWFV4JA1EgdZVXlJxJU6gi2eMnvdBdjeuKPZ
	bQ4iagqwvs5g==
X-Received: by 2002:a05:7300:3b1a:b0:2ae:5ffa:8da4 with SMTP id 5a478bee46e88-2b6b3f1d5eamr8624180eec.1.1768873035879;
        Mon, 19 Jan 2026 17:37:15 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6bd8e7cd9sm14199031eec.16.2026.01.19.17.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 17:37:15 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
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
	Ze Huang <huangze@whut.edu.cn>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v3 0/3] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Tue, 20 Jan 2026 09:37:02 +0800
Message-ID: <20260120013706.436742-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_173722_299210_552EB384 
X-CRM114-Status: GOOD (  10.97  )
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
