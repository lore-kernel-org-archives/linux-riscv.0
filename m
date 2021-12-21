Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8A47C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NNQOooH4EmJv7vZV/vxz5DgUelGKXRIdpndaIoeUHgE=; b=ePdcjQZNyAPwW3
	6/UWs3apkzMs+vZKG4t7q2VIkqfD7hq60sVd8m0jPeUuh3diLNIh94M+HsS6INoVyRlPb14tjHH6H
	fw+OwUOWudWK+OYXZBDoWOhapRPoMEeWjUp/7OdsHtvzdft34bdOCISBrgO+QzTIlVoi1NOYRjE7y
	W27mM+y3nk0fHiMdjr0solXwtoaKH9M4H+QeLf7UYLE73MJNQkxF0lJH3R/1HGqqi7JwE70E4uB2B
	ByZ8EGGqM5d0kIvLwayBvT1T3yol1UpgtKZaXFj4m7W3RE5fZOETyGYi8k2V+CGvUacQmnIIAoULc
	hC0VBb0Xj3nxp0TznycA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzihK-007kN2-Dx; Tue, 21 Dec 2021 17:13:10 +0000
Received: from mout.kundenserver.de ([212.227.17.13])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzidM-007iZc-Ey
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 17:09:06 +0000
Received: from mail-wm1-f43.google.com ([209.85.128.43]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N3sNa-1mHxld3fou-00zr0h for <linux-riscv@lists.infradead.org>; Tue, 21
 Dec 2021 18:09:01 +0100
Received: by mail-wm1-f43.google.com with SMTP id l4so63831wmq.3
 for <linux-riscv@lists.infradead.org>; Tue, 21 Dec 2021 09:09:01 -0800 (PST)
X-Gm-Message-State: AOAM5307YdjsvTsXr1mppDuu3Sg4lCVzSD/+GkV7NfnrlROaEiLMO3de
 UXLayLV4Fbz7b6ZAGCpb1hYznuoIMBqZqcit4KQ=
X-Google-Smtp-Source: ABdhPJwBjfG8n5UL3gUcPzQHQGqJD8jdtXydpXBiVw9zz8vMTxK4PxCyGzOYKywQHcSPDIX78gSsHjw/vuP33ZnB2VQ=
X-Received: by 2002:a1c:8013:: with SMTP id b19mr3463956wmd.35.1640106541291; 
 Tue, 21 Dec 2021 09:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-2-guoren@kernel.org>
In-Reply-To: <20211221163532.2636028-2-guoren@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 21 Dec 2021 18:08:45 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1fC8aro3kHLvGMVDdvVYjaQdxJeGur9ac=11+6=r0Xyg@mail.gmail.com>
Message-ID: <CAK8P3a1fC8aro3kHLvGMVDdvVYjaQdxJeGur9ac=11+6=r0Xyg@mail.gmail.com>
Subject: Re: [PATCH 01/13] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
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
X-Provags-ID: V03:K1:jVtXffS1cYeqhVKBNLcTR62VXO0Xd1EkXF31W9sEHllgBQpOm+9
 LcF5ERj7eojlztKZubidBGm11qoY2rxjyEOskSXljZTVh/2S/Xsd5Mrg72ZCxJ+Hp2+0URS
 s6EyXcZWl+GfnPQ2Z4gNuelZOjRfCqtMBpOlDzz4OGFpW4b86Lhqhq8DsivFwS7FoYXXvDK
 a9ql8wnNzA5K2W8iksO0w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:V0pDdgU95qs=:vr1wkuggAGx67ZSzWXFaDu
 s72zFWS6IISwLw2gqdHCMHL2j9FD+oWPp7dEf6NjnmqIkMZucjj5ucMk2RuAHgGe46GTzHB+e
 7cWN/1S0XfvconEcUVT+AiPELa1TMQe5CPG0NsigP4VBKAcd/ohscXI8Fvy1q0+TlWUZewnqh
 rIRec9YI8Z5tB3/Z6ySbU0UycznYw7b9DvVnB8FWmL6oIIXiUtBVyHDvDMrd20iHG00A+D25z
 7Gg84rEUUGRjv87NUPBRTNaoK+8nEsLUbs1qIqWPw7ea54QYhGmMSbdAuUCp7um/79uVCUdVn
 /DpZR9hZuasRG/l8c/IKZuDVZtgtDVMPUZP+8SkYDyTuV7V30nyQ3ZhfDiG5kbg23tF5eJbiT
 L8rPibmnloi/MWNQiA7UyMZ2le69mcGvHE/zGba4O35/avqMlhGMUvBjfDRJV7zJo0hcWh+WO
 k81ooC1n3QmHngWcgyA+QtgnSbOh4sXOKkPeL3qAhz89Caed40GVHfrmmLbLtlRH1g6rkZTu0
 8F+xe8BMMj48r/UWt9Va0WTn1jM2O+IdWkgJyq8KYgmkDOO1YEcfo9aCX3x8Fx9vj/uNalEHS
 cjBaUSfs0hgzlzxAksoFETDxV91rpXCbXOVMlInGDW4xuHdOgRpUCpjVSbfw0tS53JrL8khEy
 lbVUa+MHeqLjWab7wgJ9X9f4bcbG1YP/0IvIrWDgOw//wggmwWE7FYaO1kK/78jzi0+Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090904_858410_E9BEE639 
X-CRM114-Status: GOOD (  11.29  )
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
> diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
> index 4557a8b6086f..aafe5cfeb27c 100644
> --- a/include/uapi/asm-generic/unistd.h
> +++ b/include/uapi/asm-generic/unistd.h
> @@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
>
>  /* kernel/ptrace.c */
>  #define __NR_ptrace 117
> -__SYSCALL(__NR_ptrace, sys_ptrace)
> +__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
>

Right. We could merge sys_ptrace and compat_sys_ptrace() by adding
a in_compat_syscall() check, but either way works.

>  /* kernel/sched/core.c */
>  #define __NR_sched_setparam 118
> @@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
>  #define __NR_kexec_file_load 294
>  __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
>  /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
> -#if __BITS_PER_LONG == 32
> +#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
>  #define __NR_clock_gettime64 403
>  __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)

This part looks wrong, you expose clock_gettime64 to user space this way, both
in asm/unistd.h and in the table.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
