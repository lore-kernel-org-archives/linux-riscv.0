Return-Path: <SRS0=FvZO=D5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205BDC388F2
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 05:38:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F111223FB
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2020 05:38:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v5VVRTmY";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="Y9Bl1j6Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F111223FB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=oH0qy+IgN1tdo/F6wy7qXM1uBh+4NfsjfteUG9JdCCI=; b=v5VVRTmYap+5TDILRwVDW51LH
	ZAKKdx/RhfofVxmW/q0WJH8D4cvxatVGkn0HNGb5QRAq4XGaZT9oraJpngmnobabCHPQMG99A3HWG
	/VzFo1AYPmy4WwFmIjOzFpCkG4DNRcevxaLTQ/6NvhNWbUV7JT07DQGiJQCUQ90OQJVgKhONeZ67Q
	VdDItk107Yfu+YNqiOR165T5tLzdQB8nXQ+kIDGQ13SxCiN4ypPzHiLa/SGSB3qIi1jAeYa6gESnY
	MUD3IifHu6/Eqxl2pr5lUL7eeyvQiF+MhCfhbAsnuOCKzYUiqCbCAtHUeJieXVoj4X+JgwIrWEH4B
	sjZxUzGfQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVTIk-0003Y0-I1; Thu, 22 Oct 2020 05:38:14 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVTIg-0003Wh-Az
 for linux-riscv@lists.infradead.org; Thu, 22 Oct 2020 05:38:11 +0000
Received: by mail-wr1-x444.google.com with SMTP id i1so555013wro.1
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 22:38:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2FJ6bgUzNaVY5TwTxhI5fSUYbPLg9JNdup4mEtOxeyg=;
 b=Y9Bl1j6Yr57hSOSVPd/mu8/0LKB/sUaN+4OYq3aFF90Ul5QrtkCiVNH9L8jrUjSMo1
 BOKxsr/7fKRiQpN4kVGgEBqVtWszTvShe7lZdbiv6L+NLtOizZUgujXoZvT2TROyZNLx
 zJdukWtwTTaJzdJoCyxafO4cLJd0w6GUarS9y0hhBoEjh7EAz3ipVzS+BZeksfTcJ5aq
 wnHp4uFAiQq8uwfU3SZkrdpi1ZRZavZERN4yLWk7B//b8QjJsPq+nwqJOB5qXVbbWAae
 FQk9F0x2v9qjKeAsX4OYBfYNubscNVPxafc3jwllMwr2lKF5yAW2F+0L+RR0jcFJ2dTr
 c3Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2FJ6bgUzNaVY5TwTxhI5fSUYbPLg9JNdup4mEtOxeyg=;
 b=SL/q0t+KehkVO+gX2rajDnBpYPD1M/OANNSbh1fjNJyJgKuw2mICkiGlp2VJa0k5zr
 KoOHjsAefqvOVPfe7VGbVFtuUFD5scFts+K1DpsuWMvqUEnSQ4hwe4L1QQehNp9cLAj0
 FR5h5RBLq8E7UbvN7HevyWlQQqTKcORfjJWYFWqINlAbwdHJrWi/ifBZZUmSEHfIDcyf
 p3coJEd8C1pXbPd7rlMUUhhSd/QFT82jOJzVuvz9+fGHZMlIYt1OFdAmW7Omu8LtMydt
 tWBYV6vL3bfdBAvn7CmA+nXNZrMRPsuN+hVr71uzX42wuyw+y7IN4G+4tosfLToaWa8M
 IwfQ==
X-Gm-Message-State: AOAM533mwOtqomA47UEzNfgxce4kB+yLKFndJP70SWU8PmQQhcd5Yf63
 BFE5s0500yA/KRfdrYSMG/Xkugx1eY2CVr7g/9nsgQ==
X-Google-Smtp-Source: ABdhPJxk41O0FMwzCS0qOGAJ5pot2HsP0xEUlWx58Nz/Yw02Wcj0cAJSjVw5HNv+6enPy0INENlf+CnoqkGqrrxq84o=
X-Received: by 2002:a5d:6681:: with SMTP id l1mr731145wru.356.1603345088654;
 Wed, 21 Oct 2020 22:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <20201006001752.248564-1-atish.patra@wdc.com>
 <20201006001752.248564-4-atish.patra@wdc.com>
In-Reply-To: <20201006001752.248564-4-atish.patra@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Thu, 22 Oct 2020 11:07:57 +0530
Message-ID: <CAAhSdy2z=ae1Z92p1zJeiY8tVK3Q5t739ktH3_m_k+hBWNt+sg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] riscv: Separate memory init from paging init
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201022_013810_434151_62A8A8A4 
X-CRM114-Status: GOOD (  20.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 David Hildenbrand <david@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, Zong Li <zong.li@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 linux-arch@vger.kernel.org, Jia He <justin.he@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Steven Price <steven.price@arm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Mike Rapoport <rppt@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Oct 6, 2020 at 5:48 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Currently, we perform some memory init functions in paging init. But,
> that will be an issue for NUMA support where DT needs to be flattened
> before numa initialization and memblock_present can only be called
> after numa initialization.
>
> Move memory initialization related functions to a separate function.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 1 +
>  arch/riscv/kernel/setup.c        | 1 +
>  arch/riscv/mm/init.c             | 6 +++++-
>  3 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index eaea1f717010..515b42f98d34 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -466,6 +466,7 @@ static inline void __kernel_map_pages(struct page *page, int numpages, int enabl
>  extern void *dtb_early_va;
>  void setup_bootmem(void);
>  void paging_init(void);
> +void misc_mem_init(void);
>
>  #define FIRST_USER_ADDRESS  0
>
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 2c6dd329312b..07fa6d13367e 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -78,6 +78,7 @@ void __init setup_arch(char **cmdline_p)
>  #else
>         unflatten_device_tree();
>  #endif
> +       misc_mem_init();
>
>  #ifdef CONFIG_SWIOTLB
>         swiotlb_init(1);
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index ed6e83871112..114c3966aadb 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -565,8 +565,12 @@ static void __init resource_init(void)
>  void __init paging_init(void)
>  {
>         setup_vm_final();
> -       sparse_init();
>         setup_zero_page();
> +}
> +
> +void __init misc_mem_init(void)
> +{
> +       sparse_init();
>         zone_sizes_init();
>         resource_init();
>  }
> --
> 2.25.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
