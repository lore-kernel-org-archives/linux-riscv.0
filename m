Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0C41C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 11:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nnksl2Gd+N09cCMjSK3zM82Is2+DOlgc6dizWNaPg3o=; b=b1QC82xHhlQNAsXvqTiCoQ58V+
	5WWjOJhPUHAopYcf4f5NsQQHkucoZLl/AtoDiRkFC1p/yya+OhOy4JJWvT/bphFQA1S5EbCGKfPqY
	4O4gD7AV4P2AsuzVVz3qwGvgEYDS8dVXN00P7B+ppnBGhXE+yHaRjEFtmKzht46ipKmId8GaUmX0Z
	SC5LmOUe1s6UQGC8XLSGZ9ZVPeFrdDf4Y+cdBgcVvxy0qRNZyTU5rSsyJIVagBZHtFGcvx35b9Z/L
	ZD/lTCR2fBLNzT/Da6B2tRbBt7hp+WxRpwW1YnK2G3bkLk0RMwwUMPlny9Y61qLnDytKxn8tjmnAC
	wOsp+BQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckod-00000000h1b-2FDP;
	Wed, 21 Feb 2024 11:31:07 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rckoa-00000000gzO-1cHf
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 11:31:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65C8ECE1D2B;
	Wed, 21 Feb 2024 11:31:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D8BCC433F1;
	Wed, 21 Feb 2024 11:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708515061;
	bh=R06aAEMhs4VND/RSzWUYXOWMIOf4o7CtU24ik/gBYso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KDaPoHyg0AHRcXQMxanR12gVR12clkhaAkwfKJCuJzmieyysXJRL9eC6SSH6dTa+r
	 HCsjYMivTJUX7bKJLQVWT9nXnfedTTBy8Hn+pr8Suf014f+f8dap/wwR1GCj20jMkz
	 4iORMgd7Hl+JTKLIpPn8UE+9TvHOtTwakxCKPgXF5/hWBj7+msySjnAtNIup4dIEqj
	 WmQztSkiw3aUB8pbyvo85E9XXRGvH70OtAMF3LNRhbYoHv/7Iw/YZZ/HZV4c+EWwFA
	 UXyoXCMHo7GRT734ub1xahDq7M/Gy5+0vUuYJHxoGr0is8QtBFWas3hI31JqicvcuC
	 5FUbGRU7CRnyA==
Date: Wed, 21 Feb 2024 11:30:57 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 0/1] riscv: dts: Allow BUILTIN_DTB for all socs
Message-ID: <20240221-islamic-quartered-3863e44bc862@spud>
References: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_033104_837949_AED5B698 
X-CRM114-Status: GOOD (  30.39  )
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
Content-Type: multipart/mixed; boundary="===============5663854104456835921=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5663854104456835921==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6BDdXDRGwPxzf+xE"
Content-Disposition: inline


--6BDdXDRGwPxzf+xE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Feb 21, 2024 at 03:01:53AM +0800, Yangyu Chen wrote:
> The BUILTIN_DTB kernel feature on RISC-V only works on K210 SoC only. This
> patch moved this configuration to entire riscv.

To be honest, I would rather delete BUILTIN_DTB (and the configurations
that depend on it) than expand its usefulness.

> Although BUILTIN_DTB is not a good choice for most platforms, it is likely
> to be a debug feature when some bootloader will always override something
> like the memory node in the device tree to adjust the memory size from SPD
> or configuration resistor, which makes it hard to do some debugging.

My inclination here is to say "fix your bootloader" and if that's not
possible, chainload a bootloader that allows you control over
modifications to your devicetree.

> As an
> example, some platforms with numa like sg2042 only support sv39 will fail
> to boot when there is no ZONE_HIGHMEM patch with 128G memory. If we want
> a kernel without this patch to boot, we need to write the memory nodes=20
> in the DT manually.

If, as Alex suggests, there's a way to gain support some more memory in
sv39, we should do so - but it is worth mentioning that highmem is on the
removal list for the kernel, so mainline support for that is highly
unlikely.

> Also, changing DT on some platforms is not easy. For Milk-V Pioneer, the
> boot procedure is ZSBL -> OpenSBI -> LinuxBoot -> Linux. If DT gets
> changed, OpenSBI or LinuxBoot may refuse to boot. And there is some bug on
> LinuxBoot now which does not consume --dtb argument on kexec and always
> uses DT from memory.

I don't use Linuxboot, but let me try to understand. Linuxboot uses kexec
to boot the main Linux kernel, but the dtb you want to use is not used, and
instead the one that Linuxboot itself was booted with is used?

It sounds like Linuxboot has a --dtb argumet that is meant to be used to
set the dtb for the next stage, but that argument is being ignored?

That sounds like a pretty serious issue with Linuxboot which should be
fixed - what am I missing?

> So I would like to do debugging on DT using
> BUILTIN_DTB, which makes it very simple,

> I can even install the kernel in
> the distro's way and provide a kernel package for other users to test.

I'm not sure what you mean by this, other distros manage to create
kernel packages without using builtin dtbs.

Thanks,
Conor.

--6BDdXDRGwPxzf+xE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdXe8QAKCRB4tDGHoIJi
0vrYAP9VXm6khUlWB8q8p1RxXCZDwC0wOdqAAu2teabf2mgMbAEA0oaXGtQIWT+6
hRyOdPEH0c08Xd4EhI/UdYf2kNSMkwc=
=yHib
-----END PGP SIGNATURE-----

--6BDdXDRGwPxzf+xE--


--===============5663854104456835921==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5663854104456835921==--

