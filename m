Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99472C46467
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Jan 2023 17:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RlVqcuQIPHpdXC0J0qSTP3lA5aVb11Q+pUJKRsktDLI=; b=rRnHcjWkcFw19R1AtsA+Z3DxdT
	Oxng5l3VVtQVrztYFKGVDftDRp1S0g6E9YwBnLlYy1YKdXwE2hTo5QEFqVFZpo/zDHyBTpPyMOEXD
	ilVOj/BFlyWfkxMQPK+gzZbO6MGDH2ZZ6kOgyNf4mRrOhFRKi14faTFeliR1XpCig3HTpTGuIv4Xt
	Nl6ulWYPnoprCz79M9QuoKi+BrP0s99Iu+87BTBzdHHpYGCyIdsd39rhlM+FxgdW91I6Ns6kowSvy
	KtTs9EShbRoLDVGXEzGx1MUw5ffPp6cabF55UhFUzRDIDrlD101nFYtFTc0r2Mo02INZIV29zPnHz
	aR+/lCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGkaB-006IWX-SM; Sat, 14 Jan 2023 17:44:43 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGka8-006IW7-JZ
	for linux-riscv@lists.infradead.org; Sat, 14 Jan 2023 17:44:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1606EB80A27;
	Sat, 14 Jan 2023 17:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD923C433EF;
	Sat, 14 Jan 2023 17:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673718277;
	bh=a+tj6STe0979ygzTQSBu+HJz/dDECy/3NY7GRaT/dz4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dJRxT6cfIrFCfIdOJWRSOJKrgfhHjbw17fm+hJ8xp1I7kxa93ch3MIoxi/Q7V8ipE
	 o/ssN8yjthPkolG3eEmQIpA3jdKSmtjr5fBmhW+yvrb8hXQ6RBLNyc6ZVcmD8S+w/O
	 fRIWJT2IA4atnv2A5YEzom3OiWSqJ+vKxaMpQe8VizsEVKnab8MFndVS+vUdQlqcxt
	 TBWVo50s2YZcJRe/R+quFMBv/Nvij9Ie4hq4I/LYG/UMw2NkLP7Ks606yB+MlY+E9Z
	 QOhW2yEbpW9ar4QJNsZTC8cQ1x6IzvMYdg4Mz+39LR5V+q2bxbRCkFgU4wFqNcv9eL
	 2kx1AzZsLZSMg==
Date: Sat, 14 Jan 2023 17:44:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	christoph.muellner@vrull.eu, philipp.tomsich@vrull.eu,
	ajones@ventanamicro.com, jszhang@kernel.org,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH 2/4] RISC-V: add alternative-field for bits to not match
 against
Message-ID: <Y8LqAWssr8QHNTD+@spud>
References: <20230113212351.3534769-1-heiko@sntech.de>
 <20230113212351.3534769-3-heiko@sntech.de>
MIME-Version: 1.0
In-Reply-To: <20230113212351.3534769-3-heiko@sntech.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230114_094440_816313_5B1E8415 
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
Content-Type: multipart/mixed; boundary="===============0333096146284035691=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0333096146284035691==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="clzWhDV9F2oSbYO8"
Content-Disposition: inline


--clzWhDV9F2oSbYO8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hey Heiko,

Just one really minor thing that bugged me a little as I was reading
through the patch.

On Fri, Jan 13, 2023 at 10:23:49PM +0100, Heiko Stuebner wrote:
> diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
> index 1bd4027d34ca..d08c563ab7d8 100644
> --- a/arch/riscv/include/asm/alternative.h
> +++ b/arch/riscv/include/asm/alternative.h
> @@ -36,6 +36,7 @@ struct alt_entry {
>  	unsigned long vendor_id; /* cpu vendor id */
>  	unsigned long alt_len;   /* The replacement size */
>  	unsigned int errata_id;  /* The errata id */

Should we ditch the pretence that these are errata at this point, and
note in the comment that this may be a cpufeature bitmap too?

> +	unsigned int errata_not; /* Errata id not to match against */

...because "errata_not" & the description here make very little sense I
think. To me, "incompatible_errata" might be more verbose, but gets
across the point better.
"errata not to match against" is a bit confusing I think, taking things
on face value is it a bit difficult to understand. Ignoring
"cpufeatures" and extensions, which the comments do, the point of these
alternatives is to to match against one specific errata_id & the concept
of having to not match against something else seems a bit odd.

Luckily though, that's not a big deal at all, since all we'd need to do
is update the comment to explain that that argument is intended to be
used for cpufeatures that preclude the use of a variant.

Thanks,
Conor.


--clzWhDV9F2oSbYO8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8LqAQAKCRB4tDGHoIJi
0jclAP94TfYpqOgdO1HGgZBJSz7xNWpMcsuJYwT7oJIGZeMztAEAlcr9VaGWWkW+
5tE3cmrO6ytSCRGIb6XrEva/kR5+Vg4=
=xRi0
-----END PGP SIGNATURE-----

--clzWhDV9F2oSbYO8--


--===============0333096146284035691==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0333096146284035691==--

