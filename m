Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63279C7EE29
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jun 2023 20:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ykkXplSPzTWz12JdxRq5t//LP3nCPq8Jin5M9FRThJc=; b=zo+w+mWQeBCoSK
	sPKQkpVmjaieelZceEIKv70U8KKPgE4+0BmqsUF3EVWEKpCoYPjKBgE7cPGq0z8tz3Z7SeflajH0p
	fIB+5JOVRag99FMy3iKO59dT9KYvtdqcHiGHIH/O2AXUiw2vs3MfIru2f2B0rGyqWPzpFdjyqfsYI
	11jr3/oam5s7CLKyaxUWyW884JjoD6ywLHJyhLzrWI/3FznuixjtiAVl+dfeEBkGjTisM1ePwGf5N
	JqHh8x4AHWwvwGVevRc0iDz9njMhRP9qcV/4D/BhWV0y3aKT8j9lFZkBb5Qev3VsQJ393z3AOTjJi
	oZ/dy+cyDsYCRuBJHkEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q855W-00GzLD-0U;
	Sat, 10 Jun 2023 20:21:30 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q855S-00GzIx-2n;
	Sat, 10 Jun 2023 20:21:28 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-30e53cacc10so1813079f8f.0;
        Sat, 10 Jun 2023 13:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686428484; x=1689020484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=q/HkAmIWDbgYoNWDDvT9YG/eWL52I35C0UJbDbI1HdQKZp+vNeYsWGUudS+FVnuO7q
         hw7oXcII3vxaWQLMSONG8XrmkQct32TLHET/Ql5xDmhf5uiDqZnN4HQBe0w6LiWQo4zd
         KTb5ddXVdsLXL2s6ElAylt2FpfdAEz/YboO5Hd9p0zgz1ZqnKlP4moTQmkNENgKys9yq
         mpoOc0nPZTKaYEZAPyPIOx48Ac/nQIeNMRCdldsJb3ivr3NtfDBs1TpRJIyLuZXgA0Am
         1FqqmH4xUJnhQrzIBYrZggfwm3JglxUDmeeEh4F7S0htHerNjv2xR07w23BaRpcpwXLv
         4Gsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686428484; x=1689020484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9/TmEA+PoC7xu6/KU/ll32pvJQ2ck1CrGNuRyF6FIV0=;
        b=dWTNK+jAOd6bjVcaHG8rshUI07B3+n+hn8yNG+YtwcfVOXH3/yQ8mOP6RTx2kYK8bD
         KmtbLfbjcDAqbP4Tz+QMSMDahOrWf42+3YzEqT2T/M9tv7I9Z4aVnEhEtSS9r+Da18TE
         4nSW4gl7+9+7uR9fPYielT3AMbZp/JU3lNtr08y5PvQ2YzqE8zUyGopwaE2UaC1bYzqf
         ROAWSNxUYR8vOyLj9azLY/vZJfo8eHBBlDrLRw37UzNFpFpxgpfUDRZWHUB7lDFDeSv+
         RLgVxMk5C1j2gaMQ7onBNKXvc4i5nXOgL7+ZF59TTVKmvo7tgNOPiomHffrTO9Eph9/j
         CTEw==
X-Gm-Message-State: AC+VfDymXj9IcI3X2MFRxCAM1JF9CbRWzKsnLOldINmkJLHpjFnamj8m
	zSooDC0PYa6nuTopgl3NhHo=
X-Google-Smtp-Source: ACHHUZ5DbztnfIc7NFufk8XwP3nLXNU5KRP/S//g+7bbSRmQvPvKaCzCwkR1IA7NmuIeIlqhNtOGqg==
X-Received: by 2002:a5d:4111:0:b0:30f:babb:4e02 with SMTP id l17-20020a5d4111000000b0030fbabb4e02mr339596wrp.10.1686428484369;
        Sat, 10 Jun 2023 13:21:24 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id m11-20020a5d6a0b000000b0030b5d203e7esm7878116wru.97.2023.06.10.13.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Jun 2023 13:21:24 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maxim Kiselev <bigunclemax@gmail.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Marcus Folkesson <marcus.folkesson@gmail.com>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	Caleb Connolly <caleb.connolly@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 3/3] riscv: dts: allwinner: d1: Add GPADC node
Date: Sat, 10 Jun 2023 23:19:50 +0300
Message-Id: <20230610202005.1118049-4-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230610202005.1118049-1-bigunclemax@gmail.com>
References: <20230610202005.1118049-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230610_132126_903515_02A2F41E 
X-CRM114-Status: GOOD (  10.03  )
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

From: Maxim Kiselev <bigunclemax@gmail.com>

This patch adds declaration of the general purpose ADC for D1
and T113s SoCs.

Signed-off-by: Maxim Kiselev <bigunclemax@gmail.com>
---
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
index 922e8e0e2c09..90c79041cfba 100644
--- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
+++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
@@ -138,6 +138,16 @@ ccu: clock-controller@2001000 {
 			#reset-cells = <1>;
 		};
 
+		gpadc: adc@2009000 {
+			compatible = "allwinner,sun20i-d1-gpadc";
+			reg = <0x2009000 0x1000>;
+			clocks = <&ccu CLK_BUS_GPADC>;
+			resets = <&ccu RST_BUS_GPADC>;
+			interrupts = <SOC_PERIPHERAL_IRQ(57) IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+			#io-channel-cells = <1>;
+		};
+
 		dmic: dmic@2031000 {
 			compatible = "allwinner,sun20i-d1-dmic",
 				     "allwinner,sun50i-h6-dmic";
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
