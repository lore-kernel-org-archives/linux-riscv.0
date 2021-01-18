Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30A35C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 14:53:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F8E922C7E
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 14:53:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F8E922C7E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=epigenesys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=w4+Gejo0AmldDAbGKr4Ust3h4hhxbLIeN/41oSZdwNY=; b=RRTuzLl8f3hUAkBDNgZUtKfzl
	DO1N01We1XYNTIT6O+0sgsaA3q/h2ai96kaUFZRni74Zj7nsqvAQomN8SUxuAGHs+wKUgTNvQD85H
	f+/q6R6o/5GCsHf29nTqmiuzAHzfVv/ykWfY90k0peDJgt5GgmAxe+AHGqQylKF05h0abxbGQzcA5
	+emvyuxLt86UWuY/lvuihKBVCXQ8rPF3+y+cngmYtqS52LAjY5i95REBvqtxfyInYtfccKZ4eFDuO
	ANNsryMlK/CYvpa+0gcNVTmDKZObX1saPNuzKaa24VjoGbhlY9ziVqYzar0dZW7kfSqQ08XNCD2Hn
	ad91ohSqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1VuR-0000q1-Hw; Mon, 18 Jan 2021 14:53:35 +0000
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1VuP-0000pE-3q
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 14:53:34 +0000
Received: by mail-ej1-f53.google.com with SMTP id gx5so4830244ejb.7
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 06:53:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1xTRKse7osHgIKS25g76CTiBG9i3MeX+/FioK4cdoWE=;
 b=DRznCJQG19SlA0MFon3S6FTA4NF2pTqsWX1uoxS6CtUYsiSkPFIs4CqSt1ChHbJmo1
 wXVk1MwHFLnOkubmS49LMH3S8/vqRpj6o3vtPfrP/z/3vtfVHrIfikQSRjkA9FGGY0e0
 8kXJiZvQ/+RfF8PuoTgyhR1gfI+EkJiMb3lEt38XfLvNTpjUfFiocaL2wBN2ebp8VixW
 DURSsKYIRYK3bzbl58kCT5fx1zyuwvEBbtZJlwz8J+9msmDsncB/2UVG5mGxxlWk6QE/
 w0LP9MhXkFOpFPOwJQMdz4vOW5salvvVYTh5q7voL9oY8zV4fty1lbLVpd3F+oOM0lli
 Q7GA==
X-Gm-Message-State: AOAM531Cicj1+Iduzgh9FXTb7y3X7s6V46+K/BGHWVSQhCfKxxZq1PeJ
 Vy4GuF4yt47ZlkgYtSeBRpQ=
X-Google-Smtp-Source: ABdhPJzC14YEWSfUq7eVgejD8YemgJXRPhQTquMgsQeEqmDax+/dDHZv2u+GxBjT7rrqvdU288u+ew==
X-Received: by 2002:a17:906:5e45:: with SMTP id b5mr48969eju.69.1610981611561; 
 Mon, 18 Jan 2021 06:53:31 -0800 (PST)
Received: from ingrassia.epigenesys.com ([2.236.81.180])
 by smtp.gmail.com with ESMTPSA id b26sm5633344edy.57.2021.01.18.06.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 06:53:30 -0800 (PST)
Date: Mon, 18 Jan 2021 15:53:28 +0100
From: Emiliano Ingrassia <ingrassia@epigenesys.com>
To: Arnd Bergmann <arnd@kernel.org>
Subject: Re: perf tools build broken for RISCV 32 bit
Message-ID: <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_095333_173550_372BAFE8 
X-CRM114-Status: GOOD (  20.76  )
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
 Albert Ou <aou@eecs.berkeley.edu>, Bruce Ashfield <bruce.ashfield@gmail.com>,
 Khem Raj <raj.khem@gmail.com>, Arnaldo Carvalho de Melo <acme@redhat.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Jiri Olsa <jolsa@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi,

after some searching I found this patch from Yocto project:

https://www.mail-archive.com/linux-yocto@lists.yoctoproject.org/msg01004.html.

I don't know if it's ever been proposed as mainline patch.

What do you think about it? Could it be the right solution?

Thank you, best regards.

Emiliano

On Mon, Jan 18, 2021 at 03:25:05PM +0100, Emiliano Ingrassia wrote:
> Hi Arnd,
>
> thank you for the quick reply and support.
>
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
> >
> >        Arnd
>
> OK, but what should be the right solution for RISCV 32 bit in this case?
> Is it a problem in the libc implementation or in RISCV/perf implementation?
>
> Thank you, best regards.
>
> Emiliano

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
