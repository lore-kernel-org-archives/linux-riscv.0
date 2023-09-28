Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41306E732E7
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 16:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yZqjeaNz/OlFqlImDcmUNBO8sn7j2EtUiD+zZ0ibdI0=; b=LhakXLREHzr/qq
	oAKCzDWT0DaZ0wi2rGMHsLGTpX22Ex/LB63emJr7CWQmPVqr7rLd80J/iNc/Ny3/IXDorTKggT/IJ
	tXRP+Yu/URMpjVqHA0JPI4ylP7ibVzEJCJ04KDZFcRT0RxVzmCFREquTEmbC4VVVdlUjjvROFZfTc
	EjKnv5XCQQ9sGqRn2zhrCcpxUX52Mm6f3Cpod8mcZ0OMfZeadOck9Qx8R8+9AM1/N2Fp9JPa/F0hG
	gu5aDL4IerOnb/GhUWwESdDJ/kI5bc593QlgOYbwkp/s7/qUwk4A7ajL6fjXMr4Se6RobyW/YFvso
	Xs+reowiSS87JULxf3Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltVU-005mcI-0m;
	Thu, 28 Sep 2023 16:04:52 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qltVR-005mYc-1F
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 16:04:51 +0000
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-7740cf93901so753696885a.2
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 09:04:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1695917085; x=1696521885; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K+ucouahBzodNfkwXkONEMjzJwRkueDSEs192aSCAA0=;
        b=FDG6Z7ao9qmdv5ouQmZQmlrjWXL4ab9dBq21dRWf9DxgjsaWg++jcExVfPIwFWix3W
         7aq0ySsDkH4r+66IxHAdk3ofRoME8e4v0rcGn/EdzhNhXjkFVj8fakbxUjDmFYllBXFA
         ud54QWyz6EmAsgfxnOYXGhAd5YNd/w99Tm4K3OTo6V/YjN28PqmNE9DNjirPaP2RCyvD
         +qB8zpI69Je7m9RtoF+eV65SMI+4ZKtMbP3j2Uv6z//zFs980Yx2Ci2A6GpmpOXn2Ghb
         RNoJVdK2WpVjhKBnrUi8ezkPQX98x9eTMptHAtjjtsRfBNYKlc1twC2QJh1qa038bmsc
         RQ3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695917085; x=1696521885;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K+ucouahBzodNfkwXkONEMjzJwRkueDSEs192aSCAA0=;
        b=MLuh8tNAGcxSMZp9UuPBV4k02qFbd3q1RoJAnGE7QxvZVmHf5tOLpXz7RjCYykvCMU
         D8O3/hBeuGFX0GaoO1ni9IX+Rt7eRX96beR4BiO/+Amhrj0wdQYcR82V/IDCDCLw1UbI
         cr4FEcXduUVgpGUTupgbI7OjNz/j96ECtEtJh/gHxRIJfFVVnGJ+hZ4vrqtBTi9siivp
         F10s3zi4nu7DU0SAcvHgsuMGUndkTaOqwM+QNmrgVuD5jWD7GqE/v7+WIK6f4ikI9iwA
         hgQeioi31plVYXZt649fSgwC+Gb5IBwJON+wFvQbP5bG187u4TSK8h/Jd0Vtyh18T9rr
         6ulw==
X-Gm-Message-State: AOJu0Yy3oBvEGOrbEq2JeFC3DzbmJ3PTT/ojyG1nnMvC3LIlkQr0y8s1
	9H1nScM5e6GFh9s9fpdca64ATQ==
X-Google-Smtp-Source: AGHT+IEVCX3Vi5r38laj9t0c+Q54sVhbFMpaufWR20pLsTUTRIUbpfy+kw5RKJUjBlcqi3oaDBXsRg==
X-Received: by 2002:a05:620a:4251:b0:76c:a695:fe5b with SMTP id w17-20020a05620a425100b0076ca695fe5bmr1902767qko.62.1695917085636;
        Thu, 28 Sep 2023 09:04:45 -0700 (PDT)
Received: from ?IPV6:2600:1700:2000:b002:5086:8bae:a4b0:bdad? ([2600:1700:2000:b002:5086:8bae:a4b0:bdad])
        by smtp.gmail.com with ESMTPSA id o17-20020ae9f511000000b007659935ce64sm81657qkg.71.2023.09.28.09.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Sep 2023 09:04:45 -0700 (PDT)
Message-ID: <4e4bf02b-2264-491e-9b71-ae3b5ad7fc39@sifive.com>
Date: Thu, 28 Sep 2023 11:04:43 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clocksource/drivers/riscv: Increase the clock_event
 rating
Content-Language: en-US
To: Prabhakar <prabhakar.csengg@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>, Anup Patel <anup@brainfault.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Conor Dooley <conor.dooley@microchip.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230928104520.24768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20230928104520.24768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_090449_464772_A568C10C 
X-CRM114-Status: GOOD (  19.50  )
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

On 2023-09-28 5:45 AM, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Renesas RZ/Five SoC has OSTM blocks which can be used for clock_event and
> clocksource [0]. The clock_event rating for the OSTM is set 300 but
> whereas the rating for riscv-timer clock_event is set to 100 due to which
> the kernel is choosing OSTM for clock_event.
> 
> As riscv-timer is much more efficient than MMIO clock_event, increase the
> rating to 400 so that the kernel prefers riscv-timer over the MMIO based
> clock_event.

This is only true if you have the Sstc extension and can set stimecmp directly.
Otherwise you have the overhead of an SBI call, which is going to be much higher
than an MMIO write. So the rating should depend on Sstc, as in this patch:

https://lore.kernel.org/linux-riscv/20230710131902.1459180-3-apatel@ventanamicro.com/

Regards,
Samuel

> 
> [0] drivers/clocksource/renesas-ostm.c
> 
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> Note, Ive set the rating similar to RISC-V clocksource, on ARM architecture
> the rating for clk_event is set to 450.
> ---
>  drivers/clocksource/timer-riscv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
> index da3071b387eb..e4fc5da119a2 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -54,7 +54,7 @@ static unsigned int riscv_clock_event_irq;
>  static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
>  	.name			= "riscv_timer_clockevent",
>  	.features		= CLOCK_EVT_FEAT_ONESHOT,
> -	.rating			= 100,
> +	.rating			= 400,
>  	.set_next_event		= riscv_clock_next_event,
>  };
>  


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
