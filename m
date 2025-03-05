Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC5DC19F32
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Mar 2025 16:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y3T3vE1hKgwRc+r9aBQVFThTXEmPXF2RQQ+y6zsNxe8=; b=oEvz7cfdqUUTZF
	qXRRzaV0mHKH1MO/7gxX6H07eGRxMhShewpZAtblv4j1MW7XCvDOpebstAwM0WV4lmqAnKWwX8Ogg
	R1XvyooonhQ80BrxRBxP4KnIKJi3zWv9AGXeowRKtSBzw3KDsqwu1XgjRXMin+MlY49j0bwxrXWTA
	yTH3yVFv5Z+ZnZj27NtGEfk+twbCEqrBowNaATzx8gkobmLXmkGUd0TmMLCSNqnxfGFKMmRXW9rza
	mvVC+U2YTt9WX5lIAL6VWdstu5F+ed7+AWalLwt6Xy5gSNgof7EKmzsZd2odSEiihyWGB80BWAmsY
	53gQQYH8hKgkjcPN5XsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprnE-00000008hTy-21Tg;
	Wed, 05 Mar 2025 16:40:24 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tprnA-00000008hRW-36hs
	for linux-riscv@lists.infradead.org;
	Wed, 05 Mar 2025 16:40:22 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1741192812;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jdlcaeLgpRGJb4WYxQLcnWtC/c9dZ1uqwhfx8n90Igk=;
	b=veW3wVRx/5NFTXbzOGBD5dHeuKAc9xZrmmidqKHhtwZ8eqxAQZizfNIZflx2AxELm4Sy55
	tPvi19YwvxMctpqHZUZ+vbo95LC1Owaj0S/nyM0bY5QNucCJAL+V1KgUjssvd0UejzXTrA
	gCvbJEf+CtzD/4lxRc5Kw6PPtYO4m0itXLcmCVMs1zKY61hKQJwScPCtBdgdK+CnD3DPLm
	8GKFQ7v+V9/E8UNMT4wXtZKbnIjpai0+b5MQJdW2SJwqyqKTUjRYP4Rb+KRTphNMQYh7lT
	Ko/AK9ZQXPe3ugMsSRT5sKB2/EwnPeoz7vbPh3Z1HAInmM2osu2rAOl+lkSm/A==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Wed, 05 Mar 2025 17:39:28 +0100
Subject: [PATCH] selftests: riscv: fix v_exec_initval_nolibc.c
MIME-Version: 1.0
Message-Id: <20250305-fix-v_exec_initval_nolibc-v1-1-b87b60e43002@iencinas.com>
X-B4-Tracking: v=1; b=H4sIAD9+yGcC/x2MWwqAIBAArxL7nWDa+yoRYrrVQlhoSBDePelzY
 GZeCOgJA4zFCx4jBTpdhqoswOzabcjIZgbBRcMlr9hKD4sKHzSKHN1RH8qdBy2G1UNvh641shM
 Wcn95zPL/nuaUPqBdQ0lrAAAA
X-Change-ID: 20250301-fix-v_exec_initval_nolibc-498d976c372d
To: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Charlie Jenkins <charlie@rivosinc.com>
Cc: linux-kselftest@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_084021_218753_BF470E28 
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

Vector registers are zero initialized by the kernel. Stop accepting
"all ones" as a clean value.

Note that this was not working as expected given that
	value == 0xff
can be assumed to be always false by the compiler as value's range is
[-128, 127]. Both GCC (-Wtype-limits) and clang
(-Wtautological-constant-out-of-range-compare) warn about this.

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
I tried looking why "all ones" was previously deemed a "clean" value but
couldn't find any information. It looks like the kernel always 
zero-initializes the vector registers.

If "all ones" is still acceptable for any reason, my intention is to 
spin a v2 changing the types of `value` and `prev_value` to unsigned 
char.
---
 tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c b/tools/testing/selftests/riscv/vector/v_exec_initval_nolibc.c
index 35c0812e32de0c82a54f84bd52c4272507121e35..b712c4d258a6cb045aa96de4a75299714866f5e6 100644
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
@@ -46,7 +46,7 @@ int main(int argc, char **argv)
 			: "=r" (value));					\
 		if (first) {							\
 			first = 0;						\
-		} else if (value != prev_value || !(value == 0x00 || value == 0xff)) { \
+		} else if (value != prev_value || value != 0x00) {              \
 			printf("Register " __stringify(register)		\
 				" values not clean! value: %u\n", value);	\
 			exit(-1);						\

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
