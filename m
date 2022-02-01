Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C520FC433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Feb 2022 05:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmFxWz+/OVzvlucaiHWZAqYE9Ib8F9ofE/atLzEIdXk=; b=xJHYtWqx1RTdyC
	mSJtPq+MLUamdCAIsIPbHpD2sq/0xGN9+qZzf0POSxOfNtV7CS4iHZo9hR8gcEzZwqncNQEKAcs/h
	/Mt5hiWPMuF0TcOCKb1JEDIABB0FuN4l8KLUq1hrQ2dGaFioCA++lYn3Dor0xou7CibdJ7ypiYRIX
	FDrUMCxfKun8z9TU8P/6KrhJ4LKxZEN4w/sSZWIyDlRTSd0gt6TYxok+71XQEbw8s6e2SBc9Bw62s
	Z3cB2KQhACCMooxFHAtuB/4sVtHuecicsl6jjxVg+/9/V32q/Lca99ZDdIm5Ilpn01GlnZXVkJpHC
	ySIgZssxnOMUrvZHgmNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nElrW-00BEzE-8B; Tue, 01 Feb 2022 05:37:54 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nElrT-00BEy8-M8
 for linux-riscv@lists.infradead.org; Tue, 01 Feb 2022 05:37:53 +0000
Received: by mail-io1-xd32.google.com with SMTP id w7so19858325ioj.5
 for <linux-riscv@lists.infradead.org>; Mon, 31 Jan 2022 21:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=HaH4YYFQUGYgJm+BChmNqccqpH4G/GlGC8W4GeH5Y7s=;
 b=ek90t6PLRiryoISkxPbRM2CkM1aeFIDR54hPh8p2tPqh3IRwwA5RFr21jNosMYPbRA
 MEQThNMibttROc5jLYq10u7/MxJ13RELBMj4mL13BFFBWUUN9nLUAWV2XZoTaiedlFXV
 vIqZWpR/bwqH2+aWTpjx/GMDmf6g1sx3MRO1KCEZjpsZExj/GaPlHw5iT+z4Cx+IxpHC
 OQYG6sy4mGCh+Ok9M6XD5zmtvhNQNFKjS9QSzAOSqazoVWNJFfeWJDLReT9n/hguNGTM
 thum/I0sEzmXKEGXIHGXPL2XXXXuq+gvl/AQE5cqbJGc3Xw5c/pVtkA7IYnMeegLXtip
 VLbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HaH4YYFQUGYgJm+BChmNqccqpH4G/GlGC8W4GeH5Y7s=;
 b=SKmpGRZV9eII3MA7Tmidq3dtkru0AnMhDJqdanG2mAUmYo4+MeTuIRPv7yF1l+Xhau
 gVF3I26ZbgXDtpWzbvowADILQzCMNAicIAu3ZxM2aLgSbz/R1X1ALDUuuUhJt4YZDgcT
 bTnkQLq6tUV8SJS22nKD2smWE1ZRig38H6ZbWLEwJQdEngdujemzngNMoclVT+yWm5nL
 nPxlkjp3RXXwcUizjXm3pX83SM0JZZ5jyj2083u0Jg+0VH2SrBr03VAzo4pPobcOLrsb
 s+YgKHTVYf+zKjdBi4gn8S+/kuCvIGE8NHx133OVLuPaQznu37OvbKx6qJnACuFjeI1y
 inXw==
X-Gm-Message-State: AOAM5331WVO9gFXh5PMLopcP3prO8axQR59gWOzf7iBmx07KPZNOPXZd
 YeDRTvqDsNO/4Cbvb2se6tVcdWGKtMYmVV3c3+s=
X-Google-Smtp-Source: ABdhPJzwM6mUguBtwoWwo4q/nFsH4dB5BMq1zKQG9sN0wLToTQqNN6r6wPd4Nr4rL4eQfyyeQPi5tD0EN5Ti+LQuN+U=
X-Received: by 2002:a05:6638:1028:: with SMTP id
 n8mr12605683jan.318.1643693870129; 
 Mon, 31 Jan 2022 21:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20211209235857.423773-1-alistair.francis@opensource.wdc.com>
 <YbNX3mRT0A9/N2il@kernel.org>
In-Reply-To: <YbNX3mRT0A9/N2il@kernel.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 1 Feb 2022 15:37:23 +1000
Message-ID: <CAKmqyKNMJCHHMo01aCiyJRx926jYXz+sPgVwwZ7Kr1x0w81R2Q@mail.gmail.com>
Subject: Re: [PATCH v5 1/6] perf bench futex: Add support for 32-bit systems
 with 64-bit time_t
To: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, 
 Darren Hart <dvhart@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Namhyung Kim <namhyung@kernel.org>, 
 Jiri Olsa <jolsa@redhat.com>, linux-perf-users@vger.kernel.org, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Mark Rutland <mark.rutland@arm.com>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>,
 Alistair Francis <alistair.francis@wdc.com>, 
 Atish Patra <atish.patra@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Arnaldo Carvalho de Melo <acme@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_213751_756229_F6AB22CE 
X-CRM114-Status: GOOD (  19.54  )
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

On Fri, Dec 10, 2021 at 11:36 PM Arnaldo Carvalho de Melo
<arnaldo.melo@gmail.com> wrote:
>
> Em Fri, Dec 10, 2021 at 09:58:52AM +1000, Alistair Francis escreveu:
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> > time_t and as such don't have the SYS_futex syscall. This patch will
> > allow us to use the SYS_futex_time64 syscall on those platforms.
> >
> > This also converts the futex calls to be y2038 safe (when built for a
> > 5.1+ kernel).
> >
> > This is a revert of commit ba4026b09d83acf56c040b6933eac7916c27e728
> > "Revert "perf bench futex: Add support for 32-bit systems with 64-bit time_t"".
> >
> > The original commit was reverted as including linux/time_types.h would
> > fail to compile on older kernels. This commit doesn't include
> > linux/time_types.h to avoid this issue.
>
>   10     9.99 alpine:3.12                   : FAIL gcc version 9.3.0 (Alpine 9.3.0)
>     In file included from bench/futex-hash.c:29:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>        37 |  __kernel_old_time_t tv_sec;  /* seconds */
>           |  ^~~~~~~~~~~~~~~~~~~
>     In file included from bench/futex-wake.c:25:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>        37 |  __kernel_old_time_t tv_sec;  /* seconds */
>           |  ^~~~~~~~~~~~~~~~~~~
>     make[3]: *** [/git/perf-5.16.0-rc4/tools/build/Makefile.build:139: bench] Error 2
>   11   114.27 alpine:3.13                   : Ok   gcc (Alpine 10.2.1_pre1) 10.2.1 20201203 , Alpine clang version 10.0.1
>   12   100.12 alpine:3.14                   : Ok   gcc (Alpine 10.3.1_git20210424) 10.3.1 20210424 , Alpine clang version 11.1.0
>   13   101.06 alpine:3.15                   : Ok   gcc (Alpine 10.3.1_git20211027) 10.3.1 20211027 , Alpine clang version 12.0.1
>   14   101.96 alpine:edge                   : Ok   gcc (Alpine 11.2.1_git20211128) 11.2.1 20211128 , Alpine clang version 12.0.1
>   15     6.98 alt:p8                        : FAIL gcc version 5.3.1 20151207 (ALT p8 5.3.1-alt3.M80P.1) (GCC)
>     In file included from bench/futex-hash.c:29:0:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>       __kernel_old_time_t tv_sec;  /* seconds */
>       ^
>     In file included from bench/futex-wake.c:25:0:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>       __kernel_old_time_t tv_sec;  /* seconds */
>       ^
>     In file included from bench/futex-wake-parallel.c:31:0:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>       __kernel_old_time_t tv_sec;  /* seconds */
>       ^
>     make[3]: *** [bench] Error 2
>   16    73.65 alt:p9                        : Ok   x86_64-alt-linux-gcc (GCC) 8.4.1 20200305 (ALT p9 8.4.1-alt0.p9.1) , clang version 10.0.0
>   17    72.34 alt:sisyphus                  : Ok   x86_64-alt-linux-gcc (GCC) 11.2.1 20210911 (ALT Sisyphus 11.2.1-alt1) , ALT Linux Team clang version 12.0.1
>   18     7.58 amazonlinux:1                 : FAIL gcc version 7.2.1 20170915 (Red Hat 7.2.1-2) (GCC)
>     In file included from bench/futex-hash.c:29:0:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>       __kernel_old_time_t tv_sec;  /* seconds */
>       ^~~~~~~~~~~~~~~~~~~
>     In file included from bench/futex-wake.c:25:0:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>       __kernel_old_time_t tv_sec;  /* seconds */
>       ^~~~~~~~~~~~~~~~~~~
>     make[3]: *** [bench] Error 2
>   19     8.28 amazonlinux:2                 : FAIL gcc version 7.3.1 20180712 (Red Hat 7.3.1-13) (GCC)
>     In file included from bench/futex-hash.c:29:0:
>     bench/futex.h:37:2: error: unknown type name '__kernel_old_time_t'
>       __kernel_old_time_t tv_sec;  /* seconds */
>       ^~~~~~~~~~~~~~~~~~~
>     make[3]: *** [bench] Error 2
>   20    79.16 centos:8                      : Ok   gcc (GCC) 8.4.1 20200928 (Red Hat 8.4.1-1) , clang version 11.0.1 (Red Hat 11.0.1-1.module_el8.4.0+966+2995ef20)

Is there a way I can reproduce this failure?

Alistair

>
>
> Still building on the other containers.
>
> - Arnaldo

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
