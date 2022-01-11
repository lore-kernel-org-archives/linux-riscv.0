Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B9EC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Jan 2022 02:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bn4b3M7p0y47Yr3AATV5t2ZPj0WLtLVH0T7gnVb3NBc=; b=zoEepVnVrdPTeV
	fUMcKOV/M3fMnAWyj/m/4MH/Zkg5dFhJ0N2tV1jvX7FLXxQKM5NSG7wMcc5UPaL3liEwBjWVZ4Jdi
	B344mTk3aIiS/FBhXq9NF0iyHhWjOdWnShp5wdwD7RBDZmShWzU3kPxxdm3MNwEYfirOR/i6d6D5r
	jG80j+DI0Ifsi1wYUWTzPlc6P/SB6w+HJ5020Vf4hiB27d6z7JNckJszrnWyTCdKIp4qPAbKF+mAV
	GGKRcW50c3Uf7AA+aJkV9Dm34I+71XpQ6nNTmWVIRxB02UOLvIEmqfWVhTE+cCsSdnFmBTxh2TJRg
	x+Esv/AAUKBP0dSHO/bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7782-00EJy1-Mt; Tue, 11 Jan 2022 02:43:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n777p-00EJve-Hv; Tue, 11 Jan 2022 02:43:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 63E9D614CA;
 Tue, 11 Jan 2022 02:43:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D8D7C36AF6;
 Tue, 11 Jan 2022 02:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1641868983;
 bh=L7cfkATlDL/kbJDiU7W4pEz2E1DRcTSkpRrIsXKoHAM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SvBicDJ5I4L17UeymXOnn+zXfU1+dI5QyZoF1LCEXlf0yCWlKHAjuGj6so61+/QfU
 HJiiITRYEIScN5TUKfXXHUPUOhJCP1qnsdaJYqd9cqMpwk6NfY8hmSMP6UjJfoG4nl
 q/XhPuDumR/UafFefFg6SGZC5tLySoBC2B8E6QzBRv5shP7zZyzeTFtr/p8mWXkxpM
 3aT84vcWQHJh3V4V61GwpdI1p1gINCGDj31zN673RdKFMIXO7FjZgrYJBVIjbsF6eh
 HuAKmKKceppLTR7sWBvVavZJnrprlijapFGEhzEcCsl7NH3HmnmvScQcaLSyxoT9pV
 8k1oU8bT9yEIQ==
Received: by mail-ua1-f47.google.com with SMTP id h11so5306925uar.5;
 Mon, 10 Jan 2022 18:43:03 -0800 (PST)
X-Gm-Message-State: AOAM530bIGeH7rnFTaCxSl/RdJaH/jbppWswBW4WTj+HKaa//cLGt71J
 FyXoldrv9W9am9EwUfBvvSvkQlW+YhSSkj1mLTc=
X-Google-Smtp-Source: ABdhPJx2b4iOxBpQ9IOExNK2lhBMZAT9iocMb0nW0FEEl0sIdbHpU9vbDvP58kvQ6UoDTDuHXXLmA3s1gjGYrCCrjOU=
X-Received: by 2002:a05:6102:1009:: with SMTP id
 q9mr1248576vsp.22.1641868982282; 
 Mon, 10 Jan 2022 18:43:02 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-12-guoren@kernel.org>
 <CAK8P3a0H2Nq=bFdzWGzzGuFWP85JA7=Td6_rb8GqOF3bYCRJBw@mail.gmail.com>
In-Reply-To: <CAK8P3a0H2Nq=bFdzWGzzGuFWP85JA7=Td6_rb8GqOF3bYCRJBw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 11 Jan 2022 10:42:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQCJ2W2wgdTVpdCoD0ycTkRd1jvfweknjq=t+PrW8QjKg@mail.gmail.com>
Message-ID: <CAJF2gTQCJ2W2wgdTVpdCoD0ycTkRd1jvfweknjq=t+PrW8QjKg@mail.gmail.com>
Subject: Re: [PATCH V2 11/17] riscv: compat: Add elf.h implementation
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, inux-parisc@vger.kernel.org, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "the arch/x86 maintainers" <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_184305_725732_521277B2 
X-CRM114-Status: GOOD (  28.59  )
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

On Mon, Jan 10, 2022 at 10:29 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Implement necessary type and macro for compat elf. See the code
> > comment for detail.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Signed-off-by: Guo Ren <guoren@kernel.org>
> > Cc: Arnd Bergmann <arnd@arndb.de>
>
> This looks mostly correct,
>
> > +/*
> > + * FIXME: not sure SET_PERSONALITY for compat process is right!
> > + */
> > +#define SET_PERSONALITY(ex)                                               \
> > +do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)                         \
> > +               set_thread_flag(TIF_32BIT);                                \
> > +       else                                                               \
> > +               clear_thread_flag(TIF_32BIT);                              \
> > +       set_personality(PER_LINUX | (current->personality & (~PER_MASK))); \
> > +} while (0)
>
> This means the personality after exec is always set to PER_LINUX, not
> PER_LINUX32, which I think is wrong: you want the PER_LINUX32
> setting to stick, just like the upper bits do in the default implementation.
>
> What the other ones do is:
>
> | arch/parisc/include/asm/elf.h-
> set_personality((current->personality & ~PER_MASK) | PER_LINUX); \
>
> This looks like the same problem you introduce here: always forcing PER_LINUX
> instead of PER_LINUX32 makes it impossible to use PER_LINUX32.
>
> | arch/alpha/include/asm/elf.h:#define SET_PERSONALITY(EX)
>                            \
> | arch/alpha/include/asm/elf.h-   set_personality(((EX).e_flags &
> EF_ALPHA_32BIT)         \
> | arch/alpha/include/asm/elf.h-      ? PER_LINUX_32BIT : PER_LINUX)
> | arch/csky/include/asm/elf.h:#define SET_PERSONALITY(ex)
> set_personality(PER_LINUX)
> | arch/nds32/include/asm/elf.h:#define SET_PERSONALITY(ex)
> set_personality(PER_LINUX)
>
> These look even worse: instead of forcing the lower bits to
> PER_LINUX/PER_LINUX32 and
> leaving the upper bits untouched, these also clear the upper bits
> unconditionally.
>
> | arch/arm64/include/asm/elf.h:#define SET_PERSONALITY(ex)
>                                    \
> | arch/arm64/include/asm/elf.h-   current->personality &=
> ~READ_IMPLIES_EXEC;                     \
> | arch/x86/um/asm/elf.h:#define SET_PERSONALITY(ex) do {} while(0)
> | arch/x86/include/asm/elf.h:#define set_personality_64bit()      do {
> } while (0)
> | arch/x86/kernel/process_64.c:static void __set_personality_ia32(void)
> |         current->personality |= force_personality32;
>
> Inconsistent: does not enforce PER_LINUX/PER_LINUX32 as the default
> implementation
> does, but just leaves the value untouched (other than (re)setting
> READ_IMPLIES_EXEC).
> I think this is harmless otherwise, as we generally ignore the lower
> bits, except for the
> bit of code that checks for PER_LINUX32 in override_architecture() to mangle the
> output of sys_newuname() or in /proc/cpuinfo.
>
> | arch/s390/include/asm/elf.h-    if
> (personality(current->personality) != PER_LINUX32)   \
> | arch/s390/include/asm/elf.h-            set_personality(PER_LINUX |
>                    \
> | arch/s390/include/asm/elf.h-
> (current->personality & ~PER_MASK));    \
> | arch/powerpc/include/asm/elf.h- if
> (personality(current->personality) != PER_LINUX32)   \
> | arch/powerpc/include/asm/elf.h-         set_personality(PER_LINUX |
>                    \
> | arch/powerpc/include/asm/elf.h-
> (current->personality & (~PER_MASK)));  \
> | arch/sparc/include/asm/elf_64.h-        if
> (personality(current->personality) != PER_LINUX32)   \
> | arch/sparc/include/asm/elf_64.h-
> set_personality(PER_LINUX |             \
> | arch/sparc/include/asm/elf_64.h-
> (current->personality & (~PER_MASK)));  \
>
> This is probably the behavior you want to copy.
Thank you very much for your detailed explanation. Here is my modification.

+#define SET_PERSONALITY(ex)                                    \
+do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)              \
+               set_thread_flag(TIF_32BIT);                     \
+       else                                                    \
+               clear_thread_flag(TIF_32BIT);                   \
+       if (personality(current->personality) != PER_LINUX32)   \
+               set_personality(PER_LINUX |                     \
+                       (current->personality & (~PER_MASK)));  \
+} while (0)

>
>       Arnd




--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
