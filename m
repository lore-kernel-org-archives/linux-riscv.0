Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235CDC7EE21
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 21:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xTkYqb/fwChXxttswpOdV3FEX/LNfqXhDUZgch/WYV0=; b=PyOd9BRr/v0Q7LGtLHLbPJzJlC
	ZwUHV9eDEDxsRsjtdlUbZC2MsQbYWt7KGv2uH8p36dyliRcFBnPyTMKBTxL/MmD3QGlk57Cp/fuOI
	aDnuorPdOY6jgC147IL+qvAeqbQqKG7I7aqnm8AW5YLaLtGnzJ6IaEiF0rg476LoL87UwPkZtmjla
	Z827DnfIdaJ4nz0Y2J1AfKlDWsYkitwK8bCYX6rwWz4Sz9q6t5+JQHy22rZ5EoUl+08HZRNG8uPDc
	DWWufT6PccStG1cboglQO2Ve6u9GlwXMlnZQWu+eg+ERRua78ABQXCy8gOxN6sM1Liwa3p3rZuAF/
	HO8QRNeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puggj-0094pc-28;
	Thu, 04 May 2023 21:40:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puggi-0094p0-0E
	for linux-riscv@bombadil.infradead.org;
	Thu, 04 May 2023 21:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Wgmw0UiPdLT49plAQ6Jm46kk1o/I8c/g+D28h3aU8Nc=; b=hemkPDMkMjYNWx3oHLdYbEolgn
	q+SvlTg8QZhZ8yE5IHD9z7dEgeDY8eUVKXj/d/rXuZuXkjWW9R+jAnBEKPseCJYrn/18FYSAh8a+c
	Xq5c4NGf82hoIVSJGNRwxLqttzj4mzvoRuSExYBOL8+WLnZLP1GloaKXQiFweCwYHHQ4Q6caLAYou
	h94hob/8tXfczNL+s8lvV7oXhEe7tGHscOUUrN/P9JBsvq79WHAabuza76i+SBJEsMWc2QzhfD9gZ
	GX5pmK3znbvvl14y/aYvo8nxb0zMcpTjYIyhCnuAsBKzkA7f/4bCDBkPrt1EE66Gjw3DyjlYUirDz
	0xjBUZIA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pufj9-001qaB-2C
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 20:39:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 97CBA60FD2;
	Thu,  4 May 2023 20:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802DBC433D2;
	Thu,  4 May 2023 20:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683232733;
	bh=y9pqVY1l+nMNAXUsrIixLuTEZJIPejtoYxtJzGFAtNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oELnxc2xWZS75QYFOaQ2DVGYsD9AKD+8gnIciQNEFuKrv29lfJ0jPDO/aJPwUlmlM
	 79lyajFTCO2m4MJrU0yk2uwLtRrnu3Ovh+vd69V1K2BdImr8ffHWUu2IrmmEfIIguN
	 oOlnoTXmNKc6tqsVakwJRaLpPNck0cYDiZgb9ImwPcs8+tGn0wHBeI3Rgf7ap1YA3I
	 x5MlZWO0U76vHkZGr8CLiueWZ33amAH9ulm31H2s+NtGpBIQX4miFTPW+r5LJHWlvd
	 rRoq6zx/AI2qYR9d8gwyIalPvIaMVEfsGAdJ448T0WyT8wBiXyV7DjDSHo4yAvPor0
	 m3RJodBNSIX1g==
Date: Thu, 4 May 2023 21:38:49 +0100
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Subject: Re: [PATCH v1 7/7] RISC-V: always report presence of Zicsr/Zifencei
Message-ID: <20230504-chemist-charter-f572af461fcf@spud>
References: <20230504-divisive-unsavory-5a2ff0c3c2d1@spud>
 <20230504-oncoming-antihero-1ed69bb8f57d@spud>
MIME-Version: 1.0
In-Reply-To: <20230504-oncoming-antihero-1ed69bb8f57d@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_213902_111756_B8851A43 
X-CRM114-Status: GOOD (  10.86  )
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
Cc: Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: multipart/mixed; boundary="===============8643171934368069618=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8643171934368069618==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zsSNrn9WyuRUvTKy"
Content-Disposition: inline


--zsSNrn9WyuRUvTKy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 04, 2023 at 07:14:26PM +0100, Conor Dooley wrote:

> @@ -204,8 +204,10 @@ arch_initcall(riscv_cpuinfo_init);
>   * New entries to this struct should follow the ordering rules described above.
>   */
>  static struct riscv_isa_ext_data isa_ext_arr[] = {
> +	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

Heh, well that is not the right order, per the rules I wrote in the
comment above. Whoops...

>  	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
>  	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
> +	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
>  	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
>  	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),


--zsSNrn9WyuRUvTKy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZFQX2AAKCRB4tDGHoIJi
0lIVAQCG8yzNEX5ynMXcqatNT7O8pP+YTukZwLyA54HLnWFMRgD/bWR9zRlrxB8m
ffPdvHqQW3mS7uJOEe/UnTFldYehUwE=
=oxR5
-----END PGP SIGNATURE-----

--zsSNrn9WyuRUvTKy--


--===============8643171934368069618==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8643171934368069618==--

