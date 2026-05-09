Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15ABCCD343F
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 11:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=niSbOaWnonN5BBTSGo+Tmc+FiNRw4z1Fmq5/4w4incw=; b=kjToVmMOOKoc1k
	ZKzaLrmJq0ZJe0owkej5p9bjPdLWpQ64MSZxX6PngpnYguOCrjHtaAVsLLIl573TB5VJ6KXCbYllA
	/u5LaNIndU3Z7huylofYXwJ/1D+8Fndi2N8Y1uuuVANpaMfTv9YjfF7kzTC+B/5N8TQO2MYccSDQo
	tt35AuAeIfGZ6PVGWV7cx6fVAJjUpQQkwk580qnhyRpAqDPYkwW2OajqGZ01TPkAFAhW0racusI+A
	3y24McsSFDU+k9Ta2QtM94WlgDlJHt8+bYW6CEHElPtx0LU71BSCta0qGzs8JbNOH44IufyOYmPQQ
	uIC3VZtmwXUvQMF2iCmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgDJ-00000008sFw-1XBn;
	Sat, 09 May 2026 11:51:21 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLgDG-00000008sFB-11Bb
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 11:51:20 +0000
Received: from yzs (unknown [115.199.218.204])
	by APP-05 (Coremail) with SMTP id zQCowABX6QylH_9pIgPLDw--.3436S2;
	Sat, 09 May 2026 19:51:01 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Kees Cook <kees@kernel.org>,
	Charlie Jenkins <charlie@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH v2] riscv: Fix memory leak in apply_relocate_add
Date: Sat,  9 May 2026 19:51:00 +0800
Message-ID: <20260509115100.1879716-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: zQCowABX6QylH_9pIgPLDw--.3436S2
X-Coremail-Antispam: 1UD129KBjvJXoWxGr17Xw18CF4fKry8CF18Grg_yoW5ur4UpF
	13G34SyrWfGr1xtrnIq3WkWw4fGa1kWr47Z3y29wsaywsxA3WFq343KF1FqF95Xryvgr45
	WFWj93WUCw4UAFDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
	0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v26r1q
	6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI
	0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y
	0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1l
	IxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbHa0JUUUU
	U==
X-Originating-IP: [115.199.218.204]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAcCA2n+2sLWYgAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_045118_768057_2CB28FB8 
X-CRM114-Status: GOOD (  11.69  )
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
Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
Changes in v2:
- Added 'Assisted-by' tag.

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
