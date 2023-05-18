Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9627EC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 21:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0c+NhiJW1z7SSCSbOvzOQPgXCZQI18RvcXI68T4nMLo=; b=jyKcQRYKvuAQKH
	dBrQ5ZIv7511HWTJOdfi0GmVBAiHyZkxJNMZbN45EIq8p3BJg34M/ke6eo43JAjlIxYzjlI49NDb0
	nZT+jFJbr9qwoLGAVM5yeHPk8Y4fMyckJSKrZLKVBTnLVIzqQnhtFmWvY8cPry4cQLfV+Y+PgDoKF
	7VwuRxegCJZiB+NDemKDXKOPbXzkcfZgCrjLmyGn6y6UVTJeyADDxkyZ4SuQGoBzewNVa/15XuZsn
	+FcgBA/et2BRjkVyXpTUsZcqUTifHuVQejP+ZFtkjGlf5Mf4hXMwv7esWlc4/N7Yw7GPE7YOFMC58
	hXRmOyMQZKEW99g1AXqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkvd-00EDMa-1f;
	Thu, 18 May 2023 21:12:53 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzkva-00EDK0-2m;
	Thu, 18 May 2023 21:12:51 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-510dabb3989so3454842a12.0;
        Thu, 18 May 2023 14:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684444364; x=1687036364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fwCXb3fk3q19qGCTHKa24w6U9eKfPUvrvysf9WTJ4BU=;
        b=iwkF6VPKMkga/+WEV8fG/yVkrzrrI+VNiyuUAHg1JGOWKez9AL4FsMdsQv8W+qefES
         Q3Lc7NLEEb9zpijcwsgsRo/F5rEqvbxjBfpNE9/8v5Ub8+bPQsMl5YfdndaAB69MdPsN
         nbiJ/OCwM4A71ViOzrySkJd0xMMzrQKX8Bugq663eNqGxSObuX+0qm2AhUSbBBilXQ9W
         /dKc4iRsjZW8830rZQiK2uRqXc7035OoPNWDu1K5pLpausyharqRV3F928xQuLqeY/6i
         vXWZtQb5oASWlZX35my5AMele3zyXIenZOCCAnF2s7pfT6OLs4u0k3eqOD3Pv9uWnKjY
         t9eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684444364; x=1687036364;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fwCXb3fk3q19qGCTHKa24w6U9eKfPUvrvysf9WTJ4BU=;
        b=GCKG3QO1OvQ1b/hdxmHwSHcPPCZd4Q5Gr4jnHDiIGEE36qh4LadkzlwXteZs+agAUB
         ZWm5WKItB/Lz3QmGzTSmp3Wylusw28q/FN9GGkbqzqueFrHvBjLzWcD9VlRaJv5hyUca
         Lq3hBmANuAv1C92AivAHx2WMUHg912yxc4PlU4zkaBqJ3Y/h6abWdosDF5KWdavueINM
         IUz33YeSqVgDRFvt2H3gBbb1OLZvQj4Sm7r+T6VonGlXIeTRA0Mx09h6ft90WPwzDDTR
         bbQOsSFYkJtDinN0GZe6JBnM3qBfN4BugWE+e3vU7I/2AFAp45aNBncFh2uOZODTlyJ0
         3mnQ==
X-Gm-Message-State: AC+VfDzmZK+6erEB5oirKYk88a2n/dfWPuS9GvfUEQsrxguing7qqljb
	mqtOyhu8U1X+sLHLQMvM3aY=
X-Google-Smtp-Source: ACHHUZ53JeCer2PKB+m25oEFcv9u0KNWbXEekVWG+UOqzYDpisBpzOo5K/OJG+slZjH748oVe/36bg==
X-Received: by 2002:a05:6402:396:b0:50c:cde7:285b with SMTP id o22-20020a056402039600b0050ccde7285bmr6192872edv.29.1684444364501;
        Thu, 18 May 2023 14:12:44 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id dy1-20020a05640231e100b0050bc4600d38sm962189edb.79.2023.05.18.14.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 14:12:44 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>,
 Maksim Kiselev <bigunclemax@gmail.com>
Cc: Icenowy Zheng <icenowy@aosc.io>, Maksim Kiselev <bigunclemax@gmail.com>,
 Conor Dooley <conor.dooley@microchip.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
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
Subject:  Re: [PATCH v5 5/5] riscv: dts: allwinner: d1: Add SPI controllers node
Date: Thu, 18 May 2023 23:12:42 +0200
Message-ID: <13265211.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <20230510081121.3463710-6-bigunclemax@gmail.com>
References:  <20230510081121.3463710-1-bigunclemax@gmail.com>
 <20230510081121.3463710-6-bigunclemax@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_141250_894443_853E4408 
X-CRM114-Status: UNSURE (   9.85  )
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

Dne sreda, 10. maj 2023 ob 10:11:12 CEST je Maksim Kiselev napisal(a):
> Some boards form the MangoPi family (MQ\MQ-Dual\MQ-R) may have
> an optional SPI flash that connects to the SPI0 controller.
> 
> This controller is the same for R329/D1/R528/T113s SoCs and
> should be supported by the sun50i-r329-spi driver.
> 
> So let's add its DT nodes.
> 
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Applied, thanks!

Best regards,
Jernej



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
