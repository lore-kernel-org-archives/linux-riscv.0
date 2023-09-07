Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0214DEE14DC
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Sep 2023 09:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kCMl10QkLgWBJMGQn8NjJhYjFySDTGkQV3F2QGqfRk=; b=Q3qFt5LuMsHXU6m1HZcR4Px05x
	H+WHFDwHdJP427HbLOBi7IUPQXh1tqjhgZNEIZSmWlV+oyS76C5TuRr6Rn3qAYiMu4EPSbF2Fxv6z
	QGeIVW66PqdkkzQeLMuGJkncLeTqJztl6pqZAulD2DZV4MKidrH1av9+Ul74XA4BtBbCL4ilAwCbB
	jBRtzGkZrxKebEXO7Fg6YSOhT4ENYwmLIPlpaoX6By2e0nuvsiFSxlhclxhvfLxAYbJNYP8NOd/Pk
	yvG3H7piwa1vaCR6DSQzmNIcAmebKURZx0PtJQYoiImSTii7sZYnmAvzGVu/cclK1SMfnt/C9FK8F
	jqqTZlOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBmf-00Bjgi-2v;
	Thu, 07 Sep 2023 09:58:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBmd-00Bjg3-0n
	for linux-riscv@lists.infradead.org;
	Thu, 07 Sep 2023 09:58:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 60A0FCE10A8;
	Thu,  7 Sep 2023 09:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2770FC433BF;
	Thu,  7 Sep 2023 09:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694080719;
	bh=hYwpafdI4/gHTlUCpwaQQnjNKzf5vR0+lyBgIWJ9kU0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lK0v+PKmVPdgw7D5WBWMOhPWJcd4LMO6B+WBY+X/Ja0UYxSOO/3sa85nRJJTRGGn2
	 U7a0ctbaa8aMNHgu0Ho8ixxFFcNTjml61beS0AQXZ2xuSKx3jLBvY0wHI6CzrXR11P
	 BJX7jDcoZ+/d45Pa6xNwnZ6LAOWlfKxbW2cBWpFbWeIVlXtMzfU6SUQvQYWsxMNYg9
	 SrjloSFC01XIPE1cRsjz3sHJqk4es94CsqYC1XEiUXVFSpulm4iP8yoJwkzmRvW4oq
	 4mjaUAGR0S8X5Qq4VDQXGbFB2wegAN0tJ2XCFd3t7aKH+2uTmQvlZvOOYkkGZmhKN3
	 9vg0bolhBdXbw==
Date: Thu, 7 Sep 2023 10:58:33 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Subject: Re: [PATCH v2 3/5] riscv: Vector checksum header
Message-ID: <20230907-6ed9570259e770b6a472ee61@fedora>
References: <20230905-optimize_checksum-v2-0-ccd658db743b@rivosinc.com>
 <20230905-optimize_checksum-v2-3-ccd658db743b@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230905-optimize_checksum-v2-3-ccd658db743b@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_025843_643469_7A411624 
X-CRM114-Status: GOOD (  21.41  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============6915508002341877101=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6915508002341877101==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8Z1xk9Xte91v4ZgH"
Content-Disposition: inline


--8Z1xk9Xte91v4ZgH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 05, 2023 at 09:46:52PM -0700, Charlie Jenkins wrote:
> Vector code is written in assembly rather than using the GCC vector
> instrinsics because they did not provide optimal code. Vector
> instrinsic types are still used so the inline assembly can
> appropriately select vector registers. However, this code cannot be
> merged yet because it is currently not possible to use vector
> instrinsics in the kernel because vector support needs to be directly
> enabled by assembly.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/checksum.h | 87 +++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 87 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/c=
hecksum.h
> index 3f9d5a202e95..1d6c23cd1221 100644
> --- a/arch/riscv/include/asm/checksum.h
> +++ b/arch/riscv/include/asm/checksum.h
> @@ -10,6 +10,10 @@
>  #include <linux/in6.h>
>  #include <linux/uaccess.h>
> =20
> +#ifdef CONFIG_RISCV_ISA_V
> +#include <riscv_vector.h>
> +#endif
> +
>  #ifdef CONFIG_32BIT
>  typedef unsigned int csum_t;
>  #else
> @@ -43,6 +47,89 @@ static inline __sum16 csum_fold(__wsum sum)
>   */
>  static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
>  {
> +#ifdef CONFIG_RISCV_ISA_V
> +	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
> +		/*
> +		 * Vector is likely available when the kernel is compiled with
> +		 * vector support, so nop when vector is available and jump when
> +		 * vector is not available.
> +		 */
> +		asm_volatile_goto(ALTERNATIVE("j %l[no_vector]", "nop", 0,
> +					      RISCV_ISA_EXT_v, 1)
> +				  :
> +				  :
> +				  :
> +				  : no_vector);
> +	} else {
> +		if (!__riscv_isa_extension_available(NULL, RISCV_ISA_EXT_v))
> +			goto no_vector;
> +	}
> +
> +	vuint64m1_t prev_buffer;
> +	vuint32m1_t curr_buffer;
> +	unsigned int vl;
> +#ifdef CONFIG_32_BIT
> +	csum_t high_result, low_result;
> +
> +	riscv_v_enable();
> +	asm(".option push						\n\
> +	.option arch, +v						\n\
> +	vsetivli x0, 1, e64, ta, ma					\n\

Also, I don't see that you have addressed previous review comments from
Samuel:
https://lore.kernel.org/linux-riscv/0a8c98bf-46da-e77a-0431-a6c1e224af2e@si=
five.com/

--8Z1xk9Xte91v4ZgH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZPmeyQAKCRB4tDGHoIJi
0puWAP9HrYt4PCeY2P9bcTMRktrEGXFcf6AZsiOqdk6YGi2NDwEAxLxuSROywPKL
er6nTPei+YkmEgwVORjWsLJ3XfNslwY=
=Ua5X
-----END PGP SIGNATURE-----

--8Z1xk9Xte91v4ZgH--


--===============6915508002341877101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6915508002341877101==--

