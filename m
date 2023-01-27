Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97AF3C38142
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 22:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QihCzDvu1iGZxyYStH2RQQlvJDn0DDQbVwbxpDAQ15I=; b=PQ8qcmwekZdvb4NveUIGd4wkJQ
	6U5kgenoq6tx553ZbPJDfVeD5B/BWPtNtSqmjr1SoKvslbOFjtOVMT0stiqB0O5ziVxQiudC+k/ln
	SuOTcwbBHYedq80MuMXavQGfXoJup86cknr/5Khehq0as9+2RDlcDJSc8ldo8cWE0ubzciCBqJL48
	FSd8N1YoJcWbYdLFUn1u3lFlDHayeMLjBJEi+5AziQej6JfLlnAE1hRSGBiozjDq2HehYWlJ6JTAt
	M5+W/Q/juw/pm1YBtB5m1Nl/GT7rF4IF0X8SRTdqiiJCT8ZyZPT+P1EtnNCZGnXysnx5lzAJg/nVD
	iRZC9lOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXav-00GkD5-1Q; Fri, 27 Jan 2023 22:53:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLXar-00GkBQ-1W; Fri, 27 Jan 2023 22:53:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id EDA1A61DD7;
	Fri, 27 Jan 2023 22:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A201C433EF;
	Fri, 27 Jan 2023 22:53:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674859991;
	bh=AlW+shdolVDZD+HbkKOCpGj3Nr78aWfSzEIvsiWfq3w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T7+IRG0Himjk8sh4eB2oOCBXhhL8B83WBfjC9K55BXmnGc8qPx9gabg++Do+JyIrL
	 JdxglCUACcWNcWW1uazinfWHZiJgGKNGmrn0QCIgg3OXB6FeBWUw/58+XSKjlJtWEH
	 IBUkiaB7wO0Suvl7i0nx4R2XkQwkBhYr5GTEiYUx7CzveTKMTyB5SopUiMpFLPTTJ1
	 nk9XxWBp1qcJze5iL+kuwuNoYIoSERSKi+cF2UXz5nL+LRHNwQHVbXkFfchDUZe4rg
	 4INLIZfopNKkQR+4nnde1GV6DiyJRyqniCeR+FZDRM7RkttnP6T9Q5ifqkA6CQUxz5
	 qYAFFTkRbopOw==
Date: Fri, 27 Jan 2023 22:53:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Atish Patra <atishp@rivosinc.com>
Cc: linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>, Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 03/14] RISC-V: Improve SBI PMU extension related
 definitions
Message-ID: <Y9RV0cOMld20EFBI@spud>
References: <20230127182558.2416400-1-atishp@rivosinc.com>
 <20230127182558.2416400-4-atishp@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230127182558.2416400-4-atishp@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_145313_301086_2529F067 
X-CRM114-Status: GOOD (  12.34  )
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
Content-Type: multipart/mixed; boundary="===============1017269496498619850=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1017269496498619850==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="SXHZm0283L6wqZyc"
Content-Disposition: inline


--SXHZm0283L6wqZyc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Yo Atish,

On Fri, Jan 27, 2023 at 10:25:47AM -0800, Atish Patra wrote:
> This patch fixes/improve few minor things in SBI PMU extension
> definition.
>=20
> 1. Align all the firmware event names.

> @@ -171,7 +171,7 @@ enum sbi_pmu_fw_generic_events_t {
>  	SBI_PMU_FW_IPI_RECVD		=3D 7,
> -	SBI_PMU_FW_FENCE_I_RECVD	=3D 9,
> +	SBI_PMU_FW_FENCE_I_RCVD		=3D 9,
>  	SBI_PMU_FW_SFENCE_VMA_RCVD	=3D 11,

Alignment looks incomplete to me! Looks like you went from 2 RECVD and
1 RCVD to 2 RCVD and 1 RECVD! FWIW, the spec uses RECEIVED for all of
these:
https://github.com/riscv-non-isa/riscv-sbi-doc/blob/master/riscv-sbi.adoc#1=
14-event-firmware-events-type-15

Thanks,
Conor.


--SXHZm0283L6wqZyc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9RV0QAKCRB4tDGHoIJi
0uAcAQDWSusshNSb8//8SiCdQXkPLrC/kJDsiYKg3vrNJmwohAEAjsDGGzhx00ZF
YUzKIx2KVlPQFXJ9hBhCmjsG1KfQ4AE=
=wHrk
-----END PGP SIGNATURE-----

--SXHZm0283L6wqZyc--


--===============1017269496498619850==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1017269496498619850==--

