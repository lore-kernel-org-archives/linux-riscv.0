Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4E0C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 23 Feb 2023 23:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HNAZxqUl7aFhArpeer6fb72Ubg0k95iSoAGZ/BPgKBc=; b=DjTL5H3nyyBIwFYPTmwgnGeTkI
	5OszHDzi5KaJWEE1F5qcnubTO/fw70JLHzgUlj1HFaZ7Jq1faXixRwm9j/JYV/peB1K5YuJgQ7qXx
	zDTLSA+yOJ1vjoarS7YUrfapbdmk0xysLjU0weu4uJXjtnTJZsCbmCVaCgAFy53L6AcnDTzGBhfDH
	dxRVvy8hN4zyhq3qdlR9iKDapX+l6Y4xWs7QnGKs+fB4rRDSFlxgtqiNdl75FbRhM/pNEioFDKyoU
	atQfVN/5QmPnv6/W7boKJYW/KF2YO0wbD4zsJAxwJqTYeEVb78UKE5cv3tAm4I4UTAD4235mMMnB5
	p0N1IlPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKyM-000bpH-ES; Thu, 23 Feb 2023 23:25:58 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVKyJ-000bni-Qv
	for linux-riscv@lists.infradead.org; Thu, 23 Feb 2023 23:25:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 936E2CE20EA;
	Thu, 23 Feb 2023 23:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F5C1C433EF;
	Thu, 23 Feb 2023 23:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677194747;
	bh=nQnOq7QdecxNPdiVJpSx7hI2FWWq+mVZSjJpl4dUAWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=grwGco1H73YzpaGRC2qqpD9xHzQyeqW8lknudlFjJ3e+OJ+3dKG6NZPKZIHZeGcqJ
	 fDneMDTlmpoBhYcnXH2mr1+Es97NeFAwLGC8Zv++5SL0n7xji2OwxKfLBAX2y8gHso
	 nkhxa5NnbxWff+VvyYb8nIk/pmyxi/e/nNW80WftP81FYkLkVCQNjfzrUgWY0B136c
	 eYmR99DtIhsUzSBEpNRVbmC3lUjUBupc7/RNTVv6vZ17LazrlpkG/5wOGVG7f0BQMY
	 cobA8a+RbrszI8JtEnqeafeKsCKrL+SwHSRzmCAqV34ISzqpj72LF+XTH468wkRuoo
	 OybxbUr9t9JnQ==
Date: Thu, 23 Feb 2023 23:25:43 +0000
From: Conor Dooley <conor@kernel.org>
To: Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, 'Jisheng Zhang ' <jszhang@kernel.org>,
	'Heiko Stuebner ' <heiko@sntech.de>,
	'Paul Walmsley ' <paul.walmsley@sifive.com>,
	'Palmer Dabbelt ' <palmer@dabbelt.com>,
	'Conor Dooley ' <conor.dooley@microchip.com>,
	'Albert Ou ' <aou@eecs.berkeley.edu>
Subject: Re: [PATCH 4/5] riscv: lib: Include hwcap.h directly
Message-ID: <Y/f195qxnWLEuOMh@spud>
References: <20230221185603.570882-1-ajones@ventanamicro.com>
 <20230221185603.570882-5-ajones@ventanamicro.com>
MIME-Version: 1.0
In-Reply-To: <20230221185603.570882-5-ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_152556_085554_26CFC0DE 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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
Content-Type: multipart/mixed; boundary="===============4889519342371643235=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4889519342371643235==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N6RzUTB+48/Yy7IO"
Content-Disposition: inline


--N6RzUTB+48/Yy7IO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 21, 2023 at 07:56:02PM +0100, Andrew Jones wrote:
> When using alternatives for cpufeatures we should include hwcap.h
> directly, rather than through errata_list.h. Opportunistically drop
> an unused include too.
>=20

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>

--N6RzUTB+48/Yy7IO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/f19wAKCRB4tDGHoIJi
0uVrAQDhDm2GKsbDD6xFeYFDjjjn2yQYHU86oAOMet/yVxwJJQD7BFkNif+mU/Ni
kX2ypmW48QJX4ercvOFTNH/UzLxLFA0=
=P3J6
-----END PGP SIGNATURE-----

--N6RzUTB+48/Yy7IO--


--===============4889519342371643235==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4889519342371643235==--

