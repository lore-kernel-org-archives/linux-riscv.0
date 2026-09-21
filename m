Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FC3C982DE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SGIauBn+kcXXHTJNqdLrMkOZpTS1B8kufrGliACn+js=; b=uz2/UInYC86ztg
	Ci2ZJzFjMntCPgWIwSO6fFMjj2wMMDAr8HpmpP6moUOBClI3q1/TvmzWorOO66bdwntWVZNIg7Rk+
	bmLOa+cn6240gjhg09cAsGXZqKhHkOaOv+b51797JNpEAEaQXY2Hv4CHi83wwXd2Mxg0znQDyGzY0
	f+hzkNs63KCzDFQMqCcBhQe97Pkso7HVcGm2dBGXH9SZ5aM0uqowZT1hEp0RAS4zDtXKk0Jg0jCWo
	TfZxxDG9xSCOtn7poj4EaKwshJhgag4BsZg4XlrV9q7RQlkCJpttfRnwZrjmyJ9TOvEwThnM5Pdvf
	7qUOBL2DV27RDClt9fMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNq-00000000tEt-2BaD;
	Mon, 21 Sep 2026 05:16:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNp-00000000tDv-0YHz
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9139244503;
	Mon, 21 Sep 2026 05:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F3831F00898;
	Mon, 21 Sep 2026 05:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789967764;
	bh=l2e5aS3P16JVyDKjq90b4GgBp+uz5p5ORC8v/uhLgc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VgTXIipPBuyIzUxt4YB8QdAuFiMZVdDBHQqS5I37l6gCAoBuz1sYrIRv9mp5a7CFs
	 7BSknCugDixGBc6ncSypV6r55fcR08MRcNq0/JG7Tf9o87OFQSOnfgCSl8XwL4feYq
	 flSvX5ZIwGYsZOR9TttT+Ypqy2Mjop5+r5DDgLn/2d2rb5mYwBuLWyb9axBu1MpxG1
	 y7hhhepchWWxXY9R6KTd+/Lmt+x6pD+IqlYsm0+NH4HHBSYcxJCw2vj0p6PqAt+zWi
	 lVRFy2c97BPGP672gD4dLZnkvAnfSbhdXgBdyGZJvjmRaPKM4TvP7217WSDga32xX5
	 YO/Sv2wAj1xvA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 03/20] lib/crypto: x86/aes: Clean up aes-aesni.S in preparation for AES modes
Date: Sun, 20 Sep 2026 22:08:49 -0700
Message-ID: <20260921050910.296144-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921050910.296144-1-ebiggers@kernel.org>
References: <20260921050910.296144-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

Various miscellaneous updates to the assembly code in preparation for
adding implementations of AES modes to the same file:

- Define macros for the function argument registers, function prologues,
  and function epilogues to centralize some of the handling of 32-bit vs
  64-bit.

- Refactor the actual AES encryption and AES decryption logic into
  macros _do_aes and _do_aes_ecb so that some of the modes can reuse it.

- Rename mask to expandkey_mask to differentiate it from the bswap_mask
  that will be added.

- Update the prototypes of aes_encrypt_aesni() and aes_decrypt_aesni()
  to be dst, src, key so that they will match the mode functions.

  Note that this means passing a pointer to the key struct instead of a
  (nrounds, rndkeys) pair, similar to what arch/x86/crypto/aes*.S do.
  Although this makes the assembly code depend on the format of the key
  struct, having one fewer argument makes it easier to accommodate
  32-bit mode, and the C glue code becomes slightly simpler.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/x86/aes-aesni.S | 249 +++++++++++++++++++++++++------------
 lib/crypto/x86/aes.h       |  28 +++--
 2 files changed, 185 insertions(+), 92 deletions(-)

diff --git a/lib/crypto/x86/aes-aesni.S b/lib/crypto/x86/aes-aesni.S
index b8c3e104a3be..90a3765d35b8 100644
--- a/lib/crypto/x86/aes-aesni.S
+++ b/lib/crypto/x86/aes-aesni.S
@@ -8,25 +8,126 @@
 // AVX.  It does use up to SSE4.1, which all CPUs with AES-NI have.
 #include <linux/linkage.h>
 
-.section .rodata
 #ifdef __x86_64__
 #define RODATA(label)	label(%rip)
-#else
+
+#define ARG0		%rdi
+#define ARG1		%rsi
+#define ARG2		%rdx
+#define ARG2_32		%edx
+#define ARG3		%rcx
+#define ARG4		%r8
+#define TMP		%rax
+#define TMP_32		%eax
+#define TMP_16		%ax
+#define TMP_8		%al
+
+#else // __x86_64__
+
 #define RODATA(label)	label
-#endif
 
+// Caller-save GPRs and the first 3 function arguments, assuming -mregparm=3
+#define ARG0		%eax
+#define ARG1		%edx
+#define ARG2		%ecx
+#define ARG2_32		%ecx
+
+// *Callee*-save GPRs.
+#define ARG3		%edi
+#define ARG3_32		%edi
+#define ARG4		%esi
+#define TMP		%ebx
+#define TMP_32		%ebx
+#define TMP_16		%bx
+#define TMP_8		%bl
+#endif // !__x86_64__
+
+// Offsets in struct aes_key
+#define OFFSETOF_NROUNDS	4
+#define OFFSETOF_ROUNDKEYS	16
+#define OFFSETOF_INVROUNDKEYS	256
+
+.section .rodata
+.p2align 4
+.Lexpandkey_mask:
 	// A mask for pshufb that extracts the last dword, rotates it right by 8
 	// bits, and copies the result to all four dwords.
-.p2align 4
-.Lmask:
 	.byte	13, 14, 15, 12, 13, 14, 15, 12, 13, 14, 15, 12, 13, 14, 15, 12
 
-	// The AES round constants, used during key expansion
 .Lrcon:
+	// The AES round constants, used during key expansion
 	.long	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
 
 .text
 
+// In 32-bit mode, push certain callee-saved GPRs and optionally load function
+// arguments from the stack into them.  Do nothing in 64-bit mode.
+//
+// TMP is always made available as a temporary register.
+//
+// \uses_arg3 is 0 to not touch ARG3, 1 to make it available as a temporary
+// register only, or 2 to actually load it as an argument from the stack.
+// Likewise for \uses_arg4 and ARG4.
+.macro _prologue	uses_arg3=0, uses_arg4=0
+#ifdef __i386__
+	.set	ARG3_OFFSET, 4
+	.set	ARG3_PUSHED, \uses_arg3
+	.set	ARG4_PUSHED, \uses_arg4
+.if \uses_arg3
+	push	ARG3
+	.set	ARG3_OFFSET, ARG3_OFFSET + 4
+  .if \uses_arg3 == 2
+	mov	ARG3_OFFSET(%esp), ARG3
+  .endif
+.endif
+.if \uses_arg4
+	push	ARG4
+	.set	ARG3_OFFSET, ARG3_OFFSET + 4
+  .if \uses_arg4 == 2
+	mov	ARG3_OFFSET+4(%esp), ARG4
+  .endif
+.endif
+	push	TMP
+	.set	ARG3_OFFSET, ARG3_OFFSET + 4
+#endif // __i386__
+.endm
+
+.macro _reload_arg3
+#ifdef __i386__
+	mov	ARG3_OFFSET(%esp), ARG3
+#endif
+.endm
+
+// Undo any pushes that _prologue did, then return.
+.macro _epilogue
+#ifdef __i386__
+	pop	TMP
+.if ARG4_PUSHED
+	pop	ARG4
+.endif
+.if ARG3_PUSHED
+	pop	ARG3
+.endif
+#endif
+	RET
+.endm
+
+.macro	_aesenc		enc, rndkey, data
+.if \enc
+	aesenc		\rndkey, \data
+.else
+	aesdec		\rndkey, \data
+.endif
+.endm
+
+.macro	_aesenclast	enc, rndkeylast, data
+.if \enc
+	aesenclast	\rndkeylast, \data
+.else
+	aesdeclast	\rndkeylast, \data
+.endif
+.endm
+
 // Transform four dwords [a0, a1, a2, a3] in \a into
 // [a0, a0^a1, a0^a1^a2, a0^a1^a2^a3].  \tmp is a temporary xmm register.
 //
@@ -71,32 +172,18 @@
 .endm
 
 .macro	_aes_expandkey_aesni	is_aes128
-#ifdef __x86_64__
 	// Arguments
-	.set	RNDKEYS,	%rdi
-	.set	INV_RNDKEYS,	%rsi
-	.set	IN_KEY,		%rdx
+	.set	RNDKEYS,	ARG0
+	.set	INV_RNDKEYS,	ARG1
+	.set	IN_KEY,		ARG2
 
 	// Other local variables
-	.set	RCON_PTR,	%rcx
-	.set	COUNTER,	%eax
-#else
-	// Arguments, assuming -mregparm=3
-	.set	RNDKEYS,	%eax
-	.set	INV_RNDKEYS,	%edx
-	.set	IN_KEY,		%ecx
-
-	// Other local variables
-	.set	RCON_PTR,	%ebx
-	.set	COUNTER,	%esi
-#endif
+	.set	RCON_PTR,	ARG3
+	.set	COUNTER,	TMP_32
 	.set	RCON,		%xmm6
 	.set	MASK,		%xmm7
 
-#ifdef __i386__
-	push		%ebx
-	push		%esi
-#endif
+	_prologue	uses_arg3=1
 
 .if \is_aes128
 	// AES-128: the first round key is simply a copy of the raw key.
@@ -112,7 +199,7 @@
 .endif
 
 	// Generate the remaining round keys.
-	movdqa		RODATA(.Lmask), MASK
+	movdqa		RODATA(.Lexpandkey_mask), MASK
 .if \is_aes128
 	lea		RODATA(.Lrcon), RCON_PTR
 	mov		$10, COUNTER
@@ -176,11 +263,7 @@
 	movdqu		%xmm0, 16(INV_RNDKEYS)	// => Last inverse round key
 
 .Ldone\@:
-#ifdef __i386__
-	pop		%esi
-	pop		%ebx
-#endif
-	RET
+	_epilogue
 .endm
 
 // void aes128_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
@@ -195,67 +278,73 @@ SYM_FUNC_START(aes256_expandkey_aesni)
 	_aes_expandkey_aesni	0
 SYM_FUNC_END(aes256_expandkey_aesni)
 
-.macro	_aes_crypt_aesni	enc
-#ifdef __x86_64__
-	.set	RNDKEYS,	%rdi
-	.set	NROUNDS,	%esi
-	.set	OUT,		%rdx
-	.set	IN,		%rcx
-#else
-	// Assuming -mregparm=3
-	.set	RNDKEYS,	%eax
-	.set	NROUNDS,	%edx
-	.set	OUT,		%ecx
-	.set	IN,		%ebx	// Passed on stack
-#endif
-
-#ifdef __i386__
-	push		%ebx
-	mov		8(%esp), %ebx
-#endif
-
-	// Zero-th round
-	movdqu		(IN), %xmm0
-	movdqu		(RNDKEYS), %xmm1
-	pxor		%xmm1, %xmm0
-
-	// Normal rounds
-	add		$16, RNDKEYS
+// AES-encrypt (\enc=1) or decrypt (\enc=0) the AESDATA registers specified in
+// \vecs using the aes_enckey or aes_key pointed to by KEY.  RNDKEY must be set
+// to a temporary XMM register, NROUNDS to a temporary 32-bit GPR, and
+// RNDKEY_PTR to a temporary full-size GPR.
+.macro	_do_aes		enc, vecs:vararg
+	movl		OFFSETOF_NROUNDS(KEY), NROUNDS
 	dec		NROUNDS
-.Lnext_round\@:
-	movdqu		(RNDKEYS), %xmm1
 .if \enc
-	aesenc		%xmm1, %xmm0
+	.set		rndkey0_offs, OFFSETOF_ROUNDKEYS
 .else
-	aesdec		%xmm1, %xmm0
+	.set		rndkey0_offs, OFFSETOF_INVROUNDKEYS
 .endif
-	add		$16, RNDKEYS
+
+	// Do the zero-th AES round.
+	movdqu		rndkey0_offs(KEY), RNDKEY
+.irp i, \vecs
+	pxor		RNDKEY, AESDATA\i
+.endr
+	// Do the regular AES rounds.
+	lea		rndkey0_offs+16(KEY), RNDKEY_PTR
+.Lnext_round\@:
+	movdqu		(RNDKEY_PTR), RNDKEY
+	add		$16, RNDKEY_PTR
+.irp i, \vecs
+	_aesenc		\enc, RNDKEY, AESDATA\i
+.endr
 	dec		NROUNDS
-	jne		.Lnext_round\@
+	jnz		.Lnext_round\@
+	// Do the last AES round.
+	movdqu		(RNDKEY_PTR), RNDKEY
+.irp i, \vecs
+	_aesenclast	\enc, RNDKEY, AESDATA\i
+.endr
+.endm
 
-	// Last round
-	movdqu		(RNDKEYS), %xmm1
-.if \enc
-	aesenclast	%xmm1, %xmm0
-.else
-	aesdeclast	%xmm1, %xmm0
-.endif
-	movdqu		%xmm0, (OUT)
+.macro	_do_aes_ecb	enc, vecs:vararg
+.irp i, \vecs
+	movdqu		\i*16(SRC), AESDATA\i
+.endr
+	_do_aes		\enc, \vecs
+.irp i, \vecs
+	movdqu		AESDATA\i, \i*16(DST)
+.endr
+.endm
 
-#ifdef __i386__
-	pop		%ebx
-#endif
-	RET
+.macro	_aes_crypt_aesni	enc
+	.set	DST,		ARG0
+	.set	SRC,		ARG1
+	.set	KEY,		ARG2
+	.set	RNDKEY_PTR,	ARG3	// Temporary register for _do_aes
+	.set	NROUNDS,	TMP_32	// Temporary register for _do_aes
+	.set	AESDATA0,	%xmm0
+	.set	RNDKEY,		%xmm1	// Temporary register for _do_aes
+
+	_prologue	uses_arg3=1
+	_do_aes_ecb	\enc, 0
+	_epilogue
 .endm
 
-// void aes_encrypt_aesni(const u32 rndkeys[], int nrounds,
-//			  u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+// void aes_encrypt_aesni(u8 dst[AES_BLOCK_SIZE], const u8 src[AES_BLOCK_SIZE],
+//			  const struct aes_enckey *key);
 SYM_FUNC_START(aes_encrypt_aesni)
 	_aes_crypt_aesni	1
 SYM_FUNC_END(aes_encrypt_aesni)
 
-// void aes_decrypt_aesni(const u32 inv_rndkeys[], int nrounds,
-//			  u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+// void aes_decrypt_aesni(u8 dst[AES_BLOCK_SIZE], const u8 src[AES_BLOCK_SIZE],
+//			  const struct aes_key *key);
 SYM_FUNC_START(aes_decrypt_aesni)
 	_aes_crypt_aesni	0
 SYM_FUNC_END(aes_decrypt_aesni)
diff --git a/lib/crypto/x86/aes.h b/lib/crypto/x86/aes.h
index b047dee94f57..06146fef06be 100644
--- a/lib/crypto/x86/aes.h
+++ b/lib/crypto/x86/aes.h
@@ -7,16 +7,21 @@
 
 #include <asm/fpu/api.h>
 
-static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_aes);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_aesni);
+
+/* The assembly code assumes the following offsets. */
+static_assert(offsetof(struct aes_enckey, nrounds) == 4);
+static_assert(offsetof(struct aes_enckey, k.rndkeys) == 16);
+static_assert(offsetof(struct aes_key, inv_k.inv_rndkeys) == 256);
 
 void aes128_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
 			    const u8 in_key[AES_KEYSIZE_128]);
 void aes256_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
 			    const u8 in_key[AES_KEYSIZE_256]);
-void aes_encrypt_aesni(const u32 rndkeys[], int nrounds,
-		       u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
-void aes_decrypt_aesni(const u32 inv_rndkeys[], int nrounds,
-		       u8 out[AES_BLOCK_SIZE], const u8 in[AES_BLOCK_SIZE]);
+void aes_encrypt_aesni(u8 dst[AES_BLOCK_SIZE], const u8 src[AES_BLOCK_SIZE],
+		       const struct aes_enckey *key);
+void aes_decrypt_aesni(u8 dst[AES_BLOCK_SIZE], const u8 src[AES_BLOCK_SIZE],
+		       const struct aes_key *key);
 
 /*
  * Expand an AES key using AES-NI if supported and usable or generic code
@@ -36,7 +41,7 @@ static void aes_preparekey_arch(union aes_enckey_arch *k,
 	u32 *rndkeys = k->rndkeys;
 	u32 *inv_rndkeys = inv_k ? inv_k->inv_rndkeys : NULL;
 
-	if (static_branch_likely(&have_aes) && key_len != AES_KEYSIZE_192 &&
+	if (static_branch_likely(&have_aesni) && key_len != AES_KEYSIZE_192 &&
 	    irq_fpu_usable()) {
 		kernel_fpu_begin();
 		if (key_len == AES_KEYSIZE_128)
@@ -53,9 +58,9 @@ static void aes_encrypt_arch(const struct aes_enckey *key,
 			     u8 out[AES_BLOCK_SIZE],
 			     const u8 in[AES_BLOCK_SIZE])
 {
-	if (static_branch_likely(&have_aes) && irq_fpu_usable()) {
+	if (static_branch_likely(&have_aesni) && irq_fpu_usable()) {
 		kernel_fpu_begin();
-		aes_encrypt_aesni(key->k.rndkeys, key->nrounds, out, in);
+		aes_encrypt_aesni(out, in, key);
 		kernel_fpu_end();
 	} else {
 		aes_encrypt_generic(key->k.rndkeys, key->nrounds, out, in);
@@ -66,10 +71,9 @@ static void aes_decrypt_arch(const struct aes_key *key,
 			     u8 out[AES_BLOCK_SIZE],
 			     const u8 in[AES_BLOCK_SIZE])
 {
-	if (static_branch_likely(&have_aes) && irq_fpu_usable()) {
+	if (static_branch_likely(&have_aesni) && irq_fpu_usable()) {
 		kernel_fpu_begin();
-		aes_decrypt_aesni(key->inv_k.inv_rndkeys, key->nrounds,
-				  out, in);
+		aes_decrypt_aesni(out, in, key);
 		kernel_fpu_end();
 	} else {
 		aes_decrypt_generic(key->inv_k.inv_rndkeys, key->nrounds,
@@ -81,5 +85,5 @@ static void aes_decrypt_arch(const struct aes_key *key,
 static void aes_mod_init_arch(void)
 {
 	if (boot_cpu_has(X86_FEATURE_AES))
-		static_branch_enable(&have_aes);
+		static_branch_enable(&have_aesni);
 }
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
