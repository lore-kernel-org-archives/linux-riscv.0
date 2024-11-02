Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3239CE677F8
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Nov 2024 11:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaML9WDcDvBVFiYwUfGeTBvcYPJ8PCYthq7IFXteOvQ=; b=u5xu3HOqFpRrLU
	n7/sRMI9H8JaJ34HP0bnBcEf+dV2zy505W3qXagvqhZqlm6d0QYhYRbuWR8BmtBQQ9unwhlqGy7YC
	YXhs9cSdNJbDWNB7daF0hJrYubjIxPXNCb7iijc9lJS3QhlIntyfQe6pqvV+9Ej/fBPZBh0oIh4Je
	hfn3UtUdOEHxCXqzqs6pL7J4X1GY1U6d9KWAa8AH6KCcGGQLO+YGtn6WVBd5HtRGEH8nojWdPZU7t
	RXsoIyWKMF65rK2eVyCa6W4zti3PHiO3l0tuL/qq4NKS/AqouHl2Wrnb+XgRw5usmuRSYzq24D1rq
	AViDtTNJfQbRPJXpwbRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7By9-00000009Y3Z-17g2;
	Sat, 02 Nov 2024 11:07:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7BwS-00000009Xqv-07n8;
	Sat, 02 Nov 2024 11:05:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 783585C39C2;
	Sat,  2 Nov 2024 11:04:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6143C4CED5;
	Sat,  2 Nov 2024 11:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730545514;
	bh=/5V9RBqkx2P66EvYaaaASBdjOLj2pXbKfVO3Hh2MXq0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=aG8rN+aGdtH1DPyPt0RE+7lAJgUL/xXXHUelv4xEoDkJGS1o2la6NNuXa5xis93nN
	 K8IKDmq8EiG0o9WOHBCJO193R3Cwdp0VFuoF6oYHS3VAZ2z7ZDdAaNSMmOu/MMLl0R
	 c+5IA9wcIbiEVqWbp16rgmOQIRrPNN2745gD9NAycIDtw6YYRxmQQEvGoyQopB0/Vg
	 9k08OIbmYhcPdDTgy3bov/BTbh35m6h2xJTok/8HFYPtgtvuO45X4GGAawAIkKqaMa
	 YSVdXfZNrwS+ONIBbLTrgDZiGfuTf4K6InWgWETrzpSoUbxTA5sO4ko6HmUl4OCzgy
	 RXaied76n8YRQ==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2fb3ce15172so36438401fa.0;
        Sat, 02 Nov 2024 04:05:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9rsWzoC65H9WzJoTDBSD0IoCVAxj1sZfhHkJJ64VC0hajHi2CI4ymHLVr5djQmLhXrH5G1h7iZDmFgJsXvXIO@lists.infradead.org, AJvYcCVkiiaC2Hu1FNMQeemTiynoSG5xbPxljFdAVLln0YOePkE3jt4n3jSzwYAly4UBDSdS3H6DS742NJ/pFcY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWGzLxxhYlUzEhiOGm0ZWtcj7hCTcHtCe8BD8VfGiQ3iw1BJAN
	0/d/ZxaIYBcXYeN5ePvA/1/rmS6UUiKmTBl5z9gq9Hdej971oupSBM2OxzKfYXZa1PqpqeumPjL
	i9mxwVWLloTNwyYaEphdugFFuMLI=
X-Google-Smtp-Source: AGHT+IE5o/Xo+U8T2tXn6oxoafBjKshUHZrf+SWe+VK5IeGRU8mut4uUUJkKbM8eXFrd2HiwYXSp4cYXTpXetvFDWaA=
X-Received: by 2002:a2e:b8ca:0:b0:2fb:5a42:da45 with SMTP id
 38308e7fff4ca-2fedb46de0dmr21026331fa.16.1730545513001; Sat, 02 Nov 2024
 04:05:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241026040958.GA34351@sol.localdomain> <ZyX0uGHg4Cmsk2oz@gondor.apana.org.au>
 <CAMj1kXFfPtO0vd1KqTa+QNSkRWNR7SUJ_A_zX6-Hz5HVLtLYtw@mail.gmail.com>
 <ZyX8yEqnjXjJ5itO@gondor.apana.org.au> <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
In-Reply-To: <CAMj1kXHje-BwJVffAxN9G96Gy4Gom3Ca7dJ-_K7sgcrz7_k7Kw@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sat, 2 Nov 2024 12:05:01 +0100
X-Gmail-Original-Message-ID: <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
Message-ID: <CAMj1kXG8Nqw_f8OsFTq_UKRbca6w58g4uyRAZXCoCr=OwC2sWA@mail.gmail.com>
Subject: Re: [PATCH v2 04/18] crypto: crc32 - don't unnecessarily register
 arch algorithms
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-crypto@vger.kernel.org, linux-ext4@vger.kernel.org, 
	linux-f2fs-devel@lists.sourceforge.net, linux-mips@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-scsi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	loongarch@lists.linux.dev, sparclinux@vger.kernel.org, x86@kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241102_040516_182908_B6252508 
X-CRM114-Status: GOOD (  24.67  )
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

On Sat, 2 Nov 2024 at 11:46, Ard Biesheuvel <ardb@kernel.org> wrote:
>
> On Sat, 2 Nov 2024 at 11:20, Herbert Xu <herbert@gondor.apana.org.au> wrote:
> >
> > On Sat, Nov 02, 2024 at 10:58:53AM +0100, Ard Biesheuvel wrote:
> > >
> > > At least btrfs supports a variety of checksums/hashes (crc32c, xxhash,
> > > sha) via the shash API.
> >
> > OK, given that btrfs is still doing this, I think we should still
> > register crc32c-arch conditionally.  Having it point to crc32c-generic
> > is just confusing (at least if you use btrfs).
> >
>
> Agreed. So we should take this patch.
>
> The current issue with btrfs is that it will misidentify
> crc32c-generic on arm64 as being 'slow', but this was already fixed by
> my patches that are already in cryptodev.
>
> On arm64, crc32 instructions are always available (the only known
> micro-architecture that omitted them has been obsolete for years), and
> on x86_64 the situation is similar in practice (introduced in SSE
> 4.2), and so this patch changes very little for the majority of btrfs
> users.
>
> But on architectures such as 32-bit ARM, where these instructions are
> only available if you are booting a 32-bit kernel on a 64-bit CPU
> (which is more common than you might think), this patch will ensure
> that crc32-arm / crc32c-arm are only registered if the instructions
> are actually available, and btrfs will take the slow async patch for
> checksumming if they are not. (I seriously doubt that btrfs on 32-bit
> ARM is a thing but who knows)

(actually, backpedalling a little bit - apologies)

OTOH,btrfs is the only user where this makes a difference, and its use
of the driver name is highly questionable IMO. On x86, it shouldn't
make a difference in practice, on arm64, it was broken for a long
time, and on the remaining architectures, I seriously doubt that
anyone cares about this, and so we can fix this properly if there is a
need.

The only issue resulting from *not* taking this patch is that btrfs
may misidentify the CRC32 implementation as being 'slow' and take an
alternative code path, which does not necessarily result in worse
performance.

And I'd prefer static_call() / static_call_query() over a separate
global variable to keep track of whether or not the generic code is in
use.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
