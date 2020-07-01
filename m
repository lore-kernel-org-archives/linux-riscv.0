Return-Path: <SRS0=OTun=AM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD7A7C433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 10:04:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CB9920747
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jul 2020 10:04:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A9JUWZhK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="TNR52TFV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CB9920747
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s5XkzbM38IHt/xTaMXwxkqRbN1dP1XGXDgIZcJrh4DY=; b=A9JUWZhKcU1kD5lpyPu6psIul
	NFPY686TZZu+qX7cOiULQT4Ir23BjEQN4DFZNe3J5JY02ZUm6QqSxKUJNqiHhIoeYue8bivGfIhI8
	p1gLYpYMmSSPUgQu3wj2JD6MENwqbFNCqwMtU228BYtlYiWh/0sL5wZl4xKp8iWZHb45Ww9i1x5rR
	UQdyBW3MJIKAGJjMifcoZJavaFj60sAgOr1qRpHxkvvN0QTpAG0SzyZxiL9lxOq95jxSxxIwASVeX
	uwKfpLHY5dC4bNdwt7J88AxiMK/iUhwdWh26kya5X7OP16YwCqgNBs9BksxVpXGnGle8fqTnnK04C
	XtXckpYdQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqZb0-0006C6-HI; Wed, 01 Jul 2020 10:04:02 +0000
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqZax-0006BV-7z
 for linux-riscv@lists.infradead.org; Wed, 01 Jul 2020 10:04:00 +0000
Received: by mail-qk1-x744.google.com with SMTP id 145so19094324qke.9
 for <linux-riscv@lists.infradead.org>; Wed, 01 Jul 2020 03:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jsCgCe7f0mKTn8ZvHPz1V5zs1G12TKsC5oK/t91ZShk=;
 b=TNR52TFVDaLyaZheg/MK5heU5e/ifLfHxlF9In9y6BbH8kxt4KtugtssreZGqECG5i
 w1Etj8GfSq+jtccbRyH9IetO09yuRSkPix0reNq98MB7ImB8p9S9qKree1CoA4Q9+7JR
 ZnnaynWJA93fnFCEwAk+ZjOK+bNHmY9bygG5aGdBMs/QlOFn5ihbwHbF0JIr8P4r8WVM
 KRtxvBdiqU1z1RrHoAVHJ8iM0RwnPWZJXmkPRRR9MvqL6gY/VnZ7I/E3MSaVDmMSj3ld
 YcQQbE+D17KZ7aTxowAPRiH70NK0xfoM0I26AID21lgnEORdMyGvpukRCTetPWWrd2iI
 MYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jsCgCe7f0mKTn8ZvHPz1V5zs1G12TKsC5oK/t91ZShk=;
 b=h0br9i9xnvLRNajUL3EAWcYkqZYoCaxAab18VqpSENNbIUqjUpGWtomqBokCqsodtS
 FKICRZ7EMw15oUpM63v5roluMvJurx6bOv7hpPUgGaoUyaIqRhtg1dNBC7FzU6VpWs6z
 B1gji5Nnf2ihAkFsACj8DsYXzgadiVlGxTfghAZgZ1grydrtBZInk1gMCFgP4Ekx8D/3
 ThbIO/ioQL48NAg66QZvfO2aU/p8w2uqfnkxOYig/reWOgtdAXTFbJJUCgz2NYXQDH9T
 f/OxGM1AztTHT4J2guDhvzaFcy/wlNjz7WMWOmF4j5dwe8oqDZrQ+DobQ4w1gbbp/vIr
 jZfg==
X-Gm-Message-State: AOAM531NU6liCfge26H+CfVif0QRU1tbp6ooE1c+Ve8fkgcLSKTycrBd
 L1D7NNpmHn+1L+p6vrYXhIDpOAMBSgf5KCF7QNpwig==
X-Google-Smtp-Source: ABdhPJzVnDQ32OCokHm+eNYqcfLlYrNHC6bIFMSt7fn9RyKcMgOwyioDj5Ie826u4UGpukS3BtN6HC1qkjNXpuibvjM=
X-Received: by 2002:a05:620a:4ca:: with SMTP id
 10mr24896404qks.250.1593597836645; 
 Wed, 01 Jul 2020 03:03:56 -0700 (PDT)
MIME-Version: 1.0
References: <CACT4Y+a3A6DEvUjCsk_jKz9nZ=5iAzXTyG4WDPkug6u7BVrceQ@mail.gmail.com>
 <20200630151044.ds5junfupcokcei6@distanz.ch>
In-Reply-To: <20200630151044.ds5junfupcokcei6@distanz.ch>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 1 Jul 2020 12:03:44 +0200
Message-ID: <CACT4Y+Yt+f4ryT4YXr_y+-kt=k55Eu=42YNx=Z88dcFZfmYCww@mail.gmail.com>
Subject: Re: syzkaller on risc-v
To: Tobias Klauser <tklauser@distanz.ch>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200701_060359_398026_89A54A7F 
X-CRM114-Status: GOOD (  16.70  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@gmail.com>,
 syzkaller <syzkaller@googlegroups.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Jun 30, 2020 at 5:10 PM Tobias Klauser <tklauser@distanz.ch> wrote:
>
> On 2020-06-30 at 14:48:31 +0200, Dmitry Vyukov <dvyukov@google.com> wrote:
> [...]
> > 6. I observed lots of what looks like user-space process memory
> > corruptions. There included thousands of panics in our Go programs
> > with things that I would consider "impossible", at least they did not
> > come up before in our syzbot fuzzing. Also some Go runtime
> > "impossible" crashes, e.g.:
> > https://gist.githubusercontent.com/dvyukov/fb489ed93f7180621c71714ee07e53dc/raw/a7d2e98a56da17af2aec79c164cd3a8e154ecf5c/gistfile1.txt
> > Maybe it's a known issue? Should we use tip instead of 1.14? Is it more stable?
> > Though it's not necessary Go b/c kernel contains hundreds of memory
> > corruptions and we observed kernel corrupting user-space processes
> > routinely. This is especially true without KASAN because kernel
> > corruptions are not caught early. However, the ratio and nature of
> > crashes makes me suspect some issue in Go risc-v runtime.
>
> I haven't seen any of these crashes myself when testing the syzkaller
> port, but then again I only ran it for rather brief amounts of time
> (~1h) on my laptop using the riscv defconfig and a few additional
> configs enabled.
>
> AFAIK Go tip has seen quite some improvments to its RISC-V port, so it
> might be worth giving it (or Go 1.14beta1) a try.


No luck. I tried:
go version devel +4b28f5ded3 Tue Jun 30 13:18:16 2020 +0000 linux/amd64
and the log is still full of these crashes we don't see on any other instances:

2020/07/01 11:48:09 vm-2: crash: panic: invalid argument to Intn
2020/07/01 11:48:09 vm-28: crash: panic: invalid argument to Intn
2020/07/01 11:48:10 vm-25: crash: panic: invalid argument to Intn
2020/07/01 11:48:11 vm-35: crash: panic: invalid argument to Intn
2020/07/01 11:48:15 VMs 13, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 391, repro 0
2020/07/01 11:48:16 vm-16: crash: panic: invalid argument to Intn
2020/07/01 11:48:25 vm-6: crash: panic: invalid argument to Intn
2020/07/01 11:48:25 VMs 11, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 393, repro 0
2020/07/01 11:48:29 vm-0: crash: panic: invalid argument to Intn
2020/07/01 11:48:35 VMs 14, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 394, repro 0
2020/07/01 11:48:45 VMs 17, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 394, repro 0
2020/07/01 11:48:55 VMs 19, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 394, repro 0
2020/07/01 11:49:05 VMs 22, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 394, repro 0
2020/07/01 11:49:15 VMs 32, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 394, repro 0
2020/07/01 11:49:25 VMs 33, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 394, repro 0
2020/07/01 11:49:35 VMs 33, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 394, repro 0
2020/07/01 11:49:44 vm-12: crash: panic: invalid argument to Intn
2020/07/01 11:49:45 VMs 35, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 395, repro 0
2020/07/01 11:49:49 vm-32: crash: panic: invalid argument to Intn
2020/07/01 11:49:51 vm-5: crash: panic: invalid argument to Intn
2020/07/01 11:49:52 vm-34: crash: panic: invalid argument to Intn
2020/07/01 11:49:52 vm-9: crash: panic: invalid argument to Intn
2020/07/01 11:49:54 vm-17: crash: panic: invalid argument to Intn
2020/07/01 11:49:55 VMs 32, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 400, repro 0
2020/07/01 11:49:59 vm-22: crash: panic: invalid argument to Intn
2020/07/01 11:50:05 VMs 33, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 401, repro 0
2020/07/01 11:50:15 VMs 33, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 401, repro 0
2020/07/01 11:50:25 VMs 33, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 401, repro 0
2020/07/01 11:50:30 vm-10: crash: panic: invalid argument to Intn
2020/07/01 11:50:35 VMs 32, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 402, repro 0
2020/07/01 11:50:45 VMs 33, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 402, repro 0
2020/07/01 11:50:50 vm-8: crash: panic: invalid argument to Intn
2020/07/01 11:50:54 vm-13: crash: panic: invalid argument to Intn
2020/07/01 11:50:54 vm-37: crash: panic: invalid argument to Intn
2020/07/01 11:50:55 VMs 30, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 405, repro 0
2020/07/01 11:51:05 VMs 30, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 405, repro 0
2020/07/01 11:51:15 VMs 30, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 405, repro 0
2020/07/01 11:51:25 VMs 35, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 405, repro 0
2020/07/01 11:51:26 vm-27: crash: panic: invalid argument to Intn
2020/07/01 11:51:29 vm-31: crash: panic: invalid argument to Intn
2020/07/01 11:51:35 VMs 34, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 407, repro 0
2020/07/01 11:51:36 vm-15: crash: panic: invalid argument to Intn
2020/07/01 11:51:36 vm-23: crash: panic: invalid argument to Intn
2020/07/01 11:51:40 vm-39: crash: panic: invalid argument to Intn
2020/07/01 11:51:42 vm-7: crash: panic: invalid argument to Intn
2020/07/01 11:51:45 vm-4: crash: panic: invalid argument to Intn
2020/07/01 11:51:45 VMs 29, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 412, repro 0
2020/07/01 11:51:52 vm-19: crash: panic: invalid argument to Intn
2020/07/01 11:51:54 vm-26: crash: panic: invalid argument to Intn
2020/07/01 11:51:55 VMs 27, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 414, repro 0
2020/07/01 11:52:03 vm-38: crash: panic: invalid argument to Intn
2020/07/01 11:52:03 vm-36: crash: panic: invalid argument to Intn
2020/07/01 11:52:05 VMs 26, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 416, repro 0
2020/07/01 11:52:07 vm-11: crash: panic: invalid argument to Intn
2020/07/01 11:52:12 vm-33: crash: panic: invalid argument to Intn
2020/07/01 11:52:13 vm-29: crash: panic: invalid argument to Intn
2020/07/01 11:52:15 vm-20: crash: panic: invalid argument to Intn
2020/07/01 11:52:15 VMs 22, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 420, repro 0
2020/07/01 11:52:16 vm-24: crash: panic: invalid argument to Intn
2020/07/01 11:52:17 vm-3: crash: panic: invalid argument to Intn
2020/07/01 11:52:17 vm-30: crash: panic: invalid argument to Intn
2020/07/01 11:52:18 vm-14: crash: panic: invalid argument to Intn
2020/07/01 11:52:20 vm-21: crash: panic: invalid argument to Intn
2020/07/01 11:52:20 vm-18: crash: panic: invalid argument to Intn
2020/07/01 11:52:22 vm-1: crash: panic: invalid argument to Intn
2020/07/01 11:52:25 VMs 18, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 427, repro 0
2020/07/01 11:52:35 VMs 18, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 427, repro 0
2020/07/01 11:52:43 vm-2: crash: panic: invalid argument to Intn
2020/07/01 11:52:44 vm-25: crash: panic: invalid argument to Intn
2020/07/01 11:52:44 vm-35: crash: panic: invalid argument to Intn
2020/07/01 11:52:45 VMs 15, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 430, repro 0
2020/07/01 11:52:46 vm-16: crash: panic: invalid argument to Intn
2020/07/01 11:52:47 vm-28: crash: panic: invalid argument to Intn
2020/07/01 11:52:51 vm-9: crash: panic: invalid argument to Intn
2020/07/01 11:52:54 vm-6: crash: panic: invalid argument to Intn
2020/07/01 11:52:55 VMs 12, executed 153462, corpus cover 79651,
corpus signal 174611, max signal 185505, crashes 434, repro 0
2020/07/01 11:53:00 vm-0: crash: panic: invalid argument to Intn

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
