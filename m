Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92683D2ECF7
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 08:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yr63O+YC6guwHsxSWibPhAEv66YLo4FBIYa2w8Dfulg=; b=yHeL8L+SJtwRS1OBfzuIDyoAcs
	bNX3czMGTPGKcSMX7kL8FEjt0QQFZ2XqlzyF+cuJpqI9v98m0I3oqJMRKkPMDLDI3zA5ICLilHDQy
	/TUiYbjURfXQP3K73lQ36bv7mkkTKe8416TQMgK60HArOeKixsd7AMDxaw1I6UyYK3pKvUUuqX28g
	nDkgZ94PhFsvb+i89pGSKV2znVF+DGYwXeFm+7JMguHdrmdjgI79Zr4g4LF7pc0wuXPbVH1GjkWGT
	bUCMq2xdxLFvmaUFhwQC5An0SzNKzFm0wq1tTr+R/lSx0d0Ih7OA+ALTCbkFtqoiN17tS/fTmxJxp
	ZA/wxIJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Gi-00000003TMc-3EYu;
	Tue, 20 Jan 2026 08:39:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7Gg-00000003TME-03Qn
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 08:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D277B40B32;
	Tue, 20 Jan 2026 08:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35B8EC16AAE;
	Tue, 20 Jan 2026 08:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768898355;
	bh=4BsRuPSOnjDi5faQkQXbt5AD6hpnYNqK4kLb4+PdhXQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PliWaud5nG5JDjIa2ujDTKQkmmSdPKaDi2LsIIIrUEef+84M0282Vj1Pqoc4BRb5E
	 RvewXuQMlaJywVGAMjuRxDzwm3Whcg3i/tFt/NhPm+2Pxg3Ug1l+sA5GWLDaSEDmpL
	 r0JqA9hRctC4IKP5Df8Sw8ZXpkooQBLGnbBRa8oQ/c+xeZov/eHliLxFPGHoaIFFQE
	 3auUCdqtxvNF7aZW1OUwHi6EW/ShYTHpQTzOd7gLbVjWH/tbBHAA5UwLCpjZyjmTJ9
	 ePv2Y3b/fH4CN3zMt/dlFO7g6R/4KQbV8V14tFrVWqD5d4b8hBB6fv+snRv2RzfJAY
	 MxODOH0pm2BuQ==
Date: Tue, 20 Jan 2026 09:39:12 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Tamir Duberstein <tamird@gmail.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
Message-ID: <o4uvwymm73wnehs5zb7lqgv3mjv235jpprfqrsb6oxscxhmmjh@25u7wrb7yo2i>
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_003918_114278_9A86A0B6 
X-CRM114-Status: GOOD (  10.65  )
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
Content-Type: multipart/mixed; boundary="===============4208126327731055047=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4208126327731055047==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ed7x3rrm3oecwey2"
Content-Disposition: inline


--ed7x3rrm3oecwey2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0

Hello,

On Mon, Dec 22, 2025 at 01:24:46PM +0100, Tamir Duberstein wrote:
> From: Tamir Duberstein <tamird@gmail.com>
>=20
> C-String literals were added in Rust 1.77. Replace instances of
> `kernel::c_str!` with C-String literals where possible.
>=20
> Signed-off-by: Tamir Duberstein <tamird@gmail.com>

Applied to

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for=
-next

as merge window material with the R-b tags by Michal Wilczynski and
Daniel Almeida.

(Side note, b4 told me:

	  =E2=9C=97 No key: openssh/tamird@gmail.com

=2E It's not clear to me how to verify this signature. My experiments
include:

	$ b4 kr --show-keys 20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com
	---
	No keys found in the thread.

and looking at
https://lore.kernel.org/linux-pwm/20251222-cstr-pwm-v1-1-e8916d976f8d@gmail=
=2Ecom/raw
where I see

	X-Developer-Key: i=3Dtamird@gmail.com; a=3Dopenssh; fpr=3DSHA256:264rPmnnr=
b+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc

which IIUC isn't enough to verify the next mail signed with the same
key. Am I missing something? I very appreciate signing your work, but if
there is no way for me (or anyone else) to verify it, there is no gain.)

Thanks
Uwe

--ed7x3rrm3oecwey2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlvPy4ACgkQj4D7WH0S
/k4GUwf/cN2KMOHwQlXBx5q3HyGl20R3D0ZA5lcodFAP7JPSuZLpaUAMcWqtI2Um
+RQ7fBlZd3QOmA8yJrJEo5cIY6BKELFVn3kmg1COT7FxfuVnNCCn7jMD946ods/m
JLBlWWGDyvxDJeTQD+qvRrV0Y/VrRTrfUCRv88S/TUgpUAojzQ23KpeXjlL/HWCg
j6KhzEPjIxCK/6CrfDD1Yp1KY4OiYofzRvIUbn6MPX4aomj0OYtltKs/8U/+2kxh
ijbc25GyCDCG6No+T8Q7qy+u5InV3Y1SIX9hIlkfQCdp8lKdwesS6AMPd4NFSjH7
qb3ni9RcUxP2B++oySqxJD96lrlyHg==
=w+Dz
-----END PGP SIGNATURE-----

--ed7x3rrm3oecwey2--


--===============4208126327731055047==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4208126327731055047==--

