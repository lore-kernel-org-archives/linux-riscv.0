Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 071F7C74A5B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Mar 2023 20:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iu5GhXlp55aReB7Po5xecOREqHp6jQWwzo3ixn4ea6w=; b=h0vGty52UuJSESDl9159RXv35Q
	JED09wltbq6LoXxSqsRJ9QPsrZVvZgpt1zeWTbXFYquXE+5lMMruYC8zsu4fCD79jOErK1ogq/3Ak
	NDa3Bo6VxHGde88la99aBKvmClbo2ClV6dPkMaSpwQljMTet5CSZJ/HIpfOmdvtWeESwlqjQSuTXJ
	rIT6DN7IF4BtKHZPLq73par5Q1090lKgg0z2bwgh7lV6xTULIh48Fv3Yd+US4lD1gWrpJFcEmY1NF
	Q84m/YdAcm4xTEOn6I5HrMCBDQPEaewBOf2WFpnEp1tPqTo9lU3ZogaC4IlGmVrrXqVrhqiFwxIzx
	RFnOU5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phciW-001oYd-1i;
	Wed, 29 Mar 2023 20:48:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phciT-001oX3-1o;
	Wed, 29 Mar 2023 20:48:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 57B1161E31;
	Wed, 29 Mar 2023 20:48:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B6DC433D2;
	Wed, 29 Mar 2023 20:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680122898;
	bh=1FYJm+9Wk+njTFrcUWRvLdevGIDr+W6Tthp7LWzQkuU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=boCWhpdBtoliUn63FbbfND/v9Mp/RWyo9JXf+EnIrqGcts24RG6WSsaX8OyyMGpmR
	 OMhsdzI6wjHZ9L9dRgyM81y9GcdEGjJbQ79P89OVt+ES0GP7Dab665WOCD3VG6YGrA
	 QdNC7Z/6qjDNQcC72DoCALVe17ZlH3sMsJ8P/IOLvgrMuYTNGz+ml1q07Ok7jWvsWU
	 B3at/aLp5IMLfrV1PTn7Moz0cGHMllPHtGc4hbYxsce+5WQaL0vhZbd/zaOLetW4Wx
	 Xp1CXJmoO48d6OQNzqYx6AfUxQeMqIO245DQTnKIpDIYzxX7MyaWN5fbqCYcz99XKE
	 SxWP3/q/5qgvQ==
Date: Wed, 29 Mar 2023 21:48:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Stafford Horne <shorne@gmail.com>, Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Max Filippov <jcmvbkbc@gmail.com>, Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-oxnas@groups.io,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org, samuel@sholland.org
Subject: Re: [PATCH 08/21] riscv: dma-mapping: only invalidate after DMA, not
 flush
Message-ID: <2668e232-ae83-4576-beaa-08e420236996@spud>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-9-arnd@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230327121317.4081816-9-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230329_134821_679316_B1AC649D 
X-CRM114-Status: GOOD (  23.21  )
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
Content-Type: multipart/mixed; boundary="===============8504613911640565481=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8504613911640565481==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kOOpdYQXwAfFVnAo"
Content-Disposition: inline


--kOOpdYQXwAfFVnAo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 27, 2023 at 02:13:04PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> No other architecture intentionally writes back dirty cache lines into
> a buffer that a device has just finished writing into. If the cache is
> clean, this has no effect at all, but

> if a cacheline in the buffer has
> actually been written by the CPU,  there is a drive bug that is likely
> made worse by overwriting that buffer.

So does this need a
Fixes: 1631ba1259d6 ("riscv: Add support for non-coherent devices using zic=
bom extension")
then, even if the cacheline really should not have been touched by the
CPU?
Also, minor typo, s/drive/driver/.

In the thread we had that sparked this, I went digging for the source of
the flushes, and it came from a review comment:
https://lore.kernel.org/linux-riscv/342e3c12-ebb0-badf-7d4c-c444a2b842b2@sh=
olland.org/
But *surely* if no other arch needs to do that, then we are safe to also
not do it... Your logic seems right by me at least, especially given the
lack of flushes elsewhere.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/riscv/mm/dma-noncoherent.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoher=
ent.c
> index d919efab6eba..640f4c496d26 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -42,7 +42,7 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t si=
ze,
>  		break;
>  	case DMA_FROM_DEVICE:
>  	case DMA_BIDIRECTIONAL:
> -		ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
> +		ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
>  		break;
>  	default:
>  		break;
> --=20
> 2.39.2
>=20

--kOOpdYQXwAfFVnAo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCSkCAAKCRB4tDGHoIJi
0pCKAQCFyZKqUabYSSJXqqHCLgZcuhg7cae4P41SpPSV+c3z5gEA/c0XOLzsLOMI
IgRP+ghvnIZnEAVO3yHmHKYu0MBqmQM=
=36EO
-----END PGP SIGNATURE-----

--kOOpdYQXwAfFVnAo--


--===============8504613911640565481==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8504613911640565481==--

