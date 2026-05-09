Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB05ACD3447
	for <linux-riscv@archiver.kernel.org>; Sat,  9 May 2026 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6zOGhQ+UOwS/rLCzGUt9jP8wWl1qo5n58ns6SKDjNr8=; b=A10z9hJn6ph43U
	/gniX795goeGWKjqqzQKd7n1V3j7ZaJ+9Uox2hUkpLjoyc8zYS1IBEUoDO6II3v1nE75O6Xmgjyzk
	YBdZ9NKz3EOpPjWdfG0s66E5bcw6I4KWMi7pn3rPIhB2rpVPK++1ihk3B+gtsrD228EMb2FAz5DFz
	TIWevHx1Dh6KLeu0aURw2/J8szBeS+0cMtYGAvwYhOgnG7OZibIIwcpJVQbCD8ekmNx40RguVc1Y5
	wzlSw2y4t+QNC9RkxrB6jkw3ubnxOKlTH2jo9ryBzM0iAxK+cavDfZ5FeFEheZpQ3lslvpKMOGMjE
	Tqh2k3UDdYSyKS0fRfiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcIy-00000008VXv-0NBS;
	Sat, 09 May 2026 07:40:56 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLcIv-00000008VWA-0prp
	for linux-riscv@lists.infradead.org;
	Sat, 09 May 2026 07:40:54 +0000
Received: from yzs (unknown [115.199.218.204])
	by APP-01 (Coremail) with SMTP id qwCowAC3Xmr_5P5p0eyvDw--.12791S2;
	Sat, 09 May 2026 15:40:47 +0800 (CST)
From: Zishun Yi <vulab@iscas.ac.cn>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: alex@ghiti.fr,
	kees@kernel.org,
	charlie@rivosinc.com,
	Zishun Yi <vulab@iscas.ac.cn>
Subject: [PATCH v2] riscv: Check the return value of reloc handlers
Date: Sat,  9 May 2026 15:40:46 +0800
Message-ID: <20260509074046.1747927-1-vulab@iscas.ac.cn>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
X-CM-TRANSID: qwCowAC3Xmr_5P5p0eyvDw--.12791S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJF1ktw43Ar4DCrW7Gw4fuFg_yoW5GF13pF
	ZxG3sIyFWkCw12gF48t3Wvgw4fCa1kWr47WrZ0gw4SywnxCr1rt345tw1YqFn3Wr929FWU
	Xr1j9F1UCw4UArDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUkG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUpwZcUUU
	UU=
X-Originating-IP: [115.199.218.204]
X-CM-SenderInfo: pyxotu46lvutnvoduhdfq/1tbiDAUCA2n+2sIcQQACsY
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260509_004053_711372_D34E4DFC 
X-CRM114-Status: GOOD (  11.25  )
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
Assisted-by: Gemini:gemini-3.1-pro
Signed-off-by: Zishun Yi <vulab@iscas.ac.cn>
---
Changes in v2:
- Added 'Assisted-by' tag.

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
