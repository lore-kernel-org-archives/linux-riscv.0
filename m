Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B37C43461
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 08:31:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 323AE206C9
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 08:31:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NC+c3tKZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="SCC0VTxH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 323AE206C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JnhhWVydK5Tpa161RvEFigVFOi4sQ/oLtgGQ99STAfg=; b=NC+c3tKZnKeHEhUy3Pr8AZp0t
	6OriChCz+QI5XNOdlkPjjSu41PSbp1aoSY4iUHKp2IVnkuBYrMK6PYCNhwNhsyIhjZNXuXLp4Xvja
	U/IpcwLx6wWw5eF6kz6EbBJLKlvGfGSaz1eOpbrGBYZlDgPYhvAo6ijbXdlfY8WL/dxuyHlj4k+tC
	JSTd8ROQahZkYjcRJR/ENddxFYJNsYB0yG0UbemblztLb78xH9zpvULtb2hl5fmzYAMhcwVylx32D
	JsVzsP36qOFZtvo71lWCuvGLP5gZiCf5EjP5+85QSoYC5A/sjtV4u0He+x2KvWOo04eUFb3gzmZ++
	NDcZKC7Og==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE77p-0000os-2v; Fri, 04 Sep 2020 08:31:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE77m-0000oh-UL
 for linux-riscv@merlin.infradead.org; Fri, 04 Sep 2020 08:31:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=gbluQpPNHdbiMWA4xN7pVTQSsV8hyhAkU366CTjL+84=; b=SCC0VTxHP3pVTSpFGnwSKYEfBk
 XxquMP8BzgfEKVT2S5qiZsHJTZWYbYb0Tzgp3GoNQ0w/xcrSUqciagxcx3+xxKrKDth7x4Qt3POFB
 kk2iTmtowbfDyXay2rZZ0SPx8Q9rXYVD1a7gAzJov2TM7Y6gHGdCfOs9UlWyPeiu4WvI1rgLl/dSX
 g4TuFLQ57A89IzenfSbedJadPLzUI71y4COT0uDtunDi1B/kM7abwCKaIrm2pD4Z0oAHBPI75IdqH
 2QyjShdyWlKQcRj2zs3QkKOoGpn0/YCHVCTRt7L1ljAq/1hdy5Eek+FXSScxgNnALV1s0DEi/I7Nj
 fPmoAizw==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kE77l-0002YB-Im; Fri, 04 Sep 2020 08:31:09 +0000
Date: Fri, 4 Sep 2020 09:31:09 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [GIT PULL] RISC-V Fixes for 5.9-rc2
Message-ID: <20200904083109.GA9182@infradead.org>
References: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
 <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAHk-=wi_tf4qsiBj5UD0GG3wz8Hi5NrHzqdrx+CwtfAY+_UiGg@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Aug 21, 2020 at 12:35:20PM -0700, Linus Torvalds wrote:
> On Fri, Aug 21, 2020 at 11:26 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
> >
> > * The CLINT driver has been split in two: one to handle the M-mode CLINT
> >   (memory mapped and used on NOMMU systems) and one to handle the S-mode CLINT
> >   (via SBI).
> 
> This looks more like development than fixes.
> 
> I guess I don't care deeply enough about it, but please don't do this.

Well, I care because this late pull requests completely breaks nommu
(nommu_virt_defconfig).   More specifically commit 2bc3fc877aa9
("RISC-V: Remove CLINT related code from timer and arch") leas to this
spew when booting under qemu:

[    0.000000] NR_IRQS: 64, nr_irqs: 64, preallocated irqs: 0
[    0.000000] riscv-intc: 64 local interrupts mapped
[    0.000000] plic: interrupt-controller@c000000: mapped 53 interrupts with 2 handlers for 4 contexts.
[    0.000000] Oops - illegal instruction [#1]
[    0.000000] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.9.0-rc1-00003-g2bc3fc877aa9c4 #609
[    0.000000] epc: 000000008000de78 ra : 000000008000ddaa sp : 0000000080187f40
[    0.000000]  gp : 00000000801a3aa8 tp : 000000008018bd40 t0 : 0000000000000019
[    0.000000]  t1 : 0000000000000018 t2 : 0000000000000001 s0 : 0000000080187f80
[    0.000000]  s1 : 0000000000000200 a0 : 000000008019b738 a1 : 0000000000000000
[    0.000000]  a2 : ffffffff80187f50 a3 : 0000000000000000 a4 : 0000000000000000
[    0.000000]  a5 : 0000000080169018 a6 : 0000000000000000 a7 : 00000000000001e4
[    0.000000]  s2 : 00000000801a40a8 s3 : 00000000801a4068 s4 : 000000008fc7c040
[    0.000000]  s5 : 00000000801a4038 s6 : 00000000801a4030 s7 : 0000000080012da0
[    0.000000]  s8 : 0000000000000000 s9 : 0000000000000000 s10: 0000000000000000
[    0.000000]  s11: 0000000000000000 t3 : 00000000801c40d8 t4 : 0000000000000068
[    0.000000]  t5 : 000000000000004c t6 : 0000000000000033
[    0.000000] status: 0000000000001800 badaddr: 0000000000000000 cause: 0000000000000002
[    0.000000] random: get_random_bytes called from 0x00000000800210c4 with crng_init=0
[    0.000000] ---[ end trace 0000000000000000 ]---
[    0.000000] Kernel panic - not syncing: Attempted to kill the idle task!
[    0.000000] ---[ end Kernel panic - not syncing: Attempted to kill the idle task! ]---

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
