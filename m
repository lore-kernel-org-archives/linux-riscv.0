Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EAAC27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jun 2024 10:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MJYnZyoszWcgU8L8m9lyl3bSv0dEHf48VZcOe7mQajE=; b=Qp3YGJsOys1mpC8v3wqqRjsiCj
	UqQ84Ljw71P6EsJmd6YbEWc0XCCao+kLQIjkLeWokrrkjCKbnfp4ASoVFMkbmYxdkxQxnv1bWUu7z
	ClJT87xvF0u8U8B3AZvIhDsbwN4dG3hhlTp9qZ8XnCaPcVjRqfezOO/i9fd4aZN9XeYbDm12ocfkt
	vUhZudXKud4XWwG3zdJgQIPe3pwSS5QhwuDeXjd/pox/dNKrLHOa3kWG2OfrhBbjgn9CWyUAHmHOL
	+CA1nA0HR8ZRyKOYzWntkbxZJo/hnD1yzGuyIvSAGKth9NW9UXG9H5iZi7iv0Oc0yP2w8DqvpiJmh
	slNGHHQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsoW-00000000qDM-09Jo;
	Wed, 19 Jun 2024 10:45:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJsoS-00000000qC3-1bR1
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jun 2024 10:45:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A7A3CE1D18;
	Wed, 19 Jun 2024 10:45:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA0EBC2BBFC;
	Wed, 19 Jun 2024 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718793909;
	bh=m/42kz6hNTn6MqTGY9qBPMBvXRlNx8ar0bAXDpWRTU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hYPkCoIR708kJkT8Wq3wHe7CVObj70KadAEHmK5gDGDjGeONeSBM7tts/4s0y8M7X
	 4fkxwFCorNcneU5wfxB083IpqAOYbpopDbACxgrqvwLbUEP5r+2TdSVjJdmgs7u9b8
	 bRfiwWoqmovccVIvMXlVonjVMPmO3OqxypkzoQkPFuNhDvs/5pS0x99IzCN1HjfcEl
	 HKbvld0um/3pkXpd6O33RB9sanLb5MVWZFG+oSGXMb39NFsWqUsvzmfcHJP97xEsc5
	 18LLHWSFGoqZhf0QFNygkPyq4yj0jR5VQxQvw0b0ClNpOW9pTvnS9POo+MBu7eU/wR
	 8iB7DwjRYqBKw==
Date: Wed, 19 Jun 2024 11:45:04 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org, Yangyu Chen <cyy@cyyself.name>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH RESEND v8 0/6] riscv: add initial support for
 Canaan Kendryte K230
Message-ID: <20240619-hammock-drum-04bfc16a8ef6@spud>
References: <tencent_22BA0425B4DF1CA1713B62E4423C1BFBF809@qq.com>
 <20240410-unwoven-march-299a9499f5f4@spud>
MIME-Version: 1.0
In-Reply-To: <20240410-unwoven-march-299a9499f5f4@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_034513_005488_ABAE432C 
X-CRM114-Status: GOOD (  19.93  )
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
Content-Type: multipart/mixed; boundary="===============2676585936665149112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2676585936665149112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tviL4D2HBG1f+vga"
Content-Disposition: inline


--tviL4D2HBG1f+vga
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 10, 2024 at 11:30:25AM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> On Mon, 08 Apr 2024 00:26:58 +0800, Yangyu Chen wrote:
> > K230 is an ideal chip for RISC-V Vector 1.0 evaluation now. Add initial
> > support for it to allow more people to participate in building drivers
> > to mainline for it.
> >=20
> > This kernel has been tested upon factory SDK [1] with
> > k230_evb_only_linux_defconfig and patched mainline opensbi [2] to skip
> > locked pmp and successfully booted to busybox on initrd with this log [=
3].
> >=20
> > [...]
>=20
> Applied to riscv-dt-for-next, thanks!
>=20
> [1/6] dt-bindings: riscv: Add T-HEAD C908 compatible
>       https://git.kernel.org/conor/c/64cbc46bb854
> [2/6] dt-bindings: add Canaan K230 boards compatible strings
>       https://git.kernel.org/conor/c/b065da13ea9c
> [3/6] dt-bindings: timer: Add Canaan K230 CLINT
>       https://git.kernel.org/conor/c/b3ae796d0a4f
> [4/6] dt-bindings: interrupt-controller: Add Canaan K230 PLIC
>       https://git.kernel.org/conor/c/db54fda11b13
> [5/6] riscv: dts: add initial canmv-k230 and k230-evb dts
>       https://git.kernel.org/conor/c/5db2c4dc413e

After some discussion on the k1 thread
(https://lore.kernel.org/all/ZnEOU7D00J8Jzy-1@xhacker/, https://lore.kernel=
=2Eorg/all/ZnA6pZLkI2StP8Hh@xhacker/)
I am going to drop this series. It's not very useful in the current
state and there's not really been any interest from people in getting
the platform to a more complete state. Jisheng made some good points in
the k1 thread about the missing clock controller stuff, and I think I'm
going to make having basic things like clocks and where applicable
resets and pinctrl the minimum requirement for the platforms I'm looking
after.

I've thrown these patches into my tree:
https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/log/?h=3Dk2=
30-basic

I do have one of these boards, but I'm fairly limited at the moment between
the various linux-related and work demands on my time, so it's pretty
unlikely that I'll do anything with it myself.

Thanks,
Conor.

--tviL4D2HBG1f+vga
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnK2sAAKCRB4tDGHoIJi
0tt/AQCA4RD8d7i4TQVvgD4RhBPFMD7pePzjZ5RQ4rDUwNy27wD/etB+0gFOr1td
x05pgSRoL6NCjHdw/hCWjnc1HnlZigI=
=fu4g
-----END PGP SIGNATURE-----

--tviL4D2HBG1f+vga--


--===============2676585936665149112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2676585936665149112==--

