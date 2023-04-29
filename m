Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E4CC77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 19:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hwJguUTCyze9mUNnf2SMusv8yomsfGtQNF1w4+J2nfs=; b=u8dtZ5mN1Dt5SfmZ5ihlCgKpgL
	ByhaPfthPjWclwIm5NuZ81FF4b+pbwNj/6rAdHflgmS/AVfBW0fuEnkuiUqaWaIX+pm0QxD23buL9
	2RUSiUHV7N05viuqrSoZvBMbi2HwcJI89RD5u0iVUItYrzZHI+U0Ld5+cHo90sTxjUu9Yq/MOk3oW
	EOqXmv5xyYplXG7Q5ZpxhLZP+yX75xUyaXsmsSNbtNJce+vTqiKAPt90K+EfjVbOEslZ2KQ8Krmv2
	4RNzcnMpoNUxFE5h87ApFIG2V1F4Vyx1wJQ5hla1IWColSRJ5mR4K4vxRL9R9jONu+glIlAv6bKCr
	hgxNlOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pspzI-00D33t-0D;
	Sat, 29 Apr 2023 19:12:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pspzF-00D33E-0X
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 19:12:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0FEBE60A3B;
	Sat, 29 Apr 2023 19:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5EEFC433EF;
	Sat, 29 Apr 2023 19:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682795517;
	bh=RvfSv2vXhrQXd/FezE4UM1R+ph+dMkTIsCqUvf6TQ98=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFtiN7tyRAJL1OqdrOMeX7uU3dLn0XbUColcbDm2uLnMYAa1bI5mBpQGC1I9fDcti
	 MJqCKepChG+Su0LzxvKj3H2+SIZ0cV2YEXNrDoxG+K3XsLoRoBhjLG0UURF0jxPbiT
	 1BkvAcqnJ5X7zqdpcRQDWtguJVHB0/vXpGgnbcWKbBOt1bA0mqYjxEDZbf5lp2TFbF
	 UD2Wf80q/eWOshi2jcd6KDMK1CbLALFWxpXmEwgdUS9Hv91zoH1c66ZpaJAdrhw6WA
	 pR0NEGqsJkNQP2c6zRxsDCz6e2tmIcDmKb/fFeoxMzhoj6d8jQSR10J+6VBr2Rvt/6
	 cDoNlrLdKjpFA==
Date: Sat, 29 Apr 2023 20:11:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2] RISC-V: fix sifive and thead section mismatches in
 errata
Message-ID: <20230429-dandy-gush-6f5da93055bc@spud>
References: <20230429155247.12131-1-rdunlap@infradead.org>
 <CALs-HsuG3EFBs60sgiMcPHoE1dF7mhi3GKt=AWvRPaUHAfA88Q@mail.gmail.com>
 <20230429-outboard-hypocrite-983e977103d2@spud>
 <CALs-HstrR3Cm3jQKt6dmfYiRRVkAVibAZDtFo0wmXz4LEvRf_A@mail.gmail.com>
 <37e6b325-44e4-8e65-68e3-eab2943018ac@infradead.org>
 <CALs-Hss3b86zAqohK9NYEkzn+pnLeMB37qaj1EA6f6bRkFWwCg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CALs-Hss3b86zAqohK9NYEkzn+pnLeMB37qaj1EA6f6bRkFWwCg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_121201_298771_2D636F9F 
X-CRM114-Status: GOOD (  24.73  )
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
Content-Type: multipart/mixed; boundary="===============9005149150841005385=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9005149150841005385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qFdXsuwzHEGiYpiV"
Content-Disposition: inline


--qFdXsuwzHEGiYpiV
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 29, 2023 at 12:06:19PM -0700, Evan Green wrote:
> On Sat, Apr 29, 2023 at 10:58=E2=80=AFAM Randy Dunlap <rdunlap@infradead.=
org> wrote:
> >
> >
> >
> > On 4/29/23 10:48, Evan Green wrote:
> > > On Sat, Apr 29, 2023 at 10:24=E2=80=AFAM Conor Dooley <conor@kernel.o=
rg> wrote:
> > >>
> > >> On Sat, Apr 29, 2023 at 10:21:39AM -0700, Evan Green wrote:
> > >>> On Sat, Apr 29, 2023 at 8:52=E2=80=AFAM Randy Dunlap <rdunlap@infra=
dead.org> wrote:
> > >>>>
> > >>>> When CONFIG_MODULES is set, __init_or_module becomes <empty>, but =
when
> > >>>> CONFIG_MODULES is not set, __init_or_module becomes __init.
> > >>>> In the latter case, it causes section mismatch warnings:
> > >>>>
> > >>>> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_=
fill_cpu_mfr_info (section: .text) -> sifive_errata_patch_func (section: .i=
nit.text)
> > >>>> WARNING: modpost: vmlinux.o: section mismatch in reference: riscv_=
fill_cpu_mfr_info (section: .text) -> thead_errata_patch_func (section: .in=
it.text)
> > >>>>
> > >>>> Fixes: bb3f89487fd9 ("RISC-V: hwprobe: Remove __init on probe_vend=
or_features()")
> > >>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> > >>>> Cc: Heiko Stuebner <heiko@sntech.de>
> > >>>> Cc: Paul Walmsley <paul.walmsley@sifive.com>
> > >>>> Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > >>>> Cc: Albert Ou <aou@eecs.berkeley.edu>
> > >>>> Cc: linux-riscv@lists.infradead.org
> > >>>> Cc: Conor Dooley <conor@kernel.org>
> > >>>> Cc: Evan Green <evan@rivosinc.com>
> > >>>> ---
> > >>>
> > >>> Thanks, Randy. I'm confused at how I didn't see that when I made the
> > >>> original fix. I feel like repro of these section mismatch errors
> > >>> depend on some other factor I'm not understanding. In any case:
> > >>
> > >> Perhaps you had a cut-down config that did not enable either of the
> > >> relevant ARCH_ options to get those errata compiled?
> > >
> > > It was weird, my original "fix" (the one listed in this Fixes tag) was
> > > needed because while the hwprobe series was clean on Palmer's branch,
> > > it generated a "section mismatch" on linux-next. As noted here, it was
> > > only with !CONFIG_MODULES, so I explicitly remember generating that
> > > config and checking it on linux-next to generate this "fix", and it
> > > came out clean. It's like the robots are getting smarter.
> > > -Evan
> >
> > I observed the problem in 8 out of 20 randconfig builds,
> > using linux-next 20230427.
>=20
> Oh interesting, so not the stock k210_nommu defconfig. That makes me
> feel a little better at least.

Ohh man, that's a pretty bad config to try use (if that's your default)
for build testing stuff. The k210_mmu defconfig doesn't enable anything
other than SOC_CANAAN.
I could reproduce Randy's issue on defconfig w/ CONFIG_MODULES disabled.

--qFdXsuwzHEGiYpiV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE1r+QAKCRB4tDGHoIJi
0lMAAP9Yzh1VwUUltw6hlBNuhfRgwEhTKtB7BRE3pAN2cJsS3gEAw/ruaaFT0dyk
VjeOLC2Kb/tzs4sxNU8jzEiNHondEA4=
=XMXc
-----END PGP SIGNATURE-----

--qFdXsuwzHEGiYpiV--


--===============9005149150841005385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9005149150841005385==--

