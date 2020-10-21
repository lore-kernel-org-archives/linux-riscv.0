Return-Path: <SRS0=Lzn7=D4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87F8CC4363A
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 08:27:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 83D5B207FF
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2020 08:27:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yslEHU5+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="c1/GcZTB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 83D5B207FF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lzw1eRibSC5pONEhCSdFGaQm0DjGvwi/gfGYLuWCV2s=; b=yslEHU5+Umoc/Zjt0FZVEbCtw
	DRbt1pfE3lmfUWoIhkx2jUWIpm0iw8UfW3IRkTv7w8WaXSKK7Pb+F00eh1YTrop6i4HFz+IKTzuwS
	WiO4BA8Yce+kimcuni/HQsTkSQ0O7u+XTYKdp40MIEnENzstSxgMD+C+HXJU3w4Nd8tsUpqoLZ07M
	ptaFhusig9ZnA7dQYODzXLFSIh7MceNEFXkhIAEDsOOE1wms15a8kaTjIc9bk9eyecILAecOlFx+d
	uSogBgX1Nv33Wtu/yX4Yy5fF+tCT3QKld5uhCd8VYQAxT5mVat0EI7My8Hq3EZ6hO/vHO3EtPNWDu
	3Ex0gdOGA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kV9Sp-000512-Sd; Wed, 21 Oct 2020 08:27:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kV9Sn-00050V-1s
 for linux-riscv@lists.infradead.org; Wed, 21 Oct 2020 08:27:18 +0000
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B4E7822384
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 08:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603268836;
 bh=nMmI8qRuAv1yyZjH2PDs0VpZ8HlNElzwHwOCPCUV/wM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c1/GcZTByzTKquH87Q7GeJ73FJux32gJNxIYccdNQIa4H1TlCG87WdZfvbBDAXUrC
 YLpoDPdw3Pm0EMrY3lrU5AMgcQ/K9ce5KadXNMJSRo7Qrlxh4deyoIrI1fsrR92FZ+
 k2sTEbHrRxsaPXu13U0/X4//OHZ2BNoiKJF8Xs9k=
Received: by mail-lf1-f54.google.com with SMTP id c141so2021029lfg.5
 for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2020 01:27:15 -0700 (PDT)
X-Gm-Message-State: AOAM530BZOs6YkbvnfSeDM4uvBFy8veKjQMq3ikVMRoguhn02KRKzzXb
 cI7mIGqOoVp4IUb3796xyeywUprn01isMKGD7EI=
X-Google-Smtp-Source: ABdhPJyVwP5SKU7CNKU3RSFKHT0y1pGyDfX2/XwsNk97u9k6um7/ZanN9MPhONY1QqNPV9ltPXGduJx8MkjDIi5j6zQ=
X-Received: by 2002:ac2:5a4e:: with SMTP id r14mr737881lfn.451.1603268833344; 
 Wed, 21 Oct 2020 01:27:13 -0700 (PDT)
MIME-Version: 1.0
References: <1602918377-23573-1-git-send-email-guoren@kernel.org>
 <1602918377-23573-10-git-send-email-guoren@kernel.org>
 <CAOnJCU+oTRcJ2p8WQDX5P-EsOHmkn3kP9s54VQa+iw2wXDvzkg@mail.gmail.com>
 <CAJF2gTSU+M+b+bn5zH_EyE7Ksh=5+ZkO8LkAn=Tm-p45CgYW1w@mail.gmail.com>
 <20201020164121.32626e45@gandalf.local.home>
In-Reply-To: <20201020164121.32626e45@gandalf.local.home>
From: Guo Ren <guoren@kernel.org>
Date: Wed, 21 Oct 2020 16:27:02 +0800
X-Gmail-Original-Message-ID: <CAJF2gTSpcNAzhic9KTSygtjSbyTerA3VLFb2ziFu6uSGxgAhfg@mail.gmail.com>
Message-ID: <CAJF2gTSpcNAzhic9KTSygtjSbyTerA3VLFb2ziFu6uSGxgAhfg@mail.gmail.com>
Subject: Re: [PATCH v4 9/9] riscv: Fixup lockdep_assert_held(&text_mutex) in
 patch_insn_write
To: Steven Rostedt <rostedt@goodmis.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_042717_221901_6FE78584 
X-CRM114-Status: GOOD (  15.93  )
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
 Masami Hiramatsu <mhiramat@kernel.org>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Why?

funca:
nop                   addi  sp,sp, -8
nop                   sd ra, 0(sp)
nop, nop           auipc ra, 0x?
nop, nop  ->      jalr -?(ra)
nop                   ld ra,0(sp)
nop                   addi sp,sp, 8

When CPU0 has only changed half of them, CPU1 call funca then CPU1 broken.

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



--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
