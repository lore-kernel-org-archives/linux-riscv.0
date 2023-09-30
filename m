Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD45E7735F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Sep 2023 09:02:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gaUImFpks4fWHihUp0jdEBPsO1Y6Geez6wS+VNdIjc=; b=XxQjSi/nAz9WfGlAxHwtKHQrMC
	VAULhYz9ETYnni8URLS0AV19KphfLnZMY6UvWHKUoNJWGy8koKrIEEGlIX/WPKMIg+rRp5+huZL1P
	liXWVfoNYe1ijaRDBrHfToRoJphyk3LK235EI2mn+ecHszcMm6mKEOpd7q7S8y5h9SptAYxCtMWFv
	4sTSNCKyw8WOyhJWsoc/iQAWwBZjnlAwAyPZ3Gkv0zKP3F8ToTkYtKcjNuPAUd1/sdDX51dIJrLQ5
	w+CZZjy3MOmiwBd9bwAZ7Rtu9HzgCPMQzHGxu761lDim4xq1n1mBMlT39HfaMx1ttLydioH7ktNN4
	xt+Qc/gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qmVsA-009DCC-0A;
	Sat, 30 Sep 2023 09:02:50 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qmVs4-009DAi-2d
	for linux-riscv@lists.infradead.org;
	Sat, 30 Sep 2023 09:02:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 95576CE26C5;
	Sat, 30 Sep 2023 09:02:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5B1EC433C8;
	Sat, 30 Sep 2023 09:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696064559;
	bh=qq5LGrB9piI/ALapVoHarnO97Km28K9Nxg5/t/eX3io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LKxqJIH2gitAORyRjRTVUOwJedMlXeBfjfYhSaPvC9muinRajK8LMTESWiHvpKguv
	 2himUzCHPxi9e2BUWe6lTa1DAV/gPbrHcHGPHIv0BxugJyQ9h+XavqGxZ0EB5n9CLD
	 bEFrYwuDLu8c7wt+are2vfq1QwixbaLk8k6ZqYz9+5TJArSwW3T/0ACshg+pZOUdx1
	 ZHZx0U5AXWGiOIEI1zJJ3gHp1GOTymhXXuwaBYcu2AiUXf6LQvtKG5kGOltn+XG7+f
	 iJvzhQxhYf+2WAbH/lA6aicPsVoJB27UPTb53VWd2w9FqchqEJNqj4wu49rX1QcvUs
	 WZNjI10qgI5Fw==
Date: Sat, 30 Sep 2023 10:02:35 +0100
From: Conor Dooley <conor@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Kees Cook <keescook@chromium.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: mm: Update mmap_rnd_bits_max
Message-ID: <20230930-emporium-share-2bbdf7074e54@spud>
References: <20230929211155.3910949-4-samitolvanen@google.com>
 <20230929211155.3910949-6-samitolvanen@google.com>
 <202309291452.66ED9B4D83@keescook>
 <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABCJKufxUVoO+yJ+513W5FOFu6u45N=6wZe6a69u+8LU6A_N2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230930_020245_028240_3A9596E7 
X-CRM114-Status: GOOD (  18.70  )
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
Content-Type: multipart/mixed; boundary="===============2398077382177042112=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2398077382177042112==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ZyDAWSEjMDJNp7Wh"
Content-Disposition: inline


--ZyDAWSEjMDJNp7Wh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 03:52:22PM -0700, Sami Tolvanen wrote:
> On Fri, Sep 29, 2023 at 2:54=E2=80=AFPM Kees Cook <keescook@chromium.org>=
 wrote:
> >
> > On Fri, Sep 29, 2023 at 09:11:58PM +0000, Sami Tolvanen wrote:
> > > ARCH_MMAP_RND_BITS_MAX is based on Sv39, which leaves a few
> > > potential bits of mmap randomness on the table if we end up enabling
> > > 4/5-level paging. Update mmap_rnd_bits_max to take the final address
> > > space size into account. This increases mmap_rnd_bits_max from 24 to
> > > 33 with Sv48/57.
> > >
> > > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> >
> > I like this. Is RISCV the only arch where the paging level can be chosen
> > at boot time?
>=20
> I haven't seen this elsewhere, but I also haven't looked at all the
> other architectures that closely. arm64 does something interesting
> with ARM64_VA_BITS_52, but I think we can still handle that in
> Kconfig.

AFAIU, x86-64 can do this also:

	no4lvl		[RISCV] Disable 4-level and 5-level paging modes. Forces
			kernel to use 3-level paging instead.

	no5lvl		[X86-64,RISCV] Disable 5-level paging mode. Forces
			kernel to use 4-level paging instead.

--ZyDAWSEjMDJNp7Wh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRfkKwAKCRB4tDGHoIJi
0sckAP96xMeKJdlGIablTffmHoXBsU3nIZz+lu2Vm/HAnLMEKAD+Nxq+WTdOPyHE
Tx+O88xAJtz6dMJb3se92VlCB2vHCQA=
=/vk6
-----END PGP SIGNATURE-----

--ZyDAWSEjMDJNp7Wh--


--===============2398077382177042112==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2398077382177042112==--

