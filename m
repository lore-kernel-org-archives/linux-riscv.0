Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6A5C47DD9
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 03:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=58ZcpU7pHH+ll+PFzLyZxkgBpKcPbBRMEPBT/Z3Pm8U=; b=1JqO49oBeMAzpX
	H5eX8jXIelDNAiuQC1aFJJ4JXPeE07Vn3o5rRJDvGAF0YYT8yM+DafcqS1LHudoYj0u8ZcRn4HIB7
	xJhzhf2+lcSeJMX94Vn1FKpnCx5PBTa9Z/V7+ikWIjQthTAJlCsVcCYFNgMGacNJA8KZMqayG9fZ3
	AfXFz0jKrvvYdqayavP4kaXuguOXHI5ciFxyqcdhAgWajVtIm2LGTcrbjAz+Yrfc/azyMcJTGtAs8
	cDfKE7dIUvoFy0mpae1eayO6FCjCTLa+99W+tT8CS4Am7oNM3aCPEgSTPgH/tAGKm46HmVRR/x+xU
	n4p2f1Lw5VSG96q0BZZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpgJa-0000000CFlP-0B7Y;
	Thu, 28 Mar 2024 03:20:30 +0000
Received: from zg8tmja5ljk3lje4ms43mwaa.icoremail.net ([209.97.181.73])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpgJT-0000000CFha-2S1Y;
	Thu, 28 Mar 2024 03:20:26 +0000
Received: from localhost.localdomain (unknown [10.12.130.31])
	by app1 (Coremail) with SMTP id TAJkCgDniOWq4QRmwD8DAA--.28501S4;
	Thu, 28 Mar 2024 11:19:07 +0800 (CST)
From: Shenlin Liang <liangshenlin@eswincomputing.com>
To: anup@brainfault.org,
	atishp@atishpatra.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	linux-perf-users@vger.kernel.org
Cc: Shenlin Liang <liangshenlin@eswincomputing.com>
Subject: [PATCH 0/2] perf kvm: Add kvm stat support on riscv 
Date: Thu, 28 Mar 2024 03:12:18 +0000
Message-Id: <20240328031220.1287-1-liangshenlin@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: TAJkCgDniOWq4QRmwD8DAA--.28501S4
X-Coremail-Antispam: 1UD129KBjvJXoW7urWUGrykZr47XF4UZFWxXrb_yoW8KFyUpa
	y2krn0kws5tFy3Krs3C3WDWrWruws7ur1aqryIyrWUC3y0vryDXF1kKr9FyrZ8JF1UtrWk
	AF1Dur1rKrW5JaUanT9S1TB71UUUUUJqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUPl14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1ln4kS14v26r1Y6r17M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1Y6r17McIj6I8E87Iv67AKxVW8JVWxJwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS14v26r126r1DMxkIecxEwVCm-wCF04
	k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7km07C267AKxVWUAVWUtwC2
	0s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI
	0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUCVW8JwCI42IY6xIIjxv2
	0xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2js
	IE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZF
	pf9x0JUxMa5UUUUU=
X-CM-SenderInfo: xold0whvkh0z1lq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_202023_972309_D81C432B 
X-CRM114-Status: UNSURE (   8.20  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

'perf kvm stat report/record' generates a statistical analysis of KVM
events and can be used to analyze guest exit reasons. This patch tries
to add stat support on riscv.

Map the return value of trace_kvm_exit() to the specific cause of the 
exception, and export it to userspace.

It records on two available KVM tracepoints for riscv: "kvm:kvm_entry"
and "kvm:kvm_exit", and reports statistical data which includes events
handles time, samples, and so on.

Simple tests go below:

# ./perf kvm record -e "kvm:kvm_entry" -e "kvm:kvm_exit"
Lowering default frequency rate from 4000 to 2500.
Please consider tweaking /proc/sys/kernel/perf_event_max_sample_rate.
[ perf record: Woken up 18 times to write data ]
[ perf record: Captured and wrote 5.433 MB perf.data.guest (62519 samples) 

# ./perf kvm report
31K kvm:kvm_entry
31K kvm:kvm_exit

# ./perf kvm stat record -a
[ perf record: Woken up 3 times to write data ]
[ perf record: Captured and wrote 8.502 MB perf.data.guest (99338 samples) ]

# ./perf kvm stat report --event=vmexit
Event name                Samples   Sample%    Time (ns)     Time%   Max Time (ns)   Min Time (ns)  Mean Time (ns)
STORE_GUEST_PAGE_FAULT     26968     54.00%    2003031800    40.00%     3361400         27600          74274
LOAD_GUEST_PAGE_FAULT      17645     35.00%    1153338100    23.00%     2513400         30800          65363
VIRTUAL_INST_FAULT         1247      2.00%     340820800     6.00%      1190800         43300          273312
INST_GUEST_PAGE_FAULT      1128      2.00%     340645800     6.00%      2123200         30200          301990
SUPERVISOR_SYSCALL         1019      2.00%     245989900     4.00%      1851500         29300          241403
LOAD_ACCESS                986       1.00%     671556200     13.00%     4180200         100700         681091
INST_ACCESS                655       1.00%     170054800     3.00%      1808300         54600          259625
HYPERVISOR_SYSCALL         21        0.00%     4276400       0.00%      716500          116000         203638 

Shenlin Liang (2):
  RISCV: KVM: add tracepoints for entry and exit events
  perf kvm/riscv: Port perf kvm stat to RISC-V

 arch/riscv/kvm/trace_riscv.h                  | 60 ++++++++++++++
 arch/riscv/kvm/vcpu.c                         |  7 ++
 tools/perf/arch/riscv/Makefile                |  1 +
 tools/perf/arch/riscv/util/Build              |  1 +
 tools/perf/arch/riscv/util/kvm-stat.c         | 78 +++++++++++++++++++
 .../arch/riscv/util/riscv_exception_types.h   | 41 ++++++++++
 6 files changed, 188 insertions(+)
 create mode 100644 arch/riscv/kvm/trace_riscv.h
 create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
 create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
