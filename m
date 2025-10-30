Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8ECCCF9E3
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tik732McI4Zf022cotxQOX7PxVzOTzwSZFTeVORyHps=; b=WRwP/4tnxXftkHpWc7ZgY2fHWg
	14DprJ7ZNCpoywLcaFUeBMtArBrZbETwLkw2235nNxJZoYfniMKLf1GCyG8xTpvWeWwj7PS5C86+K
	lHV1xb4mpjbbYXwELI9UdTS2RxfJMJqDD8ipe61Jv5AZgm7Qf6b61qQUXE7O9FMEDrskUcclnfNdQ
	DlmUpBA2djBqgR71Okt5+jp275rOTa80snsvpsYUhEYjC7McLTqckFOiPmAhy/zgC4oaVFaoRcItU
	cZ/hwLAPCsF9vKo/itFusvpJ4ibAFAvpmApKmzeSz7NTZwdfwyvfNtv8UrcmdyQ403vQkHLRPMa1l
	Sdz2PzNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEalj-000000052QD-0kEe;
	Thu, 30 Oct 2025 22:05:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEalf-000000052Ou-3nSk
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 22:05:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0434A602D4;
	Thu, 30 Oct 2025 22:05:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E70C4CEF1;
	Thu, 30 Oct 2025 22:05:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761861914;
	bh=hGsR/Bnd3mOKXtUfbzp7EAHPu03Q3W/5Ygz618c3ElQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TUZwFQ8jSNkVT08Pf3tnwI4rsFxKGf4Wk73qhas/2kGpPCwR4PV537euKdBKNQt5U
	 sCEcPMUSO/cFUTM1TvhEEn7ETkgXLe3533+YdOqyjbrhrYKzE7bIDINzV9ouZz0Ttp
	 Ekn5v5e0W87uIAzS5K0Iw9xIhDs9jpY6ouvPjHgQ7EFy6ijOgYq2AK2iXv3IJFamlK
	 AUHmr5EUSmEWfJgkd7ey0N5UA0bmSADl8JU7jgnAlgDq2jNDrN9fle5bRQkNE6AKZy
	 wc1NrPDhCToOXWWgJ8k3/s6SiuFKpIEqi4vIcqqUJY4vTmGhu1os12+45Sozoecu3M
	 8kTBDoSc0O88A==
Date: Thu, 30 Oct 2025 23:05:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Stephen Rothwell <sfr@canb.auug.org.au>, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] pwm: th1520: Fix clippy warning for redundant struct
 field init
Message-ID: <ch7ys43hapks5pmbnr4tq5ygycngy4oncsecaefarxjuucpvue@qtofn5rzq46m>
References: <20251028-pwm_fixes-v1-0-25a532d31998@samsung.com>
 <CGME20251028122318eucas1p1863a8b44efe27c28a1bcf427d2855c00@eucas1p1.samsung.com>
 <20251028-pwm_fixes-v1-4-25a532d31998@samsung.com>
MIME-Version: 1.0
In-Reply-To: <20251028-pwm_fixes-v1-4-25a532d31998@samsung.com>
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
Content-Type: multipart/mixed; boundary="===============1643109298348369700=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1643109298348369700==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6lyb3gh27aqsig22"
Content-Disposition: inline


--6lyb3gh27aqsig22
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/4] pwm: th1520: Fix clippy warning for redundant struct
 field init
MIME-Version: 1.0

Hello,

On Tue, Oct 28, 2025 at 01:22:35PM +0100, Michal Wilczynski wrote:
> Clippy warns about redundant struct field initialization when the field
> name and the variable name are the same (e.g., `status: status`).
>=20
> No functional change.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

applied this patch only (for now) to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next
=2E

Best regards
Uwe

--6lyb3gh27aqsig22
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmkD4REACgkQj4D7WH0S
/k6vXwf/XwD/aC75mmgEhgwLegHCDLc8YAWadtXPwkYBVbyfpIVTujQtNNa6IbNc
TBTyepfIq1hGhoF3xnQg8+E6QsNsUsNeFb6DPVQ0/P59IiazUtvJ7MEyH1BPa2HI
9bwa7hPqViVIhZK/GALE1F8Ivf2xMGBRFJuSw2sjb8lYd6YTh5xWgVn+PUJ91iGT
OecPfhHged4zRochSwnc4mQ4IdMHg30dDAy1iYFeXYJrQcSVDKhZcThSfnq22OAg
w1kdhMBkqxkY+FDIUb6Fl+Tmkb9VlQrJ5Q2jACq10bSlWidKluZ6eUbPV76MkNV+
DklMBwxJMyiE3IkckG9X+wpR8Fxp0A==
=Lof5
-----END PGP SIGNATURE-----

--6lyb3gh27aqsig22--


--===============1643109298348369700==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1643109298348369700==--

