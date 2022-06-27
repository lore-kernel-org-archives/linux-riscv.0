Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 989C4CCA473
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:41:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5bL4QnRIdCCOJMxf7J69K5OyYemCnoiFeuzYsTocjkM=; b=3li9u5t8nHc9zX
	Y+3VtQf/etjIurrVpAHSROtK36lBu1E4zEuxOdHvtjLXvn8U6OEds/hZXtBhNSM01xcBDziib6dOl
	Lthrusv3P77dhRb44h9P9rLO9iU+oyvtQFDXN+s/d5mXJ+x0impZEuTNBRrd3R1jWEUkZKpJGvg2C
	KGp32oRqypKJhW87MUmPdC9SkEUO+1JUH3AG4R9ANV9Pt5786Or8q4xKF3/X9OtNqE4gmuoPQeYcj
	gAHhwzEPgxx9KEYIJmxkghiOyGhiyOrlHQy5qE/oLdSfl4Vv+YpIoKQQkIA3g35xTHN3MWBuDplTW
	ul2FL4lnc1pv4ICu2tqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ucE-002b0n-UB; Mon, 27 Jun 2022 19:41:46 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ubu-002agz-Rm
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:29 +0000
Received: by mail-wr1-x42d.google.com with SMTP id e28so9326535wra.0
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rPDKSpav5hSShjOawRd8sA//kdWQiIl6x3DL8tBafaU=;
        b=C1x747pHFCl5BIqO2tKVzQODSEqSKX0M+cQ0VD6TIiatD4/0B898wZwGc+vBUmCQ0Z
         ADkKctZpaFeqts/DgO6pXu3oW1ot2vW9NotfT4U4Xa+zwfZDDxaHFDiYVvm2R9CNqtBj
         E06Rcknh3CHYad9cflRuFOXZX1vmY5B3c3ybS+4vwbu/3Wp9I852RvQRqqNz4cuKOOgI
         n6ASQz3H09UYndOSN0Sl15ncyePaPZCwy8CrQeWv2hWUXslPkctHVLpfaWL3RtoOlIom
         6s/OUA/vQFDetPTA2Tu0u58R+o5XSwX+2TI4F7Y5afZgDMoZsAgvkVAFJy3S7tg8MlqF
         4qZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rPDKSpav5hSShjOawRd8sA//kdWQiIl6x3DL8tBafaU=;
        b=sah76jVPhzdkVqaG6WoyF9L7F5BW920A4fkn40fu63lVqJeK77KES3bwC6T1FML4Vr
         aRfO3ekwgRhUpfg6EyJc3G9H506ttQTALDHIeX32hF8HlVCClO24KAgRTjuCvvSzKgbI
         RdKyX9ZkLeFyQNVxP3bXW98jDeqMVlVg8O+KQcj9IdoW7f42Q8oIZmHlwhUh68MzHMy2
         NpRnLjQbcX9k8d/196P4pN8o9MsDVdHFek99k9V9ceBtdGHFsTBpQfJnUpIeZtyn0N5x
         qVLImJWVUb7dQVcP9IAGCDQq//eNQ2x+bfI2qBDoWE0fr3yFvPtWhud048ud9jeOomgI
         t0oA==
X-Gm-Message-State: AJIora+z79LKufcoB3MV4Df0pUsXd7ap/gFClGl3UYod7F8CdNbwGYwz
	dK+QmGnmcbdonygvzw9IOAyFzQ==
X-Google-Smtp-Source: AGRyM1tVL2lpq2bKGJHZFM8okKWTC0C0B/ryfKeZtLnMa7gdCDbQ3Nw3Z3guL69dxyfpeL6LZkAb/A==
X-Received: by 2002:a5d:4592:0:b0:21b:8e50:7fb9 with SMTP id p18-20020a5d4592000000b0021b8e507fb9mr13593921wrq.428.1656358882170;
        Mon, 27 Jun 2022 12:41:22 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:21 -0700 (PDT)
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
Subject: [PATCH v2 04/16] spi: dt-bindings: dw-apb-ssi: update spi-{r,t}x-bus-width
Date: Mon, 27 Jun 2022 20:39:52 +0100
Message-Id: <20220627194003.2395484-5-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124126_999070_844AAAFE 
X-CRM114-Status: GOOD (  11.51  )
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

Most users of dw-apb-ssi use spi-{r,t}x-bus-width of 1, however the
Canaan k210 is wired up for a width of 4.
Quoting Serge:
The modern DW APB SSI controllers of v.4.* and newer also support the
enhanced SPI Modes too (Dual, Quad and Octal). Since the IP-core
version is auto-detected at run-time there is no way to create a
DT-schema correctly constraining the Rx/Tx SPI bus widths.
/endquote

As such, drop the restriction on only supporting a bus width of 1.

Link: https://lore.kernel.org/all/20220620205654.g7fyipwytbww5757@mobilestation/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Serge, I dropped your R-b when I swapped to the default
property since it changed the enum.
---
 Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
index e25d44c218f2..0a43d6e0ef91 100644
--- a/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
+++ b/Documentation/devicetree/bindings/spi/snps,dw-apb-ssi.yaml
@@ -143,12 +143,6 @@ patternProperties:
         minimum: 0
         maximum: 3
 
-      spi-rx-bus-width:
-        const: 1
-
-      spi-tx-bus-width:
-        const: 1
-
 unevaluatedProperties: false
 
 required:
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
