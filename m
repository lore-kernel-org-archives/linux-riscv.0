Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54F56C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 19:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QtsCq8ksdI/VkCwUU4rtvnAPpONj8RN1gsayYJRWk+8=; b=OqcQFkRG6vFzJfxi5bcIvEWVYa
	PVnkupo0xIm1EPPMe+m6nW/hslkBwR421mSkvIs5Eug9clmQeNf/Sr3W6RD/5DDxpiPxhZqYumIJy
	6SRDiVfSjpGiHLbTtLdOcjytzyRbkcYZc0gY6tcPNlPSLVB82SbUE3TE1JaCNyNOdfF6Z4qqUXwd2
	4WGX6CH+iWzkq6ASVQIlHztAtjGYVbd9OKE42FmtiME5Vcuiu5lDQGfFXHdnRnyegFsvIKDRk77o7
	xj0jADsKxhORbHG/0EGSNl4UhDISxnyMHQQGEkJIA3a+AfS9/21lA4Wj9YFH+nxFc/XohrpsMeWmg
	rTGFdBUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIfm-00DM92-Vy; Wed, 01 Feb 2023 19:21:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNIfj-00DM8U-F6
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 19:21:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 38B5261926;
	Wed,  1 Feb 2023 19:21:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCD6CC433EF;
	Wed,  1 Feb 2023 19:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675279289;
	bh=kbl8YdGT78D+w6TfROVKLhOuKjTXRbHs0whqxcAL62w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MhEHQzaN0rZzYyh2qtWjtcrflDPEHxaTBbWK3+eakCExynOSn4qKMN8OWuyaxHFAO
	 d+NBhUpGnHae2myLS2NBmzR45dE0lS/3aKznbKA3xR5CaYiMmysv0Z51tsRnQspzRl
	 CfJwkK0wClG+nFRuvKsO75V1WTZn1KtcMCFXKFBJwQs/SJFPj/4wQl8BTdqw1TTM8p
	 PADtNeXFFsXYmjs/1HPHD0fyz9mFx2RjLc7qvxZ2+eAQCOE9piZsjwfcTw/ZxOp71H
	 XuxAD3DFa1T/tpzgUTkiei7K/encNIUtdxHbAOZ1bLv7+aEANWV4K9pvvqktRitARQ
	 liE19gYmjavDQ==
Date: Wed, 1 Feb 2023 19:21:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Matt Evans <mev@rivosinc.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] clocksource: riscv: Patch riscv_clock_next_event() jump
 before first use
Message-ID: <Y9q7tj/jvQouqZ/K@spud>
References: <512FC581-4097-4433-9C3D-CBCB7CD61954@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <512FC581-4097-4433-9C3D-CBCB7CD61954@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_112131_625044_17D9DDC9 
X-CRM114-Status: GOOD (  21.48  )
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
Content-Type: multipart/mixed; boundary="===============3505853388769499339=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3505853388769499339==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/rMwYLjuH3grx7P4"
Content-Disposition: inline


--/rMwYLjuH3grx7P4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Matt,

On Wed, Feb 01, 2023 at 06:41:52PM +0000, Matt Evans wrote:
> A static key is used to select between SBI and Sstc timer usage in
> riscv_clock_next_event(), but currently the direction is resolved
> after cpuhp_setup_state() is called (which sets the next event).  The
> first event will therefore fall through the sbi_set_timer() path; this
> breaks Sstc-only systems.  So, apply the jump patching before first
> use.
>=20
> Signed-off-by: Matt Evans <mev@rivosinc.com>

Your logic in this patch looks grand, just got two process bits for ya.
Firstly, you're missing a fixes tag, which I would imagine is:
Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")

Also, of late, the clocksource maintainers, who you have not CCed,
have been the ones that pick up patches that only touch this driver.
Might be worth a resubmission CCing them...

Cheers,
Conor.

> ---
>  drivers/clocksource/timer-riscv.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/time=
r-riscv.c
> index 969a552da8d2..a36d173fd6cd 100644
> --- a/drivers/clocksource/timer-riscv.c
> +++ b/drivers/clocksource/timer-riscv.c
> @@ -177,6 +177,11 @@ static int __init riscv_timer_init_dt(struct device_=
node *n)
>  		return error;
>  	}
> =20
> +	if (riscv_isa_extension_available(NULL, SSTC)) {
> +		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> +		static_branch_enable(&riscv_sstc_available);
> +	}
> +
>  	error =3D cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
>  			 "clockevents/riscv/timer:starting",
>  			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
> @@ -184,11 +189,6 @@ static int __init riscv_timer_init_dt(struct device_=
node *n)
>  		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
>  		       error);
> =20
> -	if (riscv_isa_extension_available(NULL, SSTC)) {
> -		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
> -		static_branch_enable(&riscv_sstc_available);
> -	}
> -
>  	return error;
>  }
> =20
> --=20
> 2.30.2
>=20
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--/rMwYLjuH3grx7P4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9q7fgAKCRB4tDGHoIJi
0lA8AP9ZQeeGDmwTU2flSzDSkLJ4blTkwizsnTN2B+uid9ebygEAqNV1VmjY+u4P
5HAtXOyH+xA5epJrsmIuNoOlhqq98gY=
=tLQD
-----END PGP SIGNATURE-----

--/rMwYLjuH3grx7P4--


--===============3505853388769499339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3505853388769499339==--

