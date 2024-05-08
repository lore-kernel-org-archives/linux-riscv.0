Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1458AC25B4F
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 17:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:Message-ID:To:From:CC:In-Reply-To:Subject:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=vcuQu2ZcGpczidLhfDMeCfB/Jvyh/YVEYiZsFxZVvtk=; b=MSWUivQ1Occk03
	Y9+G+jsv8xvGWBHfSxLVHUhC+nEq7tiF1s8ybQd2Pp/uEeG9ML6cXKC/2qIi67s6ZdCZFskRn4reR
	RJLVF3vE67wDoqumf/2e72MFin/emyRewSzHMHrf3Ru3pRulDHOHDNnoCZAgj4D5qCoA29rbAkdpd
	gQyYS5g5bfIWaQo0QUYv0dTCw9h49BZzqVkJZTggODRN5LQfIhOinuqPh5Spe6zoJDc9dfjJsWrfJ
	adiLhZpLT5a6qejPlt4NVNpZJ03QgIaKB82FCwgqQvBlnciYquILLHJ+UV6JJCguuCAqGPQhflgm9
	cd3DYL+5llY+MiEJWMyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kjt-0000000GHb7-3ZVU;
	Wed, 08 May 2024 17:05:57 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4kjq-0000000GHWq-0ZO6
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 17:05:56 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1eca195a7c8so37771095ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 May 2024 10:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1715187946; x=1715792746; darn=lists.infradead.org;
        h=message-id:to:from:cc:in-reply-to:subject:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OsVb2zjZnAQdyknve6sQ5KlvMjnqegaAaNz+muWstls=;
        b=VtKjTx2wUEJq7YVWk0AUOySuUa+UkthLQPSaI94rWq0ajbJ7b1pVOK1L7d/7smTu9K
         d3cRKKMuDzHdotN5FjrtOkLnPShjx97pdobNb1GvAbPT+dvSe6P/m48XfVMjBdXwVTmc
         9Vww+y6ROklunyajFZOBYRIgj5YHxWYVtpWUbBNOgVEHiM7K6D30Zw+vtl3Td6oW39TH
         hYl0iGaXUyOcVbcC/lthPiABNM9bturgv1cSj0MusEeqYrc0Z/+ST69Ecn5yiChcIQS9
         QBB0xE5DxjV/yhK3iEjzR166LqFlw9jCZ7UuoxFsfj1Bm7P6lBQuwI3qU9jcKrfa3VOH
         JJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715187946; x=1715792746;
        h=message-id:to:from:cc:in-reply-to:subject:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OsVb2zjZnAQdyknve6sQ5KlvMjnqegaAaNz+muWstls=;
        b=UO05v8VMjsbAzaCaM4af8m6XbQMgQQjV2JxctGNK5+3m8b/ABSmv+xqvpIOz4RSoeY
         od6X5ybMWRAEQi0tkygOmEQ9J2dChP5QrFcoHRGr2elwt4BrtlVVMzzg0d/rN1SNYrOJ
         VKu6RmdanyDLZcSH4hhiB/3G3USwOdtqSLNtzNo+AO62dyvtCcXFsHAyPZ5s0Vi27RIh
         PKI7zB5McRknUrxMXSFLTmatqLVBx0Fns/JYNbYIo/3qOUOcirct8iXRiOUI0y1ZKQJH
         NFlDIWDwTBbxY/i0zsxzp6YXQpEjQXTdIyQ9CK2hQb/EZuJ61L6xk9iS6vBaa6ACe8ti
         EBrw==
X-Forwarded-Encrypted: i=1; AJvYcCXH/Ub/YmB7f/vvvk1OPKxMezUMcDo+WZpen2DQcpChbaI2TOIbhQvoSHHhRVJBfzHdy9Qd2QPNqZCV8hp+zgGCIOoPxJPfbbvVzYlAu3Tu
X-Gm-Message-State: AOJu0YwpdZ8/9UOcIujqMCZxeJa+p9Dd3Y2cwEWb0UCcJqfGjYblGEg2
	Lb4XqftA0OqrUFKMPiO3CqMuY9lTJSvhCpyc3mQmFdFe+yh1UeoOtUKal1p19GbZIGSVvicj+m9
	B
X-Google-Smtp-Source: AGHT+IHT8rnri6HbjMzklg6NYW5oLOcp998ASFTUlMrqP1XEHewOnMqz8cHWB8QQhVcfnreXSwzbBg==
X-Received: by 2002:a17:903:245:b0:1eb:50fd:7875 with SMTP id d9443c01a7336-1eeb01a619emr31869365ad.33.1715187945806;
        Wed, 08 May 2024 10:05:45 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id s8-20020a170902ea0800b001e2ba8605dfsm12088270plg.150.2024.05.08.10.05.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 May 2024 10:05:45 -0700 (PDT)
Date: Wed, 08 May 2024 10:05:45 -0700 (PDT)
X-Google-Original-Date: Wed, 08 May 2024 10:05:40 PDT (-0700)
Subject: Re: [PATCH] riscv: stacktrace: fixed walk_stackframe()
In-Reply-To: <527dd4d8-f1e5-4581-b1e3-aa315fea8caf@sifive.com>
CC: dev.mbstr@gmail.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: samuel.holland@sifive.com
Message-ID: <mhng-594655d0-d6a3-4705-a107-893507542f01@palmer-ri-x1c9>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_100554_347377_A31654C8 
X-CRM114-Status: GOOD (  49.68  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4818423908644033272=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============4818423908644033272==
Content-Type: text/plain

On Wed, 08 May 2024 08:51:04 PDT (-0700), samuel.holland@sifive.com wrote:
> Hi Matthew,
>
> Thanks for the patch!
>
> On 2024-04-26 2:24 AM, Matthew Bystrin wrote:
>> If the load access fault occures in a function without callee
>> (CONFIG_FRAME_POINTER=y), when wrong stack trace will be displayed:
>>
>> [<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
>> ---[ end trace 0000000000000000 ]---
>>
>> Registers dump:
>>     ra     0xffffffff80485758 <regmap_mmio_read+36>
>>     sp     0xffffffc80200b9a0
>>     fp     0xffffffc80200b9b0
>>     pc     0xffffffff804853ba <regmap_mmio_read32le+6>
>>
>> Stack dump:
>>     0xffffffc80200b9a0:  0xffffffc80200b9e0  0xffffffc80200b9e0
>>     0xffffffc80200b9b0:  0xffffffff8116d7e8  0x0000000000000100
>>     0xffffffc80200b9c0:  0xffffffd8055b9400  0xffffffd8055b9400
>>     0xffffffc80200b9d0:  0xffffffc80200b9f0  0xffffffff8047c526
>>     0xffffffc80200b9e0:  0xffffffc80200ba30  0xffffffff8047fe9a
>>
>> The assembler dump of the function preambula:
>>     add     sp,sp,-16
>>     sd      s0,8(sp)
>>     add     s0,sp,16
>>
>> In the fist stack frame, where ra is not stored on the stack we can
>> observe:
>>
>>         0(sp)                  8(sp)
>>         .---------------------------------------------.
>>     sp->|       frame->fp      | frame->ra (saved fp) |
>>         |---------------------------------------------|
>>     fp->|         ....         |         ....         |
>>         |---------------------------------------------|
>>         |                      |                      |
>>
>> and in the code check is performed:
>> 	if (regs && (regs->epc == pc) && (frame->fp & 0x7))
>>
>> I see no reason to check frame->fp value at all, because it is can be
>> uninitialized value on the stack, so removed it. After the stacktrace
>
> The purpose of this check is to distinguish leaf functions from non-leaf
> functions, which have a different frame record layout. regs->epc does not
> necessarily point to somewhere in a leaf function, for example if a non-leaf
> function was preempted by an interrupt. So it incorrect to remove the check
> entirely and always consider the first frame in the stack trace to be a leaf
> function.
>
> You are correct that for a leaf function, frame->fp could be uninitialized or an
> arbitrary saved register, so the existing check is wrong. A better check would
> be based on frame->ra, which is always pushed. For non-leaf functions, frame->ra
> is a kernel text address. For leaf functions, frame->ra is a stack address. So
> checking if frame->ra is within the current stack (between `low` and `high`)
> should be sufficient to detect this case.

I was just playing with this, looks like GCC is treating tail-call-only 
functions as leaf functions.  So I think whatever workaround we come up 
with loses the tail-call-only function in the backtrace, not sure if 
there's any way we can work around that as there's essentially no 
frame remaining for it.  From https://godbolt.org/z/7bMsEbqjn and 
GCC trunk

    int glob;
    
    void leaf(int x) {
        glob = x;
    }
    
    void tail(int x) {
        leaf(x);
    }
    
    void func(int x) {
        leaf(x);
        glob = x+1;
    }
    
    -O2 -fno-inline -fno-omit-frame-pointer -momit-leaf-frame-pointer
    
    leaf(int):
            lui     a5,%hi(glob)
            sw      a0,%lo(glob)(a5)
            ret
    tail(int):
            tail    leaf(int)
    func(int):
            addi    sp,sp,-32
            sd      s0,16(sp)
            sd      s1,8(sp)
    …        addi    sp,sp,32
            jr      ra
    glob:
            .zero   4

>
>> shows as expect:
>>
>> [<ffffffff804853c2>] regmap_mmio_read32le+0xe/0x1c
>> [<ffffffff80485758>] regmap_mmio_read+0x24/0x52
>> [<ffffffff8047c526>] _regmap_bus_reg_read+0x1a/0x22
>> [<ffffffff8047fe9a>] _regmap_read+0x5c/0xea
>> [<ffffffff80480376>] _regmap_update_bits+0x76/0xc0
>> ...
>> ---[ end trace 0000000000000000 ]---
>>
>> Fixes: f766f77a74f5 ("riscv/stacktrace: Fix stack output without ra on the stack top")
>> Signed-off-by: Matthew Bystrin <dev.mbstr@gmail.com>
>> ---
>> I've catched this bug on v6.1 with gcc 12.2.0 (Debian 12.2.0-13). Different
>> compiler versions generate the same assembler code. So I think this is not a
>> compiler issue.
>
> Unfortunately, this is indeed a mismatch between the compiler and the documented
> ABI[1]. The ABI was created based on the existing GCC behavior[2]. However, the
> GCC behavior is different for leaf functions. Specifically, the logic for
> determining if ra needs to be saved on the stack does not check if frame
> pointers are enabled. Since GCC was not trying to maintain a specific stack
> frame layout, and just pushing registers sequentially as needed, this makes the
> frame record layout different for leaf functions. So existing versions of GCC
> are incompatible with the ABI as written.
>
> This was fixed for GCC 14 as a side effect of adding the
> -m(no)-omit-leaf-frame-pointer option[3]. After this change, ra is always saved
> if a frame record is being saved, so the frame record layout is always the same,
> matching the ABI.

Ya, I think so -- IIUC we don't strictly need the option because the 
default seems to follow -fno-omit-frame-pointer, so we only strictly need 
to check for the presence of -mno-omit-leaf-frame-pointer.  Probably 
cleaner to just stick the option in there when it's supported, though, 
just to be on the safe side.

> For the kernel, since we want frame records to be available for stack walking,
> we should pass -mno-omit-leaf-frame-pointer if that option is supported. If the
> option is supported, we know the ABI is fixed, so in that case we can omit the
> workaround described above.
>
> We may still want a compiler version check, because there is a much simpler GCC
> change that would fix the ABI incompatibility in older branches without adding
> the new option:
>
> diff --git a/gcc/config/riscv/riscv.cc b/gcc/config/riscv/riscv.cc
> index dddd72aa237..58722507dcb 100644
> --- a/gcc/config/riscv/riscv.cc
> +++ b/gcc/config/riscv/riscv.cc
> @@ -3894,7 +3894,8 @@ riscv_save_reg_p (unsigned int regno)
>    if (regno == HARD_FRAME_POINTER_REGNUM && frame_pointer_needed)
>      return true;
>
> -  if (regno == RETURN_ADDR_REGNUM && crtl->calls_eh_return)
> +  if (regno == RETURN_ADDR_REGNUM && (crtl->calls_eh_return
> +				      || frame_pointer_needed))
>      return true;
>
>    /* If this is an interrupt handler, then must save extra registers.  */

IMO we should try backporting the option to GCC-13, that's a cleaner 
user interface.

> [1]:
> https://github.com/riscv-non-isa/riscv-elf-psabi-doc/blob/master/riscv-cc.adoc#frame-pointer-convention
> [2]: https://github.com/riscv-non-isa/riscv-elf-psabi-doc/issues/18
> [3]:
> https://github.com/gcc-mirror/gcc/commit/39663298b5934831a0125e12f113ebd83248c3be
>
> Regards,
> Samuel
>
>>
>>  arch/riscv/kernel/stacktrace.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
>> index 64a9c093aef9..8138c68270c9 100644
>> --- a/arch/riscv/kernel/stacktrace.c
>> +++ b/arch/riscv/kernel/stacktrace.c
>> @@ -55,7 +55,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>>  		/* Unwind stack frame */
>>  		frame = (struct stackframe *)fp - 1;
>>  		sp = fp;
>> -		if (regs && (regs->epc == pc) && (frame->fp & 0x7)) {
>> +		if (regs && regs->epc == pc) {
>>  			fp = frame->ra;
>>  			pc = regs->ra;
>>  		} else {
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv


--===============4818423908644033272==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4818423908644033272==--
