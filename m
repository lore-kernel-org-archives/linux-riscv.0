Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F9BC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 10:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QWDrAYBiFN93wThKcKtmMD3ETnBgiX8trG4MnRHK7oA=; b=TCfCnn4a6ofY//qisIYTXR/AMn
	LLUA/3OwcoPphhNgYNJRsNAAFaYu0QnonPasdUdYT3t8rMVNCLcjWQ0j3e0uVoWGBgoSNoH/HmGQA
	jSU2CcssjgBSdsYWMPnblqbIR3NjDMNLSKquWlE5a2eutl7IR5FVBQP0DJDAEHbHBszJm1vaSIDA2
	yhVrn3E2liMaBBcTGTCG2oFTceT+XUq/1gLFTyaaV5a/68Zq69xzqsNahR1ZLED6jvF5hsBMKzimE
	6LqDopXBOIOdodHaj3WD8dftSrJlmOW354FTmU3FtqyBwh7uW2LX+7kC6a/bQJfmGwpEw6QlWtA0S
	gMT3Ew0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzazM-00CatU-2Z;
	Thu, 18 May 2023 10:36:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzazI-00Cas8-26
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 10:36:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684406160; x=1715942160;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TGbjzXlpyPDCAA+v9gTrHku4sp+phmrRg2wUR0ljEx0=;
  b=n40a+MUOTkaar2Q7S6nf5jJJNXkrrkXyuV04ehQegknKBDpD4X4kHX9W
   mysDlZOQM5GduahPNe9jZkHTPI4R95YzPZdLGTYcv1W6I2QIMU1J/1C7a
   NQDus1qb+Qg9DFA8URh/dS8klyHxM2hDGsyS5idZTbp40cms9KMV8s5S2
   z/OKU+1gnT/SokURCf1aulUwE/IdQct91ca6BawveCc2vfOkQ8Gno0WtX
   +qyyV/WrRfOe/JfFu/6Waktdgn+aONCa/9N+l+OyfGkrwEPSEGuiCOE9j
   17MHOykDXWmIIhrVRrF6xVRjfTSoPq3MCxaWvk0UtamsSLSXpPjWfiRm/
   g==;
X-IronPort-AV: E=Sophos;i="5.99,285,1677567600"; 
   d="asc'?scan'208";a="152734416"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2023 03:35:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 03:35:52 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 18 May 2023 03:35:50 -0700
Date: Thu, 18 May 2023 11:35:29 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Anup Patel <anup@brainfault.org>, Song Shuai <suagrfillet@gmail.com>,
	<robh@kernel.org>, Andrew Jones <ajones@ventanamicro.com>,
	<palmer@rivosinc.com>, <jeeheng.sia@starfivetech.com>,
	<leyfoon.tan@starfivetech.com>, <mason.huo@starfivetech.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Guo Ren <guoren@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<regressions@lists.linux.dev>
Subject: Re: Bug report: kernel paniced when system hibernates
Message-ID: <20230518-cauterize-game-636a6aac4871@wendy>
References: <CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com>
 <CAHVXubgse4Lw7ucg52FkQW4c=QrNo56BXsRZ_nkCHAAPxUXUig@mail.gmail.com>
 <CAHVXubj92O_dwGShOJgrYezqk2pA2NtFyhNFbAPyhn7=PztK6Q@mail.gmail.com>
 <20230517-preacher-primer-f41020b3376a@wendy>
 <CAHVXubhMLgb54_7zV2yFuGPoMKCkUXwozHbDvghc7kQqNLK-JA@mail.gmail.com>
 <CAAhSdy3tKAk1xjinwnSWan0ivdDapcLvSb+hGNynPFZMUsoB9A@mail.gmail.com>
 <20230518-mobilize-dipper-051dfbc41971@wendy>
 <CAHVXubhpkkC_1sYkHJvjuHB24YhmHJJ_ZvjRhzaqvygCvfbRnw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHVXubhpkkC_1sYkHJvjuHB24YhmHJJ_ZvjRhzaqvygCvfbRnw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_033600_757092_C6DA4799 
X-CRM114-Status: GOOD (  70.66  )
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
Content-Type: multipart/mixed; boundary="===============4392392041231997226=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4392392041231997226==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QTnTHD42azm6IN2F"
Content-Disposition: inline

--QTnTHD42azm6IN2F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 18, 2023 at 10:41:19AM +0200, Alexandre Ghiti wrote:
> On Thu, May 18, 2023 at 10:00=E2=80=AFAM Conor Dooley
> <conor.dooley@microchip.com> wrote:
> > On Thu, May 18, 2023 at 12:23:59PM +0530, Anup Patel wrote:
> > > On Wed, May 17, 2023 at 8:26=E2=80=AFPM Alexandre Ghiti <alexghiti@ri=
vosinc.com> wrote:
> > > > On Wed, May 17, 2023 at 1:28=E2=80=AFPM Conor Dooley <conor.dooley@=
microchip.com> wrote:
> > > > > On Wed, May 17, 2023 at 10:58:02AM +0200, Alexandre Ghiti wrote:
> > > > > > On Tue, May 16, 2023 at 1:12=E2=80=AFPM Alexandre Ghiti <alexgh=
iti@rivosinc.com> wrote:
> > > > >
> > > > > > > On Tue, May 16, 2023 at 11:24=E2=80=AFAM Song Shuai <suagrfil=
let@gmail.com> wrote:
> > > > > > > I actually removed this flag a few years ago, and I have to a=
dmit that
> > > > > > > I need to check if that's necessary: the goal of commit 33350=
68f8721
> > > > > > > ("riscv: Use PUD/P4D/PGD pages for the linear mapping") is to=
 expose
> > > > > > > the "right" start of DRAM so that we can align virtual and ph=
ysical
> > > > > > > addresses on a 1GB boundary.
> > > > > > >
> > > > > > > So I have to check if a nomap region is actually added as a
> > > > > > > memblock.memory.regions[] or not: if yes, that's perfect, let=
's add
> > > > > > > the nomap attributes to the PMP regions, otherwise, I don't t=
hink that
> > > > > > > is a good solution.
> > > > > >
> > > > > > So here is the current linear mapping without nomap in openSBI:
> > > > > >
> > > > > > ---[ Linear mapping ]---
> > > > > > 0xff60000000000000-0xff60000000200000    0x0000000080000000    =
     2M
> > > > > > PMD     D A G . . W R V
> > > > > > 0xff60000000200000-0xff60000000e00000    0x0000000080200000    =
    12M
> > > > > > PMD     D A G . . . R V
> > > > > >
> > > > > > And below the linear mapping with nomap in openSBI:
> > > > > >
> > > > > > ---[ Linear mapping ]---
> > > > > > 0xff60000000080000-0xff60000000200000    0x0000000080080000    =
  1536K
> > > > > > PTE     D A G . . W R V
> > > > > > 0xff60000000200000-0xff60000000e00000    0x0000000080200000    =
    12M
> > > > > > PMD     D A G . . . R V
> > > > > >
> > > > > > So adding nomap does not misalign virtual and physical addresse=
s, it
> > > > > > prevents the usage of 1GB page for this area though, so that's a
> > > > > > solution, we just lose this 1GB page here.
> > > > > >
> > > > > > But even though that may be the fix, I think we also need to fi=
x that
> > > > > > in the kernel as it would break compatibility with certain vers=
ions of
> > > > > > openSBI *if* we fix openSBI...So here are a few solutions:
> > > > > >
> > > > > > 1. we can mark all "mmode_resv" nodes in the device tree as nom=
ap,
> > > > > > before the linear mapping is established (IIUC, those nodes are=
 added
> > > > > > by openSBI to advertise PMP regions)
> > > > > >     -> This amounts to the same fix as opensbi and we lose the =
1GB hugepage.
> > > > >
> > > > > AFAIU, losing the 1 GB hugepage is a regression, which would make=
 this
> > > > > not an option, right?
> > > >
> > > > Not sure this is a real regression, I'd rather avoid it, but as
> > > > mentioned in my first answer, Mike Rapoport showed that it was maki=
ng
> > > > no difference performance-wise...
> >
> > My point was that if someone has hugepages enabled & we handle this in a
> > way that causes the first hugepage to be unusable, is that not a
> > regression? Whether hugepages provide a performance benefit is not
> > really related to that question AFAICT.
>=20
> Not being able to map certain regions of the linear mapping with a 1GB
> hugepage will happen, for example the kernel mapping is protected in
> the linear mapping so that it can't be written: so we can only map
> this region with 2MB hugepages. A firmware could mark a region as
> "no-map" and there again we would not be able to use a 1GB hugepage. I
> don't see that as a regression as the intention is not to *always* use
> 1GB hugepages, but rather to use them when possible. Does that make
> sense?

Ah, so it was as I expected - I don't/didn't properly understand
hugepages. Thanks.

> > Were you suggesting reverting hugepage support entirely in your original
> > message? If we entirely remove hugepage support, then I guess the first
> > hugepage cannot be lost..
>=20
> Given Mike Rapoport's recent talk, I think that's an option, yes.
>=20
> >
> > > > > > 2. we can tweak pfn_is_nosave function to *not* save pfn corres=
ponding
> > > > > > to PMP regions
> > > > > >     -> We don't lose the 1GB hugepage \o/
> > > > > > 3. we can use register_nosave_region() to not save the "mmode_r=
esv"
> > > > > > regions (x86 does that
> > > > > > https://elixir.bootlin.com/linux/v6.4-rc1/source/arch/x86/kerne=
l/e820.c#L753)
> > > > > >     -> We don't lose the 1GB hugepage \o/
> > > > > > 4. Given JeeHeng pointer to
> > > > > > https://elixir.bootlin.com/linux/v6.4-rc1/source/kernel/power/s=
napshot.c#L1340,
> > > > > > we can mark those pages as non-readable and make the hibernation
> > > > > > process not save those pages
> > > > > >     -> Very late-in-the-day idea, not sure what it's worth, we =
also
> > > > > > lose the 1GB hugepage...
> > > > >
> > > > > Ditto here re: introducing another regression.
> > > > >
> > > > > > To me, the best solution is 3 as it would prepare for other sim=
ilar
> > > > > > issues later, it is similar to x86 and it allows us to keep 1GB
> > > > > > hugepages.
> > > > > >
> > > > > > I have been thinking, and to me nomap does not provide anything=
 since
> > > > > > the kernel should not address this memory range, so if it does,=
 we
> > > > > > must fix the kernel.
> > > > > >
> > > > > > Let me know what you all think, I'll be preparing a PoC of 3 in=
 the meantime!
> > > > >
> > > > > #3 would probably get my vote too. It seems like you could use it
> > > > > dynamically if there was to be a future other provider of "mmode_=
resv"
> > > > > regions, rather than doing something location-specific.
> > > > >
> > > > > We should probably document these opensbi reserved memory nodes t=
hough
> > > > > in a dt-binding or w/e if we are going to be relying on them to n=
ot
> > > > > crash!
> > >
> > > Depending on a particular node name is fragile. If we really need
> > > information from DT then I suggest adding "no-save-restore" DT
> > > property in reserved memory nodes.
> >
> > We can add whatever properties we like, but where does that leave us for
> > the systems in the wild where their reserved memory nodes do not contain
> > a "no-save-restore" property or "no-map"?
> >
> > Ideally, yes, we do not depend on the node name and instead use explicit
> > properties - but I think we may be "forced" to fall back to checking the
> > node-name to cover the opensbi versions that do not contain one.
> > LMK if I have missed something there!
>=20
> Yes I agree with you, we can implement Anup's solution #1, but we need
> to fix the kernel anyway since if we don't, that would make the kernel
> hibernation support depend on a certain version of openSBI.

It's not unreasonable to have things depend on versions of the SBI
implementation, but it is if they're not things that can be probed using
the standard interfaces!

> > > > Yes, you're right, let's see what Atish and Anup think!
> > >
> > > I think we have two possible approaches:
> > >
> > > 1) Update OpenSBI to set "no-map" DT property for firmware
> > >     reserved regions. We were doing this previously but removed
> > >     it later for performance reasons mentioned by Alex. It is also
> > >     worth mentioning that ARM Trusted Firmware also sets "no-map"
> > >     DT property for firmware reserved regions.
> > >
> > > 2) Add a new "no-save-restore" DT property in the reserved
> > >     memory DT bindings. The hibernate support of Linux arch/riscv
> > >     will use this DT property to exclude memory regions from
> > >     save-restore. The EFI implementation of EDK2 and U-Boot
> > >     should do the following:
> > >     1) Treat all memory having "no-map" DT property as EFI
> > >         reserved memory
> > >     2) Treat all memory not having "no-map" DT property and
> > >         not having "no-save-restore" DT property as EfiBootServicesDa=
ta
> > >     3) Treat all memory not having "no-map" DT property and
> > >          having "no-save-restore" DT property as EfiRuntimeServiceData
> > >          (Refer,
> > > https://devicetree-specification.readthedocs.io/en/latest/chapter3-de=
vicenodes.html#reserved-memory-and-uefi)
> > >
> > > Personally, I am leaning towards approach#1 since approach#2
> > > will require changing DeviceTree specification as well.
> >
> > #1 is by far the simpler option of the two, if the consensus is that the
> > loss of the first hugepage is not a problem (or if it is a problem that
> > realistically is unavoidable).
>=20
> The "no-map" property does not provide much security anyway: the
> kernel should not touch a page that is reserved (this is where I may
> be wrong), so the real fix to this issue is to make the hibernation
> process not save those pages.

Right, the kernel clearly needs to be able to handle the regions. I, at
least, was commenting on re-using no-map versus creating new properties
for this situation.
I was advocating for re-using the property & changing the kernel so as
not to touch the regions during hibernation.

> > There's something else I think I might be missing here, given the
> > scattered nature of the reporting. This is not a problem for a system
> > that does not implement hibernation, which was only added in v6.4-rc1?
> >
> > That would make it not a regression after all. I think I misunderstood
> > the report on sw-dev to mean that this was a problem generally after
> > v6.4-rc1, which would have been one. Could someone please confirm that?
>=20
> The problem is only present since v6.4-rc1, that's not a regression,
> it's just that both patches landed at the same time and gave rise to
> this issue.

Sick. Glad to be wrong here!

#regzbot resolve: not a regression, feature introduced this cycle

> > If it only affects hibernation, and is not a regression, should we make
> > ARCH_HIBERNATION_POSSIBLE def_bool n in Kconfig until we have agreed on
> > a solution for the problem?

Any thoughts on this one?

--QTnTHD42azm6IN2F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZGX/cAAKCRB4tDGHoIJi
0rasAQCcwNtag1vaq27zuQLN1UPnFeR1KNguEBpz5JHe6LkngwD/bQ5ZeOtl6Jve
4+WwqQKwrihCbrjLgMjZvtJ/wSWsHAU=
=NrpG
-----END PGP SIGNATURE-----

--QTnTHD42azm6IN2F--


--===============4392392041231997226==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4392392041231997226==--

