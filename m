Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9D6C3271F
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 15:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DdqfG/kNuukfQvThN3xGMcJ7AoBrsUjSny+bYqWcwbM=; b=ar8tVfhGnRZCl3j3BpQLF2Uku4
	euB0m6QxykIy/Kj06q8vnnMtAq2195dOXmEEpm3TRe0+n+SW0GmiuaBhd4QfX9rmDtcpLBtA4r/AB
	6QjQBJTsTi/ciz5nCmUydZbES41tF+CGSSsYQh74Jz6sAZ4kC948SzkWMOL9Nwy9SjTamPw0TEaN1
	4oY+dwBAxDLZfmV00DAYbFK91/mpE4FjmC9KlKqgpA6H16cNOELbUyiyrwZGZIp04ThsgVovj7WQp
	vkRRkDyBpV60sLyWX+lb971aDmYRR+CyOqNMT0JfqO8eYhbSMc1JywQGDdShmjTxA8gOWsOPRR221
	3TFrBsyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP1we-0000000AgTZ-0dOC;
	Wed, 03 Jul 2024 15:30:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sP0xM-0000000ATI5-419H
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 14:27:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EA3456224C;
	Wed,  3 Jul 2024 14:27:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AA07C2BD10;
	Wed,  3 Jul 2024 14:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720016854;
	bh=Da1k3PzkF/P5dn5NS/xK2QBdWh+CFa21+xo9GpsOR+w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fJOH6QUmjO2LsNelMSZ+fnHF1f7/M+RKugp5XZ5EYXrb0irw/Jgp1XnzcB8Ljvn60
	 eQ6CRgc26FeOct0mthjYpIlquau2mntGA0odmjnXdDzQgHxbh4l11sWLps3mqTKo6v
	 EWHfFVxJ4fQqRDFh3i8RsE1FyN3Mu4qozprPv99vLwntD91XOQEqWUcJqON6bW1orl
	 X3Lmx7MlFEU+G291Fjh9fhY24NrTXCb8wO2tgDmL5YE6eUfxl5CKX7v43z2NLUMe3e
	 O4Yb0qhseyhtonjoUHWMsIdv9lQn6pX+8bskOE9QFNo7RISn4WMpUuIdzwXgomQIKW
	 gyT0ey+gkzH8w==
Date: Wed, 3 Jul 2024 15:27:28 +0100
From: Conor Dooley <conor@kernel.org>
To: Kanak Shilledar <kanakshilledar@gmail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Serge Semin <fancer.lancer@gmail.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 2/3] spi: dw-mmio: update dw_spi_mmio_of_match struct
 with thead
Message-ID: <20240703-postage-absence-15fdac24421c@spud>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-4-kanakshilledar@gmail.com>
 <f8604c68-8866-447b-a874-562bdad1df79@sifive.com>
 <23gvjkszxvf6zehiqetjfmtf67nlpnnfmhgx234jnxwrtmbdpr@4yv64sz2kpcs>
 <20240703-garbage-explicit-bd95f8deb716@wendy>
 <CAGLn_=tieSCGWix-0mGC7n8MnD46WPxuWh9xhtB6r+YZry463g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGLn_=tieSCGWix-0mGC7n8MnD46WPxuWh9xhtB6r+YZry463g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_072737_133687_7FAF42F3 
X-CRM114-Status: GOOD (  13.18  )
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
Content-Type: multipart/mixed; boundary="===============7193546219297681175=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7193546219297681175==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="EU9d+cHRPc5+PaU0"
Content-Disposition: inline


--EU9d+cHRPc5+PaU0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 03, 2024 at 06:42:46PM +0530, Kanak Shilledar wrote:
> Hi,
> So, I will drop this patch.
> In the next version (i.e. v2) of this patchset, do I need to include
> the dt-binding patch as it is already in for-next.

No, you do not need to include the binding.

> I am waiting for comments on the devicetree files before sending the
> v2 (if required).

I'll try to look at that today, not super sure if I wanna pick up more
patches for that platform with "fixed-clock"s, but I'll comment that on
the dts patch itself.

Cheers,
Conor.

--EU9d+cHRPc5+PaU0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoVf0AAKCRB4tDGHoIJi
0s9SAQDaGbCpTI/xVyruCRzKJDgDQCVBVSQiPmkMWHtXReHTKAEA8COn47c8JK1n
nsX3uDFUqFEofK0Lenk0GQcCDuQpkgk=
=DN86
-----END PGP SIGNATURE-----

--EU9d+cHRPc5+PaU0--


--===============7193546219297681175==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7193546219297681175==--

