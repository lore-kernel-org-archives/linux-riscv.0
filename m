Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7DD6C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 06:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ynq3L6MFAliEvEewTMljiYPobm/rt/IxZlXPaVRVVDc=; b=YvJR3lWdAuLwfN
	JVmTApcf2e02nB2hJt3Qpzz7k5O/Ac3Zmwn1x4IbpEYLZE3oGTL16CQpmD31QUNfiJTbEjUklpKf4
	R94Y0jtXBsB755DbXeW13b17D1y1/VvOmAx6fKnx1zkjhqPwxBewKg6/YBFaULTYT4ljn8oHYJFtV
	0WUdCjRy3KDHWafrNMp2+Nwnu9PgcecCFwkdKBMr5aF1S/oUhy3kWuwjWsCnDHy+r3kNwTUjNtLjd
	VG//KuS9XJ5Q1zh45NYDsYK3eZfP9XNHmcfc6N0zSJZWTC2Ixz5N2XAWQrBKdUi/1e88Mu1v5gNVW
	m+hNXms7mOON1Vqd/Acw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxci-0000000Ck9z-0LSo;
	Thu, 08 Feb 2024 06:11:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXxcf-0000000Ck9L-1EIH
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 06:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BC27F61B29;
	Thu,  8 Feb 2024 06:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA37C433F1;
	Thu,  8 Feb 2024 06:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707372654;
	bh=q5NnvPNENXx6lXEqe6lzo8azetgd5THlB6UTUGS4XJc=;
	h=From:To:Cc:Subject:Date:From;
	b=OQd6SPFXMRyWPgDAZQwxJQOpwAdnF/pAk6Gr7yfLUfqr8HLHNHIAgzh5uK1MFfWar
	 KDd7yQoMso59HaRBAzMBWhxFfEum4Tuqrlt9y/sAGjrWeltwoRpH9Cb9AQZq63z/tF
	 zErIg8rBEDWXnJQNWjt7pIxJSTwCs0n6Wd4jSgmRdgf5JtqfbkwgVIEM3R2I/D6C4k
	 KQYh62E2IC39TzPWROTarfg2PzbVguafe1QNXbQGldWsbwyxFIQj1KK33lILRStR2d
	 enzgVDBCs5LOlRtkrRWdiI0k7YOtHeE05zPNKO1Wi6IZX7N9dlnMzoT1Mvj+GnPh1m
	 pSFv+HuMccxqg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-crypto@vger.kernel.org,
	Jerry Shih <jerry.shih@sifive.com>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>
Subject: [PATCH riscv/for-next] crypto: riscv - parallelize AES-CBC decryption
Date: Wed,  7 Feb 2024 22:08:51 -0800
Message-ID: <20240208060851.154129-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240207_221057_398120_48E97870 
X-CRM114-Status: UNSURE (   7.24  )
X-CRM114-Notice: Please train this message.
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

Since CBC decryption is parallelizable, make the RISC-V implementation
of AES-CBC decryption process multiple blocks at a time, instead of
processing the blocks one by one.  This should improve performance.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/aes-riscv64-zvkned.S | 24 +++++++++++++++---------
 1 file changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/crypto/aes-riscv64-zvkned.S b/arch/riscv/crypto/aes-riscv64-zvkned.S
index 78d4e1186c074..43541aad6386c 100644
--- a/arch/riscv/crypto/aes-riscv64-zvkned.S
+++ b/arch/riscv/crypto/aes-riscv64-zvkned.S
@@ -132,33 +132,39 @@ SYM_FUNC_END(aes_ecb_decrypt_zvkned)
 	addi		INP, INP, 16
 	addi		OUTP, OUTP, 16
 	addi		LEN, LEN, -16
 	bnez		LEN, 1b
 
 	vse32.v		v16, (IVP)	// Store next IV
 	ret
 .endm
 
 .macro	aes_cbc_decrypt	keylen
+	srli		LEN, LEN, 2	// Convert LEN from bytes to words
 	vle32.v		v16, (IVP)	// Load IV
 1:
-	vle32.v		v17, (INP)	// Load ciphertext block
-	vmv.v.v		v18, v17	// Save ciphertext block
-	aes_decrypt	v17, \keylen	// Decrypt
-	vxor.vv		v17, v17, v16	// XOR with IV or prev ciphertext block
-	vse32.v		v17, (OUTP)	// Store plaintext block
-	vmv.v.v		v16, v18	// Next "IV" is prev ciphertext block
-	addi		INP, INP, 16
-	addi		OUTP, OUTP, 16
-	addi		LEN, LEN, -16
+	vsetvli		t0, LEN, e32, m4, ta, ma
+	vle32.v		v20, (INP)	// Load ciphertext blocks
+	vslideup.vi	v16, v20, 4	// Setup prev ciphertext blocks
+	addi		t1, t0, -4
+	vslidedown.vx	v24, v20, t1	// Save last ciphertext block
+	aes_decrypt	v20, \keylen	// Decrypt the blocks
+	vxor.vv		v20, v20, v16	// XOR with prev ciphertext blocks
+	vse32.v		v20, (OUTP)	// Store plaintext blocks
+	vmv.v.v		v16, v24	// Next "IV" is last ciphertext block
+	slli		t1, t0, 2	// Words to bytes
+	add		INP, INP, t1
+	add		OUTP, OUTP, t1
+	sub		LEN, LEN, t0
 	bnez		LEN, 1b
 
+	vsetivli	zero, 4, e32, m1, ta, ma
 	vse32.v		v16, (IVP)	// Store next IV
 	ret
 .endm
 
 // void aes_cbc_encrypt_zvkned(const struct crypto_aes_ctx *key,
 //			       const u8 *in, u8 *out, size_t len, u8 iv[16]);
 //
 // |len| must be nonzero and a multiple of 16 (AES_BLOCK_SIZE).
 SYM_FUNC_START(aes_cbc_encrypt_zvkned)
 	aes_begin	KEYP, 128f, 192f

base-commit: cb4ede926134a65bc3bf90ed58dace8451d7e759
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
