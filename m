Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5805C04A6A
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 12:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=huQ1zFIPS4ojjAgZ+Nfb3zrleOF90Voe/ndOxAclarM=; b=Su3zqZ88mWMpbykfMTtWuwJbb5
	ReA/BSxHFBaF8Y6gIpJa7Gu+edtSTNYOj4CccOkvlH7hIgMo9awIXF96BDAA8ZywGDVU46k/vhxSZ
	bQ+85PvfchqNxoTJXDXm5gKnvVX9pZjO6OO76RBuSgKBNKbSFVi+B8FDPJiwtDFUdqfpVSp110/44
	/6yQSqb0zWQeusDfHf0ztuF0NkyJOrWrr8oumQrtM4THs3qQJ1G0PdPjyA7s7LOJYzIyCaVPHl3jD
	VAS324RwoHeESH/ZW+ZWNk2TQCcOkPhL29ZRlqZMI5+shg0mry6lqae8NwBNhFghoQPUFXvjKpLIc
	f1tIqWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP0Bj-00Dypa-2Z;
	Thu, 27 Jul 2023 12:33:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP0Bf-00DymK-2T
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 12:33:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 12A5961E5D;
	Thu, 27 Jul 2023 12:33:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96677C433C8;
	Thu, 27 Jul 2023 12:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690461226;
	bh=7VsMmtHFnt3Mu8te/EKSf4+ZEamhC9GT5n3lbZ8HcF0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KryMqBMvkbHpL7pIWShH5LDgkQwzn4vj30MjLrUKKcupCQw0pYVMWO+JBKD8n74es
	 WSTLcMbzb5HcSjtxpdsDLQwgyhjDziMh1rIQIcpVZJkJ7q998QwCJWE/d7v0gugot4
	 lSNcnerOHaHeiPZ8yFSFVOl7fS9POcfpRAmJjLpZiaKHW+Nx3KReQ11+0xcQEYj7Rd
	 BYx9/GYFS36xA68BhbZyefhKmdfTIkMAPz0pV+P+CYLrpIkspEY7815Ho+n4rzaqv5
	 IQueyjIk4ayVdFn7Anr+T4fEMCaRfUQ6MmvGBSYP01oVnG8BngrTSLuoH+1kgZ3DqI
	 KlyaLbKhTAwHg==
Date: Thu, 27 Jul 2023 13:33:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@rivosinc.com,
	aou@eecs.berkeley.edu, anup@brainfault.org,
	konstantin@linuxfoundation.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-mm@kvack.org,
	mick@ics.forth.gr, jrtc27@jrtc27.com, rdunlap@infradead.org,
	alexghiti@rivosinc.com
Subject: Re: [PATCH v7 1/4] RISC-V: mm: Restrict address space for
 sv39,sv48,sv57
Message-ID: <20230727-unruffled-joyride-410fc348ce7b@spud>
References: <20230726164620.717288-1-charlie@rivosinc.com>
 <20230726164620.717288-2-charlie@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230726164620.717288-2-charlie@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_053347_897153_41EB4A20 
X-CRM114-Status: GOOD (  19.81  )
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
Content-Type: multipart/mixed; boundary="===============2143929126690195595=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2143929126690195595==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0svxelhh/GmhJGt3"
Content-Disposition: inline


--0svxelhh/GmhJGt3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Charlie,

On Wed, Jul 26, 2023 at 09:45:55AM -0700, Charlie Jenkins wrote:
> Make sv48 the default address space for mmap as some applications
> currently depend on this assumption. A hint address passed to mmap will
> cause the largest address space that fits entirely into the hint to be
> used. If the hint is less than or equal to 1<<38, an sv39 address will
> be used. An exception is that if the hint address is 0, then a sv48
> address will be used. After an address space is completely full, the next
> smallest address space will be used.
>=20
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
> ---
>  arch/riscv/include/asm/elf.h       |  2 +-
>  arch/riscv/include/asm/pgtable.h   | 13 ++++++++-
>  arch/riscv/include/asm/processor.h | 47 +++++++++++++++++++++++++-----
>  3 files changed, 53 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
> index c24280774caf..5d3368d5585c 100644
> --- a/arch/riscv/include/asm/elf.h
> +++ b/arch/riscv/include/asm/elf.h
> @@ -49,7 +49,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
>   * the loader.  We need to make sure that it is out of the way of the pr=
ogram
>   * that it will "exec", and that there is sufficient room for the brk.
>   */
> -#define ELF_ET_DYN_BASE		((TASK_SIZE / 3) * 2)
> +#define ELF_ET_DYN_BASE		((DEFAULT_MAP_WINDOW / 3) * 2)
> =20
>  #ifdef CONFIG_64BIT
>  #ifdef CONFIG_COMPAT
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 75970ee2bda2..530f6a171a2b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -63,12 +63,23 @@
>   * position vmemmap directly below the VMALLOC region.
>   */
>  #ifdef CONFIG_64BIT
> +#define VA_BITS_SV39 39
> +#define VA_BITS_SV48 48
> +#define VA_BITS_SV57 57
> +
> +#define VA_USER_SV39 (UL(1) << (VA_BITS_SV39 - 1))
> +#define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
> +#define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))
> +
>  #define VA_BITS		(pgtable_l5_enabled ? \
> -				57 : (pgtable_l4_enabled ? 48 : 39))
> +				VA_BITS_SV57 : (pgtable_l4_enabled ? VA_BITS_SV48 : VA_BITS_SV39))
>  #else
>  #define VA_BITS		32
>  #endif

Please, at the very least, build test things for rv32 if you are going
to change things in mm:
io_uring/io_uring.c:3457:20: error: use of undeclared identifier 'VA_BITS_S=
V39'
io_uring/io_uring.c:3457:20: error: use of undeclared identifier 'VA_BITS_S=
V39'
io_uring/io_uring.c:3457:20: error: use of undeclared identifier 'VA_BITS_S=
V39'
io_uring/io_uring.c:3457:20: error: use of undeclared identifier 'VA_BITS_S=
V39'
io_uring/io_uring.c:3457:20: error: use of undeclared identifier 'VA_BITS_S=
V39'
io_uring/io_uring.c:3457:20: error: use of undeclared identifier 'VA_BITS_S=
V39'
mm/util.c:441:19: error: use of undeclared identifier 'VA_BITS_SV39'
mm/util.c:441:19: error: use of undeclared identifier 'VA_BITS_SV39'
mm/util.c:441:19: error: use of undeclared identifier 'VA_BITS_SV39'
mm/util.c:441:19: error: use of undeclared identifier 'VA_BITS_SV39'
mm/util.c:441:19: error: use of undeclared identifier 'VA_BITS_SV39'
mm/util.c:441:19: error: use of undeclared identifier 'VA_BITS_SV39'
mm/mmap.c:1770:20: error: use of undeclared identifier 'VA_BITS_SV39'
mm/mmap.c:1770:20: error: use of undeclared identifier 'VA_BITS_SV39'
mm/mmap.c:1770:20: error: use of undeclared identifier 'VA_BITS_SV39'
mm/mmap.c:1770:20: error: use of undeclared identifier 'VA_BITS_SV39'
mm/mmap.c:1770:20: error: use of undeclared identifier 'VA_BITS_SV39'
mm/mmap.c:1770:20: error: use of undeclared identifier 'VA_BITS_SV39'

Thanks,
Conor.

--0svxelhh/GmhJGt3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMJkJQAKCRB4tDGHoIJi
0mzpAPwJWPSKvd4h8Mm2l0MHa3fl9fuzK7BKyFcMJpsby/MFOgEA/1VnfZ0R7Xf9
N3Mv5qgorgiDhx/vTvbCdG/fUFEpCwk=
=LPTS
-----END PGP SIGNATURE-----

--0svxelhh/GmhJGt3--


--===============2143929126690195595==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2143929126690195595==--

