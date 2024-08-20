Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4879EC5320E
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 07:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GtSgJvSdYm2emgOldYtpw2AUhV7/VttiCacR2LGccr8=; b=eJZ9wJDb5H17zj
	6xr9b7KmXAiuhuv4tmq4vZXMqGvlJn2hVhugcQhP0QE9E2HRW9OvmFiNGhKFNWNRcae6xRwvnrziu
	mVZ1UeqHOwJpnMoiBD7lQ+WzvV8C4rzpflJKTwziKSijelyT95SAg3Esu93BN1nMLzO/wZ1Aizsl3
	p1m6rZEqUZwN6tuODMta8Gy6mgJjCdgxb4eT8Ig8hdVUcAJ5qIGsxJ6k5TFNgqbNTxx9JGjvXaNkQ
	U+5GF7nmg2KL6RU5mPpOYreMqaEJZjpPh4ApYTlOhQ12c8PEAOZw0GK79z6lS5d6Sm4KdXiys0cXI
	+TfBCoVFWRoRaxl79N6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJcc-00000004H6Q-39F8;
	Tue, 20 Aug 2024 07:49:42 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgJcX-00000004H3K-2YTM
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 07:49:41 +0000
Date: Tue, 20 Aug 2024 09:49:25 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1724140173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=M5NmlRYVePqzfpvCRGYGwIXh0bDq30gB15n+FrvAydk=;
	b=PE8OV0hLCxMqeXg8hS9mvU7QnLYzey9M0w/fMeAuVJ1cJy4rKTC1PYTp6maqF6MALwfEXm
	cTVz0fWkiuoPM/gYbEXRLIuvx1jLMCeTvUW5PAK+i9L55gNyILKj0q4XhxdkAjEI/YupJ0
	7BW4LIMhcxx2JyIqyzGrUimxA9woEjTRaxQE9NHaxEqXROYfCEGvaL0jrjqi8/CcWJ+u85
	XDG7aCybX9r0GVo1Clv2vWDjyMBK1sRcmTrbBgo4c7HjWsoTlT4MW5dw+ED0sZmX9pD20d
	grPSGzQkOLmxsGNyXU2Tejkw/lgBechynWzjdjmG7wU28WLGVIQH7cyju9bXGg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1724140173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=M5NmlRYVePqzfpvCRGYGwIXh0bDq30gB15n+FrvAydk=;
	b=+MTA0FTeEAynBAvdPlV4rTlOo59sQn9r1aklahwhOqzBIo2j1l0NFZ9LFzACZW7KpqHS5j
	EPhOIJ2j4iDFaICA==
From: Nam Cao <namcao@linutronix.de>
To: Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: drivers/perf: riscv: BUG: using smp_processor_id() in preemptible
Message-ID: <20240820074925.ReMKUPP3@linutronix.de>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_004937_831877_A1D7E683 
X-CRM114-Status: UNSURE (   3.33  )
X-CRM114-Notice: Please train this message.
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

Hi,

I noticed the following issue on 6.11.0-rc4 with CONFIG_DEBUG_PREEMPT=y.

BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
caller is debug_smp_processor_id+0x1c/0x26
CPU: 2 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.11.0-rc4 #2
Hardware name: StarFive VisionFive 2 v1.3B (DT)
Call Trace:
    dump_backtrace+0x1c/0x24
    show_stack+0x2c/0x38
    dump_stack_lvl+0x5a/0x72
    dump_stack+0x14/0x1c
    check_preemption_disabled+0xb6/0xb8
    debug_smp_processor_id+0x1c/0x26
    pmu_sbi_device_probe+0x474/0x570
    platform_probe+0x52/0x96
    really_probe+0x82/0x202
    __driver_probe_device+0x5c/0xd0
    driver_probe_device+0x2c/0xb0
    __device_attach_driver+0x6e/0x8e
    bus_for_each_drv+0x64/0xb8
    __device_attach+0x82/0x144
    device_initial_probe+0xe/0x16
    bus_probe_device+0x86/0x88
    device_add+0x508/0x6ac
    platform_device_add+0xcc/0x1c8
    platform_device_register_full+0xee/0x142
    pmu_sbi_devinit+0xd4/0x11c
    do_one_initcall+0x58/0x19c
    kernel_init_freeable+0x210/0x27a
    kernel_init+0x1e/0x112
    ret_from_fork+0xe/0x1c

If you fix the issue, please add:
Reported-by: Nam Cao <namcao@linutronix.de>

Best regards,
Nam

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
