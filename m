Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CAA8C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Jul 2022 21:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BT5eX8+xGcCXWukzkbKmNK4pN8c2k181Ttx1u+AF3zM=; b=h4FlP5oWOmgIZD
	UO884elXNoOAHLN3Kx9H/WrnS9tGxIh3vPrzr8wkgq+EFEwRCwkb8iZ7rta1AERvG2vjejcSfDdju
	ilOT2XtoL7zz/ktf1TZ8wzfgiKBbUtqC/takGaPg+JTxRyKFN19iZM0mJm8IJunf0BWPmg2RM+fpL
	06U18eW84X+k2HXIvG/qAweqoIkU+N7j5Tt6E8e5nhU01F3KF5mIgnR4UWVfBfmzYT91eMqNH9TEv
	KY2/0mr1cv8e4lb9hTmUbGS9T4hRIOi+up6fxJySuh5zsTUhep4GAkQm3xs9dUiCByBB0398WGmZU
	BmG0/BkTlAxNz74yEMEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTM-0030dB-7h; Tue, 05 Jul 2022 21:52:44 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o8qTC-0030RH-Ge
	for linux-riscv@lists.infradead.org; Tue, 05 Jul 2022 21:52:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id bk26so4314435wrb.11
        for <linux-riscv@lists.infradead.org>; Tue, 05 Jul 2022 14:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RIjyo+v4SVWXgjNDfjVuAJAWZ8Bxe92vN1FxyPqfbiA=;
        b=HqLk5zcJWf6yjk0sm6LnL2fNfSHxlMYcx2NwuUldwgNT7LBQbNK8U+CHNU22ohSZfX
         jfsOHnehMji+CkgBY81zgji8jbKG0uw9RDIRgMLentiuJYYOTmn4nVjRS8OlckRy5WTc
         aX7ZxCMNVzNmvoEFSO/1DsXl9LYItNkpj43Am1GvNm/28n8AUqF+L4SddAB0dE0UISfW
         OTEm1sYYtkE0SainnUlBfSPT2PNzJ8nj5JUUbWlj2bCJAtBeTjiQXgsP840dxXt/sT4U
         VAXXJ1jT0os0tnSlMnOAkFvKzIeMM2ToW1M5kBy5hxQ8nGJ29djq+DavH3lQBSjizXUT
         gUYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RIjyo+v4SVWXgjNDfjVuAJAWZ8Bxe92vN1FxyPqfbiA=;
        b=KODgxuDXl+gn9JI9cT6EVVHu6lmMecj2BJIkUV2+5qyk/LjVqiAnAeBqNKF9yzhtW6
         LD3cLmR5JuMY8u8vsPPvm5gLf1gb0xL8kzWbEImp84cLDmLQGUUb2raYBreW791fYcfo
         f7aNlvrIklKowmcQ1vi4/q+S6jBYISy4NxTMBKJEO1nwB1SY8LGVBM8XtgayTBhy22I6
         3qpbwZA3B5z3FHT+aK21Iq0AV62w+7dsXf4heqPkUVO4AgJR67q1M8F9XsduSL2X8zHO
         Ep9r5xwLmn3X6Poq6kA+PILt+wimvMmTgKaMe7LqXl6LFrgA/6Ovp/2T7Gdr1g60qaAm
         SYUw==
X-Gm-Message-State: AJIora8F4ZBIjE8p2GszXMfSDA3myDSLyL0c9K5V0EjDpTWto0PYgV4Z
	4Gi1sVBjI7a5iPnjFvLSNPfuuQ==
X-Google-Smtp-Source: AGRyM1vJjQMyrNGX7U/FSTka+YYEasXPf4fPHcSV9Pyiex5jqMICTkfId8wmcqmwizt28warzAehaQ==
X-Received: by 2002:a05:6000:1acc:b0:21c:439c:7074 with SMTP id i12-20020a0560001acc00b0021c439c7074mr32321649wry.686.1657057950904;
        Tue, 05 Jul 2022 14:52:30 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id g34-20020a05600c4ca200b0039c7dbafa7asm18353920wmp.19.2022.07.05.14.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 14:52:30 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Serge Semin <fancer.lancer@gmail.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Dillon Min <dillon.minfei@gmail.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 05/13] riscv: dts: canaan: fix the k210's memory node
Date: Tue,  5 Jul 2022 22:52:06 +0100
Message-Id: <20220705215213.1802496-6-mail@conchuod.ie>
X-Mailer: git-send-email 2.37.0
In-Reply-To: <20220705215213.1802496-1-mail@conchuod.ie>
References: <20220705215213.1802496-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220705_145234_591238_A3E05387 
X-CRM114-Status: GOOD (  11.85  )
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

The k210 U-Boot port has been using the clocks defined in the
devicetree to bring up the board's SRAM, but this violates the
dt-schema. As such, move the clocks to a dedicated node with
the same compatible string. The regs property does not fit in
either node, so is replaced by comments.

Tested-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/canaan/k210.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
index 44d338514761..cd4eae82d8b2 100644
--- a/arch/riscv/boot/dts/canaan/k210.dtsi
+++ b/arch/riscv/boot/dts/canaan/k210.dtsi
@@ -69,11 +69,13 @@ cpu1_intc: interrupt-controller {
 
 	sram: memory@80000000 {
 		device_type = "memory";
+		reg = <0x80000000 0x400000>, /* sram0 4 MiB */
+		      <0x80400000 0x200000>, /* sram1 2 MiB */
+		      <0x80600000 0x200000>; /* aisram 2 MiB */
+	};
+
+	sram_controller: memory-controller {
 		compatible = "canaan,k210-sram";
-		reg = <0x80000000 0x400000>,
-		      <0x80400000 0x200000>,
-		      <0x80600000 0x200000>;
-		reg-names = "sram0", "sram1", "aisram";
 		clocks = <&sysclk K210_CLK_SRAM0>,
 			 <&sysclk K210_CLK_SRAM1>,
 			 <&sysclk K210_CLK_AI>;
-- 
2.37.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
