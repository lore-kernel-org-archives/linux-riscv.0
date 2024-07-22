Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE30C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 17:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DaOAM6vDKL5vrObSWtrWWHMlEufV0qM/64AkwMxzhvI=; b=UNP1OgGVSDVCkfleyEpJJ4rzL/
	8Nf6wfjZEls4LGTG3mm0XPiSrypdv0/mGzp4XtxMiqn3umAcKwSTe6cYZBJN3FDvcOVCJffIQHkJt
	wCKSaQoF3twJStfiZlPhs0aATmr9GtkVu2tDQP4suT9wo1H0jVzW0exYQBB/hq6/EO1RN+zNJEMwb
	ka2ruVHqySwn9risEP2lmw70D+n4xgYYZ+gxcT/+3g+324FJzki62mNbvocgpxMVWcUxXAVDqEAhN
	7Q5+Zlv9jED76CWVMJ80wfDI6ksm6p7aG3TSJs6H4oLwzfcGZa3nxpka8ib/rzUnf6n1VE/aeEQB2
	ogOVyASQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVwqg-0000000ACWR-1XCW;
	Mon, 22 Jul 2024 17:29:22 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVwq0-0000000ACT8-2zQ6
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 17:29:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C10AFCE0B9B;
	Mon, 22 Jul 2024 17:28:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D11C116B1;
	Mon, 22 Jul 2024 17:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721669317;
	bh=gE67ioz8zjgYuEjUmRgDNta4WfPWJYFrCQjm41DlRjY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWQrGnFDi6rtSeHvm2PJj2hRQ1xi9VLbeoJ4pys14muvHF4xmKqkBNQPzJIZIi9gV
	 gf0xZoYoR194PtP7fUQBfyQYIgyDCd4R5ObBA2acwscvdSrsk83N+Ji1dKx4/ffDju
	 HpF6xNy0ioejp3CoCLJmGF5REPBV6IY7p/bb7CrDQYPtzM2EieAEPkTNgp2u9JI8I1
	 vL2NtdsTUq050sfHSgPqgODKZm0+giTsoScQuOAQ6gQcJ7caX9EBFC8PWO5wNr7VwV
	 E/p5355oh9x9C/gpaUbBpEAjUKFQB4403t7Yg8Z9nSVffm4HUARFS9PXIyzfUt3nzt
	 LvPuIqFhmWj/Q==
Date: Mon, 22 Jul 2024 18:28:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	akpm@linux-foundation.org, surenb@google.com, peterx@redhat.com,
	alexghiti@rivosinc.com, willy@infradead.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv/mm/fault: add show_pte() before die()
Message-ID: <20240722-pantyhose-salvaging-96faac4b4661@spud>
References: <20240722042037.27934-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
In-Reply-To: <20240722042037.27934-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_102841_142144_7459392D 
X-CRM114-Status: GOOD (  18.25  )
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
Content-Type: multipart/mixed; boundary="===============4692743294722093560=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4692743294722093560==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jxAOmrTq4DroifFi"
Content-Disposition: inline


--jxAOmrTq4DroifFi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 22, 2024 at 12:20:37PM +0800, Yunhui Cui wrote:
> When the kernel displays "Unable to handle kernel paging request at
> virtual address", we would like to confirm the status of the virtual
> address in the page table. So add show_pte() before die().
>=20
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>

The patchwork automation reports:
+      1 ../arch/riscv/mm/fault.c:39:4: warning: format specifies type 'uns=
igned long' but the argument has type 'phys_addr_t' (aka 'unsigned long lon=
g') [-Wformat]

Cheers,
Conor.

> ---
>  arch/riscv/mm/fault.c | 53 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
>=20
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 5224f3733802..666d282a8bf4 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -22,6 +22,58 @@
> =20
>  #include "../kernel/head.h"
> =20
> +static void show_pte(unsigned long addr)
> +{
> +	pgd_t *pgdp, pgd;
> +	p4d_t *p4dp, p4d;
> +	pud_t *pudp, pud;
> +	pmd_t *pmdp, pmd;
> +	pte_t *ptep, pte;
> +	struct mm_struct *mm =3D current->mm;
> +
> +	if (!mm)
> +		mm =3D &init_mm;
> +
> +	pr_alert("Current %s pgtable: %luK pagesize, %d-bit VAs, pgdp=3D0x%016l=
x\n",
> +		 current->comm, PAGE_SIZE/SZ_1K, VA_BITS,
> +		 (mm =3D=3D &init_mm ? __pa_symbol(mm->pgd) :
> +		 (unsigned long)virt_to_phys(mm->pgd)));
> +
> +	pgdp =3D pgd_offset(mm, addr);
> +	pgd =3D pgdp_get(pgdp);
> +	pr_alert("[%016lx] pgd=3D%016lx", addr, pgd_val(pgd));
> +	if (pgd_none(pgd) || pgd_bad(pgd) || pgd_leaf(pgd))
> +		goto out;
> +
> +	p4dp =3D p4d_offset(pgdp, addr);
> +	p4d =3D p4dp_get(p4dp);
> +	pr_cont(", p4d=3D%016lx", p4d_val(p4d));
> +	if (p4d_none(p4d) || p4d_bad(p4d) || p4d_leaf(p4d))
> +		goto out;
> +
> +	pudp =3D pud_offset(p4dp, addr);
> +	pud =3D pudp_get(pudp);
> +	pr_cont(", pud=3D%016lx", pud_val(pud));
> +	if (pud_none(pud) || pud_bad(pud) || pud_leaf(pud))
> +		goto out;
> +
> +	pmdp =3D pmd_offset(pudp, addr);
> +	pmd =3D pmdp_get(pmdp);
> +	pr_cont(", pmd=3D%016lx", pmd_val(pmd));
> +	if (pmd_none(pmd) || pmd_bad(pmd) || pmd_leaf(pmd))
> +		goto out;
> +
> +	ptep =3D pte_offset_map(pmdp, addr);
> +	if (!ptep)
> +		goto out;
> +
> +	pte =3D ptep_get(ptep);
> +	pr_cont(", pte=3D%016lx", pte_val(pte));
> +	pte_unmap(ptep);
> +out:
> +	pr_cont("\n");
> +}
> +
>  static void die_kernel_fault(const char *msg, unsigned long addr,
>  		struct pt_regs *regs)
>  {
> @@ -31,6 +83,7 @@ static void die_kernel_fault(const char *msg, unsigned =
long addr,
>  		addr);
> =20
>  	bust_spinlocks(0);
> +	show_pte(addr);
>  	die(regs, "Oops");
>  	make_task_dead(SIGKILL);
>  }
> --=20
> 2.39.2
>=20
>=20

--jxAOmrTq4DroifFi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZp6WwAAKCRB4tDGHoIJi
0sv+AQDVz6BxNdfqj/Mhhk++WSIcOjYj9aQBtAsjf3uv08sPAgD+K8cK7ypV/tvn
IX+ITIjwsuR4c3NegxPFbQjzeDDGNgY=
=RQTs
-----END PGP SIGNATURE-----

--jxAOmrTq4DroifFi--


--===============4692743294722093560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4692743294722093560==--

