Return-Path: <SRS0=k7QB=MW=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA788C43441
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:47:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8347A20870
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 10 Oct 2018 13:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="t9OB6rJZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSWEN3Xw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8347A20870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pZBWIz3njyBRucuCt/YQK80cO0pz3f35tBhelKKwbTk=; b=t9OB6rJZhHwENayCwpMjJP+5l
	Cd+9XI3msLdltVjHwGTz5IEP0emXebU7CnJwgRAfxydAJ4pz8ECtJyX+ePmtbIY8cah7zHX0olGuS
	Pm5JU39hoymvWzvxHbMttUj7tG0wgOxiIjfA4PfSJHRN2BclDbqD/5yldKzYo6Eq2/9nrD5x8FPla
	Tt1F42Vh1uR+oQ3WKQazKPKUu36svmzS2YHhhZwUOVsDtVULs79z4VEGQPK9eQ2gav31FUIBxq60P
	2+JpI8y0zrJ1by1PPmYFIW38KkESWnenmE2feT55Ag4JpdlfyyMWLi6Mnx5vayyCM2zpzN6yZeWIi
	4V/dRfubg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gAEpQ-0007L2-Ju; Wed, 10 Oct 2018 13:47:08 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gAEmg-0004tB-2i
 for linux-riscv@lists.infradead.org; Wed, 10 Oct 2018 13:44:44 +0000
Received: by mail-wm1-x332.google.com with SMTP id z204-v6so5842822wmc.5
 for <linux-riscv@lists.infradead.org>; Wed, 10 Oct 2018 06:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cRI3tf5wvOQekpXYB8n3+TpZrmkGzWG2Pqc4L91fjdI=;
 b=eSWEN3XwITfWXkf1wsYiXIJOcxWuEyg78kYzJJcOWJCq6tb6NCxUnxUFeqrWDmG3db
 /qyvXMChlwUUPO0pVDZA38aUyrxvnOmhL9C1Jjk5jgEagoRHopLF8aVWzmmX+i4cfPJ9
 TNgO11ZJk71Mv/y81WEch2OQoLVEUCCwvOXwPjsPKkY8dNn7KbTw+82fniIH3SERH0Th
 ZBxB9stGI5/xEHyfqvCW4jJrR2EKtGbio7Fsq5kwfDyNI4v8OiTCFSpHkcoS5FOezjEo
 sRPUDKP52Ks6ovlOc7HnQC05dLhI4F2G+tUkha1j3Rt1qAhRE22fmLmi0ziebu9XztTR
 hIGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cRI3tf5wvOQekpXYB8n3+TpZrmkGzWG2Pqc4L91fjdI=;
 b=gerynax3TAn717Ro9Y0l2XPkIbId0N1jMJuwuq8Sx/6qflNyaXd7c7pkqtbB9uSFQc
 EDzge5CKIuvdNfDYVB0lzQo1TqoNV+oxp1bHAIuMZT/Es2VInVfgZHI2BzvW/hUQAncA
 xMdeRYU6hicWMzMGKdnTT0C+89XrJkHIQ60EIDRYu8OGtyVMGQIY6uKwib5TacAu7GaY
 xUkyqjuvHWRYy5kosUKCoxhp6/QPB0eNjdytkkGYIPAVHXm1W9AaD/C1Dvg1AqarJJMy
 2sZWBCmcYPHfoJSzZldAmA825kvRQRsOTZxfi6YFwamivwXaKD6FBV366fRq9M+TPR9X
 sxkA==
X-Gm-Message-State: ABuFfoiHu77AelmUWODeB5HEYSRGG2P1U+xHMPn/bp6dYIXxOPDqpfuN
 S/Ohb1iYgtJw0wucwL3H7S0=
X-Google-Smtp-Source: ACcGV609DOSwacilKxc3rArUjc10tLfZm6BkGchNc6IARoqAZMMi8X6/1fedznQ5OZirWZ7sUL/g1Q==
X-Received: by 2002:a1c:9cc9:: with SMTP id
 f192-v6mr1001719wme.135.1539179045483; 
 Wed, 10 Oct 2018 06:44:05 -0700 (PDT)
Received: from localhost (p2E5BEEEA.dip0.t-ipconnect.de. [46.91.238.234])
 by smtp.gmail.com with ESMTPSA id r8-v6sm24989791wrm.14.2018.10.10.06.44.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 10 Oct 2018 06:44:04 -0700 (PDT)
Date: Wed, 10 Oct 2018 15:44:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [RFC 2/4] pwm: sifive: Add a driver for SiFive SoC PWM
Message-ID: <20181010134404.GC21134@ulmo>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
 <1539111085-25502-3-git-send-email-atish.patra@wdc.com>
 <20181010131128.GA29142@infradead.org>
MIME-Version: 1.0
In-Reply-To: <20181010131128.GA29142@infradead.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181010_064418_179312_3DD6BA07 
X-CRM114-Status: GOOD (  11.79  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org,
 linus.walleij@linaro.org, palmer@sifive.com, linux-kernel@vger.kernel.org,
 Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 robh+dt@kernel.org, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1725330668246255609=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181010134404.h4Dj7Rz2wCu1f661XsqR23-PgHVyZqtdpnW0me8aevo@z>


--===============1725330668246255609==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZwgA9U+XZDXt4+m+"
Content-Disposition: inline


--ZwgA9U+XZDXt4+m+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 10, 2018 at 06:11:29AM -0700, Christoph Hellwig wrote:
[...]
> > +static struct platform_driver sifive_pwm_driver =3D {
> > +	.probe =3D sifive_pwm_probe,
> > +	.remove =3D sifive_pwm_remove,
> > +	.driver =3D {
> > +		.name =3D "pwm-sifivem",
> > +		.of_match_table =3D of_match_ptr(sifive_pwm_of_match),
> > +	},
> > +};
>=20
> What about using tabs to align this a little more nicely?
>=20
> static struct platform_driver sifive_pwm_driver =3D {
> 	.probe			=3D sifive_pwm_probe,
> 	.remove			=3D sifive_pwm_remove,
> 	.driver =3D {
> 		.name		=3D "pwm-sifivem",
> 		.of_match_table	=3D of_match_ptr(sifive_pwm_of_match),
> 	},
> };

I discourage people from doing that because down the road somebody might
add a field here that's longer than the alignment tabs and then either
it becomes ugly or they either have to realign everything to keep it
pretty. Single spaces around '=3D' don't have that problem if used
consistently.

Thierry

--ZwgA9U+XZDXt4+m+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlu+AiMACgkQ3SOs138+
s6EREg//bWfq+MbsvCFozGTRY2bewO2oXHvxKIEXUcmof2E5bb4d8Nji84cB29oG
LPQMtazXtr1/3sgvO8z1qd07P97gSHtOmGv5T/pFkMvvDh2bIYzVsvS/qegEabz8
Tjr0qBOUZfvy2NrsR0okSsYJr/qTWFZ6NyTkLZkwPNTKLInj6LxM1jsu7sxcso0K
lmdJ6vlYXeHDAzihK503O9sj1qbuYODppXsXrrqvx5bNdQfKmRZod2rs3kh4CsMa
cQ5hFJI7Kju9j9ndSlhj9s4R85BP00KInQ19+sduOxT490UDX47Fi3CGglQyJDjO
OEyW66jFsBI7y/bnW8ngLFz86Db5/p5iwRx81mLtE4pfrEONY4vjm8bqsHIF3U9R
Gcr1JaF+x3U8SYchjJMrxJjz2cdrzKoVD9XG+cGbzlxNEeWWxuALNZDN8paJkN8q
0QDgxDyc4zdo8mrHgOdlRxY35raBaKZLpUXdm8jYZeUT7oMYRvA0tlAkufbWuKHn
GpK7ERekVaApyNbabJTmk8gYbWIRrcosEpgrNjOrlSgkS92KBfX0TwOxHOUuVaKs
zM0rriWqTYEar2SUxqOuBJEckNVkJI8mKGG5Ks0S3i/hswft8+FFW2FCqgw1iau4
zm5VgMLqmhT+tZ1xFga5rOMQW/zNcBXPOoNqxe8EFvMjJMATjfw=
=cs39
-----END PGP SIGNATURE-----

--ZwgA9U+XZDXt4+m+--


--===============1725330668246255609==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1725330668246255609==--

