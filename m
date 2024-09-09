Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42C68ECE579
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Sep 2024 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pVj4Q+CTGFrW3rrc9LoRlt6Hg8os09xEqUq6mHMY7k=; b=lf5o7OYWvjGjDScuwkHouymeYo
	LnDG1S8nGJ9iyeZqACtgxVWpG7N3+CESgbZx9iTmEUjcrb+txwaWPE2MRnCbSYIArnGtphuHfc20i
	ElUzXsQqVATT80tZtD3eX7IO0rWTx0jguD7MKuCtM2pksCgvHWmIQTxpxhKplvNe+JPlcn1cmc1Ty
	O3WRp0sNkj2o8IzqhoJoAjWd+fL30tG+xpwjrjbUFi3lHR3MRJFYLuS3ydH4CtqvXi9CTl7lksrxb
	kE95BoobNc4WATluJMWAbzAfpgMM2YNdMs3XH1sr+TsSz3NFDOzXkHcj1a0YEXWFTaZ/Iw7BZlEZE
	TTQUCzLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncsT-00000001jeb-0ejn;
	Mon, 09 Sep 2024 11:48:17 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sncq5-00000001jHo-1F9l
	for linux-riscv@lists.infradead.org;
	Mon, 09 Sep 2024 11:46:49 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a8d2b4a5bf1so211175566b.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Sep 2024 04:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725882347; x=1726487147; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XnU5oqdkva6JlXDEjEVyReSI87QguVXWZ6VnCHwOk0Q=;
        b=j7agt7cZkXcaAVVVop33K1mEcmWjMEIgtIZpEoe9TuP8nI0M5Uow6+4ekC2k6I0YXK
         LCqu0d0ba7sLelIgoa4uF6exhFuYK37UNkPvboqMOH2e3zn55UG+lC+Iqp5a87HBJCYZ
         iwhYWAF2XfOa/pa8MjZeOhH/KEgBxlFBTYxgRPPBWlqsg/ejGzsMgjw6zWyBaB55CW7I
         UN2qNTU54kz7vUYbTVNEqUkHUngqY9UG/2RGYB5OXBce0cOmhzTAEqYkeoRxfXnL/IHA
         R7IjoW1amVjApWat89HpslM1VFYJVBz50/00OK62Qk9yEeH9Y75pNscIz91vrr507aVU
         4rBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725882347; x=1726487147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnU5oqdkva6JlXDEjEVyReSI87QguVXWZ6VnCHwOk0Q=;
        b=tcq4zuQI1u85mjofPeiMBE0qdvIt6Z1T371CQpG9wdxfpUYBkOD5whry//rHlcy3t7
         fGXrECkSGnQ2FRCJn7cswFj0Ou5RBGSVhh8qOxQHC0V5Reix4sYmbd2xgBZkVGLEIr4B
         xEkUwlQ+adyYHY090aaIcjTtqm8AQg+mAP/HXbNJABhDFYnMluY8jKvyn/fEaMuz+4VB
         duQdPTLYLb1Oh95/MSw8Jyhico1jKUhK/11sr9dG5yQ9pkppPaCy6j+fAaZ9Z7GTfOIN
         LsHBlBHxIGMuuLe9MqUePP5g4wsFMHD0iXAsVUk9r8ckTr32xjUDLCW8bXLWrXOj81/F
         Mnig==
X-Forwarded-Encrypted: i=1; AJvYcCUakCEugCvoKsXlTM1CeePdaThB1d22raWC/nnlfKRXXa7XkYi+HI5Vip/Nhleka3DvrG/LR3MmLq6oVA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzZO1Mbv93K6qNhoIfMucuZLQb5WM4t7Kyh+zcFeIgWgSW/9oCJ
	xXAufqi61jfDU9yKQ6XI8hZOottMnNk5Zb1sTR5HdiWp1hLgBLaPHLoSrBDmQ1Q=
X-Google-Smtp-Source: AGHT+IF9sTxIuBaRpoPL61TxnkmP8Dx/HI/SPewkxhF7tomJE/hxctaNQ5MCjtCSQzuNxgnZLZHgnA==
X-Received: by 2002:a17:907:6ea3:b0:a8d:29b7:ecfd with SMTP id a640c23a62f3a-a8d29b7ef71mr484389166b.54.1725882347134;
        Mon, 09 Sep 2024 04:45:47 -0700 (PDT)
Received: from localhost ([2a02:8071:b783:6940:d821:d81a:d0ad:70b8])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d64880sm326216766b.219.2024.09.09.04.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 04:45:46 -0700 (PDT)
Date: Mon, 9 Sep 2024 13:45:44 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, Chen Wang <unicornxw@gmail.com>, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, inochiama@outlook.com, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-riscv@lists.infradead.org, chao.wei@sophgo.com, haijiao.liu@sophgo.com, 
	xiaoguang.xing@sophgo.com, chunzhi.lin@sophgo.com
Subject: Re: [PATCH 2/2] pwm: sophgo: add driver for Sophgo SG2042 PWM
Message-ID: <qcpqwvffln3cb5lxnhwarmeawiudurc4v35rqz7jo6xo2es5bi@2q4e4f4zn2vu>
References: <3985690b29340982a45314bdcc914c554621e909.1725536870.git.unicorn_wang@outlook.com>
 <202409080100.h6lX5Asm-lkp@intel.com>
 <MA0P287MB28225ECCF1D263A20917AD5DFE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
 <CAMuHMdXOAmCsdcvdo41qD9f4L=K2uZa6nJN7D5YOTTuCnBHtWA@mail.gmail.com>
 <MA0P287MB2822B10767514B3E04E8E468FE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB2822B10767514B3E04E8E468FE992@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240909_044549_362782_B2C6A091 
X-CRM114-Status: GOOD (  14.42  )
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
Content-Type: multipart/mixed; boundary="===============5324104354906766455=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5324104354906766455==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4hri66l74asgozqa"
Content-Disposition: inline


--4hri66l74asgozqa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Chen,

On Mon, Sep 09, 2024 at 05:08:41PM +0800, Chen Wang wrote:
> On 2024/9/9 16:45, Geert Uytterhoeven wrote:
> > On Mon, Sep 9, 2024 at 10:26=E2=80=AFAM Chen Wang <unicorn_wang@outlook=
=2Ecom> wrote:
> > > I wonder why CONFIG_PWM_SOPHGO_SG2042 is enabeld for m68k? Please rem=
ove
> > > this.
> > Because it depends on ARCH_SOPHGO || COMPILE_TEST.
> > So it can be enabled on all architectures when compile-testing.
> Thanks, it's really a potential defect when CONFIG_OF is not set, will fix
> this in next version.

BTW, the right approach to fix that is to not use of_match_ptr when
initializing pwm_sg2042_driver.driver.of_match_table.

Best regards
Uwe

--4hri66l74asgozqa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbe3+YACgkQj4D7WH0S
/k5YAAf/ZNKh4xi7R1WSFPG/Wv0vzAzDccHjA9P4I1+bCKuQFR8gnOzEyDCfd6Mw
dz6nqq522U9d7SpAwlpdUfp3p/NTEoZHTz3jgSc99VVNSkNWdSVn3DJJ9vM9UnPn
RmAK5y9c9uvxy18E5icgMK8e5wQOgbnJwlilxiCnAavoLlgayhXbGemxdjXvLrjA
VDCXxjjE7AxENa3iGYOZ/PmeGohtXgnhEEaYGqqcS5m9WR0B4vgowVRofEl7THDi
PMv6kHAzGbZMAfZzdRxRwTZC5i3zXlPcS3asABsYaOtZOTYxiCShltzDqHmuGDP/
pVevymnhHrTE4Ec458orVY3Km/JA1Q==
=gCpB
-----END PGP SIGNATURE-----

--4hri66l74asgozqa--


--===============5324104354906766455==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5324104354906766455==--

