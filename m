Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39883CF2564
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Nov 2025 01:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ImYQSv2PHJb8KvbHMqxW11MbN4EKw3p/E9ARNYjRgZA=; b=tVpZ/Ce/I0ODi6
	dAX4uF0ZsCLN+PDxl/aYsY1SjTTQoY5nHgeZ6YA6BS2R8ZnAvI/pOpkkjMF200VRY+cvCo15pLOrr
	zWKSk8EtRgCSWNVTUOrHZjB3ovKrmhlYZsZ/QdTwRmuQDQoaJRhVLxhJGhlvLEptMoj7LE0S7S2px
	9OWckM9SxnZ98RbcwQdCb1P05HxRwcXxF1AD5myxPhaftIZxmm//TrBjAZvvUe89W7wmT4iNbCyQT
	xMKY08WqT9zAadky4DRH3WyGHBQ7NwVA5vsjS0+t1538klBCsPLZNvHW7iR3g05Rdd+pj65LgbGJu
	gkxd7TQjwUM+yHLUq4zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLX9G-00000001Lm1-090Q;
	Wed, 19 Nov 2025 01:38:18 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLX9D-00000001Lla-257b
	for linux-riscv@lists.infradead.org;
	Wed, 19 Nov 2025 01:38:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8094F44453;
	Wed, 19 Nov 2025 01:38:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED477C19421;
	Wed, 19 Nov 2025 01:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763516293;
	bh=wGwlctlR3phb/EaWdcj3gsbtcDdcz9sjR+f8vd0Ir2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=phoBJz/wW1mdB/aPVdYRHDSa4NyVz2vSvkFE1ZL80Fa0m4Jxdpt3C5aK9r1J5pjqC
	 Mp81bE/WWvv6pcTP2aqJxoki1zwxA9DdF2BEbMClFn/UoWei5tskBiRGenWHazdcdK
	 dgw6wUR2owco0L20XL+dZasgCrlOtO4ZiYZ3Mzts07gCSYfLZKlVk2Pe73rQrSzRP/
	 DC6HI6RQDeNCXCPVTImSrqKE114qmGpnzgwv638cOPZJRcbhvktSjVzLGoJ/ud/PMQ
	 kKL7u0osMmV1lRGlOZevS16ZUtSPJOk3FZaD7+gJw3TqNNSUaIIacJ9DXRF9+f79l7
	 qDyRoXkF43AwQ==
Date: Tue, 18 Nov 2025 18:38:08 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Jiakai Xu <xujiakai2025@iscas.ac.cn>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	namcao@linutronix.de
Subject: Re: Re: [PATCH] riscv: fix KUnit test_kprobes crash when building
 with Clang
Message-ID: <20251119013808.GA1264583@ax162>
References: <738dd4e2.ff73.19a7cd7b4d5.Coremail.xujiakai2025@iscas.ac.cn>
 <621798fc-68bc-504c-755f-0a2f1f83d1c2@kernel.org>
 <108ac2f0.17c6b.19a8fc4d1ca.Coremail.xujiakai2025@iscas.ac.cn>
 <bd82855d-4a80-58fb-c949-b968569ef1e2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd82855d-4a80-58fb-c949-b968569ef1e2@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_173815_581927_96458F56 
X-CRM114-Status: GOOD (  19.76  )
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

Hi Paul and Jiakai,

On Tue, Nov 18, 2025 at 01:21:50PM -0700, Paul Walmsley wrote:
> Not all of it, but some edited summary is appropriate.  I've queued the 
> following revision for v6.18-rc fixes, under the theory that it would be 
> good to get the test working for Clang users while the LLVM folks 
> investigate.  Please let us know ASAP if you think anything in it should 
> be changed.  I plan to send a PR out later this week.

I spent some time today trying to minimize a small set of configurations
that triggers this issue on top of defconfig since that occasionally
reveals a path to head down for triage and I landed on:

  $ cat arch/riscv/configs/repro.config
  CONFIG_KPROBES=y
  CONFIG_KUNIT=y
  CONFIG_RELOCATABLE=y
  CONFIG_RISCV_KPROBES_KUNIT=y

  $ make -skj"$(nproc)" ARCH=riscv LLVM=1 clean defconfig repro.config Image

  $ curl -LSs https://github.com/ClangBuiltLinux/boot-utils/releases/download/20241120-044434/riscv-rootfs.cpio.zst | zstd -d >rootfs.cpio

  $ qemu-system-riscv64 \
      -display none \
      -nodefaults \
      -bios default \
      -M virt \
      -append earlycon \
      -kernel arch/riscv/boot/Image \
      -initrd rootfs.cpio \
      -m 512m \
      -serial mon:stdio
  ...
  [    0.000000] Booting Linux on hartid 0
  [    0.000000] Linux version 6.18.0-rc6-dirty (nathan@ax162) (ClangBuiltLinux clang version 21.1.5 (https://github.com/llvm/llvm-project.git 8e2cd28cd4ba46613a46467b0c91b1cabead26cd), ClangBuiltLinux LLD 21.1.5 (https://github.com/llvm/llvm-project.git 8e2cd28cd4ba46613a46467b0c91b1cabead26cd)) #1 SMP Tue Nov 18 17:58:23 MST 2025
  ...
  [    1.041311] KTAP version 1
  [    1.041433] 1..1
  [    1.042111]     KTAP version 1
  [    1.042310]     # Subtest: kprobes_riscv
  [    1.042610]     # module: kprobes_riscv_kunit
  [    1.042732]     1..1
  [    1.047104] ------------[ cut here ]------------
  [    1.047293] WARNING: CPU: 0 PID: 45 at mm/page_alloc.c:5159 __alloc_frozen_pages_noprof+0x160/0x228
  [    1.047602] Modules linked in:
  [    1.047851] CPU: 0 UID: 0 PID: 45 Comm: kunit_try_catch Tainted: G                 N  6.18.0-rc6-dirty #1 NONE
  [    1.047933] Tainted: [N]=TEST
  [    1.047948] Hardware name: riscv-virtio,qemu (DT)
  [    1.048024] epc : __alloc_frozen_pages_noprof+0x160/0x228
  [    1.048057]  ra : ___kmalloc_large_node+0x52/0x1a0
  [    1.048073] epc : ffffffff8023e2e8 ra : ffffffff80247c26 sp : ff200000001f3c10
  [    1.048086]  gp : ffffffff81a25900 tp : ff600000023924c0 t0 : 00000000264163d0
  [    1.048097]  t1 : 00000000264163d0 t2 : 00000000000aae60 s0 : ff200000001f3c90
  [    1.048108]  s1 : 000000000a83ca20 a0 : 0000000000000001 a1 : ffffffff819e71ba
  [    1.048119]  a2 : 0000000000000000 a3 : 0000000000000000 a4 : 000000003b9aca00
  [    1.048130]  a5 : 0000000000016698 a6 : ff600000021480d0 a7 : 00000000000aae60
  [    1.048140]  s2 : 0000000000000010 s3 : ffffffff8024857a s4 : 0000000000000dc0
  [    1.048151]  s5 : ffffffff80018e20 s6 : ff2000000000bb40 s7 : 0000000000000000
  [    1.048161]  s8 : 0000000000000000 s9 : 0000000000166e7c s10: 0000000000000000
  [    1.048171]  s11: 0000000000000000 t3 : 0000000000000000 t4 : 0000000000000002
  [    1.048181]  t5 : ff60000002392580 t6 : 0000000000000001
  [    1.048191] status: 0000000200000120 badaddr: ffffffff8023e2e8 cause: 0000000000000003
  [    1.048281] [<ffffffff8023e2e8>] __alloc_frozen_pages_noprof+0x160/0x228
  [    1.048362] [<ffffffff80247c26>] ___kmalloc_large_node+0x52/0x1a0
  [    1.048374] [<ffffffff80247dd8>] __kmalloc_large_node_noprof+0x1c/0x114
  [    1.048384] [<ffffffff8024857a>] __kmalloc_noprof+0x252/0x450
  [    1.048393] [<ffffffff80018ae6>] test_kprobe_riscv+0x5a/0x210
  [    1.048406] [<ffffffff8050d6a6>] kunit_try_run_case+0x5a/0x15c
  [    1.048417] [<ffffffff8050f69a>] kunit_generic_run_threadfn_adapter+0x1a/0x34
  [    1.048439] [<ffffffff8004fa88>] kthread+0x178/0x1a0
  [    1.048450] [<ffffffff8001311a>] ret_from_fork_kernel+0xe/0x48
  [    1.048464] [<ffffffff80b500f2>] ret_from_fork_kernel_asm+0x16/0x1c
  [    1.048513] ---[ end trace 0000000000000000 ]---
  [    1.056832]     # test_kprobe_riscv: EXPECTATION FAILED at arch/riscv/kernel/tests/kprobes/test-kprobes.c:24
  [    1.056832]     Expected kp to be true, but is false
  [    1.058370]     not ok 1 test_kprobe_riscv
  [    1.058484] not ok 1 kprobes_riscv
  ...

This appears to happen back to LLVM 15 so I am not sure it is a recent
recent regression on the toolchain side.

Without CONFIG_RELOCATABLE enabled, the test passes:

  [    1.049384] KTAP version 1
  [    1.049656] 1..1
  [    1.050246]     KTAP version 1
  [    1.050447]     # Subtest: kprobes_riscv
  [    1.050760]     # module: kprobes_riscv_kunit
  [    1.050867]     1..1
  [    1.061790]     ok 1 test_kprobe_riscv
  [    1.061929] ok 1 kprobes_riscv

Interestingly, if I enable CONFIG_RISCV_KPROBES_KUNIT as a module, I get
a failure when trying to load it in QEMU:

  ~ # modprobe kprobes_riscv_kunit
  [   42.214642] kprobes_riscv_kunit: The unexpected relocation type 'R_RISCV_ALIGN' from PC = 00000000abb84ce7
  [   42.222778] kprobes_riscv_kunit: The unexpected relocation type 'R_RISCV_ALIGN' from PC = 00000000abb84ce7
  modprobe: can't load module kprobes_riscv_kunit (kernel/arch/riscv/kernel/tests/kprobes/kprobes_riscv_kunit.ko): Invalid argument

which is probably unrelated but I figured it was worth mentioning, as it
does not allow me to see if this has something to do with the flags
added to LDFLAGS_vmlinux.

Maybe this is useful for the upstream report and further triage.

Cheers,
Nathan

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
