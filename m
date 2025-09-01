Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1856CA1007
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Sep 2025 00:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lMGtqry4gRklIWmBaZao+2LAQzj1skKMxJjUUOFw2Oo=; b=Q4Xnii+WokqDP3
	a7qk3Us9BxoTBlTCcCgCeU41rgUHtqZQewXSfTJiywkRu/Jko+lh+8SaB9M8Y+68pVXZWYDjiUd1y
	pzL49tXwA0nwie2veX/XUF92JGwPyJb/hWmMKTWy3f0kPpPSvaByeQPepvs7rEhW052nYurL49D6Y
	degJzNgXWQvzt0F74IVXS8A+VHo/mZDPf75jS98cUF6dwaShpMUM+Ioi0EsZAggu//3DWjWOhLLts
	gS4VKTDZHCwi5NBeH/zweDbWQwWqv7ZLxMGypmNvFQJpubXWo0rVgrZN8kIrfSLfNhN+GHqu8vrMn
	w8S2etDMSmbIsODjDtbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utFHL-0000000EaGl-1w3B;
	Tue, 02 Sep 2025 00:53:43 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utCp5-0000000E5Xd-3Ic2
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 22:16:25 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-76e1fc69f86so4321186b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 01 Sep 2025 15:16:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756764983; x=1757369783; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=erf0LGr1RXc9Ic0frfV15S6ddZ5bAby40+1+C+q1TDE=;
        b=HDcoB/BoQX3pjy+T1hNsQeAcmDsrjES80i4boGU4Beicd8BhSHSBAI+N9z/b4jJpJS
         z1hnMlFDvfqz6DmwRgzULHgOXITE77FKmxz+skAHiFRPEGGWa8vr44tkb78ZwMnl5JFQ
         ex6DZgirFbzMIEpDMW1876+LYllqPViIVHcdXf0ZCBstLz7JMeVSO6r1/06rjaz4mqVn
         pYGn3HfRrldi/Mn0Vbo4oZu4Snj0rT/jF349e/X6pE0tD22hghk1K1QHLjD2NHye5fYo
         YifUZeuPDTfNRBrpedrWDz9YTmlsEXwlFV2R6m3CBv+YbtRExCKmE0mRFGBdpFjpkWpX
         eQiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756764983; x=1757369783;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=erf0LGr1RXc9Ic0frfV15S6ddZ5bAby40+1+C+q1TDE=;
        b=UB02+r/SKpdx1rE9YKob+g9LRCuoGHeEEbk7t4T4KTTa8Uekmi2gWfrQyUZ8SCuWSQ
         ZQK8OwTaYUpBDyrZ9U3WJMPIHvv0sizptvAS5jFxJG9Z/V6wKsjvzJ167GP2MJtGsw31
         tfDlfVFHjrt7OmyktGJlXN5r4zGRpRpYlWek/8X1oy46GxNj0ZETpVWSTszMRTGaCa4C
         Vzz2p+Tq4x1aInXAOBeZNb8p8pMnVJhKhFybOrCRrS2nLAFN8pZSabRDZe3KYA84uC+u
         3OSSd1di4M7LhcTjILNA1Dnyk160TZ27aqxaZ6bVtybz7XLQYRPsVd7SriyTwaFOq+P4
         kzDg==
X-Forwarded-Encrypted: i=1; AJvYcCWYsKQTwcD0ok5lB7gLrXhEsYt3vduIHfBSNc8dRhl/f2S1m9/51UU7cvlKl2V+qPxsXK64R0OaToBAKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywv4Wo2XoMR+XSS1Kt+ADagUDPbIOv3FQ+9+WHBW9JF9Dptd9tl
	Uew8Uo2ob9VCXXQ98HS0cZaueof+iw4XKv/igIfvqcTJWI0JEglOoI1Q
X-Gm-Gg: ASbGncvpjsrgVAQ6/7YJFiTdgmdrAqY8fTEkoooOJhUsUE1ZzH3HDwem2zZ7B+86ir1
	MlxXzKzFxScCKusIB3VhL7P3PiBMUbRsYRvyZGn6hZqOOMNvRehtQovngrG6TvA+aEehekpDkiV
	PIWxuKs94fxRWAKkRTDrIOa/fPO4JkvwGdcF+uaDlE0UubBnS9i9P1BKAkeguigTRAEewfcuJDo
	j2PS/5fqheCCUhorPj0iwqmcfIln5sSTHB2h85z1xFnbMlQ2qtLJg/1tCptTUt4IfoW2g7jBjbc
	hbPyubeu4B8m2mRwO37QEQrTA50hCvYJfPvsnXME3Q7w0+7EZcpC4bqQuO9aC5kNxB9NjhXTjiJ
	l4XO2g0IEKFznFvGRXjxl0Q==
X-Google-Smtp-Source: AGHT+IFWF0I/dXBzxrh9+lgnjxp+4hm9yfWG/1QG0n322Ke/LdJEyJO54HHlRnJIo9PFXfBtS2k73w==
X-Received: by 2002:a05:6a20:7490:b0:243:7379:53a9 with SMTP id adf61e73a8af0-243d50948b2mr13602559637.9.1756764982262;
        Mon, 01 Sep 2025 15:16:22 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id 41be03b00d2f7-b4e7989b53dsm7071350a12.29.2025.09.01.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 15:16:21 -0700 (PDT)
Date: Tue, 2 Sep 2025 06:16:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicornxw@gmail.com>, u.kleine-koenig@baylibre.com, 
	aou@eecs.berkeley.edu, unicorn_wang@outlook.com, conor+dt@kernel.org, 
	inochiama@gmail.com, krzk+dt@kernel.org, looong.bin@gmail.com, palmer@dabbelt.com, 
	paul.walmsley@sifive.com, robh@kernel.org, tglx@linutronix.de, sycamoremoon376@gmail.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	sophgo@lists.linux.dev
Subject: Re: [PATCH v2 0/3] irqchip/sg2042-msi: Set irq type according to DT
 configuration
Message-ID: <k3blxflvwicykiqv4eo6hx2notcp76rdf72oe37wkkkcq4ookr@fyydrsjv3r6z>
References: <cover.1756169460.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1756169460.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_151623_841320_00669F7B 
X-CRM114-Status: GOOD (  18.35  )
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

On Tue, Aug 26, 2025 at 09:09:13AM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
> 
> The original MSI interrupt type was hard-coded, which was not a good idea.
> Now it is changed to read the device tree configuration and then set the
> interrupt type.
> 
> This patchset is based on irq/drivers branch of tip.
> 
> ---
> 
> Changes in v2:
>   The patch series is based on irq/drivers branch of tip.
> 
>   Reverted the change to obtain params of "msi-ranges"; it's better not to
>   assume the value of "#interrupt-cells" is 2, even though it's known to be
>   the case. Thanks to Inochi for the comments.
> 
> Changes in v1:
>   The patch series is based on irq/drivers branch of tip. You can simply review
>   or test the patches at the link [1].
> 
> Link: https://lore.kernel.org/linux-riscv/cover.1756103516.git.unicorn_wang@outlook.com/ [1]
> ---
> 
> Chen Wang (3):
>   irqchip/sg2042-msi: Set irq type according to DT configuration
>   riscv: sophgo: dts: sg2042: change msi irq type to
>     IRQ_TYPE_EDGE_RISING
>   riscv: sophgo: dts: sg2044: change msi irq type to
>     IRQ_TYPE_EDGE_RISING
> 
>  arch/riscv/boot/dts/sophgo/sg2042.dtsi | 2 +-
>  arch/riscv/boot/dts/sophgo/sg2044.dtsi | 2 +-
>  drivers/irqchip/irq-sg2042-msi.c       | 7 +++++--
>  3 files changed, 7 insertions(+), 4 deletions(-)
> 
> 
> base-commit: 8ff1c16c753e293c3ba20583cb64f81ea7b9a451
> -- 
> 2.34.1
> 

Tested-by: Inochi Amaoto <inochiama@gmail.com> # Sophgo SRD3-10

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
