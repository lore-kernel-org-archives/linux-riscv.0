Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5401E109446B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 11:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OoQtJ1henJtV+wyUrY8GKoIW5oWpI6JDBvwDr6JBqfg=; b=ulJgLesypQi3gH
	Ln7jbTvez76b3WfukaXF7Hr5ZuAxNmCYp3528XTLv22nYQtraS64C/Wlvvt4LKqfeAy8qdbc8IQ1I
	kOGD5YB4sqTIeCzY6R/0b90yTmxLudYlHoatGr1+w/hLOePHOyajmSoQ38WY1P4T4ZzKhHnxSEEmJ
	iNxYuPxzVenEG72WYXoXsAEPChjTkEUaLsxgc1VOodz8u0oSjT1tsS3cldhlUWihkcTutFl/D+q/q
	6ojGjAnWhxtxxEzQ8PvoqGkR7HqQRRwHCX63Bpp23whSXksDjFvVjIYjzZEYD4hWSRdT0qwxB0hbq
	R3T9hi62tzmQ1QAdH/0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ubG-0000000EPyD-3oTN;
	Sat, 21 Mar 2026 11:34:38 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3ubE-0000000EPxl-16nc
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 11:34:37 +0000
Received: from yzs (unknown [115.192.255.131])
	by APP-01 (Coremail) with SMTP id qwCowAB3IW1Bgr5ptGi1Cg--.11653S2;
	Sat, 21 Mar 2026 19:34:25 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	Will Pierce <wgpierce17@gmail.com>,
	Maxim Kochetkov <fido_max@inbox.ru>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH] riscv: Check the return value of reloc handlers
Date: Sat, 21 Mar 2026 19:34:19 +0800
Message-ID: <20260321113419.34437-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowAB3IW1Bgr5ptGi1Cg--.11653S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF4UZF1ktr43GrWrXr18Krg_yoW5JFWDpF
	ZxG34ayFWkCw12gF48t3Wvgr4fCa1kWr47WFZ0gw4SywnxCr1rt345tw1FqFZ3Wr929FyU
	Xr1j9F1UCw4UArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbo5l5UUUUU==
X-Originating-IP: [115.192.255.131]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkNA2m9-DP1mAAAs2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_043436_673982_F976A930 
X-CRM114-Status: GOOD (  10.94  )
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

Currently, process_accumulated_relocations() ignores the return values
from both reloc_handler() and accumulate_handler().

As a result, the kernel will proceed to load the module with corrupted
or incomplete sections, which can lead to unpredictable behavior or
kernel panics.

So we need to check the return values of the handlers to propagate the
error, and fall back to the cleanup mode.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
 arch/riscv/kernel/module.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 1961135689db..b6512fa9aca1 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -594,7 +594,7 @@ static const struct relocation_handlers reloc_handlers[] = {
 	/* 192-255 nonstandard ABI extensions  */
 };
 
-static void
+static int
 process_accumulated_relocations(struct module *me,
 				struct hlist_head **relocation_hashtable,
 				struct list_head *used_buckets_list)
@@ -625,6 +625,7 @@ process_accumulated_relocations(struct module *me,
 	int curr_type;
 	void *location;
 	long buffer;
+	int res, error = 0;
 
 	list_for_each_entry_safe(bucket_iter, bucket_iter_tmp,
 				 used_buckets_list, head) {
@@ -637,18 +638,27 @@ process_accumulated_relocations(struct module *me,
 						 &rel_head_iter->rel_entry,
 						 head) {
 				curr_type = rel_entry_iter->type;
-				reloc_handlers[curr_type].reloc_handler(
-					me, &buffer, rel_entry_iter->value);
+				if (!error) {
+					res = reloc_handlers[curr_type].reloc_handler(
+						me, &buffer, rel_entry_iter->value);
+					if (res)
+						error = res;
+				}
 				kfree(rel_entry_iter);
 			}
-			reloc_handlers[curr_type].accumulate_handler(
-				me, location, buffer);
+			if (!error) {
+				res = reloc_handlers[curr_type].accumulate_handler(
+					me, location, buffer);
+				if (res)
+					error = res;
+			}
 			kfree(rel_head_iter);
 		}
 		kfree(bucket_iter);
 	}
 
 	kvfree(*relocation_hashtable);
+	return error;
 }
 
 static int add_relocation_to_accumulate(struct module *me, int type,
@@ -886,10 +896,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 			return res;
 	}
 
-	process_accumulated_relocations(me, &relocation_hashtable,
+	return process_accumulated_relocations(me, &relocation_hashtable,
 					&used_buckets_list);
-
-	return 0;
 }
 
 int module_finalize(const Elf_Ehdr *hdr,
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
