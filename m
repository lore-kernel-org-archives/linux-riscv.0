Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74FBFC54EAA
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Jan 2023 13:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L4Le/V+l6GzzZ9Os3OqBw2g2PGZ9Ws5cxOAXkGv1hlg=; b=XASA0DsjMIB2eQ
	6utWQoh5OyrwocY7APN7pIz5ZJSr/L79HCRmUwGoiz58w8LqwwfcANiaZxroHSp6swMUh4YrIg9FV
	ltrABdUZNZDdoaoujBqnZEKCuOXDCQf6jMKga2JRybwJMTLpsGeR3BgYs/V5u7D9pSe5ZZOkGmsP/
	XPfA4qynyq2UKq8lEOkjAkSpmgRBJC3lKpwz3/NoxcN+LT5uVpsxFiR8ugDteDNW01E/7P51Jbzid
	IpYZSMYxQq7ri0UKvI/KSqDbRnYiwmeiED74/p9UeTUwnRgRajVDPP12tEkls1kVq75Pa0VeYP4az
	pv5SzF8JT+pdKCspac5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOqD-00F1Jc-1j; Fri, 27 Jan 2023 13:32:29 +0000
Received: from smtp80.cstnet.cn ([159.226.251.80] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pLOR0-00Ery4-FR
	for linux-riscv@lists.infradead.org; Fri, 27 Jan 2023 13:06:37 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-01 (Coremail) with SMTP id qwCowADX3Eg9zNNjDyF3Ag--.52827S6;
	Fri, 27 Jan 2023 21:06:08 +0800 (CST)
From: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	rostedt@goodmis.org,
	mingo@redhat.com,
	sfr@canb.auug.org.au
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liaochang1@huawei.com,
	Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Subject: [PATCH v6 02/13] riscv/kprobe: Allocate detour buffer from module region
Date: Fri, 27 Jan 2023 21:05:30 +0800
Message-Id: <20230127130541.1250865-3-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
References: <20230127130541.1250865-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowADX3Eg9zNNjDyF3Ag--.52827S6
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1kJFWrtw13AFyfAFWrKrg_yoW8uFyxpF
	4DCr45XrZ8Aw13GrWayw1v9r9YqFykJr47KrW2vr10vw43tr47Aw4v934Fqr95JrWj9Fy5
	Wr4q9ryYkFWUA3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQj14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2vYz4IE04k24VAvwVAKI4IrM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64
	kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYx
	C7M4IIrI8v6xkF7I0E8cxan2IY04v7MxkIecxEwVAFwVW5GwCF04k20xvY0x0EwIxGrwCF
	x2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14
	v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY
	67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2
	IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_
	Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pREtCwUUUUU=
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiCgUEE2PTtMIZwAABsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230127_050627_131392_B3AC6840 
X-CRM114-Status: UNSURE (   8.97  )
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

From: Liao Chang <liaochang1@huawei.com>

To address the limitation of PC-relative branch instruction on riscv
architecture, detour buffer slot used for optprobes has to be allocated
at virtual address that can access from kernel and modules text via
AUIPC/JALR.

For the time being, the vmalloc region is far from kernel/modules text,
the distance between them is half of kernel address space [1], which
can't transfer control to 32-bit pc-relative address, hence it needs to
override the alloc_optinsn_page() to allocate detour buffer from module
region.

[1] Documentation/riscv/vm-layout.rst

Signed-off-by: Liao Chang <liaochang1@huawei.com>
Co-developed-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
Signed-off-by: Chen Guokai <chenguokai17@mails.ucas.ac.cn>
---
 arch/riscv/kernel/probes/kprobes.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index f21592d20306..e1856b04db04 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -6,6 +6,7 @@
 #include <linux/extable.h>
 #include <linux/slab.h>
 #include <linux/stop_machine.h>
+#include <linux/set_memory.h>
 #include <asm/ptrace.h>
 #include <linux/uaccess.h>
 #include <asm/sections.h>
@@ -84,6 +85,29 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 }
 
 #ifdef CONFIG_MMU
+#if defined(CONFIG_OPTPROBES) && defined(CONFIG_64BIT)
+void *alloc_optinsn_page(void)
+{
+	void *page;
+
+	page = __vmalloc_node_range(PAGE_SIZE, 1, MODULES_VADDR,
+				    MODULES_END, GFP_KERNEL,
+				    PAGE_KERNEL, 0, NUMA_NO_NODE,
+				    __builtin_return_address(0));
+	if (!page)
+		return NULL;
+
+	set_vm_flush_reset_perms(page);
+	/*
+	 * First make the page read-only, and only then make it executable to
+	 * prevent it from being W+X in between.
+	 */
+	set_memory_rox((unsigned long)page, 1);
+
+	return page;
+}
+#endif
+
 void *alloc_insn_page(void)
 {
 	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
