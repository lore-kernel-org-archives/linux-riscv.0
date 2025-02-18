Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2539FC021AA
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Feb 2025 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m34KKAFskcgNRYhZ1fTIYlTWGjXDzw0Z2DQgyKyWrV4=; b=ypNOLxp4xhT/D6+/+KFgy0tIua
	p/g9KrG33bim/oG+vFqZDJ3DfBz2xqh3lH4FE+gjQIeUB7BTnY+tOruBfF3AOOiFhc2fDI1uyfZiD
	gZNJLtk4y9/+sz6gDQ8bXPPznuzeK7HHMUbE9Fd3CzN/1lkqsNpVjSKKphev615uZKyTyZw4Qnmzg
	hL+gluA9LcLm2Dcwkyocr/7nd1ctPTUlkxdfb25e2LhcZ+9AVI15Z+DCauEmMmXmS8yj6KFb048V1
	fjUGTKHSelhANWU7CXzBKL6N28ftZVV1mW1VfmEqP68zDpe9IeLk+7CVmLOGxUGpCWpwMGWOn570/
	TWxGwymA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQhU-000000091EF-3nx3;
	Tue, 18 Feb 2025 16:44:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkQfv-000000090yg-2Na9
	for linux-riscv@lists.infradead.org;
	Tue, 18 Feb 2025 16:42:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 70F6B5C6092;
	Tue, 18 Feb 2025 16:41:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C283C4CEE7;
	Tue, 18 Feb 2025 16:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739896942;
	bh=0UR7ZnzNvjz0SEvJtLSwadQ9oZvEotljrbUsdRRYjzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECSIvAUwLDlMHiFskaPKGIwKt/429M4ZYwyuDx2aiwDstX5IZjB4vpk3zjscOEv2v
	 zqQYU/atnf7Fd9N5SfudJl1bsrT5MQ9XM/iCEmBegFOpQUOOAL47ZFDU6smP/i+KGg
	 tlKvYJ91MpGDw6oFvaagm56nBqSzHwgVzrPdIeBCoCbmonyIEg+Xv8UsnXWt3rBcKi
	 xnfPYQo2jtltHS795hs0XBB/hbNrKg5Zf33dw/aA/U0wd+eHV95SRWIkih0zBBwAsG
	 QVQEBklMdE43+0gZoAKuDRRdkZhfwAXWFqDlVps7bWU80yhszD/nkFtqGQ/RruXOtb
	 YjXoRDBz8Nrfg==
Date: Tue, 18 Feb 2025 16:42:18 +0000
From: Conor Dooley <conor@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] pwm: Strengthen dependency for PWM_SIFIVE
Message-ID: <20250218-only-banshee-035249898ef8@spud>
References: <20250127105001.587610-2-u.kleine-koenig@baylibre.com>
 <ts5ze4fosj2vg6pokjfqx3tjernjug646kihiqikxfrhk7tzbl@whgq4nuhni4r>
MIME-Version: 1.0
In-Reply-To: <ts5ze4fosj2vg6pokjfqx3tjernjug646kihiqikxfrhk7tzbl@whgq4nuhni4r>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_084223_646364_F754425C 
X-CRM114-Status: GOOD (  16.30  )
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
Content-Type: multipart/mixed; boundary="===============3554277628896214701=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3554277628896214701==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="aHbrkrX7hwaxkCfs"
Content-Disposition: inline


--aHbrkrX7hwaxkCfs
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 15, 2025 at 03:48:43PM +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
>=20
> On Mon, Jan 27, 2025 at 11:50:01AM +0100, Uwe Kleine-K=F6nig wrote:
> > Back when the sifive pwm driver was added there was no symbol for sifive
> > SoCs yet. Today there is ARCH_SIFIVE however. Let PWM_SIFIVE depend on
> > that to ensure the driver is only build for platforms where there is a
> > chance that the hardware is available.
> >=20
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@baylibre.com>
> > ---
> > a quick grep suggests that the driver is only used on machines that inc=
lude
> > arch/riscv/boot/dts/sifive/fu540-c000.dtsi or
> > arch/riscv/boot/dts/sifive/fu740-c000.dtsi and for these ARCH_SIFIVE is
> > enabled. So I'd guess this patch is fine. Still an ack from someone who
> > knows this arch better would be very welcome.
>=20
> Applied now without further feedback to
> 	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/f=
or-next

Bit late, but ye I think that's fair.

--aHbrkrX7hwaxkCfs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ7S4agAKCRB4tDGHoIJi
0qPYAP4madBzzucHdVUiWEvKgNT8uI7WckM0qzO7+ApHjfyW3gD/b55C8F0Ask/h
7xT/eb9iS5DtWcglDhOYNi1ldp5YPw4=
=jb5M
-----END PGP SIGNATURE-----

--aHbrkrX7hwaxkCfs--


--===============3554277628896214701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3554277628896214701==--

