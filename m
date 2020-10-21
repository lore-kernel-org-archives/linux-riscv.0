Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37B28C4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 07:11:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83FBF2225F
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 07:11:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QUA0MZgR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="LSs4yKI9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83FBF2225F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rWmnGLP6j1GiXe9fo0o+3vBMQI4ZVj/+I3bE3DwH+00=; b=QUA0MZgRHI25nQni7liniEA6P
	swLA5CCQElRRx/2f9JmHe+iMJLcuUql+V7is0jeCDVSbEsuFQfxCYzwYiGgPRndcoi6CPTZSU0gpt
	687dM69EO4Ub55tC2IRvgj5XKvBA4EwnLjdz2kQr+NfqAvBrn+cVVklUvKnXC41xlkVQaQPwvBPw2
	DocCwCT18tPmistWFTsZaqUzPk7URPW0/6YIw6aZ6mHeC3QcTETNXe1C5wfU4a+xHsSfRStkO4Ac3
	/lvBbk9PdRk94UK9Y9x8hpYN5F0jahadeLjXYnEQvHmw07ieJl6Wc8CCDi2+ZlIperz8FGcv2FOfR
	bFXqkYXJQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV8Gw-0006Oq-P0; Wed, 21 Oct 2020 07:10:58 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV8Gs-0006OD-VL
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 07:10:56 +0000
Received: by mail-oi1-x243.google.com with SMTP id t77so1102065oie.4
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 00:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=t/G7MIqK+NBHfqzH6rZ1PdmS1knHg5JTFYQufZDq68M=;
 b=LSs4yKI9wS65l8r8fpRxqXk5x07ZeLSm6fAhoYh0RxmCH+roM+bIJshNV/QY9/tD7L
 ERh26aii8sdn80nguZIZuQICgo/J+KpYu3Ps/A1i3AzR+cl857JamiOfDaSD/hBp9gMn
 7vddbVaRtybJ5oLylMFCBsf0lXbeHxNV2PRLKcE6V0Xq9sCNTpQtNjHrAWmTB394TGm6
 qFnILdP/sfK51Mp87ZGveAkQN6wTob/ne2aCmKTbMxqtRSRvOWOAbzD2K6KJvwV13IbJ
 NXnx6FA+Q0906q7UshpIfkIEzYiQrxtJ6YmPmExcJwE31U7Hpty9AdUTa8NycmvrXn/+
 Q3Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=t/G7MIqK+NBHfqzH6rZ1PdmS1knHg5JTFYQufZDq68M=;
 b=XkuTcqRbgx5nmVUpSydx2lfRlFrkEYtjadQ6AlKwrqdZUXHRXcRHbswQeEe491GHGs
 9oeI18EhE7VCzrWuM+QZ8QkbblrYd7T7WRPvVheoLAQ+8x06uDBYCCAjkgaUYabXKSjJ
 LQ3zAyoZ3+LvpadOwo/JjZtJlEty4ZoVglT/z2u0kjwp0wGwzhgcJTF2+MMTR6y0DBhT
 blwkIoxZ9aDuvZnIMYED4TQwZYbE63b1NeQHA+7qy7VClISPaMJuXmMZyvf9+OV8NezR
 SweKO4fxUbGdTL+mKD9+jh9szJJwTI6CtfcFp1w64NIG0QqDmp9p9/p8EhWB3qkzBeSb
 k7VQ==
X-Gm-Message-State: AOAM531Vl5pGWMc3LZrwQOTnH/2qmD+XSqG8f6OsKrz4GgoGB7oRQOlH
 qkIWv1fmE+HPCjBa8a4y8kUBviGTYDDcCucJjM0lqA==
X-Google-Smtp-Source: ABdhPJz+Y36Nw9siV5fFGt0r0s5z3699GS0nBv6WffR9icsOv4oaCCCbH/Hl5XfvqWi9X/hf4w8a6lsYKcKjEMQd3Vk=
X-Received: by 2002:aca:54c3:: with SMTP id i186mr1216632oib.35.1603264251105; 
 Wed, 21 Oct 2020 00:10:51 -0700 (PDT)
MIME-Version: 1.0
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
 <1602918377-23573-10-git-send-email-guoren@kernel.org>
 <CAOnJCU+oTRcJ2p8WQDX5P-EsOHmkn3kP9s54VQa+iw2wXDvzkg@mail.gmail.com>
 <CAJF2gTSU+M+b+bn5zH_EyE7Ksh=5+ZkO8LkAn=Tm-p45CgYW1w@mail.gmail.com>
 <20201020164121.32626e45@gandalf.local.home>
In-Reply-To: <20201020164121.32626e45@gandalf.local.home>
From: Zong Li <zong.li@sifive.com>
Date: Wed, 21 Oct 2020 15:10:39 +0800
Message-ID: <CANXhq0pc5STcmZRP5HZXZ_SxqSRq=izStMV0VQyPNM1ayEzszg@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] riscv: Fixup lockdep_assert_held(&text_mutex) in
 patch_insn_write
To: Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_031055_012572_C13C65C9 
X-CRM114-Status: GOOD (  19.00  )
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
Cc: =?UTF-8?Q?Patrick_St=C3=A4hlin?= <me@packi.ch>,
 Guo Ren <guoren@linux.alibaba.com>, Alan Kao <alankao@andestech.com>,
 Anup Patel <anup@brainfault.org>, Palmer Dabbelt <palmerdabbelt@google.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org, Atish Patra <atishp@atishpatra.org>,
 Guo Ren <guoren@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 21, 2020 at 4:41 AM Steven Rostedt <rostedt@goodmis.org> wrote:
>
> On Tue, 20 Oct 2020 19:18:01 +0800
> Guo Ren <guoren@kernel.org> wrote:
>
> > > What platform are you testing ? We are seeing a crash while enabling
> > > any of the tracers multiple times
> > > on Qemu/HiFive Unleashed.
> > I use qemu for testing. I've changed dynamic ftrace mechanism from
> > mcount to -fpatchable-entry.
> >
> > The problem is made by the lockdep checking of text_mutex.
>
> If you are switching to "patchable-entry" you shouldn't need to use
> stop_machine for the updates. No?
>
> -- Steve

Hi all,

I'm going to send the patch to fix the problem. Ftrace was broken from
v5.3 kernel version, and only happen on SMP. The problem is caused by
the following two patches:

Commit 4ecf0a43e729a7e641d800c294faabe87378fc05 ("processor: get rid
of cpu_relax_yield")
and
Commit 366237e7b0833faa2d8da7a8d7d7da8c3ca802e5 ("stop_machine:
Provide RCU quiescent state in multi_cpu_stop()")

We have to mark these two functions as notrace. The stopped CPUs
cannot make function calls to traceable functions on RISC-V, the
function call instruction pattern needs two instructions (auipc,
jalr), so there is a change to execute the (auipc + nop) or (nop,
jalr) when patching code.

There is a similar fix as follow:
Commit cb9d7fd51d9fbb329d182423bd7b92d0f8cb0e01 ("watchdog: Mark
watchdog touch functions as notrace")

I have verified my patches, and I'm going to send it to the mailing
list these few days.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
