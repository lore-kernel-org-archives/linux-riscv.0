Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1B2C6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 11:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+JTLR/ins8TUgcCBEHdg+GuNiF7uT3/j/f/Lg5msurI=; b=b2skzKiqI3jYYyTW1E4yBBvjHB
	cdmHijV3ZsvTFeSo8fBufhZpStsYuP+mC/HShgNUTTBfrkdpMA0oMHD9K/Kt/AuFHAidVvrnSDuW0
	NGvzkboxEK5g4NfHraG3w9agnrZTynes8n8BnGmj6DlFXXYMREUvg7D2mQrDsZYeBTAQht5rrDvoO
	Fj+ZksAJZ0642H+vNlHdU+PqHe5gu9DS2Mycxh5FaWJYZRkwdgDa4Us0mCo9CgkNee59JEP2t2Vim
	b157dbee6i5IP7hsMQvf2wUA/HPsRiopU8DZIIifaRS0k0BQD1Ta4Gqt/9USm3TpWcL4nHUEbbm+k
	6fu5/aNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqARZ-00000000CEX-34qf;
	Fri, 29 Mar 2024 11:30:45 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqARW-00000000CDS-42od
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 11:30:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1711711842; x=1743247842;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=13krIrWdbST8v3yx5rl7fjDLRbAzYR65lIGFUqhG+oA=;
  b=N1EYpg3koD7rHcQTq37PkpFqKIhHwsx/27nyO/c1H9nVeQMfl1BgTJOK
   hG3Lq0MFDNFZ2WW+qGgkpcHCkKdaTXDwlztW3/hfDKK3QZigehMCOu91V
   SquDnzFmfeW4zYt+UqpuiM7zg9FECrf07d+ddUdslXluj++J9YSX6nowe
   WnNk2qk84rSA4+FLSDMNXX6ugwgbPz3coZA2V6KNECit/OrcE1R5G0i5M
   sH5ESqwTN4bevNQvdpJKogTN1fltaFsIfrWs4IkaWsTU32kcfJQ+t+Uj/
   b6vjn2x72XV9SYYhK+2oLN0HuQ5xip8Bh4ocNZxfXZXfxcbq0v7jHoDYw
   w==;
X-CSE-ConnectionGUID: VjcjNiXvSMOOtP+t5GkgKw==
X-CSE-MsgGUID: ZjKAbW9+Tayr/orz1ajTQQ==
X-IronPort-AV: E=Sophos;i="6.07,164,1708412400"; 
   d="asc'?scan'208";a="18645508"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Mar 2024 04:30:40 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 29 Mar 2024 04:30:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Fri, 29 Mar 2024 04:29:57 -0700
Date: Fri, 29 Mar 2024 11:29:08 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Christoph =?iso-8859-1?Q?M=FCllner?= <christoph.muellner@vrull.eu>
CC: Alexandre Ghiti <alex@ghiti.fr>, Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor@kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>, =?iso-8859-1?Q?Bj=F6rn_T=F6pel?=
	<bjorn@kernel.org>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Heiko Stuebner <heiko@sntech.de>, Cooper Qu <cooper.qu@linux.alibaba.com>,
	Zhiwei Liu <zhiwei_liu@linux.alibaba.com>, Huang Tao
	<eric.huang@linux.alibaba.com>, Alistair Francis <alistair.francis@wdc.com>
Subject: Re: [PATCH 2/2] riscv: T-Head: Test availability bit before enabling
 MAEE errata
Message-ID: <20240329-mongrel-empathy-7c9d12b6939c@wendy>
References: <20240327103130.3651950-1-christoph.muellner@vrull.eu>
 <20240327103130.3651950-3-christoph.muellner@vrull.eu>
 <20240327-imperfect-washbowl-d95e57cef0ef@spud>
 <20240327-77a6b64153a68452d0438999@orel>
 <CAEg0e7jyGZV3+04HNYzgfHMGYT9wV_c0A=ekpCRi3L-5yjxK=w@mail.gmail.com>
 <7354b054-9eda-45a6-9503-ff30a1c9c276@ghiti.fr>
 <CAEg0e7iAUWgT9BfaBQiKg6RUCL7RvCq43+ShpbGU7bxWuTYtag@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAEg0e7iAUWgT9BfaBQiKg6RUCL7RvCq43+ShpbGU7bxWuTYtag@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_043043_050186_4C5F8428 
X-CRM114-Status: GOOD (  49.17  )
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
Content-Type: multipart/mixed; boundary="===============0391512240990155174=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0391512240990155174==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="T/FpnQkc8PLt05ni"
Content-Disposition: inline

--T/FpnQkc8PLt05ni
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 12:22:51PM +0100, Christoph M=C3=BCllner wrote:
> On Thu, Mar 28, 2024 at 4:43=E2=80=AFPM Alexandre Ghiti <alex@ghiti.fr> w=
rote:
> >
> > Hi Christoph,
> >
> > On 28/03/2024 15:18, Christoph M=C3=BCllner wrote:
> > > On Wed, Mar 27, 2024 at 1:41=E2=80=AFPM Andrew Jones <ajones@ventanam=
icro.com> wrote:
> > >> On Wed, Mar 27, 2024 at 11:03:06AM +0000, Conor Dooley wrote:
> > >>> On Wed, Mar 27, 2024 at 11:31:30AM +0100, Christoph M=C3=BCllner wr=
ote:
> > >>>> T-Head's MAEE mechanism (non-compatible equivalent of RVI's Svpbmt)
> > >>>> is currently assumed for all T-Head harts. However, QEMU recently
> > >>>> decided to drop acceptance of guests that write reserved bits in P=
TEs.
> > >>>> As MAEE uses reserved bits in PTEs and Linux applies the MAEE erra=
ta
> > >>>> for all T-Head harts, this broke the Linux startup on QEMU emulati=
ons
> > >>>> of the C906 emulation.
> > >>>>
> > >>>> This patch attempts to address this issue by testing the MAEE bit
> > >>>> in TH_MXSTATUS CSR. As the TH_MXSTATUS CSR is only accessible in M=
-mode
> > >>>> this patch depends on M-mode firmware that handles this for us
> > >>>> transparently.
> > >>>>
> > >>>> As this patch breaks Linux bootup on all C9xx machines with MAEE,
> > >>>> which don't have M-mode firmware that handles the access to the
> > >>>> TH_MXSTATUS CSR, this patch is marked as RFC.
> > >> Can we wrap the csr access in a _ASM_EXTABLE()? If firmware handles =
it,
> > >> then we return true/false based on the value. If firmware doesn't ha=
ndle
> > >> it, and we get an illegal instruction exception, then we assume the =
bit
> > >> is set, which is the current behavior.
> > >>
> > >>> I think this is gonna be unacceptable in its current state given th=
at it
> > >>> causes problems for every other version of the firmware. Breaking r=
eal
> > >>> systems for the sake of emulation isn't something we can reasonably=
 do.
> > >>>
> > >>> To make this sort of change acceptable, you're gonna have to add so=
me way
> > >>> to differentiate between systems that do and do not support reading=
 this
> > >>> CSR. I think we either a) need to check the version of the SBI
> > >>> implementation to see if it hits the threshold for supporting this
> > >>> feature, or b) add a specific SBI call for this so that we can
> > >>> differentiate between firmware not supporting the function and the
> > >> The FWFT SBI extension is being developed as a mechanism for S-mode =
to ask
> > >> M-mode things like this, but I think that extension should be used f=
or
> > >> features that have potential to be changed by S-mode (even if not
> > >> everything will be changeable on all platforms), whereas anything th=
at's
> > >> read-only would be better with...
> > >>
> > >>> quote-unquote "hardware" not supporting it. I don't really like opt=
ion a)
> > >>> as it could grow to several different options (each for a different=
 SBI
> > >>> implementation) and support for reading the CSR would need to be
> > >>> unconditional. I have a feeling that I am missing something though,
> > >>> that'd make it doable without introducing a new call.
> > >>>
> > >>> Thanks,
> > >>> Conor.
> > >>>
> > >>> If only we'd made enabling this be controlled by a specific DT prop=
erty,
> > >>> then disabling it in QEMU would be as simple as not setting that
> > >>> property :(
> > >> ...this, where "DT property" is "ISA extension name". I wonder if we
> > >> shouldn't start considering the invention of xlinux_vendor_xyz type
> > >> extension names which firmware could add to the ISA string / array,
> > >> in order to communicate read-only information like this?
> > >>
> > >> Thanks,
> > >> drew
> > > Hi Conor and Drew,
> > >
> > > Thank you for your hints.
> > > I fully agree with all your statements and concerns.
> > >
> > > Switching from th.mxstatus to th.sxstatus should address all mentione=
d concerns:
> > > * no dependency on OpenSBI changes
> > > * no break of functionality
> > > * no need for graceful handling of CSR read failures
> > > * no need to differentiate between HW and emulation (assuming QEMU
> > > accepts the emulation of th.sxstatus)
> > >
> > > Also note that DT handling would be difficult, because we need to pro=
be before
> > > setting up the page table.
> >
> >
> > We already parse the DT before setting the page table to disable KASLR
> > and to parse "no4lvl" or "no5lvl" command line parameters. Take a look
> > at the kernel/pi directory and setup_vm() in mm/init.c.
>=20
> Ah, I see. So, this can be done with a function similar to
> get_kaslr_seed() in arch/riscv/kernel/pi/fdt_early.c.
> And the Makefile will apply the necessary steps to get this working.
> The downside is that depending on new information in the DT, it will not =
be
> backward compatible. So, I don't see a way around probing th.sxstatus.MAE=
E.

Aye, you're right here. My suggestion about using DT was only for if
there were T-Head CPUs that turned up in the future with non-zero values
for marchid or mimpid. Requiring it for the CPUs we're talking about at
the moment (e.g. c906) would, as you pointed out yourself, cause the same
sort of regression that relying on an updated firmware would.
> Independent of that, there is work to be done for the T-Head extension
> discovery in the Linux kernel:
> * XThead* extensions are not in the DTS
> * XThead* extensions are not parsed during bootup
> * XThead* extensions don't trigger optimizations (string ops) or errata (=
MAEE)
> * XThead* extensions are not exported via hwprobe

> However, I think this is independent of addressing the MAEE issue.
> So, I will send out a V2 with the th.sxstatus.MAEE probing only.

th.sxstatus seems perfect here since it solves the problem you're
looking to deal with in emulation while being not introducing
regressions for real devices.

Thanks,
Conor.

--T/FpnQkc8PLt05ni
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZgamBAAKCRB4tDGHoIJi
0nOfAP4+Op/5F8BAG6p5nR4879yKIjDmQDhUfDUpJZjY6pjFGQEAuO0Hp59KwwuO
AdFnNXyw/zldgXgM59ClmzjkWeggmAQ=
=BTil
-----END PGP SIGNATURE-----

--T/FpnQkc8PLt05ni--


--===============0391512240990155174==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0391512240990155174==--

