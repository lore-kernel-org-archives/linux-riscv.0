Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BCECC6FA9D
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 18:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l+kWDHxLtmGZWYw5xpwAdXpMEJwMsy7STGnhYQ8NX5w=; b=gJSr6YeZ/9R//TbiQ6dLkHu/4x
	+87OXHjSN+iBPmnDUTMRo6B9jyRXB636mFGkkubzZT+F8WSkQ9pTjinBZ9ix7FV5wpRB9P3uwPhjt
	pjITMWo8k2zkOI0149tMm1SMAhwRWNSiVQL4tCrhTIof9nVwOE7YS/G3PIjSg3XYj2ECCAqmQN8VI
	qWYXQMHvuq6JEAV/Nvy2fzRaXCFNQCOVxdqaDbOjpFKwTbYHxRY5611kgbgoer1a4ZrE21dPIxqY/
	gG5CDh1yA7+1Ujj+bcRARnUfJFoLKJHAI5N7M77P5D26E2+11g/lmesUCsj4TbtAeZheSz7lltAWU
	TRe0oCpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXRB4-00H7FV-D0; Wed, 01 Mar 2023 18:27:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXRAz-00H7Eu-7t; Wed, 01 Mar 2023 18:27:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AFE02B810FB;
	Wed,  1 Mar 2023 18:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD73DC433D2;
	Wed,  1 Mar 2023 18:27:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677695258;
	bh=8tcuhuBxaNuryy+YMC5HU/Q91+w3y7m5w1hFlQwwp9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KAcZ2dlyptE+kw3BGUZdUfdwyo4Y16spt+I2AjuAqK33XmnbqAJyMZZJXj12hUhZd
	 PKBS4Qmn4me0JKRdZ4BM7XRsCL3BjKxhAqqU7YTcfjo/Kk1YuHkmgnKePK8H1R/aqa
	 sHvf0s7Ypjn+JUUOHis3AYDupHtzP8SfJUN2Ii+1OzAtXJ6yU1M1RD9hbFMXfZ8MUJ
	 JQ0RgzOvNtyW+WcoalHEVhoJMD2D/Z8SS7LB2AMjXX+xFF1q8DZhEDhoy90bDHnSn0
	 rUKHjGE2IV6SnCza29bdVzKjuu5DrfabphMzQFUTf3faqsmfAXDtMU2hr8RXpERTAK
	 45xi5PsYKM8RQ==
Date: Wed, 1 Mar 2023 18:27:31 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Henderson <richard.henderson@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko@sntech.de>, Guo Ren <guoren@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Wenting Zhang <zephray@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Xianting Tian <xianting.tian@linux.alibaba.com>,
	David Hildenbrand <david@redhat.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Andrew Bresticker <abrestic@rivosinc.com>
Subject: Re: [PATCH -next v14 13/19] riscv: signal: Add sigcontext
 save/restore for vector
Message-ID: <Y/+ZE1j2usg5C1Uv@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-14-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-14-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_102741_602342_5855D752 
X-CRM114-Status: GOOD (  35.17  )
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
Content-Type: multipart/mixed; boundary="===============7016546279276560073=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7016546279276560073==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zIjW5a5S4okYDy11"
Content-Disposition: inline


--zIjW5a5S4okYDy11
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:12PM +0000, Andy Chiu wrote:
> From: Greentime Hu <greentime.hu@sifive.com>
>=20
> This patch facilitates the existing fp-reserved words for placement of
> the first extension's context header on the user's sigframe. A context
> header consists of a distinct magic word and the size, including the
> header itself, of an extension on the stack. Then, the frame is followed
> by the context of that extension, and then a header + context body for
> another extension if exists. If there is no more extension to come, then
> the frame must be ended with a null context header. A special case is
> rv64gc, where the kernel support no extensions requiring to expose
> additional regfile to the user. In such case the kernel would place the
> null context header right after the first reserved word of
> __riscv_q_ext_state when saving sigframe. And the kernel would check if
> all reserved words are zeros when a signal handler returns.
>=20
> __riscv_q_ext_state---->|	|<-__riscv_extra_ext_header
> 			~	~
> 	.reserved[0]--->|0	|<-	.reserved
> 		<-------|magic	|<-	.hdr
> 		|	|size	|_______ end of sc_fpregs
> 		|	|ext-bdy|
> 		|	~	~
> 	+)size	------->|magic	|<- another context header
> 			|size	|
> 			|ext-bdy|
> 			~	~
> 			|magic:0|<- null context header
> 			|size:0	|
>=20
> The vector registers will be saved in datap pointer. The datap pointer
> will be allocated dynamically when the task needs in kernel space. On
> the other hand, datap pointer on the sigframe will be set right after
> the __riscv_v_ext_state data structure.
>=20
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Suggested-by: Vineet Gupta <vineetg@rivosinc.com>
> Suggested-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> ---

> +static long save_v_state(struct pt_regs *regs, void **sc_vec)
> +{
> +	/*
> +	 * Put __sc_riscv_v_state to the user's signal context space pointed
> +	 * by sc_vec and the datap point the address right
> +	 * after __sc_riscv_v_state.
> +	 */

AFAIU, this comment describes the assignments here. I think it would be
significantly clearer if you defined the variables here & moved the
assignment and comment further down the function.

> +	struct __riscv_ctx_hdr __user *hdr =3D (struct __riscv_ctx_hdr *)(*sc_v=
ec);
> +	struct __sc_riscv_v_state __user *state =3D (struct __sc_riscv_v_state =
*)(hdr + 1);
> +	void __user *datap =3D state + 1;
> +	long err;
> +
> +	/* datap is designed to be 16 byte aligned for better performance */
> +	WARN_ON(unlikely(!IS_ALIGNED((unsigned long)datap, 16)));
> +
> +	riscv_v_vstate_save(current, regs);
> +	/* Copy everything of vstate but datap. */
> +	err =3D __copy_to_user(&state->v_state, &current->thread.vstate,
> +			     offsetof(struct __riscv_v_ext_state, datap));
> +	/* Copy the pointer datap itself. */
> +	err |=3D __put_user(datap, &state->v_state.datap);
> +	/* Copy the whole vector content to user space datap. */
> +	err |=3D __copy_to_user(datap, current->thread.vstate.datap, riscv_v_vs=
ize);
> +	/* Copy magic to the user space after saving  all vector conetext */
> +	err |=3D __put_user(RISCV_V_MAGIC, &hdr->magic);
> +	err |=3D __put_user(riscv_v_sc_size, &hdr->size);
> +	if (unlikely(err))
> +		return err;
> +
> +	/* Only progress the sv_vec if everything has done successfully  */
> +	*sc_vec +=3D riscv_v_sc_size;
> +	return 0;
> +}
>  static long restore_sigcontext(struct pt_regs *regs,
>  	struct sigcontext __user *sc)
>  {
> +	void *sc_ext_ptr =3D &sc->sc_extdesc.hdr;
> +	__u32 rsvd;
>  	long err;
> -	size_t i;
> -
>  	/* sc_regs is structured the same as the start of pt_regs */
>  	err =3D __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
>  	if (unlikely(err))
> -		return err;
> +		goto done;
>  	/* Restore the floating-point state. */
>  	if (has_fpu()) {
>  		err =3D restore_fp_state(regs, &sc->sc_fpregs);
>  		if (unlikely(err))
> -			return err;
> +			goto done;
>  	}
> =20
> -	/* We support no other extension state at this time. */
> -	for (i =3D 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++) {
> -		u32 value;
> -
> -		err =3D __get_user(value, &sc->sc_fpregs.q.reserved[i]);
> -		if (unlikely(err))
> +	/* Check the reserved word before extensions parsing */
> +	err =3D __get_user(rsvd, &sc->sc_extdesc.reserved);
> +	if (unlikely(err))
> +		goto done;
> +	if (unlikely(rsvd))
> +		goto invalid;
> +
> +	while (1 && !err) {

This is just while (!err), no?

> +		__u32 magic, size;
> +		struct __riscv_ctx_hdr *head =3D (struct __riscv_ctx_hdr *)sc_ext_ptr;
> +
> +		err |=3D __get_user(magic, &head->magic);
> +		err |=3D __get_user(size, &head->size);
> +		if (err)
> +			goto done;
> +
> +		sc_ext_ptr +=3D sizeof(struct __riscv_ctx_hdr);
> +		switch (magic) {
> +		case END_MAGIC:
> +			if (size !=3D END_HDR_SIZE)
> +				goto invalid;
> +			goto done;
> +		case RISCV_V_MAGIC:
> +			if (!has_vector() || !riscv_v_vstate_query(regs))
> +				goto invalid;
> +			if (size !=3D riscv_v_sc_size)
> +				goto invalid;
> +			err =3D __restore_v_state(regs, sc_ext_ptr);
>  			break;
> -		if (value !=3D 0)
> -			return -EINVAL;
> +		default:
> +			goto invalid;

Why does this need a goto, rather than returning -EINVAL directly?

> +		}
> +		sc_ext_ptr =3D ((void *)(head) + size);
>  	}
> +done:
>  	return err;
> +invalid:
> +	return -EINVAL;
> +}

--zIjW5a5S4okYDy11
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/+ZEwAKCRB4tDGHoIJi
0skzAP9E/bN4Uo8N3ZZng+eYHTQLuuzWUv3ciD/XP/7xSGynMwEA+/czkY4NFMFm
vAP1PHcHiSJV2xiS3cf22Rg4bVZcNwM=
=hq0j
-----END PGP SIGNATURE-----

--zIjW5a5S4okYDy11--


--===============7016546279276560073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7016546279276560073==--

