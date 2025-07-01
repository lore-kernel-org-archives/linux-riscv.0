Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 898DDC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 08:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vv0fj+b7Hr3VAONTK/awi0c5rls7OQynMCt4gEV8PL4=; b=Zi1RB33rSPURZnPVmQPnrk3QPT
	hDviQgEROw87IGH4g6PY3+mzE6NH25+vmjs6Z82GbYnnkTVqwWbYn5qkVfMpSNvga9OGBQVCryY7j
	KJxdlK6E+UsYTRMsdxOL69VmVOMocDEsdFhqAVlQ8dq77x5OVILKazfaGCncqXkSUR07H2xQWLPYF
	ExojMdkYzXko5J6KG0zcyTMSgSWAEbj43y4kIMM0uFRk2cFdgEN2btBxOV3B+EK0rBphZbF2Zv6o3
	lut0M5pwrs/6PAPk6SI7ADnzrsxl7FkYs3/t8AmyqsOYfMBDPQAYmvpCjra8Kq+BCW+bm3QM928qO
	02Z06EkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVwf-00000004MGg-1L6H;
	Tue, 01 Jul 2025 08:02:25 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWVsP-00000004Lcd-1ph1
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 07:58:03 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-ae0b6532345so1232965466b.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 00:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751356679; x=1751961479; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=;
        b=M7wzQevqaFbpbIbD0zY2/33/gaTPiSY6OWzft1TpYQJ0aM63VjrSya9L0mPW+6qync
         5myBdXd6VOqgRK2JsqJmaMN37y20pB8hpNaBLD4fRAClzSkEjjKiwyvK80zOUsA+/vG7
         PbAV9MFCFebHvwPmN17gyM+YSdnvOOc0D+sDpi01i7km8vIgwvTtX7mTHa4mLgW2XR03
         WNDhBhNcV+DjUai2q5s3IC713vhWOIqfmxCZiRz1NBBjrOdbpN9mGEK+ps5xwJH8l2qq
         2P2Y/KCuTTRLDGGfYDBKo2SGvUh5m6F6oV1tVlq/sK0+NgY8kGIvi+za/hVuFbCeXMm+
         BfXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751356679; x=1751961479;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0fGtepblwK+PwnUbRqr8IJdvtvAvDr3iEbtu2aVkHEg=;
        b=hpliMFUv8jMpNQxDSdX4xk8kqkT5oxjJA174AATm6t3ShUETIWDNyO973SOpra8tVF
         fgWPBQUeedDzbKa6v191JcAT7F/3n50zcljeyHV09bVmulPL+1eT0KOiIkCD+i5vZ5PV
         tR85bKkQfImoSxNItF8MJUPcP0JLJOEzmSFdOza5Dp0SP/ha1eap+AN8sus5DbdnKsN2
         vfMGuPlz6mWB5CQMWAM8IsU5K0ReIXF6r/bQMkjjU/0kf0nkodW2qVcan0xvTMkdbEc+
         +g/mlZ8Mw7aCq6m0ykn70y16J4rg+GW+lqnlmRs4Pb/GSgOq1OF3idRdjM1mcyr+65Ak
         fAoA==
X-Forwarded-Encrypted: i=1; AJvYcCVngYfFaqpFa0rXjIa9+7zCXPYCaZBeuw8odru56NzMN3iss7kzwX515aDETpRYgP2URQBxV84hGI/ozQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyjedJAYXixY+JVRPudle6XIk9cUTTC/pYfsMu8JKjprA4GEF8S
	syrRbmqfl35HvBNhG3iiA3maUQLbvhIvWjn64Vujv+Yal2Lgkezjy7ZOz6sZbVN10sM=
X-Gm-Gg: ASbGncu+HJ1obuZ0k9I4Tk+3y0122DLGbwGIwguvpO8DsDzU2WNhraGm4myPiUNmSxy
	9JQAjcfT9mgbSYUKDQLuxU6xU0nOqdYyYVBiFt3jN9dJ1QOuT+L3DN6T81UbzEMzA188scWaw9x
	vN7Ro7XDwEiNa+gTMCFwtaSEQ2l0tzSFUCn3KYnTe2LLzHROlRw3u4sLZqGMP+jHWTZLhQIQK4f
	Csbq7T0mLnEzTey03AihgRKaua+39bC9FDS128RtQ3G9o+Pb20m6/ow6dmZ6N6mFFZIBIAYxbbt
	y1G2/G08eJfCOzfCz8fzHcIcf2+uQ9XveOsx09hhZKJJcXkWp0ov5lXnMaDbMSqhT84f2B7L78H
	B7WaYl7IaUFacSyU3SEiv5C4c+3eA
X-Google-Smtp-Source: AGHT+IGGrCAc15VHtma/sGYQ2QD6trb1EHpP/JN8l1psGDWhOW7Eth1ZId1p8Z9JxXzDyNqdoc0dkQ==
X-Received: by 2002:a17:907:3d8f:b0:ae0:c4e3:e2e8 with SMTP id a640c23a62f3a-ae3b0b8fa19mr136200866b.28.1751356679310;
        Tue, 01 Jul 2025 00:57:59 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae35363a172sm808993166b.8.2025.07.01.00.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 00:57:58 -0700 (PDT)
Date: Tue, 1 Jul 2025 09:57:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: linux-pwm@vger.kernel.org
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-arm-kernel@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	linux-riscv@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
Message-ID: <wzadx2ut3wjm24bw7ol4qjjeku6f74sp3tovtexs5w62ljesid@n7d2f4uzga6b>
References: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
In-Reply-To: <cover.1750788649.git.u.kleine-koenig@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_005801_479586_35DF0A39 
X-CRM114-Status: GOOD (  12.00  )
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
Content-Type: multipart/mixed; boundary="===============1258436532786528359=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1258436532786528359==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dvqu3sv3rcoezsre"
Content-Disposition: inline


--dvqu3sv3rcoezsre
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/8] pwm: Drop local locking in several drivers
MIME-Version: 1.0

Hello,

On Tue, Jun 24, 2025 at 08:15:36PM +0200, Uwe Kleine-K=F6nig wrote:
> some time ago the pwm core implemented additional locking to protect
> lowlevel driver callbacks against driver removal. A side effect is that
> .apply() and .get_state() are serialized. This allows to drop some
> locking that is now superfluous due to the core's locking.
>=20
> I identified a few drivers that are affected; these are cleaned up
> accordingly here.

I applied these patches to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
now.

Best regards
Uwe

--dvqu3sv3rcoezsre
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhjlQEACgkQj4D7WH0S
/k4vegf8DgkQ0a9kQ5LjlzCtQA04Tm1xfeP7UVjfQXVsJkkBcOU4mfdoSrU9tfno
BfO6tWeFYcUdJbCAPLDW0rtt/PLGq00m1Ti+DotG0ys5XYfE4C/L2gEcEJXEWdh5
teuOCdBWo55vAOj0OT+fFWSagAH5t1UJvOiX/XHUqS4do4wNVCUDo3oCG94zvqRo
t+cSZpO8iWlY+qK/wJu7rClU87CHx+WgtSs+TKH44z6SV8chWe2sh2a8bJzEYjLf
oCP3jZ6htcXuYiqQEyxRtyzYPvV7Uhy3tnshs2tS54Pyvgs6hYa13ZkPU9uSa154
6kyYGeshrOV0IJSJUvGmR+mfNO9lcQ==
=GkCe
-----END PGP SIGNATURE-----

--dvqu3sv3rcoezsre--


--===============1258436532786528359==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1258436532786528359==--

