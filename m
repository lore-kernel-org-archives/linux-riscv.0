Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38C8CC36010
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Mar 2025 10:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cd7Yza9Z/mWmvDevpffNIa2pHrftdCZNFnExH6XzIj0=; b=RZ05/cHLqvT00qmKMet6nAnkpP
	/qhVeQB5zpgwQ47Lpkm+Hw6AwKq5fdECpug0jEwx2yeaRSVzar8jxR8G2JRPlEjhnRLvK7vhggjP4
	hoYl8Adg2aB//dludBdcw6WiXP8/WvgL/qO+8KUddDfpPrP+pgZ9jC8aCDP7eYkFqHAQ9aa0KKlRe
	SmOl+ZLLy1ZGJDTm5lTs4AYEMlLq0iv1oncq4je2t3qFWun9caqj7kE9UjVaTCdFCiOnDvTid9pyF
	0itud3e7hP9yEoVQndtd0YyhNgzNroxmLVSluffqBuWB/fD6f8hmGAnEi3iNZS5osKpkkhy4IpJ+o
	puQ2Uo4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty727-0000000D927-1HCK;
	Fri, 28 Mar 2025 10:33:51 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1ty6w4-0000000D86Q-1BI7
	for linux-riscv@lists.infradead.org;
	Fri, 28 Mar 2025 10:27:38 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso1131593f8f.2
        for <linux-riscv@lists.infradead.org>; Fri, 28 Mar 2025 03:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743157654; x=1743762454; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Eax7YxGwWpnNu4N9Cuk0JD950DXdwRHhk8wiSiixGbg=;
        b=tAXc9Ir5CSTUnlk2Hr+oLDWre583yUPTPR8nkVULyX8+eyR9TxZlLgdsXJ8Tje4F1S
         tX50l3CELAYuXRoTPM1S/EdMtQPKG/gK5XV2BiKZAnU79lIK4o6NBRRfK97SlBLr62av
         jvl5XGblzhSr5QytHOYJrw4Xa+7YIJ+gwCvkywtn5I6JWagqwJK9j1qRJTAbK/2lYDmN
         C1MdUJlXBUJ3zVfDumh9itIUUyv6sOWuju8AqedyFR+xz4Hj9pSmy4ASwVhqOgfAY1IF
         t9y3FPtwLP1N/fUu8mPChyH6InKJcPNDy8smGfFQUjoB2YhZ5WhimDagLrPo1fQa94uz
         ZNqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743157654; x=1743762454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eax7YxGwWpnNu4N9Cuk0JD950DXdwRHhk8wiSiixGbg=;
        b=T9bVuCwGVO1xzBWgmImkrNKK3YNeMNHWXYP9jmFW7M9tPDfe78ApnV2+CjNXvS9Y57
         aId74XeY1cO8tz7TfXU+c83foGJvRv8zu6VUCWb+/nHkuca/P3JNsD3y6JbMuXF4Iyh9
         OUreb9rN/9oDWMPcc8o9Qyyd49u0R/TIDloMPmJs8pVRso9oSiIuamAg4GzW5KTAH84t
         /KgVAqwyLg9+tDYV3sXQfrCXtHlYk03fNr+v4ijqKC2sniVI22xBhz1I6BKShbNsTWx7
         EC06HzTybHxxzWEUjjs5mn0Covhb2ZvrnCm0d/6kZOexfXW49lQJbEYYlogAlfm2u9og
         93SA==
X-Forwarded-Encrypted: i=1; AJvYcCUynbADiCaHfr3kWMhRi2ngzRPKDRVKQ23YqFb6WvFLdo/6g1LgbRAsUW+ypAVEW9q+GJYmG4pvV+/9Fg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyQoNM2Te8ap+oSO6o31qT3mSWaXrQ2S9lQLVv2HqCGzwrczCU
	FevOhksYJevFSk2gU/hkZOtaXdNDdFJr8GAoHQGMHBy5cMyU3HhsOsDjvr5dRY0=
X-Gm-Gg: ASbGncsxXwGUe6MaCoZJEVbKw0+I9z9/tU4VJm3IwQQ4w+dsZe/ldE5kfyiLdI8kzvg
	WS4p/qvqR8tRppupALB15rPgOJHNu45M7kAAMw8wWuCZK//AlyvTUq6YULr/rRcpv3IsDFxK5Hs
	+oyUiDji2FoNnz3OPP/y2kWESeTqyU74CaxI6QAoRBIdeT3HLMtpy5VcV05/tD01pT34TOYxzHz
	TRd1YB3i0jg2PLuzI0ZiArsvNVThaTATR1ZXc8StDww0PEolJKfUOva1BEYBKNC3UEfRj2jGnFU
	/5IKWBsCk2zT2UPxaD5j10GuoGHR57Z3b3Psv/FLDm93m+gViHPt55ViyZKlxyMtTbGxQGR4FGO
	orz5BNM+aM7Q=
X-Google-Smtp-Source: AGHT+IEKgI3nQYHCH8DidEWqf2UoGJFR4wRiYpFWDfNslXOnE0ABJu9zI68fN3BS8uzY8lwCUjes4A==
X-Received: by 2002:a05:6000:4284:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-39ad1749aa3mr6077097f8f.19.1743157653814;
        Fri, 28 Mar 2025 03:27:33 -0700 (PDT)
Received: from localhost (p200300f65f14610400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f14:6104::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c0b6588d0sm2148585f8f.7.2025.03.28.03.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:27:33 -0700 (PDT)
Date: Fri, 28 Mar 2025 11:27:31 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Samuel Holland <samuel.holland@sifive.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
Message-ID: <ktmanz3mufxvme3gspm46p7vyjxsmzfxckqxg2e5a2mbqc5pxe@uc56iqoryuzr>
References: <20241224093902.1632627-1-nylon.chen@sifive.com>
 <zqkx7cx5nalslfmxeoxdnsjbvrvzajrjybsmsyeyc65a64sntr@gpc5qp6aoyp7>
 <CAHh=Yk_j1ZnJ+=XQ_geN1sXMaye=P4jk-vduwj0-1soM7d+wQw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk_j1ZnJ+=XQ_geN1sXMaye=P4jk-vduwj0-1soM7d+wQw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_032736_326083_1C35DA56 
X-CRM114-Status: GOOD (  21.90  )
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
Content-Type: multipart/mixed; boundary="===============6144035519940189598=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6144035519940189598==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c2otz6rwcboba37k"
Content-Disposition: inline


--c2otz6rwcboba37k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v10 0/3] Change PWM-controlled LED pin active mode and
 algorithm
MIME-Version: 1.0

On Fri, Mar 28, 2025 at 05:41:37PM +0800, Nylon Chen wrote:
>  * (T) period.
> > > The `frac` variable is pulse "inactive" time so we need to invert it.
> >
> > I'm trying to understand that. You're saying that the PWMCMP register
> > holds the inactive time. Looking at the logic diagram (Figure 29) of
> > "SiFive FU740-C000 Manual v1p6" that is because pwms is feed into the
> > comparator after going through that XNOR where the lower input is always
> > 0 (as pwmcmpXcenter is always 0) and so effectively counts backwards,
> > right?
> > In that case the sentence "The output of each comparator is high
> > whenever the value of pwms is greater than or equal to the corresponding
> > pwmcmpX." from the description of the Compare Registers is wrong.
> >
> Hi Uwe, I've contacted the spec's author, and he is willing to correct
> the spec-related error.
>=20
> Based on your suggestions, I think we have two approaches
> 1. First add comments explaining where the spec and implementation
> don't match, then after the spec is corrected, submit another patch to
> remove the comments
> 2. No need to add this error explanation part, because the spec will
> be corrected later.
>=20
> I don't have a preference, so I wanted to check with you - do you lean
> more toward option 1 or option 2

I would go for 1, mentioning the version of the broken documenatation
and the expectation that this will be fixed in later revisions. So there
is no confusion when the documenatation is fixed but the comments not
removed yet.

Best regards
Uwe

--c2otz6rwcboba37k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmfmeZEACgkQj4D7WH0S
/k44egf+LuxtxM7lTyagceD7gOIIrg8b15gWwsEr7jfLegP4q6GIa2Y25I+zqTqA
AdjCfRboH1x1fp8tD2TIsb/fE4lZa0ywNQSCr3UVyW3CUSrjGCDxB0NuqxI5oaGb
8mP+9Doa3A4UgYviPaeBxrK5pN5yPOJwigwyPzADtwMi/u18bn38sRDlGmRfQAbp
AzzpywbZHJIhcBXCDM6j5bhsQD0jWiQM7/YBkHF1Ftiwx87wNmcOJGR8o9C0LKDG
xfad+UWIz0nVJiGXxnFyeG6+quS7uUglSv0mvtLseWlh7pQ17MLVQkmnRILaESYy
Ginzw97MvNyFjEns8lQWRr/yidY+rQ==
=uVv6
-----END PGP SIGNATURE-----

--c2otz6rwcboba37k--


--===============6144035519940189598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6144035519940189598==--

