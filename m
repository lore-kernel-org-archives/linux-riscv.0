Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB19C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 07:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQPs5xjmpDvcO+Lyp3uZdaTsBHwFdMe3+zBpRoggyX4=; b=s8RGZ509LsIoMsoYjv7A0gdZ+A
	KARVP9rA0yr30oID2I0mDP9Y/j5ZKuYK+q1aNl8B64LdY5v4dPzCyzI/HuchKPTtZodBxPU0sWQag
	g+HbB9eAJIYMxbvjh7RAB2JzXxeYyuceSCbDbtEUnkZZW9jF+xZN1kL+c4cE9i2WRouusKEgd3yci
	dJ7FdzumdbEofWU/AbkKwCqLYXAOgGqYip0h6A3UKRaTIkaUw2TK1T6smib/QdhavoFoPyi1qfvrJ
	M4A1OuvMtOaV2xTf7KDd23T2gagUN6aBKAYXsu28XjO+2PtdWm9Qzh7QCsqsrqR6YsNTJ3uKxLv8J
	EvNYqKYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTyT-00Gkgq-2d;
	Wed, 12 Jul 2023 07:09:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJTyQ-00GkfI-2R
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 07:09:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689145758; x=1720681758;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=duZW+sLs6ycl8qwh4wlYhASDZojoec/KJOE3c/Wl/kA=;
  b=eatUUJmedl/sF5FMB9n8lo6zPh6KcPVS7BB9UzrBSGYdShWZfxjLIbOO
   q6L3AA0tYYm75dDiRPjVcR43CzwKOHdSfPDTJXCGMZq9oaQXXV5V3HdWc
   Xc47sLQEW18TNUc0428j5aohqhTtiZh4KUxJJkewz+bSJ0WCdGxUvNuDO
   26BYmXbUoxzMi0ZKahI6mMmq0BxqzbdorFaQWsgRbZA1HCYTkxH0gyTLc
   DMn3eZfJ3nOXB6B3+3HNgArUIhX7zxdvvwKllZEt3g9NMjk+XRkL4qh0V
   0yI7MjEDY9Zf9DFXQqKnHEAwDRr3Lgm51cXgBjWvvf6vr0T+HqD9vZYZ+
   w==;
X-IronPort-AV: E=Sophos;i="6.01,199,1684825200"; 
   d="asc'?scan'208";a="222553164"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Jul 2023 00:09:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 12 Jul 2023 00:09:16 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 12 Jul 2023 00:09:14 -0700
Date: Wed, 12 Jul 2023 08:08:42 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Will Deacon <will@kernel.org>, "Aneesh Kumar K . V"
	<aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Nick
 Piggin <npiggin@gmail.com>, Peter Zijlstra <peterz@infradead.org>, Mayuresh
 Chitale <mchitale@ventanamicro.com>, Vincent Chen <vincent.chen@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-arch@vger.kernel.org>, <linux-mm@kvack.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/4] riscv: tlb flush improvements
Message-ID: <20230712-void-sniff-ca1abcbc7783@wendy>
References: <20230711075434.10936-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
In-Reply-To: <20230711075434.10936-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_000918_812379_B3AEB4DF 
X-CRM114-Status: GOOD (  15.49  )
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
Content-Type: multipart/mixed; boundary="===============0755991244791620269=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0755991244791620269==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="dahEnerN+wZuERnx"
Content-Disposition: inline

--dahEnerN+wZuERnx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Alex,

On Tue, Jul 11, 2023 at 09:54:30AM +0200, Alexandre Ghiti wrote:
> This series optimizes the tlb flushes on riscv which used to simply
> flush the whole tlb whatever the size of the range to flush or the size
> of the stride.
>=20
> Patch 3 introduces a threshold that is microarchitecture specific and
> will very likely be modified by vendors, not sure though which mechanism
> we'll use to do that (dt? alternatives? vendor initialization code?).
>=20
> Next steps would be to implement:
> - svinval extension as Mayuresh did here [1]
> - BATCHED_UNMAP_TLB_FLUSH (I'll wait for arm64 patchset to land)
> - MMU_GATHER_RCU_TABLE_FREE
> - MMU_GATHER_MERGE_VMAS
>=20
> Any other idea welcome.
>=20
> [1] https://lore.kernel.org/linux-riscv/20230623123849.1425805-1-mchitale=
@ventanamicro.com/
>=20
> Alexandre Ghiti (4):
>   riscv: Improve flush_tlb()
>   riscv: Improve flush_tlb_range() for hugetlb pages

>   riscv: Make __flush_tlb_range() loop over pte instead of flushing the
>     whole tlb

The whole series does not build on nommu & this one adds a build warning
for regular builds:
+      1 ../arch/riscv/mm/tlbflush.c:32:15: warning: symbol 'tlb_flush_all_=
threshold' was not declared. Should it be static?

Cheers,
Conor.

--dahEnerN+wZuERnx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZK5RegAKCRB4tDGHoIJi
0m6sAQCD5bKPD2l+jsEwxjIzFU/98p6cICiV9t7nlfZ8sb8mXAD/UPM/OYJdjWyb
I2qZkkSuaIMYtFOVwZy/StTB2tnmngQ=
=UB9i
-----END PGP SIGNATURE-----

--dahEnerN+wZuERnx--


--===============0755991244791620269==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0755991244791620269==--

