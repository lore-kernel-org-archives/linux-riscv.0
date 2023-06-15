Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DA8EEB64D9
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Jun 2023 08:12:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wjS9ma6jul0bVpF0NXzPw+iVDiE9enUkU/A7aGS6lB0=; b=ro1viyPpG+Ta1ZtWTte6W49IMw
	GrGpPvb0Ej5ii7FpEaoSh+roc9c7PXjyJyQDlLW3BJ30eAsE5SJuZPZVrxnV4h8AnaNWVZ1Pe28HU
	zaAXr3u/mpgll6jV0rl35Ill1oyk+8NdkHpnR1bVXiC/HT+SxnUxsf4xJ8wYBy9zM8pAg/7Q/wxQW
	K4bSbJjtOKTSRKUkaBoDs4CF1ohD4JxvOK6+oFunM1IvzqZLtly8zNdFvnu0NoULwKainM5/CWyhG
	g0uWb78k+3RmKtzF1bJACMbZuayNwC/aFVN3EoBpe2C0/mq6HHCGvrv4RLKt45xirI6d6LCTXYE02
	85SaKoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9i5P-00E843-0V;
	Thu, 15 Jun 2023 08:12:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9i5M-00E837-0M
	for linux-riscv@lists.infradead.org;
	Thu, 15 Jun 2023 08:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686816724; x=1718352724;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zMvFbd2Dmpe15HsekBKSTxJnEfVLCvXumharhvUUlYA=;
  b=zmBcnV6o9XGZbE/JLJOSHTZ+5UEfeiVDyELmksFmbxXGY98u4kxGkwtQ
   ReZBdR5EUEbkGnM2dPn16jJS93704M6vD4yxXglk3H7f3PsWsZD7ZY262
   x/DS3L4rq+BCYP0vhnGn8/xXMzDohQAcEiNbgfD5Zhn+WO9MPCjXLJgkq
   7E08HD2EROy5m0rQXpaOJbtflVg1qXBV2PMxXsBzpbOwMcWPHq6/gaIqv
   t9HDuxdZsU09alNpDEpbcrtHjT/+KP+MVyO7MAqnYLX3lXeDZmAFHi86y
   mSN2VxvxTc6ntO7ce5KfHGXjPxN9SJmKOHnHH98NflfahmbXZQAV4md6I
   w==;
X-IronPort-AV: E=Sophos;i="6.00,244,1681196400"; 
   d="asc'?scan'208";a="230254116"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2023 01:12:02 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 15 Jun 2023 01:12:01 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 15 Jun 2023 01:11:59 -0700
Date: Thu, 15 Jun 2023 09:11:33 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Nylon Chen <nylon.chen@sifive.com>
CC: <schwab@suse.de>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <jszhang@kernel.org>,
	<ajones@ventanamicro.com>, <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
	<paul.walmsley@sifive.com>, <greentime.hu@sifive.com>, <zong.li@sifive.com>,
	<nylon7717@gmail.com>
Subject: Re: [PATCH v2] RISC-V: Support 32_PCREL relocation type in kernel
 module
Message-ID: <20230615-luxurious-rewire-84ff9d639fea@wendy>
References: <20230615072302.25638-1-nylon.chen@sifive.com>
 <20230615-unvisited-deceit-9beab8ce987a@wendy>
 <CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHh=Yk_=oZJ6eY3jJzLavub5rGsvY=MKv4tGXeiqkz+rgJHwDQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230615_011204_156521_C10144EA 
X-CRM114-Status: GOOD (  12.75  )
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
Content-Type: multipart/mixed; boundary="===============7293449725142976012=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7293449725142976012==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="h6NhA6OhD5BBwWq3"
Content-Disposition: inline

--h6NhA6OhD5BBwWq3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Nylon,

Firstly, no html emails please :/

On Thu, Jun 15, 2023 at 03:52:27PM +0800, Nylon Chen wrote:
> Conor Dooley <conor.dooley@microchip.com<mailto:conor.dooley@microchip.co=
m>> =E6=96=BC 2023=E5=B9=B46=E6=9C=8815=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=
=8B=E5=8D=883:38=E5=AF=AB=E9=81=93=EF=BC=9A
> > On Thu, Jun 15, 2023 at 03:23:02PM +0800, Nylon Chen wrote:
> > > Fix the 'unsupported relocation type' error caused by
> > > enabling the -fasynchronous-unwind-tables flag,
> > > which generates relocation types that are not supported.
> >
> > What commit adds the -fasynchronous-unwind-tables flag?
> sorry my description is not correct, please allow me to add
>=20
> I mean, when we use the flag "-fasynchronous-unwind-tables," it generates
> the relocation type R_RISCV_32_PCCREL. However, this type is currently not
> supported, so an error will occur.

(snip)

> > Should there be a Fixes: tag for that commit?

> yes, I will do it.

What mainline commit actually enables this flag?

Cheers,
Conor.

--h6NhA6OhD5BBwWq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIrHtQAKCRB4tDGHoIJi
0kYXAP4vjUBQC0nRI2nk+JJ2TuSAyNZbfK027v2MExRK2/XFZQD8Dsh0kgG+u+mL
zmBMKAzwFIGn34kWR9aFPZrhGcm0HAY=
=HQMi
-----END PGP SIGNATURE-----

--h6NhA6OhD5BBwWq3--


--===============7293449725142976012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7293449725142976012==--

