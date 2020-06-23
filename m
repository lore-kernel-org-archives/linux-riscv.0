Return-Path: <SRS0=OENr=AE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28D9C433DF
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:06:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61F912073E
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2020 15:06:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mVoYOrh/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61F912073E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ics.forth.gr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=keoLU0OPoTAi4nFS7GY5Q7YlsWsWhI/Gdax2HfuR4co=; b=mVoYOrh/FdMdzp9MCktBVJTZt
	Tisr/E9MDMzitDVd7bYJ7i86gGR4mn+NXCk60/fETpr/i4BY94Ih5JhgQS6IPFypGNXHghiB/3LX9
	CxhktugZOoNrDMMbKlv9QiWDmyuyt1+wQWbwNQp5YKDZC1U9zmsskDq2GSsZU9cAgnNFgTj+m0FP8
	rv4jwN+Wv3BWMUs/iotQScO6sKT3jZPSnxoPEysDfxYQsb1a/oBRkeHlXMEa0ihs6/MutHJL02a9b
	+g2bxBGf378/wg7LwYT+2Ip+NUUIhONfD2A2tIgrdytyjmHifrK2TfooROqONdhuNzxwY9bPzdPMy
	VXMbuug4Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jnkV1-0006tO-6Y; Tue, 23 Jun 2020 15:06:11 +0000
Received: from mailgate-2.ics.forth.gr ([139.91.1.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnkUv-0006oI-W6
 for linux-riscv@lists.infradead.org; Tue, 23 Jun 2020 15:06:08 +0000
Received: from av3.ics.forth.gr (av3in [139.91.1.77])
 by mailgate-2.ics.forth.gr (8.14.4/ICS-FORTH/V10-1.8-GATE) with ESMTP id
 05NF5PbW016105; Tue, 23 Jun 2020 15:05:27 GMT
X-AuditID: 8b5b014d-241ff700000045c5-b0-5ef21a35803e
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
 by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id
 7A.B1.17861.53A12FE5; Tue, 23 Jun 2020 18:05:25 +0300 (EEST)
X-ICS-AUTH-INFO: Authenticated user: mick@ics.forth.gr at ics.forth.gr
From: Nick Kossifidis <mick@ics.forth.gr>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com
Subject: [PATCH v2 3/3] RISC-V: Add crash kernel support
Date: Tue, 23 Jun 2020 18:05:12 +0300
Message-Id: <20200623150512.896499-4-mick@ics.forth.gr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200623150512.896499-1-mick@ics.forth.gr>
References: <20200623150512.896499-1-mick@ics.forth.gr>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrGLMWRmVeSWpSXmKPExsXSHT1dWddU6lOcwZZfAhYtH96xWixa8Z3F
 YsvhR8wW2z63sFk0vzvHbvHycg+zRdssfoumF9eZLT7cnc3mwOkx9fcZFo+uHzNYPd68fMni
 8XDTJSaPzUvqPS41X2f3aD/QzRTAHsVlk5Kak1mWWqRvl8CV8fLzRvaCZ1YVx7cfZGlgfKXf
 xcjBISFgIjFntWgXIxeHkMAxRonGaSuZuhg5geJuErfv72QFsdkENCXmXzrIAmKLCJhLNM98
 zQhiM4M0LF5WAWILC1hIbPp+CKyeRUBV4uOS2cwgNi9Q/Zk3H9khZspLtC/fzgaylxOofu9M
 A5CwEFDJ2TXvWSDKBSVOznzCAjFeXqJ562zmCYx8s5CkZiFJLWBkWsUokFhmrJeZXKyXll9U
 kqGXXrSJERy0jL47GG9vfqt3iJGJg/EQowQHs5II7+uAd3FCvCmJlVWpRfnxRaU5qcWHGKU5
 WJTEefO4l8cKCaQnlqRmp6YWpBbBZJk4OKUamNZJn29j/7FmXcDL/mMTLyu/cm9gPlG9Zerx
 XvO/ev+Kenr3Pby88JuPpALz/I3cHrd379tqZjZLuo/jscD7WYW9YmGnE/0nmTYW+KeWLr//
 a4K7/2/ev/+Mqox7bjExbolgeXxdRPyDjeGsCRN+sr8/395wRPrMqt+/rxSycZj4HQ2KF/CI
 33cw1F78vnse4w3PHiGbw/pu378t3lqy8atW9c2Lt8P/9h7l2Jm47f/Kh7kOk1c96TmgfK2P
 29S2e1mrp8epLNFb8ZKev64c/NzsuvKChKC+9YJrP95uSVo09ZbIW9VpL15HzOuZOely46MX
 UVO+Vv45Pq1kfo3V5b5PGV1PVyz2PLPcPsynJWyvEktxRqKhFnNRcSIAfaPQbskCAAA=
X-Greylist: inspected by milter-greylist-4.6.2 (mailgate-2.ics.forth.gr
 [139.91.1.5]);
 Tue, 23 Jun 2020 15:05:27 +0000 (GMT) for IP:'139.91.1.77' DOMAIN:'av3in'
 HELO:'av3.ics.forth.gr' FROM:'mick@ics.forth.gr' RCPT:''
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mailgate-2.ics.forth.gr [139.91.1.5]); Tue, 23 Jun 2020 15:05:27 +0000 (GMT)
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
Cc: david.abdurachmanov@sifive.com, anup@brainfault.org, atish.patra@wdc.com,
 yibin_liu@c-sky.com, zong.li@sifive.com, paul.walmsley@sifive.com,
 Nick Kossifidis <mick@ics.forth.gr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patch allows Linux to act as a crash kernel for use with
kdump. Userspace will let the crash kernel know about the
memory region it can use through linux,usable-memory property
on the /memory node (overriding its reg property), and about the
memory region where the elf core header of the previous kernel
is saved, through a reserved-memory node with a compatible string
of "linux,elfcorehdr". This approach is the least invasive and
re-uses functionality already present.

I tested this on riscv64 qemu and it works as expected, you
may test it by retrieving the dmesg of the previous kernel
through /proc/vmcore, using the vmcore-dmesg utility from
kexec-tools.

v2:
 * Use linux,usable-memory on /memory instead of a new binding
 * Use a reserved-memory node for ELF core header

Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
---
 arch/riscv/Kconfig             | 10 ++++++++
 arch/riscv/kernel/Makefile     |  1 +
 arch/riscv/kernel/crash_dump.c | 46 ++++++++++++++++++++++++++++++++++
 arch/riscv/kernel/setup.c      | 35 +++++++++++++++++++++++---
 arch/riscv/mm/init.c           | 33 ++++++++++++++++++++++++
 5 files changed, 122 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/kernel/crash_dump.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e7dd2d1c5..6c59987f0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -353,6 +353,16 @@ config KEXEC
 
 	  The name comes from the similarity to the exec system call.
 
+config CRASH_DUMP
+	bool "Build kdump crash kernel"
+	help
+	  Generate crash dump after being started by kexec. This should
+	  be normally only set in special crash dump kernels which are
+	  loaded in the main kernel with kexec-tools into a specially
+	  reserved region and then later executed after a crash by
+	  kdump/kexec.
+
+	  For more details see Documentation/admin-guide/kdump/kdump.rst
 
 endmenu
 
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index b9a3842ad..f067f55f1 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -53,5 +53,6 @@ endif
 obj-$(CONFIG_HOTPLUG_CPU)	+= cpu-hotplug.o
 obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-${CONFIG_KEXEC}		+= kexec_relocate.o crash_save_regs.o machine_kexec.o
+obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
 
 clean:
diff --git a/arch/riscv/kernel/crash_dump.c b/arch/riscv/kernel/crash_dump.c
new file mode 100644
index 000000000..81b9d2a71
--- /dev/null
+++ b/arch/riscv/kernel/crash_dump.c
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * This code comes from arch/arm64/kernel/crash_dump.c
+ * Created by: AKASHI Takahiro <takahiro.akashi@linaro.org>
+ * Copyright (C) 2017 Linaro Limited
+ */
+
+#include <linux/crash_dump.h>
+#include <linux/io.h>
+
+/**
+ * copy_oldmem_page() - copy one page from old kernel memory
+ * @pfn: page frame number to be copied
+ * @buf: buffer where the copied page is placed
+ * @csize: number of bytes to copy
+ * @offset: offset in bytes into the page
+ * @userbuf: if set, @buf is in a user address space
+ *
+ * This function copies one page from old kernel memory into buffer pointed by
+ * @buf. If @buf is in userspace, set @userbuf to %1. Returns number of bytes
+ * copied or negative error in case of failure.
+ */
+ssize_t copy_oldmem_page(unsigned long pfn, char *buf,
+			 size_t csize, unsigned long offset,
+			 int userbuf)
+{
+	void *vaddr;
+
+	if (!csize)
+		return 0;
+
+	vaddr = memremap(__pfn_to_phys(pfn), PAGE_SIZE, MEMREMAP_WB);
+	if (!vaddr)
+		return -ENOMEM;
+
+	if (userbuf) {
+		if (copy_to_user((char __user *)buf, vaddr + offset, csize)) {
+			memunmap(vaddr);
+			return -EFAULT;
+		}
+	} else
+		memcpy(buf, vaddr + offset, csize);
+
+	memunmap(vaddr);
+	return csize;
+}
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 4dc940389..469470b0b 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -63,6 +63,9 @@ static struct resource code_res = { .name = "Kernel code", };
 static struct resource data_res = { .name = "Kernel data", };
 static struct resource rodata_res = { .name = "Kernel rodata", };
 static struct resource bss_res = { .name = "Kernel bss", };
+#ifdef CONFIG_CRASH_DUMP
+static struct resource elfcorehdr_res = { .name = "ELF Core hdr", };
+#endif
 
 static int __init add_resource(struct resource *parent,
 				struct resource *res)
@@ -133,6 +135,16 @@ static int __init add_crashk_resource(struct resource *res)
 }
 #endif
 
+#ifdef CONFIG_CRASH_DUMP
+static int __init add_elfcorehdr_resource(struct resource *res)
+{
+	if (res->start <= elfcorehdr_res.start && res->end >= elfcorehdr_res.end)
+		return add_resource(&iomem_resource, &elfcorehdr_res);
+
+	return 0;
+}
+#endif
+
 static void __init init_resources(void)
 {
 	struct memblock_region *region = NULL;
@@ -155,6 +167,14 @@ static void __init init_resources(void)
 	bss_res.end = __pa_symbol(__bss_stop) - 1;
 	bss_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
 
+#ifdef CONFIG_CRASH_DUMP
+	if (elfcorehdr_size) {
+		elfcorehdr_res.start = elfcorehdr_addr;
+		elfcorehdr_res.end = elfcorehdr_addr + elfcorehdr_size - 1;
+		elfcorehdr_res.flags = IORESOURCE_SYSTEM_RAM | IORESOURCE_BUSY;
+	}
+#endif
+
 	/*
 	 * Start by adding the reserved regions, if they overlap
 	 * with /memory regions, insert_resource later on will take
@@ -185,6 +206,14 @@ static void __init init_resources(void)
 			continue;
 #endif
 
+#ifdef CONFIG_CRASH_DUMP
+		ret = add_elfcorehdr_resource(res);
+		if (ret < 0)
+			goto error;
+		else if (ret)
+			continue;
+#endif
+
 		/*
 		 * Ignore any other reserved regions within
 		 * system memory.
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index e4ce3a2af..c85ddfe44 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -13,6 +13,7 @@
 #include <linux/swap.h>
 #include <linux/sizes.h>
 #include <linux/of_fdt.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/libfdt.h>
 #include <linux/set_memory.h>
 #include <linux/crash_dump.h>
@@ -123,6 +124,26 @@ static void __init setup_initrd(void)
 }
 #endif /* CONFIG_BLK_DEV_INITRD */
 
+#ifdef CONFIG_CRASH_DUMP
+/*
+ * We keep track of the ELF core header of the crashed
+ * kernel with a reserved-memory region with compatible
+ * string "linux,elfcorehdr". Here we register a callback
+ * to populate elfcorehdr_addr/size when this region is
+ * present. Note that this region will be marked as
+ * reserved once we call early_init_fdt_scan_reserved_mem()
+ * later on.
+ */
+static int elfcore_hdr_setup(struct reserved_mem *rmem)
+{
+	elfcorehdr_addr = rmem->base;
+	elfcorehdr_size = rmem->size;
+	return 0;
+}
+
+RESERVEDMEM_OF_DECLARE(elfcorehdr, "linux,elfcorehdr", elfcore_hdr_setup);
+#endif
+
 static phys_addr_t dtb_early_pa __initdata;
 
 void __init setup_bootmem(void)
@@ -537,6 +558,18 @@ static void __init reserve_crashkernel(void)
 
 	int ret = 0;
 
+	/*
+	 * Don't reserve a region for a crash kernel on a crash kernel
+	 * since it doesn't make much sense and we have limited memory
+	 * resources.
+	 */
+#ifdef CONFIG_CRASH_DUMP
+	if (is_kdump_kernel()) {
+		pr_info("crashkernel: ignoring reservation request\n");
+		return;
+	}
+#endif
+
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base);
 	if (ret || !crash_size)
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
