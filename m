Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01958C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 01:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xu71I3A6vJc0TjEU24Zzf995VCISbM5VJfTGKSXDJB0=; b=egRRMvJb6pB5YJ
	p6k4x7USwzC4wZ1YSc28bGFLEenxEmvaHDN+FhtBC7NjTVZFvxo31zz4KjPw76HrbcXfVogsUm/tX
	kcbmK7EIEtgVzff3z6PJ4fzi8uAowok0iLrDxTs/11kzXpEglssr/TsnSKqbz/SMxnCgz2gHMMEG4
	N8nEbGyEtKjCGpDtmTPVvax6RGxVc2LgnJyWg9ZuyTcISTLRAxb03NutvlNmMgAusacr507T6QJIg
	h1oJCB1GW3lBAsROdqaR6yu1+fkgdf8bYVc+Svhx/fsfIW7WC/ny1K8Qwm+ngCdWmJmvlB1TD0VgB
	TPlFk94+Og9O1uipYAgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDaxK-00GSV9-2Z;
	Thu, 14 Dec 2023 01:56:06 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDaxH-00GSTu-0t
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 01:56:05 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-5e282ec7537so17797407b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 17:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1702518959; x=1703123759; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cXS16Jh4pIOzCXaU9yjoq8w+1VlIvNkLy1RXeo+6UJw=;
        b=s6JrQD5/6jVijydTIfenuadv1gtrv8eYIcq0IyOVyHnvqmy9JrYA1cSidPc5YXk8Yj
         IHX1kFwofSg0valESkZ9nA+nkjHXX+5b3LesSuTAoJKhT15ESTVxWRE8MGvqakn/IG5D
         gwnCSV3BS9c9JQwcFL5uq4azBdIKUs8m64BP++fw7FYydpys63C/vlgKy98NJb1Q4rv7
         /65F2EOE7x307qQhiR7lfHDjc9zryNaLB6XTAu2ijNKVkCzZgrMySqRcqx+awfwP/n2+
         +dzLaVZ3syehTR1vo9nmbD9zbP5+RYMMx22TcW+CuXeACs0b3SH/oEssTUXizKgUyZ3k
         AD8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702518959; x=1703123759;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXS16Jh4pIOzCXaU9yjoq8w+1VlIvNkLy1RXeo+6UJw=;
        b=HMcIXAZ3wfYJavxxk+SVqoDmONXwb6eNxfCiI8ETVdzcbgnSkWrxb9cysZI2q39yYU
         DzGvTlSH93lAnrNuqCAiJIFLx2hU/yAeHNF/JBNR5H7omGBR8WZ2fdAYhX18NJpdWjRk
         B/aTlgepVCgd2NUwLX1cITnDxdw46YdPH3yBLQczmQTTu07Ino7boaB7aSucxU6pv4H+
         6S5i2eSl4lAdVJlWteMFguSSUOig1Y4eAVJnW5U5GptOWj8gMQWzseNoX9It0h6PLPFQ
         PcpLTuNsFr7tI5lRcQ1F6Mg9JK8mgTP1x4ZZbUfa2QYVLsciEHTPVwWCpJsKBooNDJXN
         i+EA==
X-Gm-Message-State: AOJu0YwTy6tOPJIW+cHcRJuehvALUC+h+QU+fwT12CquPjvRN8PVcQ9L
	/wxDDqiqybTCq8Eye0ENheTCihrY9dqQsG15zO8=
X-Google-Smtp-Source: AGHT+IHYs5cilcDVUOrJUHpiP7G73AZjkSakO4l1hqIQvJu47TRWrJ3EvXIYBi50ZKS1fa90AufsyA==
X-Received: by 2002:a0d:c783:0:b0:5d7:1941:3557 with SMTP id j125-20020a0dc783000000b005d719413557mr7373865ywd.62.1702518959472;
        Wed, 13 Dec 2023 17:55:59 -0800 (PST)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id q68-20020a818047000000b005d580a1fd70sm5094434ywf.75.2023.12.13.17.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 17:55:58 -0800 (PST)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 13 Dec 2023 17:55:46 -0800
Subject: [PATCH] riscv: Fix module loading free order
MIME-Version: 1.0
Message-Id: <20231213-module_loading_fix-v1-1-da9b7c92ade5@rivosinc.com>
X-B4-Tracking: v=1; b=H4sIAKFgemUC/x2MQQqAIBAAvyJ7TkiNqL4SIaJbLZiGUgTh35OOM
 zDzQsZEmGFiLyS8KVMMFUTDwO4mbMjJVQbZSiWkUPyI7vKofTSOwqZXergytncdmkHIEWp4Jqz
 6n85LKR/ikY0OZAAAAA==
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <charlie@rivosinc.com>, 
 kernel test robot <lkp@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
 Julia Lawall <julia.lawall@inria.fr>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1702518957; l=4248;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=AGHOVl6+fAnfdvSS+mkS/6T3AqWPxNDKq2uwr8rys0g=;
 b=ru835i0uXHd7SNhF7jm+mG44Au3M+8+dIJkg5+UV1qqMV2fKp1Fv0KYVSpvrRe1n6akOhSLGG
 hP2gK1dE40bCgGPjBpU49KZ7wq+UarP0JiCE9KHHR++u0aRdIpdW2ge
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_175603_562263_9E554B6B 
X-CRM114-Status: GOOD (  14.50  )
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

Various changes to riscv module loading mainly in regards to freeing.
Also change iteration of relocation entries to a do-while loop since it
is guaranteed that there will be at least one entry in the linked list,
and the loop sets the curr_type value.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: d8792a5734b0 ("riscv: Safely remove entries from relocation list")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202312132019.iYGTwW0L-lkp@intel.com/
Closes: https://lore.kernel.org/r/202312130859.wnkuzVWY-lkp@intel.com/
Reported-by: Julia Lawall <julia.lawall@inria.fr>
Closes: https://lore.kernel.org/r/202312120044.wTI1Uyaa-lkp@intel.com/
---
 arch/riscv/kernel/module.c | 45 ++++++++++++++++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
index aac019ed63b1..fc7ce101d9a5 100644
--- a/arch/riscv/kernel/module.c
+++ b/arch/riscv/kernel/module.c
@@ -633,15 +633,31 @@ process_accumulated_relocations(struct module *me,
 					  bucket_iter->bucket, node) {
 			buffer = 0;
 			location = rel_head_iter->location;
-			list_for_each_entry_safe(rel_entry_iter,
-						 rel_entry_iter_tmp,
-						 rel_head_iter->rel_entry,
-						 head) {
+			rel_entry_iter =
+				list_first_entry(rel_head_iter->rel_entry,
+						 typeof(*rel_entry_iter), head);
+			rel_entry_iter_tmp =
+				list_next_entry(rel_entry_iter, head);
+
+			/*
+			 * Iterate through all relocation entries that share
+			 * this location. This uses a do-while loop instead of
+			 * list_for_each_entry_safe since it is known that there
+			 * is at least one entry and curr_type needs to be the
+			 * value of the last entry when the loop exits.
+			 */
+			do {
 				curr_type = rel_entry_iter->type;
 				reloc_handlers[curr_type].reloc_handler(
 					me, &buffer, rel_entry_iter->value);
 				kfree(rel_entry_iter);
-			}
+
+				rel_entry_iter = rel_entry_iter_tmp;
+				rel_entry_iter_tmp = list_next_entry(rel_entry_iter_tmp, head);
+			} while (!list_entry_is_head(rel_entry_iter,
+						     rel_head_iter->rel_entry,
+						     head));
+
 			reloc_handlers[curr_type].accumulate_handler(
 				me, location, buffer);
 			kfree(rel_head_iter);
@@ -723,8 +739,8 @@ static int add_relocation_to_accumulate(struct module *me, int type,
 
 			if (!bucket) {
 				kfree(entry);
-				kfree(rel_head);
 				kfree(rel_head->rel_entry);
+				kfree(rel_head);
 				return -ENOMEM;
 			}
 
@@ -741,12 +757,15 @@ static int add_relocation_to_accumulate(struct module *me, int type,
 	return 0;
 }
 
-static unsigned int
-initialize_relocation_hashtable(unsigned int num_relocations,
-				struct hlist_head **relocation_hashtable)
+static u32 initialize_relocation_hashtable(unsigned int num_relocations,
+					   struct hlist_head **relocation_hashtable)
 {
 	/* Can safely assume that bits is not greater than sizeof(long) */
 	unsigned long hashtable_size = roundup_pow_of_two(num_relocations);
+	/*
+	 * When hashtable_size == 1, hashtable_bits == 0.
+	 * This is valid because the hashing algorithm returns 0 in this case.
+	 */
 	unsigned int hashtable_bits = ilog2(hashtable_size);
 
 	/*
@@ -760,10 +779,10 @@ initialize_relocation_hashtable(unsigned int num_relocations,
 	hashtable_size <<= should_double_size;
 
 	*relocation_hashtable = kmalloc_array(hashtable_size,
-					      sizeof(*relocation_hashtable),
+					      sizeof(**relocation_hashtable),
 					      GFP_KERNEL);
 	if (!*relocation_hashtable)
-		return -ENOMEM;
+		return 0;
 
 	__hash_init(*relocation_hashtable, hashtable_size);
 
@@ -789,8 +808,8 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
 	hashtable_bits = initialize_relocation_hashtable(num_relocations,
 							 &relocation_hashtable);
 
-	if (hashtable_bits < 0)
-		return hashtable_bits;
+	if (!relocation_hashtable)
+		return -ENOMEM;
 
 	INIT_LIST_HEAD(&used_buckets_list);
 

---
base-commit: a39b6ac3781d46ba18193c9dbb2110f31e9bffe9
change-id: 20231213-module_loading_fix-3ac6d4ea8129
-- 
- Charlie


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
