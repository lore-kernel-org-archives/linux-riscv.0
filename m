Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E046C282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 19:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3kpcVsHJevLJbTMPvhThstEw/VYSG6VZtnF/5lI8IXQ=; b=G68QTF+wdPRE8t
	S5Pk6NVVs/5/+QD3GhazP7ABgrz1E6JAwyKqsLERXDU6DQRZJMmQpXLPaf7EJPqE/O33JXFjBXe4H
	+Pnxd/kjUTwVHtW1azi2rDaNl8foYwIyISkUMBLEk+RRR6xVGmkdTcvvCQowkQ6fZ3DqF76s3y7a8
	e7VkbPS22GaNf8Z1+pfiryLYnh0v1NW8RURB577hriK7j+pmKy/dJyHFqmgFBjdqWFP97GiaoPjv4
	bWcS+FcOjvdnZoTqG0OeCLes3iyxTcQAoj8PYmI2rqxsqIX6fUj+KVplAaoEdiU/Kx0s5/bxpmEjP
	ZDLA5dO7EMoE8s0oqAMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHE4-0000000C3Kp-407e;
	Thu, 06 Mar 2025 19:49:48 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqHE2-0000000C3KK-04kn
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 19:49:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1741290581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1pLENHPcmZUPIKEuLyD6Q5KL/3y3ps8NKG8+iORBPzI=;
	b=Woqq7KcaOuw73MND/CJ+dS09hGfOAOtzBgcT+dtblRLADUAHmiaT1Q0L4JXXvkCGBjvoeR
	z7d0fU0PyBnqDdsD8ZhIlk1gtGs6QEcWfg+XYtMSj5tLjWyKjqruCC2J8Sod6yp2aPyka1
	hKQcUH+4oo7XThVmvI0AyRJ1z5JbO6Q1SnKVJJnRHsBivZcFn1G5wbW/CjFeOjETE3vaph
	9k9tGJvGYMG6aYdYg621dQnntElEgRy6l3VMQyvFeQPESZHTlWKr7d7Hu8VkexFqIswLti
	wZu8tAr56eMwCruUdBCcSBA3qRRyEC0ysv6RcicjIoFxpiuDaH2CaSGLAFkTTQ==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Thu, 06 Mar 2025 20:49:27 +0100
Subject: [PATCH v2] selftests: riscv: fix v_exec_initval_nolibc.c
MIME-Version: 1.0
Message-Id: <20250306-fix-v_exec_initval_nolibc-v2-1-97f9dc8a7faf@iencinas.com>
X-B4-Tracking: v=1; b=H4sIAEb8yWcC/32NywrCMBREf6XctZE8+nTlf0gpSXq1F2oiSQmV0
 n83Fty6PMPMmQ0iBsIIl2KDgIkieZdBngqwk3YPZDRmBsllxRUX7E4rSwOuaAdytCQ9D87PZCw
 ru3bsmtqqRo6Q96+AuXy4b33mieLiw/u4SuKb/qzVH2sSTDDTNqbmWCrO5ZXQWXI6nq1/Qr/v+
 wdmehr5xQAAAA==
X-Change-ID: 20250301-fix-v_exec_initval_nolibc-498d976c372d
To: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_114946_405258_8F5B9E76 
X-CRM114-Status: GOOD (  11.31  )
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

Vector registers are zero initialized by the kernel. Stop accepting
"all ones" as a clean value.

Note that this was not working as expected given that
	value == 0xff
can be assumed to be always false by the compiler as value's range is
[-128, 127]. Both GCC (-Wtype-limits) and clang
(-Wtautological-constant-out-of-range-compare) warn about this.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
Changes in v2:

Remove code that becomes useless now that the only "clean" value for
vector registers is 0.

- Link to v1: https://lore.kernel.org/r/20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com
---
 tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 35c0812e32de0c82a54f84bd52c4272507121e35..4dde05e45a04122b566cedc36d20b072413b00e2 100644
--- a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
+++ b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
@@ -6,7 +6,7 @@
  * the values. To further ensure consistency, this file is compiled without
  * libc and without auto-vectorization.
  *
- * To be "clean" all values must be either all ones or all zeroes.
+ * To be "clean" all values must be all zeroes.
  */
 
 #define __stringify_1(x...)	#x
@@ -14,9 +14,8 @@
 
 int main(int argc, char **argv)
 {
-	char prev_value = 0, value;
+	char value = 0;
 	unsigned long vl;
-	int first = 1;
 
 	if (argc > 2 && strcmp(argv[2], "x"))
 		asm volatile (
@@ -44,14 +43,11 @@ int main(int argc, char **argv)
 			"vsrl.vi " __stringify(register) ", " __stringify(register) ", 8\n\t" \
 			".option pop\n\t"					\
 			: "=r" (value));					\
-		if (first) {							\
-			first = 0;						\
-		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
+		if (value != 0x00) {						\
 			printf("Register " __stringify(register)		\
 				" values not clean! value: %u\n", value);	\
 			exit(-1);						\
 		}								\
-		prev_value = value;						\
 	}									\
 })
 

---
base-commit: 03d38806a902b36bf364cae8de6f1183c0a35a67
change-id: 20250301-fix-v_exec_initval_nolibc-498d976c372d

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
