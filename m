Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEA3C433DB
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 15:45:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFC2021D42
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 15:45:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFC2021D42
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=1ss8b8kLRlgwIGUv9+nam+Exk2mS23WeRVjVfK74wzE=; b=vtDmjZUv8Fk/Y8H9NNjk83gOc
	K3NkR+K81yolnwo8ISRmQMvXpn6Sxt5K6qG9hA+rOVJVKUfvQoRiuopVBjlNCHxFjySJQbOwyY1XB
	eTB7eLmeJKnzxUaUhQCvVOBbELN+qlKBrm03BVXdD/rgn432hmDxRbiDBpK2IBZhVvu+pbRz1RtUY
	nm9kyWHTzRcPseRS1KShGDsYLRI9VSAOeO5jsp43viftuD8RG71zZyNwI5fxC8ntY3aTlTKA0NF+r
	gBoMSLebrGK7TJiPFl9GgIp0wINMS2jjrLc1+ZJfAl0aDkfagt5ojiG/4sKt6xAz/+Cg6Y/vYJWC2
	WmrIqKpyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Wi7-0007SR-7a; Mon, 18 Jan 2021 15:44:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Wi5-0007Rw-P4
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 15:44:54 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAF0F22B39
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 15:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610984692;
 bh=67nLFE5AmxugLi7OTthMEVCLi+nGmM3/wm4pbG7MKjc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GVMDyZGPtMFYHHBDBZ1dSfRMhVNoJSKfEgC4PIrHzgFStWcsq1zvoQnykbXrI79Ve
 Cq9gFp3Ct232qVN2KoRzWc8E9I7ShUxY5AfEF01mhWdBH/a90rWVGUh31NHbN6xU2F
 hhQFrBzRwEZX4B+JcPDgjr672C20PR2bePC86v+UidoPQuVwvDDTxi1LnM1jiW9s8q
 cKGuVJssUIZEw7PE9pqObe3/NfDeW7lyG10LJaj3KOTDA+oCL6mV9wCEBgFF+TekeH
 G9A1r7cQRRlIplIMPmBW3eCrjnSVvGAsTBau7DVWyaZ/XJFi1PMZY/PmdaArS2m80G
 j34tQH7nA9Hkg==
Received: by mail-oo1-f51.google.com with SMTP id j21so4173273oou.11
 for <linux-riscv@lists.infradead.org>; Mon, 18 Jan 2021 07:44:52 -0800 (PST)
X-Gm-Message-State: AOAM532NZeqBAYgh+Uc+MJ3uDEqWr95an8ADuAz9wZoydHmoKYi7XdSX
 laM9kpAw5sBr25sYqffwlISpgucG7Rn5dbS/N6c=
X-Google-Smtp-Source: ABdhPJxfdyHTlw2D1MTVrSNUaL6uMgo9j0u4U+64x6/vTLh/QLL01y588LIhpSoOFfnBKNBniRWuC7Hx90LEZC7Gbqk=
X-Received: by 2002:a4a:9c01:: with SMTP id y1mr17390481ooj.15.1610984692180; 
 Mon, 18 Jan 2021 07:44:52 -0800 (PST)
MIME-Version: 1.0
References: <CAK8P3a0dJnKiX5minsUNdAcNnxPvZkyK363f1ibj_x0L2MQiPQ@mail.gmail.com>
 <YAVynNqAwBt5GzQT@ingrassia.epigenesys.com>
 <CAK8P3a33i2r0xx==3hTW32pc_Sm33EMDXYAS4PtEaEV8DX4s_A@mail.gmail.com>
 <YAWaQVBM84CaY1B2@ingrassia.epigenesys.com>
 <YAWg6KQt6hAtIR6O@ingrassia.epigenesys.com>
 <CAK8P3a3Vc4wrLvrfwkHd6HCMohk07Yi6P_jKaC_5AybCMBNjPA@mail.gmail.com>
 <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
In-Reply-To: <YAWqS9YZ0rpXPoSN@ingrassia.epigenesys.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 18 Jan 2021 16:44:36 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0kOi55Dg-P-v+GcKdoLY6VOvv5Lj63X1=vL9LDR=Fe9A@mail.gmail.com>
Message-ID: <CAK8P3a0kOi55Dg-P-v+GcKdoLY6VOvv5Lj63X1=vL9LDR=Fe9A@mail.gmail.com>
Subject: Re: perf tools build broken for RISCV 32 bit
To: Emiliano Ingrassia <ingrassia@epigenesys.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_104453_886650_F0CFAB84 
X-CRM114-Status: GOOD (  12.58  )
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

On Mon, Jan 18, 2021 at 4:33 PM Emiliano Ingrassia
<ingrassia@epigenesys.com> wrote:

> Ok, I totally agree with you on this point.
>
> So, it is right to conclude that the problem is not in perf
> implementation but in the libc implementation?

No, libc does not provide a futex abstraction, and the SYS_* macros
just refer to the low-level interfaces that operate on kernel types rather
than libc types. An application that uses them must pass the
correct types.

> That is, for example, glibc should define SYS_futex as SYS_futex_time64
> in case of riscv 32 bit because of its support to 64 bit time_t?

As I explained, SYS_futex would refer to the time32 syscall, which
does not exist on rv32, redefining it to a different syscall would lead to
data corruption as well.

If you call futex_time64, you have to pass a __kernel_timespec structure,
while the old futex call must take a __kernel_old_timespec structure.
Depending on the architecture, only one of the two syscalls might be
available, and if you pass a timespec defined by libc, you have to
know which of the two syscalls that corresponds to, or convert
the arguments when calling it.

      Arnd

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
