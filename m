Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC63C64ED6
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Feb 2023 19:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lvin8RtqJ4q32GLtZg4xUMxIWN2wQRIL5j1rm1Fsyuw=; b=Rf90/UTpoHlQeoGUzS8m8ntcof
	oF8V5HDV64FM54BDdtFOvneWW9ousLeYZrPrXy0p+7u9TDtN3jlaZmhX3EvOSAk3ZkCzLHEISCb1d
	B7SwoNvCSgGyiD/2Rwsgxo/lcbLaZ4d68XsN+gA6SW5GhLwmMNxMrBsArAPBU5bnUoUBr0eBfL/IU
	x1GjjCgF9viObRC19BXCh0IUA7+fEDZeCiJnBX0HYVn8sVWBaich4vyYzj/hHElKyFHQgkr+iK8a2
	TNUHZxtvsI3kqdoXWpA+LQZJ4BvjZ+ysWl2rrC2tWsAj0c3SNoPZPYMvWjtEcKtJKhpJ7Z6MWX/dQ
	PcSi8zJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX62M-00E8YX-A5; Tue, 28 Feb 2023 19:53:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pX62F-00E8X7-Gj
	for linux-riscv@lists.infradead.org; Tue, 28 Feb 2023 19:53:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DA96D61072;
	Tue, 28 Feb 2023 19:53:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49711C433D2;
	Tue, 28 Feb 2023 19:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677613994;
	bh=Y2iCQOI+QIptI1cAQ9K+Q84gdG4gXITGnMKH6Zu3i2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JadZaEPK9VGtVAUCHTICx1dxwwELfHxbmZjBNCAeSO6DplqIkZ4ZgHp1gUrjKYt5k
	 X7GtnlE6c5EFA0kOyYMVREFolk/RkPyZl2Za0Fsk2Gen8Kxqb/xUQ7YtaHh2csJJWO
	 mga4bkPDH2pcnwYhm1vhiJlmIpYc9aegsYAuSesP1jRHbVQ0c63DCxKtujtiBAperG
	 LGRG5kH/QG3gH3pbxitetkFdCqPtf8zxmoZ3GJ6n8V3e1B2CZZ2UWMwE+9nmWB6V6s
	 Wovk/gGzKeboJVoZWbuij8aFnA+Tbj3ixeCl//s7RJBqymzNfOGh0jz6hyR70UkC68
	 SZdT8sAV08lSw==
Date: Tue, 28 Feb 2023 19:53:10 +0000
From: Conor Dooley <conor@kernel.org>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 13/20] reset: remove MODULE_LICENSE in non-modules
Message-ID: <Y/5bpr/93hJ3yYUU@spud>
References: <20230228130215.289081-1-nick.alcock@oracle.com>
 <20230228130215.289081-14-nick.alcock@oracle.com>
 <Y/5TU/gxAxfVOedg@spud>
 <87edq9h9q8.fsf@esperi.org.uk>
MIME-Version: 1.0
In-Reply-To: <87edq9h9q8.fsf@esperi.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_115315_676657_7A9F7D59 
X-CRM114-Status: GOOD (  28.31  )
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
Content-Type: multipart/mixed; boundary="===============2069194149591074688=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2069194149591074688==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Kp+/tWtv3tDQlrmv"
Content-Disposition: inline


--Kp+/tWtv3tDQlrmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 28, 2023 at 07:26:55PM +0000, Nick Alcock wrote:
> [dropped non-lists to defend innocent ears from my flaming pedantry]
>=20
> On 28 Feb 2023, Conor Dooley stated:
>=20
> > On Tue, Feb 28, 2023 at 01:02:08PM +0000, Nick Alcock wrote:
> >> Since commit 8b41fc4454e ("kbuild: create modules.builtin without
> >> Makefile.modbuiltin or tristate.conf"), MODULE_LICENSE declarations
> >> are used to identify modules. As a consequence, uses of the macro
> >> in non-modules will cause modprobe to misidentify their containing
> >> object file as a module when it is not (false positives), and modprobe
> >> might succeed rather than failing with a suitable error message.
> >>=20
> >> So remove it in the files in this commit, none of which can be built as
> >> modules.
> >>=20
> >> Signed-off-by: Nick Alcock <nick.alcock@oracle.com>
> >> Suggested-by: Luis Chamberlain <mcgrof@kernel.org>
> >> Cc: Luis Chamberlain <mcgrof@kernel.org>
> >> Cc: linux-modules@vger.kernel.org
> >> Cc: linux-kernel@vger.kernel.org
> >> Cc: Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>
> >> Cc: Conor Dooley <conor.dooley@microchip.com>
> >> Cc: Daire McNamara <daire.mcnamara@microchip.com>
> >> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> >> Cc: linux-riscv@lists.infradead.org
> >> ---
> >>  drivers/reset/reset-mpfs.c | 1 -
> >
> > I assume your script just got confused here w/ $subject, since there's
> > only a change for this specific file.
>=20
> This file has had no commits since you wrote it last year, and the
> subject for that commit was
>=20
>     reset: add polarfire soc reset support
>=20
> so, er, yes, the script used 'reset:' as a prefix, mimicking the
> existing commit. I'm not sure what else it could have done.

Oh ye, silly me - I didn't think of that. I guess that's a common
pattern for commits adding a driver, as the "mpfs:" doesn't really make
sense until the driver is in-tree.
I'm not too sure what you could have done either, but I'm not
complaining, or requesting that something be changed here.

> (Regarding the rest of the subject line, I suppose I could have arranged
> to detect single-file commits and turned the subject into 'in this
> non-module'? But there comes a time when even I think that maybe I might
> be overdesigning something, and automated grammatical adjustments to the
> subject line was that point!)

Yeah, I think it's not worth doing anything about really...

--Kp+/tWtv3tDQlrmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/5bpgAKCRB4tDGHoIJi
0ityAP4ieRuQTEdqsGZxmgH0Ie+b5HZsxWdK57F1JJsroTqwYwEAj6GT1/w4OmV6
y3uemsRLYSiSaSApbXcOdwNMXgMnEwY=
=YIMs
-----END PGP SIGNATURE-----

--Kp+/tWtv3tDQlrmv--


--===============2069194149591074688==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2069194149591074688==--

