Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9A0606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 05:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=IsHqmrAD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=PjDJYkQB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUrAZwg8x5XpFPFQozrXJO/h4q+7CZTgIj9sW3hA1qo=; b=IsHqmrADVXvSwGNE+ePd0T1bN2
	aNOe5ArCpT5W8KlEYOmTwhyv08/G59EmapPycvkDPsMaxgURG2nrL5zH2RqHrN+dIk613wQvXxJpM
	TQ8ngrneZITTTRit1iAPg9km9Ti8967D6vhTnJqtw9ZW6yGBSjBMD+T7JFZ/8yjZ6fCTGL3MHycV4
	hhV0wCQd/AyvnUGbeCljYr5spXsSILt5Ewx0PutYka7feu4SvCecqNcesYkqGuqWFIQYUDTdca0px
	RwSULWFJBf+JmuB/lQhZhDdXW7abnNJvYdoZ2F7ujJWebGO/0rcbEpAULyCI0Q2i+BdioALaQvqvV
	kwOn09kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPFM-0000000B7Kc-1Mwp;
	Wed, 21 Oct 2026 05:52:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJPFL-0000000B7KV-00UQ
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 05:52:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 6E1AD43C51;
	Wed, 21 Oct 2026 05:52:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id BA0201F000CA;
	Wed, 21 Oct 2026 05:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792561938;
	bh=5OeiZ8L6d4vX+l8Io/5jcUBoP3Wnj3/+D42Y2ecgSAM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PjDJYkQBPUKVWb6J82o69/SAzYF2+ziRUPPW3POgQFvjioitwO2sCNuAsp5I9D1X2
	 EPNvo/oUi+q3pWcm92Q4WFIlhSVXTGB9EgoGq/xT/q6hNi7BbcEXlrikyxZUKbDQlQ
	 iPNk0PH6nLGijisS/cWVSozRC2uZt9s9qAnMblmQR094fsfUcdsk5eAGN6xEQ99uN5
	 oUBI/rFKIZgVUDy3qloqeiNtD8bukaE1CxL/tH/j2A2HjkIIRh+Rh8Ew3rDEXuQpta
	 THjL3WpqTkPaovJeHVIZoEQVzdeCsYw91mg1du+5uYGaXnAmBCsxtO8RzCtZIb53ZA
	 3GX3b/hHKOjFg==
Date: Wed, 21 Oct 2026 07:52:15 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Maurice Hieronymus <mhi@mailbox.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Brian Masney <bmasney@redhat.com>, linux-clk@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org
Subject: Re: [PATCH v4 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
Message-ID: <athSw4qQ0k76HCGB@monoceros>
References: <20260711-rate-exclusive-get-th1520-v4-0-8244a0666a71@mailbox.org>
 <atdlfNRiza3gA1iD@monoceros>
 <8625DA25-1F59-4175-81A6-BAA16C961557@collabora.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <8625DA25-1F59-4175-81A6-BAA16C961557@collabora.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6560901213665907204=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--===============6560901213665907204==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d5taxqcx64zj5tfv"
Content-Disposition: inline


--d5taxqcx64zj5tfv
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v4 0/2] rust: clk: Add ExclusiveClk and use it in
 pwm-th1520
MIME-Version: 1.0

Hello Daniel,

On Tue, Oct 20, 2026 at 10:03:47AM -0300, Daniel Almeida wrote:
> > On 20 Oct 2026, at 09:59, Uwe Kleine-K=F6nig <ukleinek@kernel.org> wrot=
e:
> > I didn't track these dependencies, but the change looks fine for me. Who
> > is supposed to merge it? I can take it via pwm, but I guess a rust tree
> > is more appropriate?!
>=20
> Please no,
>=20
> See [0] instead, which also includes a newer version of this patch.

OK, discarded the original thread from the pwm patchwork. Thanks for the
hint.

Best regards
Uwe

--d5taxqcx64zj5tfv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrYUvEACgkQj4D7WH0S
/k5BPwf+Mub/CREsHBzcLJx7ot56RM02mFrhVHCqQ2zYrWrPQF5W/p2XGfJBgK4u
p2Z0UzftLcSU83u3FxMDwlkpZQvboFMcfVuV4bsMLavUcogQiz3N9yJ5TfOwUjzQ
xHL/mmYVCs8FUsPPIX/VMMwB7Y6E+Is8D3GCZ717rMwH9DpBKUqDy3XIvLVxyzZ0
KzvbWzYUNHuYsQlWq04o+GVOBMUe2V2qxXfldRjtflP1aN+uepE7rqfOyWaCAfY9
mJm4X7e8MCyFwSRCbtP+2LI4v8MgSP90UW5SXVezn2lpd6Rmp5LtRkqm4Atgcv41
HYJMY8t2pkKYmVOlfH4CSUG7oJm/YA==
=x355
-----END PGP SIGNATURE-----

--d5taxqcx64zj5tfv--


--===============6560901213665907204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6560901213665907204==--

