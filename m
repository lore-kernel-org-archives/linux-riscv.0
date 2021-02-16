Return-Path: <SRS0=wY1U=HS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B04FC433E0
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 13:45:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F3B64DA8
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Feb 2021 13:45:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F3B64DA8
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LKPmzgdNu6ZcPx8DEelo5q3DoDcDJnyE/uQxXBBaZXY=; b=n7RqDVDk0zLYfr4RnZV0rW1wr
	KWaioRCBHP/mqlOJRmqS6kH/oH1Q8V1KEq7KOQVjA12/APl5K0lqiwORcKV+MsJyyV759/N50G20j
	DWb6ykgyPYq86fJ82OLlIzyMvKVMQy9gHM0Dvva0VI3O2eXH0B69DoJThhVtMYna2dqkxFZGrAVcb
	tZ9YRvEq8PBEJbxxlAwdtgeZA2/dHx30QnReBqSquDHvw4Ps3pZGSLbWcJXCS8ZGP2zOS2De1ySzJ
	XE3JAOMGzA3Cwh6RIZ32dVpFwuTTY1inOAnubJEPcWpKaltNJL8hWov/gzC50UP2VsVvwgaZkD92T
	yG4lNpn0Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lC0fN-0007RK-JE; Tue, 16 Feb 2021 13:45:25 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lC0fK-0007Qc-QM
 for linux-riscv@lists.infradead.org; Tue, 16 Feb 2021 13:45:23 +0000
Received: by mail-qk1-x72d.google.com with SMTP id v206so9390688qkb.3
 for <linux-riscv@lists.infradead.org>; Tue, 16 Feb 2021 05:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ru6kEOSEblzMS8sJpCTYk9Zye/4zxUZFCnZm62Z9cuQ=;
 b=jfhAl+e/pxMzGEiIHEYpgZZSrs8JccuDwXlJ0r1LamXZ0K4c4PzN+pzpyXawNj5Crk
 YAb13a/SzSu2snzfPFzQr3FSOuv5vwyb8lUObLAbDvxl2VpYx2omQMYcDuziy+KmJxZM
 BR5ZwbQsdyxOs6gNRuUok55X6qifjFAeuDaRJ97iP4x5mMjQwwVc7aouSXQmXxN+t4kk
 Zb03VtmY9yE1ou7d7B6EJ4LL1xGRW6FGQuyBp8aFoLLPSr73zbgluQk5twtUGzwp0UZX
 sEFawjGHMDAYkVVN02jnnLlspUXv9EChjR5dNbKRK/ceROAjYX5kTv3EpKhc/Tcu/W5z
 46mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ru6kEOSEblzMS8sJpCTYk9Zye/4zxUZFCnZm62Z9cuQ=;
 b=D5Dd5GOkFw3xVg4Yali3tkEjcKeQc79c7TXR1U/7DSnvFUXrRT+SxhhnhKo1M+Uso0
 5dYA8UMKsmUacYiBFcvTIihAcHZCPh/0FH/Qrm+WX8IALCDWk+V+qHSYsBljP0P9epCp
 ObKyy4xPPYZSVqqOuw77Fp1dp64i9Vda/AW3/UZntjd+H3dKW9F64gD1+4F5LMG1pHzL
 SX1OEIr6lEJkxyJRI7RvWR920PMehcyIxM32wOx3ZMTjZ1f96NOX2fKCjtEHE0bxF1Qm
 qsdJdF8KeQcYTsg1gIjGxrbZWv7pTK+9uJHwQdi+XYsJysqkqfEELJqFtjOlkXjHHR6e
 xOmg==
X-Gm-Message-State: AOAM5327eJHunjiCdp4WbG07G1Kq00FzNqFGHevyHb8Bus7n6pM499f/
 C2uFlUnKLU1cFt4rDg908JNnB96affIq6ZFfFjsb/Q==
X-Google-Smtp-Source: ABdhPJyImnKIYiSh1kY4z4WN2xM8tWUEidFcQla7zPD3SMrRrsLN6zW1gm1MWiyj8qV6+icLw2LCX3iKTWtT49q/n4k=
X-Received: by 2002:a05:620a:410f:: with SMTP id
 j15mr20063309qko.424.1613483120420; 
 Tue, 16 Feb 2021 05:45:20 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
 <mhng-02b88d43-ede8-48f9-82f1-c84201acb7a8@palmerdabbelt-glaptop>
 <CACT4Y+aN3LvgaBc_zmW=t=D7ChU-jrWYnjt5sZ2GEDQhg_BC9A@mail.gmail.com>
 <CACT4Y+aC19DaNOm87EO3cER2=MEmO9pmtUxzVmRtg9YhZKuMVA@mail.gmail.com>
 <20210118145310.crnqnh6kax5jqicj@distanz.ch>
 <CACT4Y+bFV6m1LCYb1nO7ioKJK99916D76sJ+H-LgBjWx6biF5w@mail.gmail.com>
 <CACT4Y+bmDKNnykeTP9yKjje3XZjbXY3De+_e3fMFOMoe0dnARw@mail.gmail.com>
 <6e9ee3a1-0e16-b1fc-a690-f1ca8e9823a5@ghiti.fr>
 <CACT4Y+adSjve7bXRPh5UybCQx6ubOUu5RbwuT620wdcxHzVYJg@mail.gmail.com>
 <CACT4Y+ZNJBnkKHXUf=tm_yuowvZvHwN=0rmJ=7J+xFd+9r_6pQ@mail.gmail.com>
 <CACT4Y+awHrJfFo+g33AiAnCj3vq6t6PqbL-3=Qbciy6dAJfVWg@mail.gmail.com>
In-Reply-To: <CACT4Y+awHrJfFo+g33AiAnCj3vq6t6PqbL-3=Qbciy6dAJfVWg@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 16 Feb 2021 14:45:08 +0100
Message-ID: <CACT4Y+ZO35HALQevcqgFR33hUf-6NVF0Z6qFyu8XJm-3eBy4SQ@mail.gmail.com>
Subject: Re: riscv+KASAN does not boot
To: Alex Ghiti <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210216_084522_938129_43F75F94 
X-CRM114-Status: GOOD (  34.46  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Bjorn Topel <bjorn.topel@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Andreas Schwab <schwab@linux-m68k.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Tobias Klauser <tklauser@distanz.ch>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Feb 16, 2021 at 12:25 PM Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Tue, Feb 16, 2021 at 12:17 PM Dmitry Vyukov <dvyukov@google.com> wrote:
> >
> > On Fri, Jan 29, 2021 at 9:11 AM Dmitry Vyukov <dvyukov@google.com> wrote:
> > > > I was fixing KASAN support for my sv48 patchset so I took a look at your
> > > > issue: I built a kernel on top of the branch riscv/fixes using
> > > > https://github.com/google/syzkaller/blob/269d24e857a757d09a898086a2fa6fa5d827c3e1/dashboard/config/linux/upstream-riscv64-kasan.config
> > > > and Buildroot 2020.11. I have the warnings regarding the use of
> > > > __virt_to_phys on wrong addresses (but that's normal since this function
> > > > is used in virt_addr_valid) but not the segfaults you describe.
> > >
> > > Hi Alex,
> > >
> > > Let me try to rebuild buildroot image. Maybe there was something wrong
> > > with my build, though, I did 'make clean' before doing. But at the
> > > same time it worked back in June...
> > >
> > > Re WARNINGs, they indicate kernel bugs. I am working on setting up a
> > > syzbot instance on riscv. If there a WARNING during boot then the
> > > kernel will be marked as broken. No further testing will happen.
> > > Is it a mis-use of WARN_ON? If so, could anybody please remove it or
> > > replace it with pr_err.
> >
> >
> > Hi,
> >
> > I've localized one issue with riscv/KASAN:
> > KASAN breaks VDSO and that's I think the root cause of weird faults I
> > saw earlier. The following patch fixes it.
> > Could somebody please upstream this fix? I don't know how to add/run
> > tests for this.
> > Thanks
> >
> > diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
> > index 0cfd6da784f84..cf3a383c1799d 100644
> > --- a/arch/riscv/kernel/vdso/Makefile
> > +++ b/arch/riscv/kernel/vdso/Makefile
> > @@ -35,6 +35,7 @@ CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
> >  # Disable gcov profiling for VDSO code
> >  GCOV_PROFILE := n
> >  KCOV_INSTRUMENT := n
> > +KASAN_SANITIZE := n
> >
> >  # Force dependency
> >  $(obj)/vdso.o: $(obj)/vdso.so
>
>
>
> Second issue I am seeing seems to be related to text segment size.
> I check out v5.11 and use this config:
> https://gist.github.com/dvyukov/6af25474d455437577a84213b0cc9178
>
> Then trying to boot it using:
> QEMU emulator version 5.2.0 (Debian 1:5.2+dfsg-3)
> $ qemu-system-riscv64 -machine virt -smp 2 -m 4G ...
>
> It shows no output from the kernel whatsoever, even though I have
> earlycon and output shows very early with other configs.
> Kernel boots fine with defconfig and other smaller configs.
>
> If I enable KASAN_OUTLINE and CC_OPTIMIZE_FOR_SIZE, then this config
> also boots fine. Both of these options significantly reduce kernel
> size. However, I can also boot the kernel without these 2 configs, if
> I disable a whole lot of subsystem configs. This makes me think that
> there is an issue related to kernel size somewhere in
> qemu/bootloader/kernel bootstrap code.
> Does it make sense to you? Can somebody reproduce what I am seeing?



I am debugging the next issue with VDSO. clock_gettime is broken in
some weird way.
syzkaller has this function:

static uint64 current_time_ms(void)
{
        struct timespec ts;
        if (clock_gettime(CLOCK_MONOTONIC, &ts))
        //if (syscall(SYS_clock_gettime, CLOCK_MONOTONIC, &ts))
                fail("clock_gettime failed");
        return (uint64)ts.tv_sec * 1000 + (uint64)ts.tv_nsec / 1000000;
}

When using clock_gettime it producer some nonsense that breaks all
timeouts (in particular monotonic time goes backwards):
pid=4343 now=836038064151457975
pid=4343 now=836038064151457975
pid=4343 now=836038064151457970
pid=4343 now=836038064151457971

When I tested it calling real syscall, it works as expected:
pid=4876 now=2493379
pid=4876 now=2493392
pid=4876 now=2493395
pid=4876 now=2493409
pid=4876 now=2493414

Is it a known issue? Any ideas?

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
