Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 198CEC05027
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 08:19:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zU3O4F+YsRLe5sByoiRP1uTS5TNjSp7HcK2N64ZzjTY=; b=LCst5htU6GzHOBjTjtlTrnkL7I
	rNze1hshOJJnQCM3Q6hv0Bwx2ppTkGwhEgcY9SRrxeDifcCVTrjn00ej5quxaWzWA6+6HYSoPVgz3
	fYfAdeXa5f4g3OdXHud6FwJsqmL2CdlvoQzdelXCHmcDdaFszHh67nzoOTwsUoNH18Wuc+9Q2K9ER
	5UfoaoJ5SmZBaFM2xB7OCsRzNCYIPrI+BiKLnE6aO/o59nNr4k5kFZ9zfKcHiMlsoyimiHUQPvOSf
	vsS4rLGor8/9iV/VSK/i6L8tokqhbkt+vEZ/dju7/15JjtDwNDGSc15QxgQgqYuj/LFgLDMc58AiN
	tjhHF2sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ295-000XJb-Ub; Thu, 09 Feb 2023 08:19:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ28z-000XHb-Hx
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 08:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675930742; x=1707466742;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zzXoW7xy68b9hfTr8J46Qd1vgV/c8UY2s3GlmxDEdaw=;
  b=DPYVH22L3JyDPi6F4iRiXQtZ+QZeKCBG1kc+3GReI64Z43D9o6LUMXyG
   80UCbB+EVgZPs5iCX50ZsdGhis0eaIDSSzqLA+9CgjrouxPGmRNUey2Md
   rdVM+8kJdfFBw0BqXFpJ340q40nd9RK4tXm3kQxmFmfLC1Q0KkdIwXitQ
   DNSA/5FoKhIqx3cf6AV/QefPgRXkHmFnQeiN8EeVkF1j8BqFEK8q4JpSN
   pokY3dmfa4aXVEhWUbX2jJcJ/Jwq7RfsefA0rT/9mdxU4EOpZHR+PU0Ti
   dbvpJZRTYCLwlp+fEKMqdVK+bhh9aZYBeVf31QE26Lm7WEOALespPvVb+
   g==;
X-IronPort-AV: E=Sophos;i="5.97,283,1669100400"; 
   d="asc'?scan'208";a="196077779"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 01:18:54 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 01:18:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 9 Feb 2023 01:18:53 -0700
Date: Thu, 9 Feb 2023 08:18:28 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
CC: <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v12 0/3] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <Y+SsVC7JpdPodjeN@wendy>
References: <11ea7918-00db-3f30-2504-53692936aaae@iscas.ac.cn>
 <a1cdf5e6-a6d8-654c-1af2-adb9f0b260c3@iscas.ac.cn>
 <Y+ShK27/hnApM89n@wendy>
 <9c20cf72-09cc-b005-6d92-a23d053c86ea@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <9c20cf72-09cc-b005-6d92-a23d053c86ea@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_001901_681739_6CB88143 
X-CRM114-Status: GOOD (  26.36  )
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
Content-Type: multipart/mixed; boundary="===============8245989068639117294=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8245989068639117294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KMZwCjqoPQWXx6uQ"
Content-Disposition: inline

--KMZwCjqoPQWXx6uQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 04:03:01PM +0800, Qinglin Pan wrote:
> Hey!
>=20
> On 2023/2/9 15:30, Conor Dooley wrote:
> > Hey!
> >=20
> > On Thu, Feb 09, 2023 at 12:00:32PM +0800, Qinglin Pan wrote:
> > > Hi all,
> > >=20
> > > Sorry for bothering :(
> > >=20
> > > This patchset has a bit of a formatting problem.
> > > Please use another one:
> > > https://lore.kernel.org/linux-riscv/20230209035343.15282-1-panqinglin=
00@gmail.com/T/#t
> >=20
> > If you're resending, please either mark as RESEND or increment the
> > version number so that tools don't get confused.
> > In this case though, tools found some issues with both version
> > unfortunately:
> > https://patchwork.kernel.org/project/linux-riscv/patch/20230209035343.1=
5282-2-panqinglin00@gmail.com/
> > https://patchwork.kernel.org/project/linux-riscv/patch/20230209035343.1=
5282-3-panqinglin00@gmail.com/
> > (if you click on the descriptions you should get more information on
> > what is wrong)
> >=20
> > You can fix those up and send a v13 and it'll all be clear then ;)
>=20
> Your information is very helpful, thanks so much!
>=20
> I will send a v13 later. But I am very curious about why
> conchuod/alphanumeric_selects is failed and what content is in
> this test? Could you please give me some hints about it? ;)

Oh yeah, that output is not very helpful is it. It runs a perl script
that RMK created that tries to put things in the "correct" order before
and after the patch is applied. The script is here:
https://github.com/ConchuOD/nipa/blob/main/tests_rv/patch/alphanumeric_sele=
cts/alphanumeric_selects.pl
It also re-orders default/depends on strings, and I assume it's being
tripped up by the config option that you are adding not doing what it
wants you to do with the order of those.
I think you can ignore that one for now.

It's the build errors and SoB issues that I am more interested in
getting fixed ;)

I'll go convert the error level of that to a warning & try to fix up the
reporting that it does.

Cheers,
Conor.


--KMZwCjqoPQWXx6uQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+SsUwAKCRB4tDGHoIJi
0hwUAP4kTaePV4sH58nYJ3det1tlnNcfXyoofoDOc3LEWZr2cQEAiTc176fDvcya
gzCHi+qPq2UfC514wWItUwo0nBGh8wY=
=Z+CE
-----END PGP SIGNATURE-----

--KMZwCjqoPQWXx6uQ--


--===============8245989068639117294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8245989068639117294==--

