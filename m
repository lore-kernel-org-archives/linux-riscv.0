Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A37FDCD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 06:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nQVF9NMZy7i/7f7ohu5b0qZV8OOpSvy3O1yugbvseb0=; b=XRa/Eb6OmJr+oK
	4Cb3uH+E6Cl2LCayOGVCHFuKnuqFzSCkol7WtcfdydxKTxOwXJ1HGI9gNipUtril2akxxEf2bTC5W
	dD6ybTFTIZXO0c6IunhYC7ynVt/D7382njcfl2uwgqCoDXCoqtjnmSw5RgsiEwv7K8tZFkIWMkgdX
	awjLw4gjbIzR9Y7373TJm6vnKLseY5SevLBindXwZtdC5KLwgePrZnjdKeemuYGtpBTUYmmfRgy5H
	ACJBgyQew3n+QJDyFIomgYT7QGps2ySU5Bi86bYWLVN1+C0TCyEL1JawR40gLIr8L0spCmqIhe1f7
	SgFXvp1obXSZ4jkrwGlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKH4-0000000CVRE-3H2t;
	Mon, 11 May 2026 06:37:54 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKH2-0000000CVQg-27VQ
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 06:37:53 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c80227b1f6cso1593105a12.1
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 23:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481471; x=1779086271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hG7re9nWf1eNGkdto4Ixyj7RYv5HNsRc+oGfPkcFdsc=;
        b=dvNANhZr/prTV5ynHp6FUgCBJOnpUXHKRkZM9L+j179hSg3mDVa0M7psqz13FypLIt
         6NeeOiXuxzwU3NgztZz7BMuill6KC5p76VGHg9tWs/pBwr2HwA3OCLKSllWWKSgcONHX
         IUrlWd7EOxQPmvCpVICDLesh5XqM+YPI3kk0fwK1hcY3HFpumJFRWyQMJgQgMY9b+Gw5
         Tlj8wdJjb7X+07MJhB/PVF8p3c20NymtribGA9aSDt6HIQav/2PWUM8cdpBg1RB4IA/5
         tDVfTv0c3+mcQmrQ/M6WpHb1zRKLLZrjvzt/M9bV2gc7cF1jGSzCKrY4k/Hmk0/5/35T
         UbTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481471; x=1779086271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hG7re9nWf1eNGkdto4Ixyj7RYv5HNsRc+oGfPkcFdsc=;
        b=rEo3tL6ADkB2J0ziwJ/ykR/JCx9FZNQOYSvxhGRCwrsbhBWVLBUjdmcwgRb0nXSRH5
         Qwn3STTXNxngDjtbsci/Jd2a1/ULSN0BBHm0Lgp6v8TwEMPWIRA3WtH1UwESH9T7UAmz
         WH0yLn7Uvvfj9oGXu3O7zpIbzKHtYR78vR45DpeOspVolbjDYIDbDA5jDRIdQavN/ZvF
         kttmwgD59Xxp6xdC11W5if5ffgb+TVdBVvFc9vL1GcOhTvikmDMu64ECwU1ZP/q19jue
         0XpYWyJucBE95h+yhJ37NmgmwmrTdM8XQT943G8eAt0aiGE+FqYV8J+JcIpCItQDfGnT
         zXwg==
X-Forwarded-Encrypted: i=1; AFNElJ8cBIgUExID52CJc9WB+d/MEVxffv+l35XymXJbh3J7rSRNpcZIs4dLuaZOK7H/9q5cn7SDzw/hHey98Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx2FnSjNS9MCjyQz70WIPvimyejnS6Z4bCGtuqQRBrBUMKAn0Z6
	AsM7F5XKEWRgTOnEjYFXUFVclVYBCfPRQ1BHOZvdsYFCmmmdEAd6Xg0y
X-Gm-Gg: Acq92OH3J8l0XGpfRW/4H4X+zoba59rbw2GhkuNTwqjJAhDwowTda1HV+bHronqya0z
	R4N9STNmvl4JxEzXNX6CptsyqtPQBpQzmt95jIzZaNZEXuULqUjIZEKUcCHUPUIA+AptTXA+7i2
	AVGy3ZobbIN3bNI/xNAKWJs1H28XKw53C/VUQNNTz5xwTlhxJfqZYWkLGAo3fiAhdQBVPecMys7
	XChxh9tl9R68jUgtBW6E5KiiVOI0+wlHFaxHSctp+BlBxeJ/SqGCL3sJeoZadag+JUtTzk5D9SY
	veqzelXVoJzAGuFLKWWt6Y/a/toUUR0IlWU3EGEKgxgdRV8ssljsxjfUxy2IM28q/yRuY4NpFJq
	9L+CXjY6wicSKU7v18xp0Cg6NPLL3phykoO48PiQ+V8dejU36JNfsWHM2TfIzmjZJVoA6GEjpcV
	KDhTFBhBOHbWkjjdX/u3/SR3NJJoqLlaiJuw==
X-Received: by 2002:a05:6300:218d:b0:39f:8b01:d968 with SMTP id adf61e73a8af0-3aab12eab37mr14600912637.11.1778481470932;
        Sun, 10 May 2026 23:37:50 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c82677104b8sm7992570a12.19.2026.05.10.23.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:37:50 -0700 (PDT)
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
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 0/2] riscv: sophgo: allow DMA multiplexer set channel number for DMA controller
Date: Mon, 11 May 2026 14:37:16 +0800
Message-ID: <20260511063719.460049-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_233752_577996_4BE3505C 
X-CRM114-Status: GOOD (  11.10  )
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

This patch series add fallback compatiable according to the disscussion.

Link: https://lore.kernel.org/all/MA5PR01MB1250079A8884D4F6245B955B9FE51A@MA5PR01MB12500.INDPRD01.PROD.OUTLOOK.COM

Change from v5:
- https://lore.kernel.org/all/20260426012921.673953-1-inochiama@gmail.com
1. Add dt-bindings patch for fallback compatiable
2. patch 2: Adapt the binding change.

Change from v4:
- https://lore.kernel.org/all/20260225104042.1138901-1-inochiama@gmail.com/
1. drop patch 1 and patch 2 as they are merged
2. Add ABI break statement and clarification for this patch.

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
Inochi Amaoto (2):
  dt-bindings: dma: snps,dw-axi-dmac: Add fallback compatible for
    CV1800B
  riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel
    number for DMA controller

 Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml | 5 +++--
 arch/riscv/boot/dts/sophgo/cv180x.dtsi                      | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

--
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
