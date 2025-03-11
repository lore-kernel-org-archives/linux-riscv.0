Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F059C35FF3
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Mar 2025 17:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=inzC1XQzpiW3Quo4IanZ47i0Gh0ce3vVMa/VAzTkNfs=; b=qoqEe76dzDKXob
	Xj91zoGo9uS+kYQkd77x2nIn6dhVVTP83p1JWftFe+jRrEU2u1y1V5MlP7wOqX0L7Sx2gQffwg04Q
	+phuyQ2OvqR4fS0fRhiR9RT8CkFYWQFml706GYy6k+qe0/lFu1cem+7mDUwCRz9jsMLxfB2C/NUpp
	ch4R1l99FQEtYiVHp2ej3Xj7tLazv352JuNxMOTe3EMA/lIQBdcXlwCMcSXtU/MLx2Qw21hpIEPko
	xpgHBW/lns6aKN0dKCduji/DSq7fl/UG/ZDOinrUWmajA4AC5TcXjMDVf9P49MtH18KHo2ihM9+F9
	1uHZ0NS0o5jsEDg0YnAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3RC-00000006SyG-2F40;
	Tue, 11 Mar 2025 17:30:42 +0000
Received: from out-180.mta0.migadu.com ([91.218.175.180])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts3Hi-00000006RMg-0dsW
	for linux-riscv@lists.infradead.org;
	Tue, 11 Mar 2025 17:20:55 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1741713650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=tgSt81uvJI3vKLVetlm9klAJwDGyPHMhXRAlaqD2p8k=;
	b=uPkyfvWZsSw6Vg3qkYIUrQn5g3wIyD7dEs+84MZY4jm5hSVFHR15Oc3tiUXoEgORGQhKSE
	vdaWIl0Qh3YVuJzatKNWGqqsy8DxFAOsbWJ7bV8kxZ0vKsOk8WLCOAoiHcVwht1g95Wn+F
	fNbfxz7Ed3ANi/JkQpjPwbgqGO6KW6UV/Oh+sGJulPsy7oyHaktFhscPH9WfDQA+31eCb0
	8JbozNKnFsikmqyetGLZbfoPuRRWp6a2KJaR0tJyvVnld63l0pKgxeMaDPFar5zcDH8UVS
	0pRIBJBc69VVbhMEAqW5xGwsYrBe53Amy85OzWG3VTpKsgOS3OkXQn1m5rfTsQ==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Tue, 11 Mar 2025 18:20:22 +0100
Subject: [PATCH] riscv: fix test_and_{set,clear}_bit ordering documentation
MIME-Version: 1.0
Message-Id: <20250311-riscv-fix-test-and-set-bit-comment-v1-1-8d2598e1e43b@iencinas.com>
X-B4-Tracking: v=1; b=H4sIANVw0GcC/x2NQQqDMBBFryKzdiCTYlu9irhIk2k7C6Nkggji3
 R1cvs/jvwOUi7DC0BxQeBOVJRtQ20D8h/xjlGQM3vnOPYiwiMYNv7JjZa0YckLlih+pGJd55mx
 b6N2bgn+lJ4EdrYXNvyPjdJ4XARLKYnQAAAA=
X-Change-ID: 20250311-riscv-fix-test-and-set-bit-comment-aa9081a27d61
To: Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_102054_658559_2F742DBA 
X-CRM114-Status: GOOD (  10.39  )
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

test_and_{set,clear}_bit are fully ordered as specified in
Documentation/atomic_bitops.txt. Fix incorrect comment stating otherwise.

Note that the implementation is correct since commit
9347ce54cd69 ("RISC-V: __test_and_op_bit_ord should be strongly ordered")
was introduced.

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
This seems to be a leftover comment from the initial implementation
which assumed these operations were relaxed.

Documentation/atomic_bitops.txt states:

  [...]
  RMW atomic operations with return value:
  
    test_and_{set,clear,change}_bit()
    test_and_set_bit_lock()
  [...]

   - RMW operations that have a return value are fully ordered.

Similar comments can be found in
include/asm-generic/bitops/instrumented-atomic.h,
include/linux/atomic/atomic-long.h, etc...
---
 arch/riscv/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index c6bd3d8354a96b4e7bbef0e98a201da412301b57..49a0f48d93df5be4d38fe25b437378467e4ca433 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -226,7 +226,7 @@ static __always_inline int variable_fls(unsigned int x)
  * @nr: Bit to set
  * @addr: Address to count from
  *
- * This operation may be reordered on other architectures than x86.
+ * This is an atomic fully-ordered operation (implied full memory barrier).
  */
 static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
@@ -238,7 +238,7 @@ static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long
  * @nr: Bit to clear
  * @addr: Address to count from
  *
- * This operation can be reordered on other architectures other than x86.
+ * This is an atomic fully-ordered operation (implied full memory barrier).
  */
 static __always_inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
 {

---
base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
change-id: 20250311-riscv-fix-test-and-set-bit-comment-aa9081a27d61

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
