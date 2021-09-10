Return-Path: <SRS0=Q8j1=OA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5B90C4321E
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 00:46:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 920E160C40
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 00:46:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 920E160C40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ntWdnUXSzIvumRa3OM3wTPpEipUKTknRrjNh5JI7eIk=; b=vdD27sIh00Q4rn
	ARFsBLYxgot9z+qH3xRV5bqhA3vLdXmtPgSn+idu8QTE2zGT0s2oNCKJVnrze9U9A4SBIgf9SxI4C
	qDSrZzW41TBOBo8FUmgaud+PGmfnjBxOhC7yEJ5bNnFGDTLrYjB4QWpi4s3ttqbmjVEkeWRO4Vpbx
	df3lFSCtWceRmDpGzbcgXmQ48HOCQzg571gR3YlPg1O+sJ3w9gFTkdYGCjUNtbNdkNSm/XWGO7OYv
	vHzh1wwLAFlCw+zUbAz+hb8ETDivXISFNTT2xdNM/oe65okDEED5FaJvoaqeOLeTfVVZFGeHTG4Om
	31VL+Q9rp5IvzIOtopKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOUg0-00BREw-PU; Fri, 10 Sep 2021 00:45:56 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOUfu-00BRBX-VO
 for linux-riscv@lists.infradead.org; Fri, 10 Sep 2021 00:45:52 +0000
Received: by mail-io1-xd2e.google.com with SMTP id a15so246534iot.2
 for <linux-riscv@lists.infradead.org>; Thu, 09 Sep 2021 17:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H9y8H6QOl79WQKF3o6TMJOZw1Wb4+/uT/dZLumITW4A=;
 b=Nh2OuGStj34DcE5wDIX/unXlXbeq8oW6E+c7X7QlPGDMGLbg2mFT+xeu3eWmddsnBo
 AnDW7/w48XY/1fC8rZ4GcABgXQDdrHofdgfGOjH22Lb7cqkDMJTQ8O5qGY8c0n7qYyW+
 ZGklISa8lfV8tRiEa/bW1Cjv50VKIvO2PTVkKcVYy61GT859uVrLVUJvOIgWyRX0uyvZ
 0rTeR1CdWHZrohWHZ04+jlShW6SUPPOktciMTF21fmBeb51w3ZxTwLsGEcZ9VPluTJuI
 NYQtCT7tL3kUl2/1XbzDJKoHi5Yp4tXIQJWr0s2Of7iFTelNGAnRBobRI9lhCsg1LnaI
 wRdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H9y8H6QOl79WQKF3o6TMJOZw1Wb4+/uT/dZLumITW4A=;
 b=iRv2830qVq/zlRop1xyz8UlIsAq9I49OQVGZacD8lXXcBCq0qmL/fI/QJtZp547nVq
 Jdkt2D3wtPv/dGRKsmF/R2vLFJeMQvVNM7+7GXfphmRqKvrrMp6ny6Zwo3XoTYiSku7W
 S3I9zlCIvTbOdbXxh11FLunINqNMcaXeDhnjXKFkwGpS8mdk7JOce/bfJDHDeV2r0s5a
 cDazq4CHlhmJDDjBX0Mh3P1KyWEMpv7AReyWW2tAMExbPcAhodboJBX35YsZday4YB0W
 B8A4e+KWsQ4dMNsfnRftU3+Y6LkUjP4wrSfwc6VUhjFkjoI8ODoXWIP3sAj4n8/sRlVD
 QDMg==
X-Gm-Message-State: AOAM53080ZoLxyRQwl9C0eT+vrZnvlC2DKOctGIjL9uQ5W+RTM1/71rq
 if9sY80KQ9pVlFBemiU9kcG/7gfpnQ3lKBDR6FA=
X-Google-Smtp-Source: ABdhPJxgh40885LGDF1Y8duB3BiiIUqjNpckUI4hV0vDw+Mlj+oFyNHDNb8BneWrcWkFLiU3nhSWVC+1uQToqlxoKKU=
X-Received: by 2002:a05:6638:e8f:: with SMTP id
 p15mr2196917jas.114.1631234749514; 
 Thu, 09 Sep 2021 17:45:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210909042543.1982893-1-alistair.francis@opensource.wdc.com>
 <CAK8P3a1Udjzy=M4Vs8pGCKdedwtv-vPRjxbTcvTL6kP=yXSs0A@mail.gmail.com>
In-Reply-To: <CAK8P3a1Udjzy=M4Vs8pGCKdedwtv-vPRjxbTcvTL6kP=yXSs0A@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 10 Sep 2021 10:45:23 +1000
Message-ID: <CAKmqyKOO5DiEBUJRY_2Be97LfqoSyatHDB_iCeZqw0toTsrkXw@mail.gmail.com>
Subject: Re: [PATCH] perf bench: Add support for 32-bit systems with 64-bit
 time_t
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alistair Francis <alistair.francis@opensource.wdc.com>, 
 linux-riscv <linux-riscv@lists.infradead.org>, linux-perf-users@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, Darren Hart <dvhart@infradead.org>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Atish Patra <atish.patra@wdc.com>, 
 Alistair Francis <alistair.francis@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210909_174551_109870_4D255272 
X-CRM114-Status: GOOD (  26.17  )
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

On Thu, Sep 9, 2021 at 6:20 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Sep 9, 2021 at 6:25 AM Alistair Francis
> <alistair.francis@opensource.wdc.com> wrote:
> >
> > From: Alistair Francis <alistair.francis@wdc.com>
> >
> > Some 32-bit architectures (such are 32-bit RISC-V) only have a 64-bit
> > time_t and as such don't have the SYS_futex syscall. This patch will
> > allow us to use the SYS_futex_time64 syscall on those platforms.
> >
> > This patch does not attempt to gracefully allow 32-bit architectures
> > with both SYS_futex and SYS_futex_time64 to support a 64-bit time_t.
> > This patch only applies to 32-bit architectures with a 64-bit time_t.
> >
> > Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
>
> Hi Alistair,
>
> I know you've made this mistake before and I've pointed it out
> several times. Please don't do this again, and try to fix up the
> ones you already broke!
>
> > +/**
> > + * Some newer 32-bit architectures (such as RISC-V 32-bit) don't have
> > + * the SYS_futex syscall and instead only have the SYS_futex_time64 call.
> > + * Let's ensure that those still compile and run by just using the
> > + * SYS_futex_time64 syscall. On these systems `struct timespec` will use a
> > + * 64-bit time_t so the SYS_futex_time64 call will work.
> > + */
> > +#if !defined(SYS_futex) && defined(SYS_futex_time64)
> > + #define SYS_futex SYS_futex_time64
> > +#endif
>
> This cannot work, as two system calls take different arguments: futex() takes
> a __kernel_old_timespec and futex_time64() takes a __kernel_timespec.
>
> You cannot derive anything about the ABI of the C library based on whether
> the macros are defined or not. Either you convert the arguments passed into
> the system call into the format expected by the kernel, or you pick the
> correct system call based on sizeof(struct timespec).

Thanks Arnd. Sorry I hadn't looked at this in a while and forgot that
it's more complex.

I have some patches to fix this up. I'll send them later today.

Alistair

>
>        Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
