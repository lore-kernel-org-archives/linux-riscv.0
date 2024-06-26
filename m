Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D4B9C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 14:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ztswuHTrIfm8JkaNmaecBAgsE6KSMnjrWiGEa4J7E0=; b=k0qOpsfLjQ4BGXk0wVdie7B7bW
	RA3LjcmhATvyVTjo0kjVhLKdnzOdo8WASgRDX5myAqerNfR+JEvZGtrCLKuPnAcbw1zGwbpDAdRJK
	O9koI/xKEEhyIv8Kv5TDlhJ1V1AfMi+F8LqrwoqHSqkNhc0sKKyHRqa0meCSea8ghpKVghNeVUUXG
	YJCvl95Nl84yMO9wtxoaScKad/h/t4UXxURWO2BAtjvy4dm3U3jc9jQeDACVpr9ID1qLwgFg2EpHK
	fC9ua1g/j3Xy4rLKdtHUtS7EookBT2dypRS5fixMgR4mzoApHixuO34Xj0Kz2dL4dnZvdU3EwcJik
	SCAGzbHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTpz-00000007FEw-3NLM;
	Wed, 26 Jun 2024 14:41:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMTpw-00000007FDd-2pwH
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 14:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB7916177F;
	Wed, 26 Jun 2024 14:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CE53C116B1;
	Wed, 26 Jun 2024 14:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719412887;
	bh=DdsxNLQKRGbMo+BK9eJ/11fHvZ4crlKuZneEQ72JFSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1lrybRHJEGWIbD9jqx+TlApdp5WVct9H9M1JazxDXaICF0VgrMbG4xCrjGT3ymPK
	 Qs9/Qq+fU07VCrtuOyzIv2iCFYGnTpWMHwAVbIvLAMg1BtXshJ1dkibGg1HJPR1YHq
	 Wc7edLjxbTcliD0G37tzEZH34XWT3xI//1Ip9Gk1S6HLMij1LdL9lqeD9mr+N0BYHq
	 e7ugvqtXtu85psytVJBUg+IcmbxjDHx+CcsQ7dSoTRBCRa5zSuQ+h1f7SQ+3+/gmSx
	 xOeLY3bUiuvjsZfTtTtZjbh5YCLrx8O2Xwn4GOCVjOTdthR9m8UAmxn1OerJI6N6+H
	 hXdR9hj1Vo/7w==
Date: Wed, 26 Jun 2024 15:41:19 +0100
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
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 1/8] RISC-V: Add Zicclsm to cpufeature and hwprobe
Message-ID: <20240626-yearling-amplify-42aafd44becd@spud>
References: <20240625005001.37901-1-jesse@rivosinc.com>
 <20240625005001.37901-2-jesse@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20240625005001.37901-2-jesse@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_074129_286921_D7E8EBB1 
X-CRM114-Status: GOOD (  24.20  )
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
Content-Type: multipart/mixed; boundary="===============5788935187638937975=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5788935187638937975==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="FZt9HnGxypnqYZGJ"
Content-Disposition: inline


--FZt9HnGxypnqYZGJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 24, 2024 at 08:49:54PM -0400, Jesse Taube wrote:
> > Zicclsm Misaligned loads and stores to main memory regions with both
> > the cacheability and coherence PMAs must be supported.
> > Note:
> > This introduces a new extension name for this feature.
> > This requires misaligned support for all regular load and store
> > instructions (including scalar and vector) but not AMOs or other
> > specialized forms of memory access. Even though mandated, misaligned
> > loads and stores might execute extremely slowly. Standard software
> > distributions should assume their existence only for correctness,
> > not for performance.
>=20
> Detecing zicclsm allows the kernel to report if the
> hardware supports misaligned accesses even if support wasn't probed.
>=20
> This is useful for usermode to know if vector misaligned accesses are
> supported.
>=20
> Signed-off-by: Jesse Taube <jesse@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
> ---
> V1 -> V2:
>  - Add documentation for Zicclsm
>  - Move Zicclsm to correct location
> V2 -> V3:
>  - No changes
> ---
>  Documentation/arch/riscv/hwprobe.rst  | 3 +++
>  arch/riscv/include/asm/hwcap.h        | 1 +
>  arch/riscv/include/uapi/asm/hwprobe.h | 1 +
>  arch/riscv/kernel/cpufeature.c        | 1 +
>  arch/riscv/kernel/sys_hwprobe.c       | 1 +
>  5 files changed, 7 insertions(+)
>=20
> diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/ri=
scv/hwprobe.rst
> index df5045103e73..7085a694b801 100644
> --- a/Documentation/arch/riscv/hwprobe.rst
> +++ b/Documentation/arch/riscv/hwprobe.rst
> @@ -207,6 +207,9 @@ The following keys are defined:
>    * :c:macro:`RISCV_HWPROBE_EXT_ZVE64D`: The Vector sub-extension Zve64d=
 is
>      supported, as defined by version 1.0 of the RISC-V Vector extension =
manual.
> =20
> +  * :c:macro:`RISCV_HWPROBE_EXT_ZICCLSM`: The Zicclsm extension is suppo=
rted as
> +       defined in the RISC-V RVA Profiles Specification.

I'd rather that you regurgitated the definition here, these keys/values
cannot change their meaning, but RISC-V specs are not stable.

Cheers,
Conor.

--FZt9HnGxypnqYZGJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZnwojwAKCRB4tDGHoIJi
0nv7AP9qWTSBhnLB0HwuyJuPlCmA1yIrABF3M4dcOfL8wyw9MAEAuiQxdKsCJyDS
mEFcXYCJYEI0JxIBBx/Ea88NEfrvAAM=
=etVt
-----END PGP SIGNATURE-----

--FZt9HnGxypnqYZGJ--


--===============5788935187638937975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5788935187638937975==--

