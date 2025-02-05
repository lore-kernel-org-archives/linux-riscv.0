Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDF7C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 10:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=6MIjulPBfTJ153k8lWpkaXiY7ZXD34C0PnDithEL8Qg=; b=0X3/wr3LfpfD7I56caIgafNv+s
	ogX7EQ7B5NITTIbZxDTFuI5HSQTKQXz7afYdD+tpttXvoScZUkgvpIFaR69Qr4rLHd7KOazn6VGUl
	/Epst8khEJrbVmscfmpHfkJ25pOPnZhrkzNFhFrdfg11UUYXcE0nscZf1zE6CevPKQl3m09jd19ZN
	W3NNekrFTR1dmql6ghoznczhqpFmpFGjUxsSFoZ+eYd657zAt1o8mAW6aO5hEaV8nY/vJ3rchFw4f
	zyMgDHFF8NFqNWiNrKoNUBBBVavRfb3UfvSd9c3FInmvUndiZ46UqOMzpASLBLNm8f5EuUhgf3dp8
	ZQxFGYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfciT-00000002tgS-0ws0;
	Wed, 05 Feb 2025 10:33:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfciR-00000002tg4-0GOs
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 10:33:08 +0000
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BD63D3F874
	for <linux-riscv@lists.infradead.org>; Wed,  5 Feb 2025 10:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1738751585;
	bh=mZz6uOkOdetjWn/MYSWTPPdVo/eDrN/gD1mRQKYgsoY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=H9+iJmE3Oj77vqYVsBTeohqo5EocjCEFsupFI8mxIVTnETp5/odVf8v4zSkeaN3p/
	 BScVOdiVB7urNAWLphGp9W9pFF8x3RzI8j1wxwOjb3qOsH+/N/+58wxO48mb9A/J5T
	 H5yP/pg03kA5yyRJ9SGQdvRfdLuSSE3Q/yozipAjEncE66OiemlH3/D4wgZfAVgnmc
	 COkRNqPb3ZAJxJrSgE1d3aqDGME47Epe+i1lwfe7VxoGCOpwY5cxOEPivuIAkbJbSn
	 HQogjBcYxGPGd3UZUPqNqh0lx+SA4V3gWuXH+OwT3IgIzr0r13Ubvk8CVAlh/KXErK
	 UXNHGqlg6WvOw==
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2add2f6f16dso10509357fac.1
        for <linux-riscv@lists.infradead.org>; Wed, 05 Feb 2025 02:33:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738751584; x=1739356384;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mZz6uOkOdetjWn/MYSWTPPdVo/eDrN/gD1mRQKYgsoY=;
        b=gcovMralPxsz8aQORMDyQtTmMRuGMog/lvIMde61LZrMOxBkpRbEXAdYwWW+97RprZ
         ckeU90b/FoqUwf9XexG2w2siTRuVUIX6BKqCuh4nD2Jgo084hM+BvxoiYj/9h0V3BZjX
         Ipc8OZbJW8BcViBmNhe+/7066Cs1Zj30T4S179bHMcEYGRpchxIo/DixBzrLxNFoDBs/
         XvN09Iwcdv2YeKop6IJ0AtIkrOIJVR7VEhH14we2x4qMn5+IqzK4fedl2itqSfMVKZwN
         2yb7OE22uqAROsI/hKqNmekK6j0nKvcSPKCJW/vejjJtvL5CrMDmBaqeprxxXMpzv9h5
         2ZOA==
X-Forwarded-Encrypted: i=1; AJvYcCW3TY+CSRKMDIfXwJJfFrmuWg7oOjfeJ3pt0oh1mZacEZ3nbBt3IgUUmsTiF1EJXFyjA/pFVsamnlXE+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YylpzOPLC2v3ksxMIvnsCvY4Hai/kWDz6SfvtxDjGEatd3ReErg
	jgbT533b3FCdGChs6Pi/xXOEpKxKTdFE9Ng+nr4bxf6qTfFPTQKA+s/2R7kZRVIuWovBm9u4i4J
	wiGS/JbuIursd7enlRo1RwSEP1PnrheXht/LBh6/c3MbcfENPUclCb5EUzhwxASOe6OrbXW0cBC
	1BUVjdp5+uOoaG4hhN6ZIIELVZGjZMkJhnQL/5SYfYHGYGXYS+Z/QtCZxQ
X-Gm-Gg: ASbGnctUkBq4zWR5p8taLmqlBybfcYnfZh2RnzWhJx/K+mkSwmAEVVnL7ZpbZuNqJ2E
	XNhBflSrhzcE7nk9UphS6zr0zE5EqmOyBM2lm+ch++KAQfgi6O8GAeaXzjPYRisi0tNKZcOjv8k
	RjTvcvHcsgfWpxT44=
X-Received: by 2002:a05:6870:6120:b0:29d:cc2e:8493 with SMTP id 586e51a60fabf-2b8051216bamr1463368fac.26.1738751584168;
        Wed, 05 Feb 2025 02:33:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEmH3qpvoZrzko3vHbJKUwQH9D1C8J2WA4SgPiTgjAd4v0yRXDEmDqB72GVyqzhsHQ7yWRzIEithsQQ5N0993Y=
X-Received: by 2002:a05:6870:6120:b0:29d:cc2e:8493 with SMTP id
 586e51a60fabf-2b8051216bamr1463354fac.26.1738751583861; Wed, 05 Feb 2025
 02:33:03 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:33:03 -0800
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 5 Feb 2025 02:33:03 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20250203013730.269558-5-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de> <20250203013730.269558-5-e@freeshell.de>
Mime-Version: 1.0
Date: Wed, 5 Feb 2025 02:33:03 -0800
X-Gm-Features: AWEUYZnqN3UQuAdW8pBfGnZxZ0hwMrrOPqtAk4UJEzsjOBu6DnzhDSeCSBC-YNE
Message-ID: <CAJM55Z8MVK8bB2qyzOsmgOC-vOCFEgAXcQ-yETH+KFF2yF-bmA@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] riscv: dts: starfive: jh7110-common: add eeprom
 node to i2c5
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Hal Feng <hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_023307_273447_09CF2890 
X-CRM114-Status: GOOD (  12.03  )
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

E Shattow wrote:
> StarFive VisionFive2 and similar JH7110 boards have an eeprom compatible
> with Atmel 24c04. Add the node so this may be used with the at24 driver.
>
> Signed-off-by: E Shattow <e@freeshell.de>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 6bb13af82147..30c5f3487c8b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -245,6 +245,12 @@ emmc_vdd: aldo4 {
>  			};
>  		};
>  	};
> +
> +	eeprom@50 {
> +		compatible = "atmel,24c04";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +	};

This looks right to me, thanks!

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
