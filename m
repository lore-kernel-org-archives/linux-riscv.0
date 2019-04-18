Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 433C0C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 04:45:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A8E22183E
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 04:45:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nnqPykbp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OLkbJU7m"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0A8E22183E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kic9Hw0vdWtIQ1FEQ0XTZRBETaxaf4xAaPhQkFpGYfI=; b=nnqPykbp94TNnh
	a+NeWa7GHp4ORhwtpTFGob3tPqdA+EUs0Hvl3aO6dYbf9VtSiSlBnWa1YCloiVgALd4UhUxMHdKOv
	y1wx/fNoAu1ExpC9F3+SVIVefAq5Nybukh2o0P0xK6kcBGsPP82tXoQaZql1Zo3uEcPGCQ8EQoZBK
	4hjnHBd4aGzPRjHhFFoMRovFV5qbIi3N1BH7kD8oZ5J/xGfbNrdilPNEVki+wOTBx52aup8ur4y2q
	jrMfSfcU7OT3Wsn9aqmwO1hWOS/y0h8/HkxngRnebKH+Skhde6iwYI2SM8MRwIibf251qoKjayQde
	9h4TzL2QmWNrknpy21kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGyvU-0003AX-0j; Thu, 18 Apr 2019 04:45:32 +0000
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGyvR-0003AA-Oi
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 04:45:31 +0000
Received: by mail-vs1-xe41.google.com with SMTP id j184so449666vsd.11
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 21:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=92tRgfUMbeMv1ITsQnVX2nfQxbImxEmC6NtEESfsrL8=;
 b=OLkbJU7m0JSpwXyWqa9ZSVBZbJJbsitwwGD9ZFTANpCONTXMGZ81AhxDTno9r38sEv
 Z0JotjuwKOUss922IFDFo/63cZ+UAJRNvTAAAwjPU190WnPbTuipbvAcYF0az0veXucS
 uACiUuIuiBILnxrE6ReQLiWsvSB24QasvXBQc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92tRgfUMbeMv1ITsQnVX2nfQxbImxEmC6NtEESfsrL8=;
 b=Ba8Jj26/AfONW0ByEiZWJ6IG0GOexk3F8FHKvyjpBFyOqI2zRo0FUzWvDuIr+NGeJs
 bEgDloQ6NQlLT9udNrximqL0Fj8mExPFNE5uQ5/LHxeSNANgIy6kPFTBlGFCUJxgG+XF
 J670Rk2MznSsfWTNRFvnCMtukBjhli3hh5j2jBqJhYSDXbCnim7mbOy/JQkh+Y2ah3gK
 WbvOj603PW9v+vMFpL1snivgOxhwLcwX9yVpLfjaaCdKR6tZLnZ8XMKj1CYz6VpusCCS
 4av0UX8gSwLYSeObOhhWWYXgSJUSuut88cxjP9/L7rRekc274OvdCiBtEik5hrb95btJ
 wADA==
X-Gm-Message-State: APjAAAVhKMKRBrzcaTVzDdaooa0OjeSrHZtB8nz0N/i1vlSh4nJOjE2+
 QqrO78ANTL0bAsX5R6z8qCImY9/XGvs=
X-Google-Smtp-Source: APXvYqzEi9qZYVWXMrkbUPBxwe6w6qVWIaovcQSF3qI8813XtYiM628lxK+veb2N19MZWFYMgZ9RxA==
X-Received: by 2002:a67:bc0f:: with SMTP id t15mr25558263vsn.108.1555562728215; 
 Wed, 17 Apr 2019 21:45:28 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com.
 [209.85.217.50])
 by smtp.gmail.com with ESMTPSA id p6sm377768vke.16.2019.04.17.21.45.27
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 21:45:28 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id t23so449873vso.10
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 21:45:27 -0700 (PDT)
X-Received: by 2002:a67:7c8a:: with SMTP id
 x132mr50675686vsc.172.1555562232106; 
 Wed, 17 Apr 2019 21:37:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-4-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-4-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Wed, 17 Apr 2019 23:37:00 -0500
X-Gmail-Original-Message-ID: <CAGXu5jKo26zXw=jfKSzr_pnfx5Zux+fVbY7V9bJwEMApDcFi8w@mail.gmail.com>
Message-ID: <CAGXu5jKo26zXw=jfKSzr_pnfx5Zux+fVbY7V9bJwEMApDcFi8w@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] arm64: Consider stack randomization for mmap
 base only when necessary
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_214529_803959_6BD35223 
X-CRM114-Status: GOOD (  16.85  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Russell King <linux@armlinux.org.uk>,
 Ralf Baechle <ralf@linux-mips.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Paul Burton <paul.burton@mips.com>,
 linux-riscv@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 James Hogan <jhogan@kernel.org>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Luis Chamberlain <mcgrof@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Apr 17, 2019 at 12:26 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> Do not offset mmap base address because of stack randomization if
> current task does not want randomization.

Maybe mention that this makes this logic match the existing x86 behavior too?

> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/arm64/mm/mmap.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index ed4f9915f2b8..ac89686c4af8 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -65,7 +65,11 @@ unsigned long arch_mmap_rnd(void)
>  static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>  {
>         unsigned long gap = rlim_stack->rlim_cur;
> -       unsigned long pad = (STACK_RND_MASK << PAGE_SHIFT) + stack_guard_gap;
> +       unsigned long pad = stack_guard_gap;
> +
> +       /* Account for stack randomization if necessary */
> +       if (current->flags & PF_RANDOMIZE)
> +               pad += (STACK_RND_MASK << PAGE_SHIFT);
>
>         /* Values close to RLIM_INFINITY can overflow. */
>         if (gap + pad > gap)
> --
> 2.20.1
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
