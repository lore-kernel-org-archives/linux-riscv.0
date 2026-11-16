Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C4D5606A333
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 17:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hwIIHLAq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ToaMIdu/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=MYi71X8+RJPeWZ320tnOv47wvLvV4zhcqi1MVJ/m0xE=; b=hwIIHLAqUPuECnePbmtx+s4/ub
	FZjo9lscgmkZ+6ZAodIBp5DOdHcth50aKzvrEjvnNhyC6bT+5aHPEHS6Viij1Gr4vHLaKg42bL5h9
	bkQOkwGTVxaRP5JvwKhR1bo4NHBNFnaM5CyyhXc7QpYtKJOd9yNfIFF0oVU8M9zopGoieKUYn82AU
	YVcDFW7SpEJFAi71KNwq1Hg2bqMAgkjJPaqRPnP6Z0zjytBkUheWkQHCikMJyBcXTY+kSpgaf0bC8
	LgUV0OARgsS60xKchjbDtaQWB3Q21UCKlIvcgdq3DZ8ifWeA5qLr3aIr8wMHhiBjvbW3l0nxOCGp7
	iSRwkb0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0IC-00000003NNR-3Ill;
	Mon, 16 Nov 2026 17:14:56 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT0IB-00000003NN0-0qhA
	for linux-riscv@lists.infradead.org;
	Mon, 16 Nov 2026 17:14:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EC4EF43DBB;
	Mon, 16 Nov 2026 17:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADB661F000C4;
	Mon, 16 Nov 2026 17:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794849294;
	bh=R3AayEltuaPaSc8ERAQfW5YeyfzxTpEYZhzgv4GQkHY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ToaMIdu/5Nw6gYTd8dKnI+IbBbxNZgnb4fzduNfFHN9sWkkaCbz70GToCW+nEDm4Z
	 9uF7aB4TmCTaZug50b7ulcfEcxnEmVk2y6hiNSjA7jeGkGkT/ShZXqpwy4hLr9/aj2
	 6NNvcIDIQJyhn921LolKVZXRXN1h4Ga0LhQtINeSDy8hIqBMGS+mkousnN6WdK46gS
	 HsC7Ssh/0Iajvpgfbo3BwuIO222ho/1CZeWVo1XVKShBg67CwppzE5LJyhKkteezT9
	 hDnjr1Y0MiqO1CP017SxVisOiKTO0ep8ghfKbj8w4YBnPbOdKVd/ClnQqPqoHRyDb7
	 tFmEJTYAzrZ/Q==
Date: Mon, 16 Nov 2026 17:14:42 +0000
From: Conor Dooley <conor@kernel.org>
To: Vladimir Kondratiev <Vladimir.Kondratiev@mobileye.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>, Gary Guo <gary@garyguo.net>,
	Yury Norov <yury.norov@gmail.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Chao-ying Fu <chao-ying.fu@globalfoundries.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	torvalds@linux-foundation.org, olof@lixom.net,
	aleksa.paunovic@htecgroup.com, arikalo@gmail.com,
	Boqun Feng <boqun@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Ihor Solodrai <ihor.solodrai@linux.dev>,
	Luke Nelson <luke.r.nels@gmail.com>, Xi Wang <xi.wang@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Pu Lehui <pulehui@huawei.com>, Puranjay Mohan <puranjay@kernel.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Charlie Jenkins <thecharlesjenkins@gmail.com>,
	Nam Cao <namcao@linutronix.de>, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v6 2/6] riscv: build kernel atomics from LR/SC when Zaamo
 is disabled
Message-ID: <20261116-manifesto-edginess-7f1663f9a76b@spud>
References: <20261110-lrsc-only-v6-0-bafc3cc0fcae@mobileye.com>
 <20261110-lrsc-only-v6-2-bafc3cc0fcae@mobileye.com>
 <20261110-revivable-saint-9bcfaa2fd0e7@spud>
 <3308062b-9d0f-436f-a22a-217cc1c59aed@mobileye.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <3308062b-9d0f-436f-a22a-217cc1c59aed@mobileye.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1082225012038408562=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1082225012038408562==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Y+J9n/Hla/zwW0HU"
Content-Disposition: inline

--Y+J9n/Hla/zwW0HU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 11, 2026 at 08:37:23AM +0200, Vladimir Kondratiev wrote:
> On 11/10/26 21:02, Conor Dooley wrote:
> > I had a quick glance at this revision, and I think you've at least tried
> > to resolve the things I was pointing out. Did I miss something, or why
> > have you kept the NAK after having resolved the things that I was
> > objecting to?
>=20
> I'll be happy to remove it. Was not feeling right to do this without
> your permission.

IMO, if you sort out what the NAK was complaining about, you can drop it
without permission. Worth calling out in the cover maybe.

I'll take another look at this later in the week..

--Y+J9n/Hla/zwW0HU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavs5/gAKCRB4tDGHoIJi
0kGoAQCWFf5JHxUi2KeNm9DOhemQnYUrlSxe7T4A8/hbZExUSQEA9loerGhdWm8V
n/SfaKiJfp1FHsN6OT9U8lG0cS4ZPwA=
=yrBS
-----END PGP SIGNATURE-----

--Y+J9n/Hla/zwW0HU--


--===============1082225012038408562==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1082225012038408562==--

