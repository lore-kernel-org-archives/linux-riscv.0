Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6E9C678D5
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 10:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlzDSrXMoxBk23i2CEvOj+I5Srmw9GhU4XEh3mCnpUw=; b=mLDt6tiFsPl056m6/gZeoNW1Ly
	63Fi3GPaY16zr+lRPKVwwQb6yzKomd1fjkMkdncTecKWLTwk0Y4yp2egassgMVQGCJv+2UBtqGZzx
	We4VcUkHhRNCqrx03W4gHVgrPItKwMiSgqxZaG5lu0cLkuDwxtJqdPDn53zCxzXLqWEjPyM2FuZlW
	EjN+krteUU10KpzERp5jSI6njsRV0lYSxsadX9Hv9MPcrfKs608vCSCyoznkZ3AMFGgQBIljZuE9I
	lNOpvez8B0efT+Mutj1eJOvEXHUk5AqA9pDFc6FoW4zfMNMW0WhscmMjPwMzBqKg89v2NBWwk1PPx
	E2PYl8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqnd-004Ml6-RS; Wed, 08 Mar 2023 10:13:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZqna-004Mjs-Pj
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 10:13:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2D09BB81C14;
	Wed,  8 Mar 2023 10:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64630C433EF;
	Wed,  8 Mar 2023 10:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678270407;
	bh=QIgfygovUu0BqGzkU3RgUu/0AppXmJ+6TwFjEH66yFw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WSnJ07Px4QneRPeaxzWTmPLhNCQhpOhDKRIMEFsXFM+ontRbIYGYIFToVDMOkKdTM
	 elW00ynJIMVp1F5nzlHGq1AQvbfIZmePYkdzRpGgzlCxuoWad9OIVmbk37NW8DwzWK
	 G7/NkdAfhZqWI/IQmi9zLCTR5jA1GT8V7N8wWBH2VtvZuhCrsfbkwM4FrV2AMuziTd
	 AzO9zDZ5YTtENpDH+NC/QlGEaKUL5USybphyBype+iESDZh4LszdAa4AwtOvatW/eF
	 A8e4n5p6fm8k8VEHrFCv8uAs1rWjhJUx8JMwNrjkfZEz+WWptJ1zrF7SG3DcPYwM+y
	 frw9MQzLBnzjw==
Date: Wed, 8 Mar 2023 10:13:23 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, heiko.stuebner@vrull.eu,
	conor.dooley@microchip.com, ajones@ventanamicro.com
Subject: Re: [PATCH 2/2] riscv: mm: add pgprot_dmacoherent for zicbom
Message-ID: <c1498777-f7c1-4b01-a40c-5ba0f547aaba@spud>
References: <20230307205834.1426289-1-ben.dooks@codethink.co.uk>
 <20230307205834.1426289-3-ben.dooks@codethink.co.uk>
 <226aa2ae-dfa0-d947-0aaf-4407e0c0bc5b@codethink.co.uk>
MIME-Version: 1.0
In-Reply-To: <226aa2ae-dfa0-d947-0aaf-4407e0c0bc5b@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_021331_159362_E7CF4159 
X-CRM114-Status: GOOD (  29.41  )
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
Content-Type: multipart/mixed; boundary="===============2548676812814550788=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2548676812814550788==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MwQDbfSszxXLc4BJ"
Content-Disposition: inline


--MwQDbfSszxXLc4BJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 08, 2023 at 09:35:14AM +0000, Ben Dooks wrote:
> On 07/03/2023 20:58, Ben Dooks wrote:
> > If the system uses both ZICBOM and SVPBMT then currently SVPBMT will be
> > used for DMA allocated memory even though ZICBOM gives us the cache ops
> > to use cached memory and clean/flush them as needed by the DMA code.
> >=20
> > Fix this by adding pgprot_dmacoherent() which is used by the allocator
> > code to map the dma memory, thus allowing the return of suitably mapped
> > memory for any use of dma_alloc_attrs() code. This s uses the added
> > riscv_page_dmacoherent() which will work out the correct page flags to
> > return using ALT_SVPBMT_ZICBOM() to runtime patch the right result.
> >=20
> > Note, we can't just disable SVPBMT as it will be neede for things like
> > ioremap() which don't have assoicated cache management operations.
> >=20
> > Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> > ---
> >   arch/riscv/include/asm/errata_list.h | 16 ++++++++++++++++
> >   arch/riscv/include/asm/pgtable-64.h  | 10 ++++++++++
> >   2 files changed, 26 insertions(+)
> >=20
> > diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/=
asm/errata_list.h
> > index fb1a810f3d8c..49ed2e7984a7 100644
> > --- a/arch/riscv/include/asm/errata_list.h
> > +++ b/arch/riscv/include/asm/errata_list.h
> > @@ -62,6 +62,22 @@ asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
> >   		  "I"(ALT_SVPBMT_SHIFT),				\
> >   		  "I"(ALT_THEAD_PBMT_SHIFT))
> > +#define ALT_SVPBMT_ZICBOM(_val, prot)					\
> > +asm(ALTERNATIVE_3("li %0, 0\t\nnop",					\
> > +		  "li %0, %1\t\nslli %0,%0,%3", 0,			\
> > +			RISCV_ISA_EXT_SVPBMT, CONFIG_RISCV_ISA_SVPBMT,	\
> > +		  "li %0, 0\t\nnop", 0,					\
> > +			RISCV_ISA_EXT_ZICBOM, CONFIG_RISCV_ISA_ZICBOM,	\
>=20
> so, I tink this needs to be selected on CONFIG_RISCV_DMA_NONCOHERENT
> as just having ZICBOM in the ISA isn't enough to actually use it, you'll
> need the dma-noncoherent.o being built to do the cache management.

I think we are okay here w/ ZICBOM, as it selects RISCV_DMA_NONCOHERENT:
config RISCV_ISA_ZICBOM
	bool "Zicbom extension support for non-coherent DMA operation"
	depends on !XIP_KERNEL && MMU
	default y
	select RISCV_ALTERNATIVE
	select RISCV_DMA_NONCOHERENT

In fact, I think that RISCV_DMA_NONCOHERENT would not be correct here,
as the THEAD CMO erratum selects RISCV_DMA_NONCOHERENT, so its presence
doesn't mean that the kernel supports Zicbom.

> > +		  "li %0, %2\t\nslli %0,%0,%4", THEAD_VENDOR_ID,	\
> > +			ERRATA_THEAD_PBMT, CONFIG_ERRATA_THEAD_PBMT)	\
> > +		: "=3Dr"(_val)						\
> > +		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
> > +		  "I"(prot##_THEAD >> ALT_THEAD_PBMT_SHIFT),		\
> > +		  "I"(ALT_SVPBMT_SHIFT),				\
> > +		  "I"(ALT_THEAD_PBMT_SHIFT))
> > +
> > +
> > +
> >   #ifdef CONFIG_ERRATA_THEAD_PBMT
> >   /*
> >    * IO/NOCACHE memory types are handled together with svpbmt,
> > diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/a=
sm/pgtable-64.h
> > index 42a042c0e13e..e0d2e5fda5a4 100644
> > --- a/arch/riscv/include/asm/pgtable-64.h
> > +++ b/arch/riscv/include/asm/pgtable-64.h
> > @@ -126,10 +126,20 @@ static inline u64 riscv_page_io(void)
> >   	return val;
> >   }
> > +static inline u64 riscv_page_dmacoherent(void)
> > +{
> > +	u64 val;
> > +
> > +	ALT_SVPBMT_ZICBOM(val, _PAGE_IO);
> > +	return val;
> > +}
> > +
> >   #define _PAGE_NOCACHE		riscv_page_nocache()
> >   #define _PAGE_IO		riscv_page_io()
> >   #define _PAGE_MTMASK		riscv_page_mtmask()
> > +#define pgprot_dmacoherent(__prot) __pgprot(pgprot_val(__prot) | riscv=
_page_dmacoherent())
> > +
> >   /* Set of bits to preserve across pte_modify() */
> >   #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ =
|	\
> >   					  _PAGE_WRITE | _PAGE_EXEC |	\
>=20
> --=20
> Ben Dooks				http://www.codethink.co.uk/
> Senior Engineer				Codethink - Providing Genius
>=20
> https://www.codethink.co.uk/privacy.html
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--MwQDbfSszxXLc4BJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZAhfwwAKCRB4tDGHoIJi
0m9qAQDu/Jf5DlEuGZ6SQpteCUcfuLhXd1+63XEhc9DZaGFTTQD9FHUALH3E8W5L
6a7vC0KiyLQsSNSCStbs6J1RG9kZTA8=
=GMUD
-----END PGP SIGNATURE-----

--MwQDbfSszxXLc4BJ--


--===============2548676812814550788==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2548676812814550788==--

