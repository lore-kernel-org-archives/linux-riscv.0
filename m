Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5CDC7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 13:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NWg+R4mf/qgkYGyeBNZ37hvYqOmGpcT8OTn8DCzMaPI=; b=EuElnujCCzSqGON45/p9yIZ1Ib
	BelQ7nAdB+C8P2QRXB/yqh1DxXRL6OBkhtAMsnpwtGhtQ6SI8X3fZvWqaH5+0RwzmK7K35Rt4eWCw
	Fwc/E5WmoJlVRyfc143V55FolTdld+bczzNR07tdo0LensiTYGYPRxYeQce//lIUgun/+yBqARxld
	0G6ntrdtAUMGRk1iitVUb+DJUYafneTDkhB79dpW+jM+UnON84ZeTK/JxUlUvXsMrUYZVbJOdFpYt
	jBbMLmPMLcUKxkn7+4qYZmjTI52xzav/cOvDk+wmeJoQcSLnN5JiD0hK3UW2C9ufMeavW4lOyjk4Q
	cUE5QT/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BRs-00GmRy-2k;
	Thu, 25 May 2023 13:56:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2BRq-00GmRV-08
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 13:56:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685022970; x=1716558970;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=c/51Vo0R05mz1U21BlbdotZ1dIf8ZzyWdeNyPt9wnvw=;
  b=0VXfbMnkkXuPrAcZhAF3o2OXzsRKU1YFyAGW4PyXjC/1YuWWqlWOx/ft
   jTjU2hj1fdvzcWcyyPMlHaQZu2b2UO6e3qJbfrzj6uH0qGKo59zZMiomp
   L55EbPiv9CXqQYV3ZHjAjo+IdcOZZtdmJ2Sgnso8td4oZrnYp2EbqSIyU
   TqulLPbKBdZrAur5X/zZYDrR+KeFKp9tVlWGTnmZ70kPU0+KXyqiysPj6
   Ey1qnbI+qJVt4NBUWztBw78rC68O2ehoCeIry1WyhydPYVkbeMdSI5DOe
   0klJVcB8NODhzFMrAfClmREabrg4LL5SW83X+uvSP8x9cLTU51xqHkqNn
   g==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="153915101"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 06:56:07 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 06:56:07 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 06:56:05 -0700
Date: Thu, 25 May 2023 14:55:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Anup Patel <anup@brainfault.org>
CC: Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@atishpatra.org>,
	Alexandre Ghiti <alex@ghiti.fr>, <robh@kernel.org>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, <jeeheng.sia@starfivetech.com>,
	<linux-kernel@vger.kernel.org>, <palmer@rivosinc.com>,
	<leyfoon.tan@starfivetech.com>, <mason.huo@starfivetech.com>, Guo Ren
	<guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Song Shuai
	<suagrfillet@gmail.com>, <linux-riscv@lists.infradead.org>, Andrew Jones
	<ajones@ventanamicro.com>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230525-shrapnel-precut-26500fca4a48@wendy>
References: <20230517-preacher-primer-f41020b3376a@wendy>
 <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr>
 <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
 <20230525-guacamole-swimmer-68048a73baac@wendy>
 <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
 <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_065610_259019_2448DD73 
X-CRM114-Status: GOOD (  29.74  )
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
Content-Type: multipart/mixed; boundary="===============0476893791321945466=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0476893791321945466==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OFwHiDdDsq9ntBHt"
Content-Disposition: inline

--OFwHiDdDsq9ntBHt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 07:13:11PM +0530, Anup Patel wrote:
> On Thu, May 25, 2023 at 7:08=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Thu, May 25, 2023 at 06:51:28PM +0530, Anup Patel wrote:
> >
> > > > We should only rely on this node name for known bad versions of ope=
nsbi
> > > > IMO. Going forward, if something needs to be reserved for firmware,=
 the
> > > > firmware should make sure that it is reserved by using the property=
 for
> > > > that purpose :)
> >
> > > There is no issue with OpenSBI since it does the right thing by marki=
ng
> > > memory as reserved in the DT. This real issue is with the kernel hand=
ling
> > > of reserved memory for hibernate.
> >
> > I don't think we are talking about the same thing here. I meant the
> > no-map property which OpenSBI does not set.
>=20
> Yes, we are talking about the same thing. It's not just OpenSBI not
> setting no-map property in reserved memory node because other
> SBI implementations would be doing the same thing (i.e. not setting
> no-map property)

Other SBI implementations doing the same thing doesn't make it any more
correct though, right?

> > > Like Atish mentioned, not just OpenSBI, there will be other entities
> > > (like TSM) or some other M-mode firmware which will also reserve
> > > memory in DT/ACPI so clearly kernel needs a SBI implementation
> > > independent way of handling reserved memory for hibernate.
> >
> > > > > Another option is to use compatible string or label property to i=
ndicate
> > > > > that this memory region is not to be saved/restored during hibern=
ation.
> > > > > This can be documented in RISC-V DT bindings as well as the booti=
ng guide
> > > > > doc that alex was talking about.
> > > >
> > > > Sure, a dt-binding for sbi reserved regions doesn't immediately sou=
nd
> > > > like an awful idea... But we still have to work around the borked
> > > > firmware - be that disabling hibernation or using the mmode_resv no=
de
> > > > when we know that the version of OpenSBI is one of those with the
> > > > problem.
> >
> > Did you skip over this? I was agreeing that defining a common binding f=
or
> > sbi reserved regions was a good idea.

--OFwHiDdDsq9ntBHt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9o3gAKCRB4tDGHoIJi
0gmsAQDEkuoMF0HDEcJQCW9qndjbk4bpKWaSwzgKHMvPTLClDwD/Tx9ATCMUdkIN
Yr7l0UleTYU8XObDH+OTvhupiW7CAAA=
=9IgR
-----END PGP SIGNATURE-----

--OFwHiDdDsq9ntBHt--


--===============0476893791321945466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0476893791321945466==--

