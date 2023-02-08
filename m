Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84149C636CC
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Feb 2023 16:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQfmUbILvl5Rj8HgN7RrA3NS/BFmHPhlo2SgL+ZKtE0=; b=qZUCodPtfxvO050CdL35B6dTXR
	1ZjqqBhHRbw5/EFdmd82ujTmWjvjw4cRY69O2JHwD0WP8Xdih8D9QI9S8gSbmZlXVVMzw6dDFeS6y
	TPzRYFZGvmwM8t3WhFvS4p5QD9dfV6xIVmE467B6SwSczoJy+kJ4K63e1n/t+qFJNxrH52FC6OhCm
	ClsgfUH3el9VfQIwsLvCs5SkG/fJAFF9fcYAnZoP+8ix5Vqgp7nkxlprqRHKZ3YvSzAQgERqaM/6h
	FJKf+Oabu/xnRPL41fo/6Pw3SyKH+IKUGjaPWrdvQmUmqwb06PvHxiIQQraxO1hrc8M/wgze35dYI
	IxdDRrrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnJQ-00GG3h-Ft; Wed, 08 Feb 2023 16:28:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPnJN-00GG3I-9d
	for linux-riscv@lists.infradead.org; Wed, 08 Feb 2023 16:28:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 817486172A;
	Wed,  8 Feb 2023 16:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93BCC433D2;
	Wed,  8 Feb 2023 16:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675873723;
	bh=C7+N9mRaBPOFc2SBvsjZMyh3t4Zdy9AIEyoV7hwJ0gs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgZ54k/UjrcxZLbOevM41Jpx8L/10l4ULONIL5wr8WRLjzeLJ9NnytMYyiaZjZg2F
	 R4cntQYSBX6y4/UFrIlT+FlCPhfkvlS0fGvMbcTvrdnE86bc51fOm/YrSwYpSFX7Kv
	 biwW2Wk8OHWpl7tFnE4zpaAk+YmSgnGLo1H9TQkYtZazhEYUqAgJfFHZK8fSPjreJ1
	 4tTE9mIJmz2MSnjjCl4nxEFSQeKfcUGzaWKHd37Ro646Xtt97fj3l1RRGpznhSNbfJ
	 /MCCcAAwAsEsCVoVDpExpJBfBCTKI4BIbpMKQvpB0WxpXH+tbl5h6KJNquTbqj/ipI
	 I+7KeCI5yQ0UQ==
Date: Wed, 8 Feb 2023 16:28:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Trevor Woerner <twoerner@gmail.com>, palmer@dabbelt.com,
	Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] MAINTAINERS: update Allwinner sunXi SoC support entry
Message-ID: <Y+PNt8JObYK5WZKb@spud>
References: <20230208142841.19597-1-twoerner@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230208142841.19597-1-twoerner@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_082845_411835_9476ED00 
X-CRM114-Status: GOOD (  16.73  )
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
Content-Type: multipart/mixed; boundary="===============3363507523168536614=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3363507523168536614==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Qb4K182P4OIRGlj0"
Content-Disposition: inline


--Qb4K182P4OIRGlj0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 08, 2023 at 09:28:41AM -0500, Trevor Woerner wrote:
> Update the information in the "Allwinner sunXi SoC support" block:
> - include more RISC-V information
> - move the block to keep it in alphabetical order
> - "L" before "T" (as reported by checkpatch.pl)
>=20
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>

> -ARM/Allwinner sunXi SoC support
> -L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> -L:	linux-sunxi@lists.linux.dev

> +ARM/RISC-V/Allwinner sunXi SoC support
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +L:	linux-riscv@lists.infradead.org
> +L:	linux-sunxi@lists.linux.dev

IIRC having the arm list is needed here because the arch/arm{,64}
entries specifically exclude the dts subdir. RISC-V doesn't do that
though, so adding the list here is mostly redundant.

Not that it matters for this patch, but might be worth doing for the
RISC-V entry at some point.

Also Trevor, I was about to send the above but noticed that your CC list
is a bit odd, changing the maintainers entry without CCing any of the
maintainers listed in it!
I assume you ran get_maintainer.pl & there was a regex match for riscv
in it, so only got Palmer & co.
I've added the sunxi folk to CC & depending on workflow they may ask you
to resend this.

FWIW if you lot use b4, the msg-id is:
20230208142841.19597-1-twoerner@gmail.com

Cheers,
Conor.


--Qb4K182P4OIRGlj0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+PNtwAKCRB4tDGHoIJi
0kDIAQDWdvyj262sL9izmrDv21mnh+0Sis8AAtWRYHpiSnBjCwD/YCGSzHggTMcl
sFZp9o8YamSATf2K1K7j1rqb3M4tJgA=
=i4oP
-----END PGP SIGNATURE-----

--Qb4K182P4OIRGlj0--


--===============3363507523168536614==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3363507523168536614==--

