Return-Path: <SRS0=o0tQ=NF=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D25CC46475
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 21:04:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 949D52075D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 25 Oct 2018 21:04:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GBtmIPzx";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=amacapital-net.20150623.gappssmtp.com header.i=@amacapital-net.20150623.gappssmtp.com header.b="ePHL/mmu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 949D52075D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amacapital.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oYsYsS1Sj/+qMFZ8Ytb5WxF/oSZ/qgwuvycOMxfBl0Q=; b=GBtmIPzx4amKDJ
	8foocWnhNCVwNWOm1tUq2ZyTArVDQwIzlhPqlgLpTHr1CowAADkRokf9Cy6CoB+cL2h1+86USK/sz
	kQoPCgv5t/Ruld6ZWBBdQBeD3/n1RIxMLx0d16LwS50kDdKPyC3hZPBKO+4skI65dwRlDlwhdnjz8
	y5IPpj6oPu8PKzP7oh57OcVlOam5g5ByGL6JcSBanayamACR/1qWFL8x9st5+Bx/fMug962kOzoXf
	u+nexe9y9P4g0AFdAPMYGhhVLKY1u/RcmKb7P3nFx99NXMCqzWUvbkzgdsFrmIFJ47fhauPzHPLTe
	Rm+vuAICRQFvYup+FEZQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gFmnO-0001r5-Um; Thu, 25 Oct 2018 21:03:59 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gFmmC-0001Fl-Go
 for linux-riscv@lists.infradead.org; Thu, 25 Oct 2018 21:03:08 +0000
Received: by mail-wr1-x444.google.com with SMTP id g9-v6so10716221wrq.4
 for <linux-riscv@lists.infradead.org>; Thu, 25 Oct 2018 14:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gDl9tuLjrc5aO/xWHsA1eJ2QMDOIODaJdJyMWgsmf5Y=;
 b=ePHL/mmuAgPXJgnbLsyesnGMr6AErgUyRrxtmuq70KtYnTzTq1w/5JW2md6UlqMxvW
 RWe/nTaDfx++fhqFJKRBH8cVwnZuf/Y6pgflh2o1zdSs5W+bColy0TAZdLe+cApl2ApP
 +lWSyc/o6TLAY4WQhtXNHNDFVI6pU3apg1GilJRxCU5b/Umh5flvA8b3+Exc8PNf03Xe
 ws/WPDXO8apJqmpKhXP7upNvKVKEgwNBxrJ8awTatqG7rAZaiZVvUxQNm7fNxV4itB2C
 oiNrVX092EjZ0/5GLqsgq1HA/sQQuBQ+4KXtEL5IReWMVMCvWp7qVqrie/sH0KwZhP+t
 NH+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gDl9tuLjrc5aO/xWHsA1eJ2QMDOIODaJdJyMWgsmf5Y=;
 b=VqA/JHEnkNMeWeXolvCCpxQu9uHkrKndXgTZ4uItt10p2H3QOL2dAPAlNtL+Sm/SIM
 +waVlsr1RRD0xZM9PCcwaJ1J+209Br6q4mWavxrS18wl6cArNapfndVsNbCakBIvFTCE
 8E2+6d2Jni9gu0O/kIz/pze1Ebstx4JPu16o0zWaMCFhvM43ZE7+jd1G3eEP/0mXNd4N
 /Qtjl0lerEwgj9OGZzAcf/WnEffF8bgzSAJ2CBS5/kGTy8YlT+EIjKnRe6COvk1anAsh
 mz+m/zMBhiEeJUCxTxBSwnbaM2yuEgR961GJkGjENjaal1n8K/kNqdUTKphwR57G+Vdh
 imoQ==
X-Gm-Message-State: AGRZ1gJy6/wpdHg74pk6ZxEr3rlldjw9sB7wSSdu2+ueEeHMZkfuAxYA
 6A4Q9b6O85ydKQP7p9tDSYoiwR/jEYfG3DOHs29LEA==
X-Google-Smtp-Source: AJdET5cFYw+O9EtSYg1VYD312vAgeMKx1dg7ibljP+sGxhCdIiBzlnHdCDbbgxVVu/UNtVDdIjOeNkZmB12a9AfR2v8=
X-Received: by 2002:adf:97d3:: with SMTP id
 t19-v6mr3507907wrb.283.1540501351994; 
 Thu, 25 Oct 2018 14:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <CAEn-LTqbEmWovu4t7Rs4C211+GRRU4V3B=+WmW0SOhX_b8db5Q@mail.gmail.com>
 <20181024204036.8799-1-palmer@sifive.com>
 <20181024204036.8799-3-palmer@sifive.com>
 <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
In-Reply-To: <CAGXu5jJ7gmVXZE+iksW99c6bHEV2rSOG+boQDRGmMSDa9HOh_A@mail.gmail.com>
From: Andy Lutomirski <luto@amacapital.net>
Date: Thu, 25 Oct 2018 14:02:20 -0700
Message-ID:
 <CALCETrUSvugnh1JiLgn49c4_dw6F8bXiO52jdqiAKEn-CgzoXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] RISC-V: Add support for SECCOMP
To: Kees Cook <keescook@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181025_140244_586900_34757E81 
X-CRM114-Status: GOOD (  20.49  )
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
Cc: kstewart@linuxfoundation.org, aou@eecs.berkeley.edu,
 Will Drewry <wad@chromium.org>, Paul Moore <paul@paul-moore.com>,
 Greg KH <gregkh@linuxfoundation.org>, wesley@sifive.com, palmer@sifive.com,
 LKML <linux-kernel@vger.kernel.org>, Eric Paris <eparis@redhat.com>,
 david.abdurachmanov@gmail.com, David Howells <dhowells@redhat.com>,
 linux-audit@redhat.com, pombredanne@nexb.com, linux-riscv@lists.infradead.org,
 Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181025210220.VEOr_oZ54s8lu5zII3hvvcK0tGQxJgwLVdQzWLC3H68@z>

On Wed, Oct 24, 2018 at 2:42 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Wed, Oct 24, 2018 at 1:40 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> > From: "Wesley W. Terpstra" <wesley@sifive.com>
> >
> > This is a fairly straight-forward implementation of seccomp for RISC-V
> > systems.
> >
> > Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
> > Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> > ---
> >  arch/riscv/Kconfig                   | 18 ++++++++++++++++++
> >  arch/riscv/include/asm/seccomp.h     | 10 ++++++++++
> >  arch/riscv/include/asm/syscall.h     |  6 ++++++
> >  arch/riscv/include/asm/thread_info.h |  1 +
> >  include/uapi/linux/audit.h           |  1 +
> >  5 files changed, 36 insertions(+)
> >  create mode 100644 arch/riscv/include/asm/seccomp.h
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index a344980287a5..28abe47602a1 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -28,6 +28,7 @@ config RISCV
> >         select GENERIC_STRNLEN_USER
> >         select GENERIC_SMP_IDLE_THREAD
> >         select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
> > +       select HAVE_ARCH_SECCOMP_FILTER
>
> I think this patch is missing most of the actual seccomp glue?
>
> config HAVE_ARCH_SECCOMP_FILTER
>         bool
>         help
>           An arch should select this symbol if it provides all of these things:
>           - syscall_get_arch()
>           - syscall_get_arguments()
>           - syscall_rollback()
>           - syscall_set_return_value()
>           - SIGSYS siginfo_t support
>           - secure_computing is called from a ptrace_event()-safe context
>           - secure_computing return value is checked and a return value of -1
>             results in the system call being skipped immediately.
>           - seccomp syscall wired up
>
> I only see syscall_get_arch(). Nothing is using TIF_SECCOMP (I'd
> expect a masked check in entry.S -- it seems like tracepoints are
> getting missed too? I see it handled in ptrace.c but not checked in
> entry.S?) There's no checking for seccomp in ptrace.c, etc.

Hi RISC-V people:

I strongly, strongly suggest that you rewrite your asm to work the way
that x86's does: have a function called prepare_exit_to_usermode() and
make it work more or less like x86's.  Doing all the exit work in asm
like you are is just setting you up for a world of pain.

--Andy

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
