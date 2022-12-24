Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B09AC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Dec 2022 15:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=283rYX2/l8wLotYDQageGvltSOmPWlZHQ069wldDao8=; b=3NHlIzg5AIE29V
	D8giPFCVWaJz4XmK81t9TeEZpqOGf/c3BtNn5PzpAQlGtlG03xyAD457v5SCKRX3L8o3AvR4I2/9d
	NV7UQgIbyxI894rfFzLMPuZg7wPYRuGw835p66kUc4VGGDBlUY8jVb8j1+ArH+5O6DbaEu9/N3ezb
	9YCcSfh+aYv1k0YXk//5GNAVEOwP7P60iNpiDNNU3OWOIvcvZXpGsUQeNI1OHTEmap8YbGhgNNzcH
	HMzy1OoQ/WRVZmWvOx7fJHwiXcnX0Ks9fiepLMpS02g5pcNDbYKwxOOjgoL6Lay/VC2coG542evN2
	PH8hMC0VYrRA5b93O3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p96NX-0013xT-TP; Sat, 24 Dec 2022 15:24:04 +0000
Received: from smtp23.cstnet.cn ([159.226.251.23] helo=cstnet.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p92wP-00H5uf-Kk
	for linux-riscv@lists.infradead.org; Sat, 24 Dec 2022 11:43:57 +0000
Received: from cgk-Precision-3650-Tower.. (unknown [219.141.235.82])
	by APP-03 (Coremail) with SMTP id rQCowABXXpbf5aZj9dVkCA--.18955S6;
	Sat, 24 Dec 2022 19:43:27 +0800 (CST)
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
Subject: [PATCH v5 2/9] riscv/kprobe: Allocate detour buffer from module area
Date: Sat, 24 Dec 2022 19:43:08 +0800
Message-Id: <20221224114315.850130-3-chenguokai17@mails.ucas.ac.cn>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
References: <20221224114315.850130-1-chenguokai17@mails.ucas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: rQCowABXXpbf5aZj9dVkCA--.18955S6
X-Coremail-Antispam: 1UD129KBjvJXoW7ur1kJFWrKrWfCrW7Wr15urg_yoW8urW3pF
	4DCr45JrZ8Aw13G3yayw1kZr9YvaykXw47KrW2vF1UZw47tr43Zw4v934Fqrn5trW29FyY
	qr4q9ryS9ayUZaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmK14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
	ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26F4UJVW0owAa
	c4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
	ACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE14v_Gw4l42xK82IYc2Ij64vIr41l4I8I
	3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxV
	WUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAF
	wI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcI
	k0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j
	6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUjSdgDUUUU
X-Originating-IP: [219.141.235.82]
X-CM-SenderInfo: xfkh0w5xrntxyrx6ztxlovh3xfdvhtffof0/1tbiAwEKE2OmnOhnLgAAsj
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221224_034350_179072_5BC3E1EF 
X-CRM114-Status: UNSURE (   7.38  )
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
architecture, detour buffer slot used for optprobes is allocated from
the region, the distance of which from kernel should be less than 4GB.

For the time being, Modules region always live before the kernel.
But Vmalloc region reside far from kernel, the distance is half of the
kernel address space (See Documentation/riscv/vm-layout.rst), hence it
needs to override the alloc_optinsn_page() to make sure allocate detour
buffer from jump-safe region.

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
