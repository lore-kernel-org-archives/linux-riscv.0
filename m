Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98ECAC61DB2
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 03:42:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqHQSw/QrS+2TJIiVIkbgVWB6naoi8ZhT3OzoZNfhao=; b=OOSFUOfYxCvPxP
	sQv2AlmJ4UP6tfyA9L8zTs2tQGHa1QHYOF5hfx1o8NIZuB0m4bZjo+UO+juINDd7bvuiVzf0kWBoA
	pBPMR/waqVXlr0s24+oC4OX5UVGID68bPZxqajuuLG5FqqmwuhVdzC+vjRSJiFA7A8goWtHmiaL8Q
	2snXqUvT2bYHEKhE7ATDjiMXgCZVsA7LzFXmHZKmMz9fTRkV4LnEXmKTpZEq17lVHV8X3PxffLBqt
	NqSM2f1jhD1ahETQq8TI7JANM+q+vg9J/E9fVIQzHfpF/TcRzQzITOuWi5nq/zLWZx8pArliRPg9f
	cgTNV+QQdAgu3VavIY9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCMK-00000008khZ-10LO;
	Wed, 11 Jun 2025 03:42:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCKA-00000008kTp-3rKD;
	Wed, 11 Jun 2025 03:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WAifz67KxgOj7WChQ/bt0AIfRmjoY9BafkzaUYp6jaY=; b=e1vxGUSUbNo/eEeRJVTPQxxy6I
	exw5rUD3TgcDhPS2dSbYi32c1JGgQYYTFns5cS6RbWiali4UtiWk9HPu2Fj0hKuEtl633Ab0lfLPS
	Pcju1ZpZp0Ler1QdMp61AzDsRMx5kUJMTFu9ppsZANtmLKQBLKqBp7LYvrOULQN9Hy1sa0jSYDcxU
	uifbq/dtz38wF1Ntx9LsQrgbWkTPQoGnKu5G7BKId7sdga2UQfqU2v+PJrv8p+nSrPtWci28FrY61
	H/r3h65R7g7TmxOupyNRGhD8pkBdjwn9Jn4PRWzKmTZGunTSUxvuPmL5BhHWcwaOtvIXuDbHuVyzf
	rwPtGXlQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPCK8-000000025sH-30YY;
	Wed, 11 Jun 2025 03:40:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C63BA51276;
	Wed, 11 Jun 2025 03:40:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33443C4CEF0;
	Wed, 11 Jun 2025 03:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749613221;
	bh=UPRjxBTu6kPICuG6iqdM2F4dkniXO25Wjw0+01KGFmU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z33pKRSU6mJ9GSS4cRBNfZIfpjRhPF1PZPALwTKO3QwWXB5uo9f61gwgeH769IoAC
	 d6xahp+3wHEl4r/g3tk8o+BeqhrARs7AzJELD84EBatPgwfxi9bkQhTlk8qLlt4j6D
	 ebmTuRLjo4AW4jTitCG74cjdELPhR8GJah7XjR6cri9pKFl1+4Nf7SIUAbOSQUDMG2
	 zRUlMRhHZq20l0KfOHLL0Jewlitxfm0yqgy/t3mD7bWYL93vdxOe6a2WRTu3jz7/p9
	 w+AWN6gAQ46GgDieGGe7FQ6BwXkjIZI2t56ro6VAKh5jCj8mKLOKKm3ef64c2f069E
	 29Prr/qCH9kjQ==
Date: Tue, 10 Jun 2025 20:39:57 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org, ardb@kernel.org,
	Jason@zx2c4.com, torvalds@linux-foundation.org
Subject: Re: [PATCH 07/16] crypto: sha512 - replace sha512_generic with
 wrapper around SHA-512 library
Message-ID: <20250611033957.GA1484147@sol>
References: <20250611020923.1482701-8-ebiggers@kernel.org>
 <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aEjo6YZn59m5FnZ_@gondor.apana.org.au>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_044025_078388_0A3C0698 
X-CRM114-Status: GOOD (  13.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Jun 11, 2025 at 10:24:41AM +0800, Herbert Xu wrote:
> Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > +       {
> > +               .base.cra_name          = "sha512",
> > +               .base.cra_driver_name   = "sha512-lib",
> > +               .base.cra_priority      = 100,
> > +               .base.cra_blocksize     = SHA512_BLOCK_SIZE,
> > +               .base.cra_module        = THIS_MODULE,
> > +               .digestsize             = SHA512_DIGEST_SIZE,
> > +               .init                   = crypto_sha512_init,
> > +               .update                 = crypto_sha512_update,
> > +               .final                  = crypto_sha512_final,
> > +               .digest                 = crypto_sha512_digest,
> > +               .descsize               = sizeof(struct sha512_ctx),
> > +       },
> 
> This changes the export format which breaks fallback support
> for ahash drivers.
> 
> You need to retain the existing export format.

Do you have a concrete example (meaning, a specific driver) where this actually
matters?  Historically, export and import have always had to be paired for the
same transformation object, i.e. import was called only with the output of
export.  There is, and has never been, any test that tests otherwise.  This
seems like a brand new "requirement" that you've made up unnecessarily.

It also makes much more sense for the export format to simply be the struct used
by the library (e.g. sha512_ctx), not some undocumented struct generated by
pointer arithmetic.

And drivers should just use the library as their fallback, or else just do what
they did before when they must not have been depending on a particular format.

I'll add export and import functions if you insist, but it seems pointless.

Could you at least provide proper definitions for the legacy structs so that I
don't have to do pointer arithmetic to generate them?

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
