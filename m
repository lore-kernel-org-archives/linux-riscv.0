Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A7C109446B
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Mar 2026 11:29:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=V9ZI7VmF47OQf+91SgnFSASKD4/CB/74Yfp0dujDzSw=; b=IuxhTiiY17wGVf
	M7jw5VFiasTQe6wmfTcLDa27dFgmOKQBdz5OCtOzx6HKJ48qkl/9xyLDZbSSejaVzJOxOkQj3JN9P
	Fvv8Gx9zJXNCcavVK7r7uH2GE5idvXZlfOxusGU4wwfMvEe4VAOr4xveQSKxAQGYEH7qjZU+7Ab4+
	+z2Pc29gkWnB3JV/8uBleiBGjhQI+FuNErBUOlXum6FKU4xnppEzkZd2bkbichNF9AwbY09HI2MOf
	7TL97hKBQ35PUPRnaruG+kZfcx9ofMtz7glBz+vaVlLHO9kUa2xMMfe0BcjtDkGlevNJJ/xcuLr8D
	HmFaWqMb8suVCIe0s+Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uVk-0000000EPX4-07Rh;
	Sat, 21 Mar 2026 11:28:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3uVg-0000000EPWi-1br8
	for linux-riscv@lists.infradead.org;
	Sat, 21 Mar 2026 11:28:54 +0000
Received: from yzs (unknown [115.192.255.131])
	by APP-01 (Coremail) with SMTP id qwCowADXgW3egL5p8U21Cg--.50143S2;
	Sat, 21 Mar 2026 19:28:31 +0800 (CST)
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
Subject: [PATCH] riscv: Fix memory leak in apply_relocate_add
Date: Sat, 21 Mar 2026 19:28:27 +0800
Message-ID: <20260321112827.31691-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXgW3egL5p8U21Cg--.50143S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCF4UtrWrWr4xCw47Jw4kXrb_yoW5ZF15pF
	13C34SyrWfGr1xtrnIq3WkWr4fGa1kWr47Z3y29wsaywsxA3WFqa43KF1FqF95Xryvgr45
	WFyj93WUCw4UAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9j14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r126r1DMcIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbtxhJUUUUU==
X-Originating-IP: [115.192.255.131]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiBwkNA2m9-DNhvQABsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260321_042852_801655_EB4178D0 
X-CRM114-Status: GOOD (  11.12  )
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

The error path in apply_relocate_add() forgets to clean up the hashtable
allocated at the beginning. But we should not use
process_accumulated_relocations() as a cleanup function because some
entries may be half-finished, and we cannot write incorrect values back
to memory.

So, add cleanup_accumulated_relocations() for freeing all memory
allocated in the error paths.

Fixes: 8fd6c5142395 ("riscv: Add remaining module relocations")
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
 arch/riscv/kernel/module.c | 44 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 43 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index 1961135689db..5ac3f2cd55bc 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -594,6 +594,38 @@ static const struct relocation_handlers reloc_handlers[] = {
 	/* 192-255 nonstandard ABI extensions  */
 };
 
+static void
+cleanup_accumulated_relocations(struct hlist_head **relocation_hashtable,
+				struct list_head *used_buckets_list)
+{
+	/*
+	 * Clean up accumulated relocations without applying them.
+	 */
+	struct used_bucket *bucket_iter;
+	struct used_bucket *bucket_iter_tmp;
+	struct relocation_head *rel_head_iter;
+	struct hlist_node *rel_head_iter_tmp;
+	struct relocation_entry *rel_entry_iter;
+	struct relocation_entry *rel_entry_iter_tmp;
+
+	list_for_each_entry_safe(bucket_iter, bucket_iter_tmp,
+				 used_buckets_list, head) {
+		hlist_for_each_entry_safe(rel_head_iter, rel_head_iter_tmp,
+					  bucket_iter->bucket, node) {
+			list_for_each_entry_safe(rel_entry_iter,
+						 rel_entry_iter_tmp,
+						 &rel_head_iter->rel_entry,
+						 head) {
+				kfree(rel_entry_iter);
+			}
+			kfree(rel_head_iter);
+		}
+		kfree(bucket_iter);
+	}
+
+	kvfree(*relocation_hashtable);
+}
+
 static void
 process_accumulated_relocations(struct module *me,
 				struct hlist_head **relocation_hashtable,
@@ -802,6 +834,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 				continue;
 			pr_warn("%s: Unknown symbol %s\n",
 				me->name, strtab + sym->st_name);
+			cleanup_accumulated_relocations(&relocation_hashtable,
+							&used_buckets_list);
 			return -ENOENT;
 		}
 
@@ -815,6 +849,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 		if (!handler) {
 			pr_err("%s: Unknown relocation type %u\n",
 			       me->name, type);
+			cleanup_accumulated_relocations(&relocation_hashtable,
+							&used_buckets_list);
 			return -EINVAL;
 		}
 
@@ -868,6 +904,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 				pr_err(
 				  "%s: Can not find HI20 relocation information\n",
 				  me->name);
+				cleanup_accumulated_relocations(&relocation_hashtable,
+								&used_buckets_list);
 				return -EINVAL;
 			}
 
@@ -882,8 +920,12 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 							   &used_buckets_list);
 		else
 			res = handler(me, location, v);
-		if (res)
+
+		if (res) {
+			cleanup_accumulated_relocations(&relocation_hashtable,
+							&used_buckets_list);
 			return res;
+		}
 	}
 
 	process_accumulated_relocations(me, &relocation_hashtable,
-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
