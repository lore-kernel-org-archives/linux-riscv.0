Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8220C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Jan 2023 15:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+Agickjxh5De9FmEhoTpfMIi7jc4yLW9BBUHfwRAig=; b=2MyihhpZMRk1W6VhqDlYeuhkTY
	+QvzHONfowip3yvtDrIv0yciynoerts4g7w/QLQaxornWT420pXY0ExylItSWftf5xbF9FdGRQHPX
	TxpzvFWHgHPjay1HjigG/frr/89K/TWpfAHk8VofTF7TifXSApea8oK8Vix+hjMzZsrVvVfOHdCOo
	QYDgWe9eIPCWTFrapolNWvabTzqwlkyOGuAQJdw3J9ilhiN5LETJX7u52ZfZkLC81LG48ctNnYAkP
	nMLZnKtXt12FjtM7qjpzrFurUsAstKDl006hATGTz0wa7OnrUrBmi4vNIhH4A6Z9yDCVJMa3pFl7a
	TMzaCJIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD5Qq-009zAS-QA; Wed, 04 Jan 2023 15:11:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pD2j8-0090Tk-9a
	for linux-riscv@lists.infradead.org; Wed, 04 Jan 2023 12:18:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A005B81628;
	Wed,  4 Jan 2023 12:18:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00A91C433D2;
	Wed,  4 Jan 2023 12:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672834712;
	bh=BBokf/LwUEaFBIuimFzNPIMdoPX5hGYHwIwbb2Xdh90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OgOxukepvQDcs1Ov90Jt5SuxeXEfk6vyHOy2vs5XAABo0oUwTsCgpbPW2M+4HTE1i
	 f11CKpdGLWUR74sVdwb6P8smyAsS9LOo6tVIZ73i6OIDGxmWKKqhfSXAVFcq64URiT
	 15a7rvbDUXRnDTVb+piNL2bVk5jPy3Ai7peTZkCdLAz6H3JoHIS4NbDxwHGYEu2+8o
	 gAjCd6rG3o2XvR1rWSTX3u7oh6u08oS2caahKF0u/5CDscXDA1PFSBqOPCrQ1k4pf0
	 8yEDb+o04aseO5MSNwTcBse9YxadbUPxMsUHU8j3FsulztCFtjPlrmGXlc4MHAxRzg
	 S5Snl3jGKQ9Ig==
Date: Wed, 4 Jan 2023 12:18:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Ley Foon Tan <lftan.linux@gmail.com>
Subject: Re: [PATCH] riscv: Move call to init_cpu_topology() to later
 initialization stage
Message-ID: <Y7VulIcGwuXvBES6@spud>
References: <20230103035316.3841303-1-leyfoon.tan@starfivetech.com>
 <20230103065411.2l7k6r57v4phrnos@orel>
 <efed8f35ae8c4901ba01702bcc07b511@EXMBX161.cuchost.com>
 <Y7Rg28suWh1RUbkU@spud>
 <672440143ab04d3dbcc6de0a16bab3e1@EXMBX161.cuchost.com>
 <F86CD957-8B7C-46B9-A14B-AAE67E43CD71@kernel.org>
 <20230104104900.aohsn6zemfllub7r@bogus>
MIME-Version: 1.0
In-Reply-To: <20230104104900.aohsn6zemfllub7r@bogus>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230104_041838_674144_956213B9 
X-CRM114-Status: GOOD (  36.74  )
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
Content-Type: multipart/mixed; boundary="===============0456105231371957128=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0456105231371957128==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="E4qsw02zS2eRyVMo"
Content-Disposition: inline


--E4qsw02zS2eRyVMo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Sudeep,

On Wed, Jan 04, 2023 at 10:49:00AM +0000, Sudeep Holla wrote:
> On Wed, Jan 04, 2023 at 09:49:48AM +0000, Conor Dooley wrote:
>=20
> [...]
>=20
> > >> Uhh, so where did this "capacity-dmips-mhz" property actually come f=
rom?
> > >> I had a quick check of qemu with grep & I don't see anything there t=
hat
> > >> would add this property.
> > >> This property should not be valid on anything other than arm AFAICT.
> > >
> > >This DT parameter is not in default Qemu. I've added it for testing (s=
ee test steps in below).=20
> > >This is preparation to support asymmetric CPU topology for RISC-V.
> >=20
> > The property is only valid on arm, so how does arm64 deal with such
> > asymmetric topologies without it?
>=20
> I don't think we can deal with asymmetric topologies without this.
> Yes we can detect the difference in the CPU types but we can only assume
> there are symmetric in terms of performance in absence of this property.


I looked at the bindings for it and forgot that the arm directory of
bindings applies to both arm and arm64. I see now that it is also used
on arm64.

>=20
> > Why should we "fix" something that may never be a valid dts?
> >
>=20
> I would not say invalid. But surely absence of it must be handled and
> we do that for sure. IIRC, here the presence of it is causing the issue.
> And if it is present means someone is trying to build it(I do understand
> this is Qemu but is quite common these days for power and performance
> balance in many SoC)

I said "invalid" as the binding is defined for arm{,64} in arm/cpus.yaml
& documented in the same directory in cpu-capacity.txt, but not yet on
riscv. All bets are off if your cpu node is using invalid properties
IMO, at least this one will fail to boot!

However, I see no reason (at this point) that we should deviate from
what arm{,64} is doing & that documenation should probably move to a
shared location at some point.

> > >>=20
> > >> I know arm64 does this, but there is any real reason for us to do so?
> > >> @Sudeep, do you know why arm64 calls that each time?
> >=20
> > I got myself mixed up between places I fiddled with storing the topolog=
y, so you can ignore that question Sudeep.
> > Clearly it's the one in smp_callin() that gets called for each CPU.
> > Woops.
> >=20
>=20
> Hmm I should have read all the messages in the thread. Doing by date/time
> didn't work well for me =F0=9F=98=84.

Meh, my fault for getting confused ;)

> > >> Or if it is worth "saving" that call on riscv, since arm64 is clearl=
y happily calling
> > >> it for many years & calling it later would likely head off a good fe=
w allocation
> > >> issues (like the one we saw with the topology reworking a few months=
 ago).
> >=20
> > ...but is it still worth moving the function call later to head off any=
 allocation failures if core topology code changes?
> >
>=20
> Agreed, given how we faced similar issues with cacheinfo on few RISC-V
> platforms.

Sweet, sounds like a plan to me. I'll go suggest some commit message
re-wording I think.

Thanks Sudeep!


--E4qsw02zS2eRyVMo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY7VulAAKCRB4tDGHoIJi
0hRNAPwOMptZ0yNS8f8cq5EtOM4Weha3qZ4gdjGPHnr/N9TCwQEAiMxFnvGdbNoU
7HCl4PVqXKGo6OOZfHry5a7XDHhfwQ4=
=2bou
-----END PGP SIGNATURE-----

--E4qsw02zS2eRyVMo--


--===============0456105231371957128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0456105231371957128==--

