Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63AD9C02182
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Jan 2025 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q1K6ZCkrA4cfX5ilU+ZON2NmmIPC2wl977O6K/UP+6A=; b=m5nXrOU7yDsb9t447d0IzWHADU
	WYBANaVSq/N8FAic1OBjsoYxDHpYf5bvze0Q2lnnhkoJk1RL5Btpnv6LmTZE90ZCtYK+S7ycW6h00
	jacGyMx80m+rWiqysaYpXbCPBPoGqQ87nWjy0ly8UMNPdFaGBdbk/IYOdvlbv8VmU8E52Nk7bbm4F
	kOYllu7ttE1w1V486ZxL9tFaDQSPLJx2ZralFwayrjdpFJ7Yy0dPDY0yzmPuLVV+KacGqcl7YZNrg
	na4Ev15eNQ3uzRkwBfLv84easAliXK5k81gGTGe2Z/3yU1MWZRVF79NfoL/652FjIMi096ePrdZdJ
	R66p4XTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taIl1-00000008ZT4-1L5S;
	Tue, 21 Jan 2025 18:13:47 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taIjW-00000008ZEM-0w97
	for linux-riscv@lists.infradead.org;
	Tue, 21 Jan 2025 18:12:16 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-386329da1d9so3325755f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 21 Jan 2025 10:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737483132; x=1738087932; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2ATWl2w60Z+sGkeI0mcnx/4T0KHdRkIjZ8D4tZCsI0Y=;
        b=JNNcUQpqZDoouxiWxvYR5Ewi9l639c+216O6MKaIi1Tx8bb9pqZmhfZ+YAHoZu72J0
         Zzr395sdmrDTK6z+WgPhhn1L3dl0Zd9oULd3b1J3rJctHTA8jlBEgf0phwl5pCiNscQ1
         nel83JHjOteUPiARFjeDF6JTF/iABnoeex6v01mDA9Eb8+lIJ8a+fllNB7Q3YZHwk7FD
         qGUF89JRvgMhUZDKW7WOEHMcpSmqJNK1jAo0K04Gap1hbiAGY2sxFaISLzrj0/CDN7ZP
         3nZVgH5dXhCrdSqOhE9xhK3flTJQTkTQXFXwZmJc+yY+COrmHwX4ztkPQ91oU/GXWQQm
         /Vdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737483132; x=1738087932;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2ATWl2w60Z+sGkeI0mcnx/4T0KHdRkIjZ8D4tZCsI0Y=;
        b=I+JWN952/IR4RkfSFcfn6Qk3HT92UWYMsyL3TWFM3IwQnRibFCkSB2fAXIJEOiGDka
         +cOHwRF0giz2s/nXyNjL4gDfoidRQAPIV5avLh321V/CklIVn8ZLBmE8xD27kAKqhPjp
         J9BvYmxnmBz7OJFc2xoiH4aD1aR+WR5MuDwPA8L6qTwvHuBE2TnBicuCE8fQXfMera/W
         kq2JSkki0wte/5+7URTCl0514r2+0za91mpH3LTnH8GyGCzZlLDA1aqZqqvrmyTEa0yd
         KBZedylSOpR2rFQsRA5dih2Y25XJ6CKbPgD543uC7ah72sMdkoOzlxAu/DY3F+D3R1Pu
         rw3w==
X-Forwarded-Encrypted: i=1; AJvYcCUSJh1SI6zsWus+l/LnFA4tjhPW5ixUVrmmTZl4kokU1h2q805wnQBD3HEnPqTgINNdcQXFtuOMiXZzkw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxG8Kvve8gpzCyj4sdd4Sa8b7m89O4xtjr0/PrcpsM54sbx/+Ly
	ViW9X/sb4VoSQ+O6pkAsU4e8/tZUxpEkuIkkhORQ5G7hqNBOGdtSbF7/DTUmaJM=
X-Gm-Gg: ASbGnct0UZ6eE93gvAfLAKttOTgwWQSYIvjdsHx1qXl8TcfPLVehiHT+nIQV8JpNj7D
	xW1Sf1rg5tJBqHapcTUaF3afI0SpodfpblWsfuPLka50lIeUNC8xX8dpn0nNeh+Dc87lIO4TXPg
	us2PeP1e3sb42TcjXxfcyQh77UH8G2e0t406M9Fca5CY+e5pkskd14JKXCuje0TV5KY4w2SSo0X
	LG1qA7OsWQ8Diy9E2kB13jJnz4NvLLhW+kkogBH2sSeV0S6jYxbtdQ4Oh10/8BBB265ltKOK6i1
	GieJAburq/Lk/9CuY0rAoH5nAyGkt4mNBpTp
X-Google-Smtp-Source: AGHT+IEjt4N7MJCEhKaZiHurWidGu495CgMG2Na/7KPIXm7oitJAqBfxZ0jP9XuVkrg802ep53//rQ==
X-Received: by 2002:a5d:6c6f:0:b0:385:f3fb:46aa with SMTP id ffacd0b85a97d-38bf57a91acmr17612253f8f.43.1737483132532;
        Tue, 21 Jan 2025 10:12:12 -0800 (PST)
Received: from localhost (p200300f65f0afb0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f0a:fb04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf321537dsm14275228f8f.13.2025.01.21.10.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 10:12:12 -0800 (PST)
Date: Tue, 21 Jan 2025 19:12:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <7bcnckef23w6g47ll5l3bktygedrcfvr7fk3qjuq2swtoffhec@zs4w4tuh6qvm>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk-_0rKB=FG6Voif2MDjtRxzUA5vXDP2J-o5=8ru1ewt0w@mail.gmail.com>
 <CAHh=Yk-TosOmwEughfK9mMx-=DgzWK5H_bf6H641SGh1ue8BrA@mail.gmail.com>
 <zneb3qwgf52zitcbq4wz76shnmhwfkabbsts3sussjpc5s5tsz@uneaxdfp4m2f>
 <CAHh=Yk_oTdURhkna_saF6mrA9gDY=+v_j5NoY_7jTDLuZ=EXtg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk_oTdURhkna_saF6mrA9gDY=+v_j5NoY_7jTDLuZ=EXtg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_101214_263761_81D91CB1 
X-CRM114-Status: GOOD (  17.95  )
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
Content-Type: multipart/mixed; boundary="===============3204147665256856109=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3204147665256856109==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5j2h6qzt3k55kxw2"
Content-Disposition: inline


--5j2h6qzt3k55kxw2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

On Tue, Jan 21, 2025 at 04:47:46PM +0800, Nylon Chen wrote:
> Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> =E6=96=BC 2025=E5=B9=
=B41=E6=9C=8821=E6=97=A5 =E9=80=B1=E4=BA=8C =E4=B8=8B=E5=8D=883:47=E5=AF=AB=
=E9=81=93=EF=BC=9A
> >
> > Hello,
> >
> > On Sun, Jan 19, 2025 at 03:03:16PM +0800, Nylon Chen wrote:
> > > I ran some basic tests by changing the period and duty cycle in both
> > > decreasing and increasing sequences (see the script below).
> >
> > What is clk_get_rate(ddata->clk) for you?
> 130 MHz

OK, so the possible period lengths are

	(1 << (16 + scale)) / (130 MHz)

for scale in [0, .. 15], right? That's

	2^scale * 504123.07692307694 ns

So testing period in the range between 5000 ns and 15000 ns isn't
sensible? Did I get something wrong? If the above is right, switching
between period=3D1008246 ns and 1008247 ns is likely to trigger a
warning.

Maybe also something like

diff --git a/drivers/pwm/core.c b/drivers/pwm/core.c
index 7e863c2cd44b..6c82aca84472 100644
--- a/drivers/pwm/core.c
+++ b/drivers/pwm/core.c
@@ -2247,9 +2247,10 @@ static void pwm_dbg_show(struct pwm_chip *chip, stru=
ct seq_file *s)
=20
 	for (i =3D 0; i < chip->npwm; i++) {
 		struct pwm_device *pwm =3D &chip->pwms[i];
-		struct pwm_state state;
+		struct pwm_state state, hwstate;
=20
 		pwm_get_state(pwm, &state);
+		pwm_get_state_hw(pwm, &hwstate);
=20
 		seq_printf(s, " pwm-%-3d (%-20.20s):", i, pwm->label);
=20
@@ -2259,8 +2260,8 @@ static void pwm_dbg_show(struct pwm_chip *chip, struc=
t seq_file *s)
 		if (state.enabled)
 			seq_puts(s, " enabled");
=20
-		seq_printf(s, " period: %llu ns", state.period);
-		seq_printf(s, " duty: %llu ns", state.duty_cycle);
+		seq_printf(s, " period: %llu (%llu) ns", state.period, hwstate.period);
+		seq_printf(s, " duty: %llu (%llu) ns", state.duty_cycle, hwstate.duty_cy=
cle);
 		seq_printf(s, " polarity: %s",
 			   state.polarity ? "inverse" : "normal");
=20

is useful for debugging to see what is actually implemented for a given
request.

Having said that, I don't like struct pwm_sifive_ddata::real_period and
pwm_sifive_ddata::approx_period. These complicate the calculation and
=2Eget_state should better calculate the period instead of just sticking
to ddata->real_period.

Best regards
Uwe

--5j2h6qzt3k55kxw2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmeP43gACgkQj4D7WH0S
/k5jDwf/Z8ZyPbdZfE5yI1ZGDLTJiKlqXt2/IGKvjygXoU5XWSqpR+NzbQOOBVOG
shlMIS3QeyzfpmSnM+/sSIoFViagCMioQjmkSIBzr2Eg/vsaHGzm3YhuLL9UQNC7
Cz7N1NgR77RWyRYmVXBnrYpOhJ6TZkGo0cyFOANh5geMBJmT+MBCnzTSRLqux0rf
Yqe8N4Xpg3KEpzbM9W0QflCOlvmpL+cgy9a/omhpb4hdn407p52Ce9UYHs+V9OfK
Fy9PKP7KzcwKPOBH2eXosK6ifpAOAxmCQrWSkKsyO8oqZDR89jancE7VMKEvqeNd
uYSjdmRNxlJgFtRL2P/w7KCoRysVoA==
=hiTK
-----END PGP SIGNATURE-----

--5j2h6qzt3k55kxw2--


--===============3204147665256856109==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3204147665256856109==--

