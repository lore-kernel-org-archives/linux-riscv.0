Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6992ED0E6E0
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 10:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1KzDSm0lw906G1tJQqLbw/N0mLfbXBZOVPaOgdmbuEw=; b=C5MrLGGtV1quKs
	iIirV2Np2vx/JPqWVx+toCD91fPyrk6j3FitU35vGFBk3D89qw77N2tE+Jq+9zf7+NKGGPQbVgb8U
	s5f/T9pR/trvuxu2qmBTMrLMO/h0eV/9rNnkcBsW0auVxdutjS7j4hQOE3QufUGL7fZ9QQfC6/quy
	8Yd7VKdNbmjdNMiv19tlbg1q/QcpB+PMBWrIFTqN6IbwtQN5JInJlwC5S9dx4FAKCywpCHOCKbBuh
	Mlm9tP1YxEvkK6PSNsMq0UXveTM6rqhdRWwmqCknVrFb2TSbYMWvjFhsUZt6TxxWB2kCAQpZk064D
	nsN0rGkwwBsGUNG1VLYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pSx-00000006rGl-17Hg;
	Mon, 21 Oct 2024 10:16:47 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2pLk-00000006q3E-0dFX
	for linux-riscv@lists.infradead.org;
	Mon, 21 Oct 2024 10:09:23 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-20cb47387ceso36913595ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 21 Oct 2024 03:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729505359; x=1730110159; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Yeq8CDDkDOrSnhrxHij8VmLVC6Z1DWY5RzKY0fBvsb4=;
        b=ENGjM8zNGu1US7k4Q5lvsHHwkf5Viqid0hATIGS/Cr3Qz3KWASW3VRYomgDd77P/51
         0KjwfcszjwoJjteFSktCO/ZVjTR18Ee32QI95/2UDITfZ2d9xZ/8z00Fy7nitO2e9b9e
         H9Q7CTRU+jDmaxcCa1KfhJVeWEqKjP495mq1/e+pUXrZrjzdwOZ+L++W2PUIbm3VKulF
         fGW0H0Qm6K299t3BY2RfNCTsTQLssxx4kFfqacQhmM+V6e7kG0mrj5TRN9q1E1tnTO1b
         q03fz63tgseOLjN3PIwtTloV3o6CGHjGUIAg397kq6fWARB/qN2KDBA5Kce/EtZybkKJ
         7UVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729505359; x=1730110159;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yeq8CDDkDOrSnhrxHij8VmLVC6Z1DWY5RzKY0fBvsb4=;
        b=B89f1P3WP5qtKncypBwX+rVEIAgBcUDKiis6hvgZQAFlZPjl9D2JPYm6L+mfUyF8iN
         u1W0IvyU6fl53K1bMit2s554TDSk8xQXnWQgVQ2orHSd9GQmjTlfu4mKJO7wL3hEdxXD
         KSSNIDegAX/PSzaE6ztToScSDmWWU9ssK1OJshwlhlK1qQPCO5MKdhcbYszf4fZ/Rl6k
         8bKm2sn9IYsnIou9QMMZkE/53AAsuID4cT/cZzZiOy5JqXlDjsDGXQpKF9bNPORp5IWo
         DXDWZ86KBTs27X7bK3ufEfSVRPuVCV9n5W61CB6/o2AMR3mbtRvetYP5e6NI5E4hLGIi
         0+Kg==
X-Forwarded-Encrypted: i=1; AJvYcCW8UGJm9NQQAuqM2L8Z3bhz3hS3p8XSIjJYf8YzbMQqP0JoWdMaG6Pxc2pWfylImcXhIQcG5/Mj7xtYeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwNkb6xqB+oo1u8rfStXyjGmvG6Em13lhqPHUkWXgKiIIjO7gx9
	D+EnYUpT63V26cO0QF+om27bhfZCWZeb+xLYsHAkArmKuABNTjbK
X-Google-Smtp-Source: AGHT+IGBVSe3fGC8jwkNg83HVZynlz+8eS6hkHiMJMQb3ltPpok70fN7+VYi13IU+PQuxS5Q2gB9RQ==
X-Received: by 2002:a17:903:2342:b0:20c:7a0b:74a5 with SMTP id d9443c01a7336-20e5a9055e3mr143289685ad.39.1729505358749;
        Mon, 21 Oct 2024 03:09:18 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7ef0e0ecsm22543135ad.109.2024.10.21.03.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 03:09:18 -0700 (PDT)
Date: Mon, 21 Oct 2024 18:08:59 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Inochi Amaoto <inochiama@gmail.com>
Cc: Chen Wang <unicorn_wang@outlook.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Inochi Amaoto <inochiama@outlook.com>, Yixun Lan <dlan@gentoo.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-serial <linux-serial@vger.kernel.org>, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/2] serial: 8250_dw: Add Sophgo SG2044 quirk
Message-ID: <tm7jtf3swggiilznwo3xcqjlhd2a7cguwk3nay3bhmaxo23mf5@qw2fyjwapoxe>
References: <20241021072606.585878-1-inochiama@gmail.com>
 <20241021072606.585878-3-inochiama@gmail.com>
 <29d8e2a6-d0e7-0f74-1f5c-4f285ec1e9ee@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <29d8e2a6-d0e7-0f74-1f5c-4f285ec1e9ee@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_030920_219920_2CE19827 
X-CRM114-Status: GOOD (  21.14  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 21, 2024 at 11:52:38AM +0300, Ilpo J=E4rvinen wrote:
> On Mon, 21 Oct 2024, Inochi Amaoto wrote:
> =

> > SG2044 relys on an internal divisor when calculating bitrate, which
> > means a wrong clock for the most common bitrates. So add a quirk for
> > this uart device to skip the set rate call and only relys on the
> > internal UART divisor.
> > =

> > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> =

> Reviewed-by: Ilpo J=E4rvinen <ilpo.jarvinen@linux.intel.com>
> =

> I wonder though does this mean the numbers userspace can read from kernel =

> are bogus and if something can be done about that?
> =


I am not sure whether the clock rate can be read by the userspace.
At least it report the right baud speed by using stty.

Regards,
Inochi

> =

> > ---
> >  drivers/tty/serial/8250/8250_dw.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> > =

> > diff --git a/drivers/tty/serial/8250/8250_dw.c b/drivers/tty/serial/825=
0/8250_dw.c
> > index ab9e7f204260..51894c93c8a3 100644
> > --- a/drivers/tty/serial/8250/8250_dw.c
> > +++ b/drivers/tty/serial/8250/8250_dw.c
> > @@ -750,7 +750,7 @@ static const struct dw8250_platform_data dw8250_ren=
esas_rzn1_data =3D {
> >  	.quirks =3D DW_UART_QUIRK_CPR_VALUE | DW_UART_QUIRK_IS_DMA_FC,
> >  };
> >  =

> > -static const struct dw8250_platform_data dw8250_starfive_jh7100_data =
=3D {
> > +static const struct dw8250_platform_data dw8250_skip_set_rate_data =3D=
 {
> >  	.usr_reg =3D DW_UART_USR,
> >  	.quirks =3D DW_UART_QUIRK_SKIP_SET_RATE,
> >  };
> > @@ -760,7 +760,8 @@ static const struct of_device_id dw8250_of_match[] =
=3D {
> >  	{ .compatible =3D "cavium,octeon-3860-uart", .data =3D &dw8250_octeon=
_3860_data },
> >  	{ .compatible =3D "marvell,armada-38x-uart", .data =3D &dw8250_armada=
_38x_data },
> >  	{ .compatible =3D "renesas,rzn1-uart", .data =3D &dw8250_renesas_rzn1=
_data },
> > -	{ .compatible =3D "starfive,jh7100-uart", .data =3D &dw8250_starfive_=
jh7100_data },
> > +	{ .compatible =3D "sophgo,sg2044-uart", .data =3D &dw8250_skip_set_ra=
te_data },
> > +	{ .compatible =3D "starfive,jh7100-uart", .data =3D &dw8250_skip_set_=
rate_data },
> >  	{ /* Sentinel */ }
> >  };
> >  MODULE_DEVICE_TABLE(of, dw8250_of_match);
> > =



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
