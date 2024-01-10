Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D226C4707B
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Jan 2024 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah6SgMK0+RwgZw4cAUWFerkZbV9hAIaZ9l02zjhHHw4=; b=1/ZLt1kJXYUrVrsIgtUn2IGnYy
	lFfmSUam8uX3/dPBGcaYSMp65He7CwQD5UlRYqg11Kj9LWC4EbzUN7fZod18yKokZUNrhOfjz7h7D
	LAYWGoUnzVa9hoDAd1siVUckbhD7aj6Q9J17KfbV4NatcUgruFNg3gWaEalgms4e214Cv3Ddc1HfR
	KMivWUyNVkTxfZct8Nct96UZW64KBjHaW+lc8GClIsz/jliZnUVqg5yC4ryZLcFF7IfPr8wpAE3BF
	KK0FcJ+u6xVG68JQPslv0GYz/IgvVfpnjcbo4SSwuTIy8kwxEwBQVBYLt09sl85DeYPJSkoHuo/o0
	X9cxHLkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYwa-00C5bP-2b;
	Wed, 10 Jan 2024 13:48:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNYwX-00C5Z6-2F;
	Wed, 10 Jan 2024 13:48:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2A253B81D6A;
	Wed, 10 Jan 2024 13:48:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14496C433C7;
	Wed, 10 Jan 2024 13:48:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704894507;
	bh=Mpj9MmpWsZ0QXa3z+JG9y8iO9570kyRUme6G8UyY3ns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V1jPPPfbtZjWicjR/pXvV3fvfEd+WTpUYKesK1ver/unl0yUXsY4TkjQIutQjBRsP
	 rP/Oz0q/0h14UEjOgFaxFG624+eWlJ/AO+ivv3TYC1sZnL+hL4/+Alo/46tP000hXg
	 zplNZ64lLrfkj8J9hOzdzzP2smKm7MeEZ/IYISeNp94tvvX509RdtM1WHeyhjMm5jx
	 6PVp6J9lR2f0adpYnosG4kNDW+C6yKAzSmFoUpH39oONuTUSb402zXo2PYbzqdDyDw
	 8BKfIvBQaR2VfeSzJy9k28uur98lcaUtFQRjhOYk1Xziu9Q+q1jecwOjEuD67FrH9y
	 AnuUlci6GEj1Q==
Date: Wed, 10 Jan 2024 13:48:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev,
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-crypto@vger.kernel.org,
	linux-efi@vger.kernel.org, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
	linux-arch@vger.kernel.org, kasan-dev@googlegroups.com,
	linux-mm@kvack.org, bridge@lists.linux.dev, netdev@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/3] arch and include: Update LLVM Phabricator links
Message-ID: <20240110-apostle-trident-533d4c2c9c97@spud>
References: <20240109-update-llvm-links-v1-0-eb09b59db071@kernel.org>
 <20240109-update-llvm-links-v1-2-eb09b59db071@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240109-update-llvm-links-v1-2-eb09b59db071@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240110_054829_892223_40699571 
X-CRM114-Status: GOOD (  14.34  )
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
Content-Type: multipart/mixed; boundary="===============1058759810892293456=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1058759810892293456==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="p6SYI+U6gP5vpK1M"
Content-Disposition: inline


--p6SYI+U6gP5vpK1M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 09, 2024 at 03:16:30PM -0700, Nathan Chancellor wrote:
> reviews.llvm.org was LLVM's Phabricator instances for code review. It
> has been abandoned in favor of GitHub pull requests. While the majority
> of links in the kernel sources still work because of the work Fangrui
> has done turning the dynamic Phabricator instance into a static archive,
> there are some issues with that work, so preemptively convert all the
> links in the kernel sources to point to the commit on GitHub.
>=20
> Most of the commits have the corresponding differential review link in
> the commit message itself so there should not be any loss of fidelity in
> the relevant information.
>=20
> Link: https://discourse.llvm.org/t/update-on-github-pull-requests/71540/1=
72
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

>  arch/riscv/Kconfig              | 2 +-
>  arch/riscv/include/asm/ftrace.h | 2 +-

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--p6SYI+U6gP5vpK1M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZZ6gJAAKCRB4tDGHoIJi
0mIlAQCj5ZP6QEhEswWYjX38obn/p3pF8mt+Ve+vlBnVEhAW8QD8ClRvKxDiajR5
Zp8ES/FLDyH/QJ5QjGuYLP5PATLeFAY=
=SqXc
-----END PGP SIGNATURE-----

--p6SYI+U6gP5vpK1M--


--===============1058759810892293456==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1058759810892293456==--

