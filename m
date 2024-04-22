Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED8BC10F16
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Apr 2024 08:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HHwMGLubrY2Z3w93q3oKabQhJ8MN6Fekm8YcccWRUSM=; b=etGnaSLBUS0rEF
	S81BMxoILE/4crit+be+srfNMUTysdkHzJ40ln+VXl9mPOGMeYyf0YmvB7EbUseilu/dS8RiRZjl5
	0akBLLXrsHLz3Zpf0GjlLnA1BPf2Q0Oq+sZwBP8TVtcaWKeZ+MhKLivtwZOGTxcLRSb/1h+FdMjkz
	27u8njHb5/WVbKWThN+KsBh3e//0jK6Rqy/dp8b3/Jja2uOPe6h9lEkkLpy9JdQc0juP9O69T0Smi
	iWeK54QDTvu1YWf3/OONzjuB9xxh5IRHlqX6B3wABVZD/Z2k2inyzXfD+P/r/zXBpVA324GCJiTvk
	SZWh+R3JUuHoFjlVTAXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryonZ-0000000CaTu-0u89;
	Mon, 22 Apr 2024 08:13:13 +0000
Received: from azure-sdnproxy.icoremail.net ([52.237.72.81])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryonV-0000000CaSC-0gRf;
	Mon, 22 Apr 2024 08:13:11 +0000
Received: from localhost.localdomain (unknown [10.12.130.31])
	by app1 (Coremail) with SMTP id TAJkCgBH6OSeGyZmSBIIAA--.61881S4;
	Mon, 22 Apr 2024 16:11:11 +0800 (CST)
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
Subject: [PATCH v3 0/2] perf kvm: Add kvm stat support on riscv
Date: Mon, 22 Apr 2024 08:08:31 +0000
Message-Id: <20240422080833.8745-1-liangshenlin@eswincomputing.com>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: TAJkCgBH6OSeGyZmSBIIAA--.61881S4
X-Coremail-Antispam: 1UD129KBjvJXoWxZr1fZF4ftF4fXF18Aw17trb_yoW5XryrpF
	W2krn8Kw4rtFy3Kws3C3WDWrWrCw4xCry5tr1Iyryj93yj9ryDJ3Z7Kr9Fk398AF17tFWk
	CFn8ur1rGrW3JF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvm14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
	4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
	67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
	x0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2
	z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnU
	UI43ZEXa7VUbQVy7UUUUU==
X-CM-SenderInfo: xold0whvkh0z1lq6v25zlqu0xpsx3x1qjou0bp/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_011309_764281_98F5522C 
X-CRM114-Status: GOOD (  10.32  )
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

Cross compiling perf in X86 environment may encounter issues with missing
libraries and tools. Suggest compiling nativly in RISC-V environment

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

Changes from v1->v2:
- Rebased on Linux 6.9-rc3.

Changes from v2->v3:
- Add the missing assignment for 'vcpu_id_str' in patch 2.
- Remove parentheses that cause compilation errors

Shenlin Liang (2):
  RISCV: KVM: add tracepoints for entry and exit events
  perf kvm/riscv: Port perf kvm stat to RISC-V

 arch/riscv/kvm/trace.h                        | 67 ++++++++++++++++
 arch/riscv/kvm/vcpu.c                         |  7 ++
 tools/perf/arch/riscv/Makefile                |  1 +
 tools/perf/arch/riscv/util/Build              |  1 +
 tools/perf/arch/riscv/util/kvm-stat.c         | 79 +++++++++++++++++++
 .../arch/riscv/util/riscv_exception_types.h   | 35 ++++++++
 6 files changed, 190 insertions(+)
 create mode 100644 arch/riscv/kvm/trace.h
 create mode 100644 tools/perf/arch/riscv/util/kvm-stat.c
 create mode 100644 tools/perf/arch/riscv/util/riscv_exception_types.h

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
