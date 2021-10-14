Return-Path: <SRS0=/Gqo=PC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0EBC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 06:47:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38D8F61040
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Oct 2021 06:47:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 38D8F61040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bvv/o5F0OQgq0v/Wj5Ni/CgnpVctNPC9wa5yRtSlY1o=; b=gxH1kwatKaPlBo
	+eOdzqKjl3vSN4wTxOyvvGc47/83sW5Aid+8z9iukesyT5Yi8L3M1U3eZMvvVhNKjBp/ZdXnZnPe9
	b318yk5G2EZHUxXbvITOrvd1LXxDom3ZGPrG9bkzJhbOmmP9fA7mwczF8cLdRfLHigUmHth5nf9Ot
	oTrMeXqeJkI5f6vgz7vjL7qB8zF/Rksz50edhpuymCjQ4LAhwzhNh0z2mQo98UYriudtE6gb01ttI
	N1RAPMGG01Xgqmp8BnADMuiTTrs84WWXrNKbqeCMLVbrIn3pt7l8a6PwwF0jkaOOlBeNscGMmWrL7
	4MYbM6dkiZjMJ+C6VE5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mauVu-001kaJ-Qi; Thu, 14 Oct 2021 06:46:50 +0000
Received: from mout.kundenserver.de ([212.227.126.134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mauVs-001kZ3-Bt
 for linux-riscv@lists.infradead.org; Thu, 14 Oct 2021 06:46:49 +0000
Received: from mail-wr1-f51.google.com ([209.85.221.51]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MlwJv-1n0Ndo3MUV-00j1ba for <linux-riscv@lists.infradead.org>; Thu, 14 Oct
 2021 08:46:43 +0200
Received: by mail-wr1-f51.google.com with SMTP id t2so16052439wrb.8
 for <linux-riscv@lists.infradead.org>; Wed, 13 Oct 2021 23:46:43 -0700 (PDT)
X-Gm-Message-State: AOAM5324Xmgh9h85N1f5O8KGQ/nO5wvdirt6odqBDSoUtUYITkohInWB
 xdE4oETyARLpmKqFfRtVAv4U/fub6YgmL+/Bgcg=
X-Google-Smtp-Source: ABdhPJwTCqhgxuA96DHGSSbNGZIt9ZH4cn9+BGQQWxFLDpCZuMZM/OdQF3b7gnabA4uMj57NtL173grRBisB/S/Xr9s=
X-Received: by 2002:adf:a3da:: with SMTP id m26mr4432597wrb.336.1634194003365; 
 Wed, 13 Oct 2021 23:46:43 -0700 (PDT)
MIME-Version: 1.0
References: <20211014055527.1238645-1-alistair.francis@opensource.wdc.com>
In-Reply-To: <20211014055527.1238645-1-alistair.francis@opensource.wdc.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 14 Oct 2021 08:46:27 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3YKrbFnKpy34dJE+ZjycqUgUhvp5gEvSBC1tRXz4LR7g@mail.gmail.com>
Message-ID: <CAK8P3a3YKrbFnKpy34dJE+ZjycqUgUhvp5gEvSBC1tRXz4LR7g@mail.gmail.com>
Subject: Re: [PATCH 1/2] perf bench futex: Use a 64-bit time_t
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
X-Provags-ID: V03:K1:qlfEZmZnKgidFlq+XM8YWzWSWe7kg/jqjaVbhtLse7TkQqy3o6I
 Tja6clYo+CVLZB+HVwRA68NfNuiaunG0tKX+FU2dp0/Wz4soCHwffThoF7qveF5icHtzTGq
 tcaFKYwcsJbxkkFfwNsDxTrBIC5YoRpQnPKedoz2o61LtSv2ihpMvEKRZF1UsMb1C4FKIKR
 oh6R45yKB+0hYTOR1ysyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:3/V71gshkIM=:6D9n5JzPRiS1SSeYG186Rf
 lvJ07YjN8nZSaTT+Q6Z64JSXW6tir7CrqcTrkoCtG7pgqdxIXfGgtsumVdL1zhEpaxyAfqgSS
 qPLgLCqGm8xBuUwXaixEuDFogfUCuUkTOoLxvFBsDbvjudMtkQ8W3mNDJddkn7+1uVdwhTlxY
 wvBuhZi7tBbpZqiAFC8sI5+45HGQSg5T7lpMXKyQnCHFH6VQngH4qsUwsHhbCQntBV6mF4cYa
 0aVJjJpOaUELDTp+kmEW9R6Ok0sg5NbrvEuwaMOaiyqI4Uwo9QBPvPKZ9BN1oVIFgOj0OZqwb
 VaS+vT2HG4CzaMs9qT968/Qd7CoyMNbB6rx3Fq9c7AQjEvlA66N7IDVmg6v86BcEHmPV0hISb
 JLhpag36Qk065xB/JsUUoNBHlWaxXVU3YXdGgZr4jIhjoePEXYS5xeYpvj1sCLUkcZOvo1nwF
 rtLLImIS80qWPdyDKH5DgBiBNx8VyDdF+PUta5voGZjsH8vdlLYsvmRGuBbSlfhD9tumnwMSC
 g5AEgMN/iryQkF6rUkCTI6PiBPoRW5bnRryLXgZJAZm/mZ8mdDpZLTsCQy5wJeLdiPqE/4Ymj
 kBrNWNuzYTEC2ONZP8UyCALzDwo2jqWGKlalPB9DZQH+7n/HNXS+7WaHS5EeOnnFaHwr0bHyV
 FtFXWqp8aGCI9TwOCGA7fEVnemmePJtuMkMEzKywQxROsey/pz1UqLlU4BwkUSHdLaHC6eSEB
 xuW3ylaZhb899CxffwfW1aNWQWHOl/5mAmX0hjWGJCKWgCyTnwouWe0qacG8EPaJoYTUMgJyp
 R3itKjgZ18Ob+Jfz9xpHNHpGElOpGLHhtFzh3H6Z1M6MQxsxAowoZ9u2lwI2favc5gSRWVj4P
 YcjbbRMgYK3BGDgXAuzA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_234648_744508_93630068 
X-CRM114-Status: GOOD (  13.17  )
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

> +/**
> + * We only support 64-bit time_t for the timeout.
> + * On 64-bit architectures we can use __NR_futex
> + * On 32-bit architectures we use __NR_futex_time64. This only works on kernel
> + * versions 5.1+.
> + */
> +#if __BITS_PER_LONG == 64 || defined(__i386__)
> +# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> +       syscall(__NR_futex, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +#else
> +# define futex(uaddr, op, val, timeout, uaddr2, val3, opflags) \
> +       syscall(__NR_futex_time64, uaddr, op | opflags, val, timeout, uaddr2, val3)
> +#endif

That __i386__ check looks wrong, was this meant to check for x32 instead?

In that case, I wouldn't bother, as x32 can also just use the futex_time64 call
like the normal 32-bit architectures.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
