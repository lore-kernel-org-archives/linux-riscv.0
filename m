Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B65F2CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 03:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3/AqYvmW8NeZMBz3awdQQlx+6qiQ9jvs28dvdPoARho=; b=csfJ6fUga8HuR+
	U9dEo5MgTfmYAXtkLVWKYyhnl64NxpqMIrm95ZE2vXCwJvMHT/EHmvrPU5rw4JSXhIMrOOZ5dZAeS
	2886po72G+jFteZl8LGrnbW24Ru7YjHw0wNq9tZZOeffCn+GX4AsAMkuD2xn3qaihMQC42Z8bM+ra
	/LAqRmM1h/BoDygUocrhh9z2vd+NzRFywp/hedlW3R/DiF++3+uh8jEJnJDW8tGBrSY3RPUJrZ0vt
	yLLuvPjN+VQZZCN0Kir59V/9qMl5uK2rucFBELMqZGeK2FpDW6PS75e1YkK0DeP93SfC0H7LPEkx9
	nPagClXGsOHtQYhjelrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ0o6-000000088E3-3uPy;
	Sat, 02 May 2026 03:14:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ0o5-000000088Ds-1KvY
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 03:14:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F0BC6014C;
	Sat,  2 May 2026 03:14:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DC20C2BCB7;
	Sat,  2 May 2026 03:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777691655;
	bh=jNw8JNIXe2xdou3EX61eGTSqNhbO8AU8Riw7XMyOufk=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=ZCtkENZo3ulznzI5S28ZcBL1/0/koV48WhJQudH4NJ9F05t1M9EXDzkvgBBsygjE/
	 DcTKcejPtQyBczdMixqCEra58zCbJDkk7SexATvtPzviarLUlHalp3hM3aeB7XGbI2
	 pknWw0VyOWJVJrOCYz+Y9kd8xce1FCBl0LtqNMhS+Kq4SdbDcrlu32YFzVZx2McCrI
	 +1fujReaxegwkIyS31ZdMB4Aa7vt6JhKPed3atlWhsJMYDLi4kIzJuq/+HO3PVrqq3
	 5/2Zts4E7bTEfKr6mgmT18+N0Qfo+B/QV0yo8fAnJNiXvcuiqKhh/W/slk8BMIf/my
	 Sr15KwPBEaOzQ==
Date: Fri, 1 May 2026 21:14:11 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Michael Neuling <mikey@neuling.org>
cc: pjw@kernel.org, ajones@ventanamicro.com, akpm@linux-foundation.org, 
    aleksa.paunovic@htecgroup.com, alex@ghiti.fr, aou@eecs.berkeley.edu, 
    arikalo@gmail.com, arnd@arndb.de, bjorn@rivosinc.com, david@redhat.com, 
    djordje.todorovic@htecgroup.com, guoren@kernel.org, 
    junhui.liu@pigmoral.tech, kevin.brodsky@arm.com, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    ljs@kernel.org, namcao@linutronix.de, oleg@redhat.com, osalvador@suse.de, 
    palmer@dabbelt.com, panqinglin2020@iscas.ac.cn, rppt@kernel.org, 
    rvishwanathan@mips.com, vishal.moola@gmail.com
Subject: Re: [PATCH v2] riscv: Fix register corruption from uninitialized
 cregs on error
In-Reply-To: <20260501062320.2339562-1-mikey@neuling.org>
Message-ID: <f34b72a2-6001-3a30-1653-60b3d2e9dad0@kernel.org>
References: <78b4e931-9ec7-14b6-1487-906652a65ce8@kernel.org> <20260501062320.2339562-1-mikey@neuling.org>
MIME-Version: 1.0
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

On Fri, 1 May 2026, Michael Neuling wrote:

> compat_riscv_gpr_set() calls cregs_to_regs() unconditionally, even when
> user_regset_copyin() fails. Since cregs is an uninitialized stack
> variable, a copyin failure causes uninitialized stack data to be written
> into the target task's pt_regs, corrupting its register state and
> potentially leaking kernel stack contents.
> 
> compat_restore_sigcontext() has the same issue: it calls cregs_to_regs()
> even when __copy_from_user() fails, leading to the same corruption of
> the signal-returning task's register state on error.
> 
> Only call cregs_to_regs() when the user copy succeeds.
> 
> Fixes: 4608c159594f ("riscv: compat: ptrace: Add compat_arch_ptrace implement")
> Fixes: 7383ee05314b ("riscv: compat: signal: Add rt_frame implementation")
> Signed-off-by: Michael Neuling <mikey@neuling.org>
> Assisted-by: Cursor:claude-4.6-opus-high-thinking

Thanks very much; queued for v7.1-rc.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
