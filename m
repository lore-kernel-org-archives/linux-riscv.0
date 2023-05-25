Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E115C7EE29
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9RJ08mwE/zfttkaRhlrgYNRRRYsNt4t678UyqdIg1E=; b=rp02J5/nR3KWfm5L1mxpy9O/EQ
	7EDbP6gZcGYac//D+/nsYpgWgNakEOhVLPShFfUxKeCksGDzPhZvdoClvTWdvI1V8yZsFlxqOke/u
	1JCFgOkR8OFdU16oftVAbb/hXhbB502CqeKVVexbY1ywVrrzmFYERp3V3uofL0TQCeKqjnUaQe/Af
	nOEvXOsP+sqevpQv5oK3QHjXqCQs4gidbQDiYWwRRgJp5GVTfVWDpX1rkLj2MLJPMnn7UrvEhfkAd
	IyDykrPI2hce4yKe/I1CgK4ZtUzUU343kNU6Uzy5oI6+XhBq3MzmwjHPTqEBl5uASLsSstPzekmX0
	AmzfBh5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2AiM-00GhXC-2w;
	Thu, 25 May 2023 13:09:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2AiJ-00GhWh-2c
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 13:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1685020147; x=1716556147;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=FZHfnXDUHqWO45L7noO97I0GLl4T6oUSYEyNE//HkVE=;
  b=wWzwwx7tv9m6CUZGqVsLvKUfsPMvQCiGFCZ7HXomSumVWfVzzYMP9AC9
   rER8AulZzmnjX7hp83a986PDAbYuQwWmSuSJB6HAHXb91+V7cHNf6TyCU
   d3Bs2xn3BTEAh4Ily5QOA1p1/75jlzK1JqFG5RfFfLC8QvgbvH7+iIafm
   /50PiQJa8ZFRlZQyFTIdepJn2qrE5fBzvV9wuDG6wVWENeq79J2eo1Uit
   rg0UqG0cfxH8kDu5n0CAN44+aIbLxCf+h4SjtJqcV8XsMJkuSFQFb0oro
   8ow5dfirGwcRSWhP9sqaeizC63eF8bVUEr7CEIzV6aOHfP7yTczDia8vd
   w==;
X-IronPort-AV: E=Sophos;i="6.00,191,1681196400"; 
   d="asc'?scan'208";a="217260982"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 25 May 2023 06:09:06 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 25 May 2023 06:09:06 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 25 May 2023 06:09:03 -0700
Date: Thu, 25 May 2023 14:08:41 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Atish Patra <atishp@atishpatra.org>
CC: Anup Patel <apatel@ventanamicro.com>, Alexandre Ghiti <alex@ghiti.fr>,
	<robh@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	<jeeheng.sia@starfivetech.com>, Anup Patel <anup@brainfault.org>,
	<linux-kernel@vger.kernel.org>, <palmer@rivosinc.com>,
	<leyfoon.tan@starfivetech.com>, <mason.huo@starfivetech.com>, Guo Ren
	<guoren@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Song Shuai
	<suagrfillet@gmail.com>, <linux-riscv@lists.infradead.org>, Andrew Jones
	<ajones@ventanamicro.com>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230525-guacamole-swimmer-68048a73baac@wendy>
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy>
 <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <fe8d716c-fb4f-1f3f-6c69-de1d8b9fb6af@ghiti.fr>
 <CAK9=C2X1BjZCHfYM33pZQtavu7yRqxwsypWL5OWj79bJrnDMQg@mail.gmail.com>
 <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOnJCULpa-TJuG=TtCDOxOdUviZzWheLE-GMiU1r7GWaKn0nuQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_060907_922192_7F6B869A 
X-CRM114-Status: GOOD (  44.03  )
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
Content-Type: multipart/mixed; boundary="===============6177537133278928689=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6177537133278928689==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e/nYzQDYCEl2uMHS"
Content-Disposition: inline

--e/nYzQDYCEl2uMHS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 24, 2023 at 04:45:36PM -0700, Atish Patra wrote:
> On Thu, May 18, 2023 at 7:04=E2=80=AFAM Anup Patel <apatel@ventanamicro.c=
om> wrote:
> > On Thu, May 18, 2023 at 5:39=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr>=
 wrote:
> > > On 5/18/23 08:53, Anup Patel wrote:
> > > > On Wed, May 17, 2023 at 8:26=E2=80=AFPM Alexandre Ghiti <alexghiti@=
rivosinc.com> wrote:
> > > >> On Wed, May 17, 2023 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley=
@microchip.com> wrote:

> > > > I think we have two possible approaches:
> > > >
> > > > 1) Update OpenSBI to set "no-map" DT property for firmware
> > > >      reserved regions. We were doing this previously but removed
> > > >      it later for performance reasons mentioned by Alex. It is also
> > > >      worth mentioning that ARM Trusted Firmware also sets "no-map"
> > > >      DT property for firmware reserved regions.
> > > >
> > > > 2) Add a new "no-save-restore" DT property in the reserved
> > > >      memory DT bindings. The hibernate support of Linux arch/riscv
> > > >      will use this DT property to exclude memory regions from
> > > >      save-restore. The EFI implementation of EDK2 and U-Boot
> > > >      should do the following:
> > > >      1) Treat all memory having "no-map" DT property as EFI
> > > >          reserved memory
> > > >      2) Treat all memory not having "no-map" DT property and
> > > >          not having "no-save-restore" DT property as EfiBootService=
sData
> > > >      3) Treat all memory not having "no-map" DT property and
> > > >           having "no-save-restore" DT property as EfiRuntimeService=
Data
> > > >           (Refer,
> > > > https://devicetree-specification.readthedocs.io/en/latest/chapter3-=
devicenodes.html#reserved-memory-and-uefi)
> > > >
> > > > Personally, I am leaning towards approach#1 since approach#2
> > > > will require changing DeviceTree specification as well.
> > >
> > >
> > > If needed, indeed #1 is the simplest, but I insist, to me it is not
> > > needed (and we don't have it in the current opensbi), if you have
> > > another opinion, I'm open to discuss it!
> >
>=20
> The problem with relying on the "mmode_resv" name is that there will be
> other use cases where a portion of the memory must be reserved and access=
ing
> that from the kernel will result in fault. CoVE is such a use case where
> TSM will probably run from a memory region with confidential memory
> which the kernel must not access.

We should only rely on this node name for known bad versions of opensbi
IMO. Going forward, if something needs to be reserved for firmware, the
firmware should make sure that it is reserved by using the property for
that purpose :)

> We have to name it "mmode_resv" as well or mark it as "no-map" which will
> present a hole in mappings. We will end up in same 1GB hugepage issue
> if we choose "no-map".
>=20
> Another option is to use compatible string or label property to indicate
> that this memory region is not to be saved/restored during hibernation.
> This can be documented in RISC-V DT bindings as well as the booting guide
> doc that alex was talking about.

Sure, a dt-binding for sbi reserved regions doesn't immediately sound
like an awful idea... But we still have to work around the borked
firmware - be that disabling hibernation or using the mmode_resv node
when we know that the version of OpenSBI is one of those with the
problem.

> > I agree with you, backward compatibility with older firmwares
> > is important.
> >
> This does break the compatibility with the older firmware w.r.to hibernat=
ion
> feature. However
>=20
> It is specific to hibernation only. So hibernation will fail to work
> if an user is running kernel > 6.4 but 0.8 < OpenSBI < 1.2
>=20
> The same problem lies if users use other firmware that don't have
> no-map property today. IMO, this can be documented as a known problem.

I'd rather we disabled it than documented it as broken.
Or disable _and_ document it.

> > Let's go with your proposed change to treat reserved DT nodes
> > with "mmode_resv*" name as M-mode firmware memory (it could
> > be any M-mode firmware). We will certainly need to document it
> > somewhere as an expectation of Linux RISC-V kernel.
> >
> > @Sunil How about treating "mmode_resv*" as
> > EfiRuntimeServiceData in EDK2 ? Other reserved memory
> > nodes can follow the device tree specification.
> >
>=20
> Either way, we also need to fix U-Boot to match the behavior.  Currently,
> it treats any reserved memory without no-map property as EFI_BOOT_SERVICE=
S_DATA.

Cheers,
Conor.

--e/nYzQDYCEl2uMHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG9d2QAKCRB4tDGHoIJi
0maSAQCoxOuFYoGc3O1JyCjXO6qa+zm4l++2Pqf7ZuTXvNrVEQD/Yk8gJXoswIwD
gmiA19aLLcO4jMPHJBdKls6YMKqBcg4=
=FqJr
-----END PGP SIGNATURE-----

--e/nYzQDYCEl2uMHS--


--===============6177537133278928689==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6177537133278928689==--

