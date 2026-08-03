Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA01EC55179
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Aug 2026 11:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YEW2usmGeuVVYv8U+9kcttbeVbmbtyaPFclKXEcOw7Y=; b=pPcERxFfL9NIa9
	NuHnM0qVLkTUNYi7DZORbjKC5FRO87+X6LX2d7AWFs9mIJTD+DPcTUG9asQvrdRr7fVC2GWdVqTJR
	GeMtQ+bI7eI/J/VU4uBDmiNF/4GlCVer8ilq23PyZbjsAMUsG0mWQq/iom/gM+DJD1gcZsg+YgFn4
	vut5muNkcDyIDtUBKzm9811yxlKAB9Dkg91Gmz1zeJye2JXEFY+tDQTG76hdu4YbOBq+Hr/+xwT2o
	SWFoIqu6Mjs6LH5CRsn/JHxt77nrfCU+e4GqufaxrVhYEKk5CFZCsZYo8U9D+/NHEXauI1pTsc29Z
	r95HuzId3DxwbopBew+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqtc-0000000GwkD-2zwX;
	Mon, 03 Aug 2026 11:31:52 +0000
Received: from stravinsky.debian.org ([2001:41b8:202:deb::311:108])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqqtY-0000000Gwjq-49hi
	for linux-riscv@lists.infradead.org;
	Mon, 03 Aug 2026 11:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=u0WUwvGXR7F+FOt0nPl2Q7x+9hbeCvq8r6+yKYBK7Yw=; b=FEzNmHvLwRvNTbmqtpZq2xcWyz
	wyDCie16TTviOfuu/VSJPPH9uowQxu/p2dSt7Cu92kUWl6emb1IZbApyFJvpnPwCA3kmoBD40l1WB
	le+J0hb4utt1IbBW9uhfgu/QotzVwzqeNkuWz6MkkZXYjksal3FVXBEGdLPbdU8uCEQRDCTY1sXxf
	HoTIRH3jF7P7T0NSrI18UKeQ+kwHVoZUAo7HSr+y/VqweEGYUnHS9LUa5wJJuQzch+BKMXjVnzDLb
	h3SeO+2tYYALCLzyd4a8zuDnuXGPzauB1EeL2UXInlABGOcKifJrwhvtGDGVpaWJIq6008xCxgrW2
	dabOqPtQ==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1wqqtH-00CKPG-35;
	Mon, 03 Aug 2026 11:31:33 +0000
From: Breno Leitao <leitao@debian.org>
Date: Mon, 03 Aug 2026 04:31:20 -0700
Subject: [PATCH v2] tools/mm: add hwpoison-panic tool
MIME-Version: 1.0
Message-Id: <20260803-memory_failure_rewrite_test-v2-1-ed020ce42129@debian.org>
X-B4-Tracking: v=1; b=H4sIAAd8cGoC/33Nyw6CMBBA0V9pZk1NH1oeK//DEFJhgEmUmmlFC
 eHfjcS127s4d4WITBihEiswzhQpTFAJkwloRz8NKKmDSoBRxqncFPKO98BL03u6PRkbxhdTwiZ
 hTDL3VpXeKe0dQibgwdjTe9cvdSZgpJgCL/ts1t/6c63+685aaum8L1p3tCdX2nOHV/LTIfAA9
 bZtHxPtToDHAAAA
X-Change-ID: 20260728-memory_failure_rewrite_test-7a309a601a6e
To: Andrew Morton <akpm@linux-foundation.org>, 
 Miaohe Lin <linmiaohe@huawei.com>, 
 Naoya Horiguchi <nao.horiguchi@gmail.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, david@kernel.org
Cc: SJ Park <sj@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, sj@kernel.org, 
 kernel-team@meta.com, Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=13744; i=leitao@debian.org;
 h=from:subject:message-id; bh=SI2dl8JjSpmsdVR+xGmlmr5VqjwAX/tEzH8msARVcY4=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBqcHwQDNw3xJtgnJvr0G1uRG9c4FvYzl0ee4xYQ
 z1h1c07B7CJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCanB8EAAKCRA1o5Of/Hh3
 bcR0D/9WxTlY+QFNbuFQWh7wlTO6r4NXDSU4ZFQ5SggvRajGpyr8BDnGHIkocf50vvraMAbCar3
 yx1Z+yLaZthHde52Zaxf2Thkl0oMDe6nDmDmSFgPbKGWpAlWoDhgwZjCp6S4zvJrnBDrXK6zP2Q
 H25SlUB/igOm40WJTRG5KTSTpE10by7fmXJGHT22gmbNJAft97/A3juIcdRiTfqEXP0rmp7mlX6
 1+IE5jbtdCBljbq8zaYS2oFkDy3zJyvF7k7VUtdruLgbOHEzmZBozje+BV/5Om4fjm9yeXVxOmY
 RQ0OZQERC0LOIQX/5ArrN5AWFOTuBa9zYCGJYkfWQiZnn/We/Q+rbKU9w6PSVch3aldi0+aP7iP
 /A79WaQcvMZ9XazyQWI7ebHWII+KrTN4hkXDG9YdXzxCLfBMQ/VB3M2ldo0F9ZHJSgELYf5nONr
 zDFrbrkvBYBrPGB7genGboBMfXQeGW1afUUb2itvdxIOCIQsnghnXUd17nCShSgvOe7FtoSBiVA
 Sk20gOXlX9e45i923KpAPE2pS/bxl3kjLnRuqpRsLUmB3q+BFDFYX5MmqvFF1h3hMY3ndNSlMHM
 hnP85xQplG9JytRWudI0R/4ZQezdTuREQ0Mnpi4I20fMHJ+R0OdCpM5pEmHogDZPDJGckCSL/ev
 +9lkLGcW3A3bePg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Debian-User: leitao
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_043149_237074_DEB36D71 
X-CRM114-Status: GOOD (  27.16  )
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

Add a tool that enables the vm.panic_on_unrecoverable_memory_failure
sysctl, picks a kernel-owned PFN and writes its physical address to
hard_offline_page.  Three page kinds are selectable with -k: rodata
(default), slab or pgtable. In all cases the host should panic.

Example:

        # ./hwpoison-panic -k slab --yes-panic-my-kernel
        injecting hwpoison at phys 0x100032000 (pfn 0x100032, kind=slab)
        expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'

In dmesg, you will see:

        Memory failure: 0x100032: unhandlable page.
        Memory failure: 0x100032: recovery action for reserved kernel page: Ignored
        Kernel panic - not syncing: Memory failure: 0x100032: unrecoverable page

This lives in tools/mm rather than selftests/mm because every successful
run crashes the machine, which is not something to run from CI.

The --yes-panic-my-kernel argument is required so an accidental
invocation does not take the box down.

Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Reword the file header, the tool triggers a panic rather than
  confirming one (SJ Park)
- Rename -f to --yes-panic-my-kernel and say in usage() what it costs
  (SJ Park)
- Call check_prereqs() before getpagesize() (SJ Park)
- Use 64-bit types for physical addresses and PFNs.  On a 32-bit build
  the old long/unsigned long pair truncated addresses above 4G, and the
  negative error sentinel was indistinguishable from a valid address at
  or above 2G
- Link to v1: https://patch.msgid.link/20260731-memory_failure_rewrite_test-v1-1-6aa8c6435693@debian.org

To: Andrew Morton <akpm@linux-foundation.org>
To: Miaohe Lin <linmiaohe@huawei.com>
To: Naoya Horiguchi <nao.horiguchi@gmail.com>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Cc: linux-riscv@lists.infradead.org
---
 MAINTAINERS                              |   1 +
 tools/mm/.gitignore                      |   1 +
 tools/mm/Makefile                        |   2 +
 tools/mm/memory-failure/hwpoison-panic.c | 358 +++++++++++++++++++++++++++++++
 4 files changed, 362 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 56b337a064478..799c4883d5b0b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12094,6 +12094,7 @@ F:	include/linux/memory-failure.h
 F:	include/trace/events/memory-failure.h
 F:	mm/hwpoison-inject.c
 F:	mm/memory-failure.c
+F:	tools/mm/memory-failure/
 F:	tools/testing/selftests/mm/memory-failure.c
 
 HYCON HY46XX TOUCHSCREEN SUPPORT
diff --git a/tools/mm/.gitignore b/tools/mm/.gitignore
index 1446a659e5408..b9b80d909db4a 100644
--- a/tools/mm/.gitignore
+++ b/tools/mm/.gitignore
@@ -3,3 +3,4 @@ slabinfo
 page-types
 page_owner_sort
 thp_swap_allocator_test
+memory-failure/hwpoison-panic
diff --git a/tools/mm/Makefile b/tools/mm/Makefile
index 858186a6eefdb..9f6de957a95a0 100644
--- a/tools/mm/Makefile
+++ b/tools/mm/Makefile
@@ -4,6 +4,7 @@
 include ../scripts/Makefile.include
 
 BUILD_TARGETS=page-types slabinfo page_owner_sort page_owner_filter thp_swap_allocator_test
+BUILD_TARGETS+=memory-failure/hwpoison-panic
 INSTALL_TARGETS = $(BUILD_TARGETS) thpmaps
 
 LIB_DIR = ../lib/api
@@ -24,6 +25,7 @@ $(LIBS):
 
 clean:
 	$(RM) page-types slabinfo page_owner_sort page_owner_filter thp_swap_allocator_test
+	$(RM) memory-failure/hwpoison-panic
 	make -C $(LIB_DIR) clean
 
 sbindir ?= /usr/sbin
diff --git a/tools/mm/memory-failure/hwpoison-panic.c b/tools/mm/memory-failure/hwpoison-panic.c
new file mode 100644
index 0000000000000..a2ddffc8b8779
--- /dev/null
+++ b/tools/mm/memory-failure/hwpoison-panic.c
@@ -0,0 +1,358 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * hwpoison-panic: trigger an intentional kernel panic by injecting a
+ * hwpoison error on a kernel-owned page, to check that
+ * vm.panic_on_unrecoverable_memory_failure fires.
+ *
+ * Three kinds of kernel-owned page can be targeted, selected with -k
+ * (default: rodata):
+ *
+ *   rodata  - a PG_reserved page in the kernel rodata range, from
+ *             /proc/iomem "Kernel rodata".  x86 and riscv only.
+ *   slab    - a slab page found via /proc/kpageflags (KPF_SLAB).
+ *   pgtable - a page-table page found via /proc/kpageflags (KPF_PGTABLE).
+ *
+ * slab and pgtable work everywhere; rodata needs an architecture that
+ * publishes the rodata resource in /proc/iomem.
+ *
+ * The slab and pgtable variants exercise memory_failure() -> get_any_page()
+ * on a non PG_reserved kernel-owned page, catching regressions where
+ * get_any_page() collapses such pages into a transient -EIO instead of
+ * -ENOTRECOVERABLE.
+ *
+ * A successful run crashes the kernel, so --yes-panic-my-kernel is required
+ * and the tool is meant for a disposable VM (e.g. virtme-ng) with the serial
+ * console captured.  The result is observed externally: the kernel panics with
+ *   "Memory failure: <pfn>: unrecoverable page"
+ * Returning at all means no panic fired, so every exit status is non-zero:
+ * either a failure, or an inconclusive run where the target PFN raced to
+ * another page type before injection.
+ *
+ * Author: Breno Leitao <leitao@debian.org>
+ */
+#define _GNU_SOURCE
+#define _FILE_OFFSET_BITS 64
+#include <fcntl.h>
+#include <getopt.h>
+#include <limits.h>
+#include <stdarg.h>
+#include <stdint.h>
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "../../../include/uapi/linux/kernel-page-flags.h"
+#include <api/fs/fs.h>
+
+#define SYSCTL_PATH	"/proc/sys/vm/panic_on_unrecoverable_memory_failure"
+#define INJECT_PATH	"/sys/devices/system/memory/hard_offline_page"
+#define PROC_KPAGEFLAGS	"/proc/kpageflags"
+
+/* Not exported by the uapi header, see tools/mm/page-types.c. */
+#define KPF_RESERVED	32
+
+#define BIT(name)	(1ULL << KPF_##name)
+#define ARRAY_SIZE(x)	(sizeof(x) / sizeof((x)[0]))
+
+/* The kpageflags bit identifying each kernel-owned page kind we target. */
+static const struct page_kind {
+	const char *name;
+	uint64_t bit;
+} page_kinds[] = {
+	{ "rodata",  BIT(RESERVED) },
+	{ "slab",    BIT(SLAB)     },
+	{ "pgtable", BIT(PGTABLE)  },
+};
+
+static unsigned long page_size;
+
+static void fatal(const char *x, ...)
+{
+	va_list ap;
+
+	va_start(ap, x);
+	vfprintf(stderr, x, ap);
+	va_end(ap);
+	exit(EXIT_FAILURE);
+}
+
+static int kpageflags_read(int fd, uint64_t pfn, uint64_t *flags)
+{
+	ssize_t bytes;
+
+	bytes = pread(fd, flags, sizeof(*flags), (off_t)pfn * sizeof(*flags));
+
+	return bytes == sizeof(*flags) ? 0 : -1;
+}
+
+static int pick_rodata_phys_addr(uint64_t *phys_addr)
+{
+	unsigned long long start, end;
+	char line[256], label[64];
+	int ret = -1;
+	FILE *f;
+
+	f = fopen("/proc/iomem", "r");
+	if (!f)
+		return -1;
+
+	/* Sub-resources are indented: "  02500000-02ffffff : Kernel rodata" */
+	while (fgets(line, sizeof(line), f)) {
+		if (sscanf(line, " %llx-%llx : %63[^\n]", &start, &end,
+			   label) != 3)
+			continue;
+		if (strcmp(label, "Kernel rodata") || end <= start)
+			continue;
+		/* Page-align up and return the first byte of that page. */
+		*phys_addr = ((start + page_size - 1) / page_size) * page_size;
+		ret = 0;
+		break;
+	}
+
+	fclose(f);
+	return ret;
+}
+
+static int pick_kpageflags_phys_addr(uint64_t want, uint64_t *phys_addr)
+{
+	uint64_t pfn = (16UL << 20) / page_size;
+	uint64_t flags;
+	int ret = -1;
+	int fd;
+
+	fd = open(PROC_KPAGEFLAGS, O_RDONLY);
+	if (fd < 0)
+		return -1;
+
+	for (; kpageflags_read(fd, pfn, &flags) == 0; pfn++) {
+		if ((flags & want) && !(flags & BIT(HWPOISON)) &&
+		    !(flags & BIT(NOPAGE)) && !(flags & BIT(COMPOUND_TAIL))) {
+			*phys_addr = pfn * page_size;
+			ret = 0;
+			break;
+		}
+	}
+
+	close(fd);
+	return ret;
+}
+
+static int read_sysctl(unsigned long *val)
+{
+	FILE *f = fopen(SYSCTL_PATH, "r");
+	int ret;
+
+	if (!f)
+		return -1;
+	ret = fscanf(f, "%lu", val) == 1 ? 0 : -1;
+	fclose(f);
+
+	return ret;
+}
+
+static int write_sysctl(unsigned long val)
+{
+	FILE *f = fopen(SYSCTL_PATH, "w");
+	int ret;
+
+	if (!f)
+		return -1;
+	ret = fprintf(f, "%lu", val) < 0 ? -1 : 0;
+	fclose(f);
+
+	return ret;
+}
+
+/* hard_offline_page() injects with MF_SW_SIMULATED, so unpoison is allowed. */
+static void unpoison_pfn(uint64_t pfn)
+{
+	char path[PATH_MAX], buf[32];
+	const char *debugfs;
+	int fd, len;
+
+	debugfs = debugfs__mount();
+	if (!debugfs)
+		return;
+
+	snprintf(path, sizeof(path), "%s/hwpoison/unpoison-pfn", debugfs);
+	fd = open(path, O_WRONLY);
+	if (fd < 0)
+		return;
+
+	len = snprintf(buf, sizeof(buf), "0x%llx\n", (unsigned long long)pfn);
+	if (write(fd, buf, len) < 0)
+		perror("unpoison-pfn");
+	close(fd);
+}
+
+static const char *inject_hwpoison(const struct page_kind *kind,
+				   uint64_t phys_addr, uint64_t pfn)
+{
+	char buf[32];
+	int fd, len;
+	ssize_t ret;
+
+	printf("injecting hwpoison at phys 0x%llx (pfn 0x%llx, kind=%s)\n",
+	       (unsigned long long)phys_addr, (unsigned long long)pfn,
+	       kind->name);
+	printf("expecting kernel panic: 'Memory failure: <pfn>: unrecoverable page'\n");
+	fflush(stdout);
+
+	fd = open(INJECT_PATH, O_WRONLY);
+	if (fd < 0)
+		return "cannot open " INJECT_PATH;
+
+	len = snprintf(buf, sizeof(buf), "0x%llx", (unsigned long long)phys_addr);
+	ret = write(fd, buf, len);
+	close(fd);
+
+	if (ret != len)
+		return "inject failed before reaching the panic path";
+
+	return "inject returned without panic; sysctl ineffective";
+}
+
+static const struct page_kind *lookup_kind(const char *name)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(page_kinds); i++)
+		if (!strcmp(page_kinds[i].name, name))
+			return &page_kinds[i];
+
+	return NULL;
+}
+
+static void usage(void)
+{
+	printf("hwpoison-panic [options]\n"
+	       "            -k|--kind <kind>       rodata (default, x86 and riscv only),\n"
+	       "                                   slab or pgtable\n"
+	       "            --yes-panic-my-kernel  really run it: the machine panics\n"
+	       "                                   and every unsaved write is lost\n"
+	       "            -h|--help              show this\n");
+}
+
+static const struct option opts[] = {
+	{ "kind",                 1, NULL, 'k' },
+	{ "yes-panic-my-kernel",  0, NULL, 'y' },
+	{ "help",                 0, NULL, 'h' },
+	{ NULL,                   0, NULL, 0 },
+};
+
+static const struct page_kind *parse_args(int argc, char **argv, int *armed)
+{
+	const struct page_kind *kind;
+	const char *name = "rodata";
+	int c;
+
+	while ((c = getopt_long(argc, argv, "k:h", opts, NULL)) != -1) {
+		switch (c) {
+		case 'k':
+			name = optarg;
+			break;
+		case 'y':
+			*armed = 1;
+			break;
+		case 'h':
+			usage();
+			exit(EXIT_SUCCESS);
+		default:
+			usage();
+			exit(EXIT_FAILURE);
+		}
+	}
+
+	kind = lookup_kind(name);
+	if (!kind)
+		fatal("unknown kind '%s' (expected: rodata|slab|pgtable)\n",
+		      name);
+
+	return kind;
+}
+
+static void check_prereqs(int armed)
+{
+	if (geteuid())
+		fatal("must run as root\n");
+	if (access(SYSCTL_PATH, W_OK))
+		fatal("%s not present (kernel without the sysctl?)\n",
+		      SYSCTL_PATH);
+	if (access(INJECT_PATH, W_OK))
+		fatal("%s not present (no MEMORY_HOTPLUG?)\n", INJECT_PATH);
+	if (!armed)
+		fatal("this panics the kernel; pass --yes-panic-my-kernel\n");
+}
+
+static uint64_t pick_phys_addr(const struct page_kind *kind)
+{
+	uint64_t addr;
+
+	if (kind->bit == BIT(RESERVED)) {
+		if (pick_rodata_phys_addr(&addr))
+			fatal("no \"Kernel rodata\" in /proc/iomem; try -k slab or -k pgtable\n");
+	} else {
+		if (pick_kpageflags_phys_addr(kind->bit, &addr))
+			fatal("no usable %s PFN in %s\n", kind->name,
+			      PROC_KPAGEFLAGS);
+	}
+
+	return addr;
+}
+
+static void arm_sysctl(unsigned long *prior)
+{
+	if (read_sysctl(prior))
+		fatal("failed to read %s\n", SYSCTL_PATH);
+	if (write_sysctl(1))
+		fatal("failed to enable %s\n", SYSCTL_PATH);
+}
+
+static void recheck_kind(const struct page_kind *kind, uint64_t pfn,
+			 const char *verdict)
+{
+	uint64_t flags;
+	int fd, ret;
+
+	fd = open(PROC_KPAGEFLAGS, O_RDONLY);
+	if (fd < 0)
+		fatal("%s (could not open %s)\n", verdict, PROC_KPAGEFLAGS);
+	ret = kpageflags_read(fd, pfn, &flags);
+	close(fd);
+
+	if (ret)
+		fatal("%s (could not reconfirm page type via %s)\n", verdict,
+		      PROC_KPAGEFLAGS);
+	if (flags & kind->bit)
+		fatal("%s (page still %s)\n", verdict, kind->name);
+
+	fprintf(stderr, "target PFN no longer %s; raced before inject, inconclusive\n",
+		kind->name);
+}
+
+int main(int argc, char **argv)
+{
+	uint64_t phys_addr, pfn;
+	const struct page_kind *kind;
+	const char *verdict;
+	unsigned long prior;
+	int armed = 0;
+
+	kind = parse_args(argc, argv, &armed);
+	check_prereqs(armed);
+	page_size = getpagesize();
+
+	phys_addr = pick_phys_addr(kind);
+	pfn = phys_addr / page_size;
+	arm_sysctl(&prior);
+
+	verdict = inject_hwpoison(kind, phys_addr, pfn);
+
+	/* No panic fired.  Put the machine back, then report. */
+	write_sysctl(prior);
+	unpoison_pfn(pfn);
+	recheck_kind(kind, pfn, verdict);
+
+	return EXIT_FAILURE;
+}

---
base-commit: 95d6a9ccef99117115e41e9adb271243bd5e985b
change-id: 20260728-memory_failure_rewrite_test-7a309a601a6e

Best regards,
--  
Breno Leitao <leitao@debian.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
