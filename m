Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213C6C7EE23
	for <linux-riscv@archiver.kernel.org>; Wed, 17 May 2023 11:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m3irWf7J+7O8EGB8PMCrLgJRtffUf+K6zsPzJ314bBw=; b=EE3W9Gi/9escXzeHiltBluFpJz
	QNWD3yiGGD1M10mTFBRGXn0YLVZsa6tGWEVViw2EyW+hxmwdEfBeHylTenD140ezfZ/2sSU1jywmH
	wKOGXb87mFkpRBXBilhgHMQd6d98y4TpZHyajkpVXF5pbTeV/pZwNrN0Xiz0XYwKjp9IK+5byjRaI
	ejAVTgpPc1HyMGoOJp8SnrIeUQRnmvmTRrjCtYGxfqomefnKafJTjTMmWOJlmItigSdOCviHMWPWC
	/2LcnfdUy+VSWlk/jwWur0PQDTjKKu3y+7DFoRPbcgvNAF62kBBdq+8DG7smIwLl2dFbuRsQgCYk2
	lLpqecbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFKH-009bU2-1s;
	Wed, 17 May 2023 11:28:13 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzFKD-009bRq-0P
	for linux-riscv@lists.infradead.org;
	Wed, 17 May 2023 11:28:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684322890; x=1715858890;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=USREqE8lRmbgXvnU/8dLwkbI7tqJwD1a8ZDS5Hs3u8I=;
  b=s/K9pkG04faSsK39ac14MYm6fXJADuf2qs2XqZnFy1a0bPNq2xj8/DVl
   eY+9tLNiSSrNxUI6YLysJGOo6ptYfUNC4sympvtGpDec2A+8Ora5Zh07X
   B5FrDNBksFgiqgkemMuvMBOeLVKp7xgIsW/M3P/z/nU6UPHxGR0PSspl4
   OS8ucPz6rd3ZyXIYOsaqu1U5tdBsQgRUGPBNc+AsxTmKqdg5hD7XYoFUT
   a0ShFeFrXBrj0FdvzRHA8ckX6+aNvFAJLqDIySoAM5nE00wz8oVZ+35pz
   0cozEwjcwWgVzOyQSXdWSnvJr526bllbYfz7PE1WtN+cY+/QF8oTD0p4J
   g==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600"; 
   d="asc'?scan'208";a="214265850"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 04:27:55 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 04:27:53 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 17 May 2023 04:27:51 -0700
Date: Wed, 17 May 2023 12:27:30 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Song Shuai <suagrfillet@gmail.com>, <robh@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, <anup@brainfault.org>, <palmer@rivosinc.com>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>,
	<mason.huo@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, Guo
 Ren <guoren@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230517-preacher-primer-f41020b3376a@wendy>
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230517_042809_369631_146B1D91 
X-CRM114-Status: GOOD (  30.40  )
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
Content-Type: multipart/mixed; boundary="===============5583463817893970674=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5583463817893970674==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6w54c5FuSo5Xd9WG"
Content-Disposition: inline

--6w54c5FuSo5Xd9WG
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

On Wed, May 17, 2023 at 10:58:02AM +0200, Alexandre Ghiti wrote:
> On Tue, May 16, 2023 at 1:12=E2=80=AFPM Alexandre Ghiti <alexghiti@rivosi=
nc.com> wrote:

> > On Tue, May 16, 2023 at 11:24=E2=80=AFAM Song Shuai <suagrfillet@gmail.=
com> wrote:
> > I actually removed this flag a few years ago, and I have to admit that
> > I need to check if that's necessary: the goal of commit 3335068f8721
> > ("riscv: Use PUD/P4D/PGD pages for the linear mapping") is to expose
> > the "right" start of DRAM so that we can align virtual and physical
> > addresses on a 1GB boundary.
> >
> > So I have to check if a nomap region is actually added as a
> > memblock.memory.regions[] or not: if yes, that's perfect, let's add
> > the nomap attributes to the PMP regions, otherwise, I don't think that
> > is a good solution.
>=20
> So here is the current linear mapping without nomap in openSBI:
>=20
> ---[ Linear mapping ]---
> 0xff60000000000000-0xff60000000200000    0x0000000080000000         2M
> PMD     D A G . . W R V
> 0xff60000000200000-0xff60000000e00000    0x0000000080200000        12M
> PMD     D A G . . . R V
>=20
> And below the linear mapping with nomap in openSBI:
>=20
> ---[ Linear mapping ]---
> 0xff60000000080000-0xff60000000200000    0x0000000080080000      1536K
> PTE     D A G . . W R V
> 0xff60000000200000-0xff60000000e00000    0x0000000080200000        12M
> PMD     D A G . . . R V
>=20
> So adding nomap does not misalign virtual and physical addresses, it
> prevents the usage of 1GB page for this area though, so that's a
> solution, we just lose this 1GB page here.
>=20
> But even though that may be the fix, I think we also need to fix that
> in the kernel as it would break compatibility with certain versions of
> openSBI *if* we fix openSBI...So here are a few solutions:
>=20
> 1. we can mark all "mmode_resv" nodes in the device tree as nomap,
> before the linear mapping is established (IIUC, those nodes are added
> by openSBI to advertise PMP regions)
>     -> This amounts to the same fix as opensbi and we lose the 1GB hugepa=
ge.

AFAIU, losing the 1 GB hugepage is a regression, which would make this
not an option, right?

> 2. we can tweak pfn_is_nosave function to *not* save pfn corresponding
> to PMP regions
>     -> We don't lose the 1GB hugepage \o/
> 3. we can use register_nosave_region() to not save the "mmode_resv"
> regions (x86 does that
> https://elixir.bootlin.com/linux/v6.4-rc1/source/arch/x86/kernel/e820.c#L=
753)
>     -> We don't lose the 1GB hugepage \o/
> 4. Given JeeHeng pointer to
> https://elixir.bootlin.com/linux/v6.4-rc1/source/kernel/power/snapshot.c#=
L1340,
> we can mark those pages as non-readable and make the hibernation
> process not save those pages
>     -> Very late-in-the-day idea, not sure what it's worth, we also
> lose the 1GB hugepage...

Ditto here re: introducing another regression.

> To me, the best solution is 3 as it would prepare for other similar
> issues later, it is similar to x86 and it allows us to keep 1GB
> hugepages.
>=20
> I have been thinking, and to me nomap does not provide anything since
> the kernel should not address this memory range, so if it does, we
> must fix the kernel.
>=20
> Let me know what you all think, I'll be preparing a PoC of 3 in the meant=
ime!

#3 would probably get my vote too. It seems like you could use it
dynamically if there was to be a future other provider of "mmode_resv"
regions, rather than doing something location-specific.

We should probably document these opensbi reserved memory nodes though
in a dt-binding or w/e if we are going to be relying on them to not
crash!

Thanks for working on this,
Conor.


--6w54c5FuSo5Xd9WG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGS6IgAKCRB4tDGHoIJi
0qsIAQCtlGg/uMm4zz/vWITkgyLV+LGXakABee0MyRtoPfADJgEAhWfiM9TB46v4
4k0/ko1bu+Hxn6d2KvY+53/VT6P1DQk=
=YttE
-----END PGP SIGNATURE-----

--6w54c5FuSo5Xd9WG--


--===============5583463817893970674==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5583463817893970674==--

