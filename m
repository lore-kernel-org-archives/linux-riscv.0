Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05956C77B60
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Apr 2023 13:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pU9gc9GS+PyTUTqMhWn79f40wH26x4Lm3uySYms972c=; b=w4YaK1fyHvhEkJubyS7fPQ4Jx4
	ZnO58m3v7q5PKe4VrxgdX2u105dgLq1l1Eq7UtRaz9NBtMbI4J/NszvpQLwtundYJ76HYXz7oesMk
	SU64ixU7g5rz0xsV7JxwhqO5ITy/Gk2SjgjLtuE8+JvX4AkRMw6Zp/cgVdIAFLTxl0mPaFhJ79xdt
	aMqFM45sBlPmUdR9Oc6eDKijSASR45GdpBjEa/WgHzFbCBjyzaa2nO01zZ+Cq8T8kn1NCNZT/MXQX
	4ZaxuvBSPh4MFIALTMqIBDzHVO15lC9hdZte/u3YU1yHYnSkEsOxC3sQ3k3NVeD/51O8Nh8rxp8Yh
	ae/tsFPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pskkj-00ClrN-2G;
	Sat, 29 Apr 2023 13:36:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pskkf-00Clqu-1D
	for linux-riscv@lists.infradead.org;
	Sat, 29 Apr 2023 13:36:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B2CD860B5C;
	Sat, 29 Apr 2023 13:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7345C433D2;
	Sat, 29 Apr 2023 13:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682775396;
	bh=qR5z2S05PO+3Qj7DWNNQjQe9q0aiW2MJANgGn+LsPHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=enTorLCTDVjxvuv4kRHNsvkzVUJCSFBqlCcEvNS8dfSuysh6UVBSUy8eLvdHyRk4k
	 +aOKGUO6qZLblTpetG6GGrkb3Ro+Fv66ZxDTkQbw/51dxEXaIlR+k15NCmpQ7rtuih
	 PHyXlFIQ+EzVUzZziiRDZsOlzgXgW5vh0UPywFrV1WHe2p0tcX8DN3KIASWRTwt5xd
	 abb65x3cDqPYR+Ey+4UP7Vi8Ifk5FayVRU28yzBnXyHyj+dXfB+AkWdLB+xYpFur50
	 GEMk8GfPCkM3NPitOFT3BuYRB1UPZw0ObL9D4InzqkSRY0mGqRu+9xiZK+h8tLwT/b
	 yUwo3pTPnbThA==
Date: Sat, 29 Apr 2023 14:36:31 +0100
From: Conor Dooley <conor@kernel.org>
To: Evan Green <evan@rivosinc.com>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] RISC-V: Track ISA extensions per hart
Message-ID: <20230429-record-plunder-a21cf40d4cee@spud>
References: <20230428190609.3239486-1-evan@rivosinc.com>
 <20230428190609.3239486-3-evan@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230428190609.3239486-3-evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230429_063637_456675_6CDA693D 
X-CRM114-Status: GOOD (  12.36  )
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
Content-Type: multipart/mixed; boundary="===============5032209195139234841=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5032209195139234841==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BLU7QsAwGsxIomG5"
Content-Disposition: inline


--BLU7QsAwGsxIomG5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 28, 2023 at 12:06:07PM -0700, Evan Green wrote:

> @@ -112,14 +116,17 @@ void __init riscv_fill_hwcap(void)
>  	bitmap_zero(riscv_isa, RISCV_ISA_EXT_MAX);
> =20
>  	for_each_of_cpu_node(node) {
> +		struct riscv_isainfo *isainfo;
>  		unsigned long this_hwcap =3D 0;
> -		DECLARE_BITMAP(this_isa, RISCV_ISA_EXT_MAX);
>  		const char *temp;
> +		unsigned int cpu_id;
> =20
>  		rc =3D riscv_of_processor_hartid(node, &hartid);
>  		if (rc < 0)
>  			continue;
> =20
> +		cpu_id =3D riscv_hartid_to_cpuid(hartid);
> +		isainfo =3D &hart_isa[cpu_id];
>  		if (of_property_read_string(node, "riscv,isa", &isa)) {

Would you mind adding a blank line above the if statement please?
Otherwise,
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>  			pr_warn("Unable to find \"riscv,isa\" devicetree entry\n");
>  			continue;

--BLU7QsAwGsxIomG5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZE0dSQAKCRB4tDGHoIJi
0gsnAQD3C7wPGlXJpnjjDLb+5iaR4064+DeCKq1zwwCZmkbK2QEAulHfubOOEb14
bOcIpu2YKL/pjU13yG9aPi38S9/RUwk=
=b/Lb
-----END PGP SIGNATURE-----

--BLU7QsAwGsxIomG5--


--===============5032209195139234841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5032209195139234841==--

