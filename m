Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0F3C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Dec 2021 09:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LL37MVq4c8CC4XWnjAs3jh/dsvo8qgWfGfaGiZnx6PI=; b=rsO7xC798ZuJyf
	qZq9WgAmEt4sXlWhAiNpz8GobPQK/FfdOd+rz/KNg8tGHWtDjlmzpd2ILgI4NDIk8RNlMzyZ77rTF
	RZHjAUAiyAis/2fk6Ne36/EZV1iDj8nASlmvT9821/FYbjmOvFBaSw0cKOxXOtbZ7wcpef5LgjE27
	vBB/DVOVJkxF/ax9Ohd2tN4sDmWha2FLGTkvP8Yu5yq5rSHgxoplt7w47XAE+e2tEhhcrju5A65ok
	n9GlOu7TIK8z+KgjNWfxPh2rScWv3QgAfVb6O3fANsRdxeg4Pgon7c6GXPfzLLd0inwA7Hb05VTUI
	6DCjIhOcPbqgq3qb5wSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzEhX-001MQv-PG; Mon, 20 Dec 2021 09:11:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzEhU-001MPv-J8
 for linux-riscv@lists.infradead.org; Mon, 20 Dec 2021 09:11:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6BFB760F45
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 09:11:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9951AC36AF4
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 09:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639991477;
 bh=nEOzzl3wgkRPT0ygPKzT3y34sfnV1NTZVShiBXQle80=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=S+pQs5PylnYAzTQdboNEcFEcb/0jEv235YQ31EGzXeMNcNWFYDzI2wRBRs75VPCZo
 A6o71kUHuefFXz25TPekWC/tqGShH7/xuyF2uQNXW7aoNHBBi4OjIfgWj5nrvpv9wE
 fTk9wXuIR2O5A1JgAo1v4ectbqb9S3o8AkF8SjZfqjIJmcCFPexSnyuvnFZ+aaXfsQ
 VYHbHoSqvDIVC2KRrygV2Gxe0WKtX3SJn7BEv+uULTy6pa33iGoYu5CW0f11JRgCDI
 sNZ2pODyIgIxISqGX9atx2cRHiRqV8gVCiyVP0CM+nIdkCFsnU37aWYtREBkmMGthR
 7QlP2UUR7W5+w==
Received: by mail-ua1-f49.google.com with SMTP id u40so16489471uad.1
 for <linux-riscv@lists.infradead.org>; Mon, 20 Dec 2021 01:11:17 -0800 (PST)
X-Gm-Message-State: AOAM532Wr7x8//dlP8wj6O8H7b7RUMsmJs0kp613oOGUNXg5uOH3UgPi
 oj/oSEG1MzZF7S6NLspkKXwSM23M5LHIo6W5urE=
X-Google-Smtp-Source: ABdhPJwE5vVG3rt8d+HcTmKlAQnW1OXabBV+eLKlgaa5VIIm58YsDnEYQVdu+coTipMz0kob8hRz5mDIgjhyqqjdiuc=
X-Received: by 2002:ab0:3055:: with SMTP id x21mr4783242ual.97.1639991476313; 
 Mon, 20 Dec 2021 01:11:16 -0800 (PST)
MIME-Version: 1.0
References: <20211206104657.433304-1-alexandre.ghiti@canonical.com>
 <20211206104657.433304-13-alexandre.ghiti@canonical.com>
In-Reply-To: <20211206104657.433304-13-alexandre.ghiti@canonical.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 20 Dec 2021 17:11:05 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQEHv1dVzv=JNCYSzD8oh6UxYOFRTdBOp-FFeeeOhSJrQ@mail.gmail.com>
Message-ID: <CAJF2gTQEHv1dVzv=JNCYSzD8oh6UxYOFRTdBOp-FFeeeOhSJrQ@mail.gmail.com>
Subject: Re: [PATCH v3 12/13] riscv: Initialize thread pointer before calling
 C functions
To: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, 
 Anup Patel <anup@brainfault.org>, Atish Patra <Atish.Patra@rivosinc.com>, 
 Christoph Hellwig <hch@lst.de>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, 
 Alexander Potapenko <glider@google.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, 
 Dmitry Vyukov <dvyukov@google.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Kees Cook <keescook@chromium.org>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>, panqinglin2020@iscas.ac.cn, 
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kasan-dev@googlegroups.com, 
 linux-efi@vger.kernel.org, linux-arch <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_011120_755516_43D561C7 
X-CRM114-Status: GOOD (  19.72  )
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

On Tue, Dec 7, 2021 at 11:55 AM Alexandre Ghiti
<alexandre.ghiti@canonical.com> wrote:
>
> Because of the stack canary feature that reads from the current task
> structure the stack canary value, the thread pointer register "tp" must
> be set before calling any C function from head.S: by chance, setup_vm
Shall we disable -fstack-protector for setup_vm() with __attribute__?
Actually, we've already init tp later.

> and all the functions that it calls does not seem to be part of the
> functions where the canary check is done, but in the following commits,
> some functions will.
>
> Fixes: f2c9699f65557a31 ("riscv: Add STACKPROTECTOR supported")
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  arch/riscv/kernel/head.S | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index c3c0ed559770..86f7ee3d210d 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -302,6 +302,7 @@ clear_bss_done:
>         REG_S a0, (a2)
>
>         /* Initialize page tables and relocate to virtual addresses */
> +       la tp, init_task
>         la sp, init_thread_union + THREAD_SIZE
>         XIP_FIXUP_OFFSET sp
>  #ifdef CONFIG_BUILTIN_DTB
> --
> 2.32.0
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
