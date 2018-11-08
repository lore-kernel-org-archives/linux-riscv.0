Return-Path: <SRS0=/DNs=NT=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0437C32789
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 10:30:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9FDCF20827
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  8 Nov 2018 10:30:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uX1lGSXE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="dO+dho+1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9FDCF20827
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gXSifSfEu4qcy6fHM0JEMk7mgmLew5hn2U0bn9rRLkI=; b=uX1lGSXEw3mEow
	4WXHU1OSGq34AuEhfTe1USmaALIILyFDBatO7WRA939edOZqLH562aLiwMZAfmWKpmqv6lOzd/xJu
	YUikbKhKCZRXCvZfZOnjGa2x/Xa44MH1Gvck/SKFPN7RY2lgCe/uLRLF6QJZB4wchSqrMylaTcPcR
	Hsrrpk7m1ACvIN49X5oA2p0VuSXi0n+roKy1VOgtTs1XbHJ3m6WceoXk7q2nBu8WG3J0ouYtj9eHs
	959lg6wumCwZ0kJHujHhWrRBSNFM4rxlcq5QurikepXsjLrwRlCmWlBypQdrS6QfAtifAal9mod/s
	3IRha+3knHdqg/r6szuA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gKha9-0001n6-Lq; Thu, 08 Nov 2018 10:30:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKha8-0001mx-IR
 for linux-riscv@bombadil.infradead.org; Thu, 08 Nov 2018 10:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kxL2C1J0oBQd2bdhWgmhIQm68wlwbgN3ZzYAllO3X1Q=; b=dO+dho+1cC3u03BoZ2JHTFUOH
 WQbm/dgESloUcqOth5WxqSBpZOVNz3nDkVbzkacvfxnfTwFHxTGjmLEAeEiHK6mvu8FpDSCC4ZTZ7
 9YDOqA0plysC1BzhUocKLI+OllL/2evcVWbtxBaoUen79/sYZxzLO0/a6uawsyoJ159orpN+ZFWQ6
 UyxtTEAgwx6S24pBN95AAmjkoBSSJ/Py0t0oYpEkJUlRTC8/WWIgu5uqYNBlq7pYqyYXATBN37x2y
 r8nGcpvX0azlpGcBjzxFp4k7CHVYdmNOFYZhZ2T//W18NaNZJE52I6+ZRFscQfCMXGlyPQJw2CvED
 ptLmu0C/w==;
Received: from mail-qk1-f194.google.com ([209.85.222.194])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKha5-0002mm-K7
 for linux-riscv@lists.infradead.org; Thu, 08 Nov 2018 10:30:35 +0000
Received: by mail-qk1-f194.google.com with SMTP id m5so1843442qka.9
 for <linux-riscv@lists.infradead.org>; Thu, 08 Nov 2018 02:30:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kxL2C1J0oBQd2bdhWgmhIQm68wlwbgN3ZzYAllO3X1Q=;
 b=uPYqftMPl99iEcWeJLeyPELMfRY0xW+0WPG88Zzla0x12o0wCNlv4oRBUPLlmPPDVD
 z10G3ICoSWSTALD00178PxFb+S/M9uxPd4vunQ5WvBhkBghjxNL/wdkFhH17pI9vy1hG
 qPxIuwsQvQnkk/9SpQeXiSSmEpEBxxtA7+nCao6PIVkWp4tSH/mNa1d0oM7LwiCxWXTV
 F2AYdL/mBr405eJ4LGsUT8garv2RXjx7H4chJqehS21M7EdQDjU7WmaIMY0Z9L2ERfUe
 t5lPGAI437K3Y//vfS7u9CEQOnCoivN2+9mUPAskmX2cyYNCxBT9Q9Pgh0wIOd6GW6fm
 G5rA==
X-Gm-Message-State: AGRZ1gJ4IcHU49L3X+1MT/StDZjzxvo7Jnhhz37KL7MJa6Aosb3NJ3Qq
 nDM073VJoOANyTssQm1/V3M9f2uWx5pSVZ0+rpw=
X-Google-Smtp-Source: AJdET5cq4vS/qiYe2qnxe5I9EUNRCBdr816uNo1w7fOUfERq6sDJ+TF+i6exrKwmpHR5hcsE0sbKBq+YnN5KpYUaTw4=
X-Received: by 2002:a0c:f50c:: with SMTP id j12mr3727905qvm.149.1541673021780; 
 Thu, 08 Nov 2018 02:30:21 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a30Dmq3vp-+=jvVu8VMe+GKc9dU=+ZF0rzhFiUq2NuJ_w@mail.gmail.com>
 <mhng-23f94805-b961-4e68-a4c1-7d79b60bd925@palmer-si-x1c4>
In-Reply-To: <mhng-23f94805-b961-4e68-a4c1-7d79b60bd925@palmer-si-x1c4>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 8 Nov 2018 11:30:02 +0100
Message-ID:
 <CAK8P3a2468O=MVXVaZ8_Vq6DuOYV2iwR98upqpWOH67z9Gh-6Q@mail.gmail.com>
Subject: Re: [PATCH] riscv: add asm/unistd.h UAPI header
To: Palmer Dabbelt <palmer@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181108_103033_649323_E0EB62D8 
X-CRM114-Status: GOOD (  26.67  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 David Abdurachmanov <david.abdurachmanov@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 linux-riscv@lists.infradead.org, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181108103002.NjR-CtO4ETKMIxznyGKjTjTGwDbAeCLsRxMAvZdAtFE@z>

On Thu, Nov 8, 2018 at 3:10 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Wed, 07 Nov 2018 13:09:39 PST (-0800), Arnd Bergmann wrote:
> > On Wed, Nov 7, 2018 at 7:30 PM David Abdurachmanov
> > <david.abdurachmanov@gmail.com> wrote:
> >> On Wed, Nov 7, 2018 at 1:08 AM Palmer Dabbelt <palmer@sifive.com> wrote:
> >> > On Mon, 05 Nov 2018 12:56:15 PST (-0800), Arnd Bergmann wrote:
> >
> >> > The target is still the next glibc release (Feb 1st) for a stable RV32I ABI.
> >> > That's progressing well, with one last blocking issue related to some of our
> >> > floating-point emulation routines before we can submit the port.  This should
> >> > give us ample time to line up the ABIs correctly so everything works.
> >> >
> >> > So I think the correct answer here is to drop __ARCH_WANT_STAT64 from RISC-V.
> >> >
> >>
> >> Then if you agree I could do and send v2:
> >>
> >> +#ifdef __LP64__
> >> +#define __ARCH_WANT_NEW_STAT
> >> +#endif /* __LP64__ */
> >
> > Looks good to me.
>
> This is a bit pedantic, but I'm not sure what the right answer is here:
> "-march=rv64gc -mabi=ilp32d" will not define __LP64__, but will define
> "__riscv_xlen == 64".  I actually don't know enough about how an rv64gc/ilp32d
> ABI would work to answer this: would we have "long long" all over our syscalls?
>
> Probably not worth worrying about for now, as we'll have to go audit all of
> these if we ever end up with an ilp32 ABI.  So just go for it and we'll throw
> this on the pile to deal with later :)

Short answer: it doesn't matter because an ilp32d ABI would use neither
newstat nor stat64, it would only need statx().

Long answer: We've gone through multiple iterations on the question.
x86 uses long long in syscall interfaces and tries to reuse the native
64-bit syscalls as much as possible. This turned out to cause endless
problems, so for the (never merged but still kept around as a patchset)
arm64 ABI, we went the opposite way, and made the syscalls use the
same ABI as the arm32 mode.

From the experience with both of the above, I'd say if you end up
having to do it, use the same method as arm64, but try to resist
doing it at all. Unlike arm64 and x86-64, there is no inherent benefit
to using the 64-bit instruction set (doubled register number etc),
so compared to the normal lp64 ABI you only gain a little dcache
space for the smaller pointers at the cost of a smaller address
space. For you as a maintainer however, the cost of supporting this
mode is that you are stuck with three user space ABIs instead of
just two (normal 32-bit and 64-bit).
If anyone really wants to run 32-bit code, they need a CPU that
allows switching modes.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
