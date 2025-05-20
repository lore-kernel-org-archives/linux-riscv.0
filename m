Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C47CC3ABDD
	for <linux-riscv@archiver.kernel.org>; Tue, 20 May 2025 16:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tByZS5BkFmGvW0nFGlTwSxMDJ0Gjvj64DGviY9PIIkg=; b=tewhi9quWBq83KNtXkEn8I0pP4
	o67xaYe0oz9czP15I20419zn4PVTf5yjvBqqWOB6gCVE2bSGXINsa4t05SPtQweSXOfRJtzSXvRpM
	VC20phP0fbdK7hahtOaoJBKLWaJjQ2SC35ryIV+X+LZIRMQZM+ArGdzUbYGXHWBRVwWWdwZMK6Lu+
	lb+5n+sYMb7qCsB4g9Nqt0QLqhDz2VVVkgj3fk2EGHDzvoBwMZuB1XTS37hKKCBmCNLSwhw5u9P6X
	AvFgDUzTBnY7o8BWVLykid0p44B16WiNmQpuJ+1/a7mFIaSwDwilaYevPwXMxKFlUY5wUJrGoCeWS
	wHWklp5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQAG-0000000Db9u-4A2f;
	Tue, 20 May 2025 16:50:04 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHQAE-0000000Db99-1zOA
	for linux-riscv@lists.infradead.org;
	Tue, 20 May 2025 16:50:04 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-231e011edfaso47987745ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 May 2025 09:50:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747759801; x=1748364601; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1m7Go/pX/F7PMp+Ns8T8HB1Kq+qBJFWZaihZShIHSyw=;
        b=vbSgLmr3pMY9UYqKwkVRj1F72s/StGSiE3kowsceGoc6onsf0YRUhcA6bKfo0biVuf
         ky2iQZlwGBRuiDdH84SnjdrUikMGn6lqb7x0OD1+cxza/NSzUcW7EUHtE6KwnHPgqqhF
         Lvs3VC4Ie9kzKb80rtPuPKvQKqnDADEq4RInyouX45gky0Sk6vWBz/8pIztb3UDHaGfu
         qF87g5a7TOPb+Kejf1bIMZL9tNoQx+f8lcNZCkyyRZOoTAC89aqLybF8OCqVobGWmHXp
         ilLAEugDf/3IR38VL+fPQo++S5tn8nIWYCNOuoeSokiMHpNv0mdjeg9AP+3OaxrHmJbQ
         /amA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747759801; x=1748364601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m7Go/pX/F7PMp+Ns8T8HB1Kq+qBJFWZaihZShIHSyw=;
        b=tQqcFjVmoK2syJHDelaZ7ll3OXTf9TdnRwplLV32jUUYVzxzz0FsIRsqU9wcT+L+1T
         IzBDiWFBwrzYD+fEcVpEg9XvyfFayR9iuVDsJBPvppGWpk9ctKKAH2eNHZSktzmBd388
         Ku/aCIuhRF1HhUo11w9z8uqQI+om9+ccEt+3uRRvlqTJmHHayzZ3vOLPdzVOFkfJoEBA
         yQrpGKp+ViguIHlfU6bZM6MhHJjj9qbSX3INulgCBGvksFdSRWTrcoT3q/b4ijLwcFyk
         dQ0uBaIsJOO/T5eDm0C16/9Ep5pQ5/0Y9Ru4j5/zznk543FhLFZR5tdxU6N900Q5PPfw
         LC2g==
X-Forwarded-Encrypted: i=1; AJvYcCUB1TP/ehSPQjrk4VTjmSk9mdyvD+uPz8vE+gWTJBa96kOc+MveQv+2uQZSC592YI1haxn/cf9ZDMkvVw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyHPr/rY1FgDpVijI+DxOwhZOCz9JsT3IpVqPrgWVpHS9uhLTK3
	dgf4mBg8kZ2TdqVbatucqsenhs/S6UDOl4M8sYBq/fXQzeYa7/iYjPNLW3cVcmO3ujk=
X-Gm-Gg: ASbGncuaUdNnFRKs9EiwQ9sVj1jGfBqLLo9Ssva8T+N3ere/B2lNxz0cuvPxNXzZNKz
	Yg7d/glHJYmYonw0mVBzIfygrd3B5QxKLyjwv88mKBJVijkrtz3mM8p9OC8aTsZKpkSsdGgVj4v
	MP7VvkI1MicvNadTIQhq+KPFaAlHqfyAIkT0PyW2sIe1kn3yr+LUk+Wm7E2QPzwakhJc90Xa5MF
	khQCuV90m9kjNLuETdCfAyAvOrFtWZ68aL01WJYrrfNNWXJ9+GJlJs7zM58hzBxF+fDIcVcr2pK
	54lTUyeQNWw/Z3pMzEXbrs5W5JBGeHqOm9JYdZTsaqFPQaIFmDGpaMFXszALXg==
X-Google-Smtp-Source: AGHT+IFnEAObM1BSjDDsKlqDToLOxOJWjUHHkhJdZPf/vLzU9gv46i8iYZlBBNwApuBYvvnazZFwbw==
X-Received: by 2002:a17:903:b8f:b0:224:c76:5e57 with SMTP id d9443c01a7336-231d459bee3mr236232895ad.39.1747759801274;
        Tue, 20 May 2025 09:50:01 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4ac9551sm79167335ad.40.2025.05.20.09.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 09:50:00 -0700 (PDT)
Date: Tue, 20 May 2025 09:49:58 -0700
From: Deepak Gupta <debug@rivosinc.com>
To: Cyril Bur <cyrilbur@tenstorrent.com>
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, paul.walmsley@sifive.com,
	charlie@rivosinc.com, jrtc27@jrtc27.com, ben.dooks@codethink.co.uk,
	alex@ghiti.fr, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, jszhang@kernel.org,
	syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
Subject: Re: [PATCH v6 1/5] riscv: save the SR_SUM status over switches
Message-ID: <aCyythZJ2u0SbXVb@debug.ba.rivosinc.com>
References: <20250410070526.3160847-1-cyrilbur@tenstorrent.com>
 <20250410070526.3160847-2-cyrilbur@tenstorrent.com>
 <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aAgfz69K7wSkKsyJ@debug.ba.rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_095002_772866_34A2EC36 
X-CRM114-Status: GOOD (  21.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

I did give this patch my RB and had planned to come back to it to see
if it impacts cfi related patches. Thanks to alex for brinigng to my
attention again. As it stands today, it doesn't impact cfi related
changes but I've some concerns.

Overall I do agree we should reduce number of SSTATUS accesses.

Couple of questions on introducing new `sstatus` field (inline)

On Tue, Apr 22, 2025 at 04:01:35PM -0700, Deepak Gupta wrote:
>On Thu, Apr 10, 2025 at 07:05:22AM +0000, Cyril Bur wrote:
>>From: Ben Dooks <ben.dooks@codethink.co.uk>
>>
>>When threads/tasks are switched we need to ensure the old execution's
>>SR_SUM state is saved and the new thread has the old SR_SUM state
>>restored.
>>
>>The issue was seen under heavy load especially with the syz-stress tool
>>running, with crashes as follows in schedule_tail:
>>
>>Unable to handle kernel access to user memory without uaccess routines
>>at virtual address 000000002749f0d0
>>Oops [#1]
>>Modules linked in:
>>CPU: 1 PID: 4875 Comm: syz-executor.0 Not tainted
>>5.12.0-rc2-syzkaller-00467-g0d7588ab9ef9 #0
>>Hardware name: riscv-virtio,qemu (DT)
>>epc : schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>ra : task_pid_vnr include/linux/sched.h:1421 [inline]
>>ra : schedule_tail+0x70/0xb2 kernel/sched/core.c:4264
>>epc : ffffffe00008c8b0 ra : ffffffe00008c8ae sp : ffffffe025d17ec0
>>gp : ffffffe005d25378 tp : ffffffe00f0d0000 t0 : 0000000000000000
>>t1 : 0000000000000001 t2 : 00000000000f4240 s0 : ffffffe025d17ee0
>>s1 : 000000002749f0d0 a0 : 000000000000002a a1 : 0000000000000003
>>a2 : 1ffffffc0cfac500 a3 : ffffffe0000c80cc a4 : 5ae9db91c19bbe00
>>a5 : 0000000000000000 a6 : 0000000000f00000 a7 : ffffffe000082eba
>>s2 : 0000000000040000 s3 : ffffffe00eef96c0 s4 : ffffffe022c77fe0
>>s5 : 0000000000004000 s6 : ffffffe067d74e00 s7 : ffffffe067d74850
>>s8 : ffffffe067d73e18 s9 : ffffffe067d74e00 s10: ffffffe00eef96e8
>>s11: 000000ae6cdf8368 t3 : 5ae9db91c19bbe00 t4 : ffffffc4043cafb2
>>t5 : ffffffc4043cafba t6 : 0000000000040000
>>status: 0000000000000120 badaddr: 000000002749f0d0 cause:
>>000000000000000f
>>Call Trace:
>>[<ffffffe00008c8b0>] schedule_tail+0x72/0xb2 kernel/sched/core.c:4264
>>[<ffffffe000005570>] ret_from_exception+0x0/0x14
>>Dumping ftrace buffer:
>>  (ftrace buffer empty)
>>---[ end trace b5f8f9231dc87dda ]---
>>
>>The issue comes from the put_user() in schedule_tail
>>(kernel/sched/core.c) doing the following:
>>
>>asmlinkage __visible void schedule_tail(struct task_struct *prev)
>>{
>>...
>>       if (current->set_child_tid)
>>               put_user(task_pid_vnr(current), current->set_child_tid);
>>...
>>}
>>
>>the put_user() macro causes the code sequence to come out as follows:
>>
>>1:	__enable_user_access()
>>2:	reg = task_pid_vnr(current);
>>3:	*current->set_child_tid = reg;
>>4:	__disable_user_access()
>>
>>The problem is that we may have a sleeping function as argument which
>>could clear SR_SUM causing the panic above. This was fixed by
>>evaluating the argument of the put_user() macro outside the user-enabled
>>section in commit 285a76bb2cf5 ("riscv: evaluate put_user() arg before
>>enabling user access")"
>>
>>In order for riscv to take advantage of unsafe_get/put_XXX() macros and
>>to avoid the same issue we had with put_user() and sleeping functions we
>>must ensure code flow can go through switch_to() from within a region of
>>code with SR_SUM enabled and come back with SR_SUM still enabled. This
>>patch addresses the problem allowing future work to enable full use of
>>unsafe_get/put_XXX() macros without needing to take a CSR bit flip cost
>>on every access. Make switch_to() save and restore SR_SUM.
>>
>>Reported-by: syzbot+e74b94fe601ab9552d69@syzkaller.appspotmail.com
>>Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
>>Signed-off-by: Cyril Bur <cyrilbur@tenstorrent.com>
>>---
>>arch/riscv/include/asm/processor.h | 1 +
>>arch/riscv/kernel/asm-offsets.c    | 5 +++++
>>arch/riscv/kernel/entry.S          | 8 ++++++++
>>3 files changed, 14 insertions(+)
>>
>>diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
>>index 5f56eb9d114a..58fd11c89fe9 100644
>>--- a/arch/riscv/include/asm/processor.h
>>+++ b/arch/riscv/include/asm/processor.h
>>@@ -103,6 +103,7 @@ struct thread_struct {
>>	struct __riscv_d_ext_state fstate;
>>	unsigned long bad_cause;
>>	unsigned long envcfg;
>>+	unsigned long status;

Do we really need a new member field in `thread_struct`. We already have
`sstatus` in `pt_regs` which reflects overall execution environment situation
for current thread. This gets saved and restored on trap entry and exit.

If we put `status` in `thread_struct` it creates ambiguity in terms of which
`status` to save to and pick from from future maintainibility purposes as the
fields get introduced to this CSR.

Why can't we access current trap frame's `sstatus` image in `__switch_to` to
save and restore?

Let me know if I am missing something obvious here. If there is a complication,
I am missing here and we do end up using this member field, I would rename it
to something like `status_kernel` to reflect that. So that future changes are
cognizant of the fact that we have split `status`. One for kernel execution env
per thread and one for controlling user execution env per thread.


>>	u32 riscv_v_flags;
>>	u32 vstate_ctrl;
>>	struct __riscv_v_ext_state vstate;
>>diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
>>index 16490755304e..969c65b1fe41 100644
>>--- a/arch/riscv/kernel/asm-offsets.c
>>+++ b/arch/riscv/kernel/asm-offsets.c
>>@@ -34,6 +34,7 @@ void asm_offsets(void)
>>	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>>	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>>	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
