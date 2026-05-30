Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81635CD4F54
	for <linux-riscv@archiver.kernel.org>; Sat, 30 May 2026 23:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+QmVNfg5O/brulTjjd5mG/9I6PT4LTdgaxxdUHOzZI=; b=SSC4sYKhFtCziOJRy8qCcrSnZU
	vp9NHSeDmXbcr3puEXsE43MFkCXiqPsaH6QfCcndq+QNAMZp6sDWo9PkcL8B7sgkaKTAzZlQ2eVfa
	dCkHzhcZdxojIaVr568zrMezKBw8UfMSLmZxJq9Pqqa2ARDemWH3V79OzI/IijM75GdVeTdh6/NE/
	mvnHFgROFKiEbU/epKDEyEUvbEELIK/wX5yYVwS7gCPgHz426fgEfV6ctfh2f7YrXrFeIR2UFgrIH
	k47wLCacTKVT4zq0TeLj2OWs6RCjkFTko5HYDiibDgfwReiKigysno6P5Z6V1ZBYTlFAZ75mPTR8J
	HIjdZr9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTSo2-000000097F4-1JLi;
	Sat, 30 May 2026 23:09:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wTSo1-000000097Ey-15UG
	for linux-riscv@lists.infradead.org;
	Sat, 30 May 2026 23:09:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BB87A600CB;
	Sat, 30 May 2026 23:09:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A28E91F00893;
	Sat, 30 May 2026 23:09:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780182562;
	bh=NnrDjmZo1tNysHpVznTjHHrX+yCQZznnu87SuhObnrE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=o3MGoYVhbNhpJKf7AATwAEPncmpcxzoiOH+vGUh8Xxd4rCypEpc3p7J1SpiF/Lybt
	 0waxmy1jbVRe+i5/qabeg+BBtl+fD7MHqG90AGm5AbtGlT9q0x/NqX1ETTH53LLVGW
	 N+xjEOozkGUFlZDivC+F74LXXp5U4INqhw/M0D/ssK1yiOdRwdspfnIPQ9VYR4l1ex
	 MhZAwNqSyvVUXf1dUOFlT5PcaPjYmUszBNkI72Lktwh6/wT+Hoonj4Ie04KzSgP+vD
	 h3lskzxdkdGCQ8MTg3VpNTWZ6WvuJ+Lnbyy6A6JbbWm2tOa42SIezGKvvS+492mdyi
	 ifpR0Kxzt/dTg==
Date: Sun, 31 May 2026 00:09:17 +0100
From: Conor Dooley <conor@kernel.org>
To: Qingwei Hu <qingwei.hu@bytedance.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Pincheng Wang <pincheng.plct@isrc.iscas.ac.cn>,
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>,
	Hui Wang <hui.wang@canonical.com>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Xu Lu <luxu.kernel@bytedance.com>,
	Guodong Xu <guodong@riscstar.com>
Subject: Re: [PATCH v1] riscv: cpufeature: Add Zic64b ISA extension support
Message-ID: <20260530-spoils-studied-d0858257c982@spud>
References: <20260528141630.2741710-1-qingwei.hu@bytedance.com>
 <302dfaf7-4a38-408f-997e-68ed27de2341@iscas.ac.cn>
 <752F28EA-9255-4DBE-8007-F57947305D71@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <752F28EA-9255-4DBE-8007-F57947305D71@bytedance.com>
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
Content-Type: multipart/mixed; boundary="===============8614581013198188499=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8614581013198188499==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="P7Cg7Win9lODgZ42"
Content-Disposition: inline


--P7Cg7Win9lODgZ42
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 11:36:11AM +0800, Qingwei Hu wrote:
> Hi Vivian,
>=20
> Thanks for the feedback.
>=20
> > On May 29, 2026, at 11:14, Vivian Wang <wangruikang@iscas.ac.cn> wrote:
> >=20
> > On 5/28/26 22:16, Qingwei Hu wrote:
> >> Zic64b describes a platform with 64-byte cache block sizes. It is a
> >> mandatory part of RVA23U64, but a system may provide 64-byte CMO block
> >> sizes without satisfying all profile requirements.
> >>=20
> >> The ISA string parser currently ignores Zic64b because the extension is
> >> not present in the cpufeature table. Add an ISA extension ID and table
> >> entry for Zic64b so it can be reported in /proc/cpuinfo when firmware
> >> advertises it.
> >=20
> > I'd like to understand: What is the motivation to doing this, given that
> > the very same information is already available as riscv,cbo*-block-size
> > and hwprobe?
>=20
> The motivation here is not to replace riscv,cbo*-block-size or hwprobe.
> Those are still the right interfaces for software that needs the actual
> CBO block size.
>=20
> This is more about preserving the ISA extension name reported by
> firmware. Some platforms report zic64b in the ISA string, but Linux
> currently drops it because there is no cpufeature entry, so cpuinfo no
> longer matches what firmware advertised. That makes profile/ISA-string
> comparison tools a bit awkward.
>=20
> So the patch only makes zic64b visible as a named ISA extension when
> firmware reports it, while still validating it against any CBO block
> sizes that firmware provides.
>=20
> > If an extension is what we want to go with, then
> > Documentation/devicetree/bindings/riscv/extensions.yaml also needs
> > updating to match.
>=20
> And yes, if we keep this direction, I agree extensions.yaml should be
> updated in v2.

And make sure that having zic64b makes the cbo*-block-size properties
mandatory so that people don't confuse themselves and omit them and
wonder why stuff doesn't work.

Does zic64b mean that all of the zicbo* extensions are supported, or
does it just mean that the supported ones use 64-byte block sizes?
The answer to that will impact how you make the cbo*-block-size
properties mandatory.

Cheers,
Conor.

--P7Cg7Win9lODgZ42
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahtuGQAKCRB4tDGHoIJi
0syPAP9KRd5XIBZvdBj2nRg0m6PQI/t3SEekzQwLGuGraNAdWwD9EBP16SE+83iH
8nJQrZ/lg+rA3Mag56Yhmz/ND1P4GQE=
=NGXJ
-----END PGP SIGNATURE-----

--P7Cg7Win9lODgZ42--


--===============8614581013198188499==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8614581013198188499==--

