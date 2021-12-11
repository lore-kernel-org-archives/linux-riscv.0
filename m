Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91B6C433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Dec 2021 03:33:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQKmbQWfmnHHAPIN35EGFBaEALDrAz0cbFQxgd5dkUY=; b=zMSQV/s5q5kjdz
	XhqpfhOe9a9eJr5k3BesdVYEMCAKRdC6iKer28Wa64U71aSjvTAUnUxJumY9RQK/yQkj3r2vd3iT5
	n4Gb1JXmMxXW2aGoiW7xPkYc5ohCtzLAgLjWvkX9V84E0euJu6bx0vGmHWFDyBbaXWyW5sNcA0puM
	Tmw7bx6fkHQMfwsN+hp6+RPD/dnoPkoLX9bQd3zJSts6khFPmJdu1JFhgddGfLhtCbydgVjQ6QmD9
	gADq9ls46PFi0ygRNzuzns8ayZ8QEOJZ1GhZbskobK0jriZ6930tjPwtmL9aBoe/THEk62rF3F3H3
	1X4hyOJ2oGTB5kTEklhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mvt8q-004UV9-5t; Sat, 11 Dec 2021 03:33:44 +0000
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mvt8N-004UMf-4i; Sat, 11 Dec 2021 03:33:17 +0000
Received: from linux.localdomain (unknown [113.200.148.30])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Ax+sj1G7RhlA0GAA--.13327S3; 
 Sat, 11 Dec 2021 11:33:10 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Dave Young <dyoung@redhat.com>, Baoquan He <bhe@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-ia64@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-sh@vger.kernel.org, x86@kernel.org,
 linux-fsdevel@vger.kernel.org, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Xuefeng Li <lixuefeng@loongson.cn>
Subject: [PATCH v2 1/2] kdump: vmcore: remove copy_to() and add
 copy_to_user_or_kernel()
Date: Sat, 11 Dec 2021 11:33:07 +0800
Message-Id: <1639193588-7027-2-git-send-email-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
References: <1639193588-7027-1-git-send-email-yangtiezhu@loongson.cn>
X-CM-TRANSID: AQAAf9Ax+sj1G7RhlA0GAA--.13327S3
X-Coremail-Antispam: 1UD129KBjvJXoWxZFy3Gr1kCrWfGw43Gry7GFg_yoWrtFy8pF
 n8trW3AF4Igr48XF1vkrsxur1Fq3Z7Wa1jg397W3WrZ3sxXrsxZa45JFyYgFW8XFyqkFyf
 GF9YgrZxK3yUXr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUPC14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jr4l82xGYIkIc2
 x26xkF7I0E14v26r4j6ryUM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
 Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84
 ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1l
 e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
 8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
 jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
 kIwI1lc2xSY4AK67AK6r48MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4U
 MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67
 AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0
 cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z2
 80aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI
 43ZEXa7VUU0PfPUUUUU==
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211210_193315_642548_96E30250 
X-CRM114-Status: GOOD (  12.93  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

In arch/*/kernel/crash_dump*.c, there exist many similar code
about copy_oldmem_page(), remove copy_to() in fs/proc/vmcore.c
and add copy_to_user_or_kernel() in lib/usercopy.c, then we can
use copy_to_user_or_kernel() to simplify the related code.

Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 fs/proc/vmcore.c        | 28 +++++++---------------------
 include/linux/uaccess.h |  1 +
 lib/usercopy.c          | 15 +++++++++++++++
 3 files changed, 23 insertions(+), 21 deletions(-)

diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
index 509f851..f67fd77 100644
--- a/fs/proc/vmcore.c
+++ b/fs/proc/vmcore.c
@@ -238,22 +238,8 @@ copy_oldmem_page_encrypted(unsigned long pfn, char *buf, size_t csize,
 	return copy_oldmem_page(pfn, buf, csize, offset, userbuf);
 }
 
-/*
- * Copy to either kernel or user space
- */
-static int copy_to(void *target, void *src, size_t size, int userbuf)
-{
-	if (userbuf) {
-		if (copy_to_user((char __user *) target, src, size))
-			return -EFAULT;
-	} else {
-		memcpy(target, src, size);
-	}
-	return 0;
-}
-
 #ifdef CONFIG_PROC_VMCORE_DEVICE_DUMP
-static int vmcoredd_copy_dumps(void *dst, u64 start, size_t size, int userbuf)
+static int vmcoredd_copy_dumps(void *dst, u64 start, size_t size, bool userbuf)
 {
 	struct vmcoredd_node *dump;
 	u64 offset = 0;
@@ -266,7 +252,7 @@ static int vmcoredd_copy_dumps(void *dst, u64 start, size_t size, int userbuf)
 		if (start < offset + dump->size) {
 			tsz = min(offset + (u64)dump->size - start, (u64)size);
 			buf = dump->buf + start - offset;
-			if (copy_to(dst, buf, tsz, userbuf)) {
+			if (copy_to_user_or_kernel(dst, buf, tsz, userbuf)) {
 				ret = -EFAULT;
 				goto out_unlock;
 			}
@@ -330,7 +316,7 @@ static int vmcoredd_mmap_dumps(struct vm_area_struct *vma, unsigned long dst,
  * returned otherwise number of bytes read are returned.
  */
 static ssize_t __read_vmcore(char *buffer, size_t buflen, loff_t *fpos,
-			     int userbuf)
+			     bool userbuf)
 {
 	ssize_t acc = 0, tmp;
 	size_t tsz;
@@ -347,7 +333,7 @@ static ssize_t __read_vmcore(char *buffer, size_t buflen, loff_t *fpos,
 	/* Read ELF core header */
 	if (*fpos < elfcorebuf_sz) {
 		tsz = min(elfcorebuf_sz - (size_t)*fpos, buflen);
-		if (copy_to(buffer, elfcorebuf + *fpos, tsz, userbuf))
+		if (copy_to_user_or_kernel(buffer, elfcorebuf + *fpos, tsz, userbuf))
 			return -EFAULT;
 		buflen -= tsz;
 		*fpos += tsz;
@@ -395,7 +381,7 @@ static ssize_t __read_vmcore(char *buffer, size_t buflen, loff_t *fpos,
 		/* Read remaining elf notes */
 		tsz = min(elfcorebuf_sz + elfnotes_sz - (size_t)*fpos, buflen);
 		kaddr = elfnotes_buf + *fpos - elfcorebuf_sz - vmcoredd_orig_sz;
-		if (copy_to(buffer, kaddr, tsz, userbuf))
+		if (copy_to_user_or_kernel(buffer, kaddr, tsz, userbuf))
 			return -EFAULT;
 
 		buflen -= tsz;
@@ -435,7 +421,7 @@ static ssize_t __read_vmcore(char *buffer, size_t buflen, loff_t *fpos,
 static ssize_t read_vmcore(struct file *file, char __user *buffer,
 			   size_t buflen, loff_t *fpos)
 {
-	return __read_vmcore((__force char *) buffer, buflen, fpos, 1);
+	return __read_vmcore((__force char *) buffer, buflen, fpos, true);
 }
 
 /*
@@ -461,7 +447,7 @@ static vm_fault_t mmap_vmcore_fault(struct vm_fault *vmf)
 	if (!PageUptodate(page)) {
 		offset = (loff_t) index << PAGE_SHIFT;
 		buf = __va((page_to_pfn(page) << PAGE_SHIFT));
-		rc = __read_vmcore(buf, PAGE_SIZE, &offset, 0);
+		rc = __read_vmcore(buf, PAGE_SIZE, &offset, false);
 		if (rc < 0) {
 			unlock_page(page);
 			put_page(page);
diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index ac03940..a25e682e 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -283,6 +283,7 @@ __copy_from_user_inatomic_nocache(void *to, const void __user *from,
 #endif		/* ARCH_HAS_NOCACHE_UACCESS */
 
 extern __must_check int check_zeroed_user(const void __user *from, size_t size);
+extern __must_check int copy_to_user_or_kernel(void *target, void *src, size_t size, bool userbuf);
 
 /**
  * copy_struct_from_user: copy a struct from userspace
diff --git a/lib/usercopy.c b/lib/usercopy.c
index 7413dd3..7431b1b 100644
--- a/lib/usercopy.c
+++ b/lib/usercopy.c
@@ -90,3 +90,18 @@ int check_zeroed_user(const void __user *from, size_t size)
 	return -EFAULT;
 }
 EXPORT_SYMBOL(check_zeroed_user);
+
+/*
+ * Copy to either user or kernel space
+ */
+int copy_to_user_or_kernel(void *target, void *src, size_t size, bool userbuf)
+{
+	if (userbuf) {
+		if (copy_to_user((char __user *) target, src, size))
+			return -EFAULT;
+	} else {
+		memcpy(target, src, size);
+	}
+	return 0;
+}
+EXPORT_SYMBOL(copy_to_user_or_kernel);
-- 
2.1.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
