Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C4DEE66883
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Nov 2024 02:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d7HjoDkGecoAQSr0zzwOTNYfumAjOqmm9u1wMm+xLck=; b=Z3DY2Z2Az1MLEg
	Cl5buWS2vwAGBwqIuL56aNdAh8J5l3YaOzHP75jPoYDWtI+rNtuJmQyrbq7hmyobvDTGMVR3VAzon
	Gm0yHlxi08N+DnEcMgC10aOrf58OvDO1ZUwK+BpuY8dITBEGxD9DUTCnvTsxOedriW1SgswIgG4Ho
	zr95rOxK2p/m0QNynUYaP80b7Q4MNQsVLxPT4FnzSyGH/uw52YbFfB3A1HUgYEQsfA4R+5vw8baqy
	maOcGZ7gmqN+ADx6SDVmprMhrD4whhFIQy8Sg9sft25hdRV6BLJhJXNRyH5AGWf/ilM5gCijtbCOM
	tH9RencuZWJvbMQV8kZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tF2Oj-00000005AeA-3x55;
	Sun, 24 Nov 2024 02:30:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tF2Oh-00000005Adl-1z3s
	for linux-riscv@lists.infradead.org;
	Sun, 24 Nov 2024 02:30:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 44BD6A4013D;
	Sun, 24 Nov 2024 02:28:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F23AC4CECD;
	Sun, 24 Nov 2024 02:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732415450;
	bh=MNKk7Ci3f1opxvYb+4djlIYsEba/X8+/Xe7iEjP1cAg=;
	h=From:Date:Subject:To:Cc:From;
	b=EDjhHWpzXUPThA+88eNXqzoljLQGxpY8UvsfEg6HlThHCxtLqEe2ks/tLT7k1HzMc
	 KtsSbhW6QnNblk2SEQ/2tdR8ZBcCf4peTTnFmU342/drv6Z5EwQ8aaOUw2UVns3tc2
	 7mGfPUv0FYxVDkAyjgXNoO8CoWcZ4FIIQKrQ9j+dKCd6PbFouZkwNBJwNwykn7KCFn
	 8tFxU8RFbkzG9ErZw9nU7LHvi/rjuUzfPu+isYvjrEjoCaTTZPpVc/+Rh9WrjiND3V
	 ZpEQcnoS7PkDFFWq0jbcIGNrfaWKDuXKETD5Wz/XHFiC5vCHn78GhalyO0UiiFJlgw
	 nxQEScL3WO5qA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sat, 23 Nov 2024 19:30:19 -0700
Subject: [PATCH] riscv: Always inline bitops
MIME-Version: 1.0
Message-Id: <20241123-riscv-always-inline-bitops-v1-1-00e8262ab1cf@kernel.org>
X-B4-Tracking: v=1; b=H4sIALqPQmcC/x3MSQqEMBAF0KtIrS3IIL3wKuIixtL+IFFS4oB49
 w69fJv3kEqGKLXVQ1kOKNZUYOuK4jekWRhjMTnjGmud5wyNB4flDLcy0oIkPGBfN2VjnI3NGMR
 /BirBlmXC9c+7/n1/ZVks2mwAAAA=
X-Change-ID: 20241123-riscv-always-inline-bitops-0021c4dae36b
To: Palmer Dabbelt <palmer@dabbelt.com>, Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5392; i=nathan@kernel.org;
 h=from:subject:message-id; bh=MNKk7Ci3f1opxvYb+4djlIYsEba/X8+/Xe7iEjP1cAg=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDOlO/TdvLT0Wxn97c4y8gpCEiliyyC8fnc+Vrn2nuQ1KY
 /1MAhd3lLIwiHExyIopslQ/Vj1uaDjnLOONU5Ng5rAygQxh4OIUgIm8WsrwT8/G7kv+fgXxi5W8
 C/sEpRcestoyYXur+7ec+HlJ/0STTjD8lZt4uvSmpXBVltslFvcZ/YfWzWta7HAv0H9d5napdrv
 jDAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241123_183051_642325_956D024E 
X-CRM114-Status: GOOD (  11.49  )
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

When building allmodconfig + ThinLTO with certain versions of clang,
arch_set_bit() may not be inlined, resulting in a modpost warning:

  WARNING: modpost: vmlinux: section mismatch in reference: arch_set_bit+0x58 (section: .text.arch_set_bit) -> numa_nodes_parsed (section: .init.data)

acpi_numa_rintc_affinity_init() calls arch_set_bit() via __node_set()
with numa_nodes_parsed, which is marked as __initdata. If arch_set_bit()
is not inlined, modpost will flag that it is being called with data that
will be freed after init.

As acpi_numa_rintc_affinity_init() is marked as __init, there is not
actually a functional issue here. However, the bitop functions should be
marked as __always_inline, so that they work consistently for init and
non-init code, which the comment in include/linux/nodemask.h alludes to.
This matches s390 and x86's implementations.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/include/asm/bitops.h | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index fae152ea0508d2e1ea490fffd645eab99cf387bf..c6bd3d8354a96b4e7bbef0e98a201da412301b57 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -228,7 +228,7 @@ static __always_inline int variable_fls(unsigned int x)
  *
  * This operation may be reordered on other architectures than x86.
  */
-static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
+static __always_inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(or, __NOP, nr, addr);
 }
@@ -240,7 +240,7 @@ static inline int arch_test_and_set_bit(int nr, volatile unsigned long *addr)
  *
  * This operation can be reordered on other architectures other than x86.
  */
-static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
+static __always_inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(and, __NOT, nr, addr);
 }
@@ -253,7 +253,7 @@ static inline int arch_test_and_clear_bit(int nr, volatile unsigned long *addr)
  * This operation is atomic and cannot be reordered.
  * It also implies a memory barrier.
  */
-static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
+static __always_inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit(xor, __NOP, nr, addr);
 }
@@ -270,7 +270,7 @@ static inline int arch_test_and_change_bit(int nr, volatile unsigned long *addr)
  * Note that @nr may be almost arbitrarily large; this function is not
  * restricted to acting on a single-word quantity.
  */
-static inline void arch_set_bit(int nr, volatile unsigned long *addr)
+static __always_inline void arch_set_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(or, __NOP, nr, addr);
 }
@@ -284,7 +284,7 @@ static inline void arch_set_bit(int nr, volatile unsigned long *addr)
  * on non x86 architectures, so if you are writing portable code,
  * make sure not to rely on its reordering guarantees.
  */
-static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
+static __always_inline void arch_clear_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(and, __NOT, nr, addr);
 }
@@ -298,7 +298,7 @@ static inline void arch_clear_bit(int nr, volatile unsigned long *addr)
  * Note that @nr may be almost arbitrarily large; this function is not
  * restricted to acting on a single-word quantity.
  */
-static inline void arch_change_bit(int nr, volatile unsigned long *addr)
+static __always_inline void arch_change_bit(int nr, volatile unsigned long *addr)
 {
 	__op_bit(xor, __NOP, nr, addr);
 }
@@ -311,7 +311,7 @@ static inline void arch_change_bit(int nr, volatile unsigned long *addr)
  * This operation is atomic and provides acquire barrier semantics.
  * It can be used to implement bit locks.
  */
-static inline int arch_test_and_set_bit_lock(
+static __always_inline int arch_test_and_set_bit_lock(
 	unsigned long nr, volatile unsigned long *addr)
 {
 	return __test_and_op_bit_ord(or, __NOP, nr, addr, .aq);
@@ -324,7 +324,7 @@ static inline int arch_test_and_set_bit_lock(
  *
  * This operation is atomic and provides release barrier semantics.
  */
-static inline void arch_clear_bit_unlock(
+static __always_inline void arch_clear_bit_unlock(
 	unsigned long nr, volatile unsigned long *addr)
 {
 	__op_bit_ord(and, __NOT, nr, addr, .rl);
@@ -345,13 +345,13 @@ static inline void arch_clear_bit_unlock(
  * non-atomic property here: it's a lot more instructions and we still have to
  * provide release semantics anyway.
  */
-static inline void arch___clear_bit_unlock(
+static __always_inline void arch___clear_bit_unlock(
 	unsigned long nr, volatile unsigned long *addr)
 {
 	arch_clear_bit_unlock(nr, addr);
 }
 
-static inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
+static __always_inline bool arch_xor_unlock_is_negative_byte(unsigned long mask,
 		volatile unsigned long *addr)
 {
 	unsigned long res;

---
base-commit: 0eb512779d642b21ced83778287a0f7a3ca8f2a1
change-id: 20241123-riscv-always-inline-bitops-0021c4dae36b

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
