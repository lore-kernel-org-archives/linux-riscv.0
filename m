Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EFF4C61DBD
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 17:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ap8ip5xCy/Pr6riK1/jOxLVfAcM6M/vJAiLbniRnTHc=; b=DvWo8K51PXIT7MS2akDw+lwkEx
	Nx58Cp+L/HGN9MKqPeCeDqt6TYNOGl1tjsBIcvh6xDLeMRYCf1shQAg7jMlztr8/dPy0Ss9TlXgfq
	wqxb90BG5mSD0BK/To+iYOeOiAV4I+qBOFF01HR7skQq3xv6ctRPuI0+dm7MCTixSK3LhA13c+jpY
	pOLO6+vGNZWaDuS2FhM02li1ZzVVcJsc6ribPwyX4WCZH0eo+yPpp2cLhw/JIiYqUB5RfXimcYFYY
	eoUo0IeHqcl9eIU56uaa2dwQqrD1WEedSlGeimug9O/bsPl/sOCMMoSRclvbQYnfgujID2Etyknww
	3Z/+D6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyugm-00000001AzK-0pGV;
	Tue, 25 Aug 2026 17:11:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyugk-00000001Az4-12Uk
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 17:11:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A0ADA4022D;
	Tue, 25 Aug 2026 17:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDC11F000E9;
	Tue, 25 Aug 2026 17:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787677913;
	bh=YgNzfthrPLgt/ZxHWpTZNFzsuzDY2DE9pgpiEHo8naA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fVIgfkrhDrXmR0hMwMHBVIvYbUWO2ZA9gkfT/roB2Y6/MLQnzI+awK1qS8sfEwwzd
	 6u3GNEs5AnMGT03YOTCKt3jN9lAHMdLMs7kAbF9aJ1eqm/cym+c8xXDULHFYkAZ9aK
	 Ke2AOuIOK84CtjT59BZuaZCmez7kkZPZGyfy4Xl7q7CKiEGlRuUSczaigRRhYJXWWu
	 9hJ4+zBkszUQ8OM3IRc/uelUaY0f9YCiijHFGxmr16Arpm4rEZZJvS/8lxOFrTrCoL
	 tCQHS9YZMRZWvkXUCcjXNGzmLYZIp7sPjXvL8auwGulMfVY5ptmjKfIBGFbe19HqZf
	 E3lDVXoJZdGFA==
Date: Tue, 25 Aug 2026 18:11:49 +0100
From: Conor Dooley <conor@kernel.org>
To: Ivy Lopez <skunkolee@gmail.com>
Cc: pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, andrew.jones@oss.qualcomm.com,
	conor.dooley@microchip.com, schwab@suse.de,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: hwprobe: fix has_fpu() to require D extension
 only
Message-ID: <20260825-essay-flashily-8df1f3d9a615@spud>
References: <20260816003216.22534-1-skunkolee@gmail.com>
 <20260825142034.31230-1-skunkolee@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20260825142034.31230-1-skunkolee@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============4802412515446485684=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4802412515446485684==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uHLKe7TsjCFlo9+n"
Content-Disposition: inline

--uHLKe7TsjCFlo9+n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 25, 2026 at 08:20:34AM -0600, Ivy Lopez wrote:
> The kernel never supports F without D, since D depends on F. As such,
> has_fpu() checking either extension with '||' is incorrect: it
> reports FPU support when only F is present, which is not sufficient
> for D-dependent state save/restore, and weakens
> RISCV_HWPROBE_IMA_FD semantics to "F or D" instead of "F and D".
>=20
> Fix has_fpu() to check D only, which is equivalent to requiring both
> extensions given the dependency. Revert the explicit F && D check in
> sys_hwprobe.c back to calling has_fpu(), which is now correct.
>=20
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D221874
> Suggested-by: Conor Dooley <conor.dooley@microchip.com>
> Suggested-by: Andreas Schwab <schwab@suse.de>
> Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
> ---
> Changes in v2:
> - Original v1 approach (explicit F && D check in sys_hwprobe.c) was a
>   no-op since F-without-D is structurally impossible. Per Conor and
>   Andreas, fix has_fpu() itself instead, checking D only. Revert the
>   sys_hwprobe.c change back to calling has_fpu().
> - Link to v1: https://lore.kernel.org/r/20260816003216.22534-1-skunkolee@=
gmail.com

This v2 looks like a diff on top of your v1, but your v1 didn't get
applied (AFAIK) so this patch doesn't make sense.

>  arch/riscv/include/asm/switch_to.h | 4 ++--
>  arch/riscv/kernel/sys_hwprobe.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 0e71eb82f920..8186cda88e17 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -60,8 +60,8 @@ static inline void __switch_to_fpu(struct task_struct *=
prev,
> =20
>  static __always_inline bool has_fpu(void)
>  {
> -	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> -		riscv_has_extension_likely(RISCV_ISA_EXT_d);
> +	/* D extension depends on F, so checking D alone is sufficient. */
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_d);
>  }
>  #else
>  static __always_inline bool has_fpu(void) { return false; }

> diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwpr=
obe.c
> index 7f91beb82a1c..1659d31fd288 100644
> --- a/arch/riscv/kernel/sys_hwprobe.c
> +++ b/arch/riscv/kernel/sys_hwprobe.c
> @@ -85,7 +85,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
>  	u64 missing =3D 0;
> =20
>  	pair->value =3D 0;
> -	if (riscv_isa_extension_available(NULL, f) && riscv_isa_extension_avail=
able(NULL, d))
> +	if (has_fpu())
>  		pair->value |=3D RISCV_HWPROBE_IMA_FD;
> =20
>  	if (riscv_isa_extension_available(NULL, c))

This second portion should be dropped, since it is a reversion to how
things were before.

Additionally, please don't submit new versions as a reply to old ones.

Thanks,
Conor.

--uHLKe7TsjCFlo9+n
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCao3M1QAKCRB4tDGHoIJi
0qgmAQC/hiOuEjHspWrysb8INLzRB8p+7uvuyEv/2sgxOAuWOQEAvkfRe8gte6xL
iJ7IsVpIiUGoKfw9aIR7R14Hr1M3TQs=
=fZVf
-----END PGP SIGNATURE-----

--uHLKe7TsjCFlo9+n--


--===============4802412515446485684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4802412515446485684==--

