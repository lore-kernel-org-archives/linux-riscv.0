Return-Path: <SRS0=TATJ=F5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68268C433E0
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Dec 2020 17:13:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13C8B22285
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Dec 2020 17:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13C8B22285
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0UR7JJ2hipKFSyfkemPNBwjO1evzMp0SL+r1Iyesenc=; b=Tmt2Bo1dw+M+nj9swhe9gCgbV
	9L3/hC48sJCq3AaQBMYSC2XfIZm9LNB1VfySY+hG9Ndysd6xuAaJIzw/PMJAG2XWPC/jm2mUiNChc
	0NzTq6a/FE1NY5wYw9ALmJSCruqzdGd8qYDTL55950kOTehtdpxNG9oIqu3HQnVydLED7yT3VWNmu
	tZIMrOj8hb7Fof+ZythseUnApmmoIlJ+1esU8lfbV5fADmlM2xxUqdxRLWFIhnojSgMFnefFj34UV
	BRuaIfpIyBzlf5TV1kBl/479BlhtA5cjvnWxz+soMdBcB3eN3RGVSV6dahDvql9QlMon03r2G7yYP
	dWwGPOU3Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ksqev-0003yQ-Cf; Fri, 25 Dec 2020 17:13:45 +0000
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ksqer-0003y1-Ri
 for linux-riscv@lists.infradead.org; Fri, 25 Dec 2020 17:13:44 +0000
Received: by mail-qk1-x72f.google.com with SMTP id v126so4267450qkd.11
 for <linux-riscv@lists.infradead.org>; Fri, 25 Dec 2020 09:13:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yb44vvj/Zt3godrxWa7vX5hawN17u9s8plpiY+KJS0A=;
 b=DJcrn67Paye1EcF7VDun4oghtkaNOPfjGNKYhPaWfnBA6R3TLEJIN+0xIkXTf+yh5x
 BjMeO4XekNAobjlvl49UTM5qUXYbn25Q1kl1vqiNj8W0eEt2bKdXgBDp5wAlmBUa5guw
 hL7Q+WmyGEzJJf+X7w30SJLYm9ayGBaGJNd/BHkeRAANuHVNlebz4vRUvNB0DF2JzmVo
 WduTbc2zRxR9Xj7EXw8TboXg23sYWSAoZrulYFjmnW4x1WAWwSSaszWMTUsCiWiFScwD
 PP6A/Pb3bYZv2XyN6xqb7GGuppl40XLDudk3rcsuMgAKsFAo0RVb5GgUooR7X/xoWFZc
 C0pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yb44vvj/Zt3godrxWa7vX5hawN17u9s8plpiY+KJS0A=;
 b=O6vPdiQyhrrmiaezFboJoiPL6Wf2LozM3tkM1Hm0Oy2JKsplMBios/BML6sBUrwupy
 mNPaS5QtqVHdtKmpbU/mFIB3/C9rtinWQzuBIaoXzzwATugev3LBh2CLVV0rAIdVLlNp
 x5iuVeeHwCAwalCQqWyU6IKECnSq9wq2GNuXX3LPntM9OjY3IWwB8+n0zGsijanxpFEO
 NoDOIWZWHBR9+vC4izTmyo5v7Rp7XD0tGzwiLszilhAwHg0BzN7s5qUnPecaeKwyPdRj
 zstmT8MRRJUgBskz/HHTar04uAy7blpsbMLOYKRXr/F44fPZYT3jkRdWmFjC/s5xZM+C
 FKSg==
X-Gm-Message-State: AOAM5327WY6goF/HYfWvEAsIHbyFX47pVPOmJ2KeeNgi/FfaPJOPLExS
 o5+WG1kQyLHEoArqGppuOfoxgFk9OjNJ1ceR9mJwmQ==
X-Google-Smtp-Source: ABdhPJzLqjGFYAqNZtcCXAdq75/zwwEiCm5N4YkQ5Jca/nJmafK88H2WCnvfN1hdnMQVZ0AqCFfxDVj80tUnfzX8Uws=
X-Received: by 2002:a37:9a97:: with SMTP id
 c145mr34971583qke.350.1608916415097; 
 Fri, 25 Dec 2020 09:13:35 -0800 (PST)
MIME-Version: 1.0
References: <CACT4Y+bpkSYTL_UwNoKVd0PDFF_xrNN6=y_S_v8W3YRaAcMm2g@mail.gmail.com>
 <878s9lbz64.fsf@igel.home>
In-Reply-To: <878s9lbz64.fsf@igel.home>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Fri, 25 Dec 2020 18:13:23 +0100
Message-ID: <CACT4Y+bDqMiC+ou5ghb=XB3Oyjw3p-GTDvNw4NkkQqQthw1yuQ@mail.gmail.com>
Subject: Re: riscv+KASAN does not boot
To: Andreas Schwab <schwab@linux-m68k.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201225_121342_043356_C9003D9D 
X-CRM114-Status: GOOD (  11.85  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>, LKML <linux-kernel@vger.kernel.org>,
 nylon7@andestech.com, syzkaller <syzkaller@googlegroups.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Tobias Klauser <tklauser@distanz.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 25, 2020 at 5:58 PM Andreas Schwab <schwab@linux-m68k.org> wrote:
>
> On Dez 25 2020, Dmitry Vyukov wrote:
>
> > qemu-system-riscv64 \
> > -machine virt -bios default -smp 1 -m 2G \
> > -device virtio-blk-device,drive=hd0 \
> > -drive file=buildroot-riscv64.ext4,if=none,format=raw,id=hd0 \
> > -kernel arch/riscv/boot/Image \
> > -nographic \
> > -device virtio-rng-device,rng=rng0 -object
> > rng-random,filename=/dev/urandom,id=rng0 \
> > -netdev user,id=net0,host=10.0.2.10,hostfwd=tcp::10022-:22 -device
> > virtio-net-device,netdev=net0 \
> > -append "root=/dev/vda earlyprintk=serial console=ttyS0 oops=panic
> > panic_on_warn=1 panic=86400"
>
> Do you get more output with earlycon=sbi?

Hi Andreas,

For defconfig+kvm_guest.config+ scripts/config -e KASAN -e
KASAN_INLINE it actually gave me more output:


OpenSBI v0.7
   ____                    _____ ____ _____
  / __ \                  / ____|  _ \_   _|
 | |  | |_ __   ___ _ __ | (___ | |_) || |
 | |  | | '_ \ / _ \ '_ \ \___ \|  _ < | |
 | |__| | |_) |  __/ | | |____) | |_) || |_
  \____/| .__/ \___|_| |_|_____/|____/_____|
        | |
        |_|

Platform Name          : QEMU Virt Machine
Platform HART Features : RV64ACDFIMSU
Current Hart           : 0
Firmware Base          : 0x80000000
Firmware Size          : 132 KB
Runtime SBI Version    : 0.2

MIDELEG : 0x0000000000000222
MEDELEG : 0x000000000000b109
PMP0    : 0x0000000080000000-0x000000008003ffff (A)
PMP1    : 0x0000000000000000-0xffffffffffffffff (A,R,W,X)
[    0.000000] Linux version 5.10.0-01370-g71c5f03154ac
(dvyukov@dvyukov-desk.muc.corp.google.com) (riscv64-linux-gnu-gcc
(Debian 10.2.0-9) 10.2.0, GNU ld (GNU Binutils for Debian) 2.35.1) #17
SMP Fri Dec 25 18:10:12 CET 2020
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] earlycon: sbi0 at I/O port 0x0 (options '')
[    0.000000] printk: bootconsole [sbi0] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] Zone ranges:
[    0.000000]   DMA32    [mem 0x0000000080200000-0x00000000ffffffff]
[    0.000000]   Normal   empty
[    0.000000] Movable zone start for each node
[    0.000000] Early memory node ranges
[    0.000000]   node   0: [mem 0x0000000080200000-0x00000000ffffffff]
[    0.000000] Initmem setup node 0 [mem 0x0000000080200000-0x00000000ffffffff]
[    0.000000] SBI specification v0.2 detected
[    0.000000] SBI implementation ID=0x1 Version=0x7
[    0.000000] SBI v0.2 TIME extension detected
[    0.000000] SBI v0.2 IPI extension detected
[    0.000000] SBI v0.2 RFENCE extension detected
[    0.000000] software IO TLB: mapped [mem
0x00000000fa3f9000-0x00000000fe3f9000] (64MB)
[    0.000000] Unable to handle kernel paging request at virtual
address dfffffc810040000
[    0.000000] Oops [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted
5.10.0-01370-g71c5f03154ac #17
[    0.000000] epc: ffffffe00042e3e4 ra : ffffffe000c0462c sp : ffffffe001603ea0
[    0.000000]  gp : ffffffe0016e3c60 tp : ffffffe00160cd40 t0 :
dfffffc810040000
[    0.000000]  t1 : ffffffe000e0a838 t2 : 0000000000000000 s0 :
ffffffe001603f50
[    0.000000]  s1 : ffffffe0016e50a8 a0 : dfffffc810040000 a1 :
0000000000000000
[    0.000000]  a2 : 000000000ffc0000 a3 : dfffffc820000000 a4 :
0000000000000000
[    0.000000]  a5 : 000000003e8c6001 a6 : ffffffe000e0a820 a7 :
0000000000000900
[    0.000000]  s2 : dfffffc820000000 s3 : dfffffc800000000 s4 :
0000000000000001
[    0.000000]  s5 : ffffffe0016e5108 s6 : fffffffffffff000 s7 :
dfffffc810040000
[    0.000000]  s8 : 0000000000000080 s9 : ffffffffffffffff s10:
ffffffe07a119000
[    0.000000]  s11: 000000000000ffc0 t3 : ffffffe0016eb908 t4 :
0000000000000001
[    0.000000]  t5 : ffffffc4001c150a t6 : ffffffe001603be8
[    0.000000] status: 0000000000000100 badaddr: dfffffc810040000
cause: 000000000000000f
[    0.000000] random: get_random_bytes called from
oops_exit+0x30/0x58 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Fatal exception
[    0.000000] ---[ end Kernel panic - not syncing: Fatal exception ]---


But I first tried with a the kernel image I had in the dir, I think it
was this config (no KASAN):
https://gist.githubusercontent.com/dvyukov/b2b62beccf80493781ab03b41430e616/raw/62e673cff08a8a41656d2871b8a37f74b00f509f/gistfile1.txt

and earlycon=sbi did not change anything (no output after OpenSBI).
So potentially there are 2 different problems.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
