Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EBAC27C77
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jun 2024 07:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaSgMGvzrvTNmudbDHTPM3F5pNekIM6k3l/fQNHUzws=; b=oeMcq/v6/nErmj5bxkHuNQzcN1
	Lbzn8bI31y8GdYkvS5RpoPR02uaciO6BWpGJx98d5JDIygKzwVW7pIEte9MpYgD6V9QHjJzVbCuk/
	3Yaib9PWh2e+RZzjloeGk3+dNT2Eh32n5Syk/rcRwcirI3DkmuKrLnRO1OSwGQNjcMgIS7FASy20y
	fGhDKgySYhA4pMipIrjUWGQldkSlfwhX3yGDKIJFSfHfYaMSS/4lsNDTty238s4g+5UjFDzl/PjdL
	Of8pjS2DGFSx3BQ8oMfeCHg72djCQ+9Swu3d6N5hHdOpzfl23JLvDRIleHC+Ur7LuncF4zDDOzT+3
	LspmYPGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ6np-00000009ejI-24p2;
	Mon, 17 Jun 2024 07:29:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ6nk-00000009ehx-3Ym5
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jun 2024 07:29:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718609356; x=1750145356;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/LyDENuvfYDBXxhDzgEz448XxUjV1uQrB6Iyg0sw2yc=;
  b=xfZY2/DF0G52oNqsLVez2xVAR34VY87yPQY0E+1eJBME9wG5jfENLoop
   B0IvVh1zjpgbSlb2gzV1zAj5G6xu78Jc8zP1dlEmlB+JKtQsZ0mVCfF6a
   VMgEsH3tgWQo75nOYpyULkOkXeC/8Ciqgl1833210jGNT3sx6EuX5V85B
   PuZDuXaX/hPg4Q18I1IKrG66lWVVP+WyeBrmwA8K8/VbBuOpI8n5kCNYW
   FuH4Gvpy+wTDjcdWbFe0C9DyM2G23vKP3H0FgWXdYv00znwSFwRAKXgMj
   rJfw9cDVAOGAElzcGPjJX6Jxwo59d4+Q5KqxPSXiz8K+BbW0zizgztS0Q
   A==;
X-CSE-ConnectionGUID: BQubg5HpRrqbLaHVDWvPoA==
X-CSE-MsgGUID: Dt7ztb1mQzeZfIUWRBkoQg==
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="asc'?scan'208";a="28483707"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 17 Jun 2024 00:29:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 17 Jun 2024 00:29:02 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex02.mchp-main.com (10.10.85.144)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 17 Jun 2024 00:28:59 -0700
Date: Mon, 17 Jun 2024 08:28:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: Conor Dooley <conor@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor+dt@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup.patel@wdc.com>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<devicetree@vger.kernel.org>, Linux Kernel Mailing List
	<linux-kernel@vger.kernel.org>, Jesse Taube <jesse@rivosinc.com>
Subject: Re: [PATCH v1 0/9] riscv: add initial support for SpacemiT K1
Message-ID: <20240617-margarita-alongside-255cbb09ef59@wendy>
References: <tencent_BC64B7B1876F5D10479BD19112F73F262505@qq.com>
 <20240616-exorcism-computing-e11e26084a62@spud>
 <20240616224811.GC3983622@ofsar>
 <tencent_2ABAC5E885F8354EF1F9084A6B5B398EE00A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_2ABAC5E885F8354EF1F9084A6B5B398EE00A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_002917_301877_C75152AA 
X-CRM114-Status: GOOD (  28.51  )
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
Content-Type: multipart/mixed; boundary="===============7043810231649736651=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7043810231649736651==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sUdZtwqJCkgb0H8C"
Content-Disposition: inline

--sUdZtwqJCkgb0H8C
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 17, 2024 at 10:00:32AM +0800, Yangyu Chen wrote:
>=20
> > On Jun 17, 2024, at 06:48, Yixun Lan <dlan@gentoo.org> wrote:
> >=20
> > Hi Conor
> > Thanks for bringing this up
> >=20
> > On 19:35 Sun 16 Jun     , Conor Dooley wrote:
> >> On Mon, Jun 17, 2024 at 01:18:52AM +0800, Yangyu Chen wrote:
> >>=20
> >> No MAINTAINERS update, so I figure that means you don't want to mainta=
in
> >> it going forwards? If there's someone out that that does care about the
> >> spacemit k1 (Jesse maybe?), then I'd be more than happy to have them
> >> look after it.
>=20
> Actually, I don=E2=80=99t know how to be a maintainer. Should I have to
> provide a new git tree and all the new patches merged to my tree
> and then submit a git pull?

Yeah, in the ideal case :) I wrote a document with information as to
how this all works for new platform maintainers:
https://docs.kernel.org/process/maintainer-soc.html#information-for-new-sub=
maintainers

> Or reuse the RISC-V mailing list and
> just give a review, and the patches come to soc misc tree? I would
> like the latter one.

If you don't have the time/interest/whatever in having a tree, then
sure, I can apply the patches for it. I'd rather have someone look after
a tree themselves, but this option is better than me growing another
platform to look after.

> > Yangyu kind of has limited time, too many stuff for him..
> >=20
>=20
> True. Maybe I can have a review and test the patch in one week.
> However, providing a review and test in 2-3 days is sometimes hard
> for me.

It would be unreasonable to expect a 2-3 day turnaround :)

> > I'd volunteered to help on this if it can fill the gap
> > Also I'd be more than happy if anyone willing step forward to co-mainta=
in..
> >=20
>=20
> Thanks. Really appreciate it.
>=20
> Should I provide a diff like this:
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d6c90161c7bf..718d30996f12 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19306,6 +19306,7 @@ F:      arch/riscv/boot/dts/
>  X:     arch/riscv/boot/dts/allwinner/
>  X:     arch/riscv/boot/dts/renesas/
>  X:     arch/riscv/boot/dts/sophgo/
> +X:     arch/riscv/boot/dts/spacemit/

If you don't want to apply patches, drop this hunk.

>  RISC-V PMU DRIVERS
>  M:     Atish Patra <atishp@atishpatra.org>
> @@ -21004,6 +21005,13 @@ W:     https://linuxtv.org
>  Q:     http://patchwork.linuxtv.org/project/linux-media/list/
>  F:     drivers/media/dvb-frontends/sp2*
> =20
> +SPACEMIT DEVICETREES and DRIVERS
> +M:     Yangyu Chen <cyy@cyyself.name>
> +M:     Yixun Lan <dlan@gentoo.org>

Jesse mentioned on IRC she was interested in the platform, so maybe she
would like to be involved too.

Thanks,
Conor.

--sUdZtwqJCkgb0H8C
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZm/lpQAKCRB4tDGHoIJi
0rjzAQDObDEqhK4rTAoVhenfAwjYqm4LfpWxPSOh3FiikvWIoQD/QzjEI0jSU9iU
eybCR5sSqTxdUVDBKVOrOoamqv6EQA4=
=6IiD
-----END PGP SIGNATURE-----

--sUdZtwqJCkgb0H8C--


--===============7043810231649736651==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7043810231649736651==--

