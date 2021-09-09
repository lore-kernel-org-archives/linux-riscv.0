Return-Path: <SRS0=EjPk=N7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AC69C433F5
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 08:21:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD4566113A
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Sep 2021 08:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD4566113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SxccoBdsrvbhphkFAy84UilPONhg+L3PcHVpLOmfL+Q=; b=LOLAuhihGWLoPU
	yy0ieHT2FXg+KtsMk7ijVSavILrGnxhT8o+7pmYVSrtQTho0eVWnjitFiHztkS6maOMNyfixOTF7K
	4/Ut5ZsAqEBSTrGQSbJqk7bypcm+qHNcebVlPlxFMUw3p+ZZGavtycMcxyD7i9v2KQyhQNmfZPMwV
	S8oqPOgWEURas/qaQRBtN5hu3fmuf9TIPtcY9zJ0CQw2KdMdGcVgsG+zQSebMkEjDc0YnrjjglDsm
	+Z5q9TxARMBUdTKHPwX88x10bkf7KTTb3lfQgA9R3wOV65mGuHE7baCir2iWh+mv4v6fiE6LCCp6k
	zKiM09T2Y73MNgCqWt7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOFIP-008Yv6-93; Thu, 09 Sep 2021 08:20:33 +0000
Received: from mout.kundenserver.de ([212.227.17.10])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOFIM-008Yud-9B
 for linux-riscv@lists.infradead.org; Thu, 09 Sep 2021 08:20:31 +0000
Received: from mail-wm1-f41.google.com ([209.85.128.41]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1N79q6-1n0bJP2EWK-017QtS for <linux-riscv@lists.infradead.org>; Thu, 09
 Sep 2021 10:20:27 +0200
Received: by mail-wm1-f41.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so725667wml.3
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 01:20:27 -0700 (PDT)
X-Gm-Message-State: AOAM533vaVovhZNYM24/CbsKkeXci2cxwrjc6B0/lH+78C73JQK4i8TA
 IBBjZeLV3AlGF3RfG8RgeQMvr/MVgPdZiTzSeRA=
X-Google-Smtp-Source: ABdhPJxw9darBRLOGU9T/Ai9xJXwVS9kDLiVsvTLI0kWLzOUQXjodmhRhtE0vr7opzWdpEFtiXs19dy520OXKdt0Xg4=
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr1514862wmp.173.1631175626890; 
 Thu, 09 Sep 2021 01:20:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210909042543.1982893-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20210909042543.1982893-1-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 9 Sep 2021 10:20:10 +0200
X-Gmail-Original-Message-ID: <CAK8P3a1Udjzy=M4Vs8pGCKdedwtv-vPRjxbTcvTL6kP=yXSs0A@mail.gmail.com>
Message-ID: <CAK8P3a1Udjzy=M4Vs8pGCKdedwtv-vPRjxbTcvTL6kP=yXSs0A@mail.gmail.com>
Subject: Re: [PATCH] perf bench: Add support for 32-bit systems with 64-bit
 time_t
To: Alistair Francis <alistair.francis@opensource.wdc.com>
Cc: linux-riscv <linux-riscv@lists.infradead.org>,
 linux-perf-users@vger.kernel.org, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Alistair Francis <alistair23@gmail.com>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Alistair Francis <alistair.francis@wdc.com>
X-Provags-ID: V03:K1:CV1GwEajz7YLA0iimAEYIujaTMpVeEpRLPOSLIJbK+OjlcSQoYx
 Gei2yuiaRAHRQxqj89r8BVmZF2eVIPI5ya8wnCQudKrAQMJZsAAIwdpKa9NYl/SaXcI21LR
 UVLiU0asZuZvfSTA1NbZy+CcRDBKevur9B0rqM6E/upZi/nlmKhv/c+khNYL0NM4fMEyi82
 Mc4LMV6A0UnAwTZ/UBwEw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:4PqOV43YNOM=:pNMxFg+2RmajOwhRZet2Ro
 ek2V3uhOx8A9T4UFxcCUuvlCJGnkT1GH41V1x9pK1p8/OcTh+6TitAo6v5/eDm1dvo4JdVQcR
 lNksboOl7q5OKMMSg8847LrMwNcIpxlfU8RlrGKE3xR1fu1uVgnuf5HrFQ5483c1+cuvBLH0G
 KOjHWCV7kuUbrpBaFaPAEf5heVZM2GOljGoGTFuREpl6cUeN4YkxPDMvSkKHTlmfdeejCBIZU
 1HKSm7s+hzKLwYAnqwzxrkHAgGu0vNpi3EyrySswM3o2LeRGJOjkEQx9ohBulhOrytH+Pb3TP
 di6UJg5z7VPD1uhjQwwoc/lJT2IGkBpD10VHjHO1Tjev6X1Cx+lz557wS7mifBgaGyoiUctNe
 uuIgy0yjRyYneEkMdC/Ca6CAr215iZ4ROZ5aoDiVcFtiB+Yj+vynLVMHQ2907RKneLogGtVR0
 5wgqnuq6pwo7hnBaDwiAR3s2ccZ0fF9a07Fc6fdH5y1PxuNLsgk7lY8QG3AXKxNUgSvq7YGLA
 1mB5mqhEVotYaoizCV4ZLBe1SZ0mCE90sq7D3yXMbgVkmD9JZyWFyOVbPPKPPLlztvEish0VL
 sPW5F0n8+gZQLT48HlWaqDnAwtQFSTk27NyD5ETtEOGyjUgwfWb8fbD3wV886iq1BF2W2ySRm
 79Gei6wAmLrRhX29zfm5+9yvCzTRxbIUQvkI8Oq3svlumcuXFoas3+ufk/k6iqqDCu94HWwSw
 w+IHNJPmvmUO/M9qaJTgq4mUbMkQAcWwnf1GBZJJTGUcewWAw9L0vddy/pORhoglhJwnKof6U
 fPTpx8rM+cqG6y2sYrRfFvd7ME9DarYI00lvGtoPxQDm4p1mnsOP/ppT529Od+97F+qSumi1N
 cl5k3DUBKs53IB84ePJA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_012030_661565_5D961894 
X-CRM114-Status: GOOD (  21.07  )
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

On Thu, Sep 9, 2021 at 6:25 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> time_t and as such don't have the SYS_futex syscall. This patch will
> allow us to use the SYS_futex_time64 syscall on those platforms.
>
> This patch does not attempt to gracefully allow 32-bit architectures
> with both SYS_futex and SYS_futex_time64 to support a 64-bit time_t.
> This patch only applies to 32-bit architectures with a 64-bit time_t.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

Hi Alistair,

I know you've made this mistake before and I've pointed it out
several times. Please don't do this again, and try to fix up the
ones you already broke!

> +/**
> + * Some newer 32-bit architectures (such as RISC-V 32-bit) don't have
> + * the SYS_futex syscall and instead only have the SYS_futex_time64 call.
> + * Let's ensure that those still compile and run by just using the
> + * SYS_futex_time64 syscall. On these systems `struct timespec` will use a
> + * 64-bit time_t so the SYS_futex_time64 call will work.
> + */
> +#if !defined(SYS_futex) && defined(SYS_futex_time64)
> + #define SYS_futex SYS_futex_time64
> +#endif

This cannot work, as two system calls take different arguments: futex() takes
a __kernel_old_timespec and futex_time64() takes a __kernel_timespec.

You cannot derive anything about the ABI of the C library based on whether
the macros are defined or not. Either you convert the arguments passed into
the system call into the format expected by the kernel, or you pick the
correct system call based on sizeof(struct timespec).

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
