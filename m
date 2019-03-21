Return-Path: <SRS0=NLGL=RY=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E303C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 01:22:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6D82E218D3
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 21 Mar 2019 01:22:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="H/6cjXXB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=paul-moore-com.20150623.gappssmtp.com header.i=@paul-moore-com.20150623.gappssmtp.com header.b="MCEkpfzG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6D82E218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=paul-moore.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o8FCyY4vhclLQvBgyMyj5vMfwoF3Y4XX5IcWz8OrKtM=; b=H/6cjXXBvzoPSN
	Z+rBb2inGvpRiShDlDQ3cqHyhyaEVTxZTy1DFMRSSLjTK7UXfn2SWniQMBs23cSjmRz7D8EkfU/rn
	d0Uznz5DdiJWow7y9qXqtjGTUU5Hv9bBseCXwv1JPIuWpCoQRm+e76VHNIVqDSyj+rfeZ0a/3rmS5
	GHxLHmsUJkEt3BYf9FPEzOlM9jW9xF5kY3dzfNBZPz66qyuYRe0BeRrCXnN+iqWFS9qh5h4ZNxdwt
	WOOSUScQ0ApVHeUcxLeNHub1DMFtK3TtHj26kTkPvTRkyZLojlwfOYEtVLnhPi9qnqCMHpUvdr6pi
	oM7FOsk7osBXyrtsDobw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h6mQ0-0000vc-Gv; Thu, 21 Mar 2019 01:22:52 +0000
Received: from mail-lj1-x241.google.com ([2a00:1450:4864:20::241])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h6mPx-0000uA-Ch
 for linux-riscv@lists.infradead.org; Thu, 21 Mar 2019 01:22:50 +0000
Received: by mail-lj1-x241.google.com with SMTP id x13so3934918ljj.5
 for <linux-riscv@lists.infradead.org>; Wed, 20 Mar 2019 18:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yQak0Tx1h8ZzNvJhxHCJfkfqfqQkp5tZm5k1rkzGAWo=;
 b=MCEkpfzGAVkV8OUWwvDfADJaHEJrKphKNk9ZBHdDkhAUp7Xi+D/fivnaUTpvnchwYj
 J2EHm4s1wlqI4ZcZiv+Js1gSi7emoP5i5oV+4iZXmIE6Qq/JWZibrzfpA0Rp90SC5BUn
 W5zfcnA3uCN/DoLkvQtKQVKubObxSOEcEhAXIrNLr81lzhyUiNHPb6wSNGfccRmX4EMy
 /H5QiSC0lmtG8aFUY+Ruz0y/ovCpRP+EuPkxhvyYHuVHYUt3qyNZ89c0ETPAPCjXUllU
 UGH5e61Ppbup0MOniwkWehzvHSNj+AwTjl0HV9bfHQFFKp60o9DqLyRIjute8/M29s41
 Wklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yQak0Tx1h8ZzNvJhxHCJfkfqfqQkp5tZm5k1rkzGAWo=;
 b=SqcklmeL7+WvZQg2bJ3jWX11IjPeEVZSM12g81aVImqBo4lCPjyldESCWpICH2EEu2
 /7RambkrO16RH/qqVeudaamNJJmiMLLiZ9uoProPqc3+BSDyi2SK790ez/kZmHd9YDBb
 dpFvtjwFXCROhhFRxEV5ejN189EYayeI4xRPlJ9Wiu1ZwEBK9zGp+HwQ1Zgvq8WZMI3L
 XILU1t4ykjRJBFsAg4gwU/73/PO8sVqDXGNxnbXVeuR7D/KEeIpQ4KadAyvyJ7pxDybs
 fxRH5WvoN2Ez/MlXQUHNf2gDz7nJ5hw0AGCUaz8Sv8dC6GdybHLg69aQceSM6EMlMt0U
 i+aA==
X-Gm-Message-State: APjAAAWG+tBT5qzu34CpSwrh96AroSpiyvn6Ku5f8BBDglm7qyNcqqro
 CczrQ6jSA48yl3Z/XuWB8zLDFitM1nRO+XtVJb7B
X-Google-Smtp-Source: APXvYqz9Z69ggdD7Zm5pwgIrjh6J08nEG+oOiUcxma3ymHttjivN/PjyGvMdyp2UOzbYS7NuNo7HvewRoASj71uxYPo=
X-Received: by 2002:a2e:500d:: with SMTP id e13mr481912ljb.169.1553131366528; 
 Wed, 20 Mar 2019 18:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190317233018.GN16301@altlinux.org>
In-Reply-To: <20190317233018.GN16301@altlinux.org>
From: Paul Moore <paul@paul-moore.com>
Date: Wed, 20 Mar 2019 21:22:35 -0400
Message-ID: <CAHC9VhQWKT8Mr=_pcmiccpChMB9oufUHO-4Agzmot7M=6ShNnw@mail.gmail.com>
Subject: Re: [PATCH v2 13/13] syscall_get_arch: add "struct task_struct *"
 argument
To: "Dmitry V. Levin" <ldv@altlinux.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190320_182249_434778_B628BF3C 
X-CRM114-Status: GOOD (  10.53  )
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Palmer Dabbelt <palmer@sifive.com>, linux-mips@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-c6x-dev@linux-c6x.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Eugene Syromyatnikov <esyr@redhat.com>,
 Elvira Khabirova <lineprinter@altlinux.org>, Mark Salter <msalter@redhat.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 openrisc@lists.librecores.org, Andy Lutomirski <luto@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, linux-audit@redhat.com,
 linux-alpha@vger.kernel.org, nios2-dev@lists.rocketboards.org,
 linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 17, 2019 at 7:30 PM Dmitry V. Levin <ldv@altlinux.org> wrote:
>
> This argument is required to extend the generic ptrace API with
> PTRACE_GET_SYSCALL_INFO request: syscall_get_arch() is going
> to be called from ptrace_request() along with syscall_get_nr(),
> syscall_get_arguments(), syscall_get_error(), and
> syscall_get_return_value() functions with a tracee as their argument.
>
> The primary intent is that the triple (audit_arch, syscall_nr, arg1..arg6)
> should describe what system call is being called and what its arguments
> are.
>
> Reverts: 5e937a9ae913 ("syscall_get_arch: remove useless function arguments")
> Reverts: 1002d94d3076 ("syscall.h: fix doc text for syscall_get_arch()")
> Reviewed-by: Andy Lutomirski <luto@kernel.org> # for x86
> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> Acked-by: Paul Moore <paul@paul-moore.com>
> Acked-by: Paul Burton <paul.burton@mips.com> # MIPS parts
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
> Acked-by: Kees Cook <keescook@chromium.org> # seccomp parts
> Acked-by: Mark Salter <msalter@redhat.com> # for the c6x bit
> Cc: Elvira Khabirova <lineprinter@altlinux.org>
> Cc: Eugene Syromyatnikov <esyr@redhat.com>
> Cc: Oleg Nesterov <oleg@redhat.com>
> Cc: x86@kernel.org
> Cc: linux-alpha@vger.kernel.org
> Cc: linux-snps-arc@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-c6x-dev@linux-c6x.org
> Cc: uclinux-h8-devel@lists.sourceforge.jp
> Cc: linux-hexagon@vger.kernel.org
> Cc: linux-ia64@vger.kernel.org
> Cc: linux-m68k@lists.linux-m68k.org
> Cc: linux-mips@vger.kernel.org
> Cc: nios2-dev@lists.rocketboards.org
> Cc: openrisc@lists.librecores.org
> Cc: linux-parisc@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-s390@vger.kernel.org
> Cc: linux-sh@vger.kernel.org
> Cc: sparclinux@vger.kernel.org
> Cc: linux-um@lists.infradead.org
> Cc: linux-xtensa@linux-xtensa.org
> Cc: linux-arch@vger.kernel.org
> Cc: linux-audit@redhat.com
> Signed-off-by: Dmitry V. Levin <ldv@altlinux.org>
> ---
>
> Notes:
>     v2: unchanged
>
>  arch/alpha/include/asm/syscall.h      |  2 +-
>  arch/arc/include/asm/syscall.h        |  2 +-
>  arch/arm/include/asm/syscall.h        |  2 +-
>  arch/arm64/include/asm/syscall.h      |  4 ++--
>  arch/c6x/include/asm/syscall.h        |  2 +-
>  arch/csky/include/asm/syscall.h       |  2 +-
>  arch/h8300/include/asm/syscall.h      |  2 +-
>  arch/hexagon/include/asm/syscall.h    |  2 +-
>  arch/ia64/include/asm/syscall.h       |  2 +-
>  arch/m68k/include/asm/syscall.h       |  2 +-
>  arch/microblaze/include/asm/syscall.h |  2 +-
>  arch/mips/include/asm/syscall.h       |  6 +++---
>  arch/mips/kernel/ptrace.c             |  2 +-
>  arch/nds32/include/asm/syscall.h      |  2 +-
>  arch/nios2/include/asm/syscall.h      |  2 +-
>  arch/openrisc/include/asm/syscall.h   |  2 +-
>  arch/parisc/include/asm/syscall.h     |  4 ++--
>  arch/powerpc/include/asm/syscall.h    | 10 ++++++++--
>  arch/riscv/include/asm/syscall.h      |  2 +-
>  arch/s390/include/asm/syscall.h       |  4 ++--
>  arch/sh/include/asm/syscall_32.h      |  2 +-
>  arch/sh/include/asm/syscall_64.h      |  2 +-
>  arch/sparc/include/asm/syscall.h      |  5 +++--
>  arch/unicore32/include/asm/syscall.h  |  2 +-
>  arch/x86/include/asm/syscall.h        |  8 +++++---
>  arch/x86/um/asm/syscall.h             |  2 +-
>  arch/xtensa/include/asm/syscall.h     |  2 +-
>  include/asm-generic/syscall.h         |  5 +++--
>  kernel/auditsc.c                      |  4 ++--
>  kernel/seccomp.c                      |  4 ++--
>  30 files changed, 52 insertions(+), 42 deletions(-)

Merged into audit/next, thanks everyone.

-- 
paul moore
www.paul-moore.com

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
