Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256F0CA1002
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Sep 2025 23:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xz+Si38hwajGqDkpYGJXueU+2rVz0IIRqCbkoXK/GtQ=; b=XuseV17p+8lluf+AGnkN9kqTKD
	rICHM6jOeh8N6mwngBBwDp3kYYzJPB2VEfMwSZLFq66wTGEtT2qKg6wlxYW78aGcXxc8hhYA4NtO/
	82dCxhPheqMbZLEz5RyIDdLkAlvcs5c9g+46IyiuVlrgIXMCya0lpP0WhhhU2GWTEdBT/lPXUJgFr
	YAFqNjKZwp65h2NKg7CT5/KSxQX2r2G7djJpzQPnmlMZKTJr0gxFJjn1wS0N7eS1iCs27XmzbmiAN
	w4iEoHnWe9zFJa2OPqWSaXFFqqCcBYhuPzIg7ht5a9RX/xa9eX0t1fIvyTTjDcLPss44EeqhJANSQ
	J+U2Yd1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utDn5-0000000EHw5-2Z4Z;
	Mon, 01 Sep 2025 23:18:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ut8t1-0000000DWQs-2ZAz
	for linux-riscv@lists.infradead.org;
	Mon, 01 Sep 2025 18:04:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9D6C660008;
	Mon,  1 Sep 2025 18:04:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D458BC4CEF0;
	Mon,  1 Sep 2025 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756749850;
	bh=zwinHe94I7iecJbYreV9AeCekiR8vSs0p/EGqzcbmSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=W8vBZal7hXzzlZUAWTMkKxHucjp2VdjAU+JtfizvGhtZGZFphi7ziCNUwK4f/Xwcr
	 votHbQnovjd3W5nZyFZSa11jbxO1TWSILI7+Wg0X132JpN8beB/UG6RoGHbEJdR+ay
	 pNax/0uPNDbV9Bb0kDP+gy6It3z583Z80+XnQO0pOlDQ3dqRsFC3xhyzh0wXc/0pnh
	 RnqEqPYR5LG3JV0961Y3xmkCEkgKxvVHFxr8XwLFI+zPXkRBcycLEmb7PVmkvU9/Q1
	 CaXyG+ZbxEZY+OskNmXge1r/IZnGmZQKWdtIfJNhoz4H2MFukovLQ203QXTu5vZePs
	 mPqM4a930966g==
Date: Mon, 1 Sep 2025 19:04:04 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Jason Montleon <jmontleo@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: RISC-V: Re-enable GCC+Rust builds
Message-ID: <20250901-unseemly-blimp-a74e3c77e780@spud>
References: <68496eed-b5a4-4739-8d84-dcc428a08e20@gmail.com>
 <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250901-lasso-kabob-de32b8fcede8@spud>
 <b1734c45-42ec-46c7-9d4c-2677044aacab@gmail.com>
MIME-Version: 1.0
In-Reply-To: <b1734c45-42ec-46c7-9d4c-2677044aacab@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============1292557205266438722=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1292557205266438722==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AkOtiGMp+3MnnVkq"
Content-Disposition: inline


--AkOtiGMp+3MnnVkq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 02, 2025 at 01:19:42AM +0800, Asuna wrote:
> > For example, there's a check in the riscv Kconfig menu to see if
> > stack-protector-guard=3Dtls can be used via a cc-option check. If that
> > check passes with gcc as the compiler that option will be passed to the
> > rust side of the build, where llvm might not support it.
> If I understand correctly, the `-mstack-protector-guard` option is already
> always filtered out by `bindgen_skip_c_flags` in `rust/Makefile`, regardl=
ess
> of architecture. Therefore, we don't need to do anything more, right?

That particular one might be a problem not because of
-mstack-protector-guard itself, but rather three options get added at
once:
	$(eval KBUILD_CFLAGS +=3D -mstack-protector-guard=3Dtls		  \
				-mstack-protector-guard-reg=3Dtp		  \
				-mstack-protector-guard-offset=3D$(shell	  \
			awk '{if ($$2 =3D=3D "TSK_STACK_CANARY") print $$3;}' \
				$(objtree)/include/generated/asm-offsets.h))
and the other ones might be responsible for the error.
Similarly, something like -Wno-unterminated-string-initialization could
cause a problem if gcc supports it but not libclang.

I was doing some debugging today of another problem, and was able to
trigger both of those errors with llvm-21 and libclang-19, so they
definitely have the potential to be problems if there's a mismatch - I
just don't know how many of those issues affect a mixed build with rustc
and the gnu tools, mixing llvm and libclang versions already produces
a warning about it being a Bad IdeaTM (a warning that I think should be
an error).

> > Similarly, turning on an extension like Zacas via a cc-option check
> > could pass for gcc but not be usable when passed to the rust side,
> > causing errors.
> That makes sense. I might need to check the version of libclang for each
> extension that passes the cc-option check for GCC to ensure it supports
> them.
>=20
> > These sorts of things should be prevented via Kconfig, not show up as
> > confusing build errors.
> I'm working on a patch, and intend to output an error message in
> `arch/riscv/Makefile` then exit 1 when detecting an incompatible
> gcc+libclang mix in use.

I think you're mostly better off catching that sort of thing in Kconfig,
where possible and just make incompatible mixes invalid. What's actually
incompatible is likely going to depend heavily on what options are
enabled.

--AkOtiGMp+3MnnVkq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLXgFAAKCRB4tDGHoIJi
0vCjAP9XpUu0gZJFGClhFW08NaPGYzrYfD/xehn63LD+qZ9tGAD+MdqLLUS+oZBD
s1T033qGogkbVo+ABtc/Vm35qcP+EQ4=
=IQ1t
-----END PGP SIGNATURE-----

--AkOtiGMp+3MnnVkq--


--===============1292557205266438722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1292557205266438722==--

