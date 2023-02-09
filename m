Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B65C636D3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Feb 2023 23:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mCYeQsFF6sTCCbQil6x4DKHKU79T5iYx4Q9wINxd5wg=; b=kmED3iRIbyyrV7O4g3OlP3enXZ
	Sg7Z+jP7ic8eCuexVjlQr9xV3P/IBAX6syjm5OmDvMhD+zv2Y4uHPhfOmv62+yypZDGuMs6xjtpzq
	e2P3F2dMu4nj5pFD/ytBbaVszVG+tZrlUvqaMhVdtYbjeMjs47AghJ6W+1VI8puRNaSza2wo+gHh/
	fIczu04aMuDQwdnae6WIY4z+skJCNG6oci+4zEToZPT1AwVK4/oy1Uu4gxpbPvUFX5Ylvq5jV6xRc
	g5Yu9zPunSKY+a8y6pUqmQ0DGIvOq5fmo6OB1MAcy//HdaQc5UJ7cD/bTJ75pc7qZFE9jpNO5R06B
	9906GjNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGXA-003ceu-Rj; Thu, 09 Feb 2023 23:40:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQGX7-003cc4-5r
	for linux-riscv@lists.infradead.org; Thu, 09 Feb 2023 23:40:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7797DB821A7;
	Thu,  9 Feb 2023 23:40:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D34FC433EF;
	Thu,  9 Feb 2023 23:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675986050;
	bh=MrjTCzC/xPfvf63xVJNKaSFm6WBboTWZnObZjd8N9Nw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zf8ncTjO5xdofGbd3VZDQDbD3AAwrOi2UVP5Cs0gn1BynBshSQGynbIcT0oF2JCbp
	 AVGrXuCakPdSOxtIRbOH5gIeZCYq27FEH0DvmAzeU5TzjO0JSWL9ZA+xkdrTWykhef
	 CPMuORjE9XYNXErO1twCUfwb20J3GOAMRLtBL9CglAmDobmSXxXi23CLCql735IV3b
	 1EKWT3vNtd+9Iq2ILytVA36AvFStd+FmVBDTEw/x3zZShFoDhl6Rcipwsc9MkR5KQA
	 i4nymv6W8JDlmM2t/Urh0lSbBrX0Due4oANP9Ybq0ead/pxPqITgRbTN+SB+x7iCSQ
	 ljOFUL4jcGPRQ==
Date: Thu, 9 Feb 2023 23:40:45 +0000
From: Conor Dooley <conor@kernel.org>
To: Palmer Dabbelt <palmer@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, daniel.lezcano@linaro.org,
	tglx@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, aou@eecs.berkeley.edu,
	linux-kernel@vger.kernel.org, linux@rivosinc.com
Subject: Re: [PATCH] clocksource/drivers/riscv: Refuse to probe on T-Head
Message-ID: <Y+WEfc2fYd3qJmUe@spud>
References: <20230209232302.25658-1-palmer@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230209232302.25658-1-palmer@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230209_154053_430095_F111D0BA 
X-CRM114-Status: GOOD (  19.43  )
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
Content-Type: multipart/mixed; boundary="===============4364395422911693979=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4364395422911693979==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kF+jlzWmrA/0Tmz3"
Content-Disposition: inline


--kF+jlzWmrA/0Tmz3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Palmer,

On Thu, Feb 09, 2023 at 03:23:02PM -0800, Palmer Dabbelt wrote:
> From: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> As of d9f15a9de44a ("Revert "clocksource/drivers/riscv: Events are
> stopped during CPU suspend"") this driver no longer functions correctly
> for the T-Head firmware.  That shouldn't impact any users, as we've got
> a functioning driver that's higher priority, but let's just be safe and
> ban it from probing at all.
>=20
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> This feel super ugly to me, but I'm not sure how to do this more
> cleanly.  I'm not even sure if it's necessary, but I just ran back into
> the driver reviewing some other patches so I figured I'd say something.

I'm not super sure what you're trying to fix here. That revert went
through to restore behaviour for the SiFive stuff that do deliver events
in suspend.

Subsequently, we added a DT property (probably the wrong one tbh, but
that's all said and done now) that communicates that a timer is
incapable of waking the cpus. See commit 98ce3981716c ("dt-bindings:
timer: Add bindings for the RISC-V timer device") & the full patchset is
at:
https://lore.kernel.org/linux-riscv/20230103141102.772228-1-apatel@ventanam=
icro.com/

AFAIU, the binding for the T-HEAD clint was only accepted in the last
week & there's nothing actually using this timer. IIRC, when I wanted to
test the timer, Samuel cooked me up a WIP openSBI etc to enable it.

So ye, I don't think this is needed fortunately!

Cheers,
Conor.

--kF+jlzWmrA/0Tmz3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+WEfQAKCRB4tDGHoIJi
0iq2AQDQ4+8gWTOCL4PzVQpY62hag3wY4yKJStKUA6r8bSFh8AEAk+uY/85Khd8Z
Y4IggxcjK79QG6A7SPHYyC9GuVl0/QE=
=j9J3
-----END PGP SIGNATURE-----

--kF+jlzWmrA/0Tmz3--


--===============4364395422911693979==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4364395422911693979==--

