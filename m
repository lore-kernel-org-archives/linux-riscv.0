Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53331C77B60
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 07:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnQYarvKYpmwCDwK5467TpajQcShYU3RW+TUfFdSRNA=; b=fTL2TudHLNdMfObhde9Zo/LyNr
	QCFXM1SNzZDWlXezcfTShExAeXsTcQRAzrCPuAc2eu/tUy6EqKgkgvmnxRzDr5Xyy+vT0mD6qWdRL
	gXjai9nQoaAUlZuwYsoPZ4qPmRPO4WJ+/Lxdrp+Roh984Hxj1ShQS7Zrv8QxqPEwFyp1xz39TTujs
	n7QeRM4e/GWTwShggHFGz6/u0lG2noLnPAqqC0cyiQQ73bFwrjTdNg82xH+aefV3yS0DaCiG3Ubpn
	DRelTGyLkvXB5iCAaLntfu5m9RhZdcYqVY6qAXgcM348EbwP5iiTx31oWb9INkDkSblico4PkU3ly
	e4PlIq0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psIw2-008U5r-1y;
	Fri, 28 Apr 2023 07:54:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psIvy-008U2u-37
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 07:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682668466; x=1714204466;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OlsA+AX7WyRohAddj2ZGazyt0PvfVc7tI53YweesSB0=;
  b=H4w+mQPbNcXwARGD9JJvh8MCXLaMBRiVwKEYsDhgjB7IVt0CG6sTxIXM
   pWs2Fpw2oS9asOLzxSROgOfAsKoeidDiPkF1lKIDGqmpN5Spmt/RAQoBD
   TM474lgA3Q61rxF1S7iZFyCFZdcT6iCC2dF/4ikNbPR0oz6/7qyoHOh9y
   7ZMQsqivK84/7xyQLD1pHVkr0A++VXEq2XVxMhcpFlhXD8+7boxTelC8h
   uasfSR0a972Y/StucgiyZC2fuva3w0jmQ07/RNZC57lS9Fo30QbP66QJ2
   QtLJtQtR3rLUgf2IeUZA45gmgllwIkUL9Bph9PZbtSCkYt2an5c5Po2jW
   A==;
X-IronPort-AV: E=Sophos;i="5.99,233,1677567600"; 
   d="asc'?scan'208";a="149397349"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Apr 2023 00:54:11 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Apr 2023 00:54:10 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Apr 2023 00:54:07 -0700
Date: Fri, 28 Apr 2023 08:53:49 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>
CC: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>, <palmer@dabbelt.com>,
	<linux-riscv@lists.infradead.org>, <paul.walmsley@sifive.com>,
	<kito.cheng@sifive.com>, <jrtc27@jrtc27.com>, <matthias.bgg@gmail.com>,
	<heinrich.schuchardt@canonical.com>, <greentime.hu@sifive.com>,
	<nick.knight@sifive.com>, <christoph.muellner@vrull.eu>,
	<philipp.tomsich@vrull.eu>, <richard.henderson@linaro.org>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] RISC-V: add support for vendor-extensions via
 AT_BASE_PLATFORM and xthead
Message-ID: <20230428-survey-uniquely-99bdc105ce3b@wendy>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-5-heiko.stuebner@vrull.eu>
 <20230426-spirits-ludicrous-a5d8275686e6@wendy>
 <5016896.Mh6RI2rZIc@diego>
 <20230427-maybe-skier-51e7cf09795c@spud>
MIME-Version: 1.0
In-Reply-To: <20230427-maybe-skier-51e7cf09795c@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_005427_220230_DC8FF93E 
X-CRM114-Status: GOOD (  61.63  )
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
Content-Type: multipart/mixed; boundary="===============1423452158659407726=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1423452158659407726==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="y5bW1V7trXX+9VZK"
Content-Disposition: inline

--y5bW1V7trXX+9VZK
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 27, 2023 at 07:28:49PM +0100, Conor Dooley wrote:
> Hey Heiko,
>=20
> On Thu, Apr 27, 2023 at 07:15:58PM +0200, Heiko St=C3=BCbner wrote:
> > Am Mittwoch, 26. April 2023, 14:29:16 CEST schrieb Conor Dooley:
> > > On Mon, Apr 24, 2023 at 09:49:11PM +0200, Heiko Stuebner wrote:
> > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> > > I'm not entirely sure if this patch is meant to be a demo, but I don't
> > > like the idea of using these registers to determine what extensions a=
re
> > > reported.
> >=20
> > It took me a while to grasp the above, but I think you mean determining
> > extensions based on mvendor etc, right?
>=20
> Yes, sorry. Apologies if that was not clear. I suppose the SBI
> implementation could (as ours does!) could report something different to
> the registers themselves, so using that word is probably not a good idea
> anyway.
>=20
> > > riscv,isa in a devicetree (for as much as I might dislike it at this
> > > point in time), or the ACPI equivalent, should be the mechanism for
> > > enabling/disabling these kinds of things.
> >=20
> > > Otherwise, we are just going to end up causing problems for ourselves
> > > with various lists of this that and the other extension for different
> > > combinations of hardware.
> > > The open source c906 has the same archid/impid too right? Assuming th=
is is
> > > a serious proposal, how would you intend dealing with modified versio=
ns
> > > of those cores?
> > >=20
> > > I am pretty sure that you intended this to be a demo though, particul=
arly
> > > given the wording of the below quote from your cover,
> >=20
> > yeah, this one was more following a train of thought. Thinking about the
> > issues, this was more of an addon thought, as I wasn't really sure which
> > way to go.
> >=20
> > So you're right, vendor isa-extensions should also come from the ISA
> > string from firmware, similar to the base extensions. Not based on the
> > mvendor-id and friends.
>=20
> :)
>=20
> > > > Things to still consider:
> > > > -------------------------
> > > > Right now both hwprobe and this approach will only pass through
> > > > extensions the kernel actually knows about itself. This should not
> > > > necessarily be needed (but could be an optional feature for e.g. vi=
rtualization).
> > >=20
> > > What do you mean by virtualisation here? It's the job of the hypervis=
or
> > > etc to make sure that what it passes to its guest contains only what =
it
> > > wants the guest to see, right?
> > > IIUC, that's another point against doing what this patch does.
> >=20
> > I guess I'm still seeing Zbb and friends - with just computational
> > instructions as always good to have. But I guess you're right that the
> > hypervisor should be able to control itself which extensions.
>=20
> Yah, there may not be any obvious downsides to something like Zbb, but I
> think that taking control away from the hypervisors etc isn't a good
> idea.
> Having a simple policy of blocking things that are known to misbehave
> would require less maint. than a list of things that are okay to pass
> through, but both are probably cans-of-worms.
> I think we need to think carefully about what policy is chosen here.
> Allowlist will be slower, but at least we'll not tell userspace
> something that is not usable. Blocklist will be easier to manage, but
> can only be reactive.
>=20
> > > > Most extensions don=E2=80=99t introduce new user-mode state that th=
e kernel needs to
> > > > manage (e.g. new registers). Extension that do introduce new user-m=
ode state
> > > > are usually disabled by default and have to be enabled by S mode or=
 M mode
> > > > (e.g. FS[1:0] for the +floating-point extension). So there should n=
ot be a
> > > > reason to filter any extensions that are unknown.
> > >=20
> > > I think in general this can be safely assumed, but I don't think it is
> > > unreasonable to expect someone may make, for example, XConorGigaVector
> > > that gets turned on by the same bits as regular old vector but has so=
me
> > > extra registers.
> > > Not saying that I think that that is a good idea, but it is a distinct
> > > possibility that this will happen, and I don't think forwarding it to
> > > userspace is a good idea.
> >=20
> > The thead-vector (0.7.1) would probably fit this description. Though in
> > that case, userspace definitly needs to know about it, to use it :-) .
> >=20
> > But of course this should only be forwarded when relevant support
> > is available in the kernel.
>=20
> Right. IIRC, the plan for that is to add `v` to riscv,isa & alternatives
> will do the rest as opposed to doing an `_xtheadvector` type thing.
>=20
> Assuming the latter for a moment, we'd have to blacklist `_xheadvector`
> for kernels compiled without vector support even if the relevant support
> is added to the kernel. Similarly, we'd have to blacklist it for kernels
> with vector support, but without the erratum enabled.
>=20
> I think the plan was the former though, so you'd have to block passing
> `v` to userspace if vector is enabled and the erratum is not supported.
> Should ERRATA_THEAD_VECTOR be mandatory then for RISCV_ISA_VECTOR &&
> ERRATA_THEAD kernels?

> What am I missing?

I think what I missed is that for riscv,isa containing `_xtheadvector`
but a kernel without support for vector then we'd hit Andy's
trap-on-first-use and that's one of the cases that don't need to be
considered here.

> Also, in a world where we do do some sort of passing, should we only
> forward the vendor extensions, or should we forward the standard ones
> too?
> What about supervisor mode only stuff? There's a bunch of questions to
> consider here, even if for some of them the answer may be obvious.
>=20
> As I said, not really bothered about hwprobe, aux vector etc, but this
> side of things is particularly interesting to me.
>=20
> Cheers,
> Conor.



--y5bW1V7trXX+9VZK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEt7gQAKCRB4tDGHoIJi
0gvTAP9v25hf36KUdcSWM6VwpCVXzeAKy7CvWw66jh3chdPECgD7B109eUCb+KO/
1DXwoW8m6oj1K0zu8rMpdQzxW0WcPgs=
=4qRX
-----END PGP SIGNATURE-----

--y5bW1V7trXX+9VZK--


--===============1423452158659407726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1423452158659407726==--

