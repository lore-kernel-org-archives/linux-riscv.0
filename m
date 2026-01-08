Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B1CD1D493
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 20:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WheZgjHcNhbaUjsXIq2Ls9/YdTh843Vk770NVGpz7l8=; b=RSjXBzh4paG5vQ
	RapeC4fAnLl/HqNlymDtgdUuui8k8BqH+XHMYxqIGV3iZyfpn4KxhIjO9f5ytDUzANZe6wxzjTEEY
	9A8NE8dwQ96cLCfhl3ShKe79cAgbppEL3pxyF2W7RtOG+XPeWx0IZPI0vdppD65EXwydSGgj33FvC
	h0huymjKu12rJ/ZG3lPY4m2+rHJDSKDVHd+2SIt4xqr3XHwNCvJ6l3HllXQ8clWZSvqKIf2wrFMhI
	RmxrdYLy2L6VolKmfOyapusJOnHYNkrGWly+ttkmdAkeBlURD2WtpmTNzgeWeGWG1onXVWvC1rs1e
	shdWBmjdNvEVfLfNRg+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwal-00000000pBf-27LQ;
	Thu, 08 Jan 2026 20:26:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdwaf-00000000p8u-3EW4;
	Thu, 08 Jan 2026 20:26:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B75804348E;
	Thu,  8 Jan 2026 20:26:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38C48C116C6;
	Thu,  8 Jan 2026 20:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767904000;
	bh=Lbm1wO5Em7fQQ3GgNoKyxmZwFi9cEzaK6DxC0Hi/YDo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EyNigXEX0DLMaJG0OfQR4OzGuk/of9r8RZK5qiWkOnEYPPsqT0sO1q1s17KEOINIa
	 NBWSlBfPlmpONGDNCI9fjxzMZ/y80VPpOFRdXRRSXCarUm+xRxIyCQyBO2jMrr/Pje
	 0xSy3IPcI6jBuNEU0eiYYB2+/koWhKmP6dZuRJsMN9+a79OGGH37b3RJ/9LQes/OUF
	 mnBoRj1PnxeL4FC9HPYLvmsv6ugYHZMjQ8aen4EJS9tGlvv2R26hZgQdr3CTeZlyOS
	 YqTHMwNzv2jbc77JdR4R84tXkpLq9i5xMwKqrJCMQwpE/B+HX3bhXiAuLk2eXY560K
	 X0Kk2IgVhopmQ==
Date: Thu, 8 Jan 2026 12:26:18 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>
Subject: Re: [PATCH 00/36] AES library improvements
Message-ID: <20260108202618.GA2687@sol>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
 <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMj1kXGRTfyXPD3+Ravr7O5ZUMAUeabQw455sW5g7aRy3BU+2Q@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_122641_851664_B6145BAE 
X-CRM114-Status: GOOD (  26.90  )
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

On Thu, Jan 08, 2026 at 12:32:00PM +0100, Ard Biesheuvel wrote:
> On Mon, 5 Jan 2026 at 06:14, Eric Biggers <ebiggers@kernel.org> wrote:
> >
> > This series applies to libcrypto-next.  It can also be retrieved from:
> >
> >     git fetch https://git.kernel.org/pub/scm/linux/kernel/git/ebiggers/linux.git aes-lib-v1
> >
> > This series makes three main improvements to the kernel's AES library:
> >
> >   1. Make it use the kernel's existing architecture-optimized AES code,
> >      including AES instructions, when available.  Previously, only the
> >      traditional crypto API gave access to the optimized AES code.
> >      (As a reminder, AES instructions typically make AES over 10 times
> >      as fast as the generic code.  They also make it constant-time.)
> >
> >   2. Support preparing an AES key for only the forward direction of the
> >      block cipher, using about half as much memory.  This is a helpful
> >      optimization for many common AES modes of operation.  It also helps
> >      keep structs small enough to be allocated on the stack, especially
> >      considering potential future library APIs for AES modes.
> >
> >   3. Replace the library's generic AES implementation with a much faster
> >      one that is almost as fast as "aes-generic", while still keeping
> >      the table size reasonably small and maintaining some constant-time
> >      hardening.  This allows removing "aes-generic", unifying the
> >      current two generic AES implementations in the kernel tree.
> >
> 
> Architectures that support memory operands will be impacted by
> dropping the pre-rotated lookup tables, especially if they have few
> GPRs.
> 
> I suspect that doesn't really matter in practice: if your pre-AESNI
> IA-32 workload has a bottleneck on "aes-generic", you would have
> probably moved it to a different machine by now. But the performance
> delta will likely be noticeable so it is something that deserves a
> mention.

Sure.  I only claimed that the new implementation is "almost as fast" as
aes-generic, not "as fast".

By the way, these are the results I get for crypto_cipher_encrypt_one()
and crypto_cipher_decrypt_one() (averaged together) in a loop on an i386
kernel patched to not use AES-NI:

    aes-fixed-time: 77 MB/s
    aes-generic: 192 MB/s
    aes-lib: 185 MB/s

I'm not sure how relevant these are, considering that this was collected
on a modern CPU, not one of the (very) old ones that would actually be
running i386 non-AESNI code.  But if they are even vaguely
representative, this suggests the new code does quite well: little
slowdown over aes-generic, while adding some constant-time hardening
(which arguably was an undeserved shortcut to not include before) and
also using a lot less dcache.

At the same time, there's clearly a large speedup vs. aes-fixed-time.
So this will actually be a significant performance improvement on
systems that were using aes-fixed-time.  Many people may have been doing
that unintentionally, due to it being set to a higher priority than
aes-generic in the crypto_cipher API.

I'll also note that the state of the art for parallelizable AES modes on
CPUs without AES instructions is bit-slicing with vector registers.  The
kernel has such code for arm and arm64, but not for x86.  If x86 without
AES-NI was actually important, we should be adding that.  But it seems
clear that x86 CPUs have moved on, and hardly anyone cares anymore.  If
for now we can just provide something that's almost as fast as before
(and maybe even a lot faster in some cases!), that seems fine.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
