Return-Path: <SRS0=Q8j1=OA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B00C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 07:18:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C28AB611C1
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 07:18:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C28AB611C1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAa9u92/XEmnis4r7U8Et9m/5WHlfvvnvfEpnAxbNCM=; b=ko/A3aNOxQwTmF
	de2AGPlQ7Hw4Hc5Tt4kdkdUDPgYIZZdxZQeIqFWMCkVqfBEoKT/Sa3AjvLyoscpIwyH4ukR3rg1pv
	PxJE4jl/twpqkyqex9B6/bMdOfe16wOCQW+0kbI+DehdqezAc52jXUA0jBH+J6KayoHggAOLvnQuM
	ICPWvf0ryqIjSOrUvzgDVslIaAZRYVQ4aja+gozwMb5lhWE6ydT1bwK1DmypZUj30JPGspP3gX8n0
	CQL6GaLHfMpvOxsUEOvy8ycdPUQde0k3T7wEn8vnghtjh/Aat8o5wyZ+VoD5GveBdmD3YEUEom84j
	e1HyEuLmWCxb2DUc0Y0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOanZ-00C5KN-1l; Fri, 10 Sep 2021 07:18:09 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOanV-00C5JB-LB
 for linux-riscv@lists.infradead.org; Fri, 10 Sep 2021 07:18:07 +0000
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MmlCY-1mphny2UY2-00jmlu for <linux-riscv@lists.infradead.org>; Fri, 10 Sep
 2021 09:18:00 +0200
Received: by mail-wr1-f49.google.com with SMTP id m9so1216278wrb.1
 for <linux-riscv@lists.infradead.org>; Fri, 10 Sep 2021 00:17:58 -0700 (PDT)
X-Gm-Message-State: AOAM5312C0to8bJDj6wlw/7Aj4pZC2/evDGKSVjfPl9b/hLI6u+Iwz+0
 OozReQz/8r3OOQmbWfN4keycvqIdOwRli6yxHkY=
X-Google-Smtp-Source: ABdhPJwrbgLloo2fUfV0F1y+DjeVojddJo/NGS3JE8zJBWWUwMMXJyQ7U3KAVIMfF07awE0ex7J9mnAabJtokGqgvlQ=
X-Received: by 2002:adf:f884:: with SMTP id u4mr7688308wrp.411.1631258278655; 
 Fri, 10 Sep 2021 00:17:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210910043102.3616198-1-alistair.francis@opensource.wdc.com>
 <20210910043102.3616198-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20210910043102.3616198-2-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 10 Sep 2021 09:17:42 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3ZmoUut+rQo7zcoRyT+Nsaw7Jk_qQ3YfsHb+Bzacn_nw@mail.gmail.com>
Message-ID: <CAK8P3a3ZmoUut+rQo7zcoRyT+Nsaw7Jk_qQ3YfsHb+Bzacn_nw@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] perf bench: Add support for 32-bit systems with
 64-bit time_t
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
X-Provags-ID: V03:K1:D9/zlohNRU6zze8RouVswsWRE5hNhTnxhcPFJ+6iBJvAJlRAF7u
 cAXd3E8+EqqlCYe+H/pwBtTUQy3PAjNKZRLgVWoLJRt/r2L/t9r1Rryq22tgvuYiJC5Dpqx
 VDOArvovK7kp3kn1oYjCZNNuxRj72S7E+BMUdHQWTCDcko4Z6g3YFAZyzFqOSRTmBqJy5Pn
 jGkIlhkQwuirAvMBr/9+A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8JWBoKYOS+Y=:LKFNtIrFhdn9XhbyKzBLcF
 X+cRhoJqJ7IG+5OLwOrhVVhFzhWP4PsNEQvW8V/UlQ9kQuMKNbOuePD0GGMt/eP0+TbUcsLoF
 ZsV9N4HJX5GfPvF6CYIR/pBDg//elrAPsC9IB9CbM1knlwRVoJNHLmKwQGsUWEpL0/+XtdFKM
 yTFSmDfDRCPFwYvcfslv+Y35X6I/eyGeRk7Ao1HEwfBJeFyh9TH9QkLcu5qTVvoHE9mxHKG3K
 LTviQCID1UH4osr6dl31cLdrHKndWjuaMC+sFnnxFRwL7vxezrwxDkjvAujsBTp0Gu3V6arsx
 RscgNEtKNkDAqg51nz3deocQXV5JRDe/+n3vOIPUYwU1TYlfWZrRm1d5ls0RU18urSPe4RDQM
 lNXJJS8MKHD7CnqI1VXsNjZgn7+tK5zyWdyEoJnRfFDKG22qiqnUQhTtrSK2cyNNtT6hZfNpC
 7fTWI+r+l2n0gBIzPXhK2JSxJQ4KCt+wWuuEEb6hLLl+J/YYksZB/PF6mgMYc8ngt6tAi+XCC
 RT4WfREmTK1HppeaLj8EWglJn9mPNy+qCZQmVMouaykWfhiMoQhEPm7C8x7tZEooFTxZzNG/2
 aAyf//x1su8rwGQGaRTD7Jzb69ak61ge3Nswj8Ehrve3Jlggmfk5z6ZAITjrZqHWBAofXjidH
 Azo7B/BZQjuTB2wC0b+nzOuU4i5+Wx2QA+lQwYLWiBobLKzX3UZz9n1eS1w2rX+jvrRaRrZH/
 wz8oPfw0useuMEqNh+8DyEium4XrWc0ecdjndQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_001806_037335_17EF2949 
X-CRM114-Status: GOOD (  24.81  )
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

On Fri, Sep 10, 2021 at 6:31 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> time_t and as such don't have the SYS_futex syscall. This patch will
> allow us to use the SYS_futex_time64 syscall on those platforms.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  tools/perf/bench/futex.h | 43 +++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/tools/perf/bench/futex.h b/tools/perf/bench/futex.h
> index f80a4759ee79b..09c5596726c60 100644
> --- a/tools/perf/bench/futex.h
> +++ b/tools/perf/bench/futex.h
> @@ -27,6 +27,12 @@ struct bench_futex_parameters {
>         unsigned int nrequeue;
>  };
>
> +/* A version of 'struct timespec' with 32-bit time_t and nanoseconds.  */
> +struct __timespec32 {
> +       __kernel_long_t tv_sec;
> +       __kernel_long_t tv_nsec;
> +};

Why not use the existing __kernel_old_timespec structure definition
from the header?

> +#if defined(SYS_futex)
> +       if (sizeof(*timeout) == sizeof(struct __timespec32))
> +               return syscall(SYS_futex, uaddr, op | opflags, val, timeout, uaddr2, val3);
> +
> +       if (timeout && timeout->tv_sec == (long)timeout->tv_sec) {
> +               struct __timespec32 ts32;
> +
> +               ts32.tv_sec = (__kernel_long_t) timeout->tv_sec;
> +               ts32.tv_nsec = (__kernel_long_t) timeout->tv_nsec;
> +
> +               return syscall(SYS_futex, uaddr, op | opflags, val, ts32, uaddr2, val3);
> +       } else if (!timeout) {
> +               return syscall(SYS_futex, uaddr, op | opflags, val, NULL, uaddr2, val3);
> +       }
> +#endif
> +
> +       errno = ENOSYS;
> +       return -1;

Similarly, I think just using the kernel's constants like __NR_futex instead of
SYS_futex would be more appropriate here, this way you know if futex_time64
is available and don't have to do the emulation for running the binary
on pre-5.1
kernels. Perf already uses __NR_perf_event_open, __NR_getcpu, and
__NR_setns instead of the SYS_* versions.

         Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
