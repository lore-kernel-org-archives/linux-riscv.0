Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 386DECD5BAC
	for <linux-riscv@archiver.kernel.org>; Thu, 21 May 2026 19:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AEcEbHHTFYN2/imXyEBz4ocARsesYQm3R3t0utFrPuI=; b=FS5/jm6SdzPmlr
	sBKsHCWxgTB9WZhNZM8wfRKPOAgrBIWJafMyLyVF2c9KdoEiSJcw+LRMgm++15ViiNHIvIlB4q2sU
	jYsekM2EmWxpLUlpT/sR3/gGn/cmIwfVNUDFppkq3142lVEZTaMZloJit+R4Gmb3h7CPhvutaKtvP
	Whjwev2jGXyTr4x1qZnTO0bzBUwVXaYNenX1GoJBhTXvMnyIXNeLCsS7JRzCQJYozgatCGHHACgAs
	JEvC9HVMpWLhEpso9DsSspNRFA51Uqdv2f7NoDA5oP5RNLmQW4nnJlnjtW/Egi2uU3r43cmXcdGqw
	0neNWwMia/SmCd2UGVVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8rb-00000008sYO-3O8X;
	Thu, 21 May 2026 19:15:26 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ8rZ-00000008sXc-0XRF
	for linux-riscv@lists.infradead.org;
	Thu, 21 May 2026 19:15:22 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-3044857f09aso388718eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 21 May 2026 12:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=lixom-net.20251104.gappssmtp.com; s=20251104; t=1779390920; x=1779995720; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZOjqZYfGW+XMqudCuPdau+DWasuYcTuRfgL+xBmaWTE=;
        b=zi0FBU2oRhuBfFcRzhet7sMlEyYIwKYMg98aWWsjoaK2Q/bFJREjts+NKAREty9psP
         JJS500LwokxJYWmcQp49xEZx6ukXUGUuAKUFoiA97jcRWqNyTgs9pf4rP+IhUhow5PXr
         krs8h2+62M8DFU/OUr0/8E9R78WPSdvrRuVW410jv70/QVfI6MDHjWyc6gWFBnZ+QhoI
         C2JZgJiBHRwD2Sw29sKB7jrTSWx9K7bp7WBL5X2CZPCb9vo0Mx3WKDwZDPkI/3U5r9Xk
         n57hCQCcUOLOQy8Md41fnffV5kdBdyUt11ooPZFsShlk21/Hq0lAB9byQJka/Czrofq7
         sHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779390920; x=1779995720;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZOjqZYfGW+XMqudCuPdau+DWasuYcTuRfgL+xBmaWTE=;
        b=fWaA8CbuJlVpaADiYMjF6C45zkIeGPIaYH3p/Rr7M6aH1TUtZjYl2gZcOk/MH6IouQ
         10jHJgdBTfngk/1DlQLU0reH9/5rl+1POAKRdJ+zV7p1NPUjU9U9mW069+h+3V7QESGb
         Aexp5EwzbeS+9xYhioua39TIsNcX3uR0LZVP1BSAqzh0/2U29teYNz8cU5vAZmeqCHWy
         eQee0A/rpCdL8y5Mcx0VRyif4RZaDhiqnxgeRY+FNZEwBqi/4hYp05rXDWP0ZC2a/GRX
         f/9I+f9PNQC1HipLRLUPYcikpB5ceaquPl39mBCiqj++FdM1DiSpcemcuSUh7Pw9Clom
         J76Q==
X-Forwarded-Encrypted: i=1; AFNElJ8tif76q7wzM4+kM6xaQ7CW2KF9RMVnm5eP2O7WySFxzxokWN0TtV1gcK7bZ/8cr0+GAcyacgVZn9vVsg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1pbajnxV2bJUrNUfMIqgeIHzRp01In74o6OKYbnSpSPkuQovc
	hrtva8kYijWBgGFU6zPlJ7Z4ooZKUOpvyI1+0KfKdFWxcyIUWMA5I1PgxiTjSmG+/PA=
X-Gm-Gg: Acq92OEXh+esa5Id7iAbYmRINXERob0ZFVe3rMyDzNc1e/NKy1fDn89He6Eghajk2Xd
	KPvTDjjuN6cUs38DreTLfJ791O+QAmbp12/5C5ploQWMt62oJIhCNIirhDF0ixhHVw/sHKbcbBK
	vZP6IiVVRMFTXnb4z6u5O1C00/oFXl4VGoDPjDv8hfmBT8xopsH9s6U6zYTp6UQ78i1KCY95bds
	gMn7YgpHuylfEEryCclTd104iS93FUeFFiVzf+Ub7YKa6+1U+6SJMp+XUg3kc+qBoHCeNG64FT0
	JRlWIntPjgBOnaHmc/LpKcqbokU8JqhM/UP1CFo+q6XhHJLg0Zv+yybkFIR6fbWciXPlxDuCwzt
	w6JllCpKSwMF2RYKiVZJ7iVkomNokiXeB/3SA+rNyNbe6KHDDmEv1KpeZMWaH2Fw5Th6uge+C2I
	K0wldh34h9Xj8E
X-Received: by 2002:a05:7300:3720:b0:2dd:8ac2:9f7a with SMTP id 5a478bee46e88-30448f4ad54mr309655eec.11.1779390919456;
        Thu, 21 May 2026 12:15:19 -0700 (PDT)
Received: from localhost ([99.152.116.91])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-304435c2ea0sm1186983eec.31.2026.05.21.12.15.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 12:15:18 -0700 (PDT)
Date: Thu, 21 May 2026 12:15:07 -0700
From: Olof Johansson <olof@lixom.net>
To: Andy Chiu <tchiu@tenstorrent.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, dfustini@oss.tenstorrent.com,
	bjorn@kernel.org, greentime.hu@sifive.com, vincent.chen@sifive.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/4] riscv: optimize Vector context restore on syscall
Message-ID: <ag9Zu57zc4HhVLeZ@chonkvm.lixom.net>
References: <20260521162521.188629-1-tchiu@tenstorrent.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260521162521.188629-1-tchiu@tenstorrent.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_121521_304197_691CA957 
X-CRM114-Status: GOOD (  15.98  )
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

Hi Andy,

On Thu, May 21, 2026 at 11:25:16AM -0500, Andy Chiu wrote:
> This patch series optimizes riscv vector state handling across syscall
> boundaries and context switches. The kernel now keeps track of the
> INITIAL state in sstatus.vs to optimize unnecessary context management
> operations.
> 
> This version merges daichengrong's RFC patch [1] for the state tracking
> code as it looks cleaner than my v2/v1.
> 
> [1]: https://lore.kernel.org/linux-riscv/7ba2f4b7-8475-4ec3-ab31-58b332bda47e@iscas.ac.cn/#r
> Link to v2: https://lore.kernel.org/linux-riscv/20260402043414.2421916-1-andybnac@gmail.com/

A patchset like this would be really helped by some kind of numbers in the
cover letter to indicate how much performance moved, given a claim of
optimization.


Just for kicks I tried a simple microbenchmark for syscalls from
a vector-enabled process:

#define _GNU_SOURCE
#include <stdio.h>
#include <stdlib.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <time.h>
#include <stdint.h>

static inline uint64_t ns_now(void) {
    struct timespec t;
    clock_gettime(CLOCK_MONOTONIC, &t);
    return t.tv_sec * 1000000000ull + t.tv_nsec;
}

int main(int argc, char **argv) {
    int iters = argc > 1 ? atoi(argv[1]) : 10000000;
    int use_v = argc > 2 ? atoi(argv[2]) : 1;

    if (use_v) {
        asm volatile(
            ".option push\n\t.option arch, +v\n\t"
            "vsetivli x0, 1, e32, m1, ta, ma\n\t"
            "vmv.v.i v0, 1\n\t"
            ".option pop\n\t" ::: "memory");
    }

    for (int i = 0; i < 10000; i++) syscall(SYS_getppid);  // warmup

    uint64_t t0 = ns_now();
    for (int i = 0; i < iters; i++) syscall(SYS_getppid);
    uint64_t t1 = ns_now();

    printf("V=%d %.1f ns/call (%lu ns / %d iters)\n",
           use_v, (double)(t1 - t0) / iters, t1 - t0, iters);
    return 0;
}


I compiled with gcc -O3, default GCC 14.2 on Debian 13. Host is x280
(Blackhole). Base kernel sources is 7.1.0-rc4-next-20260520 defconfig. Ran
with taskset to pin to one of the CPUs.

The testcase doesn't use vector inbetween each syscall, but will obviously
have initiated the state (if started with '1' as second argument).

Without this patchset:
V=1 242.9 ns/call (12144527848 ns / 50000000 iters)

With this patchset:
V=1 264.5 ns/call (13226852900 ns / 50000000 iters)

Interestingly enough, with V=0 test it sped up slightly (194.3 -> 189.5 ns).

I repeated the runs a few times, with similar results so I don't think it's
explainable as noise.


Given that more code will be vector enabled in the new shiny RVA23 world
we are entering, I'm uncertain whether this is the right trade-off. You won't
get the syscall perf cost returned unless you need the vector context swapped
in without the lazy fault between calls.

I suspect running userspace workloads on a RVA23 platform (SpaceMIT
K3) with Ubuntu 26.04 would be the most meaningful data to collect. My
ordered board is still in shipping, unfortunately.


PS: There's a new build warning due to an unused 'uvstate' variable in
riscv_v_start_kernel_context() that you might want to fix.


-Olof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
