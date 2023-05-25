Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BD6CC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 14:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D9AljCAgEuYk5meVq0lQWNLGIyYKNSfkigyE7I4Qsdo=; b=pD6BvJ+a7uZOZG2vaxwuAMaDJS
	Z8FsJlN+HCrkhZAze32/D+gI9HrO8y+xfPR7YQRXWqDidwOgb0vMbjZQpYh3qhzf04DSFPeilsbzK
	bPfR/6G8+ncub9leSiX6Yiqk+bkU97nOZv+I8Bp/oK9QYqcF9wIOiAg7OlZRUQHOTgzTzRONA++M8
	mchRvoixnmOjSFSBIjqn95oOe9OzWqjOqVzw0ZCbbtwNIv/HIzQ4gIcElhUXik9rxrHNMKNpXPM0b
	yFJTPSx9WAyq2An+VwdP1NvJAcK6Wpebjy1qJBEw+WXBRLl2A3gsmxhtuxDMEoJkxIJZKr6kE2m4g
	anaYuvtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Bq2-00GpKo-2g;
	Thu, 25 May 2023 14:21:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Bq0-00GpK6-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 14:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685024468; x=1716560468;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YCkWpWKLi5LA0hLoKYmV6Pn63lRC3AnzJmUk0eTfHn4=;
  b=Z/VSMBCycuLNFaecdLG+z3Xcuf5Gls9hheLaJ1PbHPy56eLIigIrmTkx
   yjVysLQ6CdLvnM9FpYYmgXAFuCT06Yj8JwR5N4HWiRZejJGqn110jJ7J0
   PG834U0cQq9Sk/DQBmWhrkmRJk2p5Ny5op1pHZq2O7lZqpAZV1/wzf8iA
   YFlHMoQo+sBpOm36nKcdwIsF+yuNwWzmrME5SMrdlj6OF9qgI9i4RtXHH
   9HIjSNPSZOuzhnMrg2BrdCmV/n3WUwU4zbo0MeG5OxSHvuMtysBaW2J9p
   /4mVIvwfc6gNyq+IZUzGMPRM3+D6tHIOkeA1CQjAEnRm3yC75MDR49Ztf
   Q==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="153919948"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 07:21:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 07:20:59 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 07:20:57 -0700
Date: Thu, 25 May 2023 15:20:35 +0100
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
Message-ID: <20230525-citric-waged-a2f78d27eb0c@wendy>
References: <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr>
 <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
 <20230525-guacamole-swimmer-68048a73baac@wendy>
 <CAK9=C2WUyLxZwQO37cN-i+V+A3yxmEoaj=uE8yR8nseYTDW7oQ@mail.gmail.com>
 <20230525-postnasal-monopoly-98adb96ffaa1@wendy>
 <CAAhSdy06nQh4H1FP_K_-VF462mhj+F2M=4AV4QSCUGe5XVqX0g@mail.gmail.com>
 <20230525-shrapnel-precut-26500fca4a48@wendy>
 <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAAhSdy3SqeLdAfaojUki=ht21nr4ZUPMkW_t9M6ntQCt6Ds4Nw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_072108_539794_0178C0D8 
X-CRM114-Status: GOOD (  28.43  )
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
Content-Type: multipart/mixed; boundary="===============7811788357536549102=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7811788357536549102==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="AIux2bwC0CEBr+0s"
Content-Disposition: inline

--AIux2bwC0CEBr+0s
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 07:29:46PM +0530, Anup Patel wrote:
> On Thu, May 25, 2023 at 7:26=E2=80=AFPM Conor Dooley <conor.dooley@microc=
hip.com> wrote:
> >
> > On Thu, May 25, 2023 at 07:13:11PM +0530, Anup Patel wrote:
> > > On Thu, May 25, 2023 at 7:08=E2=80=AFPM Conor Dooley <conor.dooley@mi=
crochip.com> wrote:
> > > >
> > > > On Thu, May 25, 2023 at 06:51:28PM +0530, Anup Patel wrote:
> > > >
> > > > > > We should only rely on this node name for known bad versions of=
 opensbi
> > > > > > IMO. Going forward, if something needs to be reserved for firmw=
are, the
> > > > > > firmware should make sure that it is reserved by using the prop=
erty for
> > > > > > that purpose :)
> > > >
> > > > > There is no issue with OpenSBI since it does the right thing by m=
arking
> > > > > memory as reserved in the DT. This real issue is with the kernel =
handling
> > > > > of reserved memory for hibernate.
> > > >
> > > > I don't think we are talking about the same thing here. I meant the
> > > > no-map property which OpenSBI does not set.
> > >
> > > Yes, we are talking about the same thing. It's not just OpenSBI not
> > > setting no-map property in reserved memory node because other
> > > SBI implementations would be doing the same thing (i.e. not setting
> > > no-map property)
> >
> > Other SBI implementations doing the same thing doesn't make it any more
> > correct though, right?
>=20
> Like multiple folks suggested, we need DT binding for distinguishing
> firmware reserved memory from other reserved memory.

And I have agreed with multiple times!

> Until that
> happens we should either mark hibernate support as experimental
> or revert it.

That works for me. How about the below?

-- >8 --
=46rom 1d4381290a1600eff9b29b8ace6be73955d9726c Mon Sep 17 00:00:00 2001
=46rom: Conor Dooley <conor.dooley@microchip.com>
Date: Thu, 25 May 2023 15:09:08 +0100
Subject: [PATCH] RISC-V: mark hibernation as broken

Hibernation support depends on firmware marking its reserved
regions as not mappable by Linux. As things stand, the de-facto SBI
implementation (OpenSBI) does not do this, and other implementations may
not do so either, resulting in kernel panics during hibernation ([1],
[2]).

Disable support for hibernation until such time that an SBI
implementation independent way to communicate what regions are reserved
has been agreed upon.

Reported-by: Song Shuai <suagrfillet@gmail.com>
Link: https://lore.kernel.org/all/CAAYs2=3DgQvkhTeioMmqRDVGjdtNF_vhB+vm_1dH=
JxPNi75YDQ_Q@mail.gmail.com/ [1]
Reported-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/ITXwaKfA6z8
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 13f058490608..b2495192f35a 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -801,7 +801,7 @@ menu "Power management options"
 source "kernel/power/Kconfig"
=20
 config ARCH_HIBERNATION_POSSIBLE
-	def_bool y
+	def_bool n
=20
 config ARCH_HIBERNATION_HEADER
 	def_bool HIBERNATION
--=20
2.39.2


--AIux2bwC0CEBr+0s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9usgAKCRB4tDGHoIJi
0o+bAQC85DODqSEm+RKOlB9eGicWZIkp8ZTsFWp6dFDXuf2vnQEAro2D8OY5ZsL8
p9xN+HrUuCPopNZZedQoTMeZzPSUkwQ=
=Ks3R
-----END PGP SIGNATURE-----

--AIux2bwC0CEBr+0s--


--===============7811788357536549102==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7811788357536549102==--

