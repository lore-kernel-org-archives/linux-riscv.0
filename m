Return-Path: <SRS0=JAyV=IT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F4F6C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Mar 2021 20:21:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BAE6C61931
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Mar 2021 20:21:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BAE6C61931
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8UJkyXm4A3MsfuLwcv95jsZsyheTYwtng0mE3PYLC3U=; b=WUF/gQZS6Mt8SucZlE75nEZT+
	S+d7D/ODKZxbBgaKy7L/LJjF5CVEQ7r9OigSSBo8qk11+3euV3q0LkPbfTtldr7clQMdQ0J9FC+pP
	32EzqU9kd0D5gOpaN0CmTEmBGAc+7IGrM+o1mVWhtDnj5Q6ONRARqCHyBeJeXkMqdxfA3JWDoi8Dr
	iHdu+/TxLit+9vQmZGISSk+KBDB6soCs6d5AjpaTfbYkADOVhNCqFa0PY5I1RO2Ux2sgL0KYkiS9E
	44Xd1yXcQY/RAMuA5RWl/prQseMVfNNup1mfFzRElGFLnxMWTx5yWZ0wxvJyieCZK9vHXRIM9GRxt
	nOvgdJ4Kw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lO4Zd-00ALhb-Lc; Sun, 21 Mar 2021 20:21:21 +0000
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lO4ZO-00ALg5-8w
 for linux-riscv@lists.infradead.org; Sun, 21 Mar 2021 20:21:18 +0000
Received: by mail-ot1-x32c.google.com with SMTP id
 m21-20020a9d7ad50000b02901b83efc84a0so13922690otn.10
 for <linux-riscv@lists.infradead.org>; Sun, 21 Mar 2021 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ml2CAGfeWm9mmFcT8io3E2LueuJYHNce2KGbKvNhe/o=;
 b=PtuWr/U+sqzCVLMcJ0B9O8DCNzwTq3qYOcCVk1Mc12F7cYCNnA5I/0zRurmkIIG1lw
 kg1KiWTH1vtZrMLbSSH78e1yxaS3u4X07oWv/7EvxzKYvoJARJCfiG6V30MRNNLioIcQ
 1cSmCcyPXEB3MFARyGi0OHLLxGmAAm99vBHWmXNBiz5gPCdWCZ6hDJCIvLruvWJaaJjV
 XnVKSeN4Tq+QOMpt/aGM3LQ24FFXFGiqwK8QePaHk/+t2iSbox4Eguv4u8POlpvuTcpN
 HIe1/YKqGGyCHt0ivy79HXBkHFksf/W41ILlFfoHiwHsngG7Y+yLz++KZ5GcfEhuQMl5
 v9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ml2CAGfeWm9mmFcT8io3E2LueuJYHNce2KGbKvNhe/o=;
 b=oehBzdS5DfWWEh6NmxIom4PeI9+z81OtRRFBbeqQDcpDDd5fHDs2MgDbhbk+SXyxc9
 jVO84E3S1kHTsbMzUwXt3BX+ZGTbb6d1DcdpL0r9VNIRLALgQmLSkUIT73du+STTTno3
 IVmIbmTCeZvc5xsJPSwS6qYP0W4y4kErlqnPa7XoAiAJkifPDwGHVABXthH798cCGBmE
 BmpXgGPpty4DCehN6DtNVDj9nLiBeSweHLh1yW/4JERwDxKCyfSiIHKDOywKIzEoVZd/
 wajunKEuqgfD9Cn4NSUBsaKPP7nFrmIxTdUH5JCdbr/aEfiIlAxtLAnMoPQfETDD1cGz
 Ss7g==
X-Gm-Message-State: AOAM533z3dPg5TqFNwkoJKox1O76mOYzOKmKkXhG0RTmXHLEEI57qkLa
 4GxfUn5puSeiXXrU7/iFCT0=
X-Google-Smtp-Source: ABdhPJz6gwGf/T6Qab0+dLhMoM8CmLXE1E1osNarieuhjULfTLIx37pTer27dN5qiDpH7/6G+S6nig==
X-Received: by 2002:a9d:3437:: with SMTP id v52mr6252883otb.55.1616358065008; 
 Sun, 21 Mar 2021 13:21:05 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id 64sm2937923otu.80.2021.03.21.13.21.03
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 21 Mar 2021 13:21:04 -0700 (PDT)
Date: Sun, 21 Mar 2021 13:21:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vitaly Wool <vitaly.wool@konsulko.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 Bin Meng <bin.meng@windriver.com>, Anup Patel <anup@brainfault.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Nicolas Pitre <nico@fluxnic.net>
Subject: Re: [PATCH v4] RISC-V: enable XIP
Message-ID: <20210321202103.GA121213@roeck-us.net>
References: <20210306121438.12827-1-vitaly.wool@konsulko.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210306121438.12827-1-vitaly.wool@konsulko.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210321_202106_448388_7F71DD4F 
X-CRM114-Status: GOOD (  17.59  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Mar 06, 2021 at 02:14:38PM +0200, Vitaly Wool wrote:
> Introduce XIP (eXecute In Place) support for RISC-V platforms.
> It allows code to be executed directly from non-volatile storage
> directly addressable by the CPU, such as QSPI NOR flash which can
> be found on many RISC-V platforms. This makes way for significant
> optimization of RAM footprint. The XIP kernel is not compressed
> since it has to run directly from flash, so it will occupy more
> space on the non-volatile storage to The physical flash address
> used to link the kernel object files and for storing it has to
> be known at compile time and is represented by a Kconfig option.
> 
> XIP on RISC-V will currently only work on MMU-enabled kernels.
> 
> Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
> ---

The impact of this patch on RISC-V images running in qemu is quite fatal.

[    0.000000] Linux version 5.12.0-rc3-next-20210319 (groeck@saturn.roeck-us.net) (riscv64-linux-gcc (GCC) 9.3.0, GNU ld (GNU Binutils) 2.34) #1 SMP Fri Mar 19 04:01:41 PDT 2021
[    0.000000] OF: fdt: Ignoring memory range 0x80000000 - 0x80200000
[    0.000000] Machine model: riscv-virtio,qemu
[    0.000000] earlycon: uart8250 at MMIO 0x0000000010000000 (options '115200')
[    0.000000] printk: bootconsole [uart8250] enabled
[    0.000000] efi: UEFI not found.
[    0.000000] Unable to handle kernel paging request at virtual address 0000000040000001
[    0.000000] Oops [#1]
[    0.000000] Modules linked in:
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.12.0-rc3-next-20210319 #1
[    0.000000] Hardware name: riscv-virtio,qemu (DT)
[    0.000000] epc : fdt_check_header+0x0/0x1fc
[    0.000000]  ra : early_init_dt_verify+0x16/0x6e
[    0.000000] epc : ffffffe00049c04a ra : ffffffe000a26144 sp : ffffffe001603f10
[    0.000000]  gp : ffffffe0017d04b0 tp : ffffffe001611280 t0 : ffffffffffffffff
[    0.000000]  t1 : 0000000012adc51a t2 : 000000000004ffeb s0 : ffffffe001603f30
[    0.000000]  s1 : 0000000040000000 a0 : 0000000040000000 a1 : ffffffe001617ae8
[    0.000000]  a2 : 0000000000000000 a3 : 0000000000000001 a4 : 0000000000000018
[    0.000000]  a5 : ffffffe000c0f8f0 a6 : ffffffe01fdfee70 a7 : 0000000000000000
[    0.000000]  s2 : 0000000080000200 s3 : 0000000000000fff s4 : ffffffe000c0ec60
[    0.000000]  s5 : 0000000000000006 s6 : 00000000000001c0 s7 : ffffffe01fdfee40
[    0.000000]  s8 : 0000000081000200 s9 : 0000000080000200 s10: ffffffe000c01000
[    0.000000]  s11: 0000000000000fff t3 : 000000000000000e t4 : ffffffffa6000000
[    0.000000]  t5 : ffffffffffffffff t6 : 0000000000000015
[    0.000000] status: 0000000000000100 badaddr: 0000000040000001 cause: 000000000000000d
[    0.000000] Call Trace:
[    0.000000] [<ffffffe00049c04a>] fdt_check_header+0x0/0x1fc
[    0.000000] [<ffffffe000a02c84>] setup_arch+0x3a8/0x414
[    0.000000] [<ffffffe000a006fa>] start_kernel+0x8e/0x62c
[    0.000000] random: get_random_bytes called from print_oops_end_marker+0x22/0x44 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

This is with riscv:defconfig. Reverting this patch fixes the problem.

Bisect log is attached.

Guenter

---
# bad: [f00397ee41c79b6155b9b44abd0055b2c0621349] Add linux-next specific files for 20210319
# good: [1e28eed17697bcf343c6743f0028cc3b5dd88bf0] Linux 5.12-rc3
git bisect start 'HEAD' 'v5.12-rc3'
# bad: [728bc19f9c531acd94e4139e8258a1577f17d2ff] Merge remote-tracking branch 'drm/drm-next'
git bisect bad 728bc19f9c531acd94e4139e8258a1577f17d2ff
# bad: [ad5d10f254a7d91a9fadadcf2b109795544e9dcb] Merge remote-tracking branch 'hid/for-next'
git bisect bad ad5d10f254a7d91a9fadadcf2b109795544e9dcb
# good: [163518c802260a16b5bca8bd7fe0a9335a6860e1] Merge remote-tracking branch 'qcom/for-next'
git bisect good 163518c802260a16b5bca8bd7fe0a9335a6860e1
# bad: [a9fdd30a39510f783a38fe5c30b2d888397b35d5] Merge remote-tracking branch 'btrfs/for-next'
git bisect bad a9fdd30a39510f783a38fe5c30b2d888397b35d5
# good: [3f26d646c9c30116057e2cc34091e7d3fd894863] Merge remote-tracking branch 'microblaze/next'
git bisect good 3f26d646c9c30116057e2cc34091e7d3fd894863
# good: [f0fd694b8c3eba5651fa9eed185cc1c39c1a3d64] Merge branch 'ext/qu/subpage-write-meta-v2' into for-next-next-v5.12-20210317
git bisect good f0fd694b8c3eba5651fa9eed185cc1c39c1a3d64
# bad: [762f6038cff9e5658c29936a0ff0398fb2b77dc9] Merge remote-tracking branch 'sh/for-next'
git bisect bad 762f6038cff9e5658c29936a0ff0398fb2b77dc9
# good: [fb009cbdd0693bd633f11e99526617b3d392cfad] firmware: bcm47xx_nvram: rename finding function and its variables
git bisect good fb009cbdd0693bd633f11e99526617b3d392cfad
# good: [10b3a0a8f783dc5491921f0236f1b756cbe1b12d] Merge remote-tracking branch 'parisc-hd/for-next'
git bisect good 10b3a0a8f783dc5491921f0236f1b756cbe1b12d
# good: [2882b7626f4903a8e9250b328cdf7396a6deecac] sh: kernel: traps: remove unused variable
git bisect good 2882b7626f4903a8e9250b328cdf7396a6deecac
# bad: [06c7c914de26c5a4f1418fd54e4dfd0be4215de6] RISC-V: enable XIP
git bisect bad 06c7c914de26c5a4f1418fd54e4dfd0be4215de6
# good: [9530141455c968938a913d602a236c2a7b0322e1] riscv: Add ARCH_HAS_FORTIFY_SOURCE
git bisect good 9530141455c968938a913d602a236c2a7b0322e1
# good: [2f100585d04506004b8027ec9bbaee26940a769f] riscv: Enable generic clockevent broadcast
git bisect good 2f100585d04506004b8027ec9bbaee26940a769f
# first bad commit: [06c7c914de26c5a4f1418fd54e4dfd0be4215de6] RISC-V: enable XIP

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
