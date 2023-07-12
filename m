Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCE3EB64DD
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b10RKqhw9IotJjHZIGui11iP0JIVncfy6LcIhsbmF64=; b=Txq+GhBA8qWSCQdVp82MhH0rJ6
	U7p/6tvoScAXQqL92FjzgDCealzi8ihb0DcluKzYRKNahXrZud73jyR5raW4sdTP6kG1mZv2IzMW9
	ks+wEzSFBr/g6admtTbu3eyE66a3CIqS+V1oCZWLTAA/fOc4CilltqbZdrURNq4CU82jVLy0nZxoj
	hBomjz4ZbKMEiWQLpAL4gqFjYCvhbJCQ1E+wWZ8tPybri69bn2tHXGn2jEfooEyjGdRp7jG5uzmZ8
	nPM6OnzJ5gsir9Us35J/ZAsUMhrXovg/GiOqRHWZ+EDK243b/WB6v3hl6WktyaSte6AsjLZWYd7J/
	xIWy/SNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdVO-000jZH-0z;
	Wed, 12 Jul 2023 17:19:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdVL-000jY2-1j
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:19:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7ED636184D;
	Wed, 12 Jul 2023 17:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35553C433C8;
	Wed, 12 Jul 2023 17:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689182393;
	bh=NxFeXC6CtmYi99+d4gGQB6D+Bb2HkPUKwYRt2ccCYQ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JWosN/cG07XL+NBD9hRPcvNHuIa9Z2RkyHTjLz/YHDehnzNvz/z3P3BBJt1aWu8n9
	 BP0okhPpaLzPAmlmVWRMwYiNtgXpr+sTdyWCGWQBDK894nKN78fRU0MKF21RlV8GRj
	 pcXfRiAJ7VN384hIbC1zcAzEBCw6CrzoTmaYzC6FGtJ/vzN9C4O299sGNkc1QsRDF5
	 lixMCTjInOfxqhtWN/qvydwb2M0Em8xu/MQx+5u9gjQ/iCsRotbfXVSs0qc0bJoFGB
	 u2EgewEB3jkW2GO/GZXNfdcXZHnnTkkiQmTQAaNdKq8tweJBxNZ8wjbd2M+I6ZixYa
	 fJhWwdVICoeSA==
Date: Wed, 12 Jul 2023 18:19:47 +0100
From: Conor Dooley <conor@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-arch@vger.kernel.org,
	linux-mm@kvack.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/4] riscv: tlb flush improvements
Message-ID: <20230712-frying-unaired-e3acb5150e8b@spud>
References: <20230711075434.10936-1-alexghiti@rivosinc.com>
 <20230712-void-sniff-ca1abcbc7783@wendy>
 <bbda29db-644d-ed9b-2894-43f4c2addb52@ghiti.fr>
MIME-Version: 1.0
In-Reply-To: <bbda29db-644d-ed9b-2894-43f4c2addb52@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_101955_668586_30075C8A 
X-CRM114-Status: GOOD (  24.93  )
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
Content-Type: multipart/mixed; boundary="===============6613303066568771847=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6613303066568771847==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="DukaoZmy8ISySIVX"
Content-Disposition: inline


--DukaoZmy8ISySIVX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 12, 2023 at 05:18:00PM +0200, Alexandre Ghiti wrote:
> On 12/07/2023 09:08, Conor Dooley wrote:
> > On Tue, Jul 11, 2023 at 09:54:30AM +0200, Alexandre Ghiti wrote:
> > > This series optimizes the tlb flushes on riscv which used to simply
> > > flush the whole tlb whatever the size of the range to flush or the si=
ze
> > > of the stride.
> > >=20
> > > Patch 3 introduces a threshold that is microarchitecture specific and
> > > will very likely be modified by vendors, not sure though which mechan=
ism
> > > we'll use to do that (dt? alternatives? vendor initialization code?).
>=20
>=20
> @Conor any idea how to achieve this?

It's in my queue of things to look at, just been prioritising the
extension related stuff the last few days. Hopefully I'll have a chance
to think about this tomorrow.. Famous last words probably.

> > > Next steps would be to implement:
> > > - svinval extension as Mayuresh did here [1]
> > > - BATCHED_UNMAP_TLB_FLUSH (I'll wait for arm64 patchset to land)
> > > - MMU_GATHER_RCU_TABLE_FREE
> > > - MMU_GATHER_MERGE_VMAS
> > >=20
> > > Any other idea welcome.
> > >=20
> > > [1] https://lore.kernel.org/linux-riscv/20230623123849.1425805-1-mchi=
tale@ventanamicro.com/
> > >=20
> > > Alexandre Ghiti (4):
> > >    riscv: Improve flush_tlb()
> > >    riscv: Improve flush_tlb_range() for hugetlb pages
> > >    riscv: Make __flush_tlb_range() loop over pte instead of flushing =
the
> > >      whole tlb
> > The whole series does not build on nommu & this one adds a build warning
> > for regular builds:
> > +      1 ../arch/riscv/mm/tlbflush.c:32:15: warning: symbol 'tlb_flush_=
all_threshold' was not declared. Should it be static?
> >=20
> > Cheers,
> > Conor.
>=20
>=20
> I'll fix the nommu build, sorry about that. Weird I missed this warning,
> that's an LLVM build right? That variable will need to overwritten by the
> vendors, so that should not be static (but it will depend on what solution
> we implement).

Just make it static until we actually have a vendor implementation of
this stuff please, since we don't know what that will look like yet.

--DukaoZmy8ISySIVX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK7gswAKCRB4tDGHoIJi
0sARAP9L9TJFvX4OL1Vu0rUL3dlGaM7MfIeHb3RG1JQ34iSI7QEAo13IMSfJ0aYS
1YYxInR3X7k1leS1v4O0IaTHUsMX5Ak=
=ebMg
-----END PGP SIGNATURE-----

--DukaoZmy8ISySIVX--


--===============6613303066568771847==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6613303066568771847==--

