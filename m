Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60959C6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Mar 2023 20:36:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PP59gMbZ51uv/xGGx50640xa4ke5nV3Fzu1LKrbBN/8=; b=0G6cdPPkeNYCycRPDJ7MIMHwhL
	FAFmp3x0fl75PWqxYKrxGC71VamUP4az1gXb/Vqdz13Gbv25cnwx7x2OrNOAYp7qgUvHAhWz4a1kI
	Q6ppU7BsX0Jbrn+xY7FBQm3sPf1MTJPwfESw1xpNHePlfYqEo6N/xWgCApWpwVvMmQlfWghpcvEnr
	bD6QOzAW9d8iKLZJrfKaOWwGDGpW4RQh1H805sL+g53eowUIjI7lp+FyCCL5gBvh0ivFTOYRBoG0A
	Pd1/W2OTVyCik1jcKvOsJRijDtqc+TSAYMQLJ1HXe28AzMqNxsMb808YwBkAq2qNZZ6PNnlPyf8FY
	YM8Ne89g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdzl2-007Ogb-0t;
	Sun, 19 Mar 2023 20:36:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdzkz-007Ofh-19
	for linux-riscv@lists.infradead.org;
	Sun, 19 Mar 2023 20:35:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0393860FCA;
	Sun, 19 Mar 2023 20:35:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D44A3C433EF;
	Sun, 19 Mar 2023 20:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679258153;
	bh=oBzUoRkpx/go/ZawYxCRsU86baGLsAHa0Txax9W8KqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=luRWW0dHoUE/2rUL4ZCxeguM5z1iit9HIyzRSjQqUkK3nWIcpW6HC5UgDku5JlyPj
	 CLm8cDCMTK0S1aTVFRxzb/VmGKkAKwARGsyyqPr2sFEUSUIo6jya14E3+ruYmAbdGt
	 1bNFn17GZLK4p/wY7GgCdkkzAN293rbzdHd2d0//1OlByl2TvnpDBzNmcTRGzY4d4C
	 XB+uM2rre3J3+EkbObgFz7h2yMoYLVSoVEqrRH6VW8K80/jkm/CgUSP+FfMTFrMSd4
	 b4FmfDOHqcyRql3ciEFqFKruEmKbFX7501746HWxiA6gPre0rSZLJsPcLRI8kk/BWv
	 CdCqKFtjGkP6g==
Date: Sun, 19 Mar 2023 20:35:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Leonardo Bras <leobras@redhat.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/6] Deduplicating RISCV cmpxchg.h macros
Message-ID: <8f698f49-135a-4263-8471-96f406919cb1@spud>
References: <20230318080059.1109286-1-leobras@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20230318080059.1109286-1-leobras@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230319_133557_459801_CB8B6ECC 
X-CRM114-Status: GOOD (  15.84  )
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
Content-Type: multipart/mixed; boundary="===============0461889496495472813=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0461889496495472813==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="BecIu+WbbGwYTZ29"
Content-Disposition: inline


--BecIu+WbbGwYTZ29
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 18, 2023 at 05:00:54AM -0300, Leonardo Bras wrote:
> While studying riscv's cmpxchg.h file, I got really interested in=20
> understanding how RISCV asm implemented the different versions of=20
> {cmp,}xchg.
>=20
> When I understood the pattern, it made sense for me to remove the=20
> duplications and create macros to make it easier to understand what exact=
ly=20
> changes between the versions: Instruction sufixes & barriers.
>=20
> I split those changes in 3 levels for each cmpxchg and xchg, resulting a=
=20
> total of 6 patches. I did this so it becomes easier to review and remove=
=20
> the last levels if desired, but I have no issue squashing them if it's=20
> better.
>=20
> Please provide comments.
>=20
> Thanks!
> Leo
>=20
> Leonardo Bras (6):
>   riscv/cmpxchg: Deduplicate cmpxchg() asm functions
>   riscv/cmpxchg: Deduplicate cmpxchg() macros
>   riscv/cmpxchg: Deduplicate arch_cmpxchg() macros

>   riscv/cmpxchg: Deduplicate xchg() asm functions

FWIW, this patch seems to break the build pretty badly:
https://patchwork.kernel.org/project/linux-riscv/patch/20230318080059.11092=
86-5-leobras@redhat.com/

Patches 1 & 5 also add quite a lot of sparse issues (like 1000), but I
think that may be more of an artifact of the testing process as opposed
to something caused by this patchset.

Cheers,
Conor.

>   riscv/cmpxchg: Deduplicate xchg() macros
>   riscv/cmpxchg: Deduplicate arch_xchg() macros

--BecIu+WbbGwYTZ29
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZBdyIwAKCRB4tDGHoIJi
0rdbAQCqvm6guH3G65uxvUHg0E/NyKWtgv9gftrjH+Q18u8kgQEA0MUQWh1LcD+a
0yfx5MSukvisMIZ3mflqcCYnhg2skw8=
=+os8
-----END PGP SIGNATURE-----

--BecIu+WbbGwYTZ29--


--===============0461889496495472813==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0461889496495472813==--

