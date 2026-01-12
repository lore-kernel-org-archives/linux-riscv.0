Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED03CF45C8
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lG71K3YLdsnqzqj2P1utNotFDv60RPTR4plEmR3jV54=; b=nrOWa/DJo3OeYD
	k5es9vmABePe/dE6KcSlMY3SLkjTHyg7zbfuoNk36a4LnZ03YyZ6K/jq3BY91U9gDaU4IR0GtIyrj
	Jd9osg+QFKkcFHoVtuH9L7fOGMLOS9GelNR0s4C6LXY9bPOAY/EPRrJh3kuDZjYTyNbUjZnWVZaZv
	0aKJf7JHztwqhsvymXRPAGCUVl1IF/BgFHbvwicrtvbfG6+pA7a7zfvtG5T1oBCcsSv19qfZWNTFf
	saEjTlXDSXx6AeSIIr+FuuiZ7dozZbL+iUxfM6Dk8P7yqAaqVmkBhWsqjIf7/+UuKauSZBrMOj260
	Iv9LPwj80Jk9DYdR2iUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNWq-000000060bo-2Q52;
	Mon, 12 Jan 2026 19:24:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVh-00000005z4z-1ASW;
	Mon, 12 Jan 2026 19:23:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ACED5600BB;
	Mon, 12 Jan 2026 19:23:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01984C116D0;
	Mon, 12 Jan 2026 19:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245808;
	bh=/+92A2W8sPhnyqgSvgeYDPLSqRQhqBCuSe5uLYbIIyo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T1GvvbAZd1QxRXqOx3RVwEnT8L6/7in7jYWOmXPjC5hvhKjvhv+Wzfs5/LUMHR8Lc
	 SdGTbOSLXj/2W/iKIhh/AT5PZwYWYZ1BOouRjUMUk2hghvgAR6+JvM8kF0KbCUU7yp
	 puzPO54NzZ3xe7XfNGWN6VWmD3ZkQ+dVaqDcSY/FoA3F/XNqeh1rnjNcSxjRjbPA7/
	 gqecjM8PRPEN29c60wRVNKJHik18bwbo1WjAwXvniH+AS9JnoM0gcQ2DNi5blIsfxI
	 UYBfP/Us7YHO8J9QoEFy1ANvrLWZNZs147dSPjGhBOGui77MkyOPGu0k7NMYzgIM2A
	 bXI6EI75/O3bQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 19/35] Bluetooth: SMP: Use new AES library API
Date: Mon, 12 Jan 2026 11:20:17 -0800
Message-ID: <20260112192035.10427-20-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 net/bluetooth/smp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/net/bluetooth/smp.c b/net/bluetooth/smp.c
index 3a1ce04a7a53..bf61e8841535 100644
--- a/net/bluetooth/smp.c
+++ b/net/bluetooth/smp.c
@@ -372,36 +372,36 @@ static int smp_h7(struct crypto_shash *tfm_cmac, const u8 w[16],
  * s1 and ah.
  */
 
 static int smp_e(const u8 *k, u8 *r)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	uint8_t tmp[16], data[16];
 	int err;
 
 	SMP_DBG("k %16phN r %16phN", k, r);
 
 	/* The most significant octet of key corresponds to k[0] */
 	swap_buf(k, tmp, 16);
 
-	err = aes_expandkey(&ctx, tmp, 16);
+	err = aes_prepareenckey(&aes, tmp, 16);
 	if (err) {
 		BT_ERR("cipher setkey failed: %d", err);
 		return err;
 	}
 
 	/* Most significant octet of plaintextData corresponds to data[0] */
 	swap_buf(r, data, 16);
 
-	aes_encrypt(&ctx, data, data);
+	aes_encrypt(&aes, data, data);
 
 	/* Most significant octet of encryptedData corresponds to data[0] */
 	swap_buf(data, r, 16);
 
 	SMP_DBG("r %16phN", r);
 
-	memzero_explicit(&ctx, sizeof(ctx));
+	memzero_explicit(&aes, sizeof(aes));
 	return err;
 }
 
 static int smp_c1(const u8 k[16],
 		  const u8 r[16], const u8 preq[7], const u8 pres[7], u8 _iat,
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
