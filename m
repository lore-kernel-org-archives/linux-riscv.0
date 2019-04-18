Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97E3C10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:29:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F7BF21479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:29:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lZkb6H3r";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WZmIDWwI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F7BF21479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Tk1Q+WgBf8dfsT0yaoIAR4WI8hVGnr8jak9jvhG4rr0=; b=lZkb6H3r3BC4az
	yuPnV7cRZsj5HFUHRBci8CrEiTJtqs0ADcu/AWYgRu3ko3+utb2ulTjl7bDW2W86DisvSDTucGTQY
	A35DK969LARkMwhTeL54orWse5dOdap2aYs1PV4xIWc8+ON4vQZz4THTLeBuriA+E+C7u8z5OCKK6
	b4ELnJEFbu5f7QIfMOv7LJz1LKjm1tBbTYKmNgXnOXVsNxg77wdn7h0vQEWRlB4IBXOChKM2yuCY7
	fGTN0tK+MijSJcgaDgdgFFcgmM7uCdvMOPcLo2Cb3JdkhAvU+8Th3itC8UiGRl3zBCauEBM0eTAlT
	LK3iK2Sz6aDQViAjhJkg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzbd-0000jI-F8; Thu, 18 Apr 2019 05:29:05 +0000
Received: from mail-vs1-xe42.google.com ([2607:f8b0:4864:20::e42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzbP-0000Xh-JQ
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:28:55 +0000
Received: by mail-vs1-xe42.google.com with SMTP id d8so446490vsp.2
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YsXAYO0c8zFLQiUk70GsGhFvh+QJiSpbjT3b+4rW66I=;
 b=WZmIDWwIQt+p2U8OFcegWRRVLp6nJI1rwc15/sOJzGCUmcSGRFPVv48qDCitMPl6bn
 rM78n9VYubygolMm6Ghe0eVh8aEQd+wbbsAcLH0uKTj/Hr9dtxdm7CrqSOZUwvjdwtFp
 4/y4Gx8iiVq8g1yfl8tKAiGgIRUjAi38RRMeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YsXAYO0c8zFLQiUk70GsGhFvh+QJiSpbjT3b+4rW66I=;
 b=DM1wi3ADs5r2bffPcpS071IuogKG4nrIXOfXQosyvLExFJ81ZSaHABgmcatdSMxjf2
 qBjdLuXo4WYN6xN1bo90mXvHqHY6nhQZO/F8Eok7wlN0hCq1HbWRvOEiqSUgQBoJEMGs
 iBs1QA4GwMQ9gs89C18uuKxHQ3r/MxTzxEeD3d1j77ROKPN1pmrLfJLMLgQhpbUwWmXV
 6+MFD6nyJn6h1yzXDNLLP1+/fhQogkVxBEZPOEzl7SYfP7Q1WrysiYIeTwKYpucMhSiM
 dgWtXF+kBNN2OAP3np1FoWdDpBElz/i3Rh/8Kl1A3rtUpfZ2qRDB2LTCU9vq0/PRVtUm
 OYMQ==
X-Gm-Message-State: APjAAAVR6yruXUJLuEZESCCJTLtqrmMtBdUXNqLYoYXDviOIwU9Lf6ZM
 1IcCXwyilxAknctfKJ8iPHSHCDodzpk=
X-Google-Smtp-Source: APXvYqx4Ysf/Bha/9VyagwDcGeS8CHseneMy43W5XyYqjfhTZDVt+7M8D076bO5m6sdvPb/Z2DFlOw==
X-Received: by 2002:a67:e3cf:: with SMTP id k15mr49433514vsm.185.1555565330432; 
 Wed, 17 Apr 2019 22:28:50 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com.
 [209.85.221.175])
 by smtp.gmail.com with ESMTPSA id k15sm181518ual.9.2019.04.17.22.28.46
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:28:47 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id s80so213354vke.6
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:28:46 -0700 (PDT)
X-Received: by 2002:a1f:7245:: with SMTP id n66mr38243289vkc.40.1555565326448; 
 Wed, 17 Apr 2019 22:28:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-8-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-8-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:28:34 -0500
X-Gmail-Original-Message-ID: <CAGXu5jLhZS3+tiDCMsQQ=s9_f5ZBTLEYfcSfmtDRYv8Pp-KF2Q@mail.gmail.com>
Message-ID: <CAGXu5jLhZS3+tiDCMsQQ=s9_f5ZBTLEYfcSfmtDRYv8Pp-KF2Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/11] arm: Use generic mmap top-down layout
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_222851_873195_2890D8C1 
X-CRM114-Status: GOOD (  20.92  )
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

On Wed, Apr 17, 2019 at 12:30 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> arm uses a top-down mmap layout by default that exactly fits the generic
> functions, so get rid of arch specific code and use the generic version
> by selecting ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT.
>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/arm/Kconfig                 |  1 +
>  arch/arm/include/asm/processor.h |  2 --
>  arch/arm/mm/mmap.c               | 62 --------------------------------
>  3 files changed, 1 insertion(+), 64 deletions(-)
>
> diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
> index 850b4805e2d1..f8f603da181f 100644
> --- a/arch/arm/Kconfig
> +++ b/arch/arm/Kconfig
> @@ -28,6 +28,7 @@ config ARM
>         select ARCH_SUPPORTS_ATOMIC_RMW
>         select ARCH_USE_BUILTIN_BSWAP
>         select ARCH_USE_CMPXCHG_LOCKREF
> +       select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
>         select ARCH_WANT_IPC_PARSE_VERSION
>         select BUILDTIME_EXTABLE_SORT if MMU
>         select CLONE_BACKWARDS
> diff --git a/arch/arm/include/asm/processor.h b/arch/arm/include/asm/processor.h
> index 57fe73ea0f72..944ef1fb1237 100644
> --- a/arch/arm/include/asm/processor.h
> +++ b/arch/arm/include/asm/processor.h
> @@ -143,8 +143,6 @@ static inline void prefetchw(const void *ptr)
>  #endif
>  #endif
>
> -#define HAVE_ARCH_PICK_MMAP_LAYOUT
> -
>  #endif
>
>  #endif /* __ASM_ARM_PROCESSOR_H */
> diff --git a/arch/arm/mm/mmap.c b/arch/arm/mm/mmap.c
> index 0b94b674aa91..b8d912ac9e61 100644
> --- a/arch/arm/mm/mmap.c
> +++ b/arch/arm/mm/mmap.c
> @@ -17,43 +17,6 @@
>         ((((addr)+SHMLBA-1)&~(SHMLBA-1)) +      \
>          (((pgoff)<<PAGE_SHIFT) & (SHMLBA-1)))
>
> -/* gap between mmap and stack */
> -#define MIN_GAP                (128*1024*1024UL)
> -#define MAX_GAP                ((STACK_TOP)/6*5)
> -#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
> -
> -static int mmap_is_legacy(struct rlimit *rlim_stack)
> -{
> -       if (current->personality & ADDR_COMPAT_LAYOUT)
> -               return 1;
> -
> -       if (rlim_stack->rlim_cur == RLIM_INFINITY)
> -               return 1;
> -
> -       return sysctl_legacy_va_layout;
> -}
> -
> -static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
> -{
> -       unsigned long gap = rlim_stack->rlim_cur;
> -       unsigned long pad = stack_guard_gap;
> -
> -       /* Account for stack randomization if necessary */
> -       if (current->flags & PF_RANDOMIZE)
> -               pad += (STACK_RND_MASK << PAGE_SHIFT);
> -
> -       /* Values close to RLIM_INFINITY can overflow. */
> -       if (gap + pad > gap)
> -               gap += pad;
> -
> -       if (gap < MIN_GAP)
> -               gap = MIN_GAP;
> -       else if (gap > MAX_GAP)
> -               gap = MAX_GAP;
> -
> -       return PAGE_ALIGN(STACK_TOP - gap - rnd);
> -}
> -
>  /*
>   * We need to ensure that shared mappings are correctly aligned to
>   * avoid aliasing issues with VIPT caches.  We need to ensure that
> @@ -181,31 +144,6 @@ arch_get_unmapped_area_topdown(struct file *filp, const unsigned long addr0,
>         return addr;
>  }
>
> -unsigned long arch_mmap_rnd(void)
> -{
> -       unsigned long rnd;
> -
> -       rnd = get_random_long() & ((1UL << mmap_rnd_bits) - 1);
> -
> -       return rnd << PAGE_SHIFT;
> -}
> -
> -void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
> -{
> -       unsigned long random_factor = 0UL;
> -
> -       if (current->flags & PF_RANDOMIZE)
> -               random_factor = arch_mmap_rnd();
> -
> -       if (mmap_is_legacy(rlim_stack)) {
> -               mm->mmap_base = TASK_UNMAPPED_BASE + random_factor;
> -               mm->get_unmapped_area = arch_get_unmapped_area;
> -       } else {
> -               mm->mmap_base = mmap_base(random_factor, rlim_stack);
> -               mm->get_unmapped_area = arch_get_unmapped_area_topdown;
> -       }
> -}
> -
>  /*
>   * You really shouldn't be using read() or write() on /dev/mem.  This
>   * might go away in the future.
> --
> 2.20.1
>


-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
