Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FA4CCA473
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:43:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDAGNfPTtpOaJ067XDeGgey9wWRlQRUbZtoCicZLP6I=; b=pEEtceCKPCz8be
	txaQ73AKDN5+j9iJQhXIVGl+7Kliy02jUiaSFeHF3NdpzLOWmGKq7B19IIUAtF7cyf2iwctf0EQ7c
	M8/z2RlfMFoRo2GkN+t2lUAHZnz0x5mMpPD3c6msXARGGpBtE+NJaS3iMObRjJFtD9MSp36D2rOMn
	JbYLY5xrWopa5RddAsakYdSssPUBRpYmQNhM1pXnOgAR1uQ5ujO4y76XFTgTQ5E1ir5eOY9MgNc/X
	BOyZvC+qB0ACaSXWo7/xzNilRV9FUidY39E0sKRkcn7azuYPyILL1gSHwBhdiOcRY89UV7MJ44S3z
	FWoQG3ZkynmiyivunGRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5udS-002c7F-2x; Mon, 27 Jun 2022 19:43:02 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucD-002afo-6U
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:46 +0000
Received: by mail-wr1-x42c.google.com with SMTP id i25so8974835wrc.13
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
        b=MOohgr19HljbByTvyNxJnTzuFRc+80XEY83slSBV3T38pJReWc/r2vS/nOk5tM3fgh
         o0PeEHbIXwdYX8w8o/2Z+tOWI/pblKRMqN6cWcuVmoSgQJcUM4k7o3KZ8Bga/IW3cMxn
         htf5vt82qgwz2AdmKcvtLew4WTHJpzSLNlFEtSdw1lUDBPfmzQ6VPma4Ihqx416iMO9q
         OjG2BfW5Fb/pMNNGTa0W3lzf/5Uj3IdmCXYm0bDti+q5Vvni3wozuVRvHSs4b2osYT2/
         INsrbelKnz8FWtbN/E4RVTXkbha41T/RhTGSoWBux0TT5r20qWoUKgEs96eGFAOTBcM3
         SHKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
        b=TIkss0CdirdIqZpa1AzzGiNOTtUAuFbIv4Ye/w3/LxmCppAdPDkV1+wFJ2mQK7JLtW
         L+UmmdYJmmfNfkSZLP33xsnExrXalBUUAHUos3c/k2vf/nNMXr5KQeZEAIF6/A6jXx/Q
         tSb61QWcoS0llX4uuYxCu59USNbuj3TumW5nPe2fPb46gJKNosS4OAnV7B7khDc119Cm
         +xPEyLhwkHL2DnkvNyBCKUz5Z3oomZT5/GPa4+y4385MY2wmvzB1O+X+jgWsYLddmeb0
         fb6mooDA6QX9LEpdhoclZUG/ZJKITJ7xOgbYhZ7kAtOIbH9rAKROd+85dSugilZ93Pd+
         JBxA==
X-Gm-Message-State: AJIora80UlrdGUW/BZTrchMnEfIQGBDkLaulq8xHbWkp3Y82wE2tI7JR
	qjUApD3Rr8azo4j0riq4c8OTrQ==
X-Google-Smtp-Source: AGRyM1tRVPClRCoBOM+0dnNBF8Xh0WBUSfTyTPIl0mjH8CFu3Jd18gFLSGXlP3EBu9PNI15KlSes5w==
X-Received: by 2002:a5d:500a:0:b0:21b:8274:9ddc with SMTP id e10-20020a5d500a000000b0021b82749ddcmr14053574wrt.251.1656358904731;
        Mon, 27 Jun 2022 12:41:44 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:44 -0700 (PDT)
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
Subject: [PATCH v2 16/16] riscv: dts: canaan: build all devicetress if SOC_CANAAN
Date: Mon, 27 Jun 2022 20:40:04 +0100
Message-Id: <20220627194003.2395484-17-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124145_300196_F85A51D1 
X-CRM114-Status: GOOD (  12.26  )
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
