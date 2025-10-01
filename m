Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBFDCAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 19:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vHEypXi3wKDN8qvswfvLlvALjbpWHhhaQuKVaZdpJDU=; b=YMu9KYmoSnfFNFk5U4lmIoCk7N
	EdgCyHe9EzbwWqfqJGG3utXcGk+o2q+b2EcuiGQ0DiOJWops5l6/I1egwLE1g13xZ/0VrHJ8Pp1N7
	sRDyS2f/xkSKmt7rpV2IEhY8bYJMclMgg1FynLwGl1YUiWWngpDUH37s3ZhcxMN6PmUJc4X8Fk4OQ
	O8jzPQQIk9jdc6fo+8tFKVmUWQNaeSq7uEE4XVH9k8POzqxo1OT/UtftuN3WUOfHOnlSVNYykjNF3
	t+DJShW4035RSQdtg4bzMYaqKboVK9do3EwbxXVHHhctxm9jdPoZhsQp9iusbz0sXK2O/YwORFwnH
	n4Tc2ftA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v426O-00000008nhM-2EZq;
	Wed, 01 Oct 2025 19:03:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v426N-00000008nhA-00vj
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 19:02:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 67BC860381;
	Wed,  1 Oct 2025 19:02:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9E15C4CEF1;
	Wed,  1 Oct 2025 19:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759345378;
	bh=k87qZHehp4tClwKFpwYrLChW5r/zrrDN5eXK5bp9rtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVNXi5Umas9pSwqwrw5o/3bxet6QfZ+0ay6dmVD7hKa9MI288Uz2iDYtcvVvHsC1s
	 ZvFPDXOkDsboNtJLHcLAzL+VWrUaycVkEgAMm3QrmMSpeabJeVQy9AV5Um9cRsUpDf
	 qsxD3hhGJeY8WExzHYdoutO03MKo+GG4BS9fvpgxU16rYHeGefJlSElg5ngFC5r6wB
	 1MGsqs3wfE3rX4yrEzdd2psLDR1E+5AD7Jf/0WXhNIWJ2og8LBpMOz62caUaZW1IXV
	 WPyZbHwCsDq4UTxEOLL5Anx0eblwvk0MYPOUaIGdXMKKkiWQARZwz1WGEmv8R5EC4n
	 hmpSnvxVpdx0A==
Date: Wed, 1 Oct 2025 20:02:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Ben Dooks <ben.dooks@codethink.co.uk>, Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] RISC-V updates for v6.18-rc1
Message-ID: <20251001-patrol-recapture-4bdd58ad7582@spud>
References: <2c804359-3d43-0fba-7173-a87f9aec4bd2@kernel.org>
 <066d70c7-b0a7-45e5-9337-17901bc95664@codethink.co.uk>
 <CAHk-=wgfpswvq0TypePyjv3dofO5YaUC_fSd_MjzY7jogCUnCg@mail.gmail.com>
 <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHk-=wgYcOiFvsJzFb+HfB4n6Wj6zM5H5EghUMfpXSCzyQVSfA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5636016188558934661=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5636016188558934661==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="B7ycgXsqnWtwnYaB"
Content-Disposition: inline


--B7ycgXsqnWtwnYaB
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 30, 2025 at 04:53:24PM -0700, Linus Torvalds wrote:
> On Tue, 30 Sept 2025 at 09:04, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Oh Christ. Is somebody seriously working on BE support in 2025?
>=20
> Ok, I just googled this, and I am putting my foot down:
>=20
>  WE ARE NOT PREEMPTIVELY SUPPORTING BIG-ENDIAN ON RISC-V
>=20
> The documented "reasoning" for that craziness is too stupid for words,
> but since riscv.org did put it in words, I'll just quote those words
> here:
>=20
>  "There are still applications where the way data is stored matters,
> such as the protocols that move data across the Internet, which are
> defined as big-endian. So when a little-endian system needs to inspect
> or modify a network packet, it has to swap the big-endian values to
> little-endian and back, a process that can take as many as 10-20
> instructions on a RISC-V target which doesn=E2=80=99t implement the Zbb
> extension"
>=20
> In other words, it is suggesting that RISC-V add a big-endian mode due to
>=20
>  (a) internet protocols - where byte swapping is not an issue
>=20
>  (b) using "some RISC-V implementations don't do the existing Zbb
> extension" as an excuse
>=20
> This is plain insanity. First off, even if byte swapping was a real
> cost for networking - it's not, the real costs tend to be all in
> memory subsystems - just implement the damn Zbb extension.
>=20
> Don't go "we're too incompetent to implement Zbb, so we're now asking
> that EVERYBODY ELSE feel the pain of a much *worse* extension and
> fragmenting RISC-V further".
>=20
> I'm hoping this is some April fools joke, but that page is dated
> "March 10, 2025". Close, but not close enough.
>=20
> This is the kind of silly stuff that just makes RISC-V look bad.
>=20
> Ben - I'm afraid that that page has "further reading" pointing to codethi=
nk.
>=20

> I see some CONFIG_CPU_BIG_ENDIAN has already made it in, but this
> needs to stop.

Perhaps somewhat ironically, most of the instances of CONFIG_CPU_BIG_ENDIAN
that are already in the kernel are the Zbb specific implementations of
string manipulation functions. IIRC they got added to match the Zbb spec
appendices from which the implementations are sourced and speculatively
in case BE ever did get added. The kexec users are just a straight copy
=66rom the arm64 kexec support. None of that was really done as a
deliberate attempt to add support for BE, in case that assuages concerns
you might have about the taste of the arch maintainers..

--B7ycgXsqnWtwnYaB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaN163gAKCRB4tDGHoIJi
0idFAQDbK54rzDaSznr/vqyLz1il3aWmsH8QbAcv6TNKxLpUdAD+O0v2U1QA5nG4
InvDLiEz+2MTlGCJT2lQ+Hr9zRVPGQg=
=fAoe
-----END PGP SIGNATURE-----

--B7ycgXsqnWtwnYaB--


--===============5636016188558934661==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5636016188558934661==--

