Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFC5AD3C935
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Oct 2024 00:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cuSgddY/BRH90zjSGfKB1JMPaRR6GWe6b8QkjDqY1kU=; b=q0EovALM/+dWHp
	0g49I6EjfYoidGZo6bLwuB99EfhcdGFEse6BILR5647bx6BDPxDqU+vQWVXLl2imDHhW/novcEjeC
	dxTrHlPvt0yFRSLaKRWXa+c0RJcAKeRz5NaAlLiRSTD1bgEnwmtmOyjWj3pPdpeP3RNxJoXpCcX+G
	Yk79zZE6gx9Frp585GdrO50a02R2CSOl9l2imoSzV+gZpi8dRVkigP5ZaHcJ1Nc6kykEQjUwye71w
	xFqeLZdlBEMeOqDOH4nAhn7BFj43X/E6hvF9orXMYAgAtfdiRVPVSZ+OI1wo17TMWf6eD0IsQrTc9
	FV2fSCHvjMwYb4UoQ/Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2ggf-00000005lrj-2QVt;
	Mon, 21 Oct 2024 00:54:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2gJq-00000005hu9-32wu;
	Mon, 21 Oct 2024 00:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=k/OfLUqQHLysvg3ybfXGU6fWaoCD3U2ehR5MGc2/rak=; b=fqbWEigwiEBtLhOM6agp509z4z
	jDJ79T2RiAtUk4e8QFUg2mw2NMJUkHPw25Xe6miTw7zfnSlCnJ447QZsmggWkgbhB2Ad6gcGYCOYE
	FILbhIcOtAN+zTuqvaLl1TjlqQdBHE1J5W2SQMQtBOzunfomwtMsdOnudzCDaO5N/1wFGusdnUlbi
	rgS4uUuSfix6QOXxC7o2dr5BK2u/2f5leuBX7EPD/Uk/kfbB4YvivaM7b+oS0GlglTNuofIjBdbgZ
	LgBK72cYH4VC6qRqI0G0mgAs4CmirlCwdhWp0VyoyI3Mt7lAAr6gt7lhmg3e5GwtTRfyO+KTyFXae
	HlAKDGdw==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2gJ9-00000007n1c-2dy2;
	Mon, 21 Oct 2024 00:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B3AC55C5815;
	Mon, 21 Oct 2024 00:29:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87B75C4CEE5;
	Mon, 21 Oct 2024 00:29:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729470598;
	bh=2edVn3yzlgvTIcU4OYne6VaRBmOeBMvpuDRrHbVNdrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=NFFk4W0dyvHD7M3v36IIWTb5ySBBZX5uZ/VLRYiArPPR5++D/baWB8d+lyfAaBOhk
	 rztTLk/6ilOUZBWwQxzKVpNgy7hbS+bAqO2cV8DFYmzWDyAaKEezQcPZFBrYh8vShT
	 roh7zUz+tjlNZy+E9vuB5Q59JQnN14hGjhkd5gjyQeUJqlHGIc+Uf3/5EwjEZ4O6Ps
	 TvEpzXEcAb/PHAsselt3G1remC4TFMm//VXM0Ciyn11PZQ9zsIxfN5iARYumUTBA9J
	 8pJ0BrJoKwcW+JUENnQzEDWoyb2qcx6NpA2gan0ia3pz9LbggvtIVcVcrMMhn+Rn2b
	 w+zTkdQuRqfwg==
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
	linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH 15/15] f2fs: switch to using the crc32 library
Date: Sun, 20 Oct 2024 17:29:35 -0700
Message-ID: <20241021002935.325878-16-ebiggers@kernel.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241021002935.325878-1-ebiggers@kernel.org>
References: <20241021002935.325878-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_013043_085045_F06AD591 
X-CRM114-Status: GOOD (  15.44  )
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

Now that the crc32() library function takes advantage of
architecture-specific optimizations, it is unnecessary to go through the
crypto API.  Just use crc32().  This is much simpler, and it improves
performance due to eliminating the crypto API overhead.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/Kconfig |  3 +--
 fs/f2fs/f2fs.h  | 19 +------------------
 fs/f2fs/super.c | 15 ---------------
 3 files changed, 2 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 68a1e23e1557c..5916a02fb46dd 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -2,12 +2,11 @@
 config F2FS_FS
 	tristate "F2FS filesystem support"
 	depends on BLOCK
 	select BUFFER_HEAD
 	select NLS
-	select CRYPTO
-	select CRYPTO_CRC32
+	select CRC32
 	select F2FS_FS_XATTR if FS_ENCRYPTION
 	select FS_ENCRYPTION_ALGS if FS_ENCRYPTION
 	select FS_IOMAP
 	select LZ4_COMPRESS if F2FS_FS_LZ4
 	select LZ4_DECOMPRESS if F2FS_FS_LZ4
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 33f5449dc22d5..1fc5c2743c8d4 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1761,13 +1761,10 @@ struct f2fs_sb_info {
 
 	/* For write statistics */
 	u64 sectors_written_start;
 	u64 kbytes_written;
 
-	/* Reference to checksum algorithm driver via cryptoapi */
-	struct crypto_shash *s_chksum_driver;
-
 	/* Precomputed FS UUID checksum for seeding other checksums */
 	__u32 s_chksum_seed;
 
 	struct workqueue_struct *post_read_wq;	/* post read workqueue */
 
@@ -1941,25 +1938,11 @@ static inline unsigned int f2fs_time_to_wait(struct f2fs_sb_info *sbi,
  * Inline functions
  */
 static inline u32 __f2fs_crc32(struct f2fs_sb_info *sbi, u32 crc,
 			      const void *address, unsigned int length)
 {
-	struct {
-		struct shash_desc shash;
-		char ctx[4];
-	} desc;
-	int err;
-
-	BUG_ON(crypto_shash_descsize(sbi->s_chksum_driver) != sizeof(desc.ctx));
-
-	desc.shash.tfm = sbi->s_chksum_driver;
-	*(u32 *)desc.ctx = crc;
-
-	err = crypto_shash_update(&desc.shash, address, length);
-	BUG_ON(err);
-
-	return *(u32 *)desc.ctx;
+	return crc32(crc, address, length);
 }
 
 static inline u32 f2fs_crc32(struct f2fs_sb_info *sbi, const void *address,
 			   unsigned int length)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87ab5696bd482..003d3bcb0caa2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1670,12 +1670,10 @@ static void f2fs_put_super(struct super_block *sb)
 
 	f2fs_destroy_post_read_wq(sbi);
 
 	kvfree(sbi->ckpt);
 
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi->raw_super);
 
 	f2fs_destroy_page_array_cache(sbi);
 	f2fs_destroy_xattr_caches(sbi);
 #ifdef CONFIG_QUOTA
@@ -4419,19 +4417,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		INIT_LIST_HEAD(&sbi->inode_list[i]);
 		spin_lock_init(&sbi->inode_lock[i]);
 	}
 	mutex_init(&sbi->flush_lock);
 
-	/* Load the checksum driver */
-	sbi->s_chksum_driver = crypto_alloc_shash("crc32", 0, 0);
-	if (IS_ERR(sbi->s_chksum_driver)) {
-		f2fs_err(sbi, "Cannot load crc32 driver.");
-		err = PTR_ERR(sbi->s_chksum_driver);
-		sbi->s_chksum_driver = NULL;
-		goto free_sbi;
-	}
-
 	/* set a block size */
 	if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
 		f2fs_err(sbi, "unable to set blocksize");
 		goto free_sbi;
 	}
@@ -4872,12 +4861,10 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	fscrypt_free_dummy_policy(&F2FS_OPTION(sbi).dummy_enc_policy);
 	kvfree(options);
 free_sb_buf:
 	kfree(raw_super);
 free_sbi:
-	if (sbi->s_chksum_driver)
-		crypto_free_shash(sbi->s_chksum_driver);
 	kfree(sbi);
 	sb->s_fs_info = NULL;
 
 	/* give only one another chance */
 	if (retry_cnt > 0 && skip_recovery) {
@@ -5080,7 +5067,5 @@ module_init(init_f2fs_fs)
 module_exit(exit_f2fs_fs)
 
 MODULE_AUTHOR("Samsung Electronics's Praesto Team");
 MODULE_DESCRIPTION("Flash Friendly File System");
 MODULE_LICENSE("GPL");
-MODULE_SOFTDEP("pre: crc32");
-
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
