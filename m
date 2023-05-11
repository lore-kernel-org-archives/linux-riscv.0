Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85461C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 11 May 2023 16:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEA8f/kIROOgEKg70Tsd4ZdEtVaH4l1aKYVHGg7OeCg=; b=tMZ/9p5m11dFLl
	9wzB6y2loBaVtHwo0QxWKRhr+RKlZBK0N46C+nt7E9wA6Vm6Ytl+OGotPF9N4LLd2XEETwMbuLTzT
	M+Ug+Ci+aQyeBaH1B0X9LUGsG5TRega8N6qVOJMzw+K/30smRAVo2QmEQhVNH+IVCg5X4kIFnXxIK
	Yy02fZ+5K3pOHhkCJi7/hH1w2DLgU05Czy8whHh7hZ+oaz0HeupSb5PDcrqTzhsCufxpQe2hKfXTP
	2yj6/PuMEP9ELI0GJunWC1jRROHcj+UIpuPP1VEToPR+0vbX5O6WKRLbeMQfCHinTs3Ja4tucyxQV
	Z86fR8ZIVQSQgDBAPqCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px9Kl-009ODg-1W;
	Thu, 11 May 2023 16:40:03 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px9Ki-009OBS-0R;
	Thu, 11 May 2023 16:40:01 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50be17a1eceso16673970a12.2;
        Thu, 11 May 2023 09:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683823196; x=1686415196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpg8XDB92ynuRzY1i3UBYEufHNkhwJLAak/2Lx31N6M=;
        b=ibTgPIrHlC7KM/tGyqwtf1UyJoDnPrrLqtP2Zqej1oTbR/ruuQMX9ZXvgnS39ULJvo
         DERGtBVBE4r78wvrzmORpxZDKusSm7SnefyLARh9hy9m3JL7n5Yu7HlfQmQ34BXafg7r
         1/GM07+C5kHldeoOv7dn4eYcXFOHvIFUJfDuGzTvPdmfmLIMUh916Sa1Ffbe8Glz5uTC
         veeqqFL58PtyBrn682RVe0XbnqYAtyRHlIAJyhX/Lwp3/ynI/wiZolwdiO+KfG5L/QIl
         24BSF3UgtwsHic13L1N4Qvk31GZG9r9hpBup0hFkQFGdYLqJuhnrTbkXNvTIGn9i5+ga
         eFTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683823196; x=1686415196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mpg8XDB92ynuRzY1i3UBYEufHNkhwJLAak/2Lx31N6M=;
        b=YGw31I3hRmzf9JouthtatgybJMfYgSQymYO5xQ1ws36YT8nj1zOUBq5tLgOB3bpyOq
         zldqe71JQLOSD9On+QHq//alTB0yokqmK0dSXXeS8VU+UIR+TUfXVbZLyr4OfSVNBlsz
         NqFUUmk88zFYYiLiKri38C4D6bIjM8EMYN0GcLeXykHe7/mDDsHvGu5LQX9nJmgTXLDB
         zJBMayJIH1OK2Z+wa1NChK/inE7AClJpjg/cUDpfn3AS7hQq1VM8qie9GXf5nkgl+1Yw
         cXDc6FG/k4T3kvRM3WqujpGI0UpBmbQdpu//BTl8mFjDWbEvsccKqRpFrsA0SNQ7hbT4
         jpQg==
X-Gm-Message-State: AC+VfDx9+rewqxkd5vB6poYlBpmxKZ2k3djxUFxptcUjtJwjgBra+dBF
	FlW3xeuc5Fq4L5X8aA0bl9k=
X-Google-Smtp-Source: ACHHUZ5M06vBgci6zS42m3wRUWv6RwPtzqUTomGRUWOkHFF5nSTmaSbApuSRzoOCjc6tHcHBsCYfeQ==
X-Received: by 2002:a17:907:843:b0:94f:5847:8ac with SMTP id ww3-20020a170907084300b0094f584708acmr19514441ejb.51.1683823196255;
        Thu, 11 May 2023 09:39:56 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id r12-20020a1709062ccc00b0094e954fd015sm4260699ejr.175.2023.05.11.09.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 09:39:55 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, linux-spi@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject:  Re: [PATCH v5 1/5] dt-bindings: spi: sun6i: add DT bindings for Allwinner
 R329/D1/R528/T113s SPI
Date: Thu, 11 May 2023 18:39:54 +0200
Message-ID: <3558185.R56niFO833@jernej-laptop>
In-Reply-To: <20230510081121.3463710-2-bigunclemax@gmail.com>
References:  <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-2-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_094000_170722_E8B5C8F9 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

Dne sreda, 10. maj 2023 ob 10:11:08 CEST je Maksim Kiselev napisal(a):
> Listed above Allwinner SoCs has two SPI controllers. First is the regular
> SPI controller and the second one has additional functionality for
> MIPI-DBI Type C.
> 
> Add compatible strings for these controllers
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
