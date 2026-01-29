Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3D1D358E4
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Jan 2026 09:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wztWEvzQ1D/+kDePgi49PftwZIkpdjznUoTScZLca50=; b=Rzr1pdUImwZkw8d8fcUE0NGvlJ
	D3VvUfh/DHloMoT7zTLWT2P7jQhh0SdGdMs3fEU+Void5iOWgCHO4hCUMOraMVx8ulFPzvbFBiVRb
	PNe7cvZZWrgUtLomh0xm/lKdCWKsbu7IRw5Q8jpotTQTji+fzLj8qYWe2o71mhHbhdzQXcB+G2rNL
	PEsc0sWxeXjl9cxP0u8CthPUSYussng+tZBuJoFdkwZ3hwo/dSLSIYIIvHCr6dNCHZl/utvXKvRsb
	VLTnrawJ2cNvy4J/cedXv45XHwO1HJoM/emLZr1NNIjiUNZBXBVazzuRgzcj/rCMGANHOOzXjmGp5
	GUuVna8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOLw-0000000HW4B-14Ll;
	Thu, 29 Jan 2026 09:30:16 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlOLt-0000000HW3l-15MK
	for linux-riscv@lists.infradead.org;
	Thu, 29 Jan 2026 09:30:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7B1D84427F;
	Thu, 29 Jan 2026 09:30:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAAAC4CEF7;
	Thu, 29 Jan 2026 09:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769679012;
	bh=xemk5R9c0XBMFkfsqFG6Q4L/gjGhsjDRn0zzEzSMa90=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nUwz+LnHgUcVFtoo0b2HEzsOSMgcxbMhQzc+/zvvZEIA85eNlDA4e/1bXcoUFnZ3L
	 EAC83mru8G+SExtGFKPL8i0BEtAmxq1bUCjxFtAC74PaXqEyapWu4bl2B/AKkEQec4
	 FFbWv5qEOEUJcyXLs07Tf+iFdievMNhdXex2Cj5csKLTAAsrHwEtSTq0tUA/UwZzX+
	 zY62haKBZPe/WuXWy942+xg7Fn6N8daAdJKismKdiN/EnPC03ZjsKDzBSDJCTOZhdl
	 +ykBscp+UdHi9Hg/v4g9ciPjzXsrr4saxJiSNwSg8cMmUb+UIp21fvarqR6s/qylfV
	 Wkppu5eOrXNlg==
Date: Thu, 29 Jan 2026 09:30:04 +0000
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Asuna Yang <xinrui.riscv@isrc.iscas.ac.cn>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Jonathan Corbet <corbet@lwn.net>, Mingcong Bai <jeffbai@aosc.io>,
	Han Gao <rabenda.cn@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jason Montleon <jmontleo@redhat.com>, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 0/4] RISC-V: re-enable gcc + rust builds
Message-ID: <20260129-removed-audacity-398bc9363728@spud>
References: <20251230-gcc-rust-v5-v6-0-2ac86ba728c8@isrc.iscas.ac.cn>
 <1b0943c4-b1c5-460a-8944-c8d9c868b085@isrc.iscas.ac.cn>
 <47d1dab9-a379-7b3a-d06c-03d674cfbb76@kernel.org>
MIME-Version: 1.0
In-Reply-To: <47d1dab9-a379-7b3a-d06c-03d674cfbb76@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_013013_364923_720A128B 
X-CRM114-Status: GOOD (  19.80  )
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
Content-Type: multipart/mixed; boundary="===============3539161329207793115=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3539161329207793115==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QKMJgd/nBci7YAcW"
Content-Disposition: inline


--QKMJgd/nBci7YAcW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 24, 2026 at 12:47:26AM -0700, Paul Walmsley wrote:
> Hi Asuna,
>=20
> On Thu, 22 Jan 2026, Asuna Yang wrote:
>=20
> > Gently ping. I think this patch is ready for review. Is there anything =
else I
> > need to do before merging?
>=20
> I guess this should probably go in via the arch/riscv tree?  If you agree=
,=20
> then from a maintenance point of view, it would be good to get some acks=
=20
> for the first and third patches from the relevant maintainers.

Not a rust maintainer of course, but from a "I was involved in this and
haven't replied in a while to the versions" point of view:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

I've just not had the time to test this and so I've been putting off
replying, but the idea is what I wanted to have done and I appreciate
the work done on it by Asuna, so I'm acking it now rather than stalling
until I can test and give an r-b. It's the right thing to do for a !gcc
point of view too in my opinion, even if the possible issues are
unlikely to manifest.

Cheers,
Conor.

--QKMJgd/nBci7YAcW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaXsonAAKCRB4tDGHoIJi
0kF2AP93HfQl4GXLKv+F+l7CHk71pVcDlMAwzxs2+idjHHx6dgD+L2F5hZImjg6F
g44c/V/wgIz/uLfWhDq4WhEI0ZuJMAQ=
=BvJH
-----END PGP SIGNATURE-----

--QKMJgd/nBci7YAcW--


--===============3539161329207793115==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3539161329207793115==--

