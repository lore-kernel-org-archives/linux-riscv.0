Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5727ECD8CBD
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Nov 2025 18:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+rpVxfiW88ClykAcxfs701rKKcAsYG+KGNWM9bW5WWw=; b=ge97RzcfkTfIPKpvxOWT4v9+G4
	Fc+JsWxPlMv5S2Xg7och5W9LxTN8uuuzcneWxGP+yETKIb5KkbEwGx0RvXyTvpGSPaxgn9kpt5Mpc
	XzlotoUDeRoQpxJ2Qc9SIREZ6sJPusLM4u8MLomcnmjcIeSNKLkFyxoKa2itvP45Z5GzDtgCXRvuA
	4ISNxF1L5s71TY7OkqGAIhMTAnYIvuieyCfRWINkUuDRT6C6qOA2XppzqKRifWZJsz9vqz892mxB9
	q/QPMc8qVCAWLiBFFQysopRjoVY+4ux0ye8fFnsrJiOGnJU29zK394K8PV8V15T74ePJSll00iWZw
	0axzUDTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc7j-0000000Aw9e-3LXV;
	Thu, 13 Nov 2025 18:32:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJc7h-0000000Aw8u-1WDv
	for linux-riscv@lists.infradead.org;
	Thu, 13 Nov 2025 18:32:46 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-477619f8ae5so9082325e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Nov 2025 10:32:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763058763; x=1763663563; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=DgVaS9meF8soCexdGJXeDDuBijzdu/2XRCTDOtY+vMuOO26T5ZcPZ0UHTR2GKz6e/B
         /kO+klzmULKgV58DiC6mmCPpGGfIgUqhO6gHM8iVUDdGE0qav6sd9g0PFrt15if7rPn9
         k3orZrN4BXEbypW4W5zxTfTJfLXh8QWXjcf3A+th8U5MvUUV0A4kevxytFjID/Szw/H6
         V6NskOhkVT7Uu/BRL1+FleCVqhHDsyplptqgmLkp4coiTUo2irebBMKfVrxwjFdKD3s1
         THrlh0nuNg4TIIHzqgEAqkvQFPYERsmfYOnE6f1gUJZ/1wFdpP4KO0P1IPDqFbvitrFR
         +qCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763058763; x=1763663563;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v9yZQXqBch1JSJzcaQQctkjx9YKy3u8FyEyL/vNPgfc=;
        b=K6PcoxhNOjaSvgWodnhW/s+N/yCrhDv1h8UEzFxEejWDeHvTcT6lXwA3LH7JbbNx+N
         2Acd3LyPi0q00QZvlFXJOru6v2XrlinNnoXuyeTHYoLFj8VBVxDUl8nUIjKx3a1ctI2q
         mloUqGNSnanUAfVO4dL2Xnzf4HBcEoDoLh+fypG0wXJyI8cbBYLwR7I6PSBEbNB4T4vB
         ujjRaEvDeyiDAv3bKfgMegWoVgz3wzOQ2obvXzu60o7gWZfwCdwqarbyJ64MnCXb1HtP
         EERziDGyRD2TuOnV2gylZ6p47LDJw28BPRDtkrM2vLXtHmCfiWhQM6lSh3iFe3G+SEbN
         qCQA==
X-Forwarded-Encrypted: i=1; AJvYcCVw/YToCsbheOzdaQfplEbe8+3DwlMSoEl5dt4wCSRO0D5VoAybOIASykETSZqX7j7EIAFYqFYITnmU4g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPnFg4rb+slDSJU6F+ZUrOQ9UJLIZc/lkSXKwwjcP1W8RWaBaX
	DEXwiobbsgtL+F9Ccz5Cuvr7iKi1wtadJoIXlVbxzZWPv2OZq6e+XsgL
X-Gm-Gg: ASbGncv9lt6u8xZuyRlI5pU35UM+5KS8EpIJUgQsQ78wv8wWkbh5kZiEkuF7fRFte9p
	YgcLIBTgT0TzdFZRSwNiV41BCXWYHihJxv7sAkr+pMdZEOJPj9bLPsjhl/tEfW39wiOj/w7D7M0
	m5Dwp1xga2nYzpsnpRKW89cr5zkDt9/3VjEYjXDmoDfZgrawtFna+m1F+6AjeVTf5jZ3kPHsu/s
	3JERoA5HozhiwoXwVrOuS1OpvtwF7UR9+Qm+FOItcV1BM1uu1/jWyzMqX1Q2lhUU7/Q6/yitSPz
	ZzxGsTRqnRCSBi752I8vQ4689gtr4z9yHmvZO2kHQrA7ANl8b6tbS3kjz0swOLeyJzOHMR/UlEu
	x3/ql3Br23kkqcXXkPy5phDEa5aPatrpKglFiaKlXfi6d/RXYNTDvascDmkeeYrnenmRpwi3rUx
	qpw1ZYTkji7C3uB3/OsykQQXEqX0njSVsBbsldTCj37A4kqZ4njeKrsNOWmgCPuww7LMg+0XX4k
	w==
X-Google-Smtp-Source: AGHT+IEUOfl9Mj/MhDnCs6vXeSUiBJWe5OA5hhf/B85epyvDSKEXz8FsTxq8lGXRcYwvA52KNvjEqA==
X-Received: by 2002:a05:600c:3b12:b0:477:67ca:cdbb with SMTP id 5b1f17b1804b1-4778febd327mr4653575e9.36.1763058762895;
        Thu, 13 Nov 2025 10:32:42 -0800 (PST)
Received: from orome (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4778c88bee1sm63595835e9.11.2025.11.13.10.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 10:32:40 -0800 (PST)
Date: Thu, 13 Nov 2025 19:32:38 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
Message-ID: <2tx3o5es77oa37zqvikcoo6n2ryxvepa54ezsaawcjdbf3g3wp@o2dbcbskjksk>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
 <20251029163336.2785270-2-thierry.reding@gmail.com>
 <CAJZ5v0igMJ12KoYCmrWauvOfdxaNP5-XVKoSxUroaKFN7S-rTQ@mail.gmail.com>
 <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
MIME-Version: 1.0
In-Reply-To: <3dzha4qyqdrbutxby3n5nkvihnxrhniqr6w726eumhzgln2w5l@fbu72mzmjz4m>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_103245_420798_9F313823 
X-CRM114-Status: GOOD (  26.07  )
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
Content-Type: multipart/mixed; boundary="===============4964969565464214827=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4964969565464214827==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7axrx4sqgqvkj2b7"
Content-Disposition: inline


--7axrx4sqgqvkj2b7
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3 1/7] syscore: Pass context data to callbacks
MIME-Version: 1.0

On Wed, Nov 05, 2025 at 05:52:01PM +0100, Thierry Reding wrote:
> On Mon, Nov 03, 2025 at 05:18:08PM +0100, Rafael J. Wysocki wrote:
> > On Wed, Oct 29, 2025 at 5:33=E2=80=AFPM Thierry Reding <thierry.reding@=
gmail.com> wrote:
> > >
> > > From: Thierry Reding <treding@nvidia.com>
> > >
> > > Several drivers can benefit from registering per-instance data along
> > > with the syscore operations. To achieve this, move the modifiable fie=
lds
> > > out of the syscore_ops structure and into a separate struct syscore t=
hat
> > > can be registered with the framework. Add a void * driver data field =
for
> > > drivers to store contextual data that will be passed to the syscore o=
ps.
> > >
> > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> >=20
> > This change is fine with me, so I can apply it unless somebody has any
> > specific heartburn related to it (Greg?), but in case you want to
> > route it differently
> >=20
> > Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>=20
> I have a few follow-up patches for the Tegra PMC driver that depend on
> this. 6.19 is what I was targetting, so if we could put this into a
> stable branch that'd be the best solution. I can set that up via the
> Tegra tree if you and Greg are okay with it.
>=20
> If that's all too complicated, I can probably wait until the next cycle
> to merge the PMC changes.

I've added this single patch to a branch based off of v6.18-rc1 that I
plan to feed into linux-next so it can get some broader exposure.

I can keep that branch stable so it can go through multiple trees if
needed. If anyone's interested, the branch is here:

	https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git/log/?h=3Df=
or-6.19/syscore

Thierry

--7axrx4sqgqvkj2b7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkWJEYACgkQ3SOs138+
s6GbLQ/+LcY0n50MLCzG6P3cLlbnizYWB4fd77qBH6YbB2iRPf1TPkFtC1s24QiA
KgZqLzCkJ5rw0Xtvmtzci4gr3GeqsMf/4DM0k3X5WdN/DMat0RTe1rhVuxq0MmGV
7kmy+iB9FW6MgVt4kjeYdEL94ohEKXEUKTS6HTGfPFsonbJjnZdIsv4GVThClyxW
Y3vE0mnoAvxjqtVu57jc/Ihryv5Zz6pYiX9AWhT1ryTG7tmgKuFWW0YgqkFy/Y9O
rneSUrPJCeOBzjgL5oY6mPqTCl5f0VdGMb9S18RK+DKXSCLW7b0nGt4CCN7sEuOo
7Dy1UuUjok1XLs8NYPQ7oDD29Q536WmrUmQMjMm0R3HuqmmD+PDO0/I9QA2cuOvw
V1zUm+XqIlAyZs4lZkJXotqlCEBkPNCv0iIqEraETrCS1RYi/k0eqPF3Yu3oQc5p
58cnaEW28DaJ9+Cy7T4NCu7lsDzDyyL+5n4HQyWGaFkVYU+Wkfh0H1ezo8bP9txU
/Yan3s21OGdjzLMcCT0abiDrFOdN9N6HGOI2/UHnz87jxubwy7HjZ52Fkz3iGATD
uz1HyHzrIav2FWTN0PkENUQpiTQIHTs0znDBKPpTvDkeVbTF5nQuP2S0+bUGxvLR
BBevVnm7dT2dD5WqJbGfhem+DFPn66JVA5SFq9+/bvG0KsOpwpA=
=Jfb5
-----END PGP SIGNATURE-----

--7axrx4sqgqvkj2b7--


--===============4964969565464214827==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4964969565464214827==--

