Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B495C352A1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 22:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1aWAwlI3oCTsFK2z0ySwLIDt/QJyLJrGxIWKusIyHY=; b=c7sHX7CtH6qiIdf8kMNlY5JPeb
	znxbCzIte4Em7Q4mS1MMrSeD2WEr+NnYE5+h/24fGBreWxdPR2Y59FoDvjfrNVvzyFcxXyQa28gf4
	g3CaQGL16n8hQO/+MPxpmz+k0EBtt3h45sI396wroTXvn5o6emncqjw2ow/6IJREOlmUqE5Dtg7Dy
	4MTmBjKr2hwlMQqiSc2z1Iu+IDNnGAPnndmZwDFFNqRTJVlKwJa9BkEwaVtwHcqMDX1s9jOup2yRo
	Hv8PxHW7Eic2we5A0rK+CEFNXqBeEaLwcsT3dblKcH9NJkYjjEltu15ggBzUmHUXSO3Xh54ILoi9c
	pFIo6PQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2g3F-003j68-Sy; Tue, 06 Dec 2022 22:04:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2g3D-003j4q-Ic; Tue, 06 Dec 2022 22:04:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E53161909;
	Tue,  6 Dec 2022 22:04:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FE19C433D7;
	Tue,  6 Dec 2022 22:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670364266;
	bh=YFNk4wnUyvIHV45xGst0M6Mv6RD7mO9izPkpSepzLzw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CCQ8QgD9sWBXUdsklJNObETAxZWLKj/mfcGTZ8FsD1nSq7Um8QXMlrfDe6T7jUGE3
	 kwaHFl4KCJWaKucnZk5avrgW044opwkMLGVukvCGyfuoF4CST0/Qlk93UlIyWNa9l3
	 70TVGJEfq/srcImBvBAnqnHoreUaVpfIFYrpftHlM1bbrr/Jd/RUbjTSBt5eDJd7iM
	 8Z+87nfBkN2O9wrorSobXkA7SSK+PizEAg9TD8kRLExiyqhwtP/5lUEIswfF7jP2eU
	 4/Vm9Lo12OzFCvjhn1J54MVd6T8Kn5/C14RydSwvjeXrRc0WCE6odlE88JCEBOv/ps
	 X6/mfXaNFWy9Q==
Date: Tue, 6 Dec 2022 22:04:21 +0000
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
Subject: Re: [PATCH v2 11/13] riscv: cpu_relax: switch to
 riscv_has_extension_likely()
Message-ID: <Y4+8ZY8xb2nMRCD6@spud>
References: <20221204174632.3677-1-jszhang@kernel.org>
 <20221204174632.3677-12-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221204174632.3677-12-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221206_140431_669388_DEEF4882 
X-CRM114-Status: GOOD (  17.91  )
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
Content-Type: multipart/mixed; boundary="===============0652034421009023999=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0652034421009023999==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="f4Q+4tgBFM+GKuzY"
Content-Disposition: inline


--f4Q+4tgBFM+GKuzY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 05, 2022 at 01:46:30AM +0800, Jisheng Zhang wrote:
> Switch cpu_relax() from statich branch to the new helper

The tiniest nit: static

> riscv_has_extension_likely()
>=20
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> ---
>  arch/riscv/include/asm/vdso/processor.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/include/asm/vdso/processor.h b/arch/riscv/include=
/asm/vdso/processor.h
> index fa70cfe507aa..edf0e25e43d1 100644
> --- a/arch/riscv/include/asm/vdso/processor.h
> +++ b/arch/riscv/include/asm/vdso/processor.h
> @@ -10,7 +10,7 @@
> =20
>  static inline void cpu_relax(void)
>  {
> -	if (!static_branch_likely(&riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_ZIHINTP=
AUSE])) {
> +	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZIHINTPAUSE)) {
>  #ifdef __riscv_muldiv
>  		int dummy;
>  		/* In lieu of a halt instruction, induce a long-latency stall. */
> --=20
> 2.37.2
>=20

--f4Q+4tgBFM+GKuzY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY4+8ZQAKCRB4tDGHoIJi
0iZSAQDn6oK5bKWljy3KIV6V3K/CWCHzkYcNsNECA5bTRZKIFwEAzfIX2k6NR1ma
Wr/RIOCfc2KOx5pGO8gdBgyULr2aBAM=
=Odo+
-----END PGP SIGNATURE-----

--f4Q+4tgBFM+GKuzY--


--===============0652034421009023999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0652034421009023999==--

