Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ED28C48BEB
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4kIrIb+hySG/qUcE5KBp/omJHph8QsuhtExIBbsl6GM=; b=BWQok9xDHboCV/D9rFFAqEBTyh
	nz5VVb1pQoiItx2RgqlESe/nMGbXGMN7idiKSo60gYew7X11GmH5PjtESrjioDq0aLkNdk8SXqTkO
	dYDCDoajjOObd7zIlAH6GoglgUdsiHMvW5VIw7Wsj3OZQZv59qjS8SQDf0d6OXYQCefasBeYsolIq
	S5fXTJEjCmuiu7YblJMnfSaU0t2mSRxeeGCzJDCwqyk607XoX9D6iyKrOCaO2ih9uKfcs8gZA8nk8
	w8YVUZ3nuvgsWLhnrZwlHpGQmigXkWCx8N/dR/1MkqM441D9yLrZr/k8Jsfhhj6TsDiC9S5hgGOgw
	bRrVzwng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBQC-0000000CFvw-1eKx;
	Wed, 14 Feb 2024 09:19:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBQA-0000000CFvA-14Qk
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:19:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A15BC616EA;
	Wed, 14 Feb 2024 09:19:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8D38C433C7;
	Wed, 14 Feb 2024 09:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707902353;
	bh=YCSAwDQum/HxDd2CoT/zfQABImWt9YwxCQNEzNNOs6o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OGX+vX+jqWd4FMHHYyQs7KvfeIWQXq1ET9WH4GMh4nM/EhaJ/n2zF99u0VXsLZgrj
	 3T16McQ+pNGc7vqJFEp2tPHoMRjrzaKwHisxxuPoZ5k2lFmj+W3A9ldEh7OXjlSdBS
	 N6f41/3AKiOQdCkLbbpUb+8oVxFYRI0G+KxGSnIkwPWFSAEuj7B24mL2r7plqCs4Od
	 z9ofPvVPtrQA/S4DWaWAfADk6auEhY2MHTXLNf72xShUkWCBBwmRsT5/rAKQkxVuGk
	 o64HlApoifdeC5kjuP/ahD/6L/E2o19Fq8owNeYIFs7d4svhK5Esdl64v0nsk04Qdl
	 na15RMV3D7Q9A==
Date: Wed, 14 Feb 2024 09:19:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Andreas Schwab <schwab@suse.de>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: use KERN_INFO in do_trap
Message-ID: <20240214-exclusion-pluck-fcb6352a8393@spud>
References: <mvmh6ic1y75.fsf@suse.de>
MIME-Version: 1.0
In-Reply-To: <mvmh6ic1y75.fsf@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_011914_370396_0566C45F 
X-CRM114-Status: GOOD (  15.95  )
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
Content-Type: multipart/mixed; boundary="===============0339573726112754295=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0339573726112754295==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7nijc44WcYvCtDli"
Content-Disposition: inline


--7nijc44WcYvCtDli
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 13, 2024 at 10:59:58AM +0100, Andreas Schwab wrote:
> Print the instruction dump with info instead of emergency level like the
> rest of the output when printing the information for an unhandled signal.

I'm not entirely sure that this is true, __show_regs() prints with
KERN_DEFAULT, but this certainly is more consistent than it was before.
Dumping at EMERG doesn't make sense to me though, so
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/kernel/traps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
> index a1b9be3c4332..142f5f5168fb 100644
> --- a/arch/riscv/kernel/traps.c
> +++ b/arch/riscv/kernel/traps.c
> @@ -121,7 +121,7 @@ void do_trap(struct pt_regs *regs, int signo, int cod=
e, unsigned long addr)
>  		print_vma_addr(KERN_CONT " in ", instruction_pointer(regs));
>  		pr_cont("\n");
>  		__show_regs(regs);
> -		dump_instr(KERN_EMERG, regs);
> +		dump_instr(KERN_INFO, regs);
>  	}
> =20
>  	force_sig_fault(signo, code, (void __user *)addr);


--7nijc44WcYvCtDli
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcyFjQAKCRB4tDGHoIJi
0ocxAQDIDrzXGnsjXbqIAyAI1TJRyReiKYUuA7v74VxwywCPJgD8DRsTyGfmrBJF
zc+tsX0xyLCpEcYQjJd9jXUpZ91/xgc=
=uk/t
-----END PGP SIGNATURE-----

--7nijc44WcYvCtDli--


--===============0339573726112754295==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0339573726112754295==--

