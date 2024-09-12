Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE458EE645D
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xCZGVX55Xwe9XpEEXVnpGNAuPPkZV9YBCCieNgSk0Wc=; b=SRZzPrYPEIxmlu
	Mj60r3fNYgWB1jI8JzbZXvDQJRYGCpOdRL1q72AgjQOg1Ze7ymb0ygY1ritHQgDxpZDdQ8dXqEdV4
	6mJ5Pabk1/swWZwWarNMJhy/Fym4578zEe2O8goSGI9aMcyWivLyrpx404owx+PCtE6TSYjiGrJJT
	ZqMwVBl7QDXIyevphxxrEBZQpgfrnhg2Edyk6sCNtjbqKs5hsVNTEQ6CMoJfGVSkMemlHkEkR8kMk
	W1mV4HyebyYJn0fVJAX7Sth+GjmrqDFx63QgTUygxN8BxrsnGYuBtfXkEeMWK733UvLr/MmWeLY7Y
	qVo7qLrM9hIfZAPUWtOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soelH-0000000CHlp-0MVc;
	Thu, 12 Sep 2024 08:01:07 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soeku-0000000CHeg-2wTd;
	Thu, 12 Sep 2024 08:00:47 +0000
Received: from zq-Legion-Y7000.. (unknown [180.111.103.6])
	by APP-01 (Coremail) with SMTP id qwCowACn_aqUn+Jm+Fn9Ag--.7302S2;
	Thu, 12 Sep 2024 16:00:21 +0800 (CST)
From: zhouquan@iscas.ac.cn
To: anup@brainfault.org,
	ajones@ventanamicro.com,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v3 0/2] riscv: Add perf support to collect KVM guest statistics from host side
Date: Thu, 12 Sep 2024 16:00:18 +0800
Message-Id: <cover.1726126795.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: qwCowACn_aqUn+Jm+Fn9Ag--.7302S2
X-Coremail-Antispam: 1UD129KBjvJXoWxuw1xJw15CF13uryDCF45KFg_yoW7Gw4fpr
	sxCrsxtr4rAryxXw1Svr1Y9ry5J397XrnxGrnxJ3yrAr4jvaykXwn2gr1xZ3y0qrykKryr
	Xw1vqFy2kas8AFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9E14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUAVWUtwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VU1x9NDUUUUU==
X-Originating-IP: [180.111.103.6]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiCQ4SBmbifb98twABsf
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_010045_156227_41EF3479 
X-CRM114-Status: UNSURE (   8.74  )
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

From: Quan Zhou <zhouquan@iscas.ac.cn>

Add basic guest support to RISC-V perf, enabling it to distinguish
whether PMU interrupts occur in the host or the guest, and then
collect some basic guest information from the host side
(guest os callchain is not supported for now).

Based on the x86/arm implementation, tested with kvm-riscv.
test env:
- host: qemu-9.0.0
- guest: qemu-9.0.0 --enable-kvm (only start one guest and run top)

-----------------------------------------
1) perf kvm top
./perf kvm --host --guest \
  --guestkallsyms=/root/repo/shared/kallsyms \
  --guestmodules=/root/repo/shared/modules top

PerfTop:      41 irqs/sec  kernel:97.6% us: 0.0% guest kernel: 0.0% guest us: 0.0% exact:  0.0% [250Hz cycles:P],  (all, 4 CPUs)
-------------------------------------------------------------------------------

    64.57%  [kernel]        [k] default_idle_call
     3.12%  [kernel]        [k] _raw_spin_unlock_irqrestore
     3.03%  [guest.kernel]  [g] mem_serial_out
     2.61%  [kernel]        [k] handle_softirqs
     2.32%  [kernel]        [k] do_trap_ecall_u
     1.71%  [kernel]        [k] _raw_spin_unlock_irq
     1.26%  [guest.kernel]  [g] do_raw_spin_lock
     1.25%  [kernel]        [k] finish_task_switch.isra.0
     1.16%  [kernel]        [k] do_idle
     0.77%  libc.so.6       [.] ioctl
     0.76%  [kernel]        [k] queue_work_on
     0.69%  [kernel]        [k] __local_bh_enable_ip
     0.67%  [guest.kernel]  [g] __noinstr_text_start
     0.64%  [guest.kernel]  [g] mem_serial_in
     0.41%  libc.so.6       [.] pthread_sigmask
     0.39%  [kernel]        [k] mem_cgroup_uncharge_skmem
     0.39%  [kernel]        [k] __might_resched
     0.39%  [guest.kernel]  [g] _nohz_idle_balance.isra.0
     0.37%  [kernel]        [k] sched_balance_update_blocked_averages
     0.34%  [kernel]        [k] sched_balance_rq

2) perf kvm record
./perf kvm --host --guest \
  --guestkallsyms=/root/repo/shared/kallsyms \
  --guestmodules=/root/repo/shared/modules record -a sleep 60

[ perf record: Woken up 3 times to write data ]
[ perf record: Captured and wrote 1.292 MB perf.data.kvm (17990 samples) ]

3) perf kvm report (the data shown here is not complete)
./perf kvm --host --guest \
  --guestkallsyms=/root/repo/shared/kallsyms \
  --guestmodules=/root/repo/shared/modules report -i perf.data.kvm

# Total Lost Samples: 0
#
# Samples: 17K of event 'cycles:P'
# Event count (approx.): 269968947184
#
# Overhead  Command          Shared Object            Symbol                                        
# ........  ...............  .......................  ..............................................
#
    61.86%  swapper          [kernel.kallsyms]        [k] default_idle_call
     2.93%  :6463            [guest.kernel.kallsyms]  [g] do_raw_spin_lock
     2.82%  :6462            [guest.kernel.kallsyms]  [g] mem_serial_out
     2.11%  sshd             [kernel.kallsyms]        [k] _raw_spin_unlock_irqrestore
     1.78%  :6462            [guest.kernel.kallsyms]  [g] do_raw_spin_lock
     1.37%  swapper          [kernel.kallsyms]        [k] handle_softirqs
     1.36%  swapper          [kernel.kallsyms]        [k] do_idle
     1.21%  sshd             [kernel.kallsyms]        [k] do_trap_ecall_u
     1.21%  sshd             [kernel.kallsyms]        [k] _raw_spin_unlock_irq
     1.11%  qemu-system-ris  [kernel.kallsyms]        [k] do_trap_ecall_u
     0.93%  qemu-system-ris  libc.so.6                [.] ioctl
     0.89%  sshd             [kernel.kallsyms]        [k] __local_bh_enable_ip
     0.77%  qemu-system-ris  [kernel.kallsyms]        [k] _raw_spin_unlock_irqrestore
     0.68%  qemu-system-ris  [kernel.kallsyms]        [k] queue_work_on
     0.65%  sshd             [kernel.kallsyms]        [k] handle_softirqs
     0.44%  :6462            [guest.kernel.kallsyms]  [g] mem_serial_in
     0.42%  sshd             libc.so.6                [.] pthread_sigmask
     0.34%  :6462            [guest.kernel.kallsyms]  [g] serial8250_tx_chars
     0.30%  swapper          [kernel.kallsyms]        [k] finish_task_switch.isra.0
     0.29%  swapper          [kernel.kallsyms]        [k] sched_balance_rq
     0.29%  sshd             [kernel.kallsyms]        [k] __might_resched
     0.26%  swapper          [kernel.kallsyms]        [k] tick_nohz_idle_exit
     0.26%  swapper          [kernel.kallsyms]        [k] sched_balance_update_blocked_averages
     0.26%  swapper          [kernel.kallsyms]        [k] _nohz_idle_balance.isra.0
     0.24%  qemu-system-ris  [kernel.kallsyms]        [k] finish_task_switch.isra.0
     0.23%  :6462            [guest.kernel.kallsyms]  [g] __noinstr_text_start
     
---
Change since v2:
- Rebased on v6.11-rc7
- Keep the misc type consistent with other architectures
  as `unsigned long` (Andrew)
- Add the same comment for `kvm_arch_pmi_in_guest`
  as in arm64. (Andrew)

Change since v1:
- Rebased on v6.11-rc3
- Fix incorrect misc type (Andrew)

---
v1 link:
https://lore.kernel.org/all/cover.1721271251.git.zhouquan@iscas.ac.cn/
v2 link:
https://lore.kernel.org/all/cover.1723518282.git.zhouquan@iscas.ac.cn/

Quan Zhou (2):
  riscv: perf: add guest vs host distinction
  riscv: KVM: add basic support for host vs guest profiling

 arch/riscv/include/asm/kvm_host.h   | 10 ++++++++
 arch/riscv/include/asm/perf_event.h |  7 ++++++
 arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
 arch/riscv/kvm/Kconfig              |  1 +
 arch/riscv/kvm/main.c               | 12 +++++++--
 arch/riscv/kvm/vcpu.c               |  7 ++++++
 6 files changed, 73 insertions(+), 2 deletions(-)


base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
