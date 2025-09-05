Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 129ABCA1017
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 19:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NolQk/MxfeKgM9/9nOJoH3FSE0tISf5JNVp9sBeY8nI=; b=fhDRsSMCWK4z+xKrhW0RlRo/vn
	NpYovyjCgiPtgLoBOuMGlsC7swCRzpHyUie/BEXP6MHtaQg7qZpK3NulGOAnvTYVmP8LlyJukeAna
	4CZzj1E5/pxtp3p+92oyOuMJ0aNJs/rP4IePlpKsWPzIind3ZeKekgCAf3ciR/dvwzavBpLzANcA5
	X+bi9xjJS5Y2tt2PWUx3tvU82SHv1CF4KT+Lm52x9zjChBHqKtGTLmgE5IjTWaNkgMrEVXC5b3Dk7
	c0ATCWKvDO3MQ8mR+DyCHqSmeM+ybV7ApwTysYEUNllYx31e5oe5gOyeJTEgqeF0NRppdt0hBSeV+
	3+/qIGKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuc84-000000049gw-1Fgy;
	Fri, 05 Sep 2025 19:29:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuYKE-00000002kOE-3j6T
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 15:26:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5370760144;
	Fri,  5 Sep 2025 15:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95369C4CEF1;
	Fri,  5 Sep 2025 15:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757085966;
	bh=HeSmTEkMZa5aYj4W+/yA7FOCufTHzp4QQTSxsuJZE1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5coExKt3JFlpn19Eh/CX6P8SbVNODKaVutXfs0yU0xu8ok2KvaAAHxVRuNAXmY9m
	 JdcAnimbzcKMzcu4NXIiz6SWsyshIqac2oE3lqMNq926ekkR18m/uo1RT5N4p6R7gQ
	 IHAcu1cJOOuZo3jvJNVyATQQ3gTPH6adbIme1r5T+V41ffhmCLO4WJBazIptDQrQwN
	 jKZQjNVz7i/nXi441Yln43I1FQZCBovg+l8Yq9GNZ/mE+l9Z/kGIdM0xk2KwtV4I0s
	 6rBixDmc1FaR9+rcesjmSIPl9wh2/B4MDhjTZkpyySVoHhrwY7/LwDbnffAz/SaayM
	 /4o4yimnhYZbw==
Date: Fri, 5 Sep 2025 16:25:56 +0100
From: Conor Dooley <conor@kernel.org>
To: Asuna <spriteovo@gmail.com>
Cc: Jason Montleon <jmontleo@redhat.com>, Han Gao <rabenda.cn@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Tejun Heo <tj@kernel.org>,
	Kees Cook <kees@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Matthew Maurer <mmaurer@google.com>, Jeff Xu <jeffxu@chromium.org>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Jan Hendrik Farr <kernel@jfarr.cc>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Christian Brauner <brauner@kernel.org>,
	Brian Gerst <brgerst@gmail.com>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH 2/2] RISC-V: re-enable gcc + rust builds
Message-ID: <20250905-domain-theater-214254632b87@spud>
References: <20250830-cheesy-prone-ee5fae406c22@spud>
 <20250903190806.2604757-1-SpriteOvO@gmail.com>
 <20250903190806.2604757-2-SpriteOvO@gmail.com>
 <20250904-sterilize-swagger-c7999b124e83@spud>
 <f7434b76-49d0-4ef3-8c77-c1642dc211cd@gmail.com>
 <1b95b2f0-e916-4a86-a274-da2ff7f9d516@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1b95b2f0-e916-4a86-a274-da2ff7f9d516@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6082842673753215150=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6082842673753215150==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+82/AboaHQrENvzx"
Content-Disposition: inline


--+82/AboaHQrENvzx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Sep 05, 2025 at 07:07:20AM +0800, Asuna wrote:
> CC rust-for-linux list, I missed it in copying from get_maintainer.pl, the
> thread is a bit of a mess now :(

If you're doing that, keep the whole message in the mail. Think I just
perpetuated the problem by replying to the mail a body rather than the
one with the amended CC list.

--+82/AboaHQrENvzx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaLsBBAAKCRB4tDGHoIJi
0vPPAP0WJW3cfKzXqItvB2XzxRMkipRGuzMESsAFO02Trs2WgwD+KeERdtt4LZdp
OrpmtNGQfWOFHR1lVYnmonUUL88WawI=
=lC0v
-----END PGP SIGNATURE-----

--+82/AboaHQrENvzx--


--===============6082842673753215150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6082842673753215150==--

