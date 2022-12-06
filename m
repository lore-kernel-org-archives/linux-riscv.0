Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E8FC3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 20:25:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gpqFLQDuLLS9zGgxpEH+vGpv32NRdtpMZfoaUPfJB+c=; b=bEPhb/PU+9IaorQIm2oSldBlEv
	eClWptRhf+5m4YT5K7VKaSGLGF44UUmnUKnsHGoikXRjdjY6lh3zt6Qxu9Q5/b+LASGbDep06GTpZ
	rsLud18jCCA9ezWFbpaPvzK49wCT0wZNWNNBUej/WaHloHtBxz8qd8aijZjVJplqK6Z/30kEy5sqL
	/ubjg9d3+0jrYvJdhBw9XDBlHGYihRZNvu667jymw/ykTP7trsGxHZA74+eGRc8U7FFLxK8ML71eu
	u7AhDfBjXw6AOOUm1lO7ORNvkrD3UJdDhup4G2038QfvVJopcpd/OSwnLdfcqy6s79AQHZVtnR+pd
	qvff1vzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2eVb-001wFp-Vv; Tue, 06 Dec 2022 20:25:44 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2eVY-001wED-27; Tue, 06 Dec 2022 20:25:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7D73761851;
	Tue,  6 Dec 2022 20:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8399EC433D6;
	Tue,  6 Dec 2022 20:25:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670358338;
	bh=NiR96ZKIvW7IpMispdHsgp2vT3FznbdvWds2IP2JVJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SQJ0xRSfGyt/EXVAtU8bHfgHspMYXuVOvWLqR/ovxSWRsgZHSw5L8LCDroazamMym
	 IHqNu1g6g/kyotibAwUMred1WrpsoMAPImQGefc4DYXrOdrgw8fAawTSWGq0h4Wi9r
	 CMd3P8V+cdPsG7LVmtibwhza1R6ReLm7VZi5lNEg1NvKCnDv6U8CL8CDYxXC+s4uDl
	 I+AzxmxLGbGjRqSd9NdLpll15a8EqeSxZY34uM+aUlm8HP9tNFF67zu4a9huKBMsx0
	 pqtLaO/fthDy4dCwev8aF6IvXXrUoub6FDpGwpuFOmpSeEWGVyQ1NY7YIsWaeNMF+i
	 eTcj/cpdlspZA==
Date: Tue, 6 Dec 2022 20:25:34 +0000
From: Conor Dooley <conor@kernel.org>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH v2 06/13] riscv: introduce
 riscv_has_extension_[un]likely()
Message-ID: <Y4+lPiF7CpJJjmWR@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-7-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221204174632.3677-7-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_122540_204520_6416ED9D 
X-CRM114-Status: GOOD (  26.83  )
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
Content-Type: multipart/mixed; boundary="===============7021008576093569416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7021008576093569416==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bxEn+e9TeJ7KX+1L"
Content-Disposition: inline


--bxEn+e9TeJ7KX+1L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Jisheng,

Just a couple really minor bits here...

On Mon, Dec 05, 2022 at 01:46:25AM +0800, Jisheng Zhang wrote:
> Generally, riscv ISA extensions are fixed for any specific hardware
> platform, that's to say, the hart features won't change any more

s/that's to say, the hart/so a hart's/
s/any more//

> after booting, this chacteristic make it straightforward to use

"booting. This characteristic makes it"

> static branch to check one specific ISA extension is supported or not

"a static branch to check if a"

> to optimize performance.
>=20
> However, some ISA extensions such as SVPBMT and ZICBOM are handled
> via. the alternative sequences.
>=20
> Basically, for ease of maintenance, we prefer to use static branches
> in C code, but recently, Samuel found that the static branch usage in
> cpu_relax() breaks building with CONFIG_CC_OPTIMIZE_FOR_SIZE[1]. As
> Samuel pointed out, "Having a static branch in cpu_relax() is
> problematic because that function is widely inlined, including in some
> quite complex functions like in the VDSO. A quick measurement shows
> this static branch is responsible by itself for around 40% of the jump
> table."
>=20
> Samuel's findings pointed out one of a few downsides of static branches
> usage in C code to handle ISA extensions detected at boot time:
> static branch's metadata in the __jump_table section, which is not
> discarded after ISA extensions are finalized, wastes some space.
>=20
> I want to try to solve the issue for all possible dynamic handling of
> ISA extensions at boot time. Inspired by Mark[2], this patch introduces
> riscv_has_extension_*() helpers, which work like static branches but
> are patched using alternatives, thus the metadata can be freed after
> patching.
>=20
> [1]https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@shol=
land.org/
> [2]https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mark=
=2Erutland@arm.com/

Can you make these into Link: tags please (and drop the line between the
and the SoB)? So:

Link: https://lore.kernel.org/linux-riscv/20220922060958.44203-1-samuel@sho=
lland.org/ [1]
Link: https://lore.kernel.org/linux-arm-kernel/20220912162210.3626215-8-mar=
k.rutland@arm.com/ [2]
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Changes themselves look grand, no comments there :)

Thanks!
Conor.

> ---
>  arch/riscv/include/asm/hwcap.h | 37 ++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
>=20
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index 996884986fea..e2d3f6df7701 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -8,6 +8,7 @@
>  #ifndef _ASM_RISCV_HWCAP_H
>  #define _ASM_RISCV_HWCAP_H
> =20
> +#include <asm/alternative-macros.h>
>  #include <asm/errno.h>
>  #include <linux/bits.h>
>  #include <uapi/asm/hwcap.h>
> @@ -96,6 +97,42 @@ static __always_inline int riscv_isa_ext2key(int num)
>  	}
>  }
> =20
> +static __always_inline bool
> +riscv_has_extension_likely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> +			   "ext must be < RISCV_ISA_EXT_MAX");
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
> +	:
> +	: [ext] "i" (ext)
> +	:
> +	: l_no);
> +
> +	return true;
> +l_no:
> +	return false;
> +}
> +
> +static __always_inline bool
> +riscv_has_extension_unlikely(const unsigned long ext)
> +{
> +	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
> +			   "ext must be < RISCV_ISA_EXT_MAX");
> +
> +	asm_volatile_goto(
> +	ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
> +	:
> +	: [ext] "i" (ext)
> +	:
> +	: l_yes);
> +
> +	return false;
> +l_yes:
> +	return true;
> +}
> +
>  unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
> =20
>  #define riscv_isa_extension_mask(ext) BIT_MASK(RISCV_ISA_EXT_##ext)
> --=20
> 2.37.2
>=20

--bxEn+e9TeJ7KX+1L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4+lPQAKCRB4tDGHoIJi
0ioQAP4w8r5FQ0ejEXDGcp8UvPntHNhPculcXC9z8LBnhOgVggEAzzZHQlX1lhJN
t6WlREfcRjs9PY31RoG5eskhVoUzrg4=
=bz9l
-----END PGP SIGNATURE-----

--bxEn+e9TeJ7KX+1L--


--===============7021008576093569416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7021008576093569416==--

