Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 913B5C54EBE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 22:00:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZgvUTn3HaJzNyllrpcF7W8ra/tB3/4Ig+7lfiXOZIs=; b=eoio6l98IjcERM6EWv6PmKZLL5
	+aqOfdrQTfL76J+Lt3JsDG7rr39zqam8HO4Rl7u6zXykq8JqQRlv68j24jAHd0GdAiKyiIQVhfKLh
	WZdGQOefI0K4gBMehiwKaYKv1yVijcxLe7e/kdYsnRKHzM46UrTH/ZajyqusvBtqN3TqoFR+RGPgK
	PgM7rekr/Mrd/3lZ9a/+4Ithsl1hWDaMMa51JmiQZl285t1ASbSCAyfkTqPsci6nfoZbFJ1xo6VM2
	xM8Tt/wT4AsmlSrHMPufkPquRk15KvEH1OttXqAKkVwrwgAAbwGf5bVIY94BGoZ/R/KFI/0WHoyeB
	+Z50WPKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5c0-00HIT9-O5; Thu, 12 Jan 2023 21:59:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5bw-00HIRP-Sv; Thu, 12 Jan 2023 21:59:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 54BFB621B3;
	Thu, 12 Jan 2023 21:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF1DC433D2;
	Thu, 12 Jan 2023 21:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673560787;
	bh=0NOyF4E6Z65xt9Hiohb2w0h8D0mwuCxqaD02RpzDSFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=I2hc3REK3bBmKKCiJg7/YaXcsJFIx+CFnh7+FC2V4HJE2ayy3KisWJniln7KK+P3f
	 Tq4qYYqr+oPg4LBD/AGvheBLze01qXQA/dJ1LGZfkwuudn6hyDbpIdpVVJRZinzF8I
	 wvhDNJPJ1Ed8nsNHuLJBZAu51XCZ+v3qfKZIdYwHfpq57WdCHTgdCAPhxkjRyDZMw8
	 j8iWzJKwjU8wIW6CrdKre1lJrYtvnMONpFBMELuUFyK7/QhBETOHSxFMvHGvvdnWnt
	 5MRW0LVDOyt5y4NTFnNdIKDuohrwo0J0Pyb1kMq9ZLpUV2RcAo24t9wy5NOf3VoAnI
	 eIhAr6fP/gNLw==
Date: Thu, 12 Jan 2023 21:59:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH v3 11/13] riscv: cpu_relax: switch to
 riscv_has_extension_likely()
Message-ID: <Y8CCzs4RpxcGqqqB@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-12-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230111171027.2392-12-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_135948_998304_12B1637E 
X-CRM114-Status: GOOD (  20.27  )
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
Content-Type: multipart/mixed; boundary="===============1003111309691733746=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1003111309691733746==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QG8JsR+y5+VbgxNW"
Content-Disposition: inline


--QG8JsR+y5+VbgxNW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 01:10:25AM +0800, Jisheng Zhang wrote:
> Switch cpu_relax() from static branch to the new helper
> riscv_has_extension_likely()
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Guo Ren <guoren@kernel.org>

With the same caveat here as with fpu, may as well join the
posse once more...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  arch/riscv/include/asm/vdso/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include=
/asm/vdso/processor.h
> index fa70cfe507aa..edf0e25e43d1 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -10,7 +10,7 @@
> =20
>  static inline void cpu_relax(void)
>  {
> -	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTP=
AUSE])) {
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
>  #ifdef __riscv_muldiv
>  		int dummy;
>  		/* In lieu of a halt instruction, induce a long-latency stall. */
> --=20
> 2.38.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--QG8JsR+y5+VbgxNW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8CCzgAKCRB4tDGHoIJi
0vpbAQDkOciNUDb1ACgDtLafu0yM1I9F1mimietpzXqFxZShSgD/Vq0X6XsG3KXk
QPi8Zzl1EltZQg4xgLXgUpZCOSn5LQc=
=tW5D
-----END PGP SIGNATURE-----

--QG8JsR+y5+VbgxNW--


--===============1003111309691733746==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1003111309691733746==--

