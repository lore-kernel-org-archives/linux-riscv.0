Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00AE6C001B0
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jul 2023 09:18:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jd3D/Yo/nQWqo0OakRRmTDkr0bsAaqvjE+aeGczbIg4=; b=1hZpRrKeIEy4+O
	1i7HHUG9f/DVZF5KhbNY9yKOxD5PRyyc3/AFoNSrzmNyCAuPHwO7JKwTQ5FGmVd9xBLHw62bW6rOR
	Ull605fYa3bq/HZVb+Ziat7Ap9cTdTF2426+PL6pKNt/xHngvmlrwpzrVwkrLtpmfx+Kc2zHiV0mX
	uRtJFqsZCv32ludwJ1wgpjT2Eb/RMDRPYJQDzEudjR5iXP2zf1oJrndVtw98nr5RSHiT4D1napEIe
	OSkIIOLoTi5SkJB1qqVgeYLXF85I3bWG/Rp9XDq2RNFVgg34RVg4p7PzA3RrNB62clqCuLmVltUtj
	y/pDeZfUyncgZuGYDn7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQK-008Gmp-2X;
	Sat, 15 Jul 2023 09:18:44 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKbQD-008Gjs-2V;
	Sat, 15 Jul 2023 09:18:38 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2b6fdaf6eefso41668851fa.0;
        Sat, 15 Jul 2023 02:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689412712; x=1692004712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ml0O9v4adwaXBJEIaQ084479cQpZdd+qXOYWMXt4ElA=;
        b=XXh3zvoVnJjyw+Vw1oB7KtQZbYBRIaUkMaa2x991IFW0s/OZ/kSSYGNrCDOxKTKYSS
         ZL8VA1Eu8gzIpmqN46PkaZpKdMzSsNwWOOYDfbN2WMv5nLEcrIJZPdhk5Apgva7LqSvX
         Mep8qlq7D+CRYNI+eWLfM1wLJIyhu41m9AnwXuNl0sjNWTtoCDbXVO1Eeii8QIXK+4FO
         v+TMjRBVlMlfwrL8USiNrcmwZcVnsFD12XaaKAARJlULo4cqpaYlLtUmKaK2d6Nkekka
         Uc7865qWaLXql6ZXEjTwVN+E0gH+luOuNY6Nur8QLI1EoasrBJax258VzZHzgw+gi8Vw
         N3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689412712; x=1692004712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml0O9v4adwaXBJEIaQ084479cQpZdd+qXOYWMXt4ElA=;
        b=P9LjzFFSZz2Sb73T28Yp80072DGZeqVUm9cBBEZcyXWl/XiqYpGVGO6iVJiC6q+rZN
         mynPZzKmL4v9gPjmjZtcAVKC2O3xZ1YVbHpZulSaJCHF3BWS9pufIrzReZVS77HmbDDA
         +HsfXc7jz5wdxZuAHRQjhSLoStn87zuvDDVWahFSZr6FFZsLvLazuz0NAAxfylOkUTby
         BZm4DlUPjbNRbiFtYxen0CMgzR4MV2UI8/JVFjzL+AwKGM+2hn0fhrM80XSPmN/71sZB
         fwWfVyO2qyta48MxI+R8LdIEs+477w/aPfnv5IU2EWrmJ5//H8ZpceTEmRkgyoJu2cf1
         m7/w==
X-Gm-Message-State: ABy/qLbQY82vnFr71Nl0MnGB5aQmioknCm6h0TtnvRMZWnG75DxjJnxF
	XT5EVABB8xQ1d0dJR/G+kRM=
X-Google-Smtp-Source: APBJJlH2MjuUkNhIv3D5y271CR9dnERIGeG6VJrEdFCX/0Z5fkvnvbXOAyVQ9MxF3mJap1rTA1eULA==
X-Received: by 2002:a2e:9bcb:0:b0:2b6:dec9:2813 with SMTP id w11-20020a2e9bcb000000b002b6dec92813mr5993004ljj.29.1689412712645;
        Sat, 15 Jul 2023 02:18:32 -0700 (PDT)
Received: from user-PC.. ([92.51.95.194])
        by smtp.gmail.com with ESMTPSA id b17-20020a2e9891000000b002b840f283a7sm561784ljj.36.2023.07.15.02.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jul 2023 02:18:32 -0700 (PDT)
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
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v9 1/4] iio: adc: Kconfig change description for Allwinner GPADC
Date: Sat, 15 Jul 2023 12:18:13 +0300
Message-Id: <20230715091816.3074375-2-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715091816.3074375-1-bigunclemax@gmail.com>
References: <20230715091816.3074375-1-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230715_021837_812744_3D3DF628 
X-CRM114-Status: GOOD (  10.93  )
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

Add SoCs names to Allwinner GPADC description to make it more informative.

Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/iio/adc/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/Kconfig b/drivers/iio/adc/Kconfig
index dc14bde31ac1..5f1e9bb59623 100644
--- a/drivers/iio/adc/Kconfig
+++ b/drivers/iio/adc/Kconfig
@@ -1116,7 +1116,7 @@ config STMPE_ADC
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
