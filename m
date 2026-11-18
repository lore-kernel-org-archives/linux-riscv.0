Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D86F606A31C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 06:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=alLmI1wr;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XAcUmROL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Subject:Cc:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7QhvMrz1cmugr4n3e8peZu4nbL1xjqBaswLFWRG1u7U=; b=alLmI1wryoH1imZZ6NTQOMAQiT
	gv6XMOTRJQRn/vBA66lI8Q3r3QJYFM8NV0alH21ylfKD8NGBYT6L1U9t5CeqyRnrPFz6q8fINwjCF
	7iRF3zjQNvwltXaB3SKTqYDY/p+WATjvCFlnrvvpr+pG0Ap+13lBKKCQfw+fe6WBRT8dO9xYVgunu
	+jAKIkEtU9dpLFphkBfRjoyL2h45B6qKkYue0f7WjXgLIHMFZ+fh8tOeDF1GANZhinTrjhNtAuDcU
	PHYsISLoCBodBM7KFPJfazv2ldCD1/zLvuv1yPDyzojTwWYa86RJ0E2PLMk+NYTIo+BmGclkulRfP
	KmONbJKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZV4-00000007wEn-0yru;
	Wed, 18 Nov 2026 06:50:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTZV2-00000007wEb-2KOc;
	Wed, 18 Nov 2026 06:50:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9634361297;
	Wed, 18 Nov 2026 06:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A075C1F000C4;
	Wed, 18 Nov 2026 06:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794984631;
	bh=NaMgfsBXkwIEOSzL6UoZggx97YSqPQt9Uq2nZusRujM=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To;
	b=XAcUmROLtQExiCuSuAsW8ooxm9bwT/FvPpx3bSbrOec6BPLEvr59ut8GEZVgzMbYD
	 eIBoD1xGzpIaJDj27VJPE6JZ079jolaqzUcWK0RxhaLxm9cA5ObCiXTkETA3PR5KSN
	 bi/cp1c3gc1Irg3TPWqai8eVUvyBKfy/5oe+BXviJE22VzjMjNCkd5QuagOcpbKEGV
	 Pi3W5XR5t59OAPqf3RuQ56Wh7Tu6/oB+t5y1ikCYCBrmssUlyDVF+27xLndGE+Nf0d
	 T4VOKbI688J6JuONXT5wXJixogqqqC1hrZ+YUwLHYH/ZEh9Tak+ytQvqDdkzoVIS1A
	 PP6Ee8aqRGcYw==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Date: Wed, 18 Nov 2026 06:50:26 +0000
Message-Id: <DMY4Y1HIP3H1.9THJE8OIYQ6P@kernel.org>
Cc: "Palmer Dabbelt" <palmer@rivosinc.com>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <spacemit@lists.linux.dev>, <stable@vger.kernel.org>, "linux-riscv"
 <linux-riscv-bounces@lists.infradead.org>, "Troy Mitchell"
 <troy@kernel.org>
Subject: Re: [PATCH] riscv: cpu: Fix incorrect cached machine IDs on
 secondary harts
From: "Troy Mitchell" <troy@kernel.org>
To: "Peixin Xie" <peixin.xie@linux.spacemit.com>, "Paul Walmsley"
 <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou"
 <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, "Yixun Lan"
 <dlan@kernel.org>, "Troy Mitchell" <troy.mitchell@linux.spacemit.com>, "Guo
 Ren" <guoren@kernel.org>, "Conor Dooley" <conor.dooley@microchip.com>,
 "Charlie Jenkins" <thecharlesjenkins@gmail.com>
X-Mailer: aerc 0.21.0-reader-ipc4
References: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
In-Reply-To: <20261118-riscv-marchid-fix-v1-1-6d677fcd5461@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6774777885912381911=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6774777885912381911==
Content-Type: multipart/signed;
 boundary=4c0efea937e1a3ca1ee31edaede7a53a9813de01b0dda297014c9e69db09;
 micalg=pgp-sha512; protocol="application/pgp-signature"

--4c0efea937e1a3ca1ee31edaede7a53a9813de01b0dda297014c9e69db09
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Wed Nov 18, 2026 at 3:04 AM GMT, Peixin Xie wrote:
> During early ISA-string parsing, the boot hart stores its mvendorid
> and marchid in riscv_cpuinfo. This happens before setup_per_cpu_areas(),
> which copies the static per-CPU data to each CPU's allocated area.
>
> When riscv_cpuinfo_starting() runs on the other harts, the copied IDs
> are already nonzero, so it skips reading their own IDs. As a result,
> secondary harts can retain the boot hart's IDs.
>
> Read mvendorid and marchid unconditionally on each hart, as already
> done for mimpid.
>
> Fixes: e482eab4d1eb ("riscv: cpufeature: Fix thead vector hwcap removal")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
Reviewed-by: Troy Mitchell <troy@kernel.org>


--=20
Troy Mitchell


--4c0efea937e1a3ca1ee31edaede7a53a9813de01b0dda297014c9e69db09
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iIYEABYKAC4WIQSL4Ay2cExaPXAQcU2YCe+A+TM0LwUCav1KshAcdHJveUBrZXJu
ZWwub3JnAAoJEJgJ74D5MzQv7GAA/30aDkdLRN86mR9b/Nj9+OAU5xj5aQwTCpNj
3MBw49/MAQDO9DEA+xmj89XF48oLFjy0QGlaYBlgJw5taJe1lD4fBw==
=zLIP
-----END PGP SIGNATURE-----

--4c0efea937e1a3ca1ee31edaede7a53a9813de01b0dda297014c9e69db09--


--===============6774777885912381911==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6774777885912381911==--

