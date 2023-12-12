Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39005C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 15:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SFToyHt6z5E4Iay7oj3EpiIy7XdYeeXa8XA2lCQ4X8=; b=LAEeSxqmGBLCrwpjfessHTH1n0
	znXZPQ6RUZC75Q32wlm0NDj51Xpg4Xtqivkw2nxXLOsMbB861bl1S+/a3ODn9G/FVI4CQFmyiRdU4
	rFcpzt3Ri1pU+LXK5+i3BS+KWtjPn87WMqQv4XvywjvHdasTu79mvG7BMUZ6B7/QrhzPZ6SPMitEA
	qV/S6+VMLKCIPXWF+i1UlUnVgaFLGjDpBqO/XzdzQIT1YM8boKP/UzfAkfsHfyYOcXVP9oIUCYmho
	UrNM8smDWPFHCu44cT1YddGE1CZNBZ191JM03wolbR4QRv5pjM5IYVyiv2UX+KS6OVEi/ziYCYzGM
	QMGd2RSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4TT-00C15a-1p;
	Tue, 12 Dec 2023 15:15:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD4TP-00C14z-2F
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 15:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3DDBBCE1A10;
	Tue, 12 Dec 2023 15:15:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4426FC433C8;
	Tue, 12 Dec 2023 15:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702394100;
	bh=oGVr7zPlcrVYpok1WC00xYCvHeubPWaAIUYuFIBTxIo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cFFIZs3IJ110sA2RLnvBq3HY3f0/ITUybpr+HZukAawXy4XKQAje2eeWlkvoomCjf
	 QpcR4y4y7g865okSTznFDLpP4z+O2SlOCsz3Rlh7OX/tejONnJhO+EN5Vf9mdtk49o
	 FpE89ON4XJ67L7OSxzlvAnhCjEX2i4HJ5685DumOlFIyXfig9XMNQZ4SVNSApOuarQ
	 45Azymp2KkihHU4fK3I7Pty4YFNrED6EyFGnXJ7iKvp/3SmxR4pGIYXmhugNqW6UBB
	 EUllqfWG6ODM07vN/7W4Ex7NACDzEQjNaMOlWD/06pSThKdEO7nkSpQkK40rlo6waL
	 wv3rOW1oTz58g==
Date: Tue, 12 Dec 2023 15:14:54 +0000
From: Conor Dooley <conor@kernel.org>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: Conor Dooley <Conor.Dooley@microchip.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Chiu <andy.chiu@sifive.com>, Anup Patel <anup@brainfault.org>,
	Baoquan He <bhe@redhat.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Chen Jiahao <chenjiahao16@huawei.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Frederik Haxel <haxel@fzi.de>,
	Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Masahiro Yamada <masahiroy@kernel.org>, Nam Cao <namcaov@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 0/3] Fix XIP boot and make XIP testable in QEMU
Message-ID: <20231212-crabmeat-flatness-3c0d02966551@spud>
References: <20231212130116.848530-1-haxel@fzi.de>
 <20231212-customary-hardcover-e19462bf8e75@wendy>
 <CAM4kBBKBC=ZSQPzAq5MFQvd1g9=Up_oRAK5CV74oJHt=SbcPqg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAM4kBBKBC=ZSQPzAq5MFQvd1g9=Up_oRAK5CV74oJHt=SbcPqg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_071504_206487_23609B58 
X-CRM114-Status: GOOD (  24.22  )
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
Content-Type: multipart/mixed; boundary="===============4188095696233214343=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4188095696233214343==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+0u/nDWT3CkbhlUL"
Content-Disposition: inline


--+0u/nDWT3CkbhlUL
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


Firstly, no html mails, they're rejected by the lists and break people's
mail flows.

On Tue, Dec 12, 2023 at 03:16:13PM +0100, Vitaly Wool wrote:
> tis 12 dec. 2023 kl. 14:23 skrev Conor Dooley <conor.dooley@microchip.com=
<mailto:conor.dooley@microchip.com>>:
> > On Tue, Dec 12, 2023 at 02:01:11PM +0100, Frederik Haxel wrote:
> > > XIP boot seems to be broken for some time now. A likely reason why no=
 one
> > > seems to have noticed this is that XIP is more difficult to test, as =
it is
> > > currently not easily testable with QEMU.
> > >
> > > These patches fix the XIP boot and allow an XIP build without BUILTIN=
_DTB,
> > > which in turn makes it easier to test an image with the QEMU virt mac=
hine.
> >=20
> >=20
> > Are you actually using XIP in something other than QEMU? The fact that
> > some of the blamed fixes are over 18 months old suggests that you are
> > not actively using XIP builds of the mainline kernel.
> > There is a desire to remove XIP support (among other things), so if you
> > do actually have a use case for it, speak up.
>=20
> Yes, we surely do, on K210 for instance. It=E2=80=99s using an older kern=
el and

The k210 and nommu are on the block for removal too :)
Is your use case for either the k210 or XIP something other than
"ooh this works"?=20

> I haven=E2=80=99t checked the mainline status for a while

I figured that when the request I sent asking if you could test XIP was
ignored. We've been 50-50 on whether it has been broken since Alex put
the dtb in the fixmap ~9 months ago.

> but it is likely that I will come up with some XIP updates
> before Christmas.

May I ask what you intend updating?

Cheers,
Conor.

--+0u/nDWT3CkbhlUL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXh47QAKCRB4tDGHoIJi
0iegAP9vWnOsipXucsygK4bN5Fqo+iSWJF0osyBy+ir9UgSb2wD+Nd9s1gKWU8L2
pYyXJfR4gVj/PQI7ZKedSn3V3zOz5gM=
=xLOI
-----END PGP SIGNATURE-----

--+0u/nDWT3CkbhlUL--


--===============4188095696233214343==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4188095696233214343==--

