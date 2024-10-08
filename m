Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAC4CEFC22
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Oct 2024 15:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ETzcONBugxD/gZfRsEbEH6g0lfM2QSvSpqyOkce+ZQE=; b=atggDlTttL8mtn
	2k26ie2XaHyeR4enCWRqyW69B0R7vAU16NOmrh9Ig+BGvoUhvxtT53e/FmbDkiZV1PxXL3Yk+3WRj
	NSAsJ40uMqI4L5dli0rRzGlQMwQT0iNvJvrv/fDakTe9ZsomZEEt6hjLyqM4+Jr/MjRtOmrP7txF1
	MyxsS8ky9NAOG4MUZxc+CxVuifxs8NcNNYYu20HZ0zSoZdPX9y7oDZKDrTKO6FHlYDLIdkYs3ydRW
	+kJIDL9BdYpo7FMMhT640x29aVdBukZUX1KLMTOi5DXov404qP7agDOeOfoMM/Faqf/25DXacTUtc
	Qw819lGvOtiVlX/w5biQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syBtg-00000006K1x-33bT;
	Tue, 08 Oct 2024 15:13:12 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syBqr-00000006JXh-29o4;
	Tue, 08 Oct 2024 15:10:18 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-710e1a47b40so1728784a34.2;
        Tue, 08 Oct 2024 08:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728400216; x=1729005016; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=h8FVjFSOCkqIf/0pMIi/pzRKFL8gLTJryJEfNVlsG7Y=;
        b=feZo/OSbPNQ07JmpU9p2qeyC2ObpTuN0JBdmPeldx3fI4MXdqum94liRLDcZUgarvS
         GqAAx2vhzxAJeQcMjfih60UKUM0LluzKT3m9EStit1s62zmE4+CUT3I8rs5UTvQvbsJ7
         PniAXf9bAw9kGUnE/G5wDF4jg92zCPoY/1fJzw9NGTtpOX6fcIwcF4m6ycvZzuuD8+6I
         eg9ImVhpESLkGR7IsbT+Ds4yYj8LCS3NPEmcPQqeRKgFEGciMLSzL9tPKXKm+1oLj9EZ
         Bw4WjYtpF1BCehT6G3Fogb8OFquA66oXgifh5zyqsTFhIXze62XO4hD7YB9Kg+ddCpPn
         o/0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728400216; x=1729005016;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h8FVjFSOCkqIf/0pMIi/pzRKFL8gLTJryJEfNVlsG7Y=;
        b=KxmmxaOnrID57haiAPSXFfRDlRvrcz1CzO7z99G9JuVRKny4GhGatjNXGGHDit0GrT
         LJpPWnmS8ypHPQW3V2mRu4mmQc9Cd+p/BMSWyQI/zniTxP8jbo5GuQMF2Q48Gd971QD9
         WGlwsIzY5c9UhqmRBk7WJCmEpZM6GrVjTIZBw0PY/aubXK+gjKgRtub9LzBP1CrnKN4g
         kpH4ZVTyYVp326b+lSFPcm2Ljc3yB0Bjk6raxtCVu7RMKqnwr1YFh1N7CJgViHdjGBuL
         hkOohUOjcwjcSSDFakCT0p1v2vR08o8dZw9GddljJGiYvN5SKV9Ak7PXKq/8/BPdRkFk
         FkSw==
X-Forwarded-Encrypted: i=1; AJvYcCVtRU3XtaZLrT27GCSpLMd5uWC+xr7FfKC4BcOwI7uqVl6mzRlh15zJ1NWdb68F3jQ8HFcyU3FJ8ArsflQ=@lists.infradead.org, AJvYcCX2bAGnyCgimzIL1yOulpLYU4VxSQYDWXHoT6fs5rUXmqb/tCNCeluZ63ikZdlYo8oizsG+fM9XS74HVOA8Y8HR@lists.infradead.org
X-Gm-Message-State: AOJu0YyYargcIW+teT/C7dlgoyKUV3KBK194CncIBj77Zeb7y+AN9R4B
	NdRNwQsrum25f0C5mbxq6HWF6wZcvHHfhmSM0/x9MKL1cYE8SXVB
X-Google-Smtp-Source: AGHT+IFYYXW7//lDk6FPokDWD1gM7PjS/UNrxS+imBsA3RrlBJLTTdO5nz6L4rCJS5C+eBsXjG/Ufw==
X-Received: by 2002:a05:6830:6384:b0:710:dae5:df1d with SMTP id 46e09a7af769-7154e98fca3mr10733642a34.31.1728400215490;
        Tue, 08 Oct 2024 08:10:15 -0700 (PDT)
Received: from neuromancer. ([2600:1700:fb0:1bcf::54])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7155686c95bsm1884579a34.73.2024.10.08.08.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Oct 2024 08:10:15 -0700 (PDT)
Message-ID: <67054b57.9d0a0220.359bfc.6183@mx.google.com>
X-Google-Original-Message-ID: <ZwVLVb5L08dVG0ds@neuromancer.>
Date: Tue, 8 Oct 2024 10:10:13 -0500
From: Chris Morgan <macroalpha82@gmail.com>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	John Watts <contact@jookia.org>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Maksim Kiselev <bigunclemax@gmail.com>,
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v9 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
References: <20240520184227.120956-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240520184227.120956-1-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_081017_575812_40BF01D2 
X-CRM114-Status: GOOD (  17.46  )
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

On Mon, May 20, 2024 at 09:42:18PM +0300, Aleksandr Shubin wrote:
> 
> v2:
>  - fix dt-bindings
>  - fix a remark in the driver
> 
> v3:
>  - fix dt-bindings
>  - fix sunxi-d1s-t113.dtsi
> 
> v4:
>  - fix a remark in the driver
> 
> v5:
>  - dropped unused varibale in the driver
>  - fix dt-bindings
> 
> v6:
>  - add apb0 clock
> 
> v7:
>  - fix a remark in the driver
>  - add maintainer
> 
> v8:
>  - fix compile driver for 6.8-rc
> 
> v9:
>  - fix a remark in the driver
>  - fix dt-bindings
>  - rename apb0 -> apb
> 
> Aleksandr Shubin (3):
>   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
>     controller
>   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
>   riscv: dts: allwinner: d1: Add pwm node
> 
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun20i.c                      | 387 ++++++++++++++++++
>  5 files changed, 494 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-sun20i.c
> 
> -- 
> 2.25.1
> 

Has there been any futher updates on this? It looks like v9 was last
updated in May. I only ask because I think future patches adding
support for the H700 require this as a pre-requisite.

Thank you,
Chris

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
