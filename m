Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB34C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 09:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Aa0UL1hJ6IQHeecPtmvHbVUUad5NT0s6MHNUdwyIeGM=; b=wkwBSQiSW9Z3+fLZcVezotnzqG
	p7RUyJ36H1XQH4uHzd3udq2923IN3LQB1MT+0lftPUkNnOPWpy8F/l9SsTimzmDN2J4BwlnypnLx1
	PLPxukGgw4GMY+Wg6moIkyU6Pagvs1u3CKpyridiA68vP+lgTXopoIwx0OpmJ9Qj490BRTRkGu/Dc
	shGp6ceCA6PMy5VEvMkvXt9Bh8ZO9FzLItaNbMrmgcUfIqc8mS0gboZ1HrxyuyLqZpzxahkmOPyOs
	6kUMfjMwrz8jZh7LnFYIl06BxIFEF1TjNXZxOsdDcnHeNI2RDVSp7DVkWTrccKbA/s0hCFe1KmBS8
	EIt2Q1HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKCd-0000000BxHM-3yJ2;
	Wed, 12 Jun 2024 09:23:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKCb-0000000BxFd-0tHa
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 09:23:35 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id F214741334
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 09:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718184208;
	bh=JIxr/ZZpdBfgox5qV/eIJHMIZ1MJnFcIJgd5fVOn7fw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=v6yfOjTOz4fRmXsZt8G4wNxPSN65zpYtU8RLoq6obIPtr9nKAXGkjDA5HCDjg0adF
	 jcS3myoZ+fbfj+XPDheDlprt+kM0Jv9qPm0E3BJRhqzLjD99XQmkkjnwgY1jY2n/DP
	 E9ROanTZMVS9edHxZDbLhVuypdskl7giPzP6yTAVOa5z/Kg6WvKkIOt79O2et9TVcC
	 PKkiMvAebyaf/Dcw0hbBQysInjDPL6PAHcmM7tpW+awQDpTXyACzJVpuzqrnmf86q6
	 HtG9tOw6rQmkJ1gexfWfK9DwJztLVSYLQftc5S02P0dYxhZr0nSBwtO5t9dlv/KTkG
	 UEHPWrjObmsEg==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4409aa71ceaso18533021cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 02:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184206; x=1718789006;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JIxr/ZZpdBfgox5qV/eIJHMIZ1MJnFcIJgd5fVOn7fw=;
        b=kNCESTHv+tfUDY5qHZVilTbWV3OqAt1mF0ISXVemtWZjyultUuuwEFyb8JjkBu+djW
         I7ycRaK24V6B2oLhocsKKyY/d49yrqnY1wwhK+ExPOJ59NbiOd0RheDoRv6ZwRIDA77R
         sKJRMf5jDza6jDWD/QN0G1y2cYEYCbwoPew5efzm+6K5u+pijNTcwC7Pc73FMU+AcWGR
         zOp5A1cijelWfhR2L8eapP56cjA0LkolJ06SoKTK0dXfKd8VBwN5zPTEHyDQjdUNjk4u
         x9Wth+uZrvs2w63Gv5b2y4VU61MpZos2w4oUV6LZlI9/h/of7N4OpTdxpLp8wBa9lJot
         Co4w==
X-Forwarded-Encrypted: i=1; AJvYcCUdxSRg8RI+COwvIAPaOJOUmDSTi19JUpAiuGrq47bSKpPdYAEMvYjIgs/0PHzLAffmzMnj2nYT4Qe1V1ZgkbRxYTgNFeHdPsGmMUpoDTck
X-Gm-Message-State: AOJu0YyLaTCxO8Yr0hhTP0E37y8bIz1r+VbCj2ZHA1htzQa48NsZG1tl
	ctnwNjpCzpOPEBGUin1iX78pRbFqHxlhU0t7GX2SjgX2ar/Og2jfWfc+9VyBi5x6jj+TDmHZxTS
	5XlaldKKXSkiDlCpRlrLTIRBDo5pqmSGKdNpDmBOhrvVWySkEBOGEu7k68Jk85/pNccz1KU65Gl
	iqkDUP7Eo+Dlf05wTzxNCT7+7hdqYnofApgKGIR2vzqueJ1+FMfb/39cD+UdALdFJz
X-Received: by 2002:ac8:5981:0:b0:441:4a7d:4b9 with SMTP id d75a77b69052e-4415abd77e5mr18363161cf.15.1718184206034;
        Wed, 12 Jun 2024 02:23:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGJjys1SrlEEOXzrogJ4mBiejM8H3xGLEYRak+OtJId/AecySqXJCViAxtmj2YQLsOj6rhO/lEl1VrhIpEHybc=
X-Received: by 2002:ac8:5981:0:b0:441:4a7d:4b9 with SMTP id
 d75a77b69052e-4415abd77e5mr18362891cf.15.1718184205625; Wed, 12 Jun 2024
 02:23:25 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Jun 2024 04:23:25 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240610-reenact-amicably-bd088724b3cb@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy> <20240610-reenact-amicably-bd088724b3cb@wendy>
Mime-Version: 1.0
Date: Wed, 12 Jun 2024 04:23:25 -0500
Message-ID: <CAJM55Z8UH+pfOoObDvr40RAB-4th=n6Ma9de=Q6ghRw0GvhtFA@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] cache: ccache: add mpfs to nonstandard cache ops list
To: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
Cc: conor@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_022333_432274_DD4F092B 
X-CRM114-Status: GOOD (  13.74  )
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

Conor Dooley wrote:
> On PolarFire SoC, for performance reasons, we want to use non-coherent
> DMA. Add it to the match table with the non-standard non-coherent
> cache ops requirement.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/cache/sifive_ccache.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/cache/sifive_ccache.c b/drivers/cache/sifive_ccache.c
> index 6874b72ec59d8..277e66a61efdc 100644
> --- a/drivers/cache/sifive_ccache.c
> +++ b/drivers/cache/sifive_ccache.c
> @@ -122,6 +122,8 @@ static const struct of_device_id sifive_ccache_ids[] = {
>  	{ .compatible = "sifive,fu740-c000-ccache" },
>  	{ .compatible = "starfive,jh7100-ccache",
>  	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS | QUIRK_BROKEN_DATA_UNCORR) },
> +	{ .compatible = "microchip,mpfs-ccache",
> +	  .data = (void *)(QUIRK_NONSTANDARD_CACHE_OPS) },
>  	{ .compatible = "sifive,ccache0" },
>  	{ /* end of table */ }
>  };
> --
> 2.43.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
