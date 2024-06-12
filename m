Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BF70C27C75
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 09:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=YDpTtRsprF4ayeWe3JXNmmG+qv7J1tRABcvLYmkzKlE=; b=4bJwJAsefhIPTdG8MQetB1bcft
	HUy+/9/2LgQ0SmDA0jjVQvP+ZhwZaMhsuX5y2WBZkHuYn6bEEmMwioEv6hunHZAH8ifcMPHue7fT9
	ZceV/7QfG8f589jbr+APoEEWqla1cAEocF6IOXxH/6R+bkHF8oDpocWwPQOg6xHuT6kFNxBtvvtyF
	2I9/UTnL7oV6scLT4jFyJbKLJGIQ0GwEx3Ay0pnDpFMbDotNyQHxzQuHaej64+AlBrA3JgwcBKzp4
	5RCFHNLtxcB5VK1MbHH0TSblQX36HizmFotwmHEF7Qcc47EvWp8KhSfI+qqMUjbd5TXDro47ETA7w
	xzwuiF+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKCY-0000000BxEl-3lH1;
	Wed, 12 Jun 2024 09:23:30 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKCW-0000000Bx8M-06fI
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 09:23:30 +0000
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B24FF3F63C
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 09:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718184190;
	bh=kYhK3L+yW69WKhHxmlqNiCnuIy+fGgbMi5wRMPzQXug=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=elVGqmvHskX59F4vCEfo/vWB/kt2PNwUMVA6OCMMeV0Dg0j9xWvWwX5/Ctu7rnpRN
	 GeKqyLE5vmz2szoAV3yLwY8IlkqYiUk0Ut54Gt4jr8e7ZvgO84/+3q4RPEszY+QyU8
	 AtGVkbPTGVZDhGwJdbs6JSV2W9xIsmhQjpUCSX5RZPtNNe0RrA4cloT9WUVpmcXYHo
	 +55f6e+r2VM7JHi+ZJh5aZIz/8JgLGFWamtTiNQohnmea71nuIbbeRO8ERsTLKfgS5
	 toLDO8f125YnaKgBLkqoXIKAqjynqnZkQK/euP/Caz0vEZmALwIMlPHi+yhAQ2FaIg
	 AIGykBD1tAn3g==
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4409aa71ceaso18529151cf.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 02:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184190; x=1718788990;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kYhK3L+yW69WKhHxmlqNiCnuIy+fGgbMi5wRMPzQXug=;
        b=O2PtQ6aGuwPpkzH6FvT3IPUKgFxXqUcJWwBttyYjlOg7mDAibakzJYwQ/jIx0cJU98
         nNShTftDkoTjmmPZzatYdJtOlfZPBfOu7OqCzF9SJ/mAxhnKN1BjyGCLK7t4bY48Er2K
         XsYo8nBDK09bSqx/VpQihIoVfmrMw4Lpj/4gVIASG2oOAm8sdE+a3zxrqW7xN8xDM8wT
         ZSB2qPA9Ls5GE6kxgA7id6ICHDSKQZq8YuI13/jIquR9BmRpbpJ5PhTeyJ9JWrt6kZeR
         gVFW53QMO4u0wT/9rnmIZ2u24EWMu+hiRZ3QfnN7gqCiixC924uLJORqqF//BmsZLMYo
         EKIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXXl1lg8SgNChbwVmYrajUpp2OyX1PHG+Qywb7Vf7BljgacSLFN2WX6nxLReafvhWkmdqPGqcfbXjRO9n4xj2wl3SlUZVD8V2GcHGD0pzLt
X-Gm-Message-State: AOJu0Ywy3sB1oiaHRL6js6v3e/m4q9jPIzBS2qEm7JmiJlfzcl8vJDai
	qIc/QRuYdx5cSXv2TGn/Cx8UqdYUb3kDULsfg8Wf/mwwmRXlsdIvkaVzqEFRxllOecmuC8Wr7mC
	U03512lLLrPUFef6mHkQihw7kdgf7f1dsClDaA9UKS0tI3lK27vRfDpPmahbK6IOhUPONdsATdd
	UUOB5zJknj2UgGZZCCiRoxkRNA2iZ/bVKCnCR0M0SOskj3JuNAhbP7eZbE
X-Received: by 2002:a05:622a:1815:b0:43f:f238:f7c7 with SMTP id d75a77b69052e-4415abace3cmr11487571cf.12.1718184189689;
        Wed, 12 Jun 2024 02:23:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF5MG8uXfoyZDoO/xNYxFjzdF/0nSHHKgK9WtkhZcuD36BVQY5EY7BluQvhT1S9z0w+/882J6EZF0XWnjMUN8A=
X-Received: by 2002:a05:622a:1815:b0:43f:f238:f7c7 with SMTP id
 d75a77b69052e-4415abace3cmr11487481cf.12.1718184189384; Wed, 12 Jun 2024
 02:23:09 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Jun 2024 04:23:08 -0500
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240610-mocker-ankle-d3ee407bb352@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy> <20240610-mocker-ankle-d3ee407bb352@wendy>
Mime-Version: 1.0
Date: Wed, 12 Jun 2024 04:23:08 -0500
Message-ID: <CAJM55Z8YWBedhXVgJpGF0LrifXGEjJubPvnxqdboAeW8DCLs3w@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] cache: ccache: allow building for PolarFire
To: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
Cc: conor@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_022328_324311_C95A95DA 
X-CRM114-Status: GOOD (  12.98  )
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
> There's a ccache on PolarFire SoC, so don't limit it to SIFIVE/STARFIVE
> SoCs only.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  drivers/cache/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/cache/Kconfig b/drivers/cache/Kconfig
> index 9345ce4976d76..b2d525e540212 100644
> --- a/drivers/cache/Kconfig
> +++ b/drivers/cache/Kconfig
> @@ -10,7 +10,7 @@ config AX45MP_L2_CACHE
>
>  config SIFIVE_CCACHE
>  	bool "Sifive Composable Cache controller"
> -	depends on ARCH_SIFIVE || ARCH_STARFIVE
> +	depends on ARCH_MICROCHIP || ARCH_SIFIVE || ARCH_STARFIVE
>  	help
>  	  Support for the composable cache controller on SiFive platforms.
>
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
