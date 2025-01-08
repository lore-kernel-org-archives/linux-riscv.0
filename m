Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67BC3E77199
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jan 2025 18:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=hHcaKGySmm7mnBwUQ80vhf2eHse0kGl6e3yhf5S+GYU=; b=F+gKiULqB9RGx55MsyfTBUJHEV
	MbR1Q95RDntIk5OsygdyPXNyTQOtUq9hW5spzqUQByGZ4ipu4WbWRLD19kOQtxCTRNE32fhSmlc+J
	OuqHNcOeq/sIyI8sy9ACE1WoowFkMPQ/oNwpUtcE3Wp7qxzmNZ7JJNskLu9ls5WtbJpJTj0co+kRZ
	E7lIyB0Ai2HVu/BrbY+NBzmcrG/yesc4Uii+iE/N7GSApb2gWN65S2KJGjHQvg/fIIxCcNqT2c8Hi
	34NpyTAfHoavElKR/zknwwqp+aRN6NExvBvaEX0mgUZwv5w4op3ruH4MHJZVu52vVAcCduQax963v
	o1r7jSCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVasM-00000009Xzx-3v2M;
	Wed, 08 Jan 2025 18:33:54 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVasJ-00000009Xz8-3v4v
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jan 2025 18:33:53 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-216401de828so433235ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jan 2025 10:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1736361230; x=1736966030; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C6FJheiVMvYWbCZKeg+7lI1bloWoKQoRBO5Nx0WyBg0=;
        b=UsHiHSIiT0FGNseos7mw/VaDmNO+YfsyKwCUdQPAULSzFIzgQfcp3mtdtfxgUqDHFp
         8xPWEab9VF1d/8tNdE4S1lXBbolS88mLdNrE0RNQFN023XxV57Ponpd0nX2P0X6yIuUp
         0qpJNl3D9K5E4GPRjiMeD9a5eU1FwxCzV0ICWEYdkMvWlB4BDFyVCLv67EOkd8lvaS+a
         n7URtlRZMxippbtH+wyCfnQZLUeV5s/3HwQvzp3gVczfunky4QkhAcvnLmK5cgk7nku+
         +lWY2ljHg+X62yA4K+k07wAjWpiTtlSTwfimuhRSRTnkyGXjNQSD6lHVBVXoNnfhl51s
         epTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736361230; x=1736966030;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C6FJheiVMvYWbCZKeg+7lI1bloWoKQoRBO5Nx0WyBg0=;
        b=fH8BZLzRAUGTlITQ0QvNeEd8IlUxYN/xLHMFK28p2BbFmKq32o3T61mllZDt5uckon
         rbpqj+lFbNYv3+N2+04xaRrVJDeVzL/YJucwkZHGZ2cf60eLW/wAZePDL5MEC4AAIs5C
         tT/Z0R4HvBa4miqol/IwB413hxBfQ+6CF+z0JqljxMs/w8XfrjoRpIUTtntHPsVOAoze
         iK3cpeLeYiBTFzfw3z1TJPBVShQGvedur9VoFGc8SRs9TH100OZAx0l4PCjkQc7Zc0IQ
         SyDfHHsMCKrPdjhkV9ayNKWSa8cQqIR/Z6HbHx+PfaqPbmBTdpVVOKRkDOahxGHk5lNU
         lF5g==
X-Forwarded-Encrypted: i=1; AJvYcCVOISwL2R+xWNShBJLZmO2lvoBjcKaWmK9uAcBkkt9b1vu3oPYLI+tT4VsqDc/cgLWQqRov7equU08PKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxetuC9KIEWU5XeuVLhxke8zKuTxGjoy+dMvyMxayqe9VXT2Zas
	sLQnKUqu1IvENwkOn0pGuVeEB/b0x26pIF/yCLOLRWJ81aikJXKgioy4EMxYELFZWPD3TDRd5no
	v
X-Gm-Gg: ASbGncs7nIkI0mVKy1l508hBeZrwgkECbcDc/2/qTiKpMUEOXtD6smH3di3UBr240fX
	Bb9+7WLoHRQd4T9v+8oTGEh5nDrFob76j+HF3rVSGIjdSaClLFLp2rJhYPcidIOh5G154kLt+38
	nNPZLoL0otN8f9pEDaD2XAUh8/vOLXxdSzoSFoVicDDhB560IO0ozajBEOO7t4M8Y5f88z2OQ34
	oTVDUPfcK4V8qX3GiUa5f86AN5b2nDJl1PYWnYT1ZhfaEGvj1HdmQ==
X-Google-Smtp-Source: AGHT+IFKQu0S/CxhJlRsO9R5dWJhdMzsAi48BU6f7VdxPORJFw2Mpt41vvc11YkSWn0R04UjSSxdQA==
X-Received: by 2002:a05:6a20:e687:b0:1e5:b082:e38f with SMTP id adf61e73a8af0-1e88d0edb23mr6353414637.45.1736361230145;
        Wed, 08 Jan 2025 10:33:50 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad815810sm36665771b3a.29.2025.01.08.10.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 10:33:49 -0800 (PST)
Date: Wed, 08 Jan 2025 10:33:49 -0800 (PST)
X-Google-Original-Date: Wed, 08 Jan 2025 10:33:47 PST (-0800)
Subject: Re: [PATCH] riscv: Fix sleeping in invalid context in die()
In-Reply-To: <20241120085045.LJ5b7oh9@linutronix.de>
CC: namcao@linutronix.de, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, Bjorn Topel <bjorn@rivosinc.com>, schwab@suse.de, songshuaishuai@tinylab.org,
  coelacanthushex@gmail.com, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  stable@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: bigeasy@linutronix.de
Message-ID: <mhng-ff90cb6e-3386-426a-a858-038b6ef33b1b@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_103352_177187_DAA9642C 
X-CRM114-Status: GOOD (  15.94  )
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

On Wed, 20 Nov 2024 00:50:45 PST (-0800), bigeasy@linutronix.de wrote:
> On 2024-11-18 10:13:33 [+0100], Nam Cao wrote:
>> die() can be called in exception handler, and therefore cannot sleep.
>> However, die() takes spinlock_t which can sleep with PREEMPT_RT enabled.
>> That causes the following warning:
>>
>> BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
>> in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 285, name: mutex
>> preempt_count: 110001, expected: 0
>> RCU nest depth: 0, expected: 0
>> CPU: 0 UID: 0 PID: 285 Comm: mutex Not tainted 6.12.0-rc7-00022-ge19049cf7d56-dirty #234
>> Hardware name: riscv-virtio,qemu (DT)
>> Call Trace:
>>     dump_backtrace+0x1c/0x24
>>     show_stack+0x2c/0x38
>>     dump_stack_lvl+0x5a/0x72
>>     dump_stack+0x14/0x1c
>>     __might_resched+0x130/0x13a
>>     rt_spin_lock+0x2a/0x5c
>>     die+0x24/0x112
>>     do_trap_insn_illegal+0xa0/0xea
>>     _new_vmalloc_restore_context_a0+0xcc/0xd8
>> Oops - illegal instruction [#1]
>>
>> Switch to use raw_spinlock_t, which does not sleep even with PREEMPT_RT
>> enabled.
>>
>> Fixes: 76d2a0493a17 ("RISC-V: Init and Halt Code")
>> Signed-off-by: Nam Cao <namcao@linutronix.de>
>> Cc: stable@vger.kernel.org
>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
>
> The die_lock() is probably do let one CPU die at a time. On x86 there is
> support for for recursive die so if it happens, you don't spin on the
> die_lock and see nothing. Not sure if this is a thing.

Looks like the RISC-V code is pretty much the same as the arm64 code, so 
it probably just came from there.  I don't really know what the right 
answer is here...

>
> Sebastian

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
