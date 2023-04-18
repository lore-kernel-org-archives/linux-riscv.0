Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3976C6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 19:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fCp7Wnjhm28qaASwYQL9qw0iB2Q8IG48nxSe1bdplQY=; b=NeVhspgTwSxjaf0ZrJp9OH3keU
	KfUnp6iqWPiaE7NfVd0UaZ7ZRCqiK5C59KFWwTXyUDoB2+wP/u0sFtIK2JnO2NffFjj9tf9k71Jom
	24iLI08I83z3wtPGd8Vyx2WjU+eXKZVR6nQeFz1B3EzY44jMBohKqbzx4gz0jL9hXM1MAvKTOmYuL
	LJleAJ4gIpt1kWT/FipxshLsqO4xTh1KN6sDeTHQey1yP0B10zGvGH8aSkrECYXQkwJbfegm3D9Kv
	r+A7X27uzpYxypSVqDL53unhlzXOy09cOCZbYZ4VcCGQl92209nyrzT8oT7eFNgYXw31x+U+52d/l
	8qvjZD1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poqam-00390i-2T;
	Tue, 18 Apr 2023 19:02:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1poqaj-0038yG-20;
	Tue, 18 Apr 2023 19:02:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8C9B76381A;
	Tue, 18 Apr 2023 19:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B744C433EF;
	Tue, 18 Apr 2023 19:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681844532;
	bh=xU7XRq6DvQIE2/fc344xVZ7SMPWATNN5PMiTbczKPcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ncyDvhuaM/uMQptBClE8W8Cdp9YwONeRkAnC94SrCYtyDuj25/RHUq2YhkFT8oDpZ
	 pG2MzMOOL1rQr8z8y0ii/KGN/1W08lRoqud2Leqs1lObcnsemvWmwqSTmOCDKoB13v
	 T/ERaabQs8sp48OSAbABsW92pQjqOd9jiT4K4Y1BMEoav+96+Zew8tJTd7sADllM5o
	 tE4HD64SEWCw2oJbUQirGr5Sf3Pfa/HUgOAMzttgXHvn/svhcsvEIN09qpUxQp+bzO
	 Kh+TzVU930q8MyqHcuXME5a8PerswL6q+CJV3fAGtFRPq5+AIWV5Z9uI1xYIh34o/T
	 foWHu5835eeNA==
Date: Tue, 18 Apr 2023 20:02:06 +0100
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	virtualization@lists.linux-foundation.org,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Paolo Bonzini ' <pbonzini@redhat.com>,
	'Juergen Gross ' <jgross@suse.com>,
	"'Srivatsa S . Bhat '" <srivatsa@csail.mit.edu>,
	'Anup Patel ' <anup@brainfault.org>,
	'Atish Patra ' <atishp@atishpatra.org>
Subject: Re: [RFC PATCH 03/14] RISC-V: paravirt: Implement steal-time support
Message-ID: <20230418-earthlike-estrogen-a8ca785b382a@spud>
References: <20230417103402.798596-1-ajones@ventanamicro.com>
 <20230417103402.798596-4-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230417103402.798596-4-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_120213_754542_9230C7BE 
X-CRM114-Status: GOOD (  20.69  )
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
Content-Type: multipart/mixed; boundary="===============5852794448415295797=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5852794448415295797==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="O/hL3XkeYk1F9UtQ"
Content-Disposition: inline


--O/hL3XkeYk1F9UtQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 17, 2023 at 12:33:51PM +0200, Andrew Jones wrote:

> +static int pv_time_cpu_online(unsigned int cpu)
> +{
> +	struct sbi_sta_struct *st =3D this_cpu_ptr(&steal_time);
> +	phys_addr_t pa =3D __pa(st);
> +	unsigned long lo =3D (unsigned long)pa;
> +	unsigned long hi =3D IS_ENABLED(CONFIG_32BIT) ? upper_32_bits((u64)pa) =
: 0;
> +
> +	return sbi_sta_set_steal_time_shmem(lo, hi, 0);
> +}
> +
>  static int pv_time_cpu_down_prepare(unsigned int cpu)
>  {
> -	return 0;
> +	return sbi_sta_set_steal_time_shmem(-1, -1, 0);

I'm not really a fan of this -1s without an explanation of what passing
-1 to the ecall does.

>  }
> =20
>  static u64 pv_time_steal_clock(int cpu)
>  {
> -	return 0;
> +	struct sbi_sta_struct *st =3D per_cpu_ptr(&steal_time, cpu);
> +	u32 sequence;
> +	u64 steal;
> +
> +	do {
> +		sequence =3D st->sequence;
> +		virt_rmb();
> +		steal =3D st->steal;
> +		virt_rmb();
> +	} while ((sequence & 1) || (sequence !=3D st->sequence));

Call me a bit anal, but should we yoink your:
| The supervisor-mode software MUST check this field
| before and after reading the `steal` field, and
| repeat the read if they are different or odd
and add it here so that is it immediately obvious without reading the
SBI spec what is going on here? Or it is a case of "go read the SBI spec
if you have questions about what the kernel is doing w/ SBI stuff?

(sidenote, s/they are/it is/?)

Guess both of my comments are in the same vein, but would make
at-a-glance understanding easier IMO.

Cheers,
Conor.

> +
> +	return steal;
>  }
> =20
>  int __init pv_time_init(void)
> --=20
> 2.39.2
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--O/hL3XkeYk1F9UtQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZD7pLgAKCRB4tDGHoIJi
0r8EAP0UJ8eeKjOCyb7yEa6wshjev5w0XuI0aQ1kKBw4papkrgEAxIRkUpzp04uI
wB61aIvoP9Gtl1KANlWaO/47PCHlrwk=
=PTCJ
-----END PGP SIGNATURE-----

--O/hL3XkeYk1F9UtQ--


--===============5852794448415295797==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5852794448415295797==--

