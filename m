Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCEB5CCD19A
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Nov 2025 19:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QUKXUzr84ACo1RQK4skJaDZJ4qcrCPFz/j5EtDXp9iE=; b=MAB8W16YifWrB+egbrF9QLyW1m
	eSYT9X6sf9EWxq/RcyiXBWy15krTf0U5JIhjn4RXx1Cm5UGbmNxvt0HpnNbcRT3azI4tKw17KmvyS
	PW9jsSmKKE7ZETh5pOa6SRiGAj4hbsFbObS+P44ofmlDyaYbzZe6BGN0L0vMxpMZHJQRDjoFJz+g6
	0Dyo8ZUkdIq6tuSY6VeDlLa861ALQemN9hmdfenFPlCEDuUZ6fRVDJYsGw27zGnxiXlVH0O3ha/Qr
	1xlrVdC24wNxwM2RKgXTnhVy6q4QPR8us5zqO6TlBi5H7FKzqj9HH6Sle4gubcoxTT8dFSEuGxWfx
	ryIxsAag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKiZo-0000000F4PU-0M6M;
	Sun, 16 Nov 2025 19:38:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKiZm-0000000F4PM-1faB
	for linux-riscv@lists.infradead.org;
	Sun, 16 Nov 2025 19:38:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5FA0B60008;
	Sun, 16 Nov 2025 19:38:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75899C4CEF1;
	Sun, 16 Nov 2025 19:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763321896;
	bh=aDnvoRXp5jbZbWUaysTMKr6pXeOZrBDJ3a6yyM30XtY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sqe+lrK5Q9WvEDBSLJsJtqJeSCpe3kjuCAAp5J9RFxBhzL+oMhNzWTVGFVdnc42im
	 Mn5SR6lLOmZTuuSsmJ3EHWXz33qrELFXMAeKI6U3BRoi7sVU6Tk88PrxiGK3/G6IHM
	 1EPwZoO7VymlR1AMupWuiCoTccvgqZhup/2ez6+xxKAM4eqJbOwEJhE2YqBgRgnVE6
	 RYcrfAKRSHt/kxFKHQDDAZj5McYpD1ztzmUPulj8VEIePCrbldlGI0T2IXQMQor01c
	 pF7raNtTeapjVgRytFTEivajQU5+SKKWTR+s4Ws1vEtitpTPbyoEgyu5ayubPwKGeH
	 0rCZeEFUJqXJA==
Date: Sun, 16 Nov 2025 19:38:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Han Gao <rabenda.cn@gmail.com>,
	Jason Montleon <jmontleo@redhat.com>,
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v3] RISC-V: re-enable gcc + rust builds
Message-ID: <20251116-axis-pouch-419f794cb1cb@spud>
References: <20250914-gcc-rust-v3-v3-1-34d4d5864144@gmail.com>
 <73d55231-d1e5-400d-9446-1914a78c0db8@iscas.ac.cn>
 <0bc61e6e-8a27-4711-8ce0-60b1e300ac31@gmail.com>
MIME-Version: 1.0
In-Reply-To: <0bc61e6e-8a27-4711-8ce0-60b1e300ac31@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============5209462837213120899=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5209462837213120899==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cRVUOKC/OyDnbFeQ"
Content-Disposition: inline


--cRVUOKC/OyDnbFeQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 16, 2025 at 10:36:16PM +0800, Asuna wrote:
> Hi everyone. Sorry I was inactive on this patch for a while. I'm getting
> back into this work.
>=20
> On 9/19/25 1:20 PM, Vivian Wang wrote:
> > I think instead of testing libclang version, it would make more sense to
> > feature test if bindgen the binary supports these flags, like what we
> > already do with $(cc-option,...).
> >=20
> > Same for all the other version tests.
>=20
> Conor, since you've reviewed the v3 patch, do you think Vivian's suggesti=
on
> is a better solution? If so, I can start trying to make a v4 patch towards
> that path in the next few days.
>=20

I'm okay with either approach, just drop my tag if you decide to use her
suggestion, and I will re-review.

--cRVUOKC/OyDnbFeQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRooHAAKCRB4tDGHoIJi
0gg8AP0bFl/forsWFyM7j0VCxtaiprWS+FBSVkAkEe6urE/eZgEAjsKFyclbZ6NS
7a6Sk1T0L3FCy8UZIMOgsZfdiKOuvQY=
=/6Vf
-----END PGP SIGNATURE-----

--cRVUOKC/OyDnbFeQ--


--===============5209462837213120899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5209462837213120899==--

