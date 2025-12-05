Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0418D2CDFE
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Dec 2025 02:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YxIFyuZlfGJVY0Bx/+WBEss9xN66KWGNsKwlw2FXzYs=; b=1t3JDyIVTfztsQ
	6yYLv4pdg3i+VzZpNKynQ83OHltOUDt/aFlUixWT+0OEbjGdABDj+LKhTyd3QhggLgfAuyysnzDmA
	whkFFQn8Mr8VM5oEqHbtxIkKcC/qC/CE4q7WMQf/qofEEkY5ts3uuMxnJun/rIVGxF35OP4BgTGLf
	WzGdjyP2tqlVqLiPWzGVhffJz8d2ZNqyBvxpMTZCbHKGPtrpJ3v4+uhL7kmP99PxKxH7l0qmU8ngi
	L2IGaQsdEtpkP96miN+CvtVfjyu88SqIorlWLuXOEpTCjwDOy4zO5/mUQAmB3Q5ijNOAVpfWjdJRK
	WjGue/1EdXSRUeETRyjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRLkv-00000008vcV-2NpZ;
	Fri, 05 Dec 2025 02:41:13 +0000
Received: from mgamail.intel.com ([198.175.65.20])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRLkk-00000008vbq-2CUt
	for linux-riscv@lists.infradead.org;
	Fri, 05 Dec 2025 02:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764902463; x=1796438463;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YWPgp6ETHw0rQCvXyVjOuRlG44uPU13fK/UDjtrYeoA=;
  b=aYae9xn3kjyNSXqNdTD8FG5gUET8AGAgS2EIsyxZX7/sxKwQWlkuC6S0
   oVD+G5m0k9VlFFH7yss5xUEF8V4jwR3zmgh9sD6TjcwMVOQQT63FkR6fT
   bJYbv+w7ULW4LAmSy9corhE2VNFyhiklzYoA3NcslTt0SYqAOH9KZXoPU
   cnF+LaGOTvXpmQmT4V7RDBSroI9LSm6LSjtLiuXw+I6m06cvOIiJiLy8g
   TlCEAgQq65uvl7eurUO86gOtYyMYegpwU+ZsshKmdGRZANuTHGqFqeF6z
   BaOlCUa3G3lkqdoUNwNEjTMzlhuRHC7Utvhaq+dqu7od5XlaGiGug8bUT
   Q==;
X-CSE-ConnectionGUID: s/5XaR6GRPOxAwCsteu4BQ==
X-CSE-MsgGUID: iXXOmVmyQtKxnmvfDWvRnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="66657802"
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="66657802"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:40:59 -0800
X-CSE-ConnectionGUID: xyVrV1D0SiCC7UIVyZgz1w==
X-CSE-MsgGUID: tBlcxB12S5qF4sHuSv34lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,250,1758610800"; 
   d="scan'208";a="199590264"
Received: from ly-workstation.sh.intel.com (HELO ly-workstation) ([10.239.182.64])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 18:40:52 -0800
Date: Fri, 5 Dec 2025 10:40:49 +0800
From: "Lai, Yi" <yi1.lai@linux.intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Jonathan Corbet <corbet@lwn.net>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Justin Stitt <justinstitt@google.com>, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev, Bill Wendling <morbo@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Shuah Khan <shuah@kernel.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Will Deacon <will@kernel.org>, Alexey Kardashevskiy <aik@amd.com>,
	Alejandro Jimenez <alejandro.j.jimenez@oracle.com>,
	James Gowans <jgowans@amazon.com>,
	Kevin Tian <kevin.tian@intel.com>,
	Michael Roth <michael.roth@amd.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>, patches@lists.linux.dev,
	Samiullah Khawaja <skhawaja@google.com>,
	Vasant Hegde <vasant.hegde@amd.com>, yi1.lai@intel.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH v8 13/15] iommu/amd: Use the generic iommu page table
Message-ID: <aTJGMaqwQK0ASj0G@ly-workstation>
References: <0-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
 <13-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13-v8-d50aeee4481d+55efb-iommu_pt_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251204_184102_606465_B8179EFF 
X-CRM114-Status: GOOD (  11.98  )
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

Hi Alejandro Jimenez,

Greetings!

I used Syzkaller and found that there is WARNING in iommufd_fops_release in linux-next next-20251203.

After bisection and the first bad commit is:
"
789a5913b29c iommu/amd: Use the generic iommu page table
"

All detailed into can be found at:
https://github.com/laifryiee/syzkaller_logs/tree/main/251204_120805_iommufd_fops_release
Syzkaller repro code:
https://github.com/laifryiee/syzkaller_logs/tree/main/251204_120805_iommufd_fops_release/repro.c
Syzkaller repro syscall steps:
https://github.com/laifryiee/syzkaller_logs/tree/main/251204_120805_iommufd_fops_release/repro.prog
Syzkaller report:
https://github.com/laifryiee/syzkaller_logs/tree/main/251204_120805_iommufd_fops_release/repro.report
Kconfig(make olddefconfig):
https://github.com/laifryiee/syzkaller_logs/tree/main/251204_120805_iommufd_fops_release/kconfig_origin
Bisect info:
https://github.com/laifryiee/syzkaller_logs/tree/main/251204_120805_iommufd_fops_release/bisect_info.log
bzImage:
https://github.com/laifryiee/syzkaller_logs/raw/refs/heads/main/251204_120805_iommufd_fops_release/bzImage_b2c27842ba853508b0da00187a7508eb3a96c8f7
Issue dmesg:
https://github.com/laifryiee/syzkaller_logs/blob/main/251204_120805_iommufd_fops_release/b2c27842ba853508b0da00187a7508eb3a96c8f7_dmesg.log

"
[   26.277988] ------------[ cut here ]------------
[   26.278641] WARNING: drivers/iommu/iommufd/main.c:369 at iommufd_fops_release+0x385/0x430, CPU#1: repro/724
[   26.280106] Modules linked in:
[   26.280581] CPU: 1 UID: 0 PID: 724 Comm: repro Not tainted 6.18.0-next-20251203-b2c27842ba85 #1 PREEMPT(volun
[   26.281901] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS rel-1.16.0-0-gd239552ce722-prebuilt.q4
[   26.283453] RIP: 0010:iommufd_fops_release+0x385/0x430
[   26.284150] Code: 8b 45 d0 65 48 2b 05 82 16 78 05 75 7b 48 81 c4 88 00 00 00 31 c0 5b 41 5c 41 5d 41 5e 41 5e
[   26.286461] RSP: 0018:ffff8880202efba8 EFLAGS: 00010293
[   26.287290] RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffffffff83be6832
[   26.288207] RDX: ffff888019104b00 RSI: ffffffff83be69a5 RDI: 0000000000000005
[   26.289136] RBP: ffff8880202efc58 R08: 0000000000000001 R09: 0000000000000001
[   26.290045] R10: 0000000000000000 R11: ffff888019105998 R12: 0000000000000000
[   26.291071] R13: ffff888022d49008 R14: ffff8880202efbf0 R15: 0000000000000000
[   26.292002] FS:  0000000000000000(0000) GS:ffff8880e31c0000(0000) knlGS:0000000000000000
[   26.293036] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   26.293787] CR2: 00007fa6ab957000 CR3: 00000000138bb001 CR4: 0000000000770ef0
[   26.294815] PKRU: 55555554
[   26.295192] Call Trace:
[   26.295539]  <TASK>
[   26.295843]  ? locks_remove_file+0x3b4/0x5d0
[   26.296451]  ? __pfx_iommufd_fops_release+0x10/0x10
[   26.297104]  ? __sanitizer_cov_trace_const_cmp2+0x1c/0x30
[   26.297841]  ? evm_file_release+0x140/0x220
[   26.298439]  ? __pfx_iommufd_fops_release+0x10/0x10
[   26.299193]  __fput+0x41f/0xb70
[   26.299670]  ____fput+0x22/0x30
[   26.300113]  task_work_run+0x19e/0x2b0
[   26.300644]  ? __pfx_task_work_run+0x10/0x10
[   26.301229]  ? __sanitizer_cov_trace_const_cmp4+0x1a/0x20
[   26.301938]  ? switch_task_namespaces+0xdd/0x130
[   26.302579]  do_exit+0x8a3/0x28a0
[   26.303205]  ? do_group_exit+0x1d8/0x2c0
[   26.303745]  ? __pfx_do_exit+0x10/0x10
[   26.304256]  ? __this_cpu_preempt_check+0x21/0x30
[   26.304915]  ? _raw_spin_unlock_irq+0x2c/0x60
[   26.305515]  ? lockdep_hardirqs_on+0x85/0x110
[   26.306099]  ? _raw_spin_unlock_irq+0x2c/0x60
[   26.306796]  ? trace_hardirqs_on+0x26/0x130
[   26.307388]  do_group_exit+0xe4/0x2c0
[   26.307892]  __x64_sys_exit_group+0x4d/0x60
[   26.308460]  x64_sys_call+0x21a2/0x21b0
[   26.308993]  do_syscall_64+0x6d/0x1180
[   26.309509]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   26.310174] RIP: 0033:0x7fa6ab718a4d
[   26.310680] Code: Unable to access opcode bytes at 0x7fa6ab718a23.
[   26.311595] RSP: 002b:00007ffdeee343f8 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
[   26.312569] RAX: ffffffffffffffda RBX: 00007fa6ab7f69e0 RCX: 00007fa6ab718a4d
[   26.313498] RDX: 00000000000000e7 RSI: ffffffffffffff80 RDI: 0000000000000000
[   26.314442] RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000020
[   26.315466] R10: 00007ffdeee342a0 R11: 0000000000000246 R12: 00007fa6ab7f69e0
[   26.316385] R13: 00007fa6ab7fbf00 R14: 0000000000000001 R15: 00007fa6ab7fbee8
[   26.317323]  </TASK>
[   26.317642] irq event stamp: 2083
[   26.318092] hardirqs last  enabled at (2091): [<ffffffff81666d75>] __up_console_sem+0x95/0xb0
[   26.319467] hardirqs last disabled at (2214): [<ffffffff81666d5a>] __up_console_sem+0x7a/0xb0
[   26.320566] softirqs last  enabled at (2212): [<ffffffff8148a2fe>] __irq_exit_rcu+0x10e/0x170
[   26.321679] softirqs last disabled at (2099): [<ffffffff8148a2fe>] __irq_exit_rcu+0x10e/0x170
[   26.322880] ---[ end trace 0000000000000000 ]---
"

Hope this cound be insightful to you.

Regards,
Yi Lai

---

If you don't need the following environment to reproduce the problem or if you
already have one reproduced environment, please ignore the following information.

How to reproduce:
git clone https://gitlab.com/xupengfe/repro_vm_env.git
cd repro_vm_env
tar -xvf repro_vm_env.tar.gz
cd repro_vm_env; ./start3.sh  // it needs qemu-system-x86_64 and I used v7.1.0
  // start3.sh will load bzImage_2241ab53cbb5cdb08a6b2d4688feb13971058f65 v6.2-rc5 kernel
  // You could change the bzImage_xxx as you want
  // Maybe you need to remove line "-drive if=pflash,format=raw,readonly=on,file=./OVMF_CODE.fd \" for different qemu version
You could use below command to log in, there is no password for root.
ssh -p 10023 root@localhost

After login vm(virtual machine) successfully, you could transfer reproduced
binary to the vm by below way, and reproduce the problem in vm:
gcc -pthread -o repro repro.c
scp -P 10023 repro root@localhost:/root/

Get the bzImage for target kernel:
Please use target kconfig and copy it to kernel_src/.config
make olddefconfig
make -jx bzImage           //x should equal or less than cpu num your pc has

Fill the bzImage file into above start3.sh to load the target kernel in vm.


Tips:
If you already have qemu-system-x86_64, please ignore below info.
If you want to install qemu v7.1.0 version:
git clone https://github.com/qemu/qemu.git
cd qemu
git checkout -f v7.1.0
mkdir build
cd build
yum install -y ninja-build.x86_64
yum -y install libslirp-devel.x86_64
../configure --target-list=x86_64-softmmu --enable-kvm --enable-vnc --enable-gtk --enable-sdl --enable-usb-redir --enable-slirp
make
make install 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
