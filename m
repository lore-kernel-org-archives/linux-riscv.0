Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4664ED35162
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Apr 2026 09:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIR4nK/Ak3LwFSHtZqQTcGaoJ+ttmFzFdG4mtAs5q/g=; b=fBF5CwVnWol1afU00tjzvsgMCR
	U7dAY/2BmlUHg8jLeXoViZBaLajtpnOmIKFZ4GuSWVGSsFGUJWPz2feGY8m2H52B5F+3A5Xv7dNec
	mNmo/r8wOSsLmuDhidUsvJsdaTV2y8uQB+MqakM2X5Unv3vaInOw/C4g+ard3vwC1Jv+gVUjGqcFO
	6AArPT01WoW4n0B2NzwLSAK+2KoxX4zXvjfgwNN6yYt3TefU2mXsbbtqcg3zwANoJybTnLsXYdwpW
	SEAXpZupWCZNY+aLbuLBCxNOOHm/l94hXU0xgghcXp0yLS+xTMhxZHMAUsczJHtCJ7FAkH88zqEoG
	kj6ClGTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rpD-0000000EPeR-1yBj;
	Wed, 01 Apr 2026 09:25:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7rpB-0000000EPeJ-40z0
	for linux-riscv@lists.infradead.org;
	Wed, 01 Apr 2026 09:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ABE560120;
	Wed,  1 Apr 2026 09:25:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E31C4CEF7;
	Wed,  1 Apr 2026 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775035520;
	bh=Z6txjY6hf1yR8CgQITKxdy5tMrTpvR6xPb8mxk3Zkyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sQlXkrQjTZE7TXWPULCInfcgxjuvt7HuQ/K5AqX5u1qnTXBU770lRQYKwUFzkVaBV
	 2V0fY5gAop2ShTiiLFKVRyBihQT1RHB/vct4sqjW3UlC4wUhaP/gmQlETTpPqCPkcK
	 +Hg5FdK+oD5Jt4aK1MBqWv8Hjy6E2OhXLjXe77aozp8dM4Y5fNyOsdhWPSCF4uOTzv
	 WFnIWiCYydZhjPF8I8OwrGwZbmKJjzJfEXYqovwaEVcMFhK6Y4PnFV0d08ptB/VR77
	 QsDnFY7sZ+BpdxHZ55sT2Ism3O1B+KVKfPC1XIQ8qdEeWeZypHcgRYc2q0U7cCWMC7
	 ejlH6XMNumx1g==
Date: Wed, 1 Apr 2026 10:25:14 +0100
From: Conor Dooley <conor@kernel.org>
To: Mina Chou <minachou@andestech.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, geert+renesas@glider.be,
	prabhakar.mahadev-lad.rj@bp.renesas.com, magnus.damm@gmail.com,
	ben717@andestech.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, jonathan.cameron@huawei.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	tim609@andestech.com, alex749@andestech.com, az70021@gmail.com
Subject: Re: [PATCH 1/7] cache: ax45mp_cache: refactor cache driver for
 generic Andes platform support
Message-ID: <20260401-hulk-retract-2d4bd7f42f14@spud>
References: <20260330102724.1012470-1-minachou@andestech.com>
 <20260330102724.1012470-2-minachou@andestech.com>
 <20260330-oxford-chevy-5f5a6f0a5be4@spud>
 <acyDUU3FdAAPWfnS@atcsi01.andestech.com>
MIME-Version: 1.0
In-Reply-To: <acyDUU3FdAAPWfnS@atcsi01.andestech.com>
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
Content-Type: multipart/mixed; boundary="===============0134616194691529879=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0134616194691529879==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sbo2IIo6dvwkqyP3"
Content-Disposition: inline


--sbo2IIo6dvwkqyP3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 01, 2026 at 10:30:41AM +0800, Mina Chou wrote:
> Thank you both, Krzysztof and Conor, for the detailed review.
> I appreciate the feedback and admit this series needed more work
> before sending. I will address all the issues in the next version.

People making mistakes is whatever, as long as they don't keep making
them!

> A bit of background on the motivation: the main goal of this series
> was to prepare the Andes cache driver for a SoC Allwinner Avaotaf1 V821,
> which uses the Andes A27L2 CPU. We wanted to share a single cache driver
> across different Andes CPU variants, which is why we tried to move toward

I don't mind the kernel-side renaming all that much, the compatible
rename is what's problematic.

> more generic naming in both the driver and the compatible strings.
> =20
> We have two questions we'd appreciate guidance on:
>   a) On compatible string naming: We'll drop patch [5/7][6/7] and won't
>      rename any existing compatible strings. But we'd like to confirm
>      the preferred approach for A27L2: would it be acceptable to add
>      a generic compatible (andestech,andes-llcache) as an addition?

>      If so, would a CPU-specific compatible (andestech,a27l2-cache)
>      still be required alongside it?

Yes. I think that this cpu-specific compatible is what actually has
value, and adding something generic to all andes CPUs is a "nice to
have" convenience. Also, "andestech,andes-llcache" is a bit of a weak
name, repeating "andes" has no value. There's no code-name or something
for the IP that we could use instead of the second "andes" here?

>   b) On Avaotaf1 V821 support: We are not in a position to submit the
>      DTS on behalf of Allwinner. However, we would like to add the
>      corresponding compatible strings to the existing binding
>      documents (andestech,andes-llcache.yaml, sifive,plic-1.0.0.yaml,
>      and riscv/cpus.yaml) in advance, so that the bindings are ready
>      when Allwinner eventually submits their DTS.

>      Would it be acceptable to upstream binding-only changes without
>      an accompanying DTS at this stage?

Yes, of course. You're not willing to submit the dts, which is
understandable, but for the cache and plic bindings, you are able to add
the soc-specific compatibles for this device, right?

> For the next version, we're thinking of keeping only the changes
> needed to generalize the cache driver, and dropping the improvements
> for now to keep things focused. If you have any suggestion on how
> to approach this, we'd love to hear it.

Whatever you want. The improvements (or at least the things I think
are improvements) seem worth having. The problem was just patches doing
multiple things at once. If you decide to only do the generalisation,
that's fine, just make sure it is broken down so that each of your
bullet points in the commit messages.

Cheers,
Conor.

--sbo2IIo6dvwkqyP3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaczkegAKCRB4tDGHoIJi
0p/3AP9MhWxlPEw8n3QW6A/6cTZLy+yRXFhEp8X0UZlTyXt6iQEAk7Hd6y35epTY
ItppUELACW21zZee02p2FyHaoiH0pws=
=hc9k
-----END PGP SIGNATURE-----

--sbo2IIo6dvwkqyP3--


--===============0134616194691529879==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0134616194691529879==--

