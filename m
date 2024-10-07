Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446BBCFB44A
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Oct 2024 16:31:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S65ByVUHfhKUqqYEaOL2d7tVcjw/0TGLc6FMYIL4ICA=; b=3TG9AHRTQl5ZT+0eWTJQ31FVRS
	Gi3z9EMwbWr3tP5k4cnC/417oaBdNVuF5+bjkRKEdY9wocqzg9IeZbKMkf4/hyIsxw0jS33r3G2oL
	lXiHVNYBHY6EN/X/QeyvZKeo1vRHRLyZ3v81XZx/PZQtQndg77FGb3MTPNMhRBu/jkGXREBq04k7V
	Z81bOUACjO5Nzrvvc/VWNmhGXxpPx9fGvOk9z0V/ws08qRO/GKHi7y5Yc+HLQJbqc+2sG+MpRLGaX
	jHv/CZqjQ0fN10oBiZuO7V93EN+ufAGKnZUAfWFg3n4PvxSyMqFndsTd9c3rbjWc4AgKEdKLw14ch
	zmSx/MtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqdd-00000003ANK-1sHG;
	Mon, 07 Oct 2024 16:31:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxqaO-000000039fZ-3WNz
	for linux-riscv@lists.infradead.org;
	Mon, 07 Oct 2024 16:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 013365C5BAE;
	Mon,  7 Oct 2024 16:27:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5458EC4CEC6;
	Mon,  7 Oct 2024 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728318471;
	bh=x1oW3n5t/b/A2xKX8m3gu11wJ95kYfjdEVRLVlS5QSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RbgKcnUnSFcRGlJ2vo+Z+PJk+mif54xbmJEmk3uVpQR9NUY7fImgKI8VvfYxkeHy1
	 iaJ5q16l5+PnYHR0+ZvtdRK3gE2v0SBQWPetWRsYWovrildMOGZK2nz1NEMFa6rcI7
	 33kgosgwEW424iwoC42WYUjgvF6OVviW5YGwZ61bKFmLlojv9KcjIt0jji/2mhSbij
	 /tv5fPzeNdoZl3EFbwLdWM0FmKv8L9DNmWUwmVYbfws8waZXZAlNxnNE8Nl3BfFWqr
	 lPe+GCYmDjuld0XCNLRK+H8nyc2UqRc9VwIofrCFMz9ciQG/BqjK9RsJQwjFHhtcoV
	 UfqNJpDmi09RA==
Date: Mon, 7 Oct 2024 17:27:01 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>
Cc: Tejun Heo <tj@kernel.org>, David Vernet <void@manifault.com>,
	Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH v2] selftests: sched_ext: Add sched_ext as proper
 selftest target
Message-ID: <ZwQL1RkyCwNxyqVE@finisterre.sirena.org.uk>
References: <20241007073133.989166-1-bjorn@kernel.org>
 <ZwQBqlG6MShCkNrU@finisterre.sirena.org.uk>
 <87r08rnbra.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
In-Reply-To: <87r08rnbra.fsf@all.your.base.are.belong.to.us>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241007_092752_946641_1A8D3F1D 
X-CRM114-Status: GOOD (  10.54  )
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
Content-Type: multipart/mixed; boundary="===============4785369551113284010=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4785369551113284010==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5SqJr+ARYPJxKn7Z"
Content-Disposition: inline


--5SqJr+ARYPJxKn7Z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 07, 2024 at 06:00:57PM +0200, Bj=F6rn T=F6pel wrote:
> Mark Brown <broonie@kernel.org> writes:

> > When building for arm64 with this applied on top of mainline or -next
> > I'm seeing:

> Thanks for taking it for a spin!

> >    make ARCH=3Darm64 CROSS_COMPILE=3Daarch64-linux-gnu- -C tools/testin=
g/selftests TARGETS=3Dsched_ext SKIP_TARGETS=3D"

Oh, and for arm64 as previously noted the sched_ext config fragment
odesn't DTRT, merge_config.sh says:

Value requested for CONFIG_SCHED_DEBUG not in final .config
Requested value:  CONFIG_SCHED_DEBUG=3Dy
Actual value:    =20

Value requested for CONFIG_SCHED_CLASS_EXT not in final .config
Requested value:  CONFIG_SCHED_CLASS_EXT=3Dy
Actual value:    =20

Value requested for CONFIG_EXT_GROUP_SCHED not in final .config
Requested value:  CONFIG_EXT_GROUP_SCHED=3Dy
Actual value:    =20

Value requested for CONFIG_DEBUG_INFO not in final .config
Requested value:  CONFIG_DEBUG_INFO=3Dy
Actual value:    =20

Value requested for CONFIG_DEBUG_INFO_BTF not in final .config
Requested value:  CONFIG_DEBUG_INFO_BTF=3Dy
Actual value:    =20

--5SqJr+ARYPJxKn7Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcEC9QACgkQJNaLcl1U
h9C3xAf6AwFHej9Yp+45Zx7N58Nweo6FPmkTT+Jshlja6vZYMeVf82rFI2+n5p3w
8bTCQ/Nf9OgyFrbJF9lDXUVCNAWh7/VnQvhvnINGTmNKLhsjQpWdCcTcHsuVR+Lt
g14lxMDvrqzE5t9UowfeB1CtFQDPyGzItMwFmZkXGmY+MBRUDTuw9Men4cTafqCr
025RguRmgBO6cbNhDkxEdbC41ZUbnNwGt/pV0P75EZxHqyjuUkFj3ajGEeXcJAP6
TpVIWd/2YR9RTAZMVLm0uth7Zi7zlmqxn4bKu19QYiKj6YQKQKjrZWaOWjxYA0UG
jLrjYvwY89ZEwnRNtI/ESEaqjJm+Vw==
=So6V
-----END PGP SIGNATURE-----

--5SqJr+ARYPJxKn7Z--


--===============4785369551113284010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4785369551113284010==--

