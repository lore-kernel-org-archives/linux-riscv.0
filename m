Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7946C61D97
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 01:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVmXkq0LKq1i23+y9QZWx/plbulFxvCRi8pRo4IZE9s=; b=IJiwYPZjLvewvA
	g5d7Fj4wTCmJHlyDoXjqf3K2YDozBZFnWjmh1LwIudrRLCyY6/IClyQCs+PR9P163o6+BHgpoJ1Fx
	JCyscyP3e6y12kLykNqbZdaevaur+vwo3V898aVwxveZDzHxsQRgkg2hsAfaeZl2UlTkLDNx3tp1T
	BaQjMKC9IAF5H3SVX5IgN20/hZX94xA55cD09ZAJF/7ID8C6gpmUVl+nsnanPSrL6S8MUqBJmy5xL
	FhSEtGatZmoUiQTivtuq4gIHsL47vOqlL5l98dwyGQ9xh1JbadNc06lJdqaxMVe/7AEASyD/L2fg+
	BmVK44aILhRcaydVep1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5c3h-000Pwu-1E;
	Wed, 22 Nov 2023 01:29:41 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5c3e-000Pw9-0c
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 01:29:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78563CE1E0E;
	Wed, 22 Nov 2023 01:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39CBEC433C9;
	Wed, 22 Nov 2023 01:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700616575;
	bh=RpIunAZsbi17XYTLNqesJHhN+XFXcX0D4F+MccBdkJk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JrbdFQ6bgw6z7RfWZ45V2si4KCzEBQBQGNtYt+ijIY0vU2ZyG5yoLqrd10A3ZQYk6
	 PaQn8LxCVvuVH8DQScs7rtrAhF+4vXJkdkF/BKVJzBBxeDoEUxUxddctrxqo9kaqa9
	 FP0s2LUG+VOQ/zMn34itUt3qFv3mdLZnDLU6yUK/YpdS+L6kRyz+NaaOPnK4N32h4T
	 m8SNMDlcEa4MXDgpTG3pTLvWEJ7GeZMZurLJKlKCIIM5ZGZv21x+OY7yMc7EICMoms
	 WUEoKBkMAZCEBg3Wfrz4/RW+dPymXm7HTwya4ChSJja62mGU024QnF9t1m/FBQPi3r
	 FWJQkNhUYPOHQ==
Date: Tue, 21 Nov 2023 17:29:33 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Jerry Shih <jerry.shih@sifive.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	herbert@gondor.apana.org.au, davem@davemloft.net,
	andy.chiu@sifive.com, greentime.hu@sifive.com,
	conor.dooley@microchip.com, guoren@kernel.org, bjorn@rivosinc.com,
	heiko@sntech.de, ardb@kernel.org, phoebe.chen@sifive.com,
	hongrong.hsu@sifive.com, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org
Subject: Re: [PATCH 12/12] RISC-V: crypto: add Zvkb accelerated ChaCha20
 implementation
Message-ID: <20231122012933.GG2172@sol.localdomain>
References: <20231025183644.8735-1-jerry.shih@sifive.com>
 <20231025183644.8735-13-jerry.shih@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231025183644.8735-13-jerry.shih@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231121_172938_599486_7A31A72C 
X-CRM114-Status: GOOD (  17.61  )
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

On Thu, Oct 26, 2023 at 02:36:44AM +0800, Jerry Shih wrote:
> diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/crypto/chacha-riscv64-glue.c
> new file mode 100644
> index 000000000000..72011949f705
> --- /dev/null
> +++ b/arch/riscv/crypto/chacha-riscv64-glue.c
> @@ -0,0 +1,120 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Port of the OpenSSL ChaCha20 implementation for RISC-V 64
> + *
> + * Copyright (C) 2023 SiFive, Inc.
> + * Author: Jerry Shih <jerry.shih@sifive.com>
> + */
> +
> +#include <asm/simd.h>
> +#include <asm/vector.h>
> +#include <crypto/internal/chacha.h>
> +#include <crypto/internal/simd.h>
> +#include <crypto/internal/skcipher.h>
> +#include <linux/crypto.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +
> +#define CHACHA_BLOCK_VALID_SIZE_MASK (~(CHACHA_BLOCK_SIZE - 1))
> +#define CHACHA_BLOCK_REMAINING_SIZE_MASK (CHACHA_BLOCK_SIZE - 1)
> +#define CHACHA_KEY_OFFSET 4
> +#define CHACHA_IV_OFFSET 12
> +
> +/* chacha20 using zvkb vector crypto extension */
> +void ChaCha20_ctr32_zvkb(u8 *out, const u8 *input, size_t len, const u32 *key,
> +			 const u32 *counter);
> +
> +static int chacha20_encrypt(struct skcipher_request *req)
> +{
> +	u32 state[CHACHA_STATE_WORDS];

This function doesn't need to create the whole state matrix on the stack, since
the underlying assembly function takes as input the key and counter, not the
state matrix.  I recommend something like the following:

diff --git a/arch/riscv/crypto/chacha-riscv64-glue.c b/arch/riscv/crypto/chacha-riscv64-glue.c
index df185d0663fcc..216b4cd9d1e01 100644
--- a/arch/riscv/crypto/chacha-riscv64-glue.c
+++ b/arch/riscv/crypto/chacha-riscv64-glue.c
@@ -16,45 +16,42 @@
 #include <linux/module.h>
 #include <linux/types.h>
 
-#define CHACHA_KEY_OFFSET 4
-#define CHACHA_IV_OFFSET 12
-
 /* chacha20 using zvkb vector crypto extension */
 asmlinkage void ChaCha20_ctr32_zvkb(u8 *out, const u8 *input, size_t len,
 				    const u32 *key, const u32 *counter);
 
 static int chacha20_encrypt(struct skcipher_request *req)
 {
-	u32 state[CHACHA_STATE_WORDS];
 	u8 block_buffer[CHACHA_BLOCK_SIZE];
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	const struct chacha_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct skcipher_walk walk;
 	unsigned int nbytes;
 	unsigned int tail_bytes;
+	u32 iv[4];
 	int err;
 
-	chacha_init_generic(state, ctx->key, req->iv);
+	iv[0] = get_unaligned_le32(req->iv);
+	iv[1] = get_unaligned_le32(req->iv + 4);
+	iv[2] = get_unaligned_le32(req->iv + 8);
+	iv[3] = get_unaligned_le32(req->iv + 12);
 
 	err = skcipher_walk_virt(&walk, req, false);
 	while (walk.nbytes) {
-		nbytes = walk.nbytes & (~(CHACHA_BLOCK_SIZE - 1));
+		nbytes = walk.nbytes & ~(CHACHA_BLOCK_SIZE - 1);
 		tail_bytes = walk.nbytes & (CHACHA_BLOCK_SIZE - 1);
 		kernel_vector_begin();
 		if (nbytes) {
 			ChaCha20_ctr32_zvkb(walk.dst.virt.addr,
 					    walk.src.virt.addr, nbytes,
-					    state + CHACHA_KEY_OFFSET,
-					    state + CHACHA_IV_OFFSET);
-			state[CHACHA_IV_OFFSET] += nbytes / CHACHA_BLOCK_SIZE;
+					    ctx->key, iv);
+			iv[0] += nbytes / CHACHA_BLOCK_SIZE;
 		}
 		if (walk.nbytes == walk.total && tail_bytes > 0) {
 			memcpy(block_buffer, walk.src.virt.addr + nbytes,
 			       tail_bytes);
 			ChaCha20_ctr32_zvkb(block_buffer, block_buffer,
-					    CHACHA_BLOCK_SIZE,
-					    state + CHACHA_KEY_OFFSET,
-					    state + CHACHA_IV_OFFSET);
+					    CHACHA_BLOCK_SIZE, ctx->key, iv);
 			memcpy(walk.dst.virt.addr + nbytes, block_buffer,
 			       tail_bytes);
 			tail_bytes = 0;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
