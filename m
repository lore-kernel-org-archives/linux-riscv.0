Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607AFCD6E7C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jun 2026 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qEonbNrrVXlkHBkePffVI5bMvu5SlySYB0KTRdCcAbc=; b=kEEzHGV8Wv3IRLkVYmG655/mRF
	a1EDw3qeUoN5SuZ2BnI/jZnQemkB+AfFj/xvkC25KZ96Yv4N5X78FZiPqdgaOf1d7hOJIAIWDvR10
	h/0ZAOrHnkgyON7OmmfCI4W2UlxHZ0SqrieHRh7G1OucrDqcy5h6wnC7PhPIwOfQt+C+NQNW3uxIA
	bedDfn066W2Qplblz2UcM9571pajI4l7ivEl0ct4LOAnfIXcZjpoYkV+xy21OuNTUNkeHKrq/24uR
	UX358lY5lXW1EUnps8Wx2ga4QhRtqkOZKGgmz52NRGkkjIHCqjMh4dD6pdNhTniBuocGPX7HTxO3v
	qYJmWOJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTLI-00000000arS-1XH5;
	Fri, 05 Jun 2026 12:08:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVTLG-00000000arL-3soY
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jun 2026 12:08:02 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 59A6A404A7;
	Fri,  5 Jun 2026 12:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 592CE1F00893;
	Fri,  5 Jun 2026 12:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780661282;
	bh=87M3kBakEBJVQQ4M0v2n+8FD2QjfthNbE3uBbHgwWWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hB+BrAF3+R5c1NEuBb/NrRCTTQsVA3PghmjDLi3rsyIajeXQ48OUQkTQ2+1B/Td67
	 DichNuHaIDLGezakbz2Yg7EF6VcfOAXNOJuPATAZXJ4LAb1QBFbgIJy/Pe7h3N5Uca
	 Rm7Aj80rYylraNt4JOldab5Hzj/EyGjKcLE3HDpX/m2Nusowv4XOu6HxNBSErg7FXm
	 pSoH9O3BxMadxmu/+5ujbjhszft7bKRzAMq4UyovFbh+dMgYKEZMfax6wdimh7xuhL
	 tlid06yV591Bn/P/jhthHwhpbvJVqrWk/xQnVT/aAO1U7+THXg5tybthh/aCB6c8cR
	 dDDqbtbeyMHHA==
Date: Fri, 5 Jun 2026 14:07:58 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Maurice Hieronymus <mhi@mailbox.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
Message-ID: <aiK7i_bblFzHDiH2@monoceros>
References: <20260605-pwm-th1520-fix-v2-1-5921e3a595f7@mailbox.org>
MIME-Version: 1.0
In-Reply-To: <20260605-pwm-th1520-fix-v2-1-5921e3a595f7@mailbox.org>
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
Content-Type: multipart/mixed; boundary="===============4373996600851910119=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4373996600851910119==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gqwi5irkxvviovzj"
Content-Disposition: inline


--gqwi5irkxvviovzj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: th1520: Remove requirement for
 mul_u64_u64_div_u64_roundup
MIME-Version: 1.0

Hello,

On Fri, Jun 05, 2026 at 09:03:59AM +0200, Maurice Hieronymus wrote:
> The cycle register is always u32, so cycles_to_ns() can take a u32
> instead of a u64. With that narrowing, cycles * NSEC_PER_SEC is at most
> u32::MAX * 1e9 (~4.3e18), which fits in u64 without overflow. The
> saturating arithmetic is therefore no longer needed, and the ceiling
> division can use Rust's u64::div_ceil() directly instead of the
> open-coded numerator/denominator form.
>=20
> This also drops the TODO referring to a future
> mul_u64_u64_div_u64_roundup kernel helper, which is no longer required.
>=20
> Reviewed-by: Michal Wilczynski <m.wilczynski@samsung.com>
> Signed-off-by: Maurice Hieronymus <mhi@mailbox.org>

Applied to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

Thanks
Uwe

--gqwi5irkxvviovzj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoivBsACgkQj4D7WH0S
/k7R6wgAuMzZA+55AkXQeRINO6VINuOHL8cJptc2DiHB8jHkCpe/lCHO6md0D9SA
0WQQrBea3pb9DGRf1z0u8iWJpaMzFL0tg3SCUyM1MjHnr9uj37y7O+37ahRiWogT
ovotIzIy3UAZdUel9DA+9yxbooZ6JpkvH77chf9rYYIwtmtorfa1/LSKKryueJ7i
46K3fN5hYuGbkV/QnHLtt6AqEtPv1Hvo5RuZC4ynvE0aIN68NVcvLnahDqGwaRcg
2Dcwq3dOWNzxAuylmH7fa0oR5ur/O5YydLDELBX8++m2Zm4+9I1codmLjeYkF0tX
PHV64hYGR7riLxW3UnGBGX6WFD6fnA==
=lOKo
-----END PGP SIGNATURE-----

--gqwi5irkxvviovzj--


--===============4373996600851910119==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4373996600851910119==--

