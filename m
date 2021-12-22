Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1DB4C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Dec 2021 11:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rLTWx4edd/HkJUiLRLhRzBS3Tr1kkMGepRbHP9X+7r8=; b=GlDlZB/HnWvIi0
	IkJxJ0N5YVjdl3nUzk2vSfjKGSP+ImO4p9RnyYm+jkt+7vPf/jk2EsVjaYDD1XuDNj8WvvTLxCS3Q
	GhQSV4Wmr3a+AZOynT/vRleqkQzU+vj02f4TRLxb/FCpX465rQZUlCtMhQYCoD3Dz0KixsEFGQJXt
	m8cLSjQaPzL8ONblC34vD5tX2A5eTtKKh5hUToR8IrOs5ee6bz0OlEBBxkKdtJhEXpJl8mImgkU+T
	HWUGYX0/uTFT3ahd03D1S6LmecC5mPuDxuE2DfsVMzHWFZgyPDa8zs3H5og0ags4U3wrImLiGYDhw
	mInrbsQKzIi+iRKDsbWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzzbg-00A5nQ-Q9; Wed, 22 Dec 2021 11:16:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzzbc-00A5m5-Q4
 for linux-riscv@lists.infradead.org; Wed, 22 Dec 2021 11:16:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BFAA6197E
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 11:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4D6C36AF2
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 11:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640171782;
 bh=9c47US/IBTSpcaTa6A9sohSlsGJgoac4lsSRerkjTaY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rAwOapawARY4124h9997jUAYZGl8ZbZ6EIHFd5ga3NKlP1QtUijfWLS1Sb0BbnbD1
 skkzKp4Rs1OB7RkijJR2y8I+rPE2bSfmQZ0XYD936tCfGUqWr7jmkjBkeD/KTdtPGo
 yjNWFqu2wdYZmDF81jgndPbY9JZgH6OsOnDbuAtpXeoo+AU+s1TFjZ+M3q698sknmS
 KrNBv1vAAfGvWSENhuHjsk+4NRDR1DB9SAXYEqJWY+zxR6U9lW2QRlI0tAJ7QKRFka
 JabKFDuThabc7+jtrrDLtw/NdUbdPY1DWWL5BCCz6Ltzkg/ANsIl0ENM4TFeX5yKiP
 hoIMWD5uzs3UQ==
Received: by mail-vk1-f181.google.com with SMTP id m200so1092656vka.6
 for <linux-riscv@lists.infradead.org>; Wed, 22 Dec 2021 03:16:22 -0800 (PST)
X-Gm-Message-State: AOAM5308uL9ueu5xEBn6bxX3imEklvAXBq2wpFadGHmvbz+i5LlynHTQ
 GXOIunnsIROX1eg6ykBGahnXKg9ig0p2PztBE34=
X-Google-Smtp-Source: ABdhPJxj1PzhyTI98cL1Srb70bXWLzUyQMiVzIdGh0LdKJMqyS7sLEVMCA+fdiZdr9wtUMSXc7/oy/tQPd/D8KKPRhU=
X-Received: by 2002:a1f:ae91:: with SMTP id x139mr867231vke.2.1640171781375;
 Wed, 22 Dec 2021 03:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20211221163532.2636028-1-guoren@kernel.org>
 <20211221163532.2636028-2-guoren@kernel.org>
 <CAK8P3a1fC8aro3kHLvGMVDdvVYjaQdxJeGur9ac=11+6=r0Xyg@mail.gmail.com>
In-Reply-To: <CAK8P3a1fC8aro3kHLvGMVDdvVYjaQdxJeGur9ac=11+6=r0Xyg@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 22 Dec 2021 19:16:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQciNaXk+_am=kS2uSwg6oGM4aJqiw_O5KN-DrHetf8nA@mail.gmail.com>
Message-ID: <CAJF2gTQciNaXk+_am=kS2uSwg6oGM4aJqiw_O5KN-DrHetf8nA@mail.gmail.com>
Subject: Re: [PATCH 01/13] syscalls: compat: Fix the missing part for
 __SYSCALL_COMPAT
To: Arnd Bergmann <arnd@arndb.de>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup.patel@wdc.com>, 
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, 
 Wei Fu <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, 
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 =?UTF-8?B?V2VpIFd1ICjlkLTkvJ8p?= <lazyparser@gmail.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-csky@vger.kernel.org, 
 Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_031624_963181_D7CEC72C 
X-CRM114-Status: GOOD (  16.45  )
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

On Wed, Dec 22, 2021 at 1:09 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Tue, Dec 21, 2021 at 5:35 PM <guoren@kernel.org> wrote:
> > diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
> > index 4557a8b6086f..aafe5cfeb27c 100644
> > --- a/include/uapi/asm-generic/unistd.h
> > +++ b/include/uapi/asm-generic/unistd.h
> > @@ -383,7 +383,7 @@ __SYSCALL(__NR_syslog, sys_syslog)
> >
> >  /* kernel/ptrace.c */
> >  #define __NR_ptrace 117
> > -__SYSCALL(__NR_ptrace, sys_ptrace)
> > +__SC_COMP(__NR_ptrace, sys_ptrace, compat_sys_ptrace)
> >
>
> Right. We could merge sys_ptrace and compat_sys_ptrace() by adding
> a in_compat_syscall() check, but either way works.
>
> >  /* kernel/sched/core.c */
> >  #define __NR_sched_setparam 118
> > @@ -779,7 +779,7 @@ __SYSCALL(__NR_rseq, sys_rseq)
> >  #define __NR_kexec_file_load 294
> >  __SYSCALL(__NR_kexec_file_load,     sys_kexec_file_load)
> >  /* 295 through 402 are unassigned to sync up with generic numbers, don't use */
> > -#if __BITS_PER_LONG == 32
> > +#if defined(__SYSCALL_COMPAT) || __BITS_PER_LONG == 32
> >  #define __NR_clock_gettime64 403
> >  __SYSCALL(__NR_clock_gettime64, sys_clock_gettime)
>
> This part looks wrong, you expose clock_gettime64 to user space this way, both
> in asm/unistd.h and in the table.
>
>          Arnd

No, we only define __SYSCALL_COMPAT in compat_syscall_table.c. It
won't be expose to user space, because there is no __SYSCALL_COMPAT.

$ grep __SYSCALL_COMPAT * -r
arch/riscv/kernel/compat_syscall_table.c:#define __SYSCALL_COMPAT
                           ^^^^^^^^^^^^^^^^^^^^^^
include/uapi/asm-generic/unistd.h:#if __BITS_PER_LONG == 32 ||
defined(__SYSCALL_COMPAT)
include/uapi/asm-generic/unistd.h:#ifdef __SYSCALL_COMPAT
include/uapi/asm-generic/unistd.h:#if defined(__SYSCALL_COMPAT) ||
__BITS_PER_LONG == 32
include/uapi/asm-generic/unistd.h:#if __BITS_PER_LONG == 64 &&
!defined(__SYSCALL_COMPAT)
tools/include/uapi/asm-generic/unistd.h:#if __BITS_PER_LONG == 32 ||
defined(__SYSCALL_COMPAT)
tools/include/uapi/asm-generic/unistd.h:#ifdef __SYSCALL_COMPAT
tools/include/uapi/asm-generic/unistd.h:#if defined(__SYSCALL_COMPAT)
|| __BITS_PER_LONG == 32
tools/include/uapi/asm-generic/unistd.h:#if __BITS_PER_LONG == 64 &&
!defined(__SYSCALL_COMPAT)

-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
