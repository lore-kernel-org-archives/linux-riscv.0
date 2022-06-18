Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4459BC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jun 2022 12:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xbr0HxssRJWyh/XJsg1ViM5llIspOsahWtWDu7atB+M=; b=2ITpWTyotyjWlr
	DZs+ZkzlY2MjN/x4cCQ35os304t8DYYlVHzUQCaUROWy1ECBYjCo+A/smr82PL0zCxLhEZwoiOU1w
	+OU7fdiBz52ffd4n9mavLYJXM/GKV9+WGfwknCnIHYVxVAisFYXHADzpnYXHhKcY/Io+WT+tvGN1A
	mFzUobU3FPMIKNflko4ZkMjgaKQcQqasJwABJW/GfJcCf24mIxyot6LwQzGtSQ7uhWIXX4/0wygSk
	N/UeIbfZDatT4ukiaUoznOcwhYuax44fnnmR3RFqCKZV7ww+RFQE19MoDBfRPYPVFUSK+ftsdogOt
	ijnoNm4vdKbA0E37Ph2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2XdC-00BI9y-2y; Sat, 18 Jun 2022 12:32:50 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Xcn-00BHVp-WB
	for linux-riscv@lists.infradead.org; Sat, 18 Jun 2022 12:32:27 +0000
Received: by mail-wr1-x430.google.com with SMTP id w17so8782348wrg.7
        for <linux-riscv@lists.infradead.org>; Sat, 18 Jun 2022 05:32:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hvr7KGApLNCGFBglHD3dnfCRd3yjQwODkG+M5NRKmQI=;
        b=DDJ6xBBbhzIGoPiqSpo5MnWPGVLzU4ERv8vLSiBnnPAynNwKjWM49EcnFIFQEkgm/l
         doK52smtoMBCAMnt3+oFGMyw4xhf6W+5pMee3IBtco7DlzBypqqFxGPePkxlqPEw5tri
         SDLBm2agXeKviAcJotwY5RL1uBwFcjHga0K6SkH6mQCE6NwwTJxpZV0bQ6udBQCQ8t5X
         /ugUETlZEHQBi+kUxi5RSWCIVIQtoVjqwtn8FqK1wrZYFA5exI/WKKix1Zp5xujFsjOq
         WhKYuvAAICTLiFyGacSvPtjx9GD78ZZmFV4S8UwSg41UB0EBKvQ+vCEP9thO5HxmtSKW
         MnvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvr7KGApLNCGFBglHD3dnfCRd3yjQwODkG+M5NRKmQI=;
        b=SFAKnkO9wr2Vp25kL4mWdgnQgLbvQVtoFwULjef+KfYi8XA8JY6H+1pxJERSGa7d3g
         PmlO25HkC+yz1x+rLUTEMH3J7sy++gfafLTYkbEjcNFAnKOzgNHmpP0wB1M79SqiMwmq
         SLQ/SM1NVM2CyhL19+6Hf/hUqLlO5luPXeIi7MY709suBSqYPJ/ZL5qyxRWV2cJWYfr5
         WrmsxnfCsPzJuc/CevGBUcIyEUS/Sv2yV5hTCekj6Qh+f5KgFGszkp6sh7BTtTJBjmo/
         PsA+8FF/We1eHD78Hk74eiCo7l9dq3y8hpXEB9WPqZ7us88ehHPQ1KFSJDKRHTiHJV4Y
         7u3w==
X-Gm-Message-State: AJIora+kX49CMTXLFfWLNrFj28sK1Vl8DgnBJLZZdN4GcsHdO33gNgAd
	ZW2kmElJdxAvcQ0xvo4/QX5fuw==
X-Google-Smtp-Source: AGRyM1sRT/G1/Zc62fYFm4YsukPkHZCuylsLgzzu2NtDF1otkPHXpMjCG/oHMIlIy5/3wMzfMLCUWA==
X-Received: by 2002:a05:6000:147:b0:214:7d6e:cb1d with SMTP id r7-20020a056000014700b002147d6ecb1dmr13471356wrx.650.1655555545465;
        Sat, 18 Jun 2022 05:32:25 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id az10-20020adfe18a000000b00210396b2eaesm9292305wrb.45.2022.06.18.05.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jun 2022 05:32:24 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	Heng Sia <jee.heng.sia@intel.com>,
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 14/14] riscv: dts: canaan: build all devicetress if SOC_CANAAN
Date: Sat, 18 Jun 2022 13:30:36 +0100
Message-Id: <20220618123035.563070-15-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220618123035.563070-1-mail@conchuod.ie>
References: <20220618123035.563070-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220618_053226_107695_A7055841 
X-CRM114-Status: GOOD (  13.09  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Testing & checking the Canaan devicetrees is inconvenient as only the
devicetree corresponding to SOC_CANAAN_K210_DTB_BUILTIN will be built.
Change the Makefile so that all devicetrees are built by default if
SOC_CANAAN but only the one specified by SOC_CANAAN_K210_DTB_BUILTIN
gets built as an object.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I don't have any Canaan hardware, but I build tested it and the log
looked correct with arch/riscv/boot/dts/canaan/k210_generic.dtb.o
getting successfully built.
---
 arch/riscv/boot/dts/canaan/Makefile | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/canaan/Makefile
index c61b08ac8554..befe4eb7527b 100644
--- a/arch/riscv/boot/dts/canaan/Makefile
+++ b/arch/riscv/boot/dts/canaan/Makefile
@@ -1,3 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .o, $(dtb-y))
+dtb-$(CONFIG_SOC_CANAAN) += canaan_kd233.dtb
+dtb-$(CONFIG_SOC_CANAAN) += k210_generic.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_bit.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_dock.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maix_go.dtb
+dtb-$(CONFIG_SOC_CANAAN) += sipeed_maixduino.dtb
+
+obj-$(CONFIG_SOC_CANAAN_K210_DTB_BUILTIN) += $(addsuffix .dtb.o, $(CONFIG_SOC_CANAAN_K210_DTB_SOURCE))
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
