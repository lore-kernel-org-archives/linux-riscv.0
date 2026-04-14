Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5205DF531EA
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Apr 2026 03:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z7wxi/GyevrSlt6tLEuPEzZN5/9CHNDbx46h5h9AsFo=; b=wUYDPhrUw3ior1
	oWQdFwxqRDyEWD/KErEykapmya33pw/eTkL9TNaWRNFM0tlAUQW+6kIdyMbIcG/wbeH6J4WaYV5Zi
	z3o/nxk6MsYfRrBZlCrr/JJE9SK4nFdLjn2yY6To3fDnsr7uGZCkUA9suAO7NzsUQXihzUFP0I92s
	besIyvwUVy/IDZph62Pq659WDERmi95cu5pIT4nJFr0tcizXKay+MgDXwYEgHJDhFY9V4tI6oRVjj
	oe/KywLoHLpkZT01X4saquNF1/V7dpCSUvw0D1l/0ETJ9jZcnphQob6MsJYw+GNg9AAslWs1JMQFG
	tBteZVyKnv71eqWJTQEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUiO-0000000Gfi9-1o1p;
	Tue, 14 Apr 2026 03:45:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUiM-0000000Gfh9-32ze
	for linux-riscv@bombadil.infradead.org;
	Tue, 14 Apr 2026 03:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=yX80mvVMbu07IXgMrxN3RxPPX84i9uLc6rmZMDEMLlo=; b=YwH6Ssh2WI3qZN0kzDpYfE70Vw
	pmYsAawjbd5HyFD37d9uCn2p2sD14cnRIwvb8DAuTnWZdZpK2C4a/uRrrCBFCrUAOEpHG4rt4OeH+
	SBZ0JMgIq5XO/3x2LT3gYuQjn5RpOGiKdAX0OFg16vWjOB27hGSRwxe6I1vs6BB4wO5E8bMtSS5bW
	3UrT5mq6Zob8MRDxw7akr32ZZyZlWoNmnPx/N1vXQl9sU5n8bu/BlubHFPIkmNEYvvDJ7tFuXIv+C
	qdDagslhamjPzfBWSaLVPK0FGD/QDsNxIkyp2ko6vsj/l1OVx3aZtvwRfhjtjhbE90e5s3lRsy+SU
	ZmdfMaKQ==;
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCUhz-00000000DZr-2fXT
	for linux-riscv@lists.infradead.org;
	Tue, 14 Apr 2026 03:45:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1776138240;
	bh=yX80mvVMbu07IXgMrxN3RxPPX84i9uLc6rmZMDEMLlo=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=W5hn1FtH616Vt7spswP/on1XqhOrkJnx+VbitojLqjrapW9ftpwqUQzpjPSn8qJ4y
	 9F1LFw8XaMAtsIZG4FT0pqYk+aw537xO+daRTzigC0WJpAI5AWhyEKOAp9EOIG2VlD
	 VYJD58DREf/BATV8Qc+ZOs/HMoXwb3CpbK4bUSDU=
X-QQ-mid: zesmtpsz5t1776138160te2bc3a15
X-QQ-Originating-IP: 8/PK67r88G8NLwhW58xcwFuNcrIEYpLgHOTHAOtmoaI=
Received: from snode5.. ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 14 Apr 2026 11:42:38 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 17905651787328883968
EX-QQ-RecipientCnt: 26
From: Zane Leung <liangzhen@linux.spacemit.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	gregkh@linuxfoundation.org,
	alexander.shishkin@linux.intel.com,
	irogers@google.com
Cc: coresight@lists.linaro.org,
	peterz@infradead.org,
	mingo@redhat.com,
	namhyung@kernel.org,
	mark.rutland@arm.com,
	jolsa@kernel.org,
	adrian.hunter@intel.com,
	kan.liang@linux.intel.com,
	mchitale@gmail.com,
	anup@brainfault.org,
	atish.patra@linux.dev,
	andrew.jones@oss.qualcomm.com,
	sunilvl@oss.qualcomm.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	anup.patel@oss.qualcomm.com,
	mayuresh.chitale@oss.qualcomm.com,
	zhuangqiubin@linux.spacemit.com
Subject: [RFC PATCH 12/12] perf tools: Integrate RISC-V trace decoder into auxtrace
Date: Tue, 14 Apr 2026 11:41:53 +0800
Message-Id: <20260414034153.3272485-13-liangzhen@linux.spacemit.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
References: <20260414034153.3272485-1-liangzhen@linux.spacemit.com>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz6b-0
X-QQ-XMAILINFO: MC1elDYyBjqSGlHp1rfdXYI13Fw9w1URJR6tTCuKd9AnW3lblSoEbi8Y
	SYjms5DDKcg48eOFhwcLMziDOncuU3koEaIfaV9M7UcgkI1Uq/LYAXsgadojy+0wp1GEG79
	KO3VONgid3y25ofjNZEvaGBh4fcG0WrfT2RN8GQDSLr57oh54X3PdVrW9lkElAQf4QppHQJ
	bVzcb+HeGQcc5xXrLAHdQVmeix7SdnyyLNDqqjKebXGjIXk2Jv/xJj0e7PutVsQ/qfD/t5u
	WdgDR4eID++cJ7qbVLUTU11qooCGlNq4IKGqA9L8nUtAemg6gBt2bpkjnYLW68i4D/ZNyNu
	HPgberqTYvfg9Icga1VWyKTO/kuHPpRYhfaZswmc3kvoo9Ok6fLzLRe0q7oNCn5R4kxxTco
	W16Oljy7uiozKQfmfoysVeT69aJGZ6wIGz8+Y8En9/Mh0snsfIL5Q7OjOKpbAgZQNSlq41n
	7eT72xAAec6T0RglPUgs07YEauc5moVHnWXAvHvg7mBfTqtkXhU2sfe9LW2cVhXlWvysl3M
	2xHkK6vkqJiiPoB+mV1xkJrnkahOhrnrJO//aAmztp4utg5ISfR1f6GFJrjDzmEApGV0PTX
	3snLI2TBNFupkbJNom5SM4ywziz4Rf46IZ25SJtxs33eO4NsjrnzKNjLmSn1LxZM0+OANBt
	sj09sokzF8IWV6+xEVVZ5jiDHIUWSef8wx13OHWrodf8Q8dvkEOwYmsDZMRYXU0f7dt+xVF
	LcUc0CAiJ3qjexuMsJR5xu2TVXkcbpG1IOyngUzumO1NElneA8o9KPSeDEBdSQEvNxoTGOT
	OjSVssr1K+7qRtBj/w6/KqfnL4DVqGszxOkRP35D93MmpHYwlw9BRnZ+UiBSlsOIjN4on2v
	vkgq9vcDY7WL8Ae4hGZrnymrtDbrIHJIpLRrq791vYBNTUFvy35zm3Ho6K9piFTtW/T6lS8
	8spHLwPSnw8ZKwIZ4qaEUjddEzL8f+wiAEPZ9QT274Q+V7lp6EkvhfMjgiLUrdffGMXXOwq
	Ezmo7aH+sDaYCgKg0PyWV8r9hffyW1a/WMN7sB+NJO9wKJWrK/Cb3C7g+mHtSiuhP19EOu3
	30wHD6ifT+N+8IltWaBu0OjBDljGdZgGcWXINBuPYzvF2Kig7iYFrTRgZ7iqZCi2+z5GwND
	PVyD
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_044507_384323_D772CFA9 
X-CRM114-Status: GOOD (  25.67  )
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

From: liangzhen <zhen.liang@spacemit.com>

Add RISC-V trace decoder implementation and integrate it into perf's
auxtrace infrastructure. This enables processing of RISC-V Nexus trace
data through the standard perf auxtrace pipeline.

Signed-off-by: liangzhen <zhen.liang@spacemit.com>
---
 tools/perf/util/Build             |    1 +
 tools/perf/util/auxtrace.c        |    3 +
 tools/perf/util/rvtrace-decoder.c | 1039 +++++++++++++++++++++++++++++
 tools/perf/util/rvtrace.h         |    2 +
 4 files changed, 1045 insertions(+)
 create mode 100644 tools/perf/util/rvtrace-decoder.c

diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 648a8552df9e..5913eec9b847 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -148,6 +148,7 @@ perf-util-y += cs-etm-decoder/
 endif
 perf-util-y += cs-etm-base.o
 
+perf-util-y += rvtrace-decoder.o
 perf-util-y += nexus-rv-decoder/
 
 perf-util-y += parse-branch-options.o
diff --git a/tools/perf/util/auxtrace.c b/tools/perf/util/auxtrace.c
index 944a43d48739..7539252a4543 100644
--- a/tools/perf/util/auxtrace.c
+++ b/tools/perf/util/auxtrace.c
@@ -56,6 +56,7 @@
 #include "s390-cpumsf.h"
 #include "util/mmap.h"
 #include "powerpc-vpadtl.h"
+#include "rvtrace.h"
 
 #include <linux/ctype.h>
 #include "symbol/kallsyms.h"
@@ -1412,6 +1413,8 @@ int perf_event__process_auxtrace_info(const struct perf_tool *tool __maybe_unuse
 		err = powerpc_vpadtl_process_auxtrace_info(event, session);
 		break;
 	case PERF_AUXTRACE_RISCV_TRACE:
+		err = rvtrace_process_auxtrace_info(event, session);
+		break;
 	case PERF_AUXTRACE_UNKNOWN:
 	default:
 		return -EINVAL;
diff --git a/tools/perf/util/rvtrace-decoder.c b/tools/perf/util/rvtrace-decoder.c
new file mode 100644
index 000000000000..ce103783d0c3
--- /dev/null
+++ b/tools/perf/util/rvtrace-decoder.c
@@ -0,0 +1,1039 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright(C) 2026 Spacemit Limited. All rights reserved.
+ * Author: liangzhen <zhen.liang@spacemit.com>
+ */
+
+#include <linux/bitops.h>
+#include <linux/err.h>
+#include <linux/kernel.h>
+#include <linux/log2.h>
+#include <linux/types.h>
+#include <sys/mman.h>
+
+#include <stdlib.h>
+
+#include "auxtrace.h"
+#include "color.h"
+#include "debug.h"
+#include "evlist.h"
+#include "intlist.h"
+#include "machine.h"
+#include "map.h"
+#include "perf.h"
+#include "session.h"
+#include "tool.h"
+#include "thread.h"
+#include "thread_map.h"
+#include "thread-stack.h"
+#include "util.h"
+#include "dso.h"
+#include "addr_location.h"
+#include <inttypes.h>
+#include "util/synthetic-events.h"
+#include "rvtrace.h"
+#include "nexus-rv-decoder/nexus-rv-decoder.h"
+#include "../../arch/riscv/include/asm/insn.h"
+
+struct rvtrace_auxtrace {
+	struct auxtrace auxtrace;
+	struct auxtrace_queues queues;
+	struct auxtrace_heap heap;
+	struct itrace_synth_opts synth_opts;
+	struct perf_session *session;
+	struct machine *machine;
+
+	u8 timeless_decoding;
+	u8 snapshot_mode;
+	u8 data_queued;
+
+	int num_cpu;
+	u64 latest_kernel_timestamp;
+	u32 auxtrace_type;
+	u64 branches_sample_type;
+	u64 branches_id;
+	u64 **metadata;
+	unsigned int pmu_type;
+};
+
+struct rvtrace_queue {
+	struct rvtrace_auxtrace *rvtrace;
+	struct thread *thread;
+	struct nexus_rv_insn_decoder *decoder;
+	struct auxtrace_buffer *buffer;
+	union perf_event *event_buf;
+	unsigned int queue_nr;
+	u64 offset;
+};
+
+static void rvtrace_set_thread(struct rvtrace_queue *rvtraceq,
+			       pid_t tid)
+{
+	struct rvtrace_auxtrace *rvtrace = rvtraceq->rvtrace;
+
+	if (tid != -1) {
+		thread__zput(rvtraceq->thread);
+		rvtraceq->thread = machine__find_thread(rvtrace->machine, -1, tid);
+	}
+
+	/* Couldn't find a known thread */
+	if (!rvtraceq->thread)
+		rvtraceq->thread = machine__idle_thread(rvtrace->machine);
+}
+
+static u32 rvtrace_devmem_access(u64 address, size_t size, u8 *buffer)
+{
+	int fd;
+	void *map_base, *virt_addr;
+	u64 page_size = 4096, mapped_size = 4096;
+	u64 page_base = address & ~(page_size - 1);
+	u64 offset_in_page = address - page_base;
+	unsigned int width = 8 * size;
+
+	if (offset_in_page + width > page_size)
+		mapped_size *= 2;
+
+	fd = open("/dev/mem", O_RDONLY | O_SYNC);
+	if (fd < 0)
+		return 0;
+
+	map_base = mmap(NULL, mapped_size, PROT_READ, MAP_SHARED, fd, (off_t)(page_base));
+	if (map_base == MAP_FAILED) {
+		pr_debug("failed to mmap device address 0x%lx\n", address);
+		close(fd);
+		return 0;
+	}
+
+	virt_addr = (char *)map_base + offset_in_page;
+
+	/*
+	 * Note: higher versions of glibc use automatic vectorization by
+	 * default for memcpy, which can lead to incorrect memory results.
+	 */
+	/* memcpy(buffer, virt_addr, size); */
+	for (size_t i = 0; i < size; i++)
+		buffer[i] = ((volatile u8 *)virt_addr)[i];
+
+	munmap(map_base, mapped_size);
+	close(fd);
+	return size;
+}
+
+static u32 rvtrace_mem_access(void *data, u64 address, enum riscv_privilege_mode prv,
+			      int context, size_t size, u8 *buffer)
+{
+	u8 cpumode;
+	u64 offset;
+	int len;
+	struct machine *machine;
+	struct addr_location al;
+	struct dso *dso;
+	int ret = 0;
+	struct rvtrace_queue *rvtraceq = data;
+
+	if (!rvtraceq)
+		goto out;
+
+	addr_location__init(&al);
+
+	/* If the riscv_privilege_mode is machine mode, access physical address by /dev/mem */
+	if (prv == RISCV_PRIV_MACHINE_MODE)
+		return rvtrace_devmem_access(address, size, buffer);
+
+	machine = rvtraceq->rvtrace->machine;
+	if (address >= machine__kernel_start(machine))
+		cpumode = PERF_RECORD_MISC_KERNEL;
+	else
+		cpumode = PERF_RECORD_MISC_USER;
+
+	if (thread__tid(rvtraceq->thread) != context)
+		rvtrace_set_thread(rvtraceq, context);
+
+	if (!thread__find_map(rvtraceq->thread, cpumode, address, &al))
+		goto out;
+
+	dso = map__dso(al.map);
+	if (!dso)
+		goto out;
+
+	if (dso__data(dso)->status == DSO_DATA_STATUS_ERROR &&
+	    dso__data_status_seen(dso, DSO_DATA_STATUS_SEEN_ITRACE))
+		goto out;
+
+	offset = map__map_ip(al.map, address);
+
+	map__load(al.map);
+
+	len = dso__data_read_offset(dso, machine, offset, buffer, size);
+	if (len <= 0) {
+		ui__warning_once("RISC-V Nexus Trace: Missing DSO. Use 'perf archive' or debuginfod to export data from the traced system.\n"
+				 "                  Enable CONFIG_PROC_KCORE or use option '-k /path/to/vmlinux' for kernel symbols.\n");
+		if (!dso__auxtrace_warned(dso)) {
+			pr_err("RISC-V Nexus Trace: Debug data not found for address %#"PRIx64" in %s\n",
+				address,
+				dso__long_name(dso) ? dso__long_name(dso) : "Unknown");
+			dso__set_auxtrace_warned(dso);
+		}
+		goto out;
+	}
+	ret = len;
+out:
+	addr_location__exit(&al);
+	return ret;
+}
+
+
+static u8 rvtrace_cpu_mode(enum riscv_privilege_mode prv)
+{
+	u8 cpumode;
+
+	switch (prv) {
+	case RISCV_PRIV_USER_MODE:
+		cpumode = PERF_RECORD_MISC_USER;
+		break;
+	case RISCV_PRIV_SUPERVISOR_MODE:
+	case RISCV_PRIV_MACHINE_MODE:
+	default:
+		cpumode = PERF_RECORD_MISC_KERNEL;
+		break;
+	}
+	return cpumode;
+}
+
+static void rvtrace_synth_copy_insn(struct rvtrace_queue *rvtraceq,
+				    struct nexus_rv_packet *packet,
+				    struct perf_sample *sample)
+{
+	int ret;
+	u32 insn;
+
+	ret = rvtrace_mem_access(rvtraceq, sample->ip, packet->prv, packet->context,
+				 sizeof(insn), (u8 *)&insn);
+	if (!ret)
+		return;
+
+	sample->insn_len = ((insn & __INSN_LENGTH_MASK) == __INSN_LENGTH_GE_32) ? 4 : 2;
+	memcpy(sample->insn, &insn, sample->insn_len);
+}
+
+static inline u64 rvtrace_resolve_sample_time(struct rvtrace_queue *rvtraceq,
+					      struct nexus_rv_packet *packet)
+{
+	struct rvtrace_auxtrace *rvtrace = rvtraceq->rvtrace;
+
+	if (!rvtrace->timeless_decoding)
+		return packet->timestamp;
+	else
+		return rvtrace->latest_kernel_timestamp;
+}
+
+static int rvtrace_synth_branch_sample(struct rvtrace_queue *rvtraceq,
+				       struct nexus_rv_packet *packet)
+{
+	int ret = 0;
+	struct rvtrace_auxtrace *rvtrace = rvtraceq->rvtrace;
+	struct perf_sample sample;
+	union perf_event *event = rvtraceq->event_buf;
+
+	perf_sample__init(&sample, /*all=*/true);
+	event->sample.header.type = PERF_RECORD_SAMPLE;
+	event->sample.header.misc = rvtrace_cpu_mode(packet->prv);
+	event->sample.header.size = sizeof(struct perf_event_header);
+
+	if (thread__tid(rvtraceq->thread) != packet->context)
+		rvtrace_set_thread(rvtraceq, packet->context);
+
+	/* Set time field based on rvtrace auxtrace config. */
+	sample.time = rvtrace_resolve_sample_time(rvtraceq, packet);
+
+	sample.ip = packet->start_addr;
+	sample.pid = thread__pid(rvtraceq->thread);
+	sample.tid = thread__tid(rvtraceq->thread);
+	sample.addr = packet->end_addr;
+	sample.insn_cnt = packet->insn_cnt;
+	sample.id = rvtraceq->rvtrace->branches_id;
+	sample.stream_id = rvtraceq->rvtrace->branches_id;
+	sample.period = 1;
+	sample.cpu = packet->cpu;
+	sample.flags = 0;
+	sample.cpumode = event->sample.header.misc;
+
+	rvtrace_synth_copy_insn(rvtraceq, packet, &sample);
+
+	ret = perf_session__deliver_synth_event(rvtrace->session, event, &sample);
+	if (ret)
+		pr_err(
+		"RISC-V Trace: failed to deliver instruction event, error %d\n",
+		ret);
+	perf_sample__exit(&sample);
+
+	return ret;
+}
+
+static int rvtrace_synth_events(struct rvtrace_auxtrace *rvtrace,
+				struct perf_session *session)
+{
+	struct evlist *evlist = session->evlist;
+	struct evsel *evsel;
+	struct perf_event_attr attr;
+	bool found = false;
+	u64 id;
+	int err;
+
+	evlist__for_each_entry(evlist, evsel) {
+		if (evsel->core.attr.type == rvtrace->pmu_type) {
+			found = true;
+			break;
+		}
+	}
+
+	if (!found) {
+		pr_debug("No selected events with RISC-V Trace data\n");
+		return 0;
+	}
+
+	memset(&attr, 0, sizeof(struct perf_event_attr));
+	attr.size = sizeof(struct perf_event_attr);
+	attr.type = PERF_TYPE_HARDWARE;
+	attr.sample_type = evsel->core.attr.sample_type & PERF_SAMPLE_MASK;
+	attr.sample_type |= PERF_SAMPLE_IP | PERF_SAMPLE_TID |
+			    PERF_SAMPLE_PERIOD;
+	if (rvtrace->timeless_decoding)
+		attr.sample_type &= ~(u64)PERF_SAMPLE_TIME;
+	else
+		attr.sample_type |= PERF_SAMPLE_TIME;
+
+	attr.exclude_user = evsel->core.attr.exclude_user;
+	attr.exclude_kernel = evsel->core.attr.exclude_kernel;
+	attr.exclude_hv = evsel->core.attr.exclude_hv;
+	attr.exclude_host = evsel->core.attr.exclude_host;
+	attr.exclude_guest = evsel->core.attr.exclude_guest;
+	attr.sample_id_all = evsel->core.attr.sample_id_all;
+	attr.read_format = evsel->core.attr.read_format;
+
+	/* create new id val to be a fixed offset from evsel id */
+	id = evsel->core.id[0] + 1000000000;
+	if (!id)
+		id = 1;
+
+	if (rvtrace->synth_opts.branches) {
+		attr.config = PERF_COUNT_HW_BRANCH_INSTRUCTIONS;
+		attr.sample_period = 1;
+		attr.sample_type |= PERF_SAMPLE_ADDR;
+
+		err = perf_session__deliver_synth_attr_event(session, &attr, id);
+		if (err)
+			return err;
+		rvtrace->branches_sample_type = attr.sample_type;
+		rvtrace->branches_id = id;
+		id += 1;
+		attr.sample_type &= ~(u64)PERF_SAMPLE_ADDR;
+	}
+
+	return 0;
+}
+
+static int rvtrace_process_queue(struct rvtrace_queue *rvtraceq)
+{
+	struct nexus_rv_packet_buffer *packet_buffer = &rvtraceq->decoder->packet_buffer;
+
+	for (int i = 0; i < packet_buffer->size; i++) {
+		struct nexus_rv_packet packet = packet_buffer->packets[i];
+
+		if (packet.sample_type == RVTRACE_RANGE)
+			rvtrace_synth_branch_sample(rvtraceq, &packet);
+		else if (packet.sample_type == RVTRACE_LOSS)
+			fprintf(stdout, "RISC-V Trace: A FIFO overrun has resulted in the loss of one or more messages\n");
+	}
+
+	return 0;
+}
+
+static int rvtrace_get_trace(struct rvtrace_queue *rvtraceq)
+{
+	struct auxtrace_buffer *aux_buffer = rvtraceq->buffer;
+	struct auxtrace_buffer *old_buffer = aux_buffer;
+	struct auxtrace_queue *queue;
+
+	queue = &rvtraceq->rvtrace->queues.queue_array[rvtraceq->queue_nr];
+
+	aux_buffer = auxtrace_buffer__next(queue, aux_buffer);
+
+	/* If no more data, drop the previous auxtrace_buffer and return */
+	if (!aux_buffer) {
+		if (old_buffer)
+			auxtrace_buffer__drop_data(old_buffer);
+		return 0;
+	}
+
+	rvtraceq->buffer = aux_buffer;
+
+	/* If the aux_buffer doesn't have data associated, try to load it */
+	if (!aux_buffer->data) {
+		/* get the file desc associated with the perf data file */
+		int fd = perf_data__fd(rvtraceq->rvtrace->session->data);
+
+		aux_buffer->data = auxtrace_buffer__get_data(aux_buffer, fd);
+		if (!aux_buffer->data)
+			return -ENOMEM;
+	}
+
+	/* If valid, drop the previous buffer */
+	if (old_buffer)
+		auxtrace_buffer__drop_data(old_buffer);
+
+	return aux_buffer->size;
+}
+
+/*
+ * rvtrace_get_data_block: Fetch a block from the auxtrace_buffer queue
+ *                         if need be.
+ * Returns:     < 0     if error
+ *              = 0     if no more auxtrace_buffer to read
+ *              > 0     if the current buffer isn't empty yet
+ */
+static int rvtrace_get_data_block(struct rvtrace_queue *rvtraceq)
+{
+	int ret;
+
+	ret = rvtrace_get_trace(rvtraceq);
+	if (ret <= 0)
+		return ret;
+
+	/*
+	 * We cannot assume consecutive blocks in the data file
+	 * are contiguous, reset the decoder to force re-sync.
+	 */
+	ret = nexus_rv_insn_decoder_reset(rvtraceq->decoder);
+	if (ret)
+		return ret;
+
+	return rvtraceq->buffer->size;
+}
+
+static int rvtrace_run_timeless_decoder(struct rvtrace_queue *rvtraceq)
+{
+	int ret;
+
+	while (1) {
+		ret = rvtrace_get_data_block(rvtraceq);
+		if (ret < 0)
+			return ret;
+
+		if (ret == 0)
+			break;
+
+		ret = nexus_rv_insn_decode_data(rvtraceq->decoder,
+						rvtraceq->buffer->data,
+						rvtraceq->buffer->size);
+		if (ret)
+			return ret;
+
+		ret = rvtrace_process_queue(rvtraceq);
+		if (ret)
+			return ret;
+	}
+
+	return ret;
+}
+
+static int rvtrace_process_timeless_queues(struct rvtrace_auxtrace *rvtrace,
+					   pid_t tid)
+{
+	unsigned int i;
+	struct auxtrace_queues *queues = &rvtrace->queues;
+
+	for (i = 0; i < queues->nr_queues; i++) {
+		struct auxtrace_queue *queue = &rvtrace->queues.queue_array[i];
+		struct rvtrace_queue *rvtraceq = queue->priv;
+
+		if (rvtraceq && ((tid == -1) || (queue->tid == tid))) {
+			rvtrace_set_thread(rvtraceq, queue->tid);
+			rvtrace_run_timeless_decoder(rvtraceq);
+		}
+	}
+
+	return 0;
+}
+
+static u64 rvtrace_queue_get_timestamp(struct rvtrace_queue *rvtraceq)
+{
+	struct nexus_rv_packet_buffer *packet_buffer = &rvtraceq->decoder->packet_buffer;
+
+	for (int i = 0; i < packet_buffer->size; i++) {
+		struct nexus_rv_packet packet = packet_buffer->packets[i];
+
+		if (packet.sample_type == RVTRACE_RANGE)
+			return packet.timestamp;
+	}
+
+	return 0;
+}
+
+static int rvtrace_queue_first_timestamp(struct rvtrace_auxtrace *rvtrace,
+					 struct rvtrace_queue *rvtraceq,
+					 unsigned int queue_nr)
+{
+	int ret;
+	u64 timestamp = 0;
+
+	/* Decode the first segment of data until a timestamp is found,
+	 * then add it to the heap for sorting by time across multiple
+	 * queues.
+	 */
+	while (1) {
+		/*
+		 * Fetch an aux_buffer from this rvtraceq. Bail if no more
+		 * blocks or an error has been encountered.
+		 */
+		ret = rvtrace_get_data_block(rvtraceq);
+		if (ret <= 0)
+			goto out;
+
+		ret = nexus_rv_insn_decode_data(rvtraceq->decoder,
+						rvtraceq->buffer->data,
+						rvtraceq->buffer->size);
+		if (ret)
+			goto out;
+
+		timestamp = rvtrace_queue_get_timestamp(rvtraceq);
+
+		/* We found a timestamp, no need to continue. */
+		if (timestamp)
+			break;
+	}
+
+	/* We have a timestamp and add it to the min heap */
+	ret = auxtrace_heap__add(&rvtrace->heap, queue_nr, timestamp);
+out:
+	return ret;
+}
+
+static int rvtrace_process_timestamped_queues(struct rvtrace_auxtrace *rvtrace)
+{
+	int ret = 0;
+	unsigned int queue_nr, i;
+	struct auxtrace_queue *queue;
+	struct rvtrace_queue *rvtraceq;
+
+	/* First, find the first timestamp for each queue and add it to the heap. */
+	for (i = 0; i < rvtrace->queues.nr_queues; i++) {
+		queue = &rvtrace->queues.queue_array[i];
+		rvtraceq = queue->priv;
+		if (!rvtraceq)
+			continue;
+
+		rvtrace_set_thread(rvtraceq, queue->tid);
+
+		ret = rvtrace_queue_first_timestamp(rvtrace, rvtraceq, i);
+		if (ret)
+			return ret;
+	}
+
+	/* Process queues in the heap in timestamp order */
+	while (1) {
+		if (!rvtrace->heap.heap_cnt)
+			break;
+
+		/* Take the entry at the top of the min heap */
+		queue_nr = rvtrace->heap.heap_array[0].queue_nr;
+		queue = &rvtrace->queues.queue_array[queue_nr];
+		rvtraceq = queue->priv;
+
+		/*
+		 * Remove the top entry from the heap since we are about
+		 * to process it.
+		 */
+		auxtrace_heap__pop(&rvtrace->heap);
+
+		/*
+		 * Packets associated with this timestamp are already in
+		 * the rvtraceq->packet_buffer, so process them.
+		 */
+		ret = rvtrace_process_queue(rvtraceq);
+		if (ret)
+			return ret;
+
+		/*
+		 * Packets for this timestamp have been processed, time to
+		 * move on to the next timestamp, find the next timestamp
+		 * for this rvtraceq.
+		 */
+		ret = rvtrace_queue_first_timestamp(rvtrace, rvtraceq, queue_nr);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static struct rvtrace_queue *rvtrace_alloc_queue(struct rvtrace_auxtrace *rvtrace,
+						 unsigned int queue_nr)
+{
+	struct nexus_rv_insn_decoder_params params;
+	struct rvtrace_queue *rvtraceq;
+
+	rvtraceq = zalloc(sizeof(*rvtraceq));
+	if (!rvtraceq)
+		return NULL;
+
+	rvtraceq->event_buf = malloc(PERF_SAMPLE_MAX_SIZE);
+	if (!rvtraceq->event_buf)
+		goto out_free;
+
+	rvtraceq->rvtrace = rvtrace;
+	rvtraceq->queue_nr = queue_nr;
+
+	params.mem_access = rvtrace_mem_access;
+	params.data = rvtraceq;
+	params.formatted = true;
+	if (!rvtrace->metadata[0][RVTRACE_ENCODER_INHB_SRC])
+		params.src_bits = rvtrace->metadata[0][RVTRACE_ENCODER_SRCBITS];
+
+	rvtraceq->decoder = nexus_rv_insn_decoder_new(&params);
+	if (!rvtraceq->decoder)
+		goto out_free;
+
+	rvtraceq->offset = 0;
+
+	return rvtraceq;
+
+out_free:
+	zfree(&rvtraceq->event_buf);
+	free(rvtraceq);
+
+	return NULL;
+}
+
+static int rvtrace_setup_queue(struct rvtrace_auxtrace *rvtrace,
+			       struct auxtrace_queue *queue,
+			       unsigned int queue_nr)
+{
+	struct rvtrace_queue *rvtraceq = queue->priv;
+
+	if (list_empty(&queue->head) || rvtraceq)
+		return 0;
+
+	rvtraceq = rvtrace_alloc_queue(rvtrace, queue_nr);
+
+	if (!rvtraceq)
+		return -ENOMEM;
+
+	queue->priv = rvtraceq;
+
+	return 0;
+}
+
+static int rvtrace_setup_queues(struct rvtrace_auxtrace *rvtrace)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < rvtrace->queues.nr_queues; i++) {
+		ret = rvtrace_setup_queue(rvtrace, &rvtrace->queues.queue_array[i], i);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int rvtrace_update_queues(struct rvtrace_auxtrace *rvtrace)
+{
+	if (rvtrace->queues.new_data) {
+		rvtrace->queues.new_data = false;
+		return rvtrace_setup_queues(rvtrace);
+	}
+
+	return 0;
+}
+
+static int rvtrace_flush_events(struct perf_session *session,
+				const struct perf_tool *tool)
+{
+	struct rvtrace_auxtrace *rvtrace = container_of(session->auxtrace,
+					struct rvtrace_auxtrace,
+					auxtrace);
+	int ret;
+
+	if (dump_trace)
+		return 0;
+
+	if (!tool->ordered_events)
+		return -EINVAL;
+
+	ret = rvtrace_update_queues(rvtrace);
+	if (ret < 0)
+		return ret;
+
+	if (rvtrace->timeless_decoding) {
+		/*
+		 * Pass tid = -1 to process all queues. But likely they will have
+		 * already been processed on PERF_RECORD_EXIT anyway.
+		 */
+		return rvtrace_process_timeless_queues(rvtrace, -1);
+	}
+
+	return rvtrace_process_timestamped_queues(rvtrace);
+}
+
+static void rvtrace_free_queue(void *priv)
+{
+	struct rvtrace_queue *rvtraceq = priv;
+
+	if (!rvtraceq)
+		return;
+
+	thread__zput(rvtraceq->thread);
+	nexus_rv_insn_decoder_free(rvtraceq->decoder);
+	zfree(&rvtraceq->event_buf);
+	free(rvtraceq);
+}
+
+static void rvtrace_free_events(struct perf_session *session)
+{
+	unsigned int i;
+	struct rvtrace_auxtrace *rvtrace = container_of(session->auxtrace,
+						    struct rvtrace_auxtrace,
+						    auxtrace);
+	struct auxtrace_queues *queues = &rvtrace->queues;
+
+	for (i = 0; i < queues->nr_queues; i++) {
+		rvtrace_free_queue(queues->queue_array[i].priv);
+		queues->queue_array[i].priv = NULL;
+	}
+
+	auxtrace_queues__free(queues);
+}
+
+static void rvtrace_free(struct perf_session *session)
+{
+	struct rvtrace_auxtrace *rvtrace = container_of(session->auxtrace,
+							struct rvtrace_auxtrace,
+							auxtrace);
+	rvtrace_free_events(session);
+	session->auxtrace = NULL;
+	for (int i = 0; i < rvtrace->num_cpu; i++)
+		zfree(&rvtrace->metadata[i]);
+
+	zfree(&rvtrace->metadata);
+	zfree(&rvtrace);
+}
+
+static bool rvtrace_evsel_is_auxtrace(struct perf_session *session,
+					     struct evsel *evsel)
+{
+	struct rvtrace_auxtrace *aux = container_of(session->auxtrace,
+						    struct rvtrace_auxtrace,
+						    auxtrace);
+
+	return evsel->core.attr.type == aux->pmu_type;
+}
+
+static int rvtrace_process_itrace_start(struct rvtrace_auxtrace *rvtrace,
+					union perf_event *event)
+{
+	struct thread *th;
+
+	if (rvtrace->timeless_decoding)
+		return 0;
+
+	/*
+	 * Add the tid/pid to the log so that we can get a match when
+	 * we get a contextID from the decoder.
+	 */
+	th = machine__findnew_thread(rvtrace->machine,
+				     event->itrace_start.pid,
+				     event->itrace_start.tid);
+	if (!th)
+		return -ENOMEM;
+
+	thread__put(th);
+
+	return 0;
+}
+
+static int rvtrace_process_event(struct perf_session *session,
+				 union perf_event *event,
+				 struct perf_sample *sample,
+				 const struct perf_tool *tool)
+{
+	int err = 0;
+	u64 timestamp;
+	struct rvtrace_auxtrace *rvtrace = container_of(session->auxtrace,
+							struct rvtrace_auxtrace,
+							auxtrace);
+
+	if (dump_trace)
+		return 0;
+
+	if (!tool->ordered_events) {
+		pr_err("RISCV Trace requires ordered events\n");
+		return -EINVAL;
+	}
+
+	if (sample->time && (sample->time != (u64) -1))
+		timestamp = sample->time;
+	else
+		timestamp = 0;
+
+	if (timestamp || rvtrace->timeless_decoding) {
+		err = rvtrace_update_queues(rvtrace);
+		if (err)
+			return err;
+	}
+
+	switch (event->header.type) {
+	case PERF_RECORD_EXIT:
+		/*
+		 * Don't need to wait for rvtrace_flush_events() in per-thread/timeless
+		 * mode to start the decode because we know there will be no more trace
+		 * from this thread. All this does is emit samples earlier than waiting
+		 * for the flush in other modes, but with timestamps it makes sense to
+		 * wait for flush so that events from different threads are interleaved
+		 * properly.
+		 */
+		if (rvtrace->timeless_decoding)
+			return rvtrace_process_timeless_queues(rvtrace, event->fork.tid);
+		break;
+
+	case PERF_RECORD_ITRACE_START:
+		return rvtrace_process_itrace_start(rvtrace, event);
+
+	case PERF_RECORD_AUX:
+		/*
+		 * Record the latest kernel timestamp available for rollback when
+		 * no trace timestamp is available.
+		 */
+		if (timestamp)
+			rvtrace->latest_kernel_timestamp = timestamp;
+		break;
+
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static void rvtrace_dump(struct rvtrace_auxtrace *rvtrace,
+			 unsigned char *buf, size_t len)
+{
+	int ret;
+	struct nexus_rv_pkt_decoder_params params;
+	struct nexus_rv_pkt_decoder *decoder;
+	const char *color = PERF_COLOR_BLUE;
+
+	// TODO: Determine whether the trace data contains a CoreSight formatter frame
+	params.formatted = true;
+	if (!rvtrace->metadata[0][RVTRACE_ENCODER_INHB_SRC])
+		params.src_bits = rvtrace->metadata[0][RVTRACE_ENCODER_SRCBITS];
+
+	decoder = nexus_rv_pkt_decoder_new(&params);
+	if (!decoder) {
+		color_fprintf(stdout, color, " Failed to create decoder\n");
+		return;
+	}
+
+	color_fprintf(stdout, color,
+			". ... Trace Encoder Trace data: size %#zx bytes\n",
+			len);
+
+	ret = nexus_rv_pkt_desc(decoder, buf, len);
+	if (ret)
+		color_fprintf(stdout, color, " Bad packet!\n");
+
+	nexus_rv_pkt_decoder_free(decoder);
+}
+
+static void rvtrace_dump_event(struct rvtrace_auxtrace *rvtrace,
+			       unsigned char *buf, size_t len)
+{
+	printf(".\n");
+	rvtrace_dump(rvtrace, buf, len);
+}
+
+static int rvtrace_process_auxtrace_event(struct perf_session *session,
+					  union perf_event *event,
+					  const struct perf_tool *tool __maybe_unused)
+{
+	struct rvtrace_auxtrace *rvtrace = container_of(session->auxtrace,
+								 struct rvtrace_auxtrace,
+								 auxtrace);
+	if (!rvtrace->data_queued) {
+		struct auxtrace_buffer *buffer;
+		off_t  data_offset;
+		int fd = perf_data__fd(session->data);
+		bool is_pipe = perf_data__is_pipe(session->data);
+		int err;
+
+		if (is_pipe)
+			data_offset = 0;
+		else {
+			data_offset = lseek(fd, 0, SEEK_CUR);
+			if (data_offset == -1)
+				return -errno;
+		}
+
+		err = auxtrace_queues__add_event(&rvtrace->queues, session,
+						 event, data_offset, &buffer);
+
+		if (err)
+			return err;
+
+		if (dump_trace)
+			if (auxtrace_buffer__get_data(buffer, fd)) {
+				rvtrace_dump_event(rvtrace, buffer->data, buffer->size);
+				auxtrace_buffer__put_data(buffer);
+			}
+	}
+
+
+	return 0;
+}
+
+static bool rvtrace_is_timeless_decoding(struct rvtrace_auxtrace *rvtrace)
+{
+	struct evsel *evsel;
+	struct evlist *evlist = rvtrace->session->evlist;
+	bool timeless_decoding = true;
+
+	/*
+	 * Circle through the list of event and complain if we find one
+	 * with the time bit set.
+	 */
+	evlist__for_each_entry(evlist, evsel) {
+		if ((evsel->core.attr.sample_type & PERF_SAMPLE_TIME))
+			timeless_decoding = false;
+	}
+
+	return timeless_decoding;
+}
+
+static const char * const rvtrace_global_header_fmts[] = {
+	[RVTRACE_PMU_TYPE_CPUS]		    = "	    PMU type/num cpus	    %llx\n",
+};
+
+static const char * const rvtrace_encoder_priv_fmts[] = {
+	[RVTRACE_ENCODER_CPU]		    = "	    CPU			    %lld\n",
+	[RVTRACE_ENCODER_NR_TRC_PARAMS]	    = "	    NR_TRC_PARAMS	    %lld\n",
+	[RVTRACE_ENCODER_FORMAT]	    = "	    FORMAT		    %lld\n",
+	[RVTRACE_ENCODER_CONTEXT]	    = "	    CONTEXT		    %lld\n",
+	[RVTRACE_ENCODER_INHB_SRC]	    = "	    INHB_SRC		    %lld\n",
+	[RVTRACE_ENCODER_SRCBITS]	    = "	    SRCBITS		    %lld\n",
+	[RVTRACE_ENCODER_SRCID]		    = "	    SRCID		    %lld\n",
+};
+
+static void rvtrace_print_auxtrace_info(u64 *val, int num_cpu)
+{
+	int i, j, cpu = 0, nr_params = 0, fmt_offset = 0;
+
+	for (i = 0; i < RVTRACE_HEADER_MAX; i++)
+		fprintf(stdout, rvtrace_global_header_fmts[i], val[i]);
+
+	for (i = RVTRACE_HEADER_MAX; cpu < num_cpu; cpu++) {
+		fprintf(stdout, rvtrace_encoder_priv_fmts[RVTRACE_ENCODER_CPU], val[i++]);
+		nr_params = val[i++];
+		fmt_offset = RVTRACE_ENCODER_FORMAT;
+		for (j = fmt_offset; j < nr_params + fmt_offset; j++, i++)
+			fprintf(stdout, rvtrace_encoder_priv_fmts[j], val[i]);
+	}
+}
+
+int rvtrace_process_auxtrace_info(union perf_event *event,
+				  struct perf_session *session)
+{
+	struct perf_record_auxtrace_info *auxtrace_info = &event->auxtrace_info;
+	struct rvtrace_auxtrace *rvtrace = NULL;
+	int err = 0;
+	int i;
+	int num_cpu = 0;
+	u64 *ptr = NULL;
+	u64 **metadata = NULL;
+
+	/* First the global part */
+	ptr = (u64 *) auxtrace_info->priv;
+	num_cpu = ptr[RVTRACE_PMU_TYPE_CPUS] & 0xffffffff;
+	metadata = zalloc(sizeof(*metadata) * num_cpu);
+	if (!metadata)
+		err = -ENOMEM;
+
+	/* Start parsing after the common part of the header */
+	i = RVTRACE_HEADER_MAX;
+
+	for (int j = 0; j < num_cpu; j++) {
+		metadata[j] = zalloc(sizeof(*metadata[j]) * RVTRACE_ENCODER_PRIV_MAX);
+		if (!metadata[j]) {
+			err = -ENOMEM;
+			goto err_free_metadata;
+		}
+
+		for (int k = 0; k < RVTRACE_ENCODER_PRIV_MAX; k++)
+			metadata[j][k] = ptr[i + k];
+		i += RVTRACE_ENCODER_PRIV_MAX;
+	}
+
+	rvtrace = zalloc(sizeof(*rvtrace));
+	if (!rvtrace) {
+		err = -ENOMEM;
+		goto err_free_metadata;
+	}
+
+	err = auxtrace_queues__init(&rvtrace->queues);
+	if (err)
+		goto err_free_rvtrace;
+
+	if (session->itrace_synth_opts->set) {
+		rvtrace->synth_opts = *session->itrace_synth_opts;
+	} else {
+		itrace_synth_opts__set_default(&rvtrace->synth_opts,
+			session->itrace_synth_opts->default_no_sample);
+		rvtrace->synth_opts.callchain = false;
+	}
+
+	rvtrace->session = session;
+	rvtrace->machine = &session->machines.host;
+	rvtrace->num_cpu = num_cpu;
+	rvtrace->pmu_type = (unsigned int) ((ptr[RVTRACE_PMU_TYPE_CPUS] >> 32) & 0xffffffff);
+	rvtrace->metadata = metadata;
+
+	rvtrace->auxtrace_type = auxtrace_info->type;
+	rvtrace->timeless_decoding = rvtrace_is_timeless_decoding(rvtrace);
+
+	rvtrace->auxtrace.process_event = rvtrace_process_event;
+	rvtrace->auxtrace.process_auxtrace_event = rvtrace_process_auxtrace_event;
+	rvtrace->auxtrace.flush_events = rvtrace_flush_events;
+	rvtrace->auxtrace.free_events = rvtrace_free_events;
+	rvtrace->auxtrace.free = rvtrace_free;
+	rvtrace->auxtrace.evsel_is_auxtrace = rvtrace_evsel_is_auxtrace;
+	session->auxtrace = &rvtrace->auxtrace;
+
+	if (dump_trace) {
+		rvtrace_print_auxtrace_info(ptr, num_cpu);
+		return 0;
+	}
+
+	err = rvtrace_synth_events(rvtrace, session);
+	if (err)
+		goto err_free_queues;
+
+	err = auxtrace_queues__process_index(&rvtrace->queues, session);
+	if (err)
+		goto err_free_queues;
+
+	rvtrace->data_queued = rvtrace->queues.populated;
+
+	return 0;
+
+err_free_queues:
+	auxtrace_queues__free(&rvtrace->queues);
+	session->auxtrace = NULL;
+err_free_rvtrace:
+	zfree(&rvtrace);
+err_free_metadata:
+	for (int j = 0; j < num_cpu; j++)
+		zfree(&metadata[j]);
+	zfree(&metadata);
+
+	return -EINVAL;
+}
diff --git a/tools/perf/util/rvtrace.h b/tools/perf/util/rvtrace.h
index 1e48ed989dd7..84a59d3dc296 100644
--- a/tools/perf/util/rvtrace.h
+++ b/tools/perf/util/rvtrace.h
@@ -35,4 +35,6 @@ enum {
 #define RVTRACE_HEADER_SIZE		(RVTRACE_HEADER_MAX * sizeof(u64))
 #define RVTRACE_ENCODER_PRIV_SIZE	(RVTRACE_ENCODER_PRIV_MAX * sizeof(u64))
 
+int rvtrace_process_auxtrace_info(union perf_event *event, struct perf_session *session);
+
 #endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
