Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1A9C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jan 2022 14:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=reX+PqQq+bb5os7eZ2VRH5jZ/WXvjy9FICchFeXOHlQ=; b=awWgO/pi44Kw4J
	Hr002wsVaKwOJUkzTDc/F9QOjG47zQxIB4n5QGs0yp52IxEf9CHPklVcGldmGxArFXk+esNy0sxFQ
	eEWP9YTBvf+U4E1zSKfxQVtdO8NvWNP4F2BpQDqsNNwBQE9cXqKNTgZxPApA6+fdAkdQXdhr34jHM
	jQO+s1OQjXd9cT0KzC9ek7EbP9tXYCspakt39Drzqf2CS+VhoFmpa/uYbz51NjBLJJmed4OYdHa/H
	KoYRBPFiK9vGVT6D0WUk6ctxKxwx9qZG81wC7kTJUoMKzD3S8KM3oDzjnxCjWOLsx4mKnUAbWzkNP
	5uzOp53VddPOsAbwCJtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6vfc-00BoXP-K5; Mon, 10 Jan 2022 14:29:12 +0000
Received: from mout.kundenserver.de ([217.72.192.74])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6vfP-00BoSo-UM; Mon, 10 Jan 2022 14:29:01 +0000
Received: from mail-wr1-f54.google.com ([209.85.221.54]) by
 mrelayeu.kundenserver.de (mreue107 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MFbmS-1n8dol1Z78-00HAUI; Mon, 10 Jan 2022 15:28:57 +0100
Received: by mail-wr1-f54.google.com with SMTP id e9so25632405wra.2;
 Mon, 10 Jan 2022 06:28:57 -0800 (PST)
X-Gm-Message-State: AOAM530yNRJ38WrlCa1IAqGOF0Hmvs5TgwMlH0WfTSB/ceTCkl/wjI2t
 wkL7xHeHJoTaLxTfWIFY8YdAwL8VK/Zrj5ZXB2Y=
X-Google-Smtp-Source: ABdhPJwP2dj7vwEXcQpaQSkksNl0ZEmP7KqS5c95/LhZe5KvkABgHfbU/HDC2zAjxcbRJXknKfqyiFGKdYDX7S/ttBs=
X-Received: by 2002:a05:6000:16c7:: with SMTP id
 h7mr17539097wrf.317.1641824936821; 
 Mon, 10 Jan 2022 06:28:56 -0800 (PST)
MIME-Version: 1.0
References: <20211228143958.3409187-1-guoren@kernel.org>
 <20211228143958.3409187-12-guoren@kernel.org>
In-Reply-To: <20211228143958.3409187-12-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Mon, 10 Jan 2022 15:28:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0H2Nq=bFdzWGzzGuFWP85JA7=Td6_rb8GqOF3bYCRJBw@mail.gmail.com>
Message-ID: <CAK8P3a0H2Nq=bFdzWGzzGuFWP85JA7=Td6_rb8GqOF3bYCRJBw@mail.gmail.com>
Subject: Re: [PATCH V2 11/17] riscv: compat: Add elf.h implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
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
X-Provags-ID: V03:K1:PHrVTGniCiPr1a8aPpoWxmh8TkwPq+i/YJj+jiQ9PAFOKTaCK6B
 XwccnGAiv3guVMyidZdjvVSVm3jNU9Q5ZJ78bp11WxA8A4/9NAot+IzCn2o6BoFhMdDNlOP
 vsThvvk48TAmphNuX6AhgIDHSIcgm2IHxJSjsHP6NOQEYICTvkzfozgwnDtCt+WXTxhvKZn
 M8tIzzCFUozE0uPEohkqg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8Wavrdlb/hA=:qjd0beBFn5JyRCAWsEnqHH
 C1a2WMWkbb18wpPEe5vMo44HJ6OSohJSVVnTfBU6YkXHapoBED9Qgaq3SUFgxiBvp8g11oQVR
 VCf0JlIkeIEoGQNnuoi1R9THjv8inHNRMAv8KxkRxs0xeISdqPXH6KrshzBaqn/UYXRUnHG3K
 VHJ3p6+189Tp5ZeEeGJh6i/xYJGaREASq6ZdlGErDgJtiN40RJncSlgLyvBg6NjEb0JtB9VF5
 3K6SRTHDrOwirq+0+N65aLemlPHpTV0RuKjWynYfi7QFERCBODeQ3cN15B2PRZBmFjXjYWv1C
 qCNqpzhbVBe2xz6KsISxTCh6ENEi6bhINf9ouKYW8eDNAfQ5GYBcVGZVsLW5oNWdvt1/Kr3ec
 MzJ6GYxqXCZRqFj4EqxzCKSz4wC9E3q+J1pDjMA7GwTRwf9tO0qtMqhhmM7y+ZeVk8bMnmwpr
 XWSJqn42tmHt5QYfGm/WuJmXtuuCUzCL9y8ubI/Q7XJFfmSRUIlVU1lJzhXxyjoXx4Hxf7MBH
 33vhfRJGPJ6uIAtEQEZMglgJXqmazuUGPmeZAJLUe7ybvUSbfoAuBuKzIZLRJw7Dd/wRZkc0H
 3tI8IfOeDDUGq9prk3P4lMdsaL/gHqk7IYnmTniQPztKoRzxDDI0OtgupRxZI36nOhCI/6J9M
 2AId345zB2+E7XEsKYqaR6bXx/kqKPcWcecdOUkwqt//TFWXrVe7eR35PzR/v8g/p8RG2L1pH
 6cPkjoRVSFL0TtOQOTfXFQOiKE1fvEnHMj9BRU5T8hfnxZiLUUBbfweHQkHFi/j6rfafmBxgy
 fXIYHzB2A1OvYyAlFfx7Ij9SQHsaUA8IEq2T4qnP7Ddos9o2+M=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_062900_308313_25697C60 
X-CRM114-Status: GOOD (  16.39  )
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

On Tue, Dec 28, 2021 at 3:39 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement necessary type and macro for compat elf. See the code
> comment for detail.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>

This looks mostly correct,

> +/*
> + * FIXME: not sure SET_PERSONALITY for compat process is right!
> + */
> +#define SET_PERSONALITY(ex)                                               \
> +do {    if ((ex).e_ident[EI_CLASS] == ELFCLASS32)                         \
> +               set_thread_flag(TIF_32BIT);                                \
> +       else                                                               \
> +               clear_thread_flag(TIF_32BIT);                              \
> +       set_personality(PER_LINUX | (current->personality & (~PER_MASK))); \
> +} while (0)

This means the personality after exec is always set to PER_LINUX, not
PER_LINUX32, which I think is wrong: you want the PER_LINUX32
setting to stick, just like the upper bits do in the default implementation.

What the other ones do is:

| arch/parisc/include/asm/elf.h-
set_personality((current->personality & ~PER_MASK) | PER_LINUX); \

This looks like the same problem you introduce here: always forcing PER_LINUX
instead of PER_LINUX32 makes it impossible to use PER_LINUX32.

| arch/alpha/include/asm/elf.h:#define SET_PERSONALITY(EX)
                           \
| arch/alpha/include/asm/elf.h-   set_personality(((EX).e_flags &
EF_ALPHA_32BIT)         \
| arch/alpha/include/asm/elf.h-      ? PER_LINUX_32BIT : PER_LINUX)
| arch/csky/include/asm/elf.h:#define SET_PERSONALITY(ex)
set_personality(PER_LINUX)
| arch/nds32/include/asm/elf.h:#define SET_PERSONALITY(ex)
set_personality(PER_LINUX)

These look even worse: instead of forcing the lower bits to
PER_LINUX/PER_LINUX32 and
leaving the upper bits untouched, these also clear the upper bits
unconditionally.

| arch/arm64/include/asm/elf.h:#define SET_PERSONALITY(ex)
                                   \
| arch/arm64/include/asm/elf.h-   current->personality &=
~READ_IMPLIES_EXEC;                     \
| arch/x86/um/asm/elf.h:#define SET_PERSONALITY(ex) do {} while(0)
| arch/x86/include/asm/elf.h:#define set_personality_64bit()      do {
} while (0)
| arch/x86/kernel/process_64.c:static void __set_personality_ia32(void)
|         current->personality |= force_personality32;

Inconsistent: does not enforce PER_LINUX/PER_LINUX32 as the default
implementation
does, but just leaves the value untouched (other than (re)setting
READ_IMPLIES_EXEC).
I think this is harmless otherwise, as we generally ignore the lower
bits, except for the
bit of code that checks for PER_LINUX32 in override_architecture() to mangle the
output of sys_newuname() or in /proc/cpuinfo.

| arch/s390/include/asm/elf.h-    if
(personality(current->personality) != PER_LINUX32)   \
| arch/s390/include/asm/elf.h-            set_personality(PER_LINUX |
                   \
| arch/s390/include/asm/elf.h-
(current->personality & ~PER_MASK));    \
| arch/powerpc/include/asm/elf.h- if
(personality(current->personality) != PER_LINUX32)   \
| arch/powerpc/include/asm/elf.h-         set_personality(PER_LINUX |
                   \
| arch/powerpc/include/asm/elf.h-
(current->personality & (~PER_MASK)));  \
| arch/sparc/include/asm/elf_64.h-        if
(personality(current->personality) != PER_LINUX32)   \
| arch/sparc/include/asm/elf_64.h-
set_personality(PER_LINUX |             \
| arch/sparc/include/asm/elf_64.h-
(current->personality & (~PER_MASK)));  \

This is probably the behavior you want to copy.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
