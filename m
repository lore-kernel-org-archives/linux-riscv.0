Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF372C53219
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 19:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nE3TcTJ8Z/ryBXkKdb7yUKimZ0s1iZ3n18R3+k6hZfc=; b=Tl8EoXTIwCf8iE
	SYchYDRCA/tP963hbuBrw061M3Zx24mzmPIcSaHENHwGhRsvrBMpGbrnEHfNKrpRgkpuOygSyQrGP
	NzUdez2bpcpoLq6nxxYxIS85bEsxVLSU5JX2ucEzW/MCsEOaSrWJT2JxW1JnLI8KO90e5hWAEUWPv
	UuAdfHpuFfouAD508qtZGhlj5Fru+mIgjFuWCm+HLbZIYsaaZx88VaGyWl7Rd25mnQfQvmre2wSCt
	hKvYCxJAO8/e6nC4x2lFKvNjauZKvOXMTQ6Dcwv7T4fPEIY1gwodfeznktRRKLAy4IreSqB64Rout
	bJbN/4bXup7serYFQLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9sq-00000008ste-30HN;
	Wed, 29 Jul 2026 19:24:04 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp9sp-00000008stP-0ZV5
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 19:24:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 086086001D;
	Wed, 29 Jul 2026 19:24:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10CED1F000E9;
	Wed, 29 Jul 2026 19:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785353041;
	bh=H1ocxBhaeFhzWEiaKtiNVxhWOqwiySm/0uMeQpPHKSU=;
	h=Date:From:To:cc:Subject:In-Reply-To:References;
	b=mTKGrMFRS/qCp+QiPvg2lGguHvxh4p7wywxzaikZPsK0u+x/PQCwF8CsohqzoLqaN
	 B5+2Cw2oGAYGC6avkwXwWWd9X1WsUi8+IwIpJrFDXoaVKloiX56ga6mfV5It0nARuT
	 9Qv4hXGyBTmcfgqB3FAJ2ikGsYAcGz3vfWnsDXnT3GSMM6v8Zmdl4y2Udrma1pEE8a
	 NgdBUEc6IN/9cyYQUXmxnrz+YxC1kgLMdkSHfxF9VUOhtjoVPDMwLT0s/IoalC6uEQ
	 ZFbfT7cuFW9LCUBH7qycAnnWZCPVyVco7pTRftwCptKdzvlyApmlb0D2X8d0v6uA4A
	 PaphrarwDNPIg==
Date: Wed, 29 Jul 2026 13:23:58 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, namcao@linutronix.de
cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
    Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
    Andrew Jones <ajones@ventanamicro.com>, linux-riscv@lists.infradead.org, 
    linux-kernel@vger.kernel.org, andrew.jones@oss.qualcomm.com, 
    ganboing@gmail.com
Subject: Re: [PATCH] riscv: drop __init from
 vec_check_unaligned_access_speed_all_cpus
In-Reply-To: <20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com>
Message-ID: <20d05ee9-3c76-c9f6-6a16-755f855a1ced@kernel.org>
References: <20260612-vec_unaligned_drop_init-v1-1-df969210ae34@oss.tenstorrent.com>
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

Hi,

On Fri, 12 Jun 2026, Anirudh Srinivasan wrote:

> This function runs within a kthread and need not necessarily finish
> before system finishes boot and free_initmem() unmaps the .init.text
> section. This function makes calls to SBI for probing unaligned access
> speed, and if this is slow for some reason (say some debug prints were
> added to SBI), the kthread can still be running at this point and result
> in an instruction page fault when trying to fetch from the freed region.
> 
> [   25.642087] Unable to handle kernel paging request at virtual address ffffffff80a04ef8
> [   25.646694] Current vec_check_unali pgtable: 4K pagesize, 48-bit VAs, pgdp=0x00004000316e9000
> [   25.653170] [ffffffff80a04ef8] pgd=000010004be7e401, p4d=000010004be7e401, pud=000010004be7e001, pmd=000010000c3000e3
> [   25.661244] Oops [#1]
> [   25.662997] Modules linked in:
> [   25.665357] CPU: 3 UID: 0 PID: 42 Comm: vec_check_unali Not tainted 7.0.0-tt-blackhole-asrinivasan-00007-g30ff73f18211 #570 PREEMPTLAZY
> [   25.674669] Hardware name: Tenstorrent Blackhole (DT)
> [   25.678545] epc : vec_check_unaligned_access_speed_all_cpus+0x18/0x2c
> [   25.683458]  ra : vec_check_unaligned_access_speed_all_cpus+0x18/0x2c
> [   25.688372] epc : ffffffff80a04ef8 ra : ffffffff80a04ef8 sp : ffff8f8000203e20
> [   25.693874]  gp : ffffffff814dc168 tp : ffffaf8001ad9900 t0 : 0000000000000000
> [   25.699401]  t1 : fffffffffffffff0 t2 : ffffaf8001ad9a10 s0 : ffff8f8000203e30
> [   25.704912]  s1 : ffffaf80018dc780 a0 : 0000000000000000 a1 : 0000000000000002
> [   25.710407]  a2 : 00000000000001f0 a3 : 0000000000000018 a4 : 0000000000000000
> [   25.715917]  a5 : 0000000000000000 a6 : ffffaf8001c03d98 a7 : ffffaf8001c03e30
> [   25.721419]  s2 : ffff8f8000023c98 s3 : ffffaf8001aa1240 s4 : ffffffff80a04ee0
> [   25.726937]  s5 : 0000000000000000 s6 : 0000000000000000 s7 : 0000000000000000
> [   25.732450]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
> [   25.737944]  s11: 0000000000000000 t3 : 0000000000000002 t4 : 0000000000000402
> [   25.743481]  t5 : 0000000000000040 t6 : 0000000000000004 ssp : 0000000000000000
> [   25.749024] status: 0000000200000120 badaddr: ffffffff80a04ef8 cause: 000000000000000c
> [   25.755060] [<ffffffff80a04ef8>] vec_check_unaligned_access_speed_all_cpus+0x18/0x2c
> [   25.760964] [<ffffffff80047a10>] kthread+0xd8/0xfc
> [   25.764660] [<ffffffff80010c48>] ret_from_fork_kernel+0x18/0x1c4
> [   25.769220] [<ffffffff80895fe6>] ret_from_fork_kernel_asm+0x16/0x18
> [   25.774018] Code: cccc cccc cccc cccc cccc cccc cccc cccc cccc cccc (cccc) cccc
> 
> Drop __init from its signature so that this doesn't happen.

I've queued this one for v7.2-rc, since it is a narrow, targeted fix for a 
specific issue; and will plan to queue Nam's patches for v7.3.


- Paul

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
