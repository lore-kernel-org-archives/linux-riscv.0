Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 738DFC001DC
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jul 2023 10:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WUQim8p/1Uub4gj0bacFbpjtc8lznDnNXpLPYY/j6kI=; b=jyVP5ySXfgM/wn8K7Sd2IsTnbN
	+5CLH+Xuf33YvxwtsY9Qi2nS502Xx8oGVafJ79Gmzg4Fay2SywzlXnElJooDbOFRRdt7EiIj5AWWL
	eEPCigfyF+ni/xsmr/2xuAKkw/98NrfV6maniRi7/PtlxVkQ1z3vt32zsPI6/D8Uq6xUn8Lf0+4Ro
	5Jwb2Vpe4G7pyD1S6GOa6TiSBOmH4yhwvW+h2OjF7UiKhSFz+kxX5qMm14cwdvJeTB3BoeyIsSGd3
	y2F3CQG+gVTo4jcesj582ChRXpn95VUUeQ7Q8L0hYu4IZmRJog9jVfJ7WJLXqw7TDayaqR+ywrsdO
	jEWIW6zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPhHa-00748l-2u;
	Sat, 29 Jul 2023 10:34:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPhHW-00748E-34
	for linux-riscv@lists.infradead.org;
	Sat, 29 Jul 2023 10:34:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 40CFB60B7D;
	Sat, 29 Jul 2023 10:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54E02C433C8;
	Sat, 29 Jul 2023 10:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690626881;
	bh=5mvU38WFmD6aiPJH00I1q1misTN6TeP/eYb46wUKo/Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o3JDPlsAa7XqHqEJen3RNbtENp7NwAiMUE3LDSbwrPSkIBQ89NOt2R7wxsFObMyQE
	 oAWzYxtMIFIxk7/aySsmFpUQEdmkOgZbIoYFCPzBQRGEBma0GXMQipgTT3V8JSDGHH
	 hgpkqnhHTwfcV2hAwjSNLSI2bn5l6Vy0p6vHHUJzFd0h5Xu6dpQcOAz+pkO3bNlkQW
	 FLMC7Pvh3YuaOz3saTKs56/BUm0QLwG3PPAHKkYdU7/gI+bbRuhxKbuHiT9v8U1US4
	 hqP9pQcvcJutKn9rjKtvhPhMfheT46KjEhl32JuoIQmUslPFwza0urCQif8N+fjfmL
	 tbRCfRzssX9mQ==
Date: Sat, 29 Jul 2023 11:34:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] riscv: enable DEBUG_FORCE_FUNCTION_ALIGN_64B
Message-ID: <20230729-shucking-slang-370c6baa358e@spud>
References: <20230727160356.3874-1-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230727160356.3874-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230729_033443_078533_C8CBCC6B 
X-CRM114-Status: GOOD (  26.69  )
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
Content-Type: multipart/mixed; boundary="===============4405851131274229044=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4405851131274229044==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LxHC1VpAZFy1zAHq"
Content-Disposition: inline


--LxHC1VpAZFy1zAHq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Fri, Jul 28, 2023 at 12:03:56AM +0800, Jisheng Zhang wrote:
> Allow to force all function address 64B aligned as it is possible for
> other architectures. This may be useful when verify if performance
> bump is caused by function alignment changes.
>=20
> Before commit 1bf18da62106 ("lib/Kconfig.debug: add ARCH dependency
> for FUNCTION_ALIGN option"), riscv supports enabling the
> DEBUG_FORCE_FUNCTION_ALIGN_64B option, but after that commit, each
> arch needs to claim the support explicitly. I tried the config file in
> [1] for both RV64 and RV32, I can't reproduce the build error as [1],
> there is no reason for not allowing to enforce this function alignment.
>=20
> Link: https://lore.kernel.org/lkml/202202271612.W32UJAj2-lkp@intel.com/ [=
1]

This is a CSKY randconfig, is there any particular reason that running
that randconfig (over a year later) and on a different architecture
would trigger whatever the condition was?

The original commit here seems far too penal - why was it not just
disabled on CSKY??? I tried looking a bit on lore, but didn't see
anything explaining the subset of supported archs they picked.
I did see Guo Ren wondering if rv32 would be similarly problematic - but
since this is something likely to just trip up randconfigs, I think we
should go for it and if rv32 becomes a problem, restrict this to 64-bit.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  lib/Kconfig.debug | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index fbc89baf7de6..39ffd218e960 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -502,7 +502,7 @@ config SECTION_MISMATCH_WARN_ONLY
> =20
>  config DEBUG_FORCE_FUNCTION_ALIGN_64B
>  	bool "Force all function address 64B aligned"
> -	depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC || S390)
> +	depends on EXPERT && (X86_64 || ARM64 || PPC32 || PPC64 || ARC || RISCV=
 || S390)
>  	select FUNCTION_ALIGNMENT_64B
>  	help
>  	  There are cases that a commit from one domain changes the function
> --=20
> 2.40.1
>=20

--LxHC1VpAZFy1zAHq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMTrPQAKCRB4tDGHoIJi
0iGdAQDyN75O2rQ1WW8cAOtDv2dka5BxnhOAnhZQPU4T3q4cpgD+LfZKzuDdbrub
ytNDwsKc2dgDCxjr1N0tLkggxyp44ws=
=mi/7
-----END PGP SIGNATURE-----

--LxHC1VpAZFy1zAHq--


--===============4405851131274229044==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4405851131274229044==--

