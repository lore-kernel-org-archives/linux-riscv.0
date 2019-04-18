Return-Path: <SRS0=9moF=SU=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61ACCC10F0B
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:30:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3090021479
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2019 05:30:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uD8liHUp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="edeVbOaB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3090021479
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KumivKUt2p7gYcKnm0zqPChkN1Wf7D1a9oX3fRU4ozo=; b=uD8liHUpX2koR0
	NFFgtjGmCx1jSr7fKpHokCFS0if4YzAajMnqc19dV12pH90tdAZayBO76G855BvW6+unz5y46svir
	z7SzBur+JUKfQGsM+grrjeCKhOIjqbp+BkzXs2pVYrpHzCsRYnbRZqohIySyqfpqObFdObxFTLVhi
	PHmFDkMCabP50nFVb7/W11CZUQz51YRxWXtVK2Q1zBjJt4hC+IYUFwifPyTJ6eW3uMU3MP8mJ5XmD
	av4Az7hHKGfm/oO6kuoH0SgRcw9cbdL0dAeOYvkHqZEI7trxyli2M8hBumQg2dClsbvSsVTghipsJ
	OhGjrrwloJCj4Jxow9mg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hGzdJ-0002Hx-SH; Thu, 18 Apr 2019 05:30:49 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hGzdG-0002H9-A2
 for linux-riscv@lists.infradead.org; Thu, 18 Apr 2019 05:30:47 +0000
Received: by mail-vk1-xa44.google.com with SMTP id s63so207508vkg.10
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:30:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bLtDzKXu09gPBmOTPhLlCKa/1j1gZ8w+6fLRYpgkXVc=;
 b=edeVbOaBMLhN2dBQJXpv+D+6vAjewlRc9kM5lTmzsJMTYvnZuw8u8Y7DqZfh26UEgW
 OHIgnpHVLQHXols38+FJXscMQV6lYZx93+goYy0WamrsRBkh1x83txAmNxUkD0xqfkb/
 5V9w/CLbuOWB3OiL1UReRwHKvROTO3KbTfB1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bLtDzKXu09gPBmOTPhLlCKa/1j1gZ8w+6fLRYpgkXVc=;
 b=eziciwPoaBjMixe3iNShp7EmRVGAVPV2aP1qrDZLK9Yv0l+z6lfbIhPsJcgotehMXh
 Ir01fZ7ZYWGM72H7rO2lvJGO+uVNAXJGZa5WP5PgoNcpd2EHbphUMJCVmIhgIwOV+PDL
 wtKsn8GOl8BfRWYrD8bG5NfyLU4FeU1z8/c/2gVbqhP2viLsLtu3gEb8MPUu09hJT1oJ
 R0erMnswFyVSzVWEIvZh55aXtx/TOoJr0+dwC3WaHwnnWsf5Q4cfSJVC12izNeL0zsSd
 S589SyjLIxWwHKFLSYppg9QPVb8efi/NZnJX28QbERpLpZBopiyvOMV+ADUvaNfZTvso
 Wutg==
X-Gm-Message-State: APjAAAWBXGH73ijQ/TEDHPUNMRjKWgSD6OkQxRsBePETeERLeZZM9yBX
 ON3cvpOwuZ5aCcLLEy01DYlTFyp+uRk=
X-Google-Smtp-Source: APXvYqzV3yZV+h7QZxdx1UVOEyaZNO7YNc8a1xGbPbKLjjojSr0t1Nq+9qNMvdeJDRBBoYHptmBXdA==
X-Received: by 2002:a1f:7245:: with SMTP id n66mr38246839vkc.40.1555565444464; 
 Wed, 17 Apr 2019 22:30:44 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com.
 [209.85.217.53])
 by smtp.gmail.com with ESMTPSA id 8sm298862vkw.38.2019.04.17.22.30.43
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Apr 2019 22:30:43 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id n4so515539vsm.3
 for <linux-riscv@lists.infradead.org>; Wed, 17 Apr 2019 22:30:43 -0700 (PDT)
X-Received: by 2002:a67:e881:: with SMTP id x1mr52185580vsn.48.1555565442783; 
 Wed, 17 Apr 2019 22:30:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190417052247.17809-1-alex@ghiti.fr>
 <20190417052247.17809-9-alex@ghiti.fr>
In-Reply-To: <20190417052247.17809-9-alex@ghiti.fr>
From: Kees Cook <keescook@chromium.org>
Date: Thu, 18 Apr 2019 00:30:31 -0500
X-Gmail-Original-Message-ID: <CAGXu5j+-M5VGsPqZ6JyqH6w=HP9NLK2KEAQqen99ssUg5mC89A@mail.gmail.com>
Message-ID: <CAGXu5j+-M5VGsPqZ6JyqH6w=HP9NLK2KEAQqen99ssUg5mC89A@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] mips: Properly account for stack randomization
 and stack guard gap
To: Alexandre Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190417_223046_352132_4A7DD74D 
X-CRM114-Status: GOOD (  16.69  )
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

On Wed, Apr 17, 2019 at 12:31 AM Alexandre Ghiti <alex@ghiti.fr> wrote:
>
> This commit takes care of stack randomization and stack guard gap when
> computing mmap base address and checks if the task asked for randomization.
> This fixes the problem uncovered and not fixed for mips here:
> https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg1429066.html

same URL change here please...

>
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>

Acked-by: Kees Cook <keescook@chromium.org>

-Kees

> ---
>  arch/mips/mm/mmap.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/mips/mm/mmap.c b/arch/mips/mm/mmap.c
> index 2f616ebeb7e0..3ff82c6f7e24 100644
> --- a/arch/mips/mm/mmap.c
> +++ b/arch/mips/mm/mmap.c
> @@ -21,8 +21,9 @@ unsigned long shm_align_mask = PAGE_SIZE - 1; /* Sane caches */
>  EXPORT_SYMBOL(shm_align_mask);
>
>  /* gap between mmap and stack */
> -#define MIN_GAP (128*1024*1024UL)
> -#define MAX_GAP ((TASK_SIZE)/6*5)
> +#define MIN_GAP                (128*1024*1024UL)
> +#define MAX_GAP                ((TASK_SIZE)/6*5)
> +#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))
>
>  static int mmap_is_legacy(struct rlimit *rlim_stack)
>  {
> @@ -38,6 +39,15 @@ static int mmap_is_legacy(struct rlimit *rlim_stack)
>  static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
>  {
>         unsigned long gap = rlim_stack->rlim_cur;
> +       unsigned long pad = stack_guard_gap;
> +
> +       /* Account for stack randomization if necessary */
> +       if (current->flags & PF_RANDOMIZE)
> +               pad += (STACK_RND_MASK << PAGE_SHIFT);
> +
> +       /* Values close to RLIM_INFINITY can overflow. */
> +       if (gap + pad > gap)
> +               gap += pad;
>
>         if (gap < MIN_GAP)
>                 gap = MIN_GAP;
> --
> 2.20.1
>

-- 
Kees Cook

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
