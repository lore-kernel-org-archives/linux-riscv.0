Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 107F9C41513
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 10:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q+Sr9NzOyQzhaY/OFf5ainQkbxuBm20QA1H7DruJL1U=; b=TLFQfdfVaJ7h5tdwzY2cBRYJI0
	SnLDHHC4RofBoIWc5h2ZBf1JfYBwkmPwZPRwSjPJSFOL1B/QHPqW9gU4bwPKjwTjvtjTAdlNQVZVk
	TedEjtdiCmwCVhd+SEE1QvZT7Lubn4P6l4TbqA959KgNhc62lNLRWjNR1/MNx+ZDeimV2t3Y2Pt8I
	0/Raa3oUxi3Da4vuUEyUkB/CH6sQutla283kG1boSaPAxLD6bY6Gf12EjHQL0j/x7R+kOkQ1mRbiE
	W/6l187WFwgK/ohh0wvNa7AT0zpxvgUP8VwxiN4D3Ufkf5bUi1lZO/Cv944HPK9t45NGfNAwyqiqr
	lCeI6s5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRVbi-007N1x-20;
	Thu, 03 Aug 2023 10:31:02 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUaj-007COJ-1v
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 09:25:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1691054757; x=1722590757;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Wq+v2Oj+6Mxd2a//oJirAmmObJX/ETHVeQsh34JFG4Q=;
  b=RaO/JGSZf1RqMCvUcN9eUmSmq+8nkAQXx2Qa6npxbZDfu4TKDeE/fv/h
   47O5tLC43d0hLho/JJY8DdchyVE332BGNLFTFzc9qljA/CfTjkaBhoNl9
   dHCrsjy3Nr8T29ImQ4DYxXJlMpX4MNyH6Zw6ZX4FJy6qPWNvuRUWkX/PV
   e56YRsD1DWLz4oB/LxlXwVsdLfb3ELsgOJOcnbCb4BZmniWjOvQlmvYfl
   jxvBYabpcSsQ14JUVTMZitnIaqflLek6TV/E/m/pGkolPxKgx+2dIkcKI
   d7WtIJLV6G8C5X+DEoPwpy/POMOKpr7eSHvqO/DDtdLohXuExr+ijDMZw
   A==;
X-IronPort-AV: E=Sophos;i="6.01,251,1684825200"; 
   d="asc'?scan'208";a="239547799"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 03 Aug 2023 02:25:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 3 Aug 2023 02:25:25 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Thu, 3 Aug 2023 02:25:24 -0700
Date: Thu, 3 Aug 2023 10:24:48 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: dylan <dylan@andestech.com>
CC: Guo Ren <guoren@kernel.org>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@rivosinc.com>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH -fixes] riscv: Implement flush_cache_vmap()
Message-ID: <20230803-stadium-unusable-6cf00e35ec22@wendy>
References: <20230725132246.817726-1-alexghiti@rivosinc.com>
 <CAJF2gTRm59RAJvSf=L2uqbb3rHnANVheO+yLqrJGuVBh1w8Oug@mail.gmail.com>
 <ZMtv5+ut5z3pjlFJ@atctrx.andestech.com>
MIME-Version: 1.0
In-Reply-To: <ZMtv5+ut5z3pjlFJ@atctrx.andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_022557_688972_FBB9965D 
X-CRM114-Status: GOOD (  32.29  )
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
Content-Type: multipart/mixed; boundary="===============0302665599969763178=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0302665599969763178==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nozptzZSf18sXWvu"
Content-Disposition: inline

--nozptzZSf18sXWvu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 03, 2023 at 05:14:15PM +0800, dylan wrote:
> On Sun, Jul 30, 2023 at 01:08:17AM -0400, Guo Ren wrote:
> > On Tue, Jul 25, 2023 at 9:22=E2=80=AFAM Alexandre Ghiti <alexghiti@rivo=
sinc.com> wrote:
> > >
> > > The RISC-V kernel needs a sfence.vma after a page table modification:=
 we
> > > used to rely on the vmalloc fault handling to emit an sfence.vma, but
> > > commit 7d3332be011e ("riscv: mm: Pre-allocate PGD entries for
> > > vmalloc/modules area") got rid of this path for 64-bit kernels, so no=
w we
> > > need to explicitly emit a sfence.vma in flush_cache_vmap().
> > >
> > > Note that we don't need to implement flush_cache_vunmap() as the gene=
ric
> > > code should emit a flush tlb after unmapping a vmalloc region.
> > >
> > > Fixes: 7d3332be011e ("riscv: mm: Pre-allocate PGD entries for vmalloc=
/modules area")
> > > Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> > > ---
> > >  arch/riscv/include/asm/cacheflush.h | 4 ++++
> > >  1 file changed, 4 insertions(+)
> > >
> > > diff --git a/arch/riscv/include/asm/cacheflush.h b/arch/riscv/include=
/asm/cacheflush.h
> > > index 8091b8bf4883..b93ffddf8a61 100644
> > > --- a/arch/riscv/include/asm/cacheflush.h
> > > +++ b/arch/riscv/include/asm/cacheflush.h
> > > @@ -37,6 +37,10 @@ static inline void flush_dcache_page(struct page *=
page)
> > >  #define flush_icache_user_page(vma, pg, addr, len) \
> > >         flush_icache_mm(vma->vm_mm, 0)
> > >
> > > +#ifdef CONFIG_64BIT
> > > +#define flush_cache_vmap(start, end)   flush_tlb_kernel_range(start,=
 end)
> > Sorry, I couldn't agree with the above in a PIPT cache machine. It's
> > not worth for.
> >=20
> > It would reduce the performance of vmap_pages_range,
> > ioremap_page_range ... API, which may cause some drivers' performance
> > issues when they install/uninstall memory frequently.
> >=20
>=20
> Hi All,
>=20
> I think functional correctness should be more important than system perfo=
rmance
> in this case. The "preventive" SFENCE.VMA became necessary due to the RIS=
C-V
> specification allowing invalidation entries to be cached in the TLB.

We are at -rc4 and this stuff is broken. Taking the bigger hammer, which
can be reverted later when a more targeted fix shows up, to make sure
that v6.5 doesn't end up broken, sounds rather prudent. Otherwise, the
original commit should probably be reverted.

> The problem[1] we are currently encountering is caused by not updating th=
e TLB
> after the page table is created, and the solution to this problem can onl=
y be
> solved by updating the TLB immediately after the page table is created.
>=20
> There are currently two possible approaches to flush TLB:
> 1. Flush TLB in flush_cache_vmap()
> 2. Flush TLB in arch_sync_kernel_mappings()
>=20
> But I'm not quite sure if it's a good idea to operate on the TLB inside f=
lush_cache_vmap().
> The name of this function indicates that it should be related to cache op=
erations, maybe
> it would be more appropriate to do TLB flush in arch_sync_kernel_mappings=
()?
>=20
> [1]: http://lists.infradead.org/pipermail/linux-riscv/2023-August/037503.=
html


--nozptzZSf18sXWvu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMtyYAAKCRB4tDGHoIJi
0u/zAP97NUn9kei7lOztrs80Kjn5bphODbu+95FYx7AzN9ltnwEAsbXegqjY7oxy
Y54cRpYdqg38D3rmo30B74v1GcEJWA0=
=imZu
-----END PGP SIGNATURE-----

--nozptzZSf18sXWvu--


--===============0302665599969763178==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0302665599969763178==--

