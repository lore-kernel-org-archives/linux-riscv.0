Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF11CC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 08:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HTvY+ar2i1BxuwUnOzmfFTb5bMaQ4iKcBAo8+9U81jI=; b=FIFRp3d9RNKMEL
	DkRe/UwMcSBVu/SNOmYO9QKDXnoVKye8UmIwTw1QHKOrSj1V7bSS7byyHk0MOMwdLineujqWlJgMk
	z9/KGSY3NKlYtFLnXCzXvMDBuzrLFzoZW8CYwOYh7oMxm1V01pyt6A3VeQdFDrGWDvj9l2MweQxhK
	crt/Qxr8cTXpfdcNzmf90pR/rai3YKyCW4s+2NP/q+URatitQ6nfZGKqq/sv7uWs8JBZL7T+jUMOe
	be8b/vdedXMZ3CkLL/hvXCTcE51OEIkwK7W2QM0IBqmaGwbZQifL/CnBru/iG1UK8ByPMrjd8qHKu
	N+ts8KPt5QRUg7wdem1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD01i-005xfJ-En; Sun, 17 Jul 2022 08:53:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oD01f-005xeC-PE
	for linux-riscv@lists.infradead.org; Sun, 17 Jul 2022 08:53:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5F09360FE9
	for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 08:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D36C385A5
	for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 08:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658047997;
	bh=r7gE2cWShPHHFhlzYIopjBdniIsNaSIiB+MAozk+bEE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=GLKGxkIDsoctjGUM0pmu0xooFjoKWR6i7xVZT6ir3zqd2FIQe8P3B+s73yAImaVz2
	 cEcLEm0vfpzuEw9TWPrY12Y+m7CyvemraqNEv6+aEJj430JKCtj71g2L07vEXS02a9
	 YWTaIUe6LDV4TQsH88vY4/RpdmfdWX+ddanydIwsvN3xzxG6ZQ2GuaO7yM2fgvr0/v
	 knjewhOf5V+3R4hOJU2Cgtg0dZt4omQWLHKOLTtK2otyp4x3MX28KugkIc2QEDokx0
	 aHvQKjxR+6U+quTKYO5qP5s+gRk4EEIhpMWaKCNYHL5BvLhLWlxZtdOuuK5nV8wHq9
	 QogD7VqA7FtzQ==
Received: by mail-lj1-f175.google.com with SMTP id u14so2368675lju.0
        for <linux-riscv@lists.infradead.org>; Sun, 17 Jul 2022 01:53:17 -0700 (PDT)
X-Gm-Message-State: AJIora+tSj5dVIHR+DE+VKlI8Tw6ApA9qDZyvViSDRpTwuB3EYyEQPZg
	LPoNRj0p0jxKISfevXisfPpOgFPEEatz3HRqKl8=
X-Google-Smtp-Source: AGRyM1tpNV82sBXI82jDmnQ+UoOmnEP915anS35eZApsmkEab2lvFcpfldUt0XkJIOG+5XD0kMbzxie9mJ/DHpD0pJg=
X-Received: by 2002:a2e:9b0b:0:b0:25d:866b:5de7 with SMTP id
 u11-20020a2e9b0b000000b0025d866b5de7mr10376574lji.50.1658047995783; Sun, 17
 Jul 2022 01:53:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220717042929.370022-1-xianting.tian@linux.alibaba.com>
In-Reply-To: <20220717042929.370022-1-xianting.tian@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 17 Jul 2022 16:53:03 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQQNjbKNQfFHpzxPJmqvn_BSeYM57SXZB8Euy-ts216Hw@mail.gmail.com>
Message-ID: <CAJF2gTQQNjbKNQfFHpzxPJmqvn_BSeYM57SXZB8Euy-ts216Hw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Support RISCV64 arch and common commands
To: Xianting Tian <xianting.tian@linux.alibaba.com>
Cc: crash-utility@redhat.com, Nick Kossifidis <mick@ics.forth.gr>, 
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, k-hagio-ab@nec.com, 
	linux-riscv <linux-riscv@lists.infradead.org>, hschauhan@nulltrace.org, 
	huanyi.xj@alibaba-inc.com, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Christoph Muellner <cmuellner@linux.com>, Philipp Tomsich <philipp.tomsich@vrull.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_015319_938032_7EBF62FE 
X-CRM114-Status: GOOD (  18.57  )
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

Great Job. After two years, we finally have crash ready to use.

Tested-by: Guo Ren <guoren@kernel.org>

On Sun, Jul 17, 2022 at 12:29 PM Xianting Tian
<xianting.tian@linux.alibaba.com> wrote:
>
> This series of patches make crash tool support RISCV64 arch and the common
> commands(*, bt, p, rd, mod, log, set, struct, task, dis and so on).
>
> To make the crash tool work normally for RISCV64 arch, we need a Linux kernel
> patch(under reviewing), which exports the kernel virtual memory layout, va_bits,
> phys_ram_base to vmcoreinfo, it can simplify the development of crash tool.
>
> THis Linux kernel patch:
> https://patchwork.kernel.org/project/linux-riscv/patch/20220714113300.367854-2-xianting.tian@linux.alibaba.com/
>
> This series of patches are tested on QEMU RISCV64 env and SoC platform of
> T-head Xuantie 910 CPU.
>
> ====================================
>   Some test examples list as below
> ====================================
> ... ...
>       KERNEL: vmlinux
>     DUMPFILE: vmcore
>         CPUS: 1
>         DATE: Fri Jul 15 10:24:25 CST 2022
>       UPTIME: 00:00:33
> LOAD AVERAGE: 0.05, 0.01, 0.00
>        TASKS: 41
>     NODENAME: buildroot
>      RELEASE: 5.18.9
>      VERSION: #30 SMP Fri Jul 15 09:47:03 CST 2022
>      MACHINE: riscv64  (unknown Mhz)
>       MEMORY: 1 GB
>        PANIC: "Kernel panic - not syncing: sysrq triggered crash"
>          PID: 113
>      COMMAND: "sh"
>         TASK: ff60000002269600  [THREAD_INFO: ff60000002269600]
>          CPU: 0
>        STATE: TASK_RUNNING (PANIC)
>
> carsh>
>
> crash> p mem_map
> mem_map = $1 = (struct page *) 0xff6000003effbf00
>
> crash> p /x *(struct page *) 0xff6000003effbf00
> $5 = {
>   flags = 0x1000,
>   {
>     {
>       {
>         lru = {
>           next = 0xff6000003effbf08,
>           prev = 0xff6000003effbf08
>         },
>         {
>           __filler = 0xff6000003effbf08,
>           mlock_count = 0x3effbf08
>         }
>       },
>       mapping = 0x0,
>       index = 0x0,
>       private = 0x0
>     },
>   ... ...
>
> crash> mod
>      MODULE       NAME             BASE         SIZE  OBJECT FILE
> ffffffff0113e740  nvme_core  ffffffff01133000  98304  (not loaded)  [CONFIG_KALLSYMS]
> ffffffff011542c0  nvme       ffffffff0114c000  61440  (not loaded)  [CONFIG_KALLSYMS]
>
> crash> rd ffffffff0113e740 8
> ffffffff0113e740:  0000000000000000 ffffffff810874f8   .........t......
> ffffffff0113e750:  ffffffff011542c8 726f635f656d766e   .B......nvme_cor
> ffffffff0113e760:  0000000000000065 0000000000000000   e...............
> ffffffff0113e770:  0000000000000000 0000000000000000   ................
>
> crash> vtop ffffffff0113e740
> VIRTUAL           PHYSICAL
> ffffffff0113e740  8254d740
>
>    PGD: ffffffff810e9ff8 => 2ffff001
>   P4D: 0000000000000000 => 000000002fffec01
>   PUD: 00005605c2957470 => 0000000020949801
>   PMD: 00007fff7f1750c0 => 0000000020947401
>    PTE: 0 => 209534e7
>  PAGE: 000000008254d000
>
>   PTE     PHYSICAL  FLAGS
> 209534e7  8254d000  (PRESENT|READ|WRITE|GLOBAL|ACCESSED|DIRTY)
>
>       PAGE       PHYSICAL      MAPPING       INDEX CNT FLAGS
> ff6000003f0777d8 8254d000                0        0  1 0
>
> crash> bt
> PID: 113      TASK: ff6000000226c200  CPU: 0    COMMAND: "sh"
>  #0 [ff20000010333b90] riscv_crash_save_regs at ffffffff800078f8
>  #1 [ff20000010333cf0] panic at ffffffff806578c6
>  #2 [ff20000010333d50] sysrq_reset_seq_param_set at ffffffff8038c03c
>  #3 [ff20000010333da0] __handle_sysrq at ffffffff8038c604
>  #4 [ff20000010333e00] write_sysrq_trigger at ffffffff8038cae4
>  #5 [ff20000010333e20] proc_reg_write at ffffffff801b7ee8
>  #6 [ff20000010333e40] vfs_write at ffffffff80152bb2
>  #7 [ff20000010333e80] ksys_write at ffffffff80152eda
>  #8 [ff20000010333ed0] sys_write at ffffffff80152f52
>
> Xianting Tian (8):
>   Add RISCV64 framework code support
>   RISCV64: Make crash tool enter command line and support some commands
>   RISCV64: Add 'dis' command support
>   RISCV64: Add 'irq' command support
>   RISCV64: Add 'bt' command support
>   RISCV64: Add 'help -r' command support
>   RISCV64: Add 'mach' command support
>   RISCV64: Add the implementation of symbol verify
>
>  Makefile            |    7 +-
>  README              |    2 +-
>  configure.c         |   39 +-
>  defs.h              |  248 +++++++-
>  diskdump.c          |   21 +-
>  help.c              |    2 +-
>  lkcd_vmdump_v2_v3.h |    2 +-
>  netdump.c           |   22 +-
>  ramdump.c           |    2 +
>  riscv64.c           | 1414 +++++++++++++++++++++++++++++++++++++++++++
>  symbols.c           |   10 +
>  11 files changed, 1759 insertions(+), 10 deletions(-)
>  create mode 100644 riscv64.c
>
> --
> 2.17.1
>


-- 
Best Regards
 Guo Ren

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
