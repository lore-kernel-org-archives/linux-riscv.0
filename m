Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E39C54EED
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 03:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yto49hrwjOLawQwf1td1lfcN/uigJC4EJMZ9mc8fKA4=; b=X2dvOVABokEJCJZYnRBlvShye3
	sWhwp2gWkcq8oUypR40Vm3e+ccry5WOjwaTwDiYnlLBs4xCTxQUJNZ3luVI0LVTbakq85I5BKWutd
	u92PVv1NwTTPadk10O4+8HuhpSbyRXUSlBjUjsvJA7rEsVERH07DL4Yf8nCq5sFYn6Tb1QWZOVwG+
	Ek0sgRqRBA3cxp+Qvcvt/XmQvDb+3Xtoh7odGPDAyiqHO8IAYSqJiGg84rglHKXS/B0cV2iFJgmin
	OATGMogNw+1uDnFLMzSo6cggwRWOQ3Bv4Na8vPUtvEJFbTS3jITAyx67jdXB/kGabY0gEwSZ7WzAo
	VLy8EnFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMKUm-002FPX-Kg; Mon, 30 Jan 2023 03:06:12 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMKUi-002FMc-IN
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 03:06:11 +0000
Received: by mail-pj1-x102e.google.com with SMTP id rm7-20020a17090b3ec700b0022c05558d22so9769592pjb.5
        for <linux-riscv@lists.infradead.org>; Sun, 29 Jan 2023 19:05:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3oz0VIMVgaReYi9aKrZqVAKswX6aP3dTUqdpO8t9gRs=;
        b=E/vdnAnvh9NsqgWPrP97+w5bcvC3Wlj0hqeqici0tG+2atPyGUfnvgLV2eF9AoXGyE
         cqiex2ipx8b9V31Gu9ZkylQD5F2qtlWgPspCbmOI9DJh5o+PuyZNWhjfpsRDJeJEDWAu
         nnV6R8KJl0BMzs/5toLw0IPFtWE4ZplSAChbHrfx0Ln+ZDtAKVtuSyqSewFGDSXIdlYW
         +UpSuGCy33R57yabNqPlwdhTHLDsMh9WV7NuAYZ38XJBQlLQi+tPS19mEeAontUUnerG
         lk/iddWE/BCAWtfkv7eH/P8hj5lfd5E1aEjrjv0nh4Vvu+nvfyhT6B4llsF0Sny566T5
         tmnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3oz0VIMVgaReYi9aKrZqVAKswX6aP3dTUqdpO8t9gRs=;
        b=kHFzvaGbUUgUSL6N6SoaC6WQwoILXxUP5hmupGMo/Y0ExNCdyzDNRaysOi+vvOgKWg
         2pzdLyqiaZZZyGrFU+hJH+a2nWQr595xLFXz7ZAkJg5GWRiR9b/ZMFUP9bCMso5pJpUb
         8HCbm1KXfOwSrb0haaz1Sq6VvjQNbggjgggJcFn81IiXsiNyAbkaQlnuN9CUgqkQF/ew
         RD9OoGxpA97But9xKdKc5y4YsIpU06pCiq/NpBU2pM6hpANmz5qZuXucf3W8Q7NU0bUc
         W5UgCDPEGKXf6PqA5zPx4hx71gykC4qyx22Ijud6X7A4xhqLKbODS44NJdhP2jGtE7DH
         P4wg==
X-Gm-Message-State: AO0yUKXRIHUV7FzaeoYCdG+esg94PcVbChyXQStKOiE/vhznLdYIk+P2
	DbSY7rRdQoGyzGqMMwyWe04=
X-Google-Smtp-Source: AK7set+53FxYtCizL00TBLEfogIEaXeIMsDZNYTjBIVqqXDK83b539HPehexFDAloOeSCEh0u5rUew==
X-Received: by 2002:a17:902:ea0c:b0:196:2b0d:feb7 with SMTP id s12-20020a170902ea0c00b001962b0dfeb7mr21605818plg.13.1675047956805;
        Sun, 29 Jan 2023 19:05:56 -0800 (PST)
Received: from debian.me (subs02-180-214-232-8.three.co.id. [180.214.232.8])
        by smtp.gmail.com with ESMTPSA id t13-20020a170902b20d00b001947c617c45sm6513168plr.221.2023.01.29.19.05.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jan 2023 19:05:56 -0800 (PST)
Received: by debian.me (Postfix, from userid 1000)
	id 53708104F8D; Mon, 30 Jan 2023 10:05:53 +0700 (WIB)
Date: Mon, 30 Jan 2023 10:05:53 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Conor Dooley <conor@kernel.org>, palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	corbet@lwn.net, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] Documentation: riscv: fix insufficient list item indent
Message-ID: <Y9c0EU5epWCeoPB8@debian.me>
References: <20230129235701.2393241-1-conor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230129235701.2393241-1-conor@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230129_190608_633253_8FDF349B 
X-CRM114-Status: GOOD (  18.48  )
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
Content-Type: multipart/mixed; boundary="===============6744757347265201102=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6744757347265201102==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wCUAQjRw6bav+egE"
Content-Disposition: inline


--wCUAQjRw6bav+egE
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 29, 2023 at 11:57:01PM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> When adding the ISA string ordering rules, I didn't sufficiently indent
> one of the list items.
>=20
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: f07b2b3f9d47 ("Documentation: riscv: add a section about ISA strin=
g ordering in /proc/cpuinfo")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Seems like you forget to add link to the report:

Link: https://lore.kernel.org/linux-doc/202301300743.bp7Dpazv-lkp@intel.com/

> ---
>  Documentation/riscv/uabi.rst | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/riscv/uabi.rst b/Documentation/riscv/uabi.rst
> index 2ebec4c52230..8960fac42c40 100644
> --- a/Documentation/riscv/uabi.rst
> +++ b/Documentation/riscv/uabi.rst
> @@ -21,10 +21,10 @@ so for our purposes the following rules apply:
>     single-letter extensions and before any higher-privileged extensions.
> =20
>  #. For additional standard extensions, the first letter following the 'Z'
> -  conventionally indicates the most closely related alphabetical
> -  extension category. If multiple 'Z' extensions are named, they will be=
 ordered
> -  first by category, in canonical order, as listed above, then alphabeti=
cally
> -  within a category.
> +   conventionally indicates the most closely related alphabetical
> +   extension category. If multiple 'Z' extensions are named, they will be
> +   ordered first by category, in canonical order, as listed above, then
> +   alphabetically within a category.
> =20
>  #. Standard supervisor-level extensions (starting with 'S') will be list=
ed
>     after standard unprivileged extensions.  If multiple supervisor-level

The warning is fixed, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--wCUAQjRw6bav+egE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCY9c0DAAKCRD2uYlJVVFO
o8UUAP9YkXEdQj5KZW3SFXwm2QRbfArE8wjMjPRwifZVG59jAgEAog/VIdAirpqQ
XEXI7Z8KNgjOYkAQHT1BoFEKiJX16w0=
=QBOa
-----END PGP SIGNATURE-----

--wCUAQjRw6bav+egE--


--===============6744757347265201102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6744757347265201102==--

