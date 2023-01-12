Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E94AC54EBE
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 21:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LXsocZvD69SQfOt3pqADtWXPOpRWqFr/A9JCjpU02K0=; b=lG1Qh0Ip/TBgLqp8DIbdyKh6z4
	M0nZYHAM+Ua91uU0NC6cDqxJdO0jPjkb6DfQXsbhr6KHw5IEe+VOrKj7itzZtQveJOsF4cZuFb3y/
	gF0GoAOZrvGDZ/IX+bKiIgtDm7QZVmdxETlSbmC9Zc90hbBCCYlYIZCDxhUOUS68X61Qba+DLqW6y
	1cwTg0Zugh24sFJtgtlbV5wyR8mbbu8sp01IVNh2l1vUIT2nccWhYfsYvUQWgHvy7boHPR+8hbGY6
	V6gDEVNXRvWnS9sC9p01pU6PsFOIQE1YGxmP68sVL/un9t/TyN4OXBIBSK/a/uSvS8wka+11EMfee
	Uc4xxjlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5ar-00HHsF-2X; Thu, 12 Jan 2023 21:58:41 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG5am-00HHpN-Hs; Thu, 12 Jan 2023 21:58:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 185D7B82033;
	Thu, 12 Jan 2023 21:58:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67757C433EF;
	Thu, 12 Jan 2023 21:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673560713;
	bh=7jTaJPvuFk3LTd+EW/43yasn0cm+vCcnFWd5jX7gIis=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IL48f8XvKLiusCJp4ccWYIQeJzZJbm8EHCTbPfE37jhT0KAB4cAKQySL7va3f2QjW
	 mNHmYqvxoeJkH3i9HJAf4urjWGBop22TOs34s4UhHhAIx4MbjqzHPO2aju732NrDZi
	 7hJZetVVgiDXYAjA9GWKGoabx8W2xgGIbvQsxZUivkZqcPd/ZuZYCyNyoV6/V3KJJz
	 kRx6Hhwku1QrDEjHg52YO5z5ZBiPEyl05/AJJcx2PFUOsWlm8v+balFNYP02bKBknA
	 A/mWbH3bnSP9LlBZFmAcjcfl7X8/m1RSfvxRY1eWtOaLoJkeVVn3KHw0Ov7Q1KIhOn
	 R346rOTBEMufQ==
Date: Thu, 12 Jan 2023 21:58:28 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: Re: [PATCH v3 07/13] riscv: fpu: switch has_fpu() to
 riscv_has_extension_likely()
Message-ID: <Y8CChK9XBXTcT9wn@spud>
References: <20230111171027.2392-1-jszhang@kernel.org>
 <20230111171027.2392-8-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230111171027.2392-8-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_135836_784483_2B2E1FCE 
X-CRM114-Status: GOOD (  18.33  )
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
Content-Type: multipart/mixed; boundary="===============3405360706336300319=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3405360706336300319==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iRz1zVDwSZkikdOy"
Content-Disposition: inline


--iRz1zVDwSZkikdOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 12, 2023 at 01:10:21AM +0800, Jisheng Zhang wrote:
> Switch has_fpu() from statich branch to the new helper

s/statich/static

> riscv_has_extension_likely().
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Modulo whatever psuedo-cpufeature shenanigans require renaming the
function, you can tack my name onto this list also...
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/include/asm/switch_to.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/=
switch_to.h
> index 11463489fec6..60f8ca01d36e 100644
> --- a/arch/riscv/include/asm/switch_to.h
> +++ b/arch/riscv/include/asm/switch_to.h
> @@ -59,7 +59,8 @@ static inline void __switch_to_aux(struct task_struct *=
prev,
> =20
>  static __always_inline bool has_fpu(void)
>  {
> -	return static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_FPU]);
> +	return riscv_has_extension_likely(RISCV_ISA_EXT_f) ||
> +		riscv_has_extension_likely(RISCV_ISA_EXT_d);
>  }
>  #else
>  static __always_inline bool has_fpu(void) { return false; }
> --=20
> 2.38.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--iRz1zVDwSZkikdOy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY8CChAAKCRB4tDGHoIJi
0vMiAP9YCgcxsMTZYYbLVAwFZL6doa/5LBmvynF1gtdgW+gvJQD/exnea7hq1CJf
2Xqcb22dMHywHjgYJqShWDxjhTgn1Qs=
=Hsd8
-----END PGP SIGNATURE-----

--iRz1zVDwSZkikdOy--


--===============3405360706336300319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3405360706336300319==--

