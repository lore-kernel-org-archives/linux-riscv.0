Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6433DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jun 2022 19:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=udYjNjeSGhW4MfpL+1gymPjb+0mvNM02e4a00fLZJZY=; b=3M4RPDbKpBgqUd
	xJXOupurFZGz/otqYqgArn50YFuxCRLlR+IZzFSGr+uYdTdkctlujW1AQgDt2fzjsMKar4tV/hm3a
	EmhRfDeDsuw277o2+JjygZCFySM/lccMOsT/2z6OysBxUy2OO9M5LbYBDb2ax5Lj6FGZr7LRgIxv5
	n2vonjr+boaEpRigJV5LtwD2y3JtYUBO7/UTlijkz3yhL3w6MzttZ+l+2LnJOahPiw+x8cpm7Gp0d
	TLILYugIS0bHpQViiYfWcd8e1R4wZ5htGshSvTR3IIoaR3nxRVm2TEXzeX5oF2cj2IvPpnDPwm3Rr
	dxXKKujkxwykTzIsdBIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5ud5-002bqN-NZ; Mon, 27 Jun 2022 19:42:39 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5uc9-002atN-V3
	for linux-riscv@lists.infradead.org; Mon, 27 Jun 2022 19:41:43 +0000
Received: by mail-wm1-x32f.google.com with SMTP id m6-20020a05600c3b0600b003a0489f412cso1857103wms.1
        for <linux-riscv@lists.infradead.org>; Mon, 27 Jun 2022 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
        b=JSlI1sImVuIOJXOTiME+vQ4iJzMZIGLs79AVGgFi/4PGzp9uNq+ij4fgaq4v635z96
         iqu+qlmc2CiECMm4cbe0xKFYr+G0bJ9m5w/qt06RqK6+DYgKNGKu64YA1Ggyrg3bTcDj
         h9fgtLqXO7l+D1Ptq7BJ+bfj9GpPhEpyz0OtKZP2fdfMBXf439DK7uOf1R3SGH6PnWaN
         s/MNpEYNLa1akQZc/7jwyPlPi0BCuioZyE578J82CZOAhvUksEUtg9kPuoYFd7foZxqa
         Wz2VVt6ePjVl2/A5ZdagCh18QXlj6Gb36JemsKRegKW5rGQi0MPTcSTuEnFkg8i48gi+
         dWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1RrlYN7xRo44UoZQ9vXu2CHD6ouZYfkPgpPQl3XW2/Q=;
        b=n1pQ3LXUNbORh+7JzPpVXQy0fyVAjRqABniZr6/d7PWhVNKxBPkjrE5naR5F88qe0v
         MMedIkfMWrTMThs4G7QFRE7IZ8jhb1j4QHwTRGUU4zosci+5OAAsI+Ca5Nvk0O3HqRH6
         USu6TRTswWafU+2vuFSlWYMZakZy2pYhk3/QgpQMu7OXDs9gaT0BmKNw8fVNU1q9jLR9
         Is02o3d8ZK0tzyLh5erx+yJHcpw/5loiL6GQbtSyq2f6niyu5M2J/rdiddgBc4da99/g
         VWDmMoXl/qIqo70jovzFu1QnRTsuK57qQQGadJWUxVelzsn0SCrRqYII6nHPbf+ykHtt
         2agw==
X-Gm-Message-State: AJIora80BiV0cPFd9Cn3VZlFifw3+sE0Nu9MixyBFr91Hrl/9/E5WugV
	Pztka3uYkJVUp6fI1sfAWHVhyA==
X-Google-Smtp-Source: AGRyM1sG2h/mawEtIGYv6YucN+AC/fcU+GXYsZ0RG4tU7euqny2eYvUYl3sfYU/deBMVuNdMP0smIQ==
X-Received: by 2002:a1c:790c:0:b0:3a0:3e42:9c7c with SMTP id l12-20020a1c790c000000b003a03e429c7cmr17586763wme.171.1656358897396;
        Mon, 27 Jun 2022 12:41:37 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id e9-20020a5d4e89000000b0021a3a87fda9sm11428047wru.47.2022.06.27.12.41.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jun 2022 12:41:36 -0700 (PDT)
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
Subject: [PATCH v2 12/16] riscv: dts: canaan: fix kd233 display spi frequency
Date: Mon, 27 Jun 2022 20:40:00 +0100
Message-Id: <20220627194003.2395484-13-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220627194003.2395484-1-mail@conchuod.ie>
References: <20220627194003.2395484-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_124142_074747_34AC17EE 
X-CRM114-Status: GOOD (  13.28  )
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

The binding for the ili9341 specifies a const spi-max-frequency of 10
MHz but the kd233 devicetree entry has it listed at 15 Mhz.
Align the devicetree with the value in the binding.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/canaan_kd233.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/canaan/canaan_kd233.dts b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
index 40992d495aa8..4a540158f287 100644
--- a/arch/riscv/boot/dts/canaan/canaan_kd233.dts
+++ b/arch/riscv/boot/dts/canaan/canaan_kd233.dts
@@ -130,7 +130,7 @@ panel@0 {
 		compatible = "ilitek,ili9341";
 		reg = <0>;
 		dc-gpios = <&gpio0 21 GPIO_ACTIVE_HIGH>;
-		spi-max-frequency = <15000000>;
+		spi-max-frequency = <10000000>;
 		status = "disabled";
 	};
 };
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
