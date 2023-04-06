Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 751BEC7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 13:18:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nUB7nvyplYUv76w0fxFFsCXTqY1IxN/7gctimniYda0=; b=dBl8yURR/ue0iWG9PUCnHZ+uA0
	A1dv63Wv/zRtEdVLFGzHd2fmYyjz19kdbqjTGpCd0NSDCLt+vrqZJ8X5tqQ2l057uwxypyguS9Rm0
	Taau+AvrnGsWQa/pkPsTim/L/V6yO+Yn+PPkxqRg6GrOn5nC5if9DNc3xD7K8KMQw+bFnQSd+I+WG
	V4XIJlRA0xqMbUrULjUIWp+8N63zzEk+jGVlS+RNTkCDVD9CSpvWz4eDFynB0V4+CgPhXxd2xGkym
	0G1Dd1NbBME9qvdYMMyoiwTIHXvzZNqmq8finsqd7hSBXDSRJRB8u4SYSNVWcdV6DOh+wBz3NdPo0
	9YWIxECQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPUv-007NVg-1G;
	Thu, 06 Apr 2023 13:17:53 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkPUt-007NU6-0i
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 13:17:52 +0000
Received: by mail-ej1-x630.google.com with SMTP id by26so1317316ejb.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Apr 2023 06:17:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680787067;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=STr5mxs5RV8iRWYSKMYXPKQ2lS+5JB8QNOUcHMFXDhg=;
        b=J0GukvVKQKRfWam4GDIa7AfSUSXlSx3aj45N/SAND/dvPAxwVAlFeFn2k28YiHfkwP
         spfCWsHjznApqj/UliTjMlL+bRH1jLAVUzqXtvdV0pee3/lpqmV+JeJBTUB32Uq6NdjJ
         KQK0RUoVpKiYU6mfPBQDLUfRXHpqdwP7YXyxoFL7JPSUESBvn0znThSEzdce6mGy2K98
         gCfVsO8+df6d3PAKrBYMcCgO2u3l7iCTJIjObhqeFteUR0REK80WSwCxLNP4GsIUWpzt
         7qgKXtRxJBN7l65z4OFtVFRSAfMsRFgbDxdElCyah+2aBMU+GljKW3sWQmklaNkgDCmF
         86Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680787067;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=STr5mxs5RV8iRWYSKMYXPKQ2lS+5JB8QNOUcHMFXDhg=;
        b=LSZuL2qVBsaCSn4YH4GqjCLrnO0uTO3qwWvQ9gjQhKC6YeenNPfPfbRcg4QzEDE0gS
         DlneDhze1518n3krCIzQYKG2Fw76Y62ssW74XvQh4+3yTKIOevBq5maxpLPmBIuNCS4G
         BHYhGh8cCnehBzew8gj3stesNX8QkretGJNJLBdRlBXAVp/t04d7t5t2LchTuZ5H+Sa5
         jqmBGA7RE/oqY+E49DBK1D0lmu5+Xd2XamznO5XFakVD/z+r57CYTTBRSyoyQBNwhsqL
         WzG9Fw66DU6nbE/wMgjIHSQNLQs6fATe+OQkJRsPJxOCrdmcQ1Yx+FlnVzgy/mgnb0h9
         kgWQ==
X-Gm-Message-State: AAQBX9dWEwXCjW8Q4BRII02suF/anlDzClks/MXdkHBqIG2WmxtWBrRy
	ffnslOOhHM2hD12DrWUg4QA=
X-Google-Smtp-Source: AKy350bbvL1i4GaljnmJb41yDPBIEPV2YrW8ha8fibxihrWLjWZ5ntbsQc1zFCPggGlhE02B0G4M6Q==
X-Received: by 2002:a17:906:1c49:b0:935:1565:d661 with SMTP id l9-20020a1709061c4900b009351565d661mr7225417ejg.66.1680787067367;
        Thu, 06 Apr 2023 06:17:47 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 16-20020a170906021000b00949691d3183sm807239ejd.36.2023.04.06.06.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 06:17:46 -0700 (PDT)
Date: Thu, 6 Apr 2023 15:17:45 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v15 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <ZC7GeXJbB9PAF0lb@orome>
References: <20230330071203.286972-1-conor.dooley@microchip.com>
 <20230330071203.286972-2-conor.dooley@microchip.com>
 <0b91dee7-6c1d-4a33-8235-8fd5d58b200e@spud>
MIME-Version: 1.0
In-Reply-To: <0b91dee7-6c1d-4a33-8235-8fd5d58b200e@spud>
User-Agent: Mutt/2.2.10 (2023-03-25)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_061751_273714_8CD31E43 
X-CRM114-Status: GOOD (  23.58  )
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
Content-Type: multipart/mixed; boundary="===============5522047341249857541=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5522047341249857541==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Wmv/6xuPkCm9WCnj"
Content-Disposition: inline


--Wmv/6xuPkCm9WCnj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 01, 2023 at 09:50:47PM +0100, Conor Dooley wrote:
> On Thu, Mar 30, 2023 at 08:12:03AM +0100, Conor Dooley wrote:
>=20
> > +	/*
> > +	 * Because 0xff is not a permitted value some error will seep into the
> > +	 * calculation of prescale as prescale grows. Specifically, this error
> > +	 * occurs where the remainder of the prescale calculation is less than
> > +	 * prescale.
> > +	 * For small values of prescale, only a handful of values will need
> > +	 * correction, but overall this applies to almost half of the valid
> > +	 * values for tmp.
> > +	 *
> > +	 * To keep the algorithm's decision making consistent, this case is
> > +	 * checked for and the simple solution is to, in these cases,
> > +	 * decrement prescale and check that the resulting value of period_st=
eps
> > +	 * is valid.
> > +	 *
> > +	 * period_steps can be computed from prescale:
> > +	 *                      period * clk_rate
> > +	 * period_steps =3D ----------------------------- - 1
> > +	 *                NSEC_PER_SEC * (prescale + 1)
> > +	 *
> > +	 */
> > +	if (tmp % (MCHPCOREPWM_PERIOD_STEPS_MAX + 1) < *prescale) {
>=20
> Hmm, looks like 32-bit doesn't like this modulus.
> I pushed things out for LKP to test before sending as I felt I'd not be
> allowed to do that operation, but got a build success email from it.
> I'm not sure why the mail wasn't sent as a reply to this, but
> <202304020410.A86IBNES-lkp@intel.com> complains:
> pwm-microchip-core.c:(.text+0x20a): undefined reference to `__aeabi_uldiv=
mod'
>=20
> I know that tmp < 65536 at this point, so if the general approach is
> fine, I can always cast it to a non 64-bit type without losing any
> information.

Since you already use some of the helpers from linux/math64.h, perhaps
you can use something like div_u64_rem() here?

Thierry

>=20
> > +		u16 smaller_prescale =3D *prescale - 1;
> > +
> > +		*period_steps =3D div_u64(tmp, smaller_prescale + 1) - 1;
> > +		if (*period_steps < 255) {
> > +			*prescale =3D smaller_prescale;
> > +
> > +			return 0;
> > +		}
> > +	}



--Wmv/6xuPkCm9WCnj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQuxnkACgkQ3SOs138+
s6FgvBAAv7hMz2KGQYKjhjDZiOF7EBFggWM0bmEOgVw8gCdcGbThvfvGS+VBsha1
6nP75xwxZIdn8mER/mAlqu2PXdaMFCzDCm75ZBBSZu9RFmAgdofBZey3Z+XQrcg8
REtkYo/szD9j9TmVmdZ2hO+zzmU+bu32/eb6KSnPKtDEIObymudlahac9stt+eI3
NOK7IMmPRLxVrKlQQ6tLXn45xd84STq1+gDLCVymKWpwD4zP+I9jOoDjsUtt/ip6
FoTg8uDeMSTWGuAcnsxZTG0pgexnOBDzeeI6l1Cq7Mv/q3dkFJpGvYL6OMOHGej9
rYu5RAIogdRq84FAeJKTfIKSxn5NGzod26NRbXr+nULTvaBx6WL6kLOrnGfgJlIP
1aNbzw+ITtG4ulJeoe5sXf7Ih5hy+trjPmxaAUqRCxn2i7IOZty+Uhb/BcBPec0R
TN9czr6YmBnyQ5SWjq0aqyJMEIfYQh0PK8tB/wbVZ5yjcsNt5cOQKoTe5lYSPPo4
5OsLIVOz8ZOv7iaYXOFIYm+Gnd4xocwxM2mKpvrCmpDWeNnE2+X5gWIsHxPOepSR
DJmnNadZShy4qAnAjNX8Ol6CBGM9ltCXWBpiD3Pqauc0IW0G/pJlw6ZmeS4ZWN24
Fj3dTjMi4PMMcbkuLNXDZvanVLJk0JvtBXauVHw1JB2KqEZ6nn4=
=EF8+
-----END PGP SIGNATURE-----

--Wmv/6xuPkCm9WCnj--


--===============5522047341249857541==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5522047341249857541==--

