Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD7D7C433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 06:52:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9952060C49
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 06:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9952060C49
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cXEEJq94RWE1vPEUD2oYF9F39lk9TGKnO4fLrYh7FI0=; b=b+FKs9e6FHCbjp
	LYYaKrXK35RH9HSmGoFcTwIrc/FoFKwAW8QZW+Yje8S1WyzdDSIUJzA6OCh3Xx0Edcb19Mum2+JTy
	H5dBNkW8iUvcA5Pydnyi6BZiA0HMyMFEYCU+tTgE7YbYHMDuJGPBr+ayIn/g69QrJpKPSdGvfaMi8
	jHoRP/TGX/e18qlJD7lHZADASEsYOEZence98oDeYxvRxPglybL1CXTSx8/guJ0B5l+n/PhxTOFUt
	mpALrxNriat0hEPPnYF4DO1cFJCP3XKzqal3ch7VwNZaUhrYqbGYwmDk6Yv4VN9zvhhUbSzzE+eZK
	IhQsGy0LYMBFliB5z5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maual-001lPP-FH; Thu, 14 Oct 2021 06:51:51 +0000
Received: from mout.kundenserver.de ([212.227.126.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mauai-001lOE-Jn
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 06:51:50 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52]) by
 mrelayeu.kundenserver.de (mreue009 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MXY2Z-1mF9A633Ed-00YyQT for <linux-riscv@lists.infradead.org>; Thu, 14 Oct
 2021 08:51:45 +0200
Received: by mail-wr1-f52.google.com with SMTP id t2so16088019wrb.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 23:51:43 -0700 (PDT)
X-Gm-Message-State: AOAM530MXwyvBtgqyNzimoneUO3MsuHzF9rnIbY0uEy5mgAbfkOdZPGM
 mcP8hXHEvglviGz/xE2y9jUvFrKdlsa9ZXSEf1U=
X-Google-Smtp-Source: ABdhPJyjkQmPWKvwtoJuywMTwdaB2QbiQeIa9CvSMEZ8lo+ku78lzm6zV4NgWZcj6r9FJxHxXDzR/T1V0OVEWXe/2uU=
X-Received: by 2002:a1c:2358:: with SMTP id j85mr17404148wmj.1.1634194303392; 
 Wed, 13 Oct 2021 23:51:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211014055527.1238645-1-alistair.francis@opensource.wdc.com>
 <20211014055527.1238645-2-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211014055527.1238645-2-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Oct 2021 08:51:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3jyJvghm0yZA=fjaZfdKamb=-wPcF2LTFaPEn-KGzhiw@mail.gmail.com>
Message-ID: <CAK8P3a3jyJvghm0yZA=fjaZfdKamb=-wPcF2LTFaPEn-KGzhiw@mail.gmail.com>
Subject: Re: [PATCH 2/2] selftests: futex: Use a 64-bit time_t
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
X-Provags-ID: V03:K1:2Gh5RtCGAPRqiv+Gbe906vDYh2rrg6zKUfoMXG4ixxuoarbtryS
 wQ+4zxyJbWJCqlZ+Sa+ep1GDN1rm1vF6nwHtgkrZKwwXsaoEqIgZtz/vvx0F1FFpb5C/maX
 oMjAKMe1AfJdR/q+nvELSsC11Nz4ggdlqDg+nYdwsKiS7fauemKHSfHVBmo742AXB2+MYiO
 2MrpX1tWkRCcgjGpNd5XA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:OUC4RpmU9CU=:pogs/JYDXbR4XFP6rWMEVw
 7RQ1rUskhIwachX0svvWxNI96ZSWVqaP7gm4+hnKxRTfUV0u3UTbsV5Dh5KXYjfaCF8n0jJZw
 JljzCpghkb7+LLUbfa9fmW7uGrqKkYno06P69KkxgDGnE0RquxwEPv7yBwGStqaT1bPDDwKCf
 3C/o5MgJMtyro7pVJil9KRolM9Js1dlwtZAbM5EMUFPBghCCvtNhKuyB+Id2NyD4aSXrZc56/
 azOrsBH1xC/7JYfACEeQur3BNdFLHDPcS/dA05/vuHaShwOWFUzWalyNGVBYpmKVnKCBIA62M
 VIuwhPcsC02HOsG1lEdDh5btX2ETvRecaRvCWS7MYmzalaKM2BJjoWjgttkld5gA+lbZsA+fX
 86Doq7n9ioY0wCjWltNmxT/FEbN53kAtXWu11eY/AgpcWL3evsG/nVyxc8fI7XXIRHLGG2tNN
 7IfBCxmdqklFS6sgN222n+mtY5B8fqcjlPijnqPkZQwqfOtPunzVhl3NCxm9/jlso934FR4R+
 E0yGmpFUEtBIwury3y9KNIDLOLKRWX7jE3ySJvN13/Wu5HprGs+hWGP34UW5u9lA4dfs5Irxp
 wWzXPD1Mg6b7+jfJU9fRD7TQRkfG4I8c2Orr4NhX6Xq8alkFyh6M5NoyiGx3U6vBFAv4Ap1nf
 xrnWGHq/aYsLj6xRqeAg9YXeE9wZkIw9q+obWTb6dLDlR3pSOfI2fI6RB3oRh0W09YbnFuKCF
 CMQwDlxxMshdpEAPhs3qifRSlk2LEWMEH0vQiIxutCoL2/YRFGYiS5y2fzThfRmMFTOQAph1X
 PveLgSDPK1HGVoeUItkF9T5bZEqNLaj6N6enXcMTNeFdwxQeW7/+a5/TRdcb9BArlqFYmnCLO
 5b3MYkIgs8u8CMv2sBzw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_235148_957314_B8634E65 
X-CRM114-Status: GOOD (  20.96  )
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

On Thu, Oct 14, 2021 at 7:55 AM Alistair Francis
<alistair.francis@opensource.wdc.com> wrote:
>
> From: Alistair Francis <alistair.francis@wdc.com>
>
> Convert the futex selftests to only use a 64-bit time_t. On 64-bit
> architectures this isn't a functional change. On 32-bit architectures
> we now only perform 64-bit time_t syscalls (__NR_futex_time64) and
> use a struct timespec64.
>
> This won't work on kernels before 5.1, but as perf is tied to the kernel
> that's ok.
>
> This allows the tests to run and pass on RISC-V 32-bit.
>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>

This looks correct to me, two minor comments:

> +struct timespec64 {
> +       long long tv_sec;       /* seconds */
> +       long long tv_nsec;      /* nanoseconds */
> +};

This is a bit different from the normal timespec definition, which has to
use a '__kernel_long_t' tv_nsec for POSIX compliance. The difference
is harmless, because the bit layout has the lower 32 bits in the same
position, and the kernel zeroes the upper 32 bits on the syscall boundary.

I would just use

#define timespec64 __kernel_timespec

for the same effect, since that is what __kernel_timespec is meant for.

> +#if __BITS_PER_LONG == 64 || (defined(__x86_64__) && defined(__ILP32__))
> +# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> +       syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +#else
> +# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> +       syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +#endif

The check for x32 user space looks correct here, but as I commented in
the other patch, I would keep it simple and use futex_time64() on all 32-bit
ABIs. There are approximately zero users of x32, and they don't benefit from
being able to run new perf binaries on pre-5.1 kernels when everyone else
can't.

        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
