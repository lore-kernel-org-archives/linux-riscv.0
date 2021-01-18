Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368B6C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 14:40:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5561221FB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 14:40:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5561221FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M24+ou4fIDR0B1XZy8Ys5yIkXHqPhbEuAacKnYc9v+I=; b=VPsFaIWZIxFFuHVZbX6sDn0wr
	pfZ/QqB8Zcy+fLvXXNq1F1blgfkWUH1VGeXvhivXStxYnP0lxPrSzKe0cvK8DvCxB3kJLx/N2nD6v
	8MbzYPWkoTUmHGmVe2tKjf+0coE25E7t4Vu+cPjrOkP0wmjVACs25UFeCbfJWe4kLWcHqhPsuK/4A
	EoR9xc9Bi4Qq3Kd6TVEwM/6aXSgQFzwv9QAmWk1WM9aR7JaUVF9wnfv6D9jInNYzJdDKNtbo/bq7G
	8unTYcJr/qwpUxwQmY5nb47tL/yTDl3kKZEBj3I/WtGQt/kV6I/NKErDOg1dx1f8qVITZZ6B6tspv
	Hv9RR5J6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Vh5-0007iF-4m; Mon, 18 Jan 2021 14:39:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Vh2-0007hv-8h
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 14:39:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9804C22B4E
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 14:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610980782;
 bh=VPzGVhb/xmTKYhV9u64hgtgCfzjaN+lHOFwpPwHZj+o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DF4K5yfqNVsJiVq0+6zPlU3Zqc27sqyPL7G8/E0PBStVk3mVDUtSO2kyGmH9jKSsf
 UZo3yu5Z83jw3OVxES5mZ/q0zPIQJ3dNCp4Y+1WerraiKYmiCMqZkg3Gull0j/RlPi
 o43FdGaAi/LmlUNekHOrHNByeAPHBBuLmgtPJIzznIGMxWubQACJruJbda65gfFdKa
 KC7d9Odln0aepatdOlAhj5vNgWF3pHPj8IW9uA/XVaJoDsid9kIWyaquvZXYzeongk
 Yk1RXEoWHv9qsMrSC33V62hs7dr3X4vGD5LIaQc8gROSRqL03HLaDgNk8//p7jnYTN
 26pWpyX4+Lrtw==
Received: by mail-ot1-f41.google.com with SMTP id b24so16452994otj.0
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 06:39:42 -0800 (PST)
X-Gm-Message-State: AOAM530s6SopATbtpqyFo4R1ACR0i/MS0m+uNSughLh7Y25sbufg7zqg
 scCpbmtkT6uj82ld5MLyQk2ABbykoFwLj4D55gI=
X-Google-Smtp-Source: ABdhPJymYpL4T1hYZIbEYM0YzaM5Gp2JUDaCl3I64iNrQ/ovsxvo5OfxjLTebJFEvMoinhbrTs1Pu2w28dl3ZXffpTg=
X-Received: by 2002:a05:6830:139a:: with SMTP id
 d26mr2376050otq.305.1610980781810; 
 Mon, 18 Jan 2021 06:39:41 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
In-Reply-To: <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 15:39:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1iiEsHaGDHGpzcAnU+_F37E07WXGYkYNw8osgWfBEjLA@mail.gmail.com>
Message-ID: <CAK8P3a1iiEsHaGDHGpzcAnU+_F37E07WXGYkYNw8osgWfBEjLA@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_093944_543644_904E30BF 
X-CRM114-Status: GOOD (  19.50  )
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
Cc: "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Jan 18, 2021 at 3:25 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:
> On Mon, Jan 18, 2021 at 12:56:11PM +0100, Arnd Bergmann wrote:
> > On Mon, Jan 18, 2021 at 12:35 PM Emiliano Ingrassia
> > <ingrassia@epigenesys.com> wrote:
> > > |#if __WORDSIZE == 32
> > > |/* Workarounds for generic code needing to handle 64-bit time_t.
> > > |...
> > > |/* Fix sysdeps/nptl/lowlevellock-futex.h.  */
> > > |#define __NR_futex              __NR_futex_time64
> > >
> > > a possible solution to fix the build of perf tool on RISCV 32 bit could
> > > be the following patch to file tools/arch/riscv/include/uapi/asm/unistd.h:
> > > |+
> > > |+#ifndef __NR_futex
> > > |+#define __NR_futex __NR_futex_time64
> > > |+#endif
> > >
> > > What do you think about it? Could it be a correct solution?
> >
> > No, that would be much worse: __NR_futex must only ever point
> > to the system call that takes the old timespec argument. If you define
> > something like this, it breaks applications that try to do the right thing.
>
> OK, but what should be the right solution for RISCV 32 bit in this case?
> Is it a problem in the libc implementation or in RISCV/perf implementation?

The problem is in perf, along with as any other application that wants to
use futex on a 32-bit architecture with 64-bit time_t.

I already said what the application needs to do in order to get the
right system call, in the absence of a wrapper that is part of every
C library.

       Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
