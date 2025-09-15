Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52F80CAC592
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Sep 2025 17:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+L7fJUiXojWN+1yuc8h+2EEb4kGm++hZCQ/eNPwJaI=; b=kfW/2j5kIE5WaT57EvS06hQfWs
	0l0bCcytTMg9ELs0bpL+pMKe6V875nayZTdETQyksW1bw+E+4b2JPvKsZmKbMJANyb4PEggRHWiME
	YxUCp0fJ7+xWJLawWsuhQ4bs/MZzzmJcokcygsSxpDoMZIQ8uzn0sFd+udDp36qI6YlFmaMu51HIU
	vKNPzgBEkUMYwJ4q+WDFkdoRW5j7SnvXK0b4BQXMTGLEkAucOQWwArDdslYyX3qX1jF/TlcxnsKFh
	9HclIFrlwwG8J6LeyputlT6nTcuniy/nr3nwok2AGMUe4CiXgF0kDYak7Rx1CmXdogeWFWOd1/8zF
	teqIz2ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCcX-00000005CwD-2lcu;
	Mon, 15 Sep 2025 17:04:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyCcT-00000005Cvn-1mYt
	for linux-riscv@lists.infradead.org;
	Mon, 15 Sep 2025 17:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D95D344D94;
	Mon, 15 Sep 2025 17:04:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBA0DC4CEF1;
	Mon, 15 Sep 2025 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757955840;
	bh=181A4EhfptUEgvkmfyOG1EPOfLyDWETtVkYBcXrHa9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ECx+Kj5wt0FqonvHZaoVS7UFjqUwTm7Wn3cnoSf4DK1LNun8/l9DlZJwILZFIXfh+
	 3w72zJ+PJ69uWw4UjqiTh9EKRbyxq5hsK7Bdt47WA44OnfB2oakBECDKiAwoncE5DU
	 zUdEPIWGxdbwhHJzZHnmfApdsTz/VQ9TEm4BOwNSBTYt3eBmxO9aB0O1oHHNocczZ/
	 /7ayJCAboiKBVT9Sv59fgnd+DxCUl+K/8YfrDkrtA/9Q3CFfiuuplm88pDf5IpQZMD
	 BrTFlYLhObQ7aqM8UhzUPBsjj4CYlrh/EsdjQHZuQleXs83Y+22NrNXZYGFuAF0Pgt
	 +BBkvp8qVwh6g==
Date: Mon, 15 Sep 2025 18:03:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Deepak Gupta <debug@rivosinc.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Xu <peterx@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>
Subject: Re: [PATCH V12 3/5] riscv: Add RISC-V Svrsw60t59b extension support
Message-ID: <20250915-landowner-parsnip-d6778ee7208f@spud>
References: <20250915101343.1449546-1-zhangchunyan@iscas.ac.cn>
 <20250915101343.1449546-4-zhangchunyan@iscas.ac.cn>
MIME-Version: 1.0
In-Reply-To: <20250915101343.1449546-4-zhangchunyan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_100401_506653_AA2B89DA 
X-CRM114-Status: GOOD (  21.01  )
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
Content-Type: multipart/mixed; boundary="===============6445142054840793310=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6445142054840793310==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W4tzl3gVaVkMEf2q"
Content-Disposition: inline


--W4tzl3gVaVkMEf2q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 15, 2025 at 06:13:41PM +0800, Chunyan Zhang wrote:
> The Svrsw60t59b extension allows to free the PTE reserved bits 60
> and 59 for software to use.
>=20
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  arch/riscv/Kconfig             | 14 ++++++++++++++
>  arch/riscv/include/asm/hwcap.h |  1 +
>  arch/riscv/kernel/cpufeature.c |  1 +
>  3 files changed, 16 insertions(+)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 51dcd8eaa243..e1b6a95952c4 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -862,6 +862,20 @@ config RISCV_ISA_ZICBOP
> =20
>  	  If you don't know what to do here, say Y.
> =20
> +config RISCV_ISA_SVRSW60T59B
> +	bool "Svrsw60t59b extension support for using PTE bits 60 and 59"
> +	depends on MMU && 64BIT
> +	depends on RISCV_ALTERNATIVE
> +	default y
> +	help
> +	  Adds support to dynamically detect the presence of the Svrsw60t59b
> +	  extension and enable its usage.
> +
> +	  The Svrsw60t59b extension allows to free the PTE reserved bits 60
> +	  and 59 for software to use.
> +
> +	  If you don't know what to do here, say Y.
> +
>  config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
>  	def_bool y
>  	# https://sourceware.org/git/?p=3Dbinutils-gdb.git;a=3Dcommit;h=3Daed44=
286efa8ae8717a77d94b51ac3614e2ca6dc
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwca=
p.h
> index affd63e11b0a..f98fcb5c17d5 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -106,6 +106,7 @@
>  #define RISCV_ISA_EXT_ZAAMO		97
>  #define RISCV_ISA_EXT_ZALRSC		98
>  #define RISCV_ISA_EXT_ZICBOP		99
> +#define RISCV_ISA_EXT_SVRSW60T59B	100
> =20
>  #define RISCV_ISA_EXT_XLINUXENVCFG	127
> =20
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeatur=
e.c
> index 743d53415572..2ba71d2d3fa3 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -539,6 +539,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] =3D {
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> +	__RISCV_ISA_EXT_DATA(svrsw60t59b, RISCV_ISA_EXT_SVRSW60T59B),
>  	__RISCV_ISA_EXT_DATA(svvptc, RISCV_ISA_EXT_SVVPTC),

If this is not ACPI only, than you need to document this in the
extensions dt-binding.

--W4tzl3gVaVkMEf2q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaMhG+QAKCRB4tDGHoIJi
0owvAP9m+kVfXRCCjk7NRGmDZkEWZQj0HAJD4FE/4xEk8z9WfAEAkX7zbB5CNqiz
ha+ygzCsG/SA9BdVUSZUo2x+PGGLIgo=
=YrBp
-----END PGP SIGNATURE-----

--W4tzl3gVaVkMEf2q--


--===============6445142054840793310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6445142054840793310==--

