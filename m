Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44961C3064D
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdaCUrPO9HxQCagtEtpqQKsjv3DU1/84H0ezQSYBur8=; b=ZH7ayt5bsbECReaioDDVAp0Nm2
	X5gCdonSaEETmUUFX2jy5w1fOU31BBFtas0Bz1dncQEklaJOc1HmwDtujLVJGzBiVyvBJbPoCcdif
	C66nDyJMyhKpcww/enNfG86PVnPIX5aTfKTU/X94nJNmrLBJ5V0ZBpVFBNrhsJEv0NH3zaI/3GJyl
	iKc9fKlI7ygaDLMDMJTyJGyw5hTe+2vm00syCj4vLYen559hHycNP2Rqpm8u3mj2YMr8KBl+pQbGF
	neeiUfaYvnGNpWIVpwAjLDlqVqQMopQN8uv+AbzQezXuZDi3n9g9mvke9y6AS6vOXv2eafgAqSFGV
	d1WLoY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTmL-00000007E0g-3FK8;
	Wed, 26 Jun 2024 14:37:45 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTmI-00000007Dzo-0PAZ
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:37:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A24A4CE21F5;
	Wed, 26 Jun 2024 14:37:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F249C116B1;
	Wed, 26 Jun 2024 14:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719412653;
	bh=PYkxYTf3qacON7qTPkUSIFqgLFAzCd9sm81fWI0HDGY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V4V4QX43NnWfSBzTFkjcNxMw8ssJEe+sYmCUOzGlwf/z/K2Xq3TuZabVIFpj72x6S
	 op9t9m5KORwZSIl2pUmH4GQRtBzgt3jFodc7+dUz6BFTYpC7j4VWxB0hBs5K21JKBy
	 eUcmBsae3DSfrvQZo+PocNWXjBcD/a+zUbJ9AEiiLUUQqK+23+NvHfrHJ2720Z1zJ4
	 qJiQgZzbmm9E5rbKTys/3Y75PhZL8CfnmcZs3eW7txxy2bc8vITXZMkWjUDObqEHVI
	 Oc8MIRcztmkcRHYxp4nal9LcZxVVm5W6y0bRL5A+Rb/r8eADEtCSDCfUl9F1cfd6UM
	 fot1HmhAZ9h+g==
Date: Wed, 26 Jun 2024 15:37:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Jesse Taube <jesse@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Xiao Wang <xiao.w.wang@intel.com>, Andy Chiu <andy.chiu@sifive.com>,
	Eric Biggers <ebiggers@google.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Costa Shulyupin <costa.shul@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>, Anup Patel <apatel@ventanamicro.com>,
	Zong Li <zong.li@sifive.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Erick Archer <erick.archer@gmx.com>,
	Joel Granados <j.granados@samsung.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 8/8] RISC-V: hwprobe: Document unaligned vector perf
 key
Message-ID: <20240626-cost-agenda-32aa8b68eed7@spud>
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-9-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625005001.37901-9-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_073742_606842_808FBCF3 
X-CRM114-Status: GOOD (  19.62  )
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
Content-Type: multipart/mixed; boundary="===============1826349113243103266=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1826349113243103266==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N6mg3s0wYBE+WDSI"
Content-Disposition: inline


--N6mg3s0wYBE+WDSI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 08:50:01PM -0400, Jesse Taube wrote:
> Document key for reporting the speed of unaligned vector accesses.
> The descriptions are the same as the scalar equivalent values.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> ---
> V1 -> V2:
>   - New patch
> V2 -> V3:
>  - Specify access width
> ---
>  Documentation/arch/riscv/hwprobe.rst | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>=20
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index 7085a694b801..d102b4a16d55 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -236,3 +236,19 @@ The following keys are defined:
> =20
>  * :c:macro:`RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE`: An unsigned int which
>    represents the size of the Zicboz block in bytes.
> +
> +* :c:macro:`RISCV_HWPROBE_KEY_VEC_MISALIGNED_PERF`: An enum value descri=
bing the
> +  performance of misaligned vector accesses on the selected set of proce=
ssors.
> +
> +  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_UNKNOWN`: The performance of =
misaligned
> +    accesses is unknown.
> +
> +  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_SLOW`: 32bit misaligned acces=
ses are slower

s/32bit/32-bit/

Thanks,
Conor.

> +    than equivalent byte accesses.  Misaligned accesses may be supported
> +    directly in hardware, or trapped and emulated by software.
> +
> +  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_FAST`: 32bit misaligned acces=
ses are faster
> +    than equivalent byte accesses.
> +
> +  * :c:macro:`RISCV_HWPROBE_VEC_MISALIGNED_UNSUPPORTED`: Misaligned acce=
sses are
> +    not supported at all and will generate a misaligned address fault.
> --=20
> 2.45.2
>=20

--N6mg3s0wYBE+WDSI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwnpQAKCRB4tDGHoIJi
0kAdAP9dobN6gthH8CDv02wpvxrbh1f/0uKnZEb0OUliog5EuAEAn5VK1pvU+xp9
v3XNf378UlI8mArax8VWdHbpzZXYKQY=
=5BAx
-----END PGP SIGNATURE-----

--N6mg3s0wYBE+WDSI--


--===============1826349113243103266==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1826349113243103266==--

