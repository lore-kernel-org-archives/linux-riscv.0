Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 839A2C001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 08:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XC9UGHGE5uTcmMizdFMBs4aYXbBjmic1v5++1OmgiMA=; b=e34qp1+JJBHYPS
	+fxiuZ7bqLpz1q1xpVRTSXKgKcPUyyiB7euA1fOANPqKVyTtoi2tcjeJbcFiAyzFZogiv4gUAdiaZ
	UH2vnxEuB7urZGEmu30HxXWWwFw9BmVKbaV5qJqMnUdu+NZqsZgPwll+x2GRQsejMPstczzZIL8Xy
	z1BxptxMQbqXWMTNZLpsuBycmksfj4ibmiF0Pz0m9BaFXK6LTAZpYW/d3HZGZlRcz4i7bRk5f87c1
	p/QXdNNYQeLXSQwRWudxiGa6uC/imHrFRXkroER4ysimsULtukcA9P9YDwd/Qt3t5X1j3FhR/Jjgs
	Rjoc/5teJGs8rCf625uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHfj-001wTw-19;
	Tue, 08 Aug 2023 08:02:31 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTHff-001wTB-2B
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 08:02:29 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-56ca4d7079aso3668666eaf.0
        for <linux-riscv@lists.infradead.org>; Tue, 08 Aug 2023 01:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691481746; x=1692086546;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=694ts041qMq4P0o30b2m71kcJCYvyz59KOSQWxuaGro=;
        b=ex3/1JlulWLcFxT+BqbsnysdrWu3LdZNbHzl8qDz3U4o8c6HXAPy2/uVAwVD0LzaxD
         VekWsL72t5rir2Eh67NaPFjPACdYbtxPV+9Pq2HQvWF8u9LpUrdGV81fAhusSFi7S2Vk
         CnDOj45W/Heyq6xb62s1rN0MKBFTNL51QSReFBBYiCWk8G80q6Xc2DbG2PoRflJ+xtI9
         f/s8Mz2ib/14NqMvZ6A5G/XCLbmr8BUYWY6asD900gK+zynKsIkpFu/5htAbWBJzF9MN
         xeqzEqr8lDs+d4diZE8LFvRe2R47FJAD+Ng/yXwIFpFNLNxuPeC9AlJSAsCIn7QSTzLs
         I8jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691481746; x=1692086546;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=694ts041qMq4P0o30b2m71kcJCYvyz59KOSQWxuaGro=;
        b=lJp3XZsYHeOtBYe3SduVu58Cnsu7mrTayJTUAewMG14XiaDXcPoxEbeLIuKrYMNvXU
         pYcNr5R8FOy0zsz1qYdNMfFOncyfleVx1EzRNuMqtgzbag9YuygwTLk6Wx/lGvQxuTsS
         U8aTYiOoPMHbbcbMfwpDs3Lsnu0KepcOVDX5t+DqV0ErlACprCDB52J0zI7eo/zaHM5V
         lPoeOoh7xrPi30UMWjTTbHnavHcAJfWusg6KyAl3LtHCIzLVCt+F3tnq4pcaAUz7j+G7
         qcKQdsxj15R4C5s2yfRSmoUuNvJGApPllLqQ1JM7zKiBsKm6hnhy1g6cXQsW/P7Cap2H
         6hDQ==
X-Gm-Message-State: AOJu0YzmIIl8F6MZ3bokCnpgnf7OVVynA6xkVKVYFgDSrZPzeaF9/yAR
	Wnt8p8nFcbgc0gUSGMUAHmCasGWR3van1O3Fqsk=
X-Google-Smtp-Source: AGHT+IH7VG/tSlNfYrSJiqGN7tVMMFiwEj6CcG7Ue4DbCdRSXbidxa0qqgv0gNNet0VW0ZVsx4gbteA6n9E14PBjz3g=
X-Received: by 2002:a4a:650d:0:b0:56c:e71c:2993 with SMTP id
 y13-20020a4a650d000000b0056ce71c2993mr11518458ooc.8.1691481746597; Tue, 08
 Aug 2023 01:02:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:696:0:b0:4f0:1250:dd51 with HTTP; Tue, 8 Aug 2023
 01:02:26 -0700 (PDT)
In-Reply-To: <ZNG2tHFOABSXGCVi@gmail.com>
References: <20230731023308.3748432-1-guoren@kernel.org> <20230807183655.kbnjtvbi4jfrcrce@f>
 <ZNG2tHFOABSXGCVi@gmail.com>
From: Mateusz Guzik <mjguzik@gmail.com>
Date: Tue, 8 Aug 2023 10:02:26 +0200
Message-ID: <CAGudoHEDFX7Wk-PA5=chWr0z4PnRO_gKoU2g-3RJO0uOzqogYQ@mail.gmail.com>
Subject: Re: [PATCH V2] asm-generic: ticket-lock: Optimize arch_spin_value_unlocked
To: Guo Ren <guoren@kernel.org>
Cc: will@kernel.org, David.Laight@aculab.com, peterz@infradead.org, 
	mingo@redhat.com, longman@redhat.com, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Guo Ren <guoren@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230808_010227_737116_05689DA7 
X-CRM114-Status: GOOD (  29.89  )
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

On 8/8/23, Guo Ren <guoren@kernel.org> wrote:
> On Mon, Aug 07, 2023 at 08:36:55PM +0200, Mateusz Guzik wrote:
>> On Sun, Jul 30, 2023 at 10:33:08PM -0400, guoren@kernel.org wrote:
>> > From: Guo Ren <guoren@linux.alibaba.com>
>> >
>> > The arch_spin_value_unlocked would cause an unnecessary memory
>> > access to the contended value. Although it won't cause a significant
>> > performance gap in most architectures, the arch_spin_value_unlocked
>> > argument contains enough information. Thus, remove unnecessary
>> > atomic_read in arch_spin_value_unlocked().
>> >
>> > The caller of arch_spin_value_unlocked() could benefit from this
>> > change. Currently, the only caller is lockref.
>> >
>>
>> Have you verified you are getting an extra memory access from this in
>> lockref? What architecture is it?
> For riscv, this patch could optimize the lock_ref on the same compiling
> condition:
>  - After lifting data dependencies, the compiler optimizes the prologue
>    behavior, thus the callee-register-saved path becomes optional. This
>    is a significant improvement on the lock_ref() self.
>  - Compare the "98: & 9c:" lines before the patch and the "88:" line
>    after the patch. We saved two memory accesses not only one load.
>

Now that you mention it, I see riscv in cc. ;)

Your commit message states "arch_spin_value_unlocked would cause an
unnecessary memory access to the contended value" and that lockref
uses it. Perhaps incorrectly I took it to claim lockref is suffering
extra loads from the area it modifies with cmpxchg -- as I verified,
this is not happening as the argument to arch_spin_value_unlocked is a
copy of the target lockref struct. With this not being a problem,
potential scalability impact goes down a lot. And so happens with the
code from qspinlock on x86-64 there are no extra memory accesses to
anything anyway.

I don't speak riscv asm so can't comment on the result. I'll note
again that extra work for single-threaded use is definitely worth
shaving and may or may not affect throughput in face of other CPUs
messing with lockref.

You can easily test lockref with will-it-scale, I would suggest the
access() system call which afaics has least amount of unrelated
overhead. You can find the bench here:
https://github.com/antonblanchard/will-it-scale/pull/36/files

> ========================================================================
> Before the patch:
> void lockref_get(struct lockref *lockref)
> {
>   78:   fd010113                add     sp,sp,-48
>   7c:   02813023                sd      s0,32(sp)
>   80:   02113423                sd      ra,40(sp)
>   84:   03010413                add     s0,sp,48
>
> 0000000000000088 <.LBB296>:
>         CMPXCHG_LOOP(
>   88:   00053783                ld      a5,0(a0)
>
> 000000000000008c <.LBB265>:
> }
>
> static __always_inline int ticket_spin_is_locked(arch_spinlock_t *lock)
> {
>         u32 val = atomic_read(&lock->val);
>         return ((val >> 16) != (val & 0xffff));
>   8c:   00010637                lui     a2,0x10
>
> 0000000000000090 <.LBE265>:
>   90:   06400593                li      a1,100
>
> 0000000000000094 <.LBB274>:
>   94:   fff60613                add     a2,a2,-1 # ffff <.LLST8+0xf49a>
>
> 0000000000000098 <.L8>:
>   98:   fef42423                sw      a5,-24(s0)
>
> 000000000000009c <.LBB269>:
>   9c:   fe842703                lw      a4,-24(s0)
>
> 00000000000000a0 <.LBE269>:
>   a0:   0107569b                srlw    a3,a4,0x10
>   a4:   00c77733                and     a4,a4,a2
>   a8:   04e69063                bne     a3,a4,e8 <.L12>
>
> 00000000000000ac <.LBB282>:
>   ac:   4207d693                sra     a3,a5,0x20
>   b0:   02079713                sll     a4,a5,0x20
>   b4:   0016869b                addw    a3,a3,1
>   b8:   02069693                sll     a3,a3,0x20
>   bc:   02075713                srl     a4,a4,0x20
>   c0:   00d76733                or      a4,a4,a3
>
> 00000000000000c4 <.L0^B1>:
>   c4:   100536af                lr.d    a3,(a0)
>   c8:   00f69863                bne     a3,a5,d8 <.L1^B1>
>   cc:   1ae5382f                sc.d.rl a6,a4,(a0)
>   d0:   fe081ae3                bnez    a6,c4 <.L0^B1>
>   d4:   0330000f                fence   rw,rw
>
> 00000000000000d8 <.L1^B1>:
>   d8:   02d78a63                beq     a5,a3,10c <.L7>
>
> 00000000000000dc <.LBE292>:
>   dc:   fff5859b                addw    a1,a1,-1
>
> 00000000000000e0 <.LBB293>:
>   e0:   00068793                mv      a5,a3
>
> 00000000000000e4 <.LBE293>:
>   e4:   fa059ae3                bnez    a1,98 <.L8>
>
> 00000000000000e8 <.L12>:
>
> ========================================================================
> After the patch:
> void lockref_get(struct lockref *lockref)
> {
>         CMPXCHG_LOOP(
>   78:   00053783                ld      a5,0(a0)
>
> 000000000000007c <.LBB212>:
>
> static __always_inline int ticket_spin_value_unlocked(arch_spinlock_t
> lock)
> {
>         u32 val = lock.val.counter;
>
>         return ((val >> 16) == (val & 0xffff));
>   7c:   00010637                lui     a2,0x10
>
> 0000000000000080 <.LBE212>:
>   80:   06400593                li      a1,100
>
> 0000000000000084 <.LBB216>:
>   84:   fff60613                add     a2,a2,-1 # ffff <.LLST8+0xf4aa>
>
> 0000000000000088 <.L8>:
>   88:   0007871b                sext.w  a4,a5
>
> 000000000000008c <.LBB217>:
>   8c:   0107d69b                srlw    a3,a5,0x10
>   90:   00c77733                and     a4,a4,a2
>   94:   04e69063                bne     a3,a4,d4 <.L12>
>
> 0000000000000098 <.LBB218>:
>   98:   4207d693                sra     a3,a5,0x20
>   9c:   02079713                sll     a4,a5,0x20
>   a0:   0016869b                addw    a3,a3,1
>   a4:   02069693                sll     a3,a3,0x20
>   a8:   02075713                srl     a4,a4,0x20
>   ac:   00d76733                or      a4,a4,a3
>
> 00000000000000b0 <.L0^B1>:
>   b0:   100536af                lr.d    a3,(a0)
>   b4:   00f69863                bne     a3,a5,c4 <.L1^B1>
>   b8:   1ae5382f                sc.d.rl a6,a4,(a0)
>   bc:   fe081ae3                bnez    a6,b0 <.L0^B1>
>   c0:   0330000f                fence   rw,rw
>
> 00000000000000c4 <.L1^B1>:
>   c4:   04d78a63                beq     a5,a3,118 <.L18>
>
> 00000000000000c8 <.LBE228>:
>   c8:   fff5859b                addw    a1,a1,-1
>
> 00000000000000cc <.LBB229>:
>   cc:   00068793                mv      a5,a3
>
> 00000000000000d0 <.LBE229>:
>   d0:   fa059ce3                bnez    a1,88 <.L8>
>
> 00000000000000d4 <.L12>:
> {
>   d4:   fe010113                add     sp,sp,-32
>   d8:   00113c23                sd      ra,24(sp)
>   dc:   00813823                sd      s0,16(sp)
>   e0:   02010413                add     s0,sp,32
> ========================================================================
>
>>
>> I have no opinion about the patch itself, I will note though that the
>> argument to the routine is *not* the actual memory-shared lockref,
>> instead it's something from the local copy obtained with READ_ONCE
>> from the real thing. So I would be surprised if the stock routine was
>> generating accesses to that sucker.
>>
>> Nonetheless, if the patched routine adds nasty asm, that would be nice
>> to sort out.
>>
>> FWIW on x86-64 qspinlock is used (i.e. not the stuff you are patching)
>> and I verified there are only 2 memory accesses -- the initial READ_ONCE
>> and later cmpxchg. I don't know which archs *don't* use qspinlock.
>>
>> It also turns out generated asm is quite atrocious and cleaning it up
>> may yield a small win under more traffic. Maybe I'll see about it later
>> this week.
>>
>> For example, disassembling lockref_put_return:
>> <+0>:     mov    (%rdi),%rax            <-- initial load, expected
>> <+3>:     mov    $0x64,%r8d
>> <+9>:     mov    %rax,%rdx
>> <+12>:    test   %eax,%eax              <-- retries loop back here
>> 					<-- this is also the unlocked
>> 					    check
>> <+14>:    jne    0xffffffff8157aba3 <lockref_put_return+67>
>> <+16>:    mov    %rdx,%rsi
>> <+19>:    mov    %edx,%edx
>> <+21>:    sar    $0x20,%rsi
>> <+25>:    lea    -0x1(%rsi),%ecx        <-- new.count--;
>> <+28>:    shl    $0x20,%rcx
>> <+32>:    or     %rcx,%rdx
>> <+35>:    test   %esi,%esi
>> <+37>:    jle    0xffffffff8157aba3 <lockref_put_return+67>
>> <+39>:    lock cmpxchg %rdx,(%rdi)      <-- the attempt to change
>> <+44>:    jne    0xffffffff8157ab9a <lockref_put_return+58>
>> <+46>:    shr    $0x20,%rdx
>> <+50>:    mov    %rdx,%rax
>> <+53>:    jmp    0xffffffff81af8540 <__x86_return_thunk>
>> <+58>:    mov    %rax,%rdx
>> <+61>:    sub    $0x1,%r8d              <-- retry count check
>> <+65>:    jne    0xffffffff8157ab6c <lockref_put_return+12> <-- go back
>> <+67>:    mov    $0xffffffff,%eax
>> <+72>:    jmp    0xffffffff81af8540 <__x86_return_thunk>
>>
>


-- 
Mateusz Guzik <mjguzik gmail.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
