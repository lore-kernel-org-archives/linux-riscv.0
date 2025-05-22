Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170DBC54E90
	for <linux-riscv@archiver.kernel.org>; Thu, 22 May 2025 15:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrS6Toos+w6oU3ET3KQ60WUOuphjReSAEj/VplYQQZI=; b=qFAxzgwjHi+EWy84qtLWz5N1NR
	2qlFAjOubfxWDSz/bWAHA4n3rn+Xiv0F0CdZsqhPnWa0Jo1cfMg6RPNknTj5VrrXpszilxKR/TU63
	ctMQz6QMc34wFmgOGoP4VvugdAUJ//BlDZkS/GXLLsr90O7EvFHzJqtzdS+4o9KQ2ksbO7/yNfv4c
	dfIyeOcItVSOuZHJ8IxSWCpxbkVHowNfeU3rqUIWvPiouzkQ7PV5186PmwBwMCAKIACcD1dGCNBLB
	2UuLqhGzRfT66QY40aXDSoc9S1Ms/dRmcOuiQQXBRSCaEiLI+N3AwTEufli+QiChupnh4KzEOhL8a
	V+EGECMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Vt-00000001NcH-13yk;
	Thu, 22 May 2025 15:07:17 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uI7Eh-00000001JkI-2EII
	for linux-riscv@lists.infradead.org;
	Thu, 22 May 2025 14:49:33 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-231fc83a33aso50991615ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 May 2025 07:49:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747925370; x=1748530170; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rQ4kj7Mccvnc2GRr0Awe5V2tu56FIeT0AJGWt5wmNLo=;
        b=Ng4MpBdEHKsJilxuIZUKxVqayKd2wDGiMw+Ctl8sP6oeIpuAlNybaAVjAGby8XF2A/
         RxUBBY35to0dzjkl0KkiNfIyPulCaAzlteZ3t/3uXafhcxmZqn3P2vw1RGboiZ3pEmeX
         g0hcsGrqOWfKI/fQ8dIQI9S6/17GWsgohem0lpi9XUcQhNotFftJ5sQ0EaCXiaC8orBm
         rRlVNXy0RUcn2EUbPENkFdtGBuT4lMne8TaR7kHlJfHWlTQZrvHw6C3XvpZY6Y9278m/
         QbEWWgffuAzyFcSC+m/fajwrxz4E1go5Pty4Wrb1Y4EcFIRYGe+tOUcMYAzozaineDKY
         XqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747925370; x=1748530170;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rQ4kj7Mccvnc2GRr0Awe5V2tu56FIeT0AJGWt5wmNLo=;
        b=Q+VaZ5xQmY0bn2Z5U4qlHJN89O0+QYux87oWb+kTszOvCC2PswuH6UAdiJDOfzV/Xy
         v68I5523++YUi6M1/YOfxEQUl5B5U/xus1EAk00TihNxuPPj7ZFAMP/c4FWbDyINo0HM
         fR0Q2z0BiQyzIYFhH03sN2rhWu/vn058TBPNhEZmV0E6qiWIOjWNM0cE+Rf9UsJfXmE1
         0j0rt8w5vWNDzypGOQv36B+asf3hAFBFPmdQ3o3EsnDx7858Gl04flnlyzz19eHaqlFS
         4yAdzkk0PkHP+OLc4/Vjvu99ZG00hFZoZp5n4nbl9BWexNT6hQAk58tCqFXdEwLoJLSZ
         AA2A==
X-Forwarded-Encrypted: i=1; AJvYcCXaAfPUK7n/yo6pgSgzTVXtY1HuWb6PlENUi2AlVQmDxIN/WgCGC1LT1PxuB0yjeRZpVB0TgcpMXzL3vw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyiKPIvuzCX56VgHIjnKBEGlhMd88EEwoEbnLsDpOk23/RdLZbM
	TF2JEeec4/iOXk3Sxxr1ODfxi9+jCjr/gtOGQSJc7Y5vrmKsnP7gerpt4auNEQYPkBk7gmCjrRB
	/iR9G
X-Gm-Gg: ASbGncu0SVBlcCaR8iehqe5xBFpXVAKaboaWaFVohMhsbAuIuBi88a0WKeCQvbrvNCx
	R0P9nRbo3Dd9TOVihwzsGGnm1Qit/zGzz25Uv47noWnNuIUL0LQ6YSQ4KAmTGKIExTry/frZ0/4
	DUaDB/JVlfvloT7bjfRlqVQXJPAXhUQFQYZFav1FusZYfR6/n9YTP3Iw7tYQGHb71Hxl+uf4Ien
	0YI4Fh0Fj+gBHv7ch9o1XejwDiVvPHTNcIJSjrkohMQ+i97bNhhhIDV66FOSUyNONwr72uuaNle
	UtlIaB7664nXCMjDD++Qbw2x/8dAPF/jhKH7DBXN3ONYaEXTFsT7eV4G6iFPRLWqP81gRbVc
X-Google-Smtp-Source: AGHT+IGT45bErk4jZKCTChYcJLaT1SiXW3SHwefo100Glc9Lbj7ePhm2QOKaGa81c6ZFUQWjnmWGPQ==
X-Received: by 2002:a17:902:ce87:b0:220:e924:99dd with SMTP id d9443c01a7336-231de3ace9emr359176295ad.34.1747925369804;
        Thu, 22 May 2025 07:49:29 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ebb084sm109560685ad.201.2025.05.22.07.49.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 07:49:29 -0700 (PDT)
Date: Thu, 22 May 2025 07:49:27 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: Cyril Bur <cyrilbur@tenstorrent.com>, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	charlie@rivosinc.com, jrtc27@jrtc27.com, alex@ghiti.fr,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
Message-ID: <aC85d8Hnstck-_gx@debug.ba.rivosinc.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
 <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com>
 <b39891f0-1e1a-4559-b35b-5262fe5af93c@codethink.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b39891f0-1e1a-4559-b35b-5262fe5af93c@codethink.co.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250522_074931_576130_D8C1A7AF 
X-CRM114-Status: GOOD (  26.99  )
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
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, May 22, 2025 at 07:23:32AM +0100, Ben Dooks wrote:
>On 20/05/2025 17:49, Deepak Gupta wrote:
>>I did give this patch my RB and had planned to come back to it to see
>>if it impacts cfi related patches. Thanks to alex for brinigng to my
>>attention again. As it stands today, it doesn't impact cfi related
>>changes but I've some concerns.
>>
>>Overall I do agree we should reduce number of SSTATUS accesses.
>>
>>Couple of questions on introducing new `sstatus` field (inline)
>>
>>On Tue, Apr 22, 2025 at 04:01:35PM -0700, Deepak Gupta wrote:
>>>On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
>>>>From: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>
>>>>When threads/tasks are switched we need to ensure the old execution's
>>>>SR_SUM state is saved and the new thread has the old SR_SUM state
>>>>restored.
>>>>
>>>>The issue was seen under heavy load especially with the syz-stress tool
>>>>running, with crashes as follows in schedule_tail:
>>>>
>>>>Unable to handle kernel access to user memory without uaccess routines
>>>>at virtual address 000000002749f0d0
>>>>Oops [#1]
>>>>Modules linked in:
>>>>CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>>>5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>>>Hardware name: riscv-virtio,qemu (DT)
>>>>epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>>>ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>>>epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>>>gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>>>t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>>>s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>>>a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>>>a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>>>s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>>>s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>>>s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>>>s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>>>t5 : ffffffc4043cafba t6 : 0000000000040000
>>>>status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>>>000000000000000f
>>>>Call Trace:
>>>>[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>>>[<ffffffe000005570>] ret_from_exception+0x0/0x14
>>>>Dumping ftrace buffer:
>>>>=A0(ftrace buffer empty)
>>>>---[ end trace b5f8f9231dc87dda ]---
>>>>
>>>>The issue comes from the put_user() in schedule_tail
>>>>(kernel/sched/core.c) doing the following:
>>>>
>>>>asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>>>{
>>>>...
>>>>=A0=A0=A0=A0=A0 if (current->set_child_tid)
>>>>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 put_user(task_pid_vnr(current),=
 current->set_child_tid);
>>>>...
>>>>}
>>>>
>>>>the put_user() macro causes the code sequence to come out as follows:
>>>>
>>>>1:=A0=A0=A0 __enable_user_access()
>>>>2:=A0=A0=A0 reg =3D task_pid_vnr(current);
>>>>3:=A0=A0=A0 *current->set_child_tid =3D reg;
>>>>4:=A0=A0=A0 __disable_user_access()
>>>>
>>>>The problem is that we may have a sleeping function as argument which
>>>>could clear SR_SUM causing the panic above. This was fixed by
>>>>evaluating the argument of the put_user() macro outside the user-enabled
>>>>section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>>>enabling user access")"
>>>>
>>>>In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>>>to avoid the same issue we had with put_user() and sleeping functions we
>>>>must ensure code flow can go through switch_to() from within a region of
>>>>code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>>>patch addresses the problem allowing future work to enable full use of
>>>>unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>>>on every access. Make switch_to() save and restore SR_SUM.
>>>>
>>>>Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>>>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>>>Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>>>---
>>>>arch/riscv/include/asm/processor.h | 1 +
>>>>arch/riscv/kernel/asm-offsets.c=A0=A0=A0 | 5 +++++
>>>>arch/riscv/kernel/entry.S=A0=A0=A0=A0=A0=A0=A0=A0=A0 | 8 ++++++++
>>>>3 files changed, 14 insertions(+)
>>>>
>>>>diff --git a/arch/riscv/include/asm/processor.h =

>>>>b/arch/riscv/include/ asm/processor.h
>>>>index 5f56eb9d114a..58fd11c89fe9 100644
>>>>--- a/arch/riscv/include/asm/processor.h
>>>>+++ b/arch/riscv/include/asm/processor.h
>>>>@@ -103,6 +103,7 @@ struct thread_struct {
>>>>=A0=A0=A0=A0struct __riscv_d_ext_state fstate;
>>>>=A0=A0=A0=A0unsigned long bad_cause;
>>>>=A0=A0=A0=A0unsigned long envcfg;
>>>>+=A0=A0=A0 unsigned long status;
>>
>>Do we really need a new member field in `thread_struct`. We already have
>>`sstatus` in `pt_regs` which reflects overall execution environment =

>>situation
>>for current thread. This gets saved and restored on trap entry and exit.
>>
>>If we put `status` in `thread_struct` it creates ambiguity in terms =

>>of which
>>`status` to save to and pick from from future maintainibility =

>>purposes as the
>>fields get introduced to this CSR.
>>
>>Why can't we access current trap frame's `sstatus` image in =

>>`__switch_to` to
>>save and restore?
>>
>>Let me know if I am missing something obvious here. If there is a =

>>complication,
>>I am missing here and we do end up using this member field, I would =

>>rename it
>>to something like `status_kernel` to reflect that. So that future =

>>changes are
>>cognizant of the fact that we have split `status`. One for kernel =

>>execution env
>>per thread and one for controlling user execution env per thread.
>
>This is so long ago now I cannot remember if there was any sstatus in
>the pt_regs field, =


FS/VS bits encode status of floating point and vector on per-thread basis.
So `status` has been part of `pt_regs` for quite a while. =


> and if kernel threads have the same context as their
>userland parts.

I didn't mean kernel thread. What I meant was kernel execution environment
per-thread. A userland thread does spend sometime in kernel and kernel does
things on its behalf. One of those thing is touching user memory and that
requires mucking with this CSR. So what I meant was are we splitting `statu=
s`
on per-thread basis for their time spent in user and kernel.

Getting back to original question--
As I said, each thread spends sometime in user or in kernel. `status` in
`pt_regs` is saved on trap entry and restored on trap exit. In a sense,
`status` field in `pt_regs` is reflecting execution status of the thread on=
 per
trap basis. Introducing `status` in `thread_struct` creates a confusion (if=
 not
for today, certainly for future) of which `status` to pick from when we are
doing save/restore.

So my first question was why not to use `status` in `pt_regs`. It is granul=
ar
as it can get (it is available per thread context per trap basis). =



I did ask Alex as well. I'll ping him again.

>
>Does anyone else have any comment on this?
>
>>
>>>>=A0=A0=A0=A0u32 riscv_v_flags;
>>>>=A0=A0=A0=A0u32 vstate_ctrl;
>>>>=A0=A0=A0=A0struct __riscv_v_ext_state vstate;
>>>>diff --git a/arch/riscv/kernel/asm-offsets.c =

>>>>b/arch/riscv/kernel/asm- offsets.c
>>>>index 16490755304e..969c65b1fe41 100644
>>>>--- a/arch/riscv/kernel/asm-offsets.c
>>>>+++ b/arch/riscv/kernel/asm-offsets.c
>>>>@@ -34,6 +34,7 @@ void asm_offsets(void)
>>>>=A0=A0=A0=A0OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>>>=A0=A0=A0=A0OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>>>=A0=A0=A0=A0OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
>>
>>_______________________________________________
>>linux-riscv mailing list
>>linux-riscv@lists.infradead.org
>>http://lists.infradead.org/mailman/listinfo/linux-riscv
>>
>
>
>-- =

>Ben Dooks				http://www.codethink.co.uk/
>Senior Engineer				Codethink - Providing Genius
>
>https://www.codethink.co.uk/privacy.html

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
