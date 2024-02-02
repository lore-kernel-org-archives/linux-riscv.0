Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C84C4828E
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 19:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RrX6a0C4Xx3WsQga8dLXJNpIq4NFANatNoHshmMPWY8=; b=gDujHYdOeD2JYF
	BhyhlFqNbYtQTn9E1c2I8RWsJfamP1u2qYZ51cAdJKKG5D+JO3OwMzDFrzfMJXHecXIpOr/+vaVU3
	Kpc7qvcaIFz+qQgNGqBWgLlVrUUmelRrC3Itv6TUdpBSp7OwCHg7q3NygqbOTYbMpFCuqEMzLPjJM
	g9AARCOhRHa+x3AR1EQEcgwdZJoiWmH4oLmZPIEgwv41g6iDYcgFAuj/WvzUbctakX6S4GM2L76r5
	WRY0Nkr+Pur2jp0TXs57i4naDhngSTYXyh/j9lrNDTerqsqSSiPoqlPGRimK4mRJph6EfE+BZXeWw
	JuH9ikr5/MH1vlLUMyNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVzGu-0000000DD76-1jEP;
	Fri, 02 Feb 2024 19:32:20 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVyHk-0000000CscO-2jIN
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 18:29:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 12AE76278F
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 18:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9423C43390
	for <linux-riscv@lists.infradead.org>; Fri,  2 Feb 2024 18:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706898547;
	bh=1zslocAyDz7T0m3A7m1ZKz5UdxjqSVhRiZTB0J75KZs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iS18l0nnP+SmAJmWyQRIfxT2qLS40WOWuolrE7ToKRmSKZKOKFy4d7503KFS3Y5Ob
	 xotbpYOir87hFxJ9mwrnKizU3vaaEM6UvZYB5ajBkzHc+pxtQX+yRu649cqHDlYXo2
	 xq4IRqFDWJsO8GzAmRV0gH5AEdlx8KjYFqFRJulp3wCGlrVLq4KhUdtbGU80RQUx/+
	 0y0GSbaxu7UCjiAJChAwcSiO6Trg7u0NkzaB60/tQvQFnpZmwE3qrcqHneiWVsgjZh
	 qeyjkMN5q7Ib84M4qb8nT0n/4hL5/S2u9CujMdQrircDsMjiiAeJ9kH5lQLX+BiN6k
	 kXPVZjsPC7Zzg==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5111c7d40deso3853454e87.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Feb 2024 10:29:07 -0800 (PST)
X-Gm-Message-State: AOJu0Yx7+Qhrrg6Z1YUlLwXdCnQ3nUTrA4rUBrA8yCpBahv4cjObd2mQ
	lT9xPfSAnItUSv9I8bthcsc7FZvo6K0cEFqMTStRA4V+LURfgT/w0xc38vZHo3i1gCyXDU4mQ+B
	4LnktTRienTfW5R8lUTMbyzvb5yA=
X-Google-Smtp-Source: AGHT+IH+n8H/ORElgf5m2gXQY6sqR48Q3+f+kf6ZpB0C/kjWL2lSD2YZqWyf3o0pk2DZ8Cf03zThQiXTZBwYfj9R5Is=
X-Received: by 2002:ac2:562f:0:b0:511:1ed7:61b9 with SMTP id
 b15-20020ac2562f000000b005111ed761b9mr1845123lff.39.1706898545983; Fri, 02
 Feb 2024 10:29:05 -0800 (PST)
MIME-Version: 1.0
References: <20240202180704.808766-1-abrestic@rivosinc.com>
In-Reply-To: <20240202180704.808766-1-abrestic@rivosinc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 2 Feb 2024 19:28:54 +0100
X-Gmail-Original-Message-ID: <CAMj1kXEQdGKzoZjaZwa-SRhnwTwvaR_-SY7YtfKsUfEBc952_g@mail.gmail.com>
Message-ID: <CAMj1kXEQdGKzoZjaZwa-SRhnwTwvaR_-SY7YtfKsUfEBc952_g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] efi: Fixes for EFI_MEMORY_SP memory on RISC-V and ARM64
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-efi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_102908_759875_A7302C33 
X-CRM114-Status: GOOD (  12.79  )
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

On Fri, 2 Feb 2024 at 19:07, Andrew Bresticker <abrestic@rivosinc.com> wrote:
>
> Two small fixes to enable the use soft-reserved/special-purpose memory
> (EFI_MEMORY_SP) with dax_kmem on RISC-V (and ARM64, I think, though I
> don't have a platform to test it on).
>
> Patch 1 fixes a trivial integer narrowing bug. Patch 2 prevents adding
> memblocks for soft-reserved memory so that it can later be hotplugged by
> dax_kmem.
>
> Tested on a RISC-V platform that presents a range of EFI_MEMORY_SP with
> Bjorn's MEMORY_HOTPLUG series[0] applied.
>
> [0]: https://lore.kernel.org/lkml/20230512145737.985671-1-bjorn@kernel.org/
>
> v1->v2: address comments from Ard
>
> Andrew Bresticker (2):
>   efi: runtime: Fix potential overflow of soft-reserved region size
>   efi: Don't add memblocks for soft-reserved memory
>

Thanks, I'll take these both as fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
