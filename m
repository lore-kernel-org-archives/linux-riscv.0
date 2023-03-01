Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97138C678D4
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Mar 2023 21:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUF58CIc0rMBkKz+jn5sLUhHUCFFkkUdfwbn2mXdBXQ=; b=wvvB82rA3o4Zw8TAD8/wJcgPdN
	LSAK0EhZYN9VBAx1Ph4JiAJWFojNMrf0G/jvNddyf5JSACDZl33dsF7er03LRNTkO92BifDNfH8Td
	suy1zdGhroHgogUwbPX+pm6Pn6omXu0M1g1h5K2z3m9o/DrUuXUW5hwB6p8PPvCP1dkgleDmjtgHX
	qV9TzInXYQbpHRW7JP6U3ty1pjUcLxTSk+e/kmhS2LUri+ZPmdPFBVTqhDdgByZxiRW9GVJg0DavX
	eizJhMIWwhjxKTnHAfjFNNUCncXAKeSbqKm/PxQyIgq+9/7QOobbomx+k/SHwhIyLiHZwc6NAOHaT
	t+EfF/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXU9r-0005xQ-Qj; Wed, 01 Mar 2023 21:38:43 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXU9p-0005wB-9U; Wed, 01 Mar 2023 21:38:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 26D35B81135;
	Wed,  1 Mar 2023 21:38:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3870DC433EF;
	Wed,  1 Mar 2023 21:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677706715;
	bh=2TOjAcSIfOE8gIqH+j7oeqmP4jGbGHZKKqUSQ3APi8w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H6uEf1e9EwW+/k9OClakly0QovLTPp7vS2ZNBOqKJeFrnKubue0VQlvhMnwLpa+dj
	 3CjFusUSbS83ypZHhgMzlUoXmI02WDIQGF0eNhFx08lIkw+DnYeppOnKzepqhb6bxm
	 OXRM+CCSn0LZOyIUcouaTuvGPuAZrnviqxqWpzLYX0z4JVu4lrFUM5RLPYmOhJH6wx
	 RxyNsDflawWcJA8ffx1dwlTjXUt9A7goWuvWcRmZ7ZJCg9q9akj8weS8n1jv4DWnhC
	 nqSQWvJfMW0M2uzbSi9aedRPBlC8LE5fgQOUP8rqC+q1shQxRXAL340/hjsQoSvXpR
	 i05V6bT1EzOLw==
Date: Wed, 1 Mar 2023 21:38:30 +0000
From: Conor Dooley <conor@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	anup@brainfault.org, atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org,
	vineetg@rivosinc.com, greentime.hu@sifive.com,
	guoren@linux.alibaba.com, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH -next v14 17/19] riscv: kvm: Add V extension to KVM ISA
Message-ID: <32f729dd-4a0c-45b1-adf7-141f50e31b0d@spud>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-18-andy.chiu@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230224170118.16766-18-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_133841_515592_3CD56E7D 
X-CRM114-Status: GOOD (  16.57  )
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
Content-Type: multipart/mixed; boundary="===============7259143090124381819=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7259143090124381819==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="/VzYTspzeD4jPzvS"
Content-Disposition: inline


--/VzYTspzeD4jPzvS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 24, 2023 at 05:01:16PM +0000, Andy Chiu wrote:
> From: Vincent Chen <vincent.chen@sifive.com>
>=20
> Add V extension to KVM isa extension list to enable supporting of V
> extension on VCPUs.
>=20
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 1 +
>  2 files changed, 2 insertions(+)
>=20
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/=
asm/kvm.h
> index 92af6f3f057c..3e3de7d486e1 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -105,6 +105,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SVINVAL,
>  	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_ZICBOM,
> +	KVM_RISCV_ISA_EXT_V,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
> =20
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 7c08567097f0..b060d26ab783 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -57,6 +57,7 @@ static const unsigned long kvm_isa_ext_arr[] =3D {
>  	[KVM_RISCV_ISA_EXT_H] =3D RISCV_ISA_EXT_h,
>  	[KVM_RISCV_ISA_EXT_I] =3D RISCV_ISA_EXT_i,
>  	[KVM_RISCV_ISA_EXT_M] =3D RISCV_ISA_EXT_m,
> +	[KVM_RISCV_ISA_EXT_V] =3D RISCV_ISA_EXT_v,
> =20
>  	KVM_ISA_EXT_ARR(SSTC),
>  	KVM_ISA_EXT_ARR(SVINVAL),
> --=20
> 2.17.1
>=20

--/VzYTspzeD4jPzvS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY//F1gAKCRB4tDGHoIJi
0gy/AP9kv312HhUI+B+AupH7zLPa+R564hqePJ4U1GXM+UPrdQD/Vvte7O+J8Fsx
YQDMnopT/tTs7c8my2Xv0ZQB3YJIKgY=
=FINC
-----END PGP SIGNATURE-----

--/VzYTspzeD4jPzvS--


--===============7259143090124381819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7259143090124381819==--

