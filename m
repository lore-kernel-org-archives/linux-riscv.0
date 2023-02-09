Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01952C636D7
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 08:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RS6KhhVdHhSOfqUXFC3Lkzus3LIHUNFz1kcyaXSBWc4=; b=mZx4TVyxV000igIq8hBlrl+lVP
	NIPX4dp23+UOjHwA8FsdYDl8jLzoPwW85vrIGocvgZn5tuZz4laf82DaFugQTzxYLNYMogCHJn2aw
	qBTouWxOlG1sHhZ0a3aVHTYnR2SgL4mbScMsIgzMbRNgln7evNZn4KkkVsyNIzRmCN0jMMkPEd0tq
	IT21L5dutjWbuvf38bNlOS9NLAmQieNEBmlEwcNfd+TiUD8obUBrF1dbIT3y097wSPHS1nVr20i1T
	QQfeQeHjU48tuyB75S7D6z92DnbkLIeVX4unHyRt8yZRqoR1wQNjycFDKLi3muogOz6pNPtpEAxEG
	SjQhRtmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2lY-000dTg-QL; Thu, 09 Feb 2023 08:58:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQ2lV-000dS9-Gy
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 08:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1675933130; x=1707469130;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=JTIi61h632CtmrDIBkc7bz0i7fQFshz9vbQ7S3rWMK4=;
  b=ASEMi8TjiC09r7Dv2YyGGtKTaMkQ4nDKvr1a2Y3Kqw+PYAakg2ugHtys
   ZC5+Go0HswPnLmIlVK60LDJZ2UYvrq/rK9q6qqOEgyFGdGEpr7UqqGW4/
   BLVZG+8foQC3u2FXmTwuaJahPdpEMnH3A4E/gmkRnkIedMzByZOY78oN/
   zboG5mOMQ8sHakuXaYMqYJELjHX7oGEzhKOesldpIVzUrH0YlcfKHCIPy
   0BPfrY3+56NlsHQCrwJZX4QFa3neTilYHmITMdslptd/9Mviih98JEaS4
   umzdcIc5coEAu0sDHy7iTVLF1CDAXj9cEWMDQj2jF5J9BF2MTSMPw3y6c
   Q==;
X-IronPort-AV: E=Sophos;i="5.97,283,1669100400"; 
   d="asc'?scan'208";a="200210636"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 09 Feb 2023 01:58:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Thu, 9 Feb 2023 01:58:45 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.16 via Frontend
 Transport; Thu, 9 Feb 2023 01:58:45 -0700
Date: Thu, 9 Feb 2023 08:58:19 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Qinglin Pan <panqinglin2020@iscas.ac.cn>
CC: <linux-riscv@lists.infradead.org>, <bjorn@kernel.org>
Subject: Re: [PATCH v12 0/3] riscv, mm: detect svnapot cpu support at runtime
Message-ID: <Y+S1q8JME5E6sd2s@wendy>
References: <11ea7918-00db-3f30-2504-53692936aaae@iscas.ac.cn>
 <a1cdf5e6-a6d8-654c-1af2-adb9f0b260c3@iscas.ac.cn>
 <Y+ShK27/hnApM89n@wendy>
 <9c20cf72-09cc-b005-6d92-a23d053c86ea@iscas.ac.cn>
 <Y+SsVC7JpdPodjeN@wendy>
 <f5004cea-283b-6c9f-f0f7-f13eae213b08@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <f5004cea-283b-6c9f-f0f7-f13eae213b08@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_005849_591157_F2522158 
X-CRM114-Status: GOOD (  35.02  )
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
Content-Type: multipart/mixed; boundary="===============4021554666830495274=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4021554666830495274==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="PsWVHbYzAXS8UFwN"
Content-Disposition: inline

--PsWVHbYzAXS8UFwN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

+CC Bjorn

On Thu, Feb 09, 2023 at 04:40:47PM +0800, Qinglin Pan wrote:
> Hey!
>=20
> On 2023/2/9 16:18, Conor Dooley wrote:
> > On Thu, Feb 09, 2023 at 04:03:01PM +0800, Qinglin Pan wrote:
> > > Hey!
> > >=20
> > > On 2023/2/9 15:30, Conor Dooley wrote:
> > > > Hey!
> > > >=20
> > > > On Thu, Feb 09, 2023 at 12:00:32PM +0800, Qinglin Pan wrote:
> > > > > Hi all,
> > > > >=20
> > > > > Sorry for bothering :(
> > > > >=20
> > > > > This patchset has a bit of a formatting problem.
> > > > > Please use another one:
> > > > > https://lore.kernel.org/linux-riscv/20230209035343.15282-1-panqin=
glin00@gmail.com/T/#t
> > > >=20
> > > > If you're resending, please either mark as RESEND or increment the
> > > > version number so that tools don't get confused.
> > > > In this case though, tools found some issues with both version
> > > > unfortunately:
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/202302090353=
43.15282-2-panqinglin00@gmail.com/
> > > > https://patchwork.kernel.org/project/linux-riscv/patch/202302090353=
43.15282-3-panqinglin00@gmail.com/
> > > > (if you click on the descriptions you should get more information on
> > > > what is wrong)
> > > >=20
> > > > You can fix those up and send a v13 and it'll all be clear then ;)
> > >=20
> > > Your information is very helpful, thanks so much!
> > >=20
> > > I will send a v13 later. But I am very curious about why
> > > conchuod/alphanumeric_selects is failed and what content is in
> > > this test? Could you please give me some hints about it? ;)
> >=20
> > Oh yeah, that output is not very helpful is it. It runs a perl script
> > that RMK created that tries to put things in the "correct" order before
> > and after the patch is applied. The script is here:
> > https://github.com/ConchuOD/nipa/blob/main/tests_rv/patch/alphanumeric_=
selects/alphanumeric_selects.pl
>=20
> It is what I really need :) :) :)

That perl script will completely re-order the file, so it is run from
another script that just diffs the result with the existing Kconfig
file.

> > It also re-orders default/depends on strings, and I assume it's being
> > tripped up by the config option that you are adding not doing what it
> > wants you to do with the order of those.
> > I think you can ignore that one for now.
> >=20
> > It's the build errors and SoB issues that I am more interested in
> > getting fixed ;)
> >=20
> > I'll go convert the error level of that to a warning & try to fix up the
> > reporting that it does.

I think I have fixed this to do something that actually says what it is
complaining about:
https://github.com/ConchuOD/nipa/pull/18

In the future, it'll do something like:
| --- /dev/fd/63	2023-02-09 08:45:10.809992544 +0000
| +++ /dev/fd/62	2023-02-09 08:45:10.809992544 +0000
| @@ -354,0 +355 @@
| +	select ARCH_HAS_NOTHING

Cheers,
Conor.


--PsWVHbYzAXS8UFwN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+S1qwAKCRB4tDGHoIJi
0ndeAQD6pDaZSgwiq3on0GEipRGP3j+oUu/+wRsbzzol1JGQ3AEAwCgOgVzH8hv+
XItBKsYlsZLMeSiPW8fNe2LUjYgC0gI=
=CVr+
-----END PGP SIGNATURE-----

--PsWVHbYzAXS8UFwN--


--===============4021554666830495274==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4021554666830495274==--

