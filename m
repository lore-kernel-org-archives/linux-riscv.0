Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7264EC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 10:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RyXTgNzyRS/WTDs0/IG3mvdNnD7xHu5U+kI+x127up8=; b=ZcNVk0ShKxoGMK
	0EzBViiAulxLAAzKQsi6fks5SkXrp/xRDJl5w3H+nbY/CmHm+aWqHHqAUBZ+AFsRFUKcTcJfHD9uW
	qx3bFLjFXd3s9upGMta9kZOFTGMSe8J8/E/xC6E60mWG2nKucr2DoUC23pMg6F0gu5tMc9zC+cIec
	XndCQrGvurRDmkyrT6ed6hZrGhuWjhnlt5jSMCsCzzrfRF0dgpifuucSdP0kauWVHi8OGxRJB/vpK
	W4ndPM9aPBazFGv6PTIzDDwjxx0YX0q8+tIe9sMFMEdiTi33O63ZEbuGrYghd96pYS+s8pQIoqq9z
	RHAxiAkcOgLKWEy8MRtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOct5-00BQ5y-By; Mon, 28 Feb 2022 10:04:15 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOct1-00BQ4R-M8
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 10:04:14 +0000
Received: by mail-wr1-x42b.google.com with SMTP id d3so14550798wrf.1
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 02:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yPvOIdycXQv0CBu7pmocJI7OMI66VIOa7x9qdeQslIs=;
 b=d53iGwE3xhZsK5rLeA1vM2S47Vce3tog6ZsY0kRQlxX6tRHqSOExJk2DZvxFv1ociQ
 21ui5eSo0k3AxTFOeZQ8c6RVK3YQeRrlv8J6iUxcqkMOoSKr2OvyofAaxJnxCK9mxaxc
 M9jKBHTJ6N/6ZAvzVqWgaUrkkujnLNznxJIzJDxCEsQ8Hwd3gdhY59hPP4oycPJyQZX1
 vFxwUWDwlst2nTwldyDYuLICAZll1WX1ce6qJAo61db967AgmAzskPZLcYbMDUaFAdCc
 OWlP3PT95GxVyeSza/8UCHWO++xGejdvdlKx4bYKm3JiIAMCvLx5Hi0HqUmSFS13yDru
 8+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yPvOIdycXQv0CBu7pmocJI7OMI66VIOa7x9qdeQslIs=;
 b=FfnzcP5gtsYm7q27UfcbyGGdzZ3dxh26ZwZNSzsrcPWlqRGJpXhR3xAT1WHEnTw5NR
 DbD0ydshM60bhPC1zkJLhrVOg4YJNLYOo0aSMzrPWvAVkqN/YFj0nQE8bPJ7ZN6MzwG3
 7rQHlgTaPngE+zJVcZwHB0GJgy9stxQ+oKP2R5f0J7PfoSU6szuIQ723KZalKuoAumim
 unmQuBKac+gxTW7yZOx8A/k4QjQJdvuPtouLyZZ4+PliYhdI2LKWrWO6VGNH6J5dh0yp
 5hamHiZgU4OJmYmUL/IkoDb+7Hf2NFjuJpSlyuR7QzAGqOLuFYdHOTuOZD2d9D0V1/zh
 pp0Q==
X-Gm-Message-State: AOAM533IV4c9A55httxj8QMjZpSiRaIriet5tc1hh/oLP327VrS2Kfe2
 7TR4inIazxz+gWXIcH2X2m4ZHIs5+Onv7yJZCt16dg==
X-Google-Smtp-Source: ABdhPJz+dwMIpoPKHtsSvMxSg9mYl/o51zxWOSIpNJCWK9SSTsShpG6/JXrk0EdmFjp7jJ9NsUjiI7CD6D9Hqp3R9Kk=
X-Received: by 2002:a5d:64a8:0:b0:1ef:f99c:8c12 with SMTP id
 m8-20020a5d64a8000000b001eff99c8c12mr174925wrp.214.1646042649763; Mon, 28 Feb
 2022 02:04:09 -0800 (PST)
MIME-Version: 1.0
References: <20220222204811.2281949-1-atishp@rivosinc.com>
 <20220222204811.2281949-4-atishp@rivosinc.com>
In-Reply-To: <20220222204811.2281949-4-atishp@rivosinc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Feb 2022 15:33:51 +0530
Message-ID: <CAAhSdy2STy3vniy_VjGOgaMLUj1En2rfCfENXUdRDZrBzmtgqg@mail.gmail.com>
Subject: Re: [PATCH v5 3/6] RISC-V: Extract multi-letter extension names from
 "riscv, isa"
To: Atish Patra <atishp@rivosinc.com>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Tsukasa OI <research_trasio@irq.a4lg.com>, 
 Heiko Stuebner <heiko@sntech.de>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atishp@atishpatra.org>, Damien Le Moal <damien.lemoal@wdc.com>, 
 DTML <devicetree@vger.kernel.org>, Jisheng Zhang <jszhang@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_020411_755966_2D269E9A 
X-CRM114-Status: GOOD (  19.57  )
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

On Wed, Feb 23, 2022 at 2:18 AM Atish Patra <atishp@rivosinc.com> wrote:
>
> From: Tsukasa OI <research_trasio@irq.a4lg.com>
>
> Currently, there is no usage for version numbers in extensions as
> any ratified non base ISA extension will always at v1.0.
>
> Extract the extension names in place for future parsing.
>
> Tested-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Anup Patel <anup@brainfault.org>
> Signed-off-by: Tsukasa OI <research_trasio@irq.a4lg.com>
> [Improved commit text and comments]
> Signed-off-by: Atish Patra <atishp@rivosinc.com>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

> ---
>  arch/riscv/kernel/cpufeature.c | 35 ++++++++++++++++++++++++++--------
>  1 file changed, 27 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 72c5f6ef56b5..b0df7eff47f7 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -124,8 +124,28 @@ void __init riscv_fill_hwcap(void)
>                                 ext_long = true;
>                                 /* Multi-letter extension must be delimited */
>                                 for (; *isa && *isa != '_'; ++isa)
> -                                       if (!islower(*isa) && !isdigit(*isa))
> +                                       if (unlikely(!islower(*isa)
> +                                                    && !isdigit(*isa)))
>                                                 ext_err = true;
> +                               /* Parse backwards */
> +                               ext_end = isa;
> +                               if (unlikely(ext_err))
> +                                       break;
> +                               if (!isdigit(ext_end[-1]))
> +                                       break;
> +                               /* Skip the minor version */
> +                               while (isdigit(*--ext_end))
> +                                       ;
> +                               if (ext_end[0] != 'p'
> +                                   || !isdigit(ext_end[-1])) {
> +                                       /* Advance it to offset the pre-decrement */
> +                                       ++ext_end;
> +                                       break;
> +                               }
> +                               /* Skip the major version */
> +                               while (isdigit(*--ext_end))
> +                                       ;
> +                               ++ext_end;
>                                 break;
>                         default:
>                                 if (unlikely(!islower(*ext))) {
> @@ -151,14 +171,13 @@ void __init riscv_fill_hwcap(void)
>                         }
>                         if (*isa != '_')
>                                 --isa;
> -                       /*
> -                        * TODO: Full version-aware handling including
> -                        * multi-letter extensions will be added in-future.
> -                        */
> -                       if (ext_err || ext_long)
> +
> +                       if (unlikely(ext_err))
>                                 continue;
> -                       this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> -                       this_isa |= (1UL << (*ext - 'a'));
> +                       if (!ext_long) {
> +                               this_hwcap |= isa2hwcap[(unsigned char)(*ext)];
> +                               this_isa |= (1UL << (*ext - 'a'));
> +                       }
>                 }
>
>                 /*
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
