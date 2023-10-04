Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF27CE7B5E1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 09:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHr193W/EpEGaza7x76BB5XoXE26AlP2RbI355nPkXQ=; b=P6MNVr9P4TleQ2
	RoME83hnIooKdoMx7Rwl3obY5/xlKPsYozUKPaTrMWYM1pC65Ry2zl2fhHlkf0e9Klqc4Cp8+exH8
	1kRaY2eGo72XCLFw6xLB3+X+5CD5REAP6n1dsJ0vr/AiXkqe4GEvNzViMYp2KFx/DkiT4UKea3UlL
	VU0VaOHs3dI+KcphKiPsjQeOl7G++cHYp8E6V7C6lCv2vOQ8RHRY7ugBm36K1oCyH2BdPQZBKhOxK
	qKv6XOT9Lzdom3XB7v5jdW/hE82N59wgLhQY/k77+4JHJc6JWmmsvr6IbZPP24QApwDvImsiWZh9h
	I27iwvpxtbhDW1N8iTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnyRi-00H7Xb-1K;
	Wed, 04 Oct 2023 09:45:34 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxOp-00GsRT-0w
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 08:38:33 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-9b275afb6abso144126466b.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 01:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696408705; x=1697013505; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ppi0kBeOOweWlIZvfD7YuBHhh55A/ApHochAVYW2CEw=;
        b=TbL2eGuHatwogKyo2xm+UhpvgrNyy0UxtQ1RVRGgG3OUeBVGfPA+6LCprFmNAoFMhC
         HMZ2oZeJ/7iU7QRC5KOjg/uX1cCWtFHucKzOOby2ne8Fp4sWRJE5h7ibOsjd9iV5zZNn
         Ho0k0jF/XoVOJdwUDS73I+W6vt5eMfBbXAJCwWiE96EL9SdUe1HQk7O4kPbHm34xh+9m
         BpgzHu22JDJUpI3VpdSG408VY6B3AW2s9d5TJPiLZTDmKbi5SZb9EW0+Hw/TRZ5VaBhF
         hWatNSticqZl8kekpV7MEqtkpEZtYcW1+IcINSaltYjv30hkYtEVIleJYz76bz7vGTdY
         +bgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696408705; x=1697013505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ppi0kBeOOweWlIZvfD7YuBHhh55A/ApHochAVYW2CEw=;
        b=ASYKmtB1cwrcjFp6MUWMAxopPMhGTbFdpcVmBwZClXdPDhOs0t8V+Q1niQ1KgCixpS
         OVVvH6nWg3yDqZ/KqWV4P0Q3Hv6knz0zA3QqyjCt7U+ZOcqjoxE6YyjaR5LmWpYBwqBn
         ADS4uI87z0pECMgp42Mf0MtDJ0Q7IglalntZdABDMubDI1syp/Pdufy6HKhIqnsYqCaB
         8UcCxQ8tplyl2V6PDo+kLy3f0i8S8hAMvjnLQ383+fJ5eH4zTIH3+H2uossU+dDmfM2W
         Lhsvu4AHwVrfTS5eVAFRTUN6qcqGMH9HJf6Q7NM5w+FQkO26zOkub3EhB9Af9KjOpHz/
         9NyQ==
X-Gm-Message-State: AOJu0YxHVSVgDmMZhDxLyxv3TWFXokqiH8cdjxExmGH9kJr+tChvTGmb
	gWsRCx6HEimfMmE9wi5h6E0C3w==
X-Google-Smtp-Source: AGHT+IEA0c4Rpr5fzXgEfRIFNS4InULkII64T3I3f9QRr7CnzN0XoS/8hb8DDlG5hrg2dBx+Uq8JWg==
X-Received: by 2002:a17:906:dac1:b0:9ae:705a:8451 with SMTP id xi1-20020a170906dac100b009ae705a8451mr4692777ejb.25.1696408704565;
        Wed, 04 Oct 2023 01:38:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f21-20020a170906561500b009ad87fd4e65sm2369666ejq.108.2023.10.04.01.38.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 01:38:24 -0700 (PDT)
Date: Wed, 4 Oct 2023 10:38:22 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Conor Dooley <conor.dooley@microchip.com>, Anup Patel <apatel@ventanamicro.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Atish Kumar Patra <atishp@rivosinc.com>
Subject: Re: [PATCH v2 -next 4/4] clocksource/timer-riscv: ACPI: Add
 timer_cannot_wakeup_cpu
Message-ID: <20231004-4fb4dad9268b0c933550a21e@orel>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
 <20230927170015.295232-5-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230927170015.295232-5-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_013831_326667_E1D42488 
X-CRM114-Status: GOOD (  15.74  )
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

On Wed, Sep 27, 2023 at 10:30:15PM +0530, Sunil V L wrote:
> The timer capability to wakeup the cpu irrespective of its idle state is
> provided by the flag in RHCT. Update the timer code to set this flag.
> 
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  drivers/clocksource/timer-riscv.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index 9c8f3e2decc2..06f5bad3c3e0 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -225,6 +225,10 @@ TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
>  #ifdef CONFIG_ACPI
>  static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
>  {
> +	struct acpi_table_rhct *rhct = (struct acpi_table_rhct *)table;
> +
> +	riscv_timer_cannot_wake_cpu = rhct->flags & ACPI_RHCT_TIMER_CANNOT_WAKEUP_CPU;
> +
>  	return riscv_timer_init_common();
>  }
>  
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
