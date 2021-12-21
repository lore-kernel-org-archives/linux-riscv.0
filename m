Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A01C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 18:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VGO9H4R0jW6qWMC4F2hOJuTWW2NJGUs1LBDhqk6Fp3o=; b=wX6yqdAQ5WfKfz
	LRsSJb3RkBQIRhTZFWzhDAMIsGuRNKYsjoSr0CgNoBYx5W2jan5PMz53/lh9PblTMMsJv+KLvpcPi
	p84GZRLWb80u3oaIhgA3ogPxQxoeYfOTHqo9JOa80C5rlQQ9QCJDyWNHe039A5/9QKIe/+K1jcCgZ
	gWrbI6CEGjGr41AKd3rVySMJ75W1rtO0rpSTFlQmnQrHndcJ8TWTs2gdY7FqBxeMHQpTcbCnVuKVe
	U97j+FfigwrBkwoWk9O2UrtuU7bV+/qJD8IMKozxZwkBdCtFKYQr78p/Vvj0H9AvW2qYK265Z5S8P
	1ZjaW+dGosjBHP5tRTpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzjmH-0084Up-6G; Tue, 21 Dec 2021 18:22:21 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzjiT-0083EN-Km
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 18:18:27 +0000
Received: from mail-wm1-f46.google.com ([209.85.128.46]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MTi9N-1mubx40g3B-00U4ok for <linux-riscv@lists.infradead.org>; Tue, 21 Dec
 2021 19:18:23 +0100
Received: by mail-wm1-f46.google.com with SMTP id
 d198-20020a1c1dcf000000b0034569cdd2a2so10631wmd.5
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 10:18:23 -0800 (PST)
X-Gm-Message-State: AOAM5335R2y20huNY6Xv84OQIPTFIrYEKBJG5y0FNMiqyuUuspLPY490
 HYgtLf6wHomz+PSPzCEFv5cMlhuraFD37m7L8dg=
X-Google-Smtp-Source: ABdhPJzffr6WnaoEGTyhmBnXPy5ZleWzwlOCZ8nvVWpeF4NBAn+XXQBe16uur6o+emymJ0RcuqEtqPLnaIQ+7GdGM4I=
X-Received: by 2002:a7b:c007:: with SMTP id c7mr3663200wmb.82.1640106953460;
 Tue, 21 Dec 2021 09:15:53 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-6-guoren@kernel.org>
In-Reply-To: <20211221163532.2636028-6-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:15:37 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2XOVYB1Fm5TBdjtKx9DXoG93Zrw7TiquYL_Zy916dLwQ@mail.gmail.com>
Message-ID: <CAK8P3a2XOVYB1Fm5TBdjtKx9DXoG93Zrw7TiquYL_Zy916dLwQ@mail.gmail.com>
Subject: Re: [PATCH 05/13] riscv: compat: syscall: Add compat_sys_call_table
 implementation
To: Guo Ren <guoren@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Arnd Bergmann <arnd@arndb.de>,
 Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>,
 wefu@redhat.com, 
 Drew Fustini <drew@beagleboard.org>, wangjunqiang@iscas.ac.cn, 
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-Provags-ID: V03:K1:ZZzH+C7wBEV5ShCQ+erqeAJE6idpLczPo9+/eTi5IJnyNFgMQ3L
 BWOAA6dgP9OGqxdVrjcWwGhFXCldZzzHpW9oMBuLtxDwQQKM7KEyum2nSEKlaFoPH63Zoly
 U7D7KSZ532vALkX5AU5mMBvw1z3BPVvU8XI4xWJ7rlrzsjQPN6X5GogcnF5oB7MdCqYi646
 Vwq8gaDTre+s7NA2yQOGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:dgSqQx1NcMs=:x4XSoBrahb+8sP1f6FK1jL
 isilZZ7pooqfDSx8p74Y/NrLT/U77WM4mL9qAUieNcfQEjFIEQaS+FwrRV8EMFxNi8yHvtu7L
 bslcL0hkoDuN0Fj1NG2jrJEnEd+qWtXAjMefexE3TKw0ayFOtzqoAt5roDUqJNkUh0KmMlb0B
 UDoANX6FHA3N7LTzAKliQTzPrdp+THGbsFHtNOJ3E/VdEJ23fF+Rdu7JfvVwlWh+k7GR+Bi8F
 LarF3TemVsZePZN1OSlW7rQBm+bEZYTCxNm6H/rg3HkhAxCRc27L4J+Oc8HcuJd4dLhsT94yX
 glu2M9VaqmgW8yK3cy1XdPjOz8/r0MLpEbCnyZCiYhIKd5l7kcW8m7S23k5p7aW4f2m3egXVZ
 k+EM+xgrLli4NVXjKvRlryxjJKDDg41GZ6h2eOP79H3Hr+CNrZY5g5p/GZyy9oAuogG123BDK
 SohBZArHPhYhToKxZR9kAsIrPsrM4pLG/qRTQXrinWu9BTgJN2j60B6OoUce5kgY0RnHK89Qy
 F2VTyFG9mZaGA4ug9MVx65ZC0Y5g7LVATtrB5NAYoB15ZvuJ452pxHNLuncKN5b1sPfGzCS7U
 d/VXlAkMS9nnMjJOqC8qifpkjjAmo2wucQmXQ/eCQjf14LZn35TPuzAfDWI5PkGnZ4T/nWJ5z
 Nx0EvhrnEAjkioi48UxNdaFcdvRZv3QNA0x800R+fhiCUi/1lY6I/Pw77Igm81bImO93rUMBf
 Ztx27vnOsf1SBrPCs8/McuAfzsEYB0zZ7yr2QBMOxyBAvKWza9hFXkx/oHkWlH0ysVuyLnz0m
 vPeX3WqhehDE7/mOgJE/EJ3RUEITzlnrkKt/xkPSr1lBiRY8oA=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_101826_021624_BA33CD57 
X-CRM114-Status: GOOD (  15.02  )
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

On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
>
> From: Guo Ren <guoren@linux.alibaba.com>
>
> Implement compat_syscall_table.c with compat_sys_call_table & fixup
> system call such as truncate64,pread64,fallocate which need two
> regs to indicate 64bit-arg (copied from arm64).
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/include/asm/syscall.h         |  3 +
>  arch/riscv/kernel/compat_syscall_table.c | 84 ++++++++++++++++++++++++

Same here, I think most of these should go next to the actual syscalls, with the
duplicates removed from other platforms,

> +#define __SYSCALL_COMPAT
> +#undef __LP64__

What is the #undef for?

> +SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
> +       unsigned long, prot, unsigned long, flags,
> +       unsigned long, fd, unsigned long, offset)
> +{
> +       if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
> +               if (unlikely(!(prot & PROT_READ)))
> +                       return -EINVAL;
> +
> +       return ksys_mmap_pgoff(addr, len, prot, flags, fd, offset);
> +}

This is one that we may have to deal with separately, introducing
sys_mmap_pgoff() was a mistake in my opinion, and we should just have
added a sys_mmap2() for all architectures that don't explicitly override it.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
