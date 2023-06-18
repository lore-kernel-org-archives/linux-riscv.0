Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15EA2EB64D7
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Jun 2023 21:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dhm/SBVSCL+DJPNR8dfSCYs35/p+XiztqsA4TwnbbY=; b=lJrgh6M0jacsA9bprGSWlTxjDv
	yhywQnLhgPXIWRNLNXjATbPg79lxqG59UgNSa++HY5dRpPsIIimGYKv8aFzs8Y4UJj6NyLmro36As
	YVhOcc9HFEZ1T7vIVbSv5ypYftkrwnI3j0NtZZ1O/IG1d8+LN9kwSxNbszg8ZF9CsefmSBX3ve1aZ
	KNAvxMjhVUMpjRjkd25TEpvO9yN71KgqPg0DVJfmbyfZHx5VHqRjNlu1vq8pjjiwVcjyHIyTY5G02
	n/Q/dafdWkFWdJD8DJzwkERtgnTbeBAni3LgaA67I87zStukCWZ8SH8KO/yX3gz/pMuBw47YW789n
	1/8rJU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAzWL-006hMb-2G;
	Sun, 18 Jun 2023 21:01:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAzWI-006hM7-0w
	for linux-riscv@lists.infradead.org;
	Sun, 18 Jun 2023 21:01:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B8C0F60EE6;
	Sun, 18 Jun 2023 21:01:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB45C433CB;
	Sun, 18 Jun 2023 21:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687122069;
	bh=Hse+n9psD1rH1kydjoFmL354hIuk5keWZXT/XSKjuv8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cddKG5oriX68GulMyDRFuVeTO6yZFQVRAZ6FUmOjiQ0/PprKPYeaHt9GzbCgJIJU2
	 DbgMuR0QY0ahV4t77jshB8Zmh77Lgi9yzBoelUu7GdnoKC0bS1u2JnYN+VQ6LPmFzl
	 TQ4X26NgjfFtbXNfi3AqYwN8xZapcwQ+o2p4q1cAjLJQPtB0ot3sVJYkvJLynhiI/A
	 u0Q9ujElYdT10mO1DggVP8Jvwa5PLRu4pyMeNUufUZhjodynydZpiFo9/xkxvqknh3
	 D6Rjeo1eZeI6r2eaW8tlLu0zayIkIl7EojRAMVE6ZiGfiT0Sg1/a9MxGuAkhDSgI53
	 DF5ktGBwXSOhA==
Date: Sun, 18 Jun 2023 22:01:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, arnd@arndb.de
Subject: Re: [PATCH v3 0/8] Add Sipeed Lichee Pi 4A RISC-V board support
Message-ID: <20230618-tameness-crescent-d09ffa8ed4c0@spud>
References: <20230617161529.2092-1-jszhang@kernel.org>
 <20230617-duress-phantom-3da79e33f204@spud>
 <ZI8wEp52bpqaCHAl@xhacker>
MIME-Version: 1.0
In-Reply-To: <ZI8wEp52bpqaCHAl@xhacker>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230618_140110_416887_032049A8 
X-CRM114-Status: GOOD (  26.01  )
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
Content-Type: multipart/mixed; boundary="===============6367541828356066535=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6367541828356066535==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4BQua3J3FibZmDrb"
Content-Disposition: inline


--4BQua3J3FibZmDrb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 19, 2023 at 12:25:54AM +0800, Jisheng Zhang wrote:
> On Sat, Jun 17, 2023 at 07:20:43PM +0100, Conor Dooley wrote:

> > Going forward, who is going to pick up the patches and send the PRs to
> > Arnd? I wrote a document that should be in v6.5 about SoC tree
>=20
> Here is what I thought:
> From next development window,=20
>=20
> If we see a heavy development window, IOW, the patches size is big, I
> will take the job of picking up patches and sending out PRs.
>=20
> Once the development calms down, the patches size is trivial, I will
> explictly send request to you by repling the patches to ask your help
> to directly take the patches and send PRs.

The thing with this, is you don't really know in advance if the window
is going to be busy or not - you could end up getting a bunch of trivial
stuff pop up at a later -rc etc. I'd rather patches that ready to be
picked up didn't end up sitting un-applied on the list, until you figure
whether there has been enough to justify a PR or not.
If there is only one or two, you can always send the PR as a series of
patches, rather than creating a tag etc.

> Any comments are appreciated.

Could you please add a git tree to the MAINTAINERS entry & get it added
to linux-next? You should probably add another X: line to the MISC SOC
SUPPORT entry in the same patch.
Also, RISC-V is give-or-take clean for dtbs_check w/ W=3D1, please keep it
that way! I do keep an eye on it in linux-next, so if your tree is added
there, I'll at least see if changes in other parts of the kernel cause
warnings to spring up.

> > submaintainer stuff that is worth reading:
> > https://lore.kernel.org/all/20230606-escapable-stuffed-7ca5033e7741@wen=
dy/
>=20
> The handbook is a wonderful document, thank you!

:)


--4BQua3J3FibZmDrb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZI9wjwAKCRB4tDGHoIJi
0to+AQC7PeXMQbpa60L+eHoIhnfjbeoRUu5FuD60MvaJIblEuwD/eulobf1E37MZ
AtxFE4Lte3OJN9CIA8hHrcX2OKG4Rw8=
=wuK+
-----END PGP SIGNATURE-----

--4BQua3J3FibZmDrb--


--===============6367541828356066535==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6367541828356066535==--

