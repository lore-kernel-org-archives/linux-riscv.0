Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE9B4C7EE2A
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jun 2025 22:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0fWNGwk58DnpvOm5X+eTsOrFTD6TcvYmJd+cMLRyLK8=; b=DuoK4/KYH0rH3M
	VADb+YznAd4D/tkbAZiiLUURZggp6hMBhX5j430GKX4rawcQ5ySv6mh35IE37mXc+Nx0GDA/dfpop
	hsV5zZba/ARMdnlH4xr1voDrEts3bKa+j7QZaYRfW4fUaUO1YuIfUOXaW3A9aCX8uCEFvkOXv9Hw+
	onZZC9bZR+0o9/VreODxoWKxlRqI5QY06JVCBQwkPwK+DEnk4SWXGf7GO/7M+FRPBCUj7ZEfO4Ts+
	cxNVYZ9dfBXhLlo2XnmFlPIv2ASfin47A+NLvdgiVqY4OZ0EQ8cTshNyMolHJgLbH9SOwyZOG9ljh
	3bRQek9yt6fI9jYIV/Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVH9g-0000000FuY9-1nlT;
	Fri, 27 Jun 2025 22:02:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVGzC-0000000Ftje-2Vk9
	for linux-riscv@lists.infradead.org;
	Fri, 27 Jun 2025 21:51:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E0A7943B9D;
	Fri, 27 Jun 2025 21:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D065C4CEE3;
	Fri, 27 Jun 2025 21:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751061113;
	bh=6RlVLwYxD624F9ZBWUaG+TvP/YFr9pDC9swFlV1MCJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bNR6UU/EFCvxF2MMtQuuUGTLigvVXiscRJT9MZmA26crak9uEmQyPcq55CeFac3v/
	 AWfeg3SCMS1ZJnFsmUH2Y1yuuSf6bI+yvLWqpZL2sjiZXSVPpaThMeww50ZefgQ8J1
	 mDT53jECnlr8uVYkRhy5aWftw8yfgHCerNJc19+pD6oFMJvmhRcf9kJRN7ye7m/C1U
	 bwU9Irxcba/iUrh9gVMmjnUPGYYpg/3StEIg0I4Be0hQ/QNr3AE0N9IvK0u+SaZg0M
	 sfqbWPnXojS4WAfxIeipuFmyMg/pf6XjDumswLwEwCJJJgd9J4PGQOFV+bLC0tUonR
	 1SMm5s3II4i3Q==
Date: Fri, 27 Jun 2025 21:51:51 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Andy Polyakov <appro@cryptogams.org>,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org,
	herbert@gondor.apana.org.au, paul.walmsley@sifive.com,
	alex@ghiti.fr, zhang.lyra@gmail.com
Subject: Re: [PATCH v4] crypto: riscv/poly1305 - import OpenSSL/CRYPTOGAMS
 implementation
Message-ID: <20250627215151.GA1194754@google.com>
References: <20250611033150.396172-2-zhihang.shao.iscas@gmail.com>
 <20250624035057.GD7127@sol>
 <48de9a74-58e8-49c2-8d8a-fa9c71bf0092@cryptogams.org>
 <20250625035446.GC8962@sol>
 <CABCJKudbdWThfL71L-ccCpCeVZBW7Yhf3JXo9FvaPboRVaXOyg@mail.gmail.com>
 <fa13aa9c-fd72-4aa3-98bc-becaf68a5469@cryptogams.org>
 <CABCJKucHNWz6J9vvDvKh_Je8eQTJO_1r0f6jsDTsDmfaxdBygg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABCJKucHNWz6J9vvDvKh_Je8eQTJO_1r0f6jsDTsDmfaxdBygg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_145154_658483_174C380D 
X-CRM114-Status: GOOD (  10.44  )
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

On Fri, Jun 27, 2025 at 09:10:30AM -0700, Sami Tolvanen wrote:
> > Would it be sufficient to #include <linux/cfi_types.h>?
> 
> Yes, but this requires the function to be indirectly called, because
> with CFI_CLANG the compiler only emits CFI type information for
> functions that are address-taken in C. If, like Eric suggested, these
> functions are not currently indirectly called, I would simply leave
> out the lpad instructions for kernel builds and worry about
> kernel-mode CFI annotations when they're actually needed:
> 
> # if defined(__riscv_zicfilp) && !defined(__KERNEL__)
>         lpad    0
> # endif

These functions aren't indirectly called, and I'm intending to keep it that way.

- Eric

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
