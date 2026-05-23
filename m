Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BDACD5BAC
	for <linux-riscv@archiver.kernel.org>; Sat, 23 May 2026 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=no7ks+DKTEMuy+AzvtdHzqs1z1LG2FdKJACr/qvp0Mc=; b=fXW6aiJH9L5/l6Utx7dMkz6mGs
	8JlHO2Y5VQ+jcWQhCy2Z9Go0pGifhoPoFH+6fpqeBZLsoPs5AOEG8Vmub06LDqoQ50e66TM0f15Yz
	WoL9oVa7UlRRB8VY6Q8XXLzHDmF6OWm5nrHUs25msX4/yQdL9HsVCztzGeOtNdwO+M7FbBh6IgN8F
	N4OBX8hFZP+//0pkgw0Blb3dvUD2bvIdc6LOSwGOQr/Id8L+bRYg9RWgOyx74EXwZNlkwlBiPGnEY
	Mm0GtQii+S+CtxBoueWug6JcOqJ40WvCVrj+KT7W3NaOFZ8y1IhCE+cLTeiFSZRR7iRn1hSSkCYhq
	VC7VyEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQmw3-0000000DLpU-23W0;
	Sat, 23 May 2026 14:02:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQmw1-0000000DLpI-3qko
	for linux-riscv@lists.infradead.org;
	Sat, 23 May 2026 14:02:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0602660141;
	Sat, 23 May 2026 14:02:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B0371F000E9;
	Sat, 23 May 2026 14:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779544956;
	bh=IIacKpDclHTRBLaiqOMrmGgH+LLrVbpimm5Qii68Anc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sk2JWHi2l8zhp4EWktwru01wUxnB93bDG5vPw/18e8Sd1WNwhHip84XD29fuJkrmO
	 KtU5elrIdRaV6EJVbbm7N42d/A9O7YeT64W8x19mPJy6dJDxOinLgaqG2TtkuyGJOT
	 8Z5f3RM7Rc33yoAUmlNyMxuZ6pGDmwhLcDYYgkSrD/f3qROmUsEEW0xUpICuFgUtDG
	 CtxNvUcEU9HUnCiRfBotKMCcHWLrl++S7X5W5yJONS8SIZT5FjaasTFH0rDOmKK1ZC
	 PekJRjEvmoz82oCWon1NKEF3uXKEvNSWm9GKa5QtiG1MjR8M8dahi0A2plFx8vRXjX
	 RE6cFfa8peh0g==
Date: Sat, 23 May 2026 15:02:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
Message-ID: <20260523-punctual-backslid-712c06f0db61@spud>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
 <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
 <20260522-removed-lyricism-7c879febc3b3@spud>
 <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>
MIME-Version: 1.0
In-Reply-To: <1f74efd2-444f-4330-a1e8-62f75e85ecfa@zohomail.com>
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
Content-Type: multipart/mixed; boundary="===============4622097614895687281=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4622097614895687281==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Af5l50mgOj8YPBBG"
Content-Disposition: inline


--Af5l50mgOj8YPBBG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 23, 2026 at 03:00:15PM +0800, Xukai Wang wrote:
>=20
> On 2026/5/23 04:39, Conor Dooley wrote:
> > On Fri, May 22, 2026 at 08:59:12PM +0800, Xukai Wang wrote:
> >> Fix all sparse warnings detected during LKP randconfig testing:
> >> - Replace plain integer 0 with NULL.
> >> - Add static modifier to k230_plls and k230_pll_divs.
> >>
> >> Reported-by: kernel test robot <lkp@intel.com>
> >> Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lk=
p@intel.com/
> >> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> > Forgot to reply earlier, but I went and squashed this in.
> Thanks Conor!

I dunno if you saw my message about giving what I have in my
branches a go, but if you could try what's in the riscv-soc-for-next
branch, that'd be great. Just to make sure that I have all the bits in
place.

Cheers,
Conor.

--Af5l50mgOj8YPBBG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahGzcwAKCRB4tDGHoIJi
0it2AP9Odv1YYkRltRYXt+7xWjYef8Cn7xzyCA9K0jeiEUz5NAD/QpwJMe7lZfjs
MZXMsNIopZd++T2/Iw93irRUB71e7wo=
=XTJn
-----END PGP SIGNATURE-----

--Af5l50mgOj8YPBBG--


--===============4622097614895687281==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4622097614895687281==--

