Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4756EC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:28:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1558021479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:28:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qednyU/B";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZOmVLE2k"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1558021479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PsqN5MPGWgz7e1C2oeAAuwl4q9DQdZFHZaozUiiu9uY=; b=qednyU/BtW+++s
	njiUT6tLI1/i9gvm8UjwrGzuJaBoubTL3ie4998M7ZFSrSBZszMZDZJouvSA5/6EV9VvLhljiMbEp
	Cv8l995De6lDulaqHkxW5oBNZpIgejLqr13COU3Xbw/cyo508BxybxggM6Nl1IL8LRNxd3S8pyxB/
	nZCi3Ct/uxH1zk5DUCewEOaG6WB92CPRJG4R6KOFvvUC/Ig+1NnR3+p7E4ahyW5lzCVvLebBXLQFw
	KAXEGQWdx9tJRJRic/HDZB0zjj4z2ykT0xM9zPTPhAC8a65yfAYUiG1HEyJO/AGpB2OcfcZchHvdN
	rQwq7+iYL9hnt1a7G7jg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzbJ-0000Ox-Oo; Thu, 18 Apr 2019 05:28:45 +0000
Received: from mail-vk1-xa43.google.com ([2607:f8b0:4864:20::a43])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzbB-0000Gy-QC
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:28:39 +0000
Received: by mail-vk1-xa43.google.com with SMTP id w140so215391vkd.3
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IcA/uYI8DV5Uk3TdhA5fHXy0czTBgFSx6RCoxfz+//4=;
 b=ZOmVLE2kWQEfxAwJtqNT7fptm5m89yjN9pJ4hwhI4Z8f49vkIG1SsNzihNlPHXzko1
 XXEV3xLUvXrMTYVGVNWYLrrCC0hIAZCueqmowWDl/0KTMFCsqx1U+m/G2nteU8eiooyN
 6sDfWAdWlsvCPZQuCGxF8OqTfh2ZEPtoetyBA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IcA/uYI8DV5Uk3TdhA5fHXy0czTBgFSx6RCoxfz+//4=;
 b=cxnAxGqOagLls80mSyjiZZhQGRWV5gigvbRyDCNy1pO9aNJa5zUend/L9wy6LWXGsd
 fkkLUm4VHzu5ZWIBRQu3go3aFRhNQz7nYnqQ1PVW4g+0Yeou27Fdy6SdLU3jniGsetVN
 tyWa/i+lKqhzdj61VvZAKQ//pRz9lh2v3N4FXh56H66FOC9rZ33bmHosBT2jN1rk7jiz
 F76IYJbu+zV1bTDSvTfAXGpvt26/sVsumPpQPTFeigogKO6m9j5zLyHj9TxBGf/tP8NC
 mA0rRYMJRjejtWa7l3DtGyouiM/WYsdOhMu4mTjey2a1BEXnONUAvWL21jEZJtY5q6vY
 bKSw==
X-Gm-Message-State: APjAAAWyg5Fpzh0BwsIkqKGw7sU9RlSUQrkDzQAJqndfVLPOQfiITeF4
 nGfmWGe2KCGh8LflrJ8CPmKQMLKozdw=
X-Google-Smtp-Source: APXvYqyK0Ltke3C8qoodyG3KetuFZjSZTZGC3MaeQkrRlLShBUh14D5Wc0i4+cPisL73JfjUwP2C4A==
X-Received: by 2002:a1f:1691:: with SMTP id 139mr49956598vkw.25.1555565316346; 
 Wed, 17 Apr 2019 22:28:36 -0700 (PDT)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id l125sm244318vsd.31.2019.04.17.22.28.35
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:28:36 -0700 (PDT)
Received: by mail-ua1-f52.google.com with SMTP id l22so377587uao.8
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:28:35 -0700 (PDT)
X-Received: by 2002:a9f:3fce:: with SMTP id m14mr49582984uaj.96.1555564855818; 
 Wed, 17 Apr 2019 22:20:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-2-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-2-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:20:44 -0500
X-Gmail-Original-Message-ID: <CAGXu5jKuOaGtb0S++_xpS=sxPLFwFqSgaecWae5iJ8f8eaQzDA@mail.gmail.com>
Message-ID: <CAGXu5jKuOaGtb0S++_xpS=sxPLFwFqSgaecWae5iJ8f8eaQzDA@mail.gmail.com>
Subject: Re: [PATCH v3 01/11] mm, fs: Move randomize_stack_top from fs to mm
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_222838_262963_2BB9A70F 
X-CRM114-Status: GOOD (  19.50  )
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

On Wed, Apr 17, 2019 at 12:24 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> This preparatory commit moves this function so that further introduction
> of generic topdown mmap layout is contained only in mm/util.c.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/binfmt_elf.c    | 20 --------------------
>  include/linux/mm.h |  2 ++
>  mm/util.c          | 22 ++++++++++++++++++++++
>  3 files changed, 24 insertions(+), 20 deletions(-)
>
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index 7d09d125f148..045f3b29d264 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -662,26 +662,6 @@ static unsigned long load_elf_interp(struct elfhdr *interp_elf_ex,
>   * libraries.  There is no binary dependent code anywhere else.
>   */
>
> -#ifndef STACK_RND_MASK
> -#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))    /* 8MB of VA */
> -#endif
> -
> -static unsigned long randomize_stack_top(unsigned long stack_top)
> -{
> -       unsigned long random_variable = 0;
> -
> -       if (current->flags & PF_RANDOMIZE) {
> -               random_variable = get_random_long();
> -               random_variable &= STACK_RND_MASK;
> -               random_variable <<= PAGE_SHIFT;
> -       }
> -#ifdef CONFIG_STACK_GROWSUP
> -       return PAGE_ALIGN(stack_top) + random_variable;
> -#else
> -       return PAGE_ALIGN(stack_top) - random_variable;
> -#endif
> -}
> -
>  static int load_elf_binary(struct linux_binprm *bprm)
>  {
>         struct file *interpreter = NULL; /* to shut gcc up */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 76769749b5a5..087824a5059f 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -2312,6 +2312,8 @@ extern int install_special_mapping(struct mm_struct *mm,
>                                    unsigned long addr, unsigned long len,
>                                    unsigned long flags, struct page **pages);
>
> +unsigned long randomize_stack_top(unsigned long stack_top);
> +
>  extern unsigned long get_unmapped_area(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
>
>  extern unsigned long mmap_region(struct file *file, unsigned long addr,
> diff --git a/mm/util.c b/mm/util.c
> index d559bde497a9..a54afb9b4faa 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -14,6 +14,8 @@
>  #include <linux/hugetlb.h>
>  #include <linux/vmalloc.h>
>  #include <linux/userfaultfd_k.h>
> +#include <linux/elf.h>
> +#include <linux/random.h>
>
>  #include <linux/uaccess.h>
>
> @@ -291,6 +293,26 @@ int vma_is_stack_for_current(struct vm_area_struct *vma)
>         return (vma->vm_start <= KSTK_ESP(t) && vma->vm_end >= KSTK_ESP(t));
>  }
>
> +#ifndef STACK_RND_MASK
> +#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))     /* 8MB of VA */
> +#endif

Oh right, here's the generic one... this should probably just copy
arm64's version instead. Then x86 can be tweaked (it uses
mmap_is_ia32() instead of is_compat_task() by default, but has a weird
override..)

Regardless, yes, this is a direct code move:

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> +
> +unsigned long randomize_stack_top(unsigned long stack_top)
> +{
> +       unsigned long random_variable = 0;
> +
> +       if (current->flags & PF_RANDOMIZE) {
> +               random_variable = get_random_long();
> +               random_variable &= STACK_RND_MASK;
> +               random_variable <<= PAGE_SHIFT;
> +       }
> +#ifdef CONFIG_STACK_GROWSUP
> +       return PAGE_ALIGN(stack_top) + random_variable;
> +#else
> +       return PAGE_ALIGN(stack_top) - random_variable;
> +#endif
> +}
> +
>  #if defined(CONFIG_MMU) && !defined(HAVE_ARCH_PICK_MMAP_LAYOUT)
>  void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
>  {
> --
> 2.20.1
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
