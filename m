Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E85C2A073
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jan 2026 06:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j+yv5z8kfy69sChq2/NMIWr6KtibDKTPE+Jbj3TZFlM=; b=v8dVscEfdNd3xq
	2SdaemMydlwai96bzmine/C0WR6w/L9CGsqrkAvJ22E/YtunrbmjgRluK6FQQJQdM+Qv/WQGvGDqq
	QSEUmIVWuDNC1YZpCWJYDPU2ndjGbCOWAmPm6LMR+SbQK2jp+E3TP1eWCtzQhixcuZDz5MMYnmJiM
	rLb0iA5B7ml859ywGKiKkctIxUeoyIIKHRzL7xlWc8iLUxv1itJ4vYeY02RolsjYeoeZjyuai9n6E
	ES3+PGIaYN+matdXzpfPvhF1B/0fMQy72M3hC89Jj5gGyF590cSxob95npDGE+7U/AMg/DiOQx2+u
	yxr063xZ8GgDDZTI1OeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd11b-0000000CU9n-1TJ9;
	Tue, 06 Jan 2026 06:58:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd11Z-0000000CU9N-2tYB;
	Tue, 06 Jan 2026 06:58:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BDCEF6011E;
	Tue,  6 Jan 2026 06:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076F4C116C6;
	Tue,  6 Jan 2026 06:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767682716;
	bh=QQtOk2YRE84AoYQ+kSLZyLAyg4ikVDFr3IES1pY5ozA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gH/mbhwWcmbSviWB2aCXqeJKPYzexAoK01Yg6s6cLwpp5mznoR4J9YtzBX0+JaB2Q
	 RGzl1CWYt5ctBprLFLGJSvPejfop4znvHRnWwqgqpJHcHC0j9ob/Np83XrO9+Cl3TX
	 VS8m3uLgzCzbvtCwipbPzokR0Dek9Wxm/0Ippytis8vLZ/I6x2I70gfKMwQbmEhFro
	 NAdguE5T18zqwp0QS2kDwlBde/OWsN6qjyPmGKZIp7wCv7/K32g7gRemPHItu6WY9g
	 OF83QkAKrc+JLLzKj3XjbpThHQLvD4g3n1HMYbOp1iZmU15u/EOi4JVaYquL+5oCoh
	 XLNrjl71mrNfw==
Date: Mon, 5 Jan 2026 22:58:17 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Jason@zx2c4.com,
	ardb@kernel.org, dengler@linux.ibm.com, freude@linux.ibm.com,
	herbert@gondor.apana.org.au, linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH 19/36] Bluetooth: SMP: Use new AES library API
Message-ID: <20260106065817.GB2630@sol>
References: <20260105051311.1607207-20-ebiggers@kernel.org>
 <859377de-cb72-4e87-8ee5-97f8c58a5720@citrix.com>
 <20260105190503.53cc31dd@pumpkin>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260105190503.53cc31dd@pumpkin>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 05, 2026 at 07:05:03PM +0000, David Laight wrote:
> On Mon, 5 Jan 2026 15:40:22 +0000
> Andrew Cooper <andrew.cooper3@citrix.com> wrote:
> =

> > >  	/* Most significant octet of plaintextData corresponds to data[0] */
> > >  	swap_buf(r, data, 16);
> > >  =

> > > - aes_encrypt(&ctx, data, data); + aes_encrypt_new(&aes, data, data);=
  =

> > =

> > One thing you might want to consider, which reduces the churn in the se=
ries.
> > =

> > You can use _Generic() to do type-based dispatch on the first pointer.=
=A0
> > Something like this:
> > =

> > void aes_encrypt(const struct crypto_aes_ctx *ctx, u8 *out, const u8 *i=
n);
> > void aes_encrypt_new(aes_encrypt_arg key, u8 out[at_least AES_BLOCK_SIZ=
E],
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const u8 in[at_least AES_BLOCK_SIZ=
E]);
> > =

> > #define aes_encrypt(ctx, out, in)=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0 \
> > =A0=A0=A0 _Generic(ctx,=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 const struct crypto_aes_ctx *: aes=
_encrypt(ctx, out, in),=A0 \
> > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 aes_encrypt_arg: aes_encrypt_new(c=
tx, out, in))
> > =

> > =

> > i.e. it keeps the _new()-ism in a single header, without needing to
> > change the drivers a second time.
> =

> You'll need to cast the 'ctx' argument in both calls.
> All the code in an _Generic() must compile cleanly in all the cases.
> (Totally annoying....)
> =

> 	David

It seems it would actually have to be:

#define aes_encrypt(key, out, in) \
_Generic(key, \
	 struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_ctx *)k=
ey, out, in), \
	 const struct crypto_aes_ctx *: aes_encrypt_old((const struct crypto_aes_c=
tx *)key, out, in), \
	 struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)key, out,=
 in), \
	 const struct aes_enckey *: aes_encrypt_new((const struct aes_enckey *)key=
, out, in), \
	 struct aes_key *: aes_encrypt_new((const struct aes_key *)key, out, in), \
	 const struct aes_key *: aes_encrypt_new((const struct aes_key *)key, out,=
 in))

#define aes_decrypt(key, out, in) \
_Generic(key, \
	 struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_ctx *)k=
ey, out, in), \
	 const struct crypto_aes_ctx *: aes_decrypt_old((const struct crypto_aes_c=
tx *)key, out, in), \
	 struct aes_key *: aes_decrypt_new((const struct aes_key *)key, out, in), \
	 const struct aes_key *: aes_decrypt_new((const struct aes_key *)key, out,=
 in))

Note that both const and non-const args need to be handled.

It also doesn't work for any callers passing a 'void *' or
'const void *' and relying on an implicit cast.  I didn't notice any,
but that needs to be considered too.

I guess maybe it would still be worth it to avoid the "*_new" name
temporarily leaking into too many files.  (It goes away by the end of
the series anyway.)  It's just not quite as simple as you're suggesting,
and all the callers have to be checked for compatibility with it.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
