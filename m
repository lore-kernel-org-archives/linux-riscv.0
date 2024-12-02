Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01BAD49792
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 01:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kuCLRj3tDr1/QwYkrjRWAgcKhP7Zhg71SGshGOQTVmM=; b=oij+vwIVxADDcU
	7BOLry6NxyOxRGzCda2y7L4ydFNLzI8p9INpm1FgqXClQwUxG4AMr2kV8avnv48T0HqjuXbC0a3Xj
	Z2MZUsNq4voFJc7e7swAz5PaT9W0V+ClQSei3AM3md87oR7mw8EDtOgBPByEeu+P9/Cp/kPsdrlri
	vsRdSxNi/vtnWG6+ecn+XM3s8nJ4MiGK6bM2M3ce+qsdAu3kfPsq8qlj2igxzvZijamn1E/fUrlf6
	Jxs/d5wwwad713yf7u8UsiQl9hrld2DDocRwycsE5NefqKuv2j5r3xhYXJTeh/3ujUcNBtOvb9qoP
	7jSPU7rdLYWd+F8LTuTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHvFh-00000004irC-462W;
	Mon, 02 Dec 2024 01:29:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHuwr-00000004dxa-0SAW;
	Mon, 02 Dec 2024 01:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eZxyC/oa3O5zPoDzB1CoMGk3nR9bO5IMGj2II6WDb4E=; b=G6jzmvtPm6v0YxKW/NCL1sgCO1
	XK9IbNvyraQKKMf4lKnMOvaVX1mmAr7faUORlxoNsDurmtXDW4IJ97XNiZANsW3Bf8Yjcl6pekXKA
	Bi8rC90w0v+EfijEwPSW4Rlht+3/1U8Ry7EzA4iCXhDhC6HjC4JymlW8LJBGbGicmu/UiDIGogVSl
	J0kANLMK6IYDuKWmWtoJjn51EZOJsm/AzzOVBITS7sRI+TkZPBCfr2e2FwU53h80GVMAF6/3G8z8b
	KAPnfugR6QKgdxbju2Fqc49p+Z9QJsxoC/uxT/Jo17Xl/4c2LddPBsxNeIPSufZA4yoq2XV4r9zrJ
	VGWIxTkQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHuwZ-000000024Z7-2KVi;
	Mon, 02 Dec 2024 01:09:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C15CFA409EB;
	Mon,  2 Dec 2024 01:07:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67777C4CED2;
	Mon,  2 Dec 2024 01:09:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733101778;
	bh=PP2VQoP2EFijtyRoI44vRPGiZLDX36MUSncHwQvCv1g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bRNBoGCIdmEvP2LAV9aWBOCE0RqRjoWRrZ+2pl/cgwyMG5vcj4ZuepINC3xC23PNF
	 TBeWWldGhWTEM9u2MN8vRuu82YxTCOmQkrMU5peDRfWyhTFYZE3wQ1Urlk6EofBZHp
	 s3UvN5XsBKV4ojBFGtnC4qSzxfRnrd8M/yPXNsmahCS0WWJ9o8qVjbOV81ZFQtYVsj
	 k9mN08Cz4bVHPfB4d0BHFdo/2/puo9xkszBMSSO7qc7nqwl5SSjCZtbmP85+lA+72Z
	 GOIEZwjftOrCVphym/y+1ftYXnre5El8IzQkuJVahwcqYxNkjTxvkFbkg8Z5jlPbqX
	 Ampooa4Yx32Ow==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Darrick J. Wong" <djwong@kernel.org>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH v4 17/19] jbd2: switch to using the crc32c library
Date: Sun,  1 Dec 2024 17:08:42 -0800
Message-ID: <20241202010844.144356-18-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241202010844.144356-1-ebiggers@kernel.org>
References: <20241202010844.144356-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_010952_918518_EDB78FC9 
X-CRM114-Status: GOOD (  20.04  )
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

From: Eric Biggers <ebiggers@google.com>

Now that the crc32c() library function directly takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32c().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Acked-by: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/jbd2/Kconfig      |  2 --
 fs/jbd2/journal.c    | 30 +++---------------------------
 include/linux/jbd2.h | 33 +++------------------------------
 3 files changed, 6 insertions(+), 59 deletions(-)

diff --git a/fs/jbd2/Kconfig b/fs/jbd2/Kconfig
index 4ad2c67f93f1..9c19e1512101 100644
--- a/fs/jbd2/Kconfig
+++ b/fs/jbd2/Kconfig
@@ -1,11 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config JBD2
 	tristate
 	select CRC32
-	select CRYPTO
-	select CRYPTO_CRC32C
 	help
 	  This is a generic journaling layer for block devices that support
 	  both 32-bit and 64-bit block numbers.  It is currently used by
 	  the ext4 and OCFS2 filesystems, but it could also be used to add
 	  journal support to other file systems or block devices such
diff --git a/fs/jbd2/journal.c b/fs/jbd2/journal.c
index 7e49d912b091..d8084b31b361 100644
--- a/fs/jbd2/journal.c
+++ b/fs/jbd2/journal.c
@@ -1367,24 +1367,16 @@ static int journal_check_superblock(journal_t *journal)
 		printk(KERN_ERR "JBD2: Can't enable checksumming v1 and v2/3 "
 		       "at the same time!\n");
 		return err;
 	}
 
-	/* Load the checksum driver */
 	if (jbd2_journal_has_csum_v2or3_feature(journal)) {
 		if (sb->s_checksum_type != JBD2_CRC32C_CHKSUM) {
 			printk(KERN_ERR "JBD2: Unknown checksum type\n");
 			return err;
 		}
 
-		journal->j_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
-		if (IS_ERR(journal->j_chksum_driver)) {
-			printk(KERN_ERR "JBD2: Cannot load crc32c driver.\n");
-			err = PTR_ERR(journal->j_chksum_driver);
-			journal->j_chksum_driver = NULL;
-			return err;
-		}
 		/* Check superblock checksum */
 		if (sb->s_checksum != jbd2_superblock_csum(journal, sb)) {
 			printk(KERN_ERR "JBD2: journal checksum error\n");
 			err = -EFSBADCRC;
 			return err;
@@ -1606,12 +1598,10 @@ static journal_t *journal_init_common(struct block_device *bdev,
 
 	return journal;
 
 err_cleanup:
 	percpu_counter_destroy(&journal->j_checkpoint_jh_count);
-	if (journal->j_chksum_driver)
-		crypto_free_shash(journal->j_chksum_driver);
 	kfree(journal->j_wbuf);
 	jbd2_journal_destroy_revoke(journal);
 	journal_fail_superblock(journal);
 	kfree(journal);
 	return ERR_PTR(err);
@@ -2189,12 +2179,10 @@ int jbd2_journal_destroy(journal_t *journal)
 	if (journal->j_proc_entry)
 		jbd2_stats_proc_exit(journal);
 	iput(journal->j_inode);
 	if (journal->j_revoke)
 		jbd2_journal_destroy_revoke(journal);
-	if (journal->j_chksum_driver)
-		crypto_free_shash(journal->j_chksum_driver);
 	kfree(journal->j_fc_wbuf);
 	kfree(journal->j_wbuf);
 	kfree(journal);
 
 	return err;
@@ -2335,31 +2323,19 @@ int jbd2_journal_set_features(journal_t *journal, unsigned long compat,
 			pr_err("JBD2: Cannot enable fast commits.\n");
 			return 0;
 		}
 	}
 
-	/* Load the checksum driver if necessary */
-	if ((journal->j_chksum_driver == NULL) &&
-	    INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3)) {
-		journal->j_chksum_driver = crypto_alloc_shash("crc32c", 0, 0);
-		if (IS_ERR(journal->j_chksum_driver)) {
-			printk(KERN_ERR "JBD2: Cannot load crc32c driver.\n");
-			journal->j_chksum_driver = NULL;
-			return 0;
-		}
-		/* Precompute checksum seed for all metadata */
-		journal->j_csum_seed = jbd2_chksum(journal, ~0, sb->s_uuid,
-						   sizeof(sb->s_uuid));
-	}
-
 	lock_buffer(journal->j_sb_buffer);
 
-	/* If enabling v3 checksums, update superblock */
+	/* If enabling v3 checksums, update superblock and precompute seed */
 	if (INCOMPAT_FEATURE_ON(JBD2_FEATURE_INCOMPAT_CSUM_V3)) {
 		sb->s_checksum_type = JBD2_CRC32C_CHKSUM;
 		sb->s_feature_compat &=
 			~cpu_to_be32(JBD2_FEATURE_COMPAT_CHECKSUM);
+		journal->j_csum_seed = jbd2_chksum(journal, ~0, sb->s_uuid,
+						   sizeof(sb->s_uuid));
 	}
 
 	/* If enabling v1 checksums, downgrade superblock */
 	if (COMPAT_FEATURE_ON(JBD2_FEATURE_COMPAT_CHECKSUM))
 		sb->s_feature_incompat &=
diff --git a/include/linux/jbd2.h b/include/linux/jbd2.h
index 50f7ea8714bf..561025b4f3d9 100644
--- a/include/linux/jbd2.h
+++ b/include/linux/jbd2.h
@@ -26,11 +26,11 @@
 #include <linux/mutex.h>
 #include <linux/timer.h>
 #include <linux/slab.h>
 #include <linux/bit_spinlock.h>
 #include <linux/blkdev.h>
-#include <crypto/hash.h>
+#include <linux/crc32c.h>
 #endif
 
 #define journal_oom_retry 1
 
 /*
@@ -1239,17 +1239,10 @@ struct journal_s
 	 * An opaque pointer to fs-private information.  ext3 puts its
 	 * superblock pointer here.
 	 */
 	void *j_private;
 
-	/**
-	 * @j_chksum_driver:
-	 *
-	 * Reference to checksum algorithm driver via cryptoapi.
-	 */
-	struct crypto_shash *j_chksum_driver;
-
 	/**
 	 * @j_csum_seed:
 	 *
 	 * Precomputed journal UUID checksum for seeding other checksums.
 	 */
@@ -1748,14 +1741,11 @@ static inline bool jbd2_journal_has_csum_v2or3_feature(journal_t *j)
 	return jbd2_has_feature_csum2(j) || jbd2_has_feature_csum3(j);
 }
 
 static inline int jbd2_journal_has_csum_v2or3(journal_t *journal)
 {
-	WARN_ON_ONCE(jbd2_journal_has_csum_v2or3_feature(journal) &&
-		     journal->j_chksum_driver == NULL);
-
-	return journal->j_chksum_driver != NULL;
+	return jbd2_journal_has_csum_v2or3_feature(journal);
 }
 
 static inline int jbd2_journal_get_num_fc_blks(journal_superblock_t *jsb)
 {
 	int num_fc_blocks = be32_to_cpu(jsb->s_num_fc_blks);
@@ -1788,31 +1778,14 @@ static inline unsigned long jbd2_log_space_left(journal_t *journal)
 #define BJ_Forget	2	/* Buffer superseded by this transaction */
 #define BJ_Shadow	3	/* Buffer contents being shadowed to the log */
 #define BJ_Reserved	4	/* Buffer is reserved for access by journal */
 #define BJ_Types	5
 
-/* JBD uses a CRC32 checksum */
-#define JBD_MAX_CHECKSUM_SIZE 4
-
 static inline u32 jbd2_chksum(journal_t *journal, u32 crc,
 			      const void *address, unsigned int length)
 {
-	DEFINE_RAW_FLEX(struct shash_desc, desc, __ctx,
-		DIV_ROUND_UP(JBD_MAX_CHECKSUM_SIZE,
-			     sizeof(*((struct shash_desc *)0)->__ctx)));
-	int err;
-
-	BUG_ON(crypto_shash_descsize(journal->j_chksum_driver) >
-		JBD_MAX_CHECKSUM_SIZE);
-
-	desc->tfm = journal->j_chksum_driver;
-	*(u32 *)desc->__ctx = crc;
-
-	err = crypto_shash_update(desc, address, length);
-	BUG_ON(err);
-
-	return *(u32 *)desc->__ctx;
+	return crc32c(crc, address, length);
 }
 
 /* Return most recent uncommitted transaction */
 static inline tid_t  jbd2_get_latest_transaction(journal_t *journal)
 {
-- 
2.47.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
