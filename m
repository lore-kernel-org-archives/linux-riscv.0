Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE50EB64DA
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jun 2023 15:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=65+ohQA4XRf2CQcIvcRNfJOMyaiUbp9pbU+tRVUmcXY=; b=y1qrTbzXtPFrPI
	HPHcmvTBmKvebZF646YcxLv+BBtAlCu998RxZ/diZHuSIfTlLuduLiP7DASLkKsnk1YvmXq8jRDgc
	G0bugFz4uFtQ7bOGNIQVPyvskxP/mYvmwJ54sSBXWrCOp2bDwBGyJ34xnM+v3/NBjHNHG3HET9B+E
	42ESzo90DFm+xohm5dn0AZx5hFnuSrh76tn9OC05dQz+OZjaiq00trDCNQbGK3PakRD2ll75BJwGG
	G/hxTC+eLOnSEFIh3l4kWIv7bhsrAf4Ky0zUXypU3/IrR5/A+VMgjR7938khhOr6qQZHzHxDaZhHZ
	I7LiDUHiHz5/o/HSWakw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH2X-008o9L-1p;
	Mon, 19 Jun 2023 15:43:37 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBH2V-008o7d-0N;
	Mon, 19 Jun 2023 15:43:36 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f871c93a5fso1460531e87.2;
        Mon, 19 Jun 2023 08:43:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687189413; x=1689781413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=By9LviJpFD6M31Xuvf8iRdC/f7qq5558NMtCfn3H0qE=;
        b=IsdcirYiybQ9DgqSQax5rr1IUuYvwIv8sXacQA3PptD5vmSsVvVnua0Yyw0/pIB3E1
         /+5dbWfz5ouAnktDaYJhrRkNVW6mWTnZ7rw8UomJq8jQwTJUjodwJ3XOvnbyQAkM1Hwv
         w6H1RvNeuFcs5lsSFjnaTXW1BVUcG5+BaDtiw2r4UBqeGQtKbevlf9sPYWMGcYmx88mg
         Zfw80n71GUExELHO8yISSdiI61YS+seyOJgr0EgA3yXTwqsjADWuyw0VI3an+rmKSbAE
         aIqCU925PykndGkDQm1Ojm0o/6vQmeXBlc/jSmpYVEUmL6LiC3po0OP19K6Npx/UM9RS
         o0rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687189413; x=1689781413;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=By9LviJpFD6M31Xuvf8iRdC/f7qq5558NMtCfn3H0qE=;
        b=Z5GdFdVm4MHLE6XhQmZ4WjviRh/wACOYQIQgU7d6BxSIYG7ToBFiEHZ7b3YaqerxKE
         VGtU7XGLpEVv97XPp0MWSLndf2jAj3oZ15mYvgkhSF1pvgJAl+DSPDiGXIYBPmqDjv8d
         L879eOY7+ZUXIkeDXuPH8AgrUjx5EZT++v9/C3ic83J09c6+tzmM01N9F4pPdCZt0Hy3
         SHBKik5lXArPtwkQ/RQIchDBHUL6mHZfGq6ZEKH3ob1NKV76Mh49qD/5kZsNIoTMppBE
         iMqDFRNZYg51thpF8/azt2CA46KY4H9LjJXduBJ9oV7K/dbDXV/mupwQXsEjwY3E0RPr
         AUQA==
X-Gm-Message-State: AC+VfDyf1Cu3UMKYm1R9RiGW+WX0x6izcxxvMr7wFwXTuqU6YPrapGjD
	HgVJEubqvmcqqaQJI7qAX6s=
X-Google-Smtp-Source: ACHHUZ7SZr0BfAlnP0I+J+Ztm3YUYwpYJ5m1CVqsbJXoe5r6Dql+Pd7bzmdwb6JD3xJgMILfAb2W3w==
X-Received: by 2002:a19:f201:0:b0:4f4:dd51:aec7 with SMTP id q1-20020a19f201000000b004f4dd51aec7mr4719115lfh.54.1687189412587;
        Mon, 19 Jun 2023 08:43:32 -0700 (PDT)
Received: from user-PC.. ([178.134.198.138])
        by smtp.gmail.com with ESMTPSA id f11-20020a19ae0b000000b004f85e53250bsm1207144lfc.191.2023.06.19.08.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:43:32 -0700 (PDT)
From: Maksim Kiselev <bigunclemax@gmail.com>
To: linux-iio@vger.kernel.org
Cc: Maksim Kiselev <bigunclemax@gmail.com>,
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
	Andre Przywara <andre.przywara@arm.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Leonard=20G=C3=B6hrs?= <l.goehrs@pengutronix.de>,
	ChiYuan Huang <cy_huang@richtek.com>,
	Ramona Bolboaca <ramona.bolboaca@analog.com>,
	Ibrahim Tilki <Ibrahim.Tilki@analog.com>,
	ChiaEn Wu <chiaen_wu@richtek.com>,
	William Breathitt Gray <william.gray@linaro.org>,
	Haibo Chen <haibo.chen@nxp.com>,
	Mike Looijmans <mike.looijmans@topic.nl>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Maxime Ripard <mripard@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v8 1/4] iio: adc: Kconfig change description for Allwinner GPADC
Date: Mon, 19 Jun 2023 18:42:24 +0300
Message-Id: <20230619154252.3951913-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619154252.3951913-1-bigunclemax@gmail.com>
References: <20230619154252.3951913-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_084335_164915_273D9340 
X-CRM114-Status: GOOD (  12.22  )
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

This patch adds SoCs names to Allwinner GPADC description to
make it more informative.

Fixes: d1caa9905538 ("iio: adc: add support for Allwinner SoCs ADC")
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index eb2b09ef5d5b..d93868684c7b 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1105,7 +1105,7 @@ config STMPE_ADC
 	  built-in ADC block (stmpe811).
 
 config SUN4I_GPADC
-	tristate "Support for the Allwinner SoCs GPADC"
+	tristate "Allwinner A10/A13/A31 and similar GPADCs driver"
 	depends on IIO
 	depends on MFD_SUN4I_GPADC || MACH_SUN8I
 	depends on THERMAL || !THERMAL_OF
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
