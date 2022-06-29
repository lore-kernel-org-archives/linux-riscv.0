Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13792C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jun 2022 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EDAGNfPTtpOaJ067XDeGgey9wWRlQRUbZtoCicZLP6I=; b=HDJhdIAB9H954m
	qJlTW7PH7laQVLC5ad8EL8gXf+rlf/nvw8Obo2bvrg8cZBO8Embel6TStM/SSZhCgI5ix19jHhJNS
	cozSGK9Zh/JqfMyXxdnqYo+GTIzP1BGXAEBz06+tHUpjwWUYWm9DwwuJohBCBbhPw0L7yexTh6C7+
	IiewWVXhHYZ2FPaSVCYxn12dUUOXLQBUh8Sst57NN2n+n/Gf394c8GzU257XiZDiSXUxkmAY8c7Ib
	xI/2EM5oHLW1OUcCBKEnXMJgQO0B2Ue4UHCWQyuT4W6NjPg71vldxzJxYcP7qmMUzJPK7mufDdT/o
	yLiE6QphFt/kDM5O3kRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6chi-00DbXK-38; Wed, 29 Jun 2022 18:46:22 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6cgP-00DaA3-FC
	for linux-riscv@lists.infradead.org; Wed, 29 Jun 2022 18:45:03 +0000
Received: by mail-wm1-x32e.google.com with SMTP id l2-20020a05600c4f0200b0039c55c50482so203312wmq.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jun 2022 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=conchuod.ie; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
        b=cun3Fr5kbB1kc8fHUe1Pp/5QcguZXRCH+7TrDGk+ZMirUtgQL36YLVbJCyhLZkOBJy
         LhvI1GVPT1ZTiqmhJOU4Q4LLd5pGvHUxjtjZGRI3dGMdUZcBN86wcFBgUizT8kZoHfh+
         rzleb2gxRvUVaOsxtxjzB3eOBv6fv6XHPIx7hcXbCi9kY8hS+dv7hGMpXyC9zsYxLjVV
         OdIhzsTDSyIcq3kRndNjuRbrJ/XkT7HQi3aadRk0Mm5KKIz0aoZlheM2JjydatfBmbmE
         b2/Cw63ViZ4v3295nkIXbKulmCKxxxTgoEJn+r+AuOx8BCV+qEspBTkmWddspDZSYqKX
         yfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZPnaNl2N6OCS49bYwYg25LRRooD0U5t+6njnQfYqn3w=;
        b=e2xkMWL//2qyxSerTxmA7zN4cLrSJXNj+O4goW1VplMIDVeR8/HPXsbBkG3qv57B9r
         bNtGbgDvNsfayC7j5U3RDX3H6x+HVWKLLr9DfA3E6S6Np8mdVE5GW9e1lMS28XJHlJLj
         Lyq/rnw0D3x1Q6kGuB06oa/Q3ww/6ZwVcKZF9nmeYa/P3cj4C5FzEX3s4KSoWHxkc1YI
         0Ij+yGMTJdLPdc6s2w/7NcKIWes4ZEwz1MKIiSjkF/X2V+vwhQqRs04CcNOCsOzBQb6H
         jgqZlMCKAunh78PuLMVYwYIRc3HLwFGxFol1gh44S3s2N5MiMOVJ4hNrGz2s2SOLTXpv
         XMsQ==
X-Gm-Message-State: AJIora9HdVEwQXIykGEtNn+S0nUsuuUpjOKHx9IR8kiCRA7sdbacCjIp
	S5HLVKh7DeBgE04hLLeDeGth99/RT88AOAaC4l8=
X-Google-Smtp-Source: AGRyM1ssGrLiDWDuNuov06ew/GRkUp9AxME43xf1zuFe29c5Ad1nznXlVQLFaI/03jH4fxep5tbDyQ==
X-Received: by 2002:a05:600c:886:b0:3a0:49d7:d8b9 with SMTP id l6-20020a05600c088600b003a049d7d8b9mr7557614wmp.115.1656528300967;
        Wed, 29 Jun 2022 11:45:00 -0700 (PDT)
Received: from henark71.. ([51.37.234.167])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0039aef592ca0sm3834371wmj.35.2022.06.29.11.44.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 11:45:00 -0700 (PDT)
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
	Jose Abreu <joabreu@synopsys.com>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	dmaengine@vger.kernel.org,
	alsa-devel@alsa-project.org,
	linux-spi@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 15/15] riscv: dts: canaan: build all devicetress if SOC_CANAAN
Date: Wed, 29 Jun 2022 19:43:44 +0100
Message-Id: <20220629184343.3438856-16-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629184343.3438856-1-mail@conchuod.ie>
References: <20220629184343.3438856-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_114501_573973_119BC140 
X-CRM114-Status: GOOD (  12.48  )
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
