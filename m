Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9F9C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 13:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iSaz5SZYtF+XldokIjiqgzJLeSvVI06QFEFFAepMCKc=; b=vNL11G9V68I0DW
	VNdNlpQARzf1ni51L900kJzqs3qck9MG93Wg9dZY5N70ggK45EGj01otFoK2+LGj8SURHW+vuKURW
	iaP95347msCaVwEEvZYeptvFB3zhp+OOxsBWpr/h62mgsRNIHQv2ldp9/jClEcKV1UFA9/M4erP8C
	3q5FGBkl7A0q3+/+meQS+dgH/5TrFDN8SfxILTwwFLopGlRAUNj8N3ZUs7cuBVf/Ah6ZIBfz2QNUK
	YyZ28dCA3WEKVcwY05zYptfAuJrbpwxnjVCAu5Pfo/ODXNOPGvNPKG5ZwPNVrsJVoQa9XHRwpxuEM
	AQdlhv9/6EeXNhg+wwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrVE-00000003qoH-1VMg;
	Tue, 13 Aug 2024 13:23:56 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdrVA-00000003qnT-3ieJ;
	Tue, 13 Aug 2024 13:23:55 +0000
Received: from ThinkPad-T480s.. (unknown [121.237.44.107])
	by APP-03 (Coremail) with SMTP id rQCowACHKRlVXrtm7WsLBg--.54503S2;
	Tue, 13 Aug 2024 21:23:34 +0800 (CST)
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
Subject: [PATCH v2 0/2] riscv: Add perf support to collect KVM guest statistics from host side
Date: Tue, 13 Aug 2024 21:23:33 +0800
Message-Id: <cover.1723518282.git.zhouquan@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowACHKRlVXrtm7WsLBg--.54503S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJw17AFy7Gr4UGF1rCr1xKrg_yoWrKF1Dpr
	43Cr43tF4rAryIqw1Ivr1Y9ryUJ397XrnxGrnxJw4rAr4jvaykXwn2gr1xZ3y0qrykKryr
	Xw1vqFy2kas0yFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUBG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Cr0_Gr1UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lw4CEc2x0rVAKj4xxMxkF7I0En4kS14v26r1q6r43MxkIecxEwVAFwVW5Gw
	CF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j
	6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64
	vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0x
	vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUkkuxUUUUU=
X-Originating-IP: [121.237.44.107]
X-CM-SenderInfo: 52kr31xxdqqxpvfd2hldfou0/1tbiBwwIBma7QjdI8QAAsU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_062353_318842_96E2366C 
X-CRM114-Status: UNSURE (   7.96  )
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
Change since v1:
- Rebased on v6.11-rc3
- Fix incorrect misc type (Andrew)

---
v1 link:
https://lore.kernel.org/all/cover.1721271251.git.zhouquan@iscas.ac.cn/

Quan Zhou (2):
  riscv: perf: add guest vs host distinction
  riscv: KVM: add basic support for host vs guest profiling

 arch/riscv/include/asm/kvm_host.h   |  5 ++++
 arch/riscv/include/asm/perf_event.h |  7 ++++++
 arch/riscv/kernel/perf_callchain.c  | 38 +++++++++++++++++++++++++++++
 arch/riscv/kvm/Kconfig              |  1 +
 arch/riscv/kvm/main.c               | 12 +++++++--
 arch/riscv/kvm/vcpu.c               |  7 ++++++
 6 files changed, 68 insertions(+), 2 deletions(-)


base-commit: 7c626ce4bae1ac14f60076d00eafe71af30450ba
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
