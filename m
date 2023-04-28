Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9EC3C77B61
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Apr 2023 14:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JcARVVz6ulcs+sUmWrHnD3eNp3zwNfXVQgjaH2U/ov0=; b=2PrB6uTg693xIwYo+thwuavPcN
	r/D4iXO3RpDTwuwt5POTRMNOpssGSzXAlK+mRuTwHvW1NlzLSOiA2Rx2gkP0IXYu6hqWKl6YPRrjQ
	utS5VW/zUlzZL+aIdaRA7d7+XeIotXqd0Tz+wm4SDNeWqjSzXTaFeTUZ/L+1ay98nKypNm9XbbDn4
	te9bmzHqQYaDxlZ8sdyVnHP+gCKEcrcbMJmFQMXndj/2qqb7Qiq33mDz48qbDQhgWlFan3DVTNge6
	AdT9l0VIFZ+C1onvmo9QVA8IXQbYSDVvUhEYZ67113oB35jWqKbotCgrqE26sD1MWgq81YLPkIhrv
	/+Zhg4Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psP31-00AyAI-2M;
	Fri, 28 Apr 2023 14:26:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psP2x-00Ay40-1V
	for linux-riscv@lists.infradead.org;
	Fri, 28 Apr 2023 14:26:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1682691963; x=1714227963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gnNojlXbMDN9N2lkFqtg0abQH7uELFRlQ/gsQlbk+ZM=;
  b=TgLKopPlrVQo+eIvCZ9psb7CWlz7cF8mZvMMJj1RtLOWZjzHJAj5C638
   pBkIdPkIUqNmqX9Gzq18MMwVsLehNiU2E5VJG2jJQr4vDF1FC4BuBrMZj
   As6tr8iBzSuVZumsDP+9Eu08k3IULmV+4AbuzY+F1dl9R7DWzj87IrJmf
   nutwXWfW4wR8V0qqAnVSt0rbFxXSYlyDLjQ9SmXQ+Fi7kIsgML49oex6g
   qEbUv/BryF5u0yIwGlSeVWdB0ubJyXztRsEfxxhlfftFrsYdBirNxS1/m
   crLdaHV7000+zV/IOUoB5NoEbmq/uk20YS0OVrI7zl8BxfK6o7q2WE1eT
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,234,1677567600"; 
   d="asc'?scan'208";a="212792438"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 28 Apr 2023 07:25:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 28 Apr 2023 07:25:51 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 28 Apr 2023 07:25:49 -0700
Date: Fri, 28 Apr 2023 15:25:31 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Andrew Jones <ajones@ventanamicro.com>
CC: Conor Dooley <conor@kernel.org>, Heiko =?iso-8859-1?Q?St=FCbner?=
	<heiko@sntech.de>, <palmer@dabbelt.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <kito.cheng@sifive.com>, <jrtc27@jrtc27.com>,
	<matthias.bgg@gmail.com>, <heinrich.schuchardt@canonical.com>,
	<greentime.hu@sifive.com>, <nick.knight@sifive.com>,
	<christoph.muellner@vrull.eu>, <philipp.tomsich@vrull.eu>,
	<richard.henderson@linaro.org>, <arnd@arndb.de>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/4] RISC-V: add support for vendor-extensions via
 AT_BASE_PLATFORM and xthead
Message-ID: <20230428-versus-shady-d20735a19d41@wendy>
References: <20230424194911.264850-1-heiko.stuebner@vrull.eu>
 <20230424194911.264850-5-heiko.stuebner@vrull.eu>
 <20230426-spirits-ludicrous-a5d8275686e6@wendy>
 <5016896.Mh6RI2rZIc@diego>
 <20230427-maybe-skier-51e7cf09795c@spud>
 <d6lqggv2bbtmv7exalcqqwgbntibdxotsswataxqxhx6kmf4rg@5kgb3axdwgst>
MIME-Version: 1.0
In-Reply-To: <d6lqggv2bbtmv7exalcqqwgbntibdxotsswataxqxhx6kmf4rg@5kgb3axdwgst>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_072603_586015_4DDED889 
X-CRM114-Status: GOOD (  45.95  )
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
Content-Type: multipart/mixed; boundary="===============7242632547211416228=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7242632547211416228==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="3LKaALfH552SyaYA"
Content-Disposition: inline

--3LKaALfH552SyaYA
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 12:28:24PM +0200, Andrew Jones wrote:
> On Thu, Apr 27, 2023 at 07:28:49PM +0100, Conor Dooley wrote:
> > On Thu, Apr 27, 2023 at 07:15:58PM +0200, Heiko St=FCbner wrote:
> > > Am Mittwoch, 26. April 2023, 14:29:16 CEST schrieb Conor Dooley:
> > > > On Mon, Apr 24, 2023 at 09:49:11PM +0200, Heiko Stuebner wrote:
> > > > > From: Heiko Stuebner <heiko.stuebner@vrull.eu>
> ...
> > > > What do you mean by virtualisation here? It's the job of the hyperv=
isor
> > > > etc to make sure that what it passes to its guest contains only wha=
t it
> > > > wants the guest to see, right?
> > > > IIUC, that's another point against doing what this patch does.
> > >=20
> > > I guess I'm still seeing Zbb and friends - with just computational
> > > instructions as always good to have. But I guess you're right that the
> > > hypervisor should be able to control itself which extensions.
> >=20
> > Yah, there may not be any obvious downsides to something like Zbb, but I
> > think that taking control away from the hypervisors etc isn't a good
> > idea.
>=20
> If there's any chance that a VM will need to migrate from a host with,
> e.g. Zbb, to one without it, then the VM will need Zbb disabled from the
> start.

(Almost) Everything is obvious to someone :)

> > Having a simple policy of blocking things that are known to misbehave
> > would require less maint. than a list of things that are okay to pass
> > through, but both are probably cans-of-worms.
> > I think we need to think carefully about what policy is chosen here.
> > Allowlist will be slower, but at least we'll not tell userspace
> > something that is not usable. Blocklist will be easier to manage, but
> > can only be reactive.
>=20
> I have experience [trying] to maintain deny-lists for CPU features,
> both for x86 Xen guests and Arm KVM guests. I don't recommend it. To
> do it right, you need to be proactive, tracking upcoming CPU features
> to add the ones that can't be supported by virt or aren't ready to
> be supported by virt to the deny-list before somebody trips over them.
> In practice, usually somebody trips over it first, causing fires which
> have to be put out. If an allow-list is used, then, when a new feature
> is missed, no fires are started. The worst that can happen is somebody
> expected the feature and didn't see it, so they complain, at which
> point you add it.

Right. Blocking-unless-known is what I suggested when canvassed for an
opinion last week but the complaint was that the kernel having to
maintain a list would be a significant speed-bump for people.
With a lighter-weight method of forwarding to userspace extensions that
the kernel doesn't need to care about (no integration with
=2E._has_extension[un]likely() etc) hopefully the roadblock would be a
speedbump instead.

I think I would rather speed-bumps & complaints about things being slow,
than having to fight fires.

> > Also, in a world where we do do some sort of passing, should we only
> > forward the vendor extensions, or should we forward the standard ones
> > too?
>=20
> I guess we need to forward anything userspace can and should use.

That, combined with what we have now, would mean that userspace would
get told both what the kernel supports and additional other things that
the kernel may not support, but userspace can use without that support
being present.

I think that is a reasonable thing to do, although it'd muddy the waters
a bit with what the output in /proc/cpuinfo means. (I'm kinda taking the
particular bit of the series in isolation, as if /proc/cpuinfo is the
only place in which this information will be exposed.)

> > What about supervisor mode only stuff?
>=20
> That's not something userspace can use. If we want to expose which
> supervisor mode features the CPU has to userspace, for information
> purposes, then I think proc or sysfs would be sufficient for that.

Yeah, as above I'm kinda looking at it from a really naive "only
/proc/cpuinfo exists" point of view for the sake of simplicity.
Depending on implementation, reporting supervisor-only stuff that the
kernel supports may make life easier & there's probably some value to
someone in passing that information to userspace too.

> The downside of using an allow-list for what extensions get exposed
> to userspace is that even extensions the kernel can't/won't use
> will need a kernel patch before userspace can use them. But, as
> I stated above, that downside (people complaining a feature they
> expect is missing), is, IMO, better than the alternative of exposing
> things that shouldn't be.

Yeah, I would be in that camp too, but gotta suggest the various options
for the sake of stirring discussion :)

Thanks,
Conor.

--3LKaALfH552SyaYA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEvXWwAKCRB4tDGHoIJi
0qNHAP0c8lqCdLl8JRxRiLWW8lTRO9Rv12Dv/9leiqgd0GXaMAEAqh7oqM481ghG
Ki+qZ6DT424RfarScyqP9XK5lkaEbgc=
=LTNI
-----END PGP SIGNATURE-----

--3LKaALfH552SyaYA--


--===============7242632547211416228==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7242632547211416228==--

