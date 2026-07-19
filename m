Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19529C44512
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jul 2026 11:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6oMWn8+l0kFATKW2ZNEPDkEncXvHfOiF4Qzikw+XKiU=; b=j70j6D3jxEvez/
	7mxpkcSiz7oyAMlplJFEHIQxJB5I5PNYFvekteh/qmxFNebfZ1xSpN79lAdVHscqcJoGjVvbEJv2w
	meFODBYTQlM8EQE3m4cUDb+H+A2k2qwJANdtX8P5laAC7A75Ye74rzgLMXv/TqVajDekmDBh1Fjd2
	DX1k2G0m9UGOpwSaq1jREc2EGA73rD47SOnM7BqBc2f6wAE0AvajyibpKY6SOW+cKcbSG0PYkTxLL
	B0wNrdz197vhkEzUfBK00QAUm5q2wRIEFrfCDaheCwizow4xwupxPM0yQP+sUd6UdBJoa8qzLtgoN
	MofVxg50QIqze+/3JT5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlPeZ-00000004xKi-1MGx;
	Sun, 19 Jul 2026 11:25:51 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlPeV-00000004xIq-1nIb
	for linux-riscv@lists.infradead.org;
	Sun, 19 Jul 2026 11:25:49 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-69c1220bd51so9916148a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 19 Jul 2026 04:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784460345; cv=none;
        d=google.com; s=arc-20260327;
        b=VBQCx0Sm3Pd9IrhElcKed6sEzrxY/qrWLpk9Qblz1vWXFqB7dG6VRHfKClpxQumVeB
         KWW3RFiwlfIBkr9w9WKM2ny/M34ZaUDgv3u0bsnygd3ZO58eS11Pecqa6Yq5xA9xc+Iv
         F4Ghy8UdgUBzXt/7dp74Apu3q2Wdx7geTzqnYPhLKQvR/KW0HOmBWvX32SrB1xYKFyZF
         s+qQjaih8gYum0OfLPcMPb8Qd0Qc236WpUIogi5Yqamz5MNm0htDI3VbUB28ZQo3WrR6
         kCwT45ZF3J3F3DViWjo0jVlgxzH3ggytJJSswlYfA9z/1c/eVbqvC9hMn6mhksh/S8j6
         CjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        fh=vDlOj5HV+bMPjxImI9YkDjaHHv4Im8FQqiW/B8Pfdb4=;
        b=P0Nub6Z6vG391L053+Z7fJZvhHVKkACrq6xWv1CHFgJpvAUjXtYgu9SmFPezSmp8jD
         7oDccp7TUQk8E1WsMMPaXvSbrbI00ErlLSNxxmtVRKzq51VOC1F4qUyGvYfOx4yEPJd+
         5C1H4Shar1Dlsh7meCtz6Ow+gaStKwl4fnTXZqQfq1dZZCIuhKoqZlagRYfLUNTZQnlq
         HmAjN7eNRUlG1G+0OPBz8t+9/UUrQPgMoHwNq2c7QoMvYMiBZWfkFwlht3B255jG3ASu
         nZg2hiJOyNwK8iTfqxUfUMYv0Q3RZh8CkxSFUCJ+zN6Btjbrcvklj5C40FQ9fodHXScy
         P+kQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784460345; x=1785065145; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=PBt9MSGSK916HxWJhXMyTkOZqSVNztN8RET4AsIXYZGvR3WP7I9LanL17F7aSqb2ze
         NSmXPpUMG20q8s52MEG4UaqDANI9Xjmdr9ILCBZbbkkzEAuvuaEFUvkCbMFNsfliMREG
         TW116ZjA6o4L1PwFZa8/eNKM4PCEkqxRciepw0HcSpqtnsEtr0S/KbG4eGrkVy1Xtao7
         oW4ln8LqgQStZS0ZlZer7voUcYN2BqPVS9Nw9DGZZskrNeH2eyB3o2Fi8ilQtJdrexKA
         hCdajVencdSlduC7CadfrZXTu5jpnSSLdCFSFG00TCPj+LFYTxU5NWvMYjiFo5gzlH7B
         YirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784460345; x=1785065145;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HjwBEg56Cr9vHNVIU01sUWrlM5gmQ+vCUXpN04JdIto=;
        b=WBYdAq09161AtxGPdGloA7nhjEffGtPX2xdNafgU+cZMMqb7L5JZOsli3jJ7QjEla7
         MuidH8CAV8KgFMU90dfORrrVJrKyoFMzlt7ahYsVKjNUGn2IxVimHM4R1T3xd7Gro8XR
         JNFuvdFCillBr4QaIfyc6ozHjjlHZ+dPpaOIsWqFUIj1ECpANdZts3WnhTPjqKF3w2N8
         f4uqRdx0gOA6EX0qPdIzBOf9ohAlLhskH+6Wj1bBztujuY9CNN99e++mewl7jVUSvYt0
         jaPYuga1x8C9PL/j/Itz307yz0lWXM2Ca0TRXPFBMzey1AdWsWbVWdt84zYxHpOJYjOR
         qUUA==
X-Forwarded-Encrypted: i=1; AHgh+Rp4carzNUqXhAJKqyJ8DWikiaeC04KWC+I5Z8Sh9jlQmGyf7y9TVycRh0TxtyH4qicj0yq+8GBDRed5Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmP0Rq3lRxNc87Mxes4SvHNiYsk4kx/vh0odUuyBJZaPzk67k
	Eb6JHALnYXcBOSbDiqa8NvD0g0xr8z4aeVFnZucUC4z7V9CaS9kjwoIUnP72XCaUXfTHV9QVvcw
	ybC4oqbOBS+EZcAxh7X3H5XdpcSLObE4=
X-Gm-Gg: AfdE7cnRqZPC8ZrQ6memG1e1wNku8XTlzgurN6IjWEKjubqBj/boZzRlNJ54x8Gk30b
	rOOcn9qKo/863amR6fHkgpd1jwik14l2+ZQPgyIHKsnsUEL5D3ck/VSlqdYHx2/itYd5HZzkak3
	de4DcaSIAMuGqXc13taihVWpPSsPAu33GyizUOyziuFKlWoDoMWzBWo9kw0MidPdvuXByanJeFS
	wuIMtXdIjPPjPJ+B4OgQmVzdvLbhjKz8fobyrGU5P9aN+bsLSqnEao2stgq7XCIuK8nUMiyIfth
	5jlDhz8KZNpHEZDqrmU4l0ssvbrYi8H5DsAR9I3RIw==
X-Received: by 2002:a05:6402:34d5:b0:698:3b7b:e48a with SMTP id
 4fb4d7f45d1cf-69e652f908dmr3652615a12.32.1784460344585; Sun, 19 Jul 2026
 04:25:44 -0700 (PDT)
MIME-Version: 1.0
References: <20260707181957.433213175@kernel.org>
In-Reply-To: <20260707181957.433213175@kernel.org>
From: Magnus Lindholm <linmag7@gmail.com>
Date: Sun, 19 Jul 2026 13:25:32 +0200
X-Gm-Features: AUfX_mzTzrHRlu_CZJHA0P1GUw_Z2tfq0CbfsG-DFTqsEJDFIQx7LWbdfB3YWqk
Message-ID: <CA+=Fv5TDNH8+JAojV9_W36kUkEE68uiA00FQ7i0vJunebqs1sA@mail.gmail.com>
Subject: Re: [patch 00/18] entry: Consolidate and rework syscall entry handling
To: Thomas Gleixner <tglx@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Shrikanth Hegde <sshegde@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, Kees Cook <kees@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, loongarch@lists.linux.dev, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org, x86@kernel.org, 
	Mark Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, 
	Andy Lutomirski <luto@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Guo Ren <guoren@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Helge Deller <deller@gmx.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Richard Weinberger <richard@nod.at>, Chris Zankel <chris@zankel.net>, linux-arm-kernel@lists.infradead.org, 
	linux-alpha@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, 
	linux-um@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>, Brian Cain <bcain@kernel.org>, 
	Michal Simek <monstr@monstr.eu>, Dinh Nguyen <dinguyen@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	linux-snps-arc@lists.infradead.org, linux-hexagon@vger.kernel.org, 
	linux-openrisc@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-arch@vger.kernel.org, =?UTF-8?Q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_042547_491234_3B287CFA 
X-CRM114-Status: GOOD (  21.58  )
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

>
> With that all architectures using the generic syscall entry code follow the
> same scheme, apply stack randomization at the correct and earliest possible
> place and skip syscall processing depending on the boolean return value of
> syscall_enter_from_user_mode[_work]().
>
> There should be no functional changes, at least there are none intended.
>
> The resulting text size for the syscall entry code on x8664 is slightly
> smaller than before these changes.
>
> Testing syscall heavy workloads and micro benchmarks shows a small
> performance gain for the general rework, but the last patch, which changes
> the logic to be more understandable has no measurable impact in either
> direction.
>
> The series applies on Linus tree and is also available from git:
>
>         git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git entry-rework-v1
>

Hi Thomas,

I did another round of testing of this series on Alpha, this time with my
Alpha GENERIC_ENTRY conversion rebased on top of this series.

For this test I also manually applied the seccomp fixup discussed earlier in
this thread, i.e. fixing the recheck-after-trace logic in
__seccomp_filter() along the lines suggested by Jinjie/Oleg.

With that in place, the kernel boots on Alpha and I do not see any
regressions in the seccomp_bpf kernel selftest or in the strace testsuite.

One note: the seccomp_bpf selftest run on Alpha uses this not-yet-upstream
Alpha selftest enablement patch:

https://lore.kernel.org/linux-alpha/20260203063357.14320-1-linmag7@gmail.com/

One Alpha-specific wrinkle I hit while rebasing the GENERIC_ENTRY patch is
that Alpha cannot unconditionally pre-seed the normal -ENOSYS return state
before calling into the generic entry code: syscall_set_return_value() also
updates r19/a3, which is still syscall argument 4 on the normal entry path.
Doing that too early broke early userspace mmap() during boot.

The Alpha conversion therefore handles this on the no-dispatch path instead:
after the generic entry helper returns, if the syscall is not to be invoked
or the resulting syscall number is invalid, Alpha skips the call, preserves
any ptrace/seccomp/BPF-provided return value, and only synthesizes -ENOSYS if
the return state was otherwise unchanged. That was needed for the
TRACE_syscall.ptrace.syscall_faked and syscall_errno seccomp_bpf cases to
pass.

So from the Alpha side, with the seccomp fixup applied:

Tested-by: Magnus Lindholm linmag7@gmail.com

Are you planning to send a v2 with the seccomp recheck fix and any other
review fixups folded in? Is the intention to route this upstream
during the next merge window?

Thanks,
Magnus

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
