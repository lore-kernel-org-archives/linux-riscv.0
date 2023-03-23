Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84CE9C6FD1C
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Mar 2023 22:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MjDBtUmmxEpgiPob/iD/LOa8s9WdX9BLD9PrA5zi/Y=; b=Xw2uAUbPo0XDdMDpudH2W2YuaL
	xYYYktoqdCnmjdne6cmk83ExxUxr84S9kP/I+oKByilfeY2aYiGq73mz8h8DMEx+fD+icNU39hvy6
	6QznWrYIcDM9wP7tbc2tEWxeOls/hjk/0BIvFUeUJWVJ9rmn7HWXIGL8NEjQmljbWLlmT5EzE6RXj
	9lNh0q6UnyfslO9OHU3/ND0QL6bV8a+/Pu67p8hTDp6gwEi5xpJHLs5+PQ6TwhVe1uwtUvgbUmJd4
	fDkQMUlABUrAHEN4I0Y9BDmj211nZO2BU+oXGrBfS/WzTBS9JZVgucp7AC/fW+rchztnv/h8CKgVJ
	A1AQNK2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfTHz-0034Cx-0E;
	Thu, 23 Mar 2023 22:20:07 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfTHv-0034Bt-18;
	Thu, 23 Mar 2023 22:20:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B573AB821F7;
	Thu, 23 Mar 2023 22:20:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CD80C4339B;
	Thu, 23 Mar 2023 22:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679610000;
	bh=EGro5R7FQWiMxlAAvFpkvWnKYj/UgWU6UGe7JmSDC+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D5fR7X4NGOeqePlms9r2wzI1F4U3DZhoilJCcWwgejrXBMbL4ZWwlk0iU7725Oyel
	 Giyy59T2uqCMiI787vu3EfInUVmloOQcK2rackjlpDlzMaMQjyZMOFbKEZhtpuMgZi
	 Ek4MoJCm9EI9zIBXo4H43zrHSBQ4LQhwGDqh5ZgkoR+t/AQqb+iVGr4HecAMUlOHdp
	 lObO0xL69GahU6OqTx/YiOxvUV+uPh6xjzSlosVlITY03K+riOXoSeKrkSX4su0GqE
	 o6oe1yfTEG47hNio434LDV/sH1HZoNaBcYW6nYWKWtDoCTjb9r6RNa4MtLVjFngEEH
	 SJFeGt9P2Bh4w==
Date: Thu, 23 Mar 2023 22:19:54 +0000
From: Conor Dooley <conor@kernel.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, regressions@leemhuis.info,
	regressions@lists.linux.dev
Subject: Re: [PATCH] riscv: require alternatives framework when selecting FPU
 support
Message-ID: <71fc0b56-0b63-4f0b-9f1d-5c4d6102ded6@spud>
References: <ZBruFRwt3rUVngPu@zx2c4.com>
 <20230322120907.2968494-1-Jason@zx2c4.com>
 <20230322124631.7p67thzeblrawsqj@orel>
 <1884bd96-2783-4556-bc57-8b733758baff@spud>
 <20230322192610.sad42xau33ye5ayn@orel>
 <2a3b08ce-5ab1-41b6-ad58-edbeff7b1acb@spud>
 <ad445951-3d13-4644-94d9-e0989cda39c3@spud>
 <CAHmME9qEbUP7cq-iofN=ruSWhsHUva+qqavfEpNzDK_BjQVqxw@mail.gmail.com>
 <af690061-f962-498e-b2df-d2e6119292cf@spud>
 <ZBx2qFFiaRSyJubo@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <ZBx2qFFiaRSyJubo@zx2c4.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_152003_671781_CC9386A2 
X-CRM114-Status: GOOD (  37.38  )
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
Content-Type: multipart/mixed; boundary="===============2535995223180081812=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2535995223180081812==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vddSnN5vfBB77SnX"
Content-Disposition: inline


--vddSnN5vfBB77SnX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jason,

I read this mail before I left work today & had a think about it on the
bike home, and had a whole response thought out, got distracted and
forgot it all.. Hopefully I've remembered everything I had to say!

On Thu, Mar 23, 2023 at 04:56:24PM +0100, Jason A. Donenfeld wrote:
> On Thu, Mar 23, 2023 at 02:49:34PM +0000, Conor Dooley wrote:
> > This would requiring picking up your patch Jason, but with an
> > "if !XIP_KERNEL" added to the select.
>=20
> So the risk of making this all work is that we wind up forgetting to add
> `select alternatives if !xip` to various places that need it (fpu, kvm,
> maybe others? future others?), because it appears to work, thanks to the
> code in your patch.
>=20
> But making it work is also probably a good thing, since we obviously
> want the fpu and maybe other things to work on xip kernels.

I'm not super pushed about the "maybe other things", since the "maybe
other things" that are in my head (errata and recently added extensions)
have never worked on xip kernels, and losing them isn't a regression.
Since XIP_KERNEL is deemed to be a "NONPORTABLE" option, we wouldn't
need alternatives to enable it for them, but changes would be required
for that to make the alternatives collapse to a build time thing.
Can deal with that iff someone actually does come along wanting it.

We do need to fix this so that situations like the one you hit can't
happen, while not regressing the level of support for xip, so some level
of "making it work" is needed, but I do agree that it needs to be done
in a less footgun way.

> So maybe we should get rid of the CONFIG_RISCV_ALTERNATIVES knob
> entirely, making it "always enabled", and then conditonalize the
> alternatives code to BUILD_BUG_ON when called with CONFIG_XIP_KERNEL=3Dy.
> Then, this build bug will get hit immediately by
> riscv_has_extension_*(), which will then require your patch, which can
> run in a `if (IS_ENABLED(XIP_KERNEL))` block or similar.
>=20
> The result of that will be:
> - !xip kernels properly use the fast riscv_has_extension_*() code and
>   any alternatives code needed, since it's always selected.
> - xip kernels get a BUILD_BUG_ON if they use any alternatives-based code
>   that doesn't have a xip fallback yet.
>=20
> What do you think of that approach?

Initially I thought "great, lets always enable the alternatives
framework" but I don't think we can do that.
For the has_extension() stuff a fallback is fine, but I don't think that
applies to using alternatives for either errata or enabling extensions
at runtime.
I just don't really want to go through and modify the alternative macros
so that they're evaluated at build time for xip unless that is
absolutely required down the line. (I'd rather not even do it at all.)

Most of the things that are currently selecting RISCV_ALTERNATIVE do so
to patch in support for extensions or enable errata, and I don't think
we should expose those config options if the alternatives that they rely
on cannot be used. I think that means something like...

> A "lighter weight" version of that approach would be to just remove all of
> the `select RISCV_ALTERNATIVES` lines, and instead make
> RISCV_ALTERNATIVES specify `default !XIP_KERNEL`. That would more or
> less amount to the above too, though with weirder error cases.

=2E..adding a "select RISCV_ALTERNATIVE if !XIP_KERNEL" to the
CONFIG_RISCV entry, and similarly to what you suggest here, swapping all
of the instances of "select RISCV_ALTERNATIVE" for "depends on
RISCV_ALTERNATIVE". That does still mean we can drop all of the
"depends on !XIP_KERNEL" that are littered around the place whereever we
are using alternatives & should only get the slow path for extension
checking for xip kernels.
That'd handle the issue that you pointed out, where if the select is
missing, my suggested change makes it appear to work if alternatives are
not enabled too.

The BUILD_BUG_ON idea is good too, probably not fixes material, but
might be worth having to prevent alternatives somehow being used when
XIP_KERNEL is set.

I'll try to whip something up tomorrow...

Thanks Jason,
Conor.

--vddSnN5vfBB77SnX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBzQigAKCRB4tDGHoIJi
0ncsAP9X22z2ivSfhQdtuoUsRvCx/661lKb5fqk89hLsE94cIQEAufUulDwROTp8
wCqlVN+Ecvxd5O0NDQNhmpzYyrBOyQo=
=bI1F
-----END PGP SIGNATURE-----

--vddSnN5vfBB77SnX--


--===============2535995223180081812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2535995223180081812==--

