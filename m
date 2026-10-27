Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E6C606A31A
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Oct 2026 12:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0fz8nplB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=eh92Srzz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=a/ARozWyWJjRNzaGM78hwWt2q3uKDftxKzPKxEK0EN8=; b=0fz8nplBQWsDm7gq4a2MoZHUHx
	JqU2j6RAC875xvE1ZElPvSJpAQ9AklMQadt404PaC2zOkiKkJcjEH9UHGqR3dslVwD7yoBGwpuR9Y
	Fn/EYthQEY0Vee6dXWRu5E0ThBKFI/Gmwe3qJu78Pv1qmM+T6FIaLsJGCDU0GwYWaCSMP7ODCAwJN
	f1Q/qsG7SEx3gXrt0yAb8CBowG2MXr1wOBRkn2EHtCZ+9pC3zMJAWEJXcIJH2UozH0PF5aXL86LaW
	3YKsGrDqA9nEzFV2maPwlx6b8hJbWCsKdVPbbJiJm6Ub6Y3gsEkRssu/x1Q9WjjuGrQkC7pL5Pwxb
	7QUIrGWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgfD-00000004idg-2X83;
	Tue, 27 Oct 2026 12:52:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgfC-00000004idQ-1zxU
	for linux-riscv@bombadil.infradead.org;
	Tue, 27 Oct 2026 12:52:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=TG52W8e2RYtjGPTZeIzpkudV29Okj7bliXK0rKtc2f4=; b=eh92SrzzMEAlQBp1DvTlW4j4Ye
	0lYWHgX2gAaQJKlpb1Z6I4KCjljh5er0NghRr7QaEn3FNmbfsckWIxWkzeKYEhB6ntJIcQ5AqM+Dl
	GjzPs85CWHEmYJSB6b6X0IBgbn1PlufS/GSvfAOlM9/S0/zoY9CguqpotfCQhZPUC6NmIQSpu87qW
	tUfpdrslxO08aQUsRaLG9+50aL3zLunhdEwd4/rSmvkePU7D2Nnzo5BtJQtVlxb5XMWeVG2jeYBq8
	OT7h/SULPOUNmTA8TO9+UXZDSyBZMgk85g5A7llt1GOEfHBnWD0D23SVAYX2PRKORh5TQiC0yB/hh
	tStcMCSw==;
Received: from outgoing2021.csail.mit.edu ([128.30.2.78])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLgf7-0000000EyIp-0vwZ
	for linux-riscv@lists.infradead.org;
	Tue, 27 Oct 2026 12:52:23 +0000
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xLgew-00BINw-9J;
	Tue, 27 Oct 2026 08:52:10 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Andy Chiu <tchiu@tenstorrent.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] riscv: uaccess: Report partial progress when the word copy faults
Date: Tue, 27 Oct 2026 08:52:09 -0400
Message-ID: <20261027125210.843589-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_125221_370426_C19C03B7 
X-CRM114-Status: GOOD (  14.52  )
X-Spam-Score: -0.0 (/)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

write(2) from a buffer whose last 40 readable bytes are followed by an
unmapped page spins in generic_perform_write(), holding the inode lock,
until the task is killed, instead of returning 40; read(2) into such a
buffer fails with -EFAULT.

The unrolled word copy does eight loads before its eight stores, and
the shift copy loads one word ahead of its store, but their fixups
count everything from the first destination byte not stored as not
copied. So a fault in the first block reports that nothing was copied
although some bytes could be, which uaccess.h does not allow;
generic_perform_write() then retries forever, as
fault_in_iov_iter_readable() succeeds for the readable bytes.

Make those fixups finish the copy a byte at a time from the first byte
not stored; the byte copy's fixup then returns the exact count.

Reproduced on riscv64 under QEMU with write(2) to tmpfs and ramfs; the
patched kernel returns 40.

Fixes: 4b05b993900d ("riscv: uaccess: Return the number of bytes effectively not copied")
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    This patch was prepared with the help of an AI tool.
    
    The scalar copy also runs when the vector copy is in use: for copies
    below riscv_v_usercopy_threshold and for the rest of a vector copy that
    faulted. Under QEMU -cpu max a 4096-byte write(2) from the buffer below
    hangs as well.
    
    Reproducer (riscv64, no privileges; the directory is on ramfs or tmpfs):
    
      gcc -O2 -o uaccess-progress uaccess-progress.c && ./uaccess-progress /tmp
    
    Before (mainline d135ab453a74, defconfig, QEMU -cpu max):
    "read:  -1 (expected 40)", then the write spins in the kernel until the
    alarm kills it ("Alarm clock"). After: "read:  40 (expected 40)" and
    "write: 40 (expected 40)".
    
      /*
       * read(2) and write(2) of 100 bytes from a buffer with 40 bytes before an
       * unmapped page: both must return 40.
       * Usage: uaccess-progress <dir on ramfs or tmpfs>
       */
      #include <fcntl.h>
      #include <stdio.h>
      #include <string.h>
      #include <sys/mman.h>
      #include <unistd.h>
    
      int main(int argc, char **argv)
      {
      	long pg = sysconf(_SC_PAGESIZE);
      	char path[256], *p;
      	ssize_t r;
      	int fd;
    
      	snprintf(path, sizeof(path), "%s/uaccess-progress", argc > 1 ? argv[1] : "/tmp");
      	p = mmap(NULL, 2 * pg, PROT_READ | PROT_WRITE, MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
      	if (p == MAP_FAILED || munmap(p + pg, pg))
      		return 1;
      	memset(p, 'x', pg);
      	fd = open(path, O_RDWR | O_CREAT | O_TRUNC, 0600);
      	if (fd < 0 || pwrite(fd, p, pg, 0) != pg)
      		return 1;
    
      	r = pread(fd, p + pg - 40, 100, 0);
      	printf("read:  %zd (expected 40)\n", r);
      	fflush(stdout);
    
      	alarm(5);	/* the unpatched kernel never returns: "Alarm clock" */
      	r = pwrite(fd, p + pg - 40, 100, pg);
      	printf("write: %zd (expected 40)\n", r);
      	return 0;
      }

 arch/riscv/lib/uaccess.S | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/lib/uaccess.S b/arch/riscv/lib/uaccess.S
index cf8586a937de8..99886ab86802e 100644
--- a/arch/riscv/lib/uaccess.S
+++ b/arch/riscv/lib/uaccess.S
@@ -88,9 +88,9 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	beq	a0, t1, .Lskip_align_dst
 1:
 	/* a5 - one byte for copying data */
-	fixup lb      a5, 0(a1), 10f
+	fixup lb      a5, 0(a1), 11f
 	addi	a1, a1, 1	/* src */
-	fixup sb      a5, 0(a0), 10f
+	fixup sb      a5, 0(a0), 11f
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t1, 1b	/* t1 - start of aligned dst */
 
@@ -169,7 +169,7 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	sub	t4, a5, t3
 
 	/* Load the first word to combine with second word */
-	fixup REG_L   a5, 0(a1), 10f
+	fixup REG_L   a5, 0(a1), 12f
 
 3:
 	/* Main shifting copy
@@ -181,11 +181,11 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 
 	/* At least one iteration will be executed */
 	srl	a4, a5, t3
-	fixup REG_L   a5, SZREG(a1), 10f
+	fixup REG_L   a5, SZREG(a1), 12f
 	addi	a1, a1, SZREG
 	sll	a2, a5, t4
 	or	a2, a2, a4
-	fixup REG_S   a2, 0(a0), 10f
+	fixup REG_S   a2, 0(a0), 13f
 	addi	a0, a0, SZREG
 	bltu	a0, t1, 3b
 
@@ -203,16 +203,31 @@ SYM_FUNC_START(fallback_scalar_usercopy_sum_enabled)
 	 */
 	bgeu	a0, t0, .Lout_copy_user  /* check if end of copy */
 4:
-	fixup lb      a5, 0(a1), 10f
+	fixup lb      a5, 0(a1), 11f
 	addi	a1, a1, 1	/* src */
-	fixup sb      a5, 0(a0), 10f
+	fixup sb      a5, 0(a0), 11f
 	addi	a0, a0, 1	/* dst */
 	bltu	a0, t0, 4b	/* t0 - end of dst */
 
 .Lout_copy_user:
 	li	a0, 0
 	ret
+
+	/*
+	 * A fault in the word or shift copy: redo the rest a byte at a time
+	 * from the first dst byte not stored, so that every byte before the
+	 * faulting one is copied and counted.
+	 */
+#if !defined(CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS)
+13:	/* shift copy store: a1 is already one word ahead */
+	addi	a1, a1, -SZREG
+12:	/* shift copy load: the src of a0 is a1 + a3 */
+	add	a1, a1, a3
+#endif
 10:
+	mv	t0, t5
+	j	.Lbyte_copy_tail
+11:
 	sub a0, t5, a0
 	ret
 SYM_FUNC_END(fallback_scalar_usercopy_sum_enabled)

base-commit: d135ab453a7400a34930bdda1ef4bdc8acfac80e
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
