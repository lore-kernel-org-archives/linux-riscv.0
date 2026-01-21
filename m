Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4765EC44503
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jan 2026 11:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL/inknrG4CYV0hguJGgBDlKbw3+rkobt4F+JXU9OT8=; b=oufwU2+Ii7zIZGZGDLqUc3I6oU
	OUosJTwOTCFrF2O7TL5IR7rqHzmQHLq30BE+CYx1kLrdfW1xMrbKcbYrPRGaqsJgj9kW63gX3gOV6
	8bK0ip5rShhc3GGJR5l8yvuMc/HQHm2V1GWRU9cuhpR/1DRvi1e2cS6gNTy1h77zhcKX9GDcWOPNq
	ssBYiMjKIfnEBOR4njmkAHaUNPW0zC+yNrDvPlSVIomA1SZbOK+Pc1wciTJ0X0v7+9mgCQuOiaucy
	ntICDlOa2QmFSJHw3YHWtbmH4JTMZf9mbGkRVq6zTBNvUqGOgU50ygz548CUxNoBYAh95byDXl9nC
	wtNLXgew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW2E-00000005KT1-1fuN;
	Wed, 21 Jan 2026 11:06:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viW2B-00000005KSB-2Juy
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jan 2026 11:06:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7834344160;
	Wed, 21 Jan 2026 11:05:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1613C116D0;
	Wed, 21 Jan 2026 11:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768993558;
	bh=OSBeBnGHkX8xyHUtAxcxKCNGZMo/j2CMejwl6KhZ23w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HtaVkvCUkTJnXsfAIybqc+b/a3zDn4yIkCyeK9ytM0M8Tg0vTUCSFP0EkDHoVy/7/
	 Hm5v8hDwkb3XkdYa4WpG+SCkOtBPiSuqG+1VAlfRLWESP8hWSOSt8FidC3JdxahHRU
	 yzXeP0ixTB44o4Hm0hjBwdiblq98fBl5aIVjdnMJtqPpaFEJBZawJnxfgdLxLXzt8w
	 oPYB2Zah2d7JszhNGOx2ognrzb7m90iMMa/2nBvcPFtTizAH9AIEiBVHsx+lkDcitF
	 PuB6sCPoMoUTyHtjRHvZB6lL8DIJW9Nv3rAruqI8zdHw4PM/fSOY7/Ah8WSw+QuZcE
	 4inyE8zHQfnbw==
Date: Wed, 21 Jan 2026 12:05:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Fu Wei <wefu@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Michal Wilczynski <m.wilczynski@samsung.com>
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
Message-ID: <jmdkabxocbq7grui7qvepuymmrygmfps3pcb65wxflnbo75whc@dtvypglu7o4m>
References: <20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.com>
 <o4uvwymm73wnehs5zb7lqgv3mjv235jpprfqrsb6oxscxhmmjh@25u7wrb7yo2i>
 <CAJ-ks9=USrGECVS1qMqs+iCKUqvOdfcjA6phAjaF0wfcTkQt_g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJ-ks9=USrGECVS1qMqs+iCKUqvOdfcjA6phAjaF0wfcTkQt_g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_030559_629659_086266B2 
X-CRM114-Status: GOOD (  19.79  )
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
Content-Type: multipart/mixed; boundary="===============3825179490095838073=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3825179490095838073==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gkkdphhfqabbpivp"
Content-Disposition: inline


--gkkdphhfqabbpivp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drivers: pwm: replace `kernel::c_str!` with C-Strings
MIME-Version: 1.0

On Tue, Jan 20, 2026 at 11:15:56AM -0500, Tamir Duberstein wrote:
> On Tue, Jan 20, 2026 at 3:39=E2=80=AFAM Uwe Kleine-K=C3=B6nig <ukleinek@k=
ernel.org> wrote:
> > (Side note, b4 told me:
> >
> >           =E2=9C=97 No key: openssh/tamird@gmail.com
> >
> > . It's not clear to me how to verify this signature. My experiments
> > include:
> >
> >         $ b4 kr --show-keys 20251222-cstr-pwm-v1-1-e8916d976f8d@gmail.c=
om
> >         ---
> >         No keys found in the thread.
> >
> > and looking at
> > https://lore.kernel.org/linux-pwm/20251222-cstr-pwm-v1-1-e8916d976f8d@g=
mail.com/raw
> > where I see
> >
> >         X-Developer-Key: i=3Dtamird@gmail.com; a=3Dopenssh; fpr=3DSHA25=
6:264rPmnnrb+ERkS7DDS3tuwqcJss/zevJRzoylqMsbc
> >
> > which IIUC isn't enough to verify the next mail signed with the same
> > key. Am I missing something? I very appreciate signing your work, but if
> > there is no way for me (or anyone else) to verify it, there is no gain.)
>=20
> Yep, you are right to call this out. My usual setup uses SSH keys for
> commit signing, which are not part of the kernel web of trust. I
> promise to start signing kernel work with my GPG key soon :)

While I notice that the trend goes to using ssh-keys, I still prefer
OpenPGP. So +1 on your plan.
=20
> In the meantime if you trust Github you can verify my signature
> against https://github.com/tamird.keys.

OK, for the record:

	$ curl --create-dirs -o ~/.local/share/b4/keyring/openssh/gmail.com/tamird=
/default https://github.com/tamird.keys

makes `b4 am
CAJ-ks9=3DUSrGECVS1qMqs+iCKUqvOdfcjA6phAjaF0wfcTkQt_g@mail.gmail.com`
emit:

	  =E2=9C=93 Signed: openssh/tamird@gmail.com (From: tamird@kernel.org)

This looks a bit strange (because there is gmail and kernel.org), but
better than before.

Best regards
Uwe

--gkkdphhfqabbpivp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmlwsxEACgkQj4D7WH0S
/k6vvwf9E8mLZeboBuVh8CdCIfb5AMi5+tIcVmJ5hPOx4Tr+sZI9ATfYiWXV75oI
UGyBCcZm2n05j1KHBmZpKANCtBTPxFIRW/H5nViualdUjNSTUerWw7s5SK3NcQTt
JSEGjjTK4/JpX0kTO4dUGs57xkegcr300fp4nAJqUdaJx+QhlWw3uIl5GbabrAYs
120Zd3xFlPjIh2TksByMeh1R55sRhv6vQi/r5Isen7CYqMK7pFS2h5DLZvSibldm
JscOK/sTW2ZcV0o6v/ElFRH4noxet9qskBNhoUfrZurdXGwjHnzrgnBXt2oruaTU
OSGhDhKnShDIu6kc1t05ZH8agT9JSw==
=L/eL
-----END PGP SIGNATURE-----

--gkkdphhfqabbpivp--


--===============3825179490095838073==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3825179490095838073==--

