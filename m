Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9E7C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MijO4sQmsjm/zKeolZZ50rX3Tf7HbiNSWJ/68WztuJs=; b=g7otY1C7RdDnpH
	VuOR8Mo3GJ+eyakXXbihWvaGse+fRyz6BRBD0Aux+yLTCQ/WrZJ5l4NDfzC/tSEHA4oju56t9daYr
	gnD2+0YdY9+VWtDPSsE+ujvHIOa4C0MxJTg24HOeHXqOTYwEFzVPH/c2yt/Y9Jf1D5AdjgwYloiOA
	i8JI8vECtj5OvUplTzwh1fy/V5IzLnbamdWUEQtf8EbrxCJJJXZhKz2KeIg6ApSeYKzMqy8v0DIMg
	3XuPdW1Zdo8y/o3hz1NvSDTgiKfve5taH904CRj/hVm9ZKEV4eCvg4gaOHslYlCjk9KDWohZXdtB6
	vanBGzPqwlpt8T0dIoAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucc-002bNp-6h; Mon, 27 Jun 2022 19:42:10 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uc2-002aop-Sm
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:36 +0000
Received: by mail-wm1-x334.google.com with SMTP id c130-20020a1c3588000000b0039c6fd897b4so8110875wma.4
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/4pSTzmZJtMPfdZhp3nJkb++kMPSJ1FDzT5rHgbkyFo=;
        b=fUcGP1N8oyv9wbrxArow7bj9CcdpzDUZQAModO/c79V3MzgRbDNNV/8LgF4H1T1GQs
         IChP1zjgi/XOcXFhZIkbV0TCnP/aEmt30Qt/x1j/QHaiLaw6W7XR/ZcK5lCplaamVDzb
         m6w/B2QGiflnmfO1WZS7VEaMRJK0e3ugiRjiGSRO0gWg6iojMRzR5V4a0KyyQUXAI3fT
         ePAmN8ijusyEpXfItpVgKuiAKLDnsyTJqmZX5NWTsvckGK1LX1/XQ9zMdcZhLecowRCr
         rvyMkn21VBG8epRNjd1ed0nDT3oBvlHa57V6rwoKJH5h/ATmx4dpU3nicZ3JbdF7uof3
         6JRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/4pSTzmZJtMPfdZhp3nJkb++kMPSJ1FDzT5rHgbkyFo=;
        b=QtFkfws5D/z8lZBVIr6phAOdOfsIgc6EKb8lVso2YRBvC0TAg7iTia/4rZBudNrSR7
         4zZqixIbIYRIQn18RTkZwRd4IfwRWozoxRKlwDpUPMDGKk0DiSZV/u8zXpnPv5ijebQK
         z/MeifGYWCDd8+g9xw2d8kRk0PMk+60E8aVi8Rrrej+TTDXUTMxVn/GBsAXbvBg5OpjG
         1FXF69nC7AMBwUwpAAEnOL9tWS8/6BKIWJy0WlLc0geihpde2mCNBY22AWanYM6N13rZ
         4haKVaHDWRok7WCXklDgp07LyM3BBcHJFGDj79a4K+0sAzyfallpR/UmiNArWPGo25Yr
         3aOg==
X-Gm-Message-State: AJIora9ZsI0fSEu4TyvE07EgJLM8wZ2AFo4WcGXmI5S87JebhZJMLfn4
	rpxe3/bqCYA7BC2RbBxF0TxLew==
X-Google-Smtp-Source: AGRyM1ulzUVwSrZMGumLgKk0IITcW4JskOSYSyGzeL5vL40TAZn2Pd2mkHEB4lIYztTEoPvb5D5DGQ==
X-Received: by 2002:a1c:ed08:0:b0:39c:80b1:b0b3 with SMTP id l8-20020a1ced08000000b0039c80b1b0b3mr17522441wmh.134.1656358890978;
        Mon, 27 Jun 2022 12:41:30 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:30 -0700 (PDT)
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
Subject: [PATCH v2 09/16] riscv: dts: canaan: add a specific compatible for k210's dma
Date: Mon, 27 Jun 2022 20:39:57 +0100
Message-Id: <20220627194003.2395484-10-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124135_001176_CDEAA506 
X-CRM114-Status: GOOD (  13.86  )
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

The DMAC on the k210 has a non standard interrupt configuration, which
leads to dtbs_check warnings:

k210_generic.dtb: dma-controller@50000000: interrupts: [[27], [28], [29], [30], [31], [32]] is too long
From schema: Documentation/devicetree/bindings/dma/snps,dw-axi-dmac.yaml

Update the binding to use a custom compatible to avoid the warning.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index cd4eae82d8b2..45ccab36618a 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -143,7 +143,7 @@ gpio0: gpio-controller@38001000 {
 		};
 
 		dmac0: dma-controller@50000000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "canaan,k210-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x50000000 0x1000>;
 			interrupts = <27>, <28>, <29>, <30>, <31>, <32>;
 			#dma-cells = <1>;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
