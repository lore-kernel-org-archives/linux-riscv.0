Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2A4C43334
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0qxdiWuzlr73Bi8InSeZQRiiCt8bwVo/7YOSlWjzh68=; b=JEvx9WxDv4P9oL
	wKxLTcu3N7bhe3Z2zB8e/4qt6oJKHZeRU4rFq+RjHoBiBYE2iCHXiMAjCe3mt5q8UpeX0TYZuUOZw
	SVMZLUhLROjTYFxQeSa8LABYJjGWPGXYaSXEGpwEmca2IHL2NRw6TtgtR2LyWRc0zUfUovOUPL0Zk
	yu0VHkFYHPqG+7lZr6fM/dgDfFkiCBjA+aJ712znbtKWNCRbWw8n6Ojq7fMmuTfS3T9zhdf8EjRB1
	Wbskl6LTcY7xvCJLV0mCLfmtSmMZo0QmRdIugT7jt8AAE+qxcm8iBnhaGuxeHQh8fsyQ6I9VIx/8D
	VSEuBzE8UYoo/VC4okYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lNG-001WeC-HO; Thu, 16 Jun 2022 09:01:10 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1lNE-001Wbn-6R
	for linux-riscv@lists.infradead.org; Thu, 16 Jun 2022 09:01:09 +0000
Received: by mail-ot1-x32f.google.com with SMTP id l24-20020a0568301d7800b0060c1ebc6438so591847oti.9
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jun 2022 02:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4KI+vqkVd3U+AwA0B+3Ud5dZ0U8+zSxSSdvkttM9Tlc=;
        b=CACGrnLaXZZ/zhLy+RxOe+XiuNZtNY4TxUJLmFgUEAyqwGxyrd+SMKkG+XT57tK2Lh
         WAJBVGSuv5cT5zGKDMU1NE3YapCFM07clOGiPDdTtsDfCGHtbfsrKhAUocvZFn8fWn1E
         /XHnb1logiQ3DSz9kC7f9YhvsFieJz7moB2OwnsYHd4qWwhXFgW7Ig/yWZ4bRzJ83pzk
         1fUut5zL0SI1GGL41WubjENzGS2Nlh+BuvBaDmuU4GG2oWd4EaJgFYjTZ9ZYIvd2fnvP
         CVKBUKI0a210HFvrXSHLNgmzylVJn2uCnqqk3/GMDgv8v4ta2hNQqrxAtCPc/Gks+yQD
         bxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4KI+vqkVd3U+AwA0B+3Ud5dZ0U8+zSxSSdvkttM9Tlc=;
        b=qBLYvPGL/7xD0b9ZJicJNAu+uZb8ghSsOkwDjYTOa8ht4xjtlDjLJ5NoiAlvcyWUy7
         lOwqXdDE6rACGENIpu+IfPERO8lHDTFd5Lc6nrCJ6OSveltSVljDVl53HZsE4aJBtR/h
         Tq5V7XqZCCxEdygIy+PWHfxBC20+3bfS9mxcFn4m2k/E5rZI9Zy/Pvrj8u6FGVSZ3rEa
         qw6T9GkiAA1/spwFdKAAPwmgsMkII3ppUa4/3lomqG+MS0SjksKNyluP9G6X24ClD3T6
         M1pSeHvXJ8HOISxTKbcdsE15p7pALXJD7+q5Al/cLunIHLu5in9o+nO87j2BqybMb+EJ
         6CAw==
X-Gm-Message-State: AJIora8vZGI/luPy1a1/yyQdPKcyKusHUQC6tEVqRLBzDpYXXCnpqgag
	caSpLxP/yT9sI8zAbXiYC3WGA89asjjR7pYP/NWSdQ==
X-Google-Smtp-Source: AGRyM1v0W54196g73fTBFtbq9rTCdaj9K4TFlrSBX8ahZFW7pdGdp8JWtEiNJqEhneuI3r/tj9e3rV4Tydntm3JTr6Y=
X-Received: by 2002:a05:6830:1bdc:b0:60c:4044:1741 with SMTP id
 v28-20020a0568301bdc00b0060c40441741mr1529894ota.297.1655370064259; Thu, 16
 Jun 2022 02:01:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220609071833.1051941-1-andy.chiu@sifive.com> <20220609071833.1051941-3-andy.chiu@sifive.com>
In-Reply-To: <20220609071833.1051941-3-andy.chiu@sifive.com>
From: Andy Chiu <andy.chiu@sifive.com>
Date: Thu, 16 Jun 2022 16:57:40 +0800
Message-ID: <CABgGipUzGu+gs6X09d4dGwHoLx6COGr7M0NuuWUBH6tfKKWcDA@mail.gmail.com>
Subject: Re: [PATCH riscv/for-next 2/4] riscv: export patch_insn_write
To: aou@eecs.berkeley.edu, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, rostedt@goodmis.org, mingo@redhat.com, 
	linux-riscv@lists.infradead.org, guoren@linux.alibaba.com
Cc: Greentime Hu <greentime.hu@sifive.com>, Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220616_020108_274541_312DD26D 
X-CRM114-Status: GOOD (  14.43  )
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

On Thu, Jun 9, 2022 at 3:21 PM Andy Chiu <andy.chiu@sifive.com> wrote:
>
> So that we may patch code without issuing fence.i
>
> Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
> Reviewed-by: Greentime Hu <greentime.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> Acked-by: Steven Rostedt (Google) <rostedt@goodmis.org>
> ---
>  arch/riscv/include/asm/patch.h | 1 +
>  arch/riscv/kernel/patch.c      | 4 ++--
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/include/asm/patch.h b/arch/riscv/include/asm/patch.h
> index 9a7d7346001e..327e99114d67 100644
> --- a/arch/riscv/include/asm/patch.h
> +++ b/arch/riscv/include/asm/patch.h
> @@ -6,6 +6,7 @@
>  #ifndef _ASM_RISCV_PATCH_H
>  #define _ASM_RISCV_PATCH_H
>
> +int patch_insn_write(void *addr, const void *insn, size_t len);
>  int patch_text_nosync(void *addr, const void *insns, size_t len);
>  int patch_text(void *addr, u32 insn);
>
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 765004b60513..6f7757ce50dc 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -49,7 +49,7 @@ static void patch_unmap(int fixmap)
>  }
>  NOKPROBE_SYMBOL(patch_unmap);
>
> -static int patch_insn_write(void *addr, const void *insn, size_t len)
> +int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>         void *waddr = addr;
>         bool across_pages = (((uintptr_t) addr & ~PAGE_MASK) + len) > PAGE_SIZE;
> @@ -78,7 +78,7 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>  }
>  NOKPROBE_SYMBOL(patch_insn_write);
>  #else
> -static int patch_insn_write(void *addr, const void *insn, size_t len)
> +int patch_insn_write(void *addr, const void *insn, size_t len)
>  {
>         return copy_to_kernel_nofault(addr, insn, len);
>  }
> --
> 2.36.0
>

Loop in: Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
