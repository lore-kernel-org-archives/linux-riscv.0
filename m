Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90404C19F4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hbD0/nd7kU1ed9geKYcBPk9lPPACgmHG04EusgDCQcs=; b=IkRA9PmPT5eA1j
	t6HAZ9J0pyoq5eKm6lb2xC8eZIfqJvRz762LHGKZPip7tR5Y6IblSENYUGqQ8/5xRMTHibWR8F5aP
	YCuSvpA0hdYe0q09TY3bXmRimZJGkhdZbzdgMJUZSfLMBIzo4pWiyJJdBoX6rxWjx9EZji9lt9sHY
	gGjeO7BR1R1LZQTXcDBIgryoLb304KqXyGTbXy/TMVngHCCYxS2r1/owRFlN62LD2tfpMNGxp9Gby
	4ulVHjIfgwe5l67J7mOBmWOJ69CMH1jYlaA0GflS2vp8iZ0l3iaig7O4OtQnrMP1rmJHsIpLhf/71
	Kcb1qWkMv9PvSmyEuoqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4jZz-0000000G567-10OR;
	Wed, 08 May 2024 15:51:39 +0000
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4jZd-0000000G4xL-05dO
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 15:51:24 +0000
Received: by mail-io1-xd32.google.com with SMTP id ca18e2360f4ac-7deb424da41so221976939f.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 08:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1715183466; x=1715788266; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4WE1G5FWtyUIcnvz5xZmsZHl1jFPZWuROZUtGJ9Peeo=;
        b=gMwt9SoGXK/9DIH3B6XlavQ/eo1D00f5W/NOoYyD8m3eEX1JG4pT2rOFu8ScOnud4Q
         +mBGBEoZDoBji2R9MmGKV17f6Mx1pUct9bEX/klAsVEx4LL9fqBz8pYXtMWyQgqCUJIh
         GMxYpcFIH+Z1IHut0uoXQrV8aGvRrF0j9LPrAPPyXJTxDKY+0yeE7C5EBjJGPe91hhbK
         VXYDqPAH8DeTqz8/y9rXf/VdXkIB6I+C/x+JPoHG3okyOpznVIJzaoDy7urCg+Qx2upf
         pQ9VuZRrTFxmfDoTqwW5UD5ga7nY7gq7NqP5UYapzyUnj9GdH8EZkeOzMmDMxkkJE6bP
         V0UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715183466; x=1715788266;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4WE1G5FWtyUIcnvz5xZmsZHl1jFPZWuROZUtGJ9Peeo=;
        b=nxLSN4arVq8YGHqY6XKbswj0iMY2DMgvHGKkol4h9JEw0M3t7JsWp3IdQ+guJB5XJm
         rTHivwPSg02+ChsTe3XMj8A2oRGqNiE9bB1fbNffSkjv3m9r9M1FZPqLPcdxTAZkmxuR
         01nGuFk9DsdiEnKJZQ1vE2tF1hpHS1rIouLHBk4BpGU0IFjgMWDn+Y4oBeGxZEMvI8cY
         QT5K9VbtUvWkKFk14CnJzdKLXuEw0YsVMl3OtaUNHuu+Z05q2fuwFihcfV9D8bwX5Zgw
         8mBUu+V6w3Fs87bu3eo8eL0KS1dvsheXfBH2R/ysHpP8gnnYWJOIGZ+gFy8DYuBwwCPn
         4hLw==
X-Forwarded-Encrypted: i=1; AJvYcCWbp+4geuL582DYIKOr0X18vAc0kd4oGEobJVd7u2x53qXkuwSmtRCTtxxwC3yHZrGt+CkU80IQVt6UChm1d+QmImwgHpLRLPbFWmoOcnKu
X-Gm-Message-State: AOJu0YxLGFgHG3BhXsK5fdfCbO/wni+qDGttcqsU3whfUQahsZuXHlyE
	b1sbyTd952C39gHDAB+Y21rninyL9NRh7KwVjT+tAbpKFczuzg08y1tBYH06qBdT9EAApd1ME1l
	b
X-Google-Smtp-Source: AGHT+IHbF84rbmXetJ45QhAMrDogJLjUi54JKnED27VrH7TNERalbHmzi0Nvd0Wm3YXhgFdzsbepFA==
X-Received: by 2002:a05:6e02:1521:b0:36c:85c:9800 with SMTP id e9e14a558f8ab-36caed56926mr32412135ab.29.1715183466585;
        Wed, 08 May 2024 08:51:06 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.6.197])
        by smtp.gmail.com with ESMTPSA id hw12-20020a056638720c00b00488e6917b9asm840625jab.106.2024.05.08.08.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 May 2024 08:51:06 -0700 (PDT)
Message-ID: <527dd4d8-f1e5-4581-b1e3-aa315fea8caf@sifive.com>
Date: Wed, 8 May 2024 10:51:04 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] riscv: stacktrace: fixed walk_stackframe()
To: Matthew Bystrin <dev.mbstr@gmail.com>, linux-riscv@lists.infradead.org
References: <20240426072701.6463-1-dev.mbstr@gmail.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20240426072701.6463-1-dev.mbstr@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_085117_573649_E3BD3C3F 
X-CRM114-Status: GOOD (  35.47  )
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

Hi Matthew,

Thanks for the patch!

On 2024-04-26 2:24 AM, Matthew Bystrin wrote:
> If the load access fault occures in a function without callee
> (CONFIG_FRAME_POINTER=y), when wrong stack trace will be displayed:
> 
> [<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
> ---[ end trace 0000000000000000 ]---
> 
> Registers dump:
>     ra     0xffffffff80485758 <regmap_mmio_read+36>
>     sp     0xffffffc80200b9a0
>     fp     0xffffffc80200b9b0
>     pc     0xffffffff804853ba <regmap_mmio_read32le+6>
> 
> Stack dump:
>     0xffffffc80200b9a0:  0xffffffc80200b9e0  0xffffffc80200b9e0
>     0xffffffc80200b9b0:  0xffffffff8116d7e8  0x0000000000000100
>     0xffffffc80200b9c0:  0xffffffd8055b9400  0xffffffd8055b9400
>     0xffffffc80200b9d0:  0xffffffc80200b9f0  0xffffffff8047c526
>     0xffffffc80200b9e0:  0xffffffc80200ba30  0xffffffff8047fe9a
> 
> The assembler dump of the function preambula:
>     add     sp,sp,-16
>     sd      s0,8(sp)
>     add     s0,sp,16
> 
> In the fist stack frame, where ra is not stored on the stack we can
> observe:
> 
>         0(sp)                  8(sp)
>         .---------------------------------------------.
>     sp->|       frame->fp      | frame->ra (saved fp) |
>         |---------------------------------------------|
>     fp->|         ....         |         ....         |
>         |---------------------------------------------|
>         |                      |                      |
> 
> and in the code check is performed:
> 	if (regs && (regs->epc == pc) && (frame->fp & 0x7))
> 
> I see no reason to check frame->fp value at all, because it is can be
> uninitialized value on the stack, so removed it. After the stacktrace

The purpose of this check is to distinguish leaf functions from non-leaf
functions, which have a different frame record layout. regs->epc does not
necessarily point to somewhere in a leaf function, for example if a non-leaf
function was preempted by an interrupt. So it incorrect to remove the check
entirely and always consider the first frame in the stack trace to be a leaf
function.

You are correct that for a leaf function, frame->fp could be uninitialized or an
arbitrary saved register, so the existing check is wrong. A better check would
be based on frame->ra, which is always pushed. For non-leaf functions, frame->ra
is a kernel text address. For leaf functions, frame->ra is a stack address. So
checking if frame->ra is within the current stack (between `low` and `high`)
should be sufficient to detect this case.

> shows as expect:
> 
> [<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
> [<ffffffff80485758>] regmap_mmio_read+0x24/0x52
> [<ffffffff8047c526>] _regmap_bus_reg_read+0x1a/0x22
> [<ffffffff8047fe9a>] _regmap_read+0x5c/0xea
> [<ffffffff80480376>] _regmap_update_bits+0x76/0xc0
> ...
> ---[ end trace 0000000000000000 ]---
> 
> Fixes: f766f77a74f5 ("riscv/stacktrace: Fix stack output without ra on the stack top")
> Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
> ---
> I've catched this bug on v6.1 with gcc 12.2.0 (Debian 12.2.0-13). Different
> compiler versions generate the same assembler code. So I think this is not a
> compiler issue.

Unfortunately, this is indeed a mismatch between the compiler and the documented
ABI[1]. The ABI was created based on the existing GCC behavior[2]. However, the
GCC behavior is different for leaf functions. Specifically, the logic for
determining if ra needs to be saved on the stack does not check if frame
pointers are enabled. Since GCC was not trying to maintain a specific stack
frame layout, and just pushing registers sequentially as needed, this makes the
frame record layout different for leaf functions. So existing versions of GCC
are incompatible with the ABI as written.

This was fixed for GCC 14 as a side effect of adding the
-m(no)-omit-leaf-frame-pointer option[3]. After this change, ra is always saved
if a frame record is being saved, so the frame record layout is always the same,
matching the ABI.

For the kernel, since we want frame records to be available for stack walking,
we should pass -mno-omit-leaf-frame-pointer if that option is supported. If the
option is supported, we know the ABI is fixed, so in that case we can omit the
workaround described above.

We may still want a compiler version check, because there is a much simpler GCC
change that would fix the ABI incompatibility in older branches without adding
the new option:

diff --git a/gcc/config/riscv/riscv.cc b/gcc/config/riscv/riscv.cc
index dddd72aa237..58722507dcb 100644
--- a/gcc/config/riscv/riscv.cc
+++ b/gcc/config/riscv/riscv.cc
@@ -3894,7 +3894,8 @@ riscv_save_reg_p (unsigned int regno)
   if (regno == HARD_FRAME_POINTER_REGNUM && frame_pointer_needed)
     return true;

-  if (regno == RETURN_ADDR_REGNUM && crtl->calls_eh_return)
+  if (regno == RETURN_ADDR_REGNUM && (crtl->calls_eh_return
+				      || frame_pointer_needed))
     return true;

   /* If this is an interrupt handler, then must save extra registers.  */


[1]:
https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention
[2]: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/issues/18
[3]:
https://github.com/gcc-mirror/gcc/commit/39663298b5934831a0125e12f113ebd83248c3be

Regards,
Samuel

> 
>  arch/riscv/kernel/stacktrace.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 64a9c093aef9..8138c68270c9 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -55,7 +55,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  		/* Unwind stack frame */
>  		frame = (struct stackframe *)fp - 1;
>  		sp = fp;
> -		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
> +		if (regs && regs->epc == pc) {
>  			fp = frame->ra;
>  			pc = regs->ra;
>  		} else {


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
