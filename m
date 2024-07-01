Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4C87C30653
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 13:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4ulpU2JUkBsGQ3iM47Z1xz+iOAtQhbvEgs+99QLGzJ4=; b=JQEXc0qJglTuTU
	W2N0HCUFiUa+7f8fhWHv5TVFYPnRzhABTz6UWlPsGhQLtXWhhj0OnfcdolYVF8Fjlqf9uUhoeV0U/
	gQq2e7TrjvoeiTSN/KGLhVojg20lEff18b9mTyQYFn93O8+w+ADClkDcHMMtRm31ZyC1Nv7Ra1+Q2
	jrVJESiisTxKPT5xQtd4IKkwALmudRdgfxaNacTAM+UHRJWYcMnEHg1fXGvzqAlNSqmPk8MvVT+Y6
	aiTOmMPDrxNO98P5S/lr0xAmDZKbhUbYsqZrpMC/MJ7mhvM6sCN7RqSC1YU19RgqniyUnyJmRt+Xg
	KA4kqSiGY8owMWNvtD5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGuX-00000003QP9-2eqF;
	Mon, 01 Jul 2024 13:17:37 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGuU-00000003QOk-01OS
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 13:17:35 +0000
Received: by mail-io1-xd2d.google.com with SMTP id ca18e2360f4ac-7e21dfbc310so109564939f.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Jul 2024 06:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1719839852; x=1720444652; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Tv7hLmqJSP26fMN3IiNsBgVJSAix2nuXmhfSvybhYBQ=;
        b=Tjh7zw8ehtZg4qNS1vBA+4dfFIK2EfdN1pmq/J5FD2AZXEmDzd3ckAJLU8hRfN0IY2
         W8J5F8mFvTX7QKA1ox0Smdg8EMNtrfw1oOqwAB99C1kf9GoKMG2RyGMRg1F3bbGsd4Kv
         GQGMJuB9xgwQJsQHrmX+lRMISz7zBunOUa1T+FvURB6Wubtd3rQ7LZt2K8Dimu4b/XNw
         kD6AoIt76f3pj+olP8lQvaqPfe4K10KntSWyi5LGhfG0wBT+jretlWf82nz55zEaJR2B
         Y5BrWi3r61C8u5GF1OXuAcx+b4UTTlAdkk8gfBzfmR3Rt4MO1t7NGsjf4frHmwrl+3/1
         AojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719839852; x=1720444652;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Tv7hLmqJSP26fMN3IiNsBgVJSAix2nuXmhfSvybhYBQ=;
        b=ESaadJmHtcxceFEnYY/kt7qqc3w0MCa6aCkLf/wxskUWbtUvkbJIcMTysOLdeWgBP/
         YuPJxPtov1xuOGsRpWsd2nIfYGDTUDcDwx/uPV+clbNLytTCqJFR0L2DJupkdhTPY4DA
         qHRbT5OZqjktWYhX4WDDWcbBaSMa3XhJ6S7c6ckgy0n4SBP7vbZW040iujBhwNzOrtj3
         RX8tlVhwk9q8kdGT+Fz5TFL2KkUpgp6lgUWAZdRr37cs7AvkMuFvthV3f+4L5EJTaEIq
         rsl5BAnk5hMYUgdpsb8BKXwoCFryirJ8NxpBpp7FeB+jD9K1P+qWRRrFqGBe1BYQpbZT
         0JMw==
X-Forwarded-Encrypted: i=1; AJvYcCX5t9OdTh6/WAsOBwMezUjQ+MGBZKA1UFDE0QLSam31K17FNdV5Sb8RnV2Ek+Y+RSmIXjRWRKO/MgYkiba8HJewrdH32b100jIsEaW1R8ef
X-Gm-Message-State: AOJu0Yyjb7ewHpozwPsc76y8dOBuwOl95GxxWV35+FeW0eKaYA3mUflX
	sgit+Aamf7qJPHbTSSZ7BL5NQOzt1ua/ND4Xjuup5vuQthKGBZIy9m6JAMX0k3k=
X-Google-Smtp-Source: AGHT+IEZw7OPZRtqEEfxj8LpOcD4ss2+Aeo4eVMjfKvEB8LYKyAWd6+8RBlnjTcAOf4l/FP8eMO8Kg==
X-Received: by 2002:a05:6602:584:b0:7eb:776f:d970 with SMTP id ca18e2360f4ac-7f62ee74896mr592724639f.14.1719839852334;
        Mon, 01 Jul 2024 06:17:32 -0700 (PDT)
Received: from [100.64.0.1] ([147.124.94.167])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4bb73e08bc2sm2165340173.83.2024.07.01.06.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jul 2024 06:17:32 -0700 (PDT)
Message-ID: <f8604c68-8866-447b-a874-562bdad1df79@sifive.com>
Date: Mon, 1 Jul 2024 08:17:29 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] spi: dw-mmio: update dw_spi_mmio_of_match struct
 with thead
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-4-kanakshilledar@gmail.com>
From: Samuel Holland <samuel.holland@sifive.com>
Content-Language: en-US
In-Reply-To: <20240701121355.262259-4-kanakshilledar@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_061734_235502_E79C9E84 
X-CRM114-Status: GOOD (  16.96  )
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

Hi Kanak,

On 2024-07-01 7:13 AM, Kanak Shilledar wrote:
> updated the struct of_device_id dw_spi_mmio_of_match to include
> the updated compatible value for TH1520 SoC ("thead,th1520-spi")
> to initialize with dw_spi_pssi_init().
> 
> Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> ---
> Changes in v2:
> - Separated from a single patch file.
> ---
>  drivers/spi/spi-dw-mmio.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> index 819907e332c4..39e3d46ebf5d 100644
> --- a/drivers/spi/spi-dw-mmio.c
> +++ b/drivers/spi/spi-dw-mmio.c
> @@ -419,6 +419,7 @@ static const struct of_device_id dw_spi_mmio_of_match[] = {
>  	{ .compatible = "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
>  	{ .compatible = "canaan,k210-spi", dw_spi_canaan_k210_init},
>  	{ .compatible = "amd,pensando-elba-spi", .data = dw_spi_elba_init},
> +	{ .compatible = "thead,th1520-spi", .data = dw_spi_pssi_init},

Your binding requires snps,dw-apb-ssi as a fallback compatible string, which is
already supported by this driver and uses the same match data. So you don't need
this patch; its only effect is to make the kernel larger.

Regards,
Samuel

>  	{ /* end of table */}
>  };
>  MODULE_DEVICE_TABLE(of, dw_spi_mmio_of_match);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
