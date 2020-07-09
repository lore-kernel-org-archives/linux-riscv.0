Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B39EEC433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 23:15:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F7D32070E
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 23:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="E0O3anMB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTKNHyrG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F7D32070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=h3o1IGEWqra48tOCbsA91o8MsYXZ6n47Uys6/7VNx+c=; b=E0O3anMB5XkR3gzXBtBNwjWO2
	rOGXBRDnFbu1YKzOtOzK/Ba8blQyHBOial58wxq6kH740llHaxSqYpUKFdHRe2VrXDN1gJry5zStV
	5P6WOcrQ4tuEe+xvJ+R/6/nBxc4pBuEGVsKvAahQZ8VsYjVejArzZeoU2uV5bl2HQfLhLcBx19KZh
	wxJOfvLFSJS2xav8I4ERXpdGHKSx7rg8tjV5BQwNf0lzbXo7RBpwELi0ROw5Jy0j7f8B24cSByGdr
	sQaa5BoeDEYUIyoMvO+3UzFRP/plnytD4Y5i6P35Mbcj+ZU7bwNGBl/sKaQawLFocTc4zEa7RmRoP
	QdaUENrlQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtflc-0006RC-6k; Thu, 09 Jul 2020 23:15:48 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtflZ-0006QO-Js
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 23:15:46 +0000
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9441F2078B
 for <linux-riscv@lists.infradead.org>; Thu,  9 Jul 2020 23:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594336544;
 bh=WKp2RVFe68SGsfy7Hqg46eACLbZJztj8u5UjJnydzJw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sTKNHyrGxjZHVmElPsUrMB0oPbGEmh5sIBbuCWoItrDYOtZOQtKBzRCD1UOwRW0ps
 xYuzzensHJN29VXkbSU6m244+1lhHoeEjAUc8IQj6dY7k1sZULyLeqTvV0ZhOND5I2
 qIvmbbAXmhQevnKbX//nYKBoVOqX97awD/JvDNdA=
Received: by mail-lj1-f173.google.com with SMTP id s9so4274362ljm.11
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 16:15:44 -0700 (PDT)
X-Gm-Message-State: AOAM531ZPJmJp/UOeViv5ZUKjYhfvKTC3HoxTZvwT43BL6f9qSgFW5Ll
 utQBspT8JF29jE3JoL8N6oh3abEb/eHux6zJRv0=
X-Google-Smtp-Source: ABdhPJwP3mup+JqlbZ3i4TpJbfsI0x3PxwcNYP4Z+8OXIGKrTQvFVgXB2+LnS3GVk56FcdbCumxmhbXp3nvJtI9dPx4=
X-Received: by 2002:a05:651c:111:: with SMTP id
 a17mr16456695ljb.265.1594336542920; 
 Thu, 09 Jul 2020 16:15:42 -0700 (PDT)
MIME-Version: 1.0
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
 <mhng-af022fcc-7dce-4d1b-9204-d31241538412@palmerdabbelt-glaptop1>
In-Reply-To: <mhng-af022fcc-7dce-4d1b-9204-d31241538412@palmerdabbelt-glaptop1>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 10 Jul 2020 07:15:31 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRQkEM7zR06GYOGhT_Aerhc9vRNaxsDZ-jVCHyEodnXcg@mail.gmail.com>
Message-ID: <CAJF2gTRQkEM7zR06GYOGhT_Aerhc9vRNaxsDZ-jVCHyEodnXcg@mail.gmail.com>
Subject: Re: [PATCH V2 0/3] riscv: Enable LOCKDEP
To: Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_191545_766058_07349F79 
X-CRM114-Status: GOOD (  17.10  )
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
Cc: Tycho Andersen <tycho@tycho.ws>, Albert Ou <aou@eecs.berkeley.edu>,
 Nick Hu <nickhu@andestech.com>, Anup Patel <anup@brainfault.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Zong Li <zong.li@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Thank you, Palmer

On Fri, Jul 10, 2020 at 6:06 AM Palmer Dabbelt <palmerdabbelt@google.com> wrote:
>
> On Sat, 27 Jun 2020 06:57:05 PDT (-0700), guoren@kernel.org wrote:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Lockdep is needed by proving the spinlocks and rwlocks. To support it,
> > we need to add TRACE_IRQFLAGS codes in kernel/entry.S. These patches
> > follow Documentation/irqflags-tracing.txt.
> >
> > Fixup 2 bugs that block the lockdep implementation.
> >
> > ---
> > Changes in v2
> >  - Remove sX regs recovery codes which are unnecessary, because
> >    callee will handle them. Thx Greentime :)
> >
> >  - Move "restore a0 - a7" to handle_syscall, but if _TIF_SYSCALL_WORK
> >    is set, "restore a1 - a7" is still duplicated. I prefer a C wrapper
> >    for syscall.
> >
> > Guo Ren (2):
> >   riscv: Fixup static_obj() fail
> >   riscv: Enable LOCKDEP_SUPPORT & fixup TRACE_IRQFLAGS_SUPPORT
> >
> > Zong Li (1):
> >   riscv: Fixup lockdep_assert_held with wrong param cpu_running
> >
> >  arch/riscv/Kconfig              |  3 +++
> >  arch/riscv/kernel/entry.S       | 33 ++++++++++++++++++++++++++++++++-
> >  arch/riscv/kernel/smpboot.c     |  1 -
> >  arch/riscv/kernel/vmlinux.lds.S |  2 +-
> >  4 files changed, 36 insertions(+), 3 deletions(-)
>
> These are on for-next.  As far as I can tell lockdep is working, but I'm just
> doing some simple boot tests.
>
> Thanks!



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
