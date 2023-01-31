Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 027AEC38142
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 19:13:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J1Op2Kas692+ZoxtST6kbqly+CCZ798J1SFUzT/ecTw=; b=muFEtgODUNfPYX5emz++KCKrzn
	AQeKlPTdNWIzrGyV0uTHBm0t/J39pJ37pfwA+MspRfS/+xQs5ysV9NZd7N7Pu6ne4iQf4LByiK5g1
	wr07h6e/RsjPayDn2UIuXsjrU6RPm/MiCj2Se61VOFbx1pcZm4vGAtFqtrrJBlnfD0cHbqftMZzct
	sYVOnHZy4aDmuSY4Fh1Xvm9QWJWsYorgeo6ggMQIir6H4fnSYBxuArUGL+asHbZ3cJzgm/bVm41dr
	G7Gao4PhB6L/rwPC1bPTZyY/rGREo/IsuMVPBlF0sAZyT87JEyo8SycJGtsVtiv1NSsYPleAF0sqx
	+sYAoCoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMw4F-0095hu-1J; Tue, 31 Jan 2023 19:13:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMw4C-0095hP-Jr
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 19:13:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 302116168E;
	Tue, 31 Jan 2023 19:13:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80A42C433D2;
	Tue, 31 Jan 2023 19:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675192395;
	bh=VltjbW6T1jEQWZxEoukktOIp4ozkal5er2F1ZV/I10w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fZ5SPQOaVVpouPzKQqVwQZy/L3vNnkGyl7nnCebULohecmQzteyFdWQSggnK6jRVs
	 OhyBNUF6gCIyEmTOCRCFOYp348qEsKYWgaRN0Cu+Tp5c2zBssl2X82P9x7ZiDxHINY
	 kVKzIhmDKnzefeXX97qMky9JKuzCw7xRBsoEFxqBudXlgTe1FaQbsnewme5FJC/ifJ
	 Z+3VBeZlO3ELVs7Vvl/x+k3ed81dBHGNAqTAQ7EwQrS5CQKWx0SHbjGf1Ptxz4Tl+O
	 ZIJ/Pd6PaZl+F9URLXhrpgX7h03XAiauwxAjxVOt81gsxGSclWdJKRYuXAMYxVcHqP
	 RVb+P7bL6AZtQ==
Date: Tue, 31 Jan 2023 19:13:11 +0000
From: Conor Dooley <conor@kernel.org>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>, Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: Re: [PATCH] riscv: mm: fix regression due to update_mmu_cache change
Message-ID: <Y9loR3kuEXqDGVZE@spud>
References: <20230129211818.686557-1-geomatsi@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20230129211818.686557-1-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_111316_749726_5942737F 
X-CRM114-Status: GOOD (  22.44  )
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
Content-Type: multipart/mixed; boundary="===============8373352196415224294=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8373352196415224294==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lQIwXAPTN2m/wo/K"
Content-Disposition: inline


--lQIwXAPTN2m/wo/K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2023 at 12:18:18AM +0300, Sergey Matyukevich wrote:
> From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
>=20
> This is a partial revert of the commit 4bd1d80efb5a ("riscv: mm: notify
> remote harts about mmu cache updates"). Original commit included two
> loosely related changes serving the same purpose of fixing stale TLB
> entries causing user-space application crash:
> - introduce deferred per-ASID TLB flush for CPUs not running the task
> - switch to per-ASID TLB flush on all CPUs running the task in update_mmu=
_cache
>=20
> According to report and discussion in [1], the second part caused a
> regression on Renesas RZ/Five SoC. For now restore the old behavior
> of the update_mmu_cache.
>=20
> [1] https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@=
gmail.com/

If you respin for another reason, can you convert this into a "regular"
Link: trailer, so that it can be parsed with git's trailer functionality?
IOW, like so:
Link: https://lore.kernel.org/linux-riscv/20220829205219.283543-1-geomatsi@=
gmail.com/ [1]

Otherwise, glad to see you two get this sorted out, even if it is just a
revert.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

> Fixes: 4bd1d80efb5a ("riscv: mm: notify remote harts about mmu cache upda=
tes")
> Reported-by: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pg=
table.h
> index 4eba9a98d0e3..4c3c130ee328 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_st=
ruct *vma,
>  	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>  	 */
> -	flush_tlb_page(vma, address);
> +	local_flush_tlb_page(address);
>  }
> =20
>  #define __HAVE_ARCH_UPDATE_MMU_TLB
> --=20
> 2.39.0
>=20

--lQIwXAPTN2m/wo/K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9loRgAKCRB4tDGHoIJi
0li+AQDsZDMhzesiFuErZStkmObCxbQrXZHaqScmaZF2cmAgDAEAttSBiuuRH1MV
P8htcf6ognDO5SmB9yMC1Ub/7luIGgE=
=DgRf
-----END PGP SIGNATURE-----

--lQIwXAPTN2m/wo/K--


--===============8373352196415224294==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8373352196415224294==--

