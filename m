Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792C8C79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:From:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=18bWMp2rqUTa21AuHGudl+nzT+PaClgtQSnrlLJPayI=; b=wYQXtJEz6VtWrr
	hCrR/doffORs+zUq2cMS6Aj/mGRgvmP0G3QIDYkE4lp6MuGLwfj/iFjgXitI2UGyvPvnJXfrK3g4G
	5gvydsaA4CFAypDY2M+KOQBKAUAGoT1DPbAu8CfNy0sfucpipsG4JtHgBp6eMgQ/7E0EO0D07Y76O
	Jbl5y6pjC7RwHBBIFrR42epb7AQpuZNY3DGtlkRI/U0/BORnxO1aFrwSDamGMasXeCPaNJIRC9g0s
	hURKQy32x47FUUV1StrOxfswsXB/hWcZaJCS+iQv9wH6rvINveE5rmPSWAZEKBan9B+e7S8QqKcUJ
	pU3f3xxdNzp2mIlyKtPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclSS-0000000BWs4-2mgQ;
	Mon, 05 Jan 2026 14:21:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclSP-0000000BWrj-3o05
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jan 2026 14:21:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CAFF540AAF;
	Mon,  5 Jan 2026 14:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54A6DC116D0;
	Mon,  5 Jan 2026 14:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767622876;
	bh=EoN1Evby9etiTVrttNz3SV0AHHuBWqYTsDtWR6DH0Ic=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=IKZJWT0/6hG00rzL1cWT9JuMSJMJyQLCaD/mywDLjNfWLRWcKCo944SvmElOHZU47
	 c1NqkyO/kNAVcTYoxjthW/t7SB04JmqTnXWIuu4sFfMdtoWx3k7x34EN9VUWwzu7vf
	 /oXRwYA1jjpkYN1b0dNnISCtHlmhx4MvTL1yFMfA=
Subject: Patch "lib/crypto: riscv/chacha: Avoid s0/fp register" has been added to the 6.12-stable tree
To: ebiggers@kernel.org,gregkh@linuxfoundation.org,linux-riscv@lists.infradead.org,wangruikang@iscas.ac.cn
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 05 Jan 2026 15:19:27 +0100
In-Reply-To: <20251229223729.99861-1-ebiggers@kernel.org>
Message-ID: <2026010527-uphold-matrimony-61b7@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_062118_358945_FBDDA648 
X-CRM114-Status: GOOD (  12.25  )
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


This is a note to let you know that I've just added the patch titled

    lib/crypto: riscv/chacha: Avoid s0/fp register

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     lib-crypto-riscv-chacha-avoid-s0-fp-register.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-204145-greg=kroah.com@vger.kernel.org Mon Dec 29 23:39:13 2025
From: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 29 Dec 2025 14:37:29 -0800
Subject: lib/crypto: riscv/chacha: Avoid s0/fp register
To: stable@vger.kernel.org
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, Vivian Wang <wangruikang@iscas.ac.cn>, Eric Biggers <ebiggers@kernel.org>
Message-ID: <20251229223729.99861-1-ebiggers@kernel.org>

From: Vivian Wang <wangruikang@iscas.ac.cn>

commit 43169328c7b4623b54b7713ec68479cebda5465f upstream.

In chacha_zvkb, avoid using the s0 register, which is the frame pointer,
by reallocating KEY0 to t5. This makes stack traces available if e.g. a
crash happens in chacha_zvkb.

No frame pointer maintenance is otherwise required since this is a leaf
function.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
Fixes: bb54668837a0 ("crypto: riscv - add vector crypto accelerated ChaCha20")
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/20251202-riscv-chacha_zvkb-fp-v2-1-7bd00098c9dc@iscas.ac.cn
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/riscv/crypto/chacha-riscv64-zvkb.S |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

--- a/arch/riscv/crypto/chacha-riscv64-zvkb.S
+++ b/arch/riscv/crypto/chacha-riscv64-zvkb.S
@@ -60,7 +60,8 @@
 #define VL		t2
 #define STRIDE		t3
 #define NROUNDS		t4
-#define KEY0		s0
+#define KEY0		t5
+// Avoid s0/fp to allow for unwinding
 #define KEY1		s1
 #define KEY2		s2
 #define KEY3		s3
@@ -141,7 +142,6 @@ SYM_FUNC_START(chacha20_zvkb)
 	srli		LEN, LEN, 6	// Bytes to blocks
 
 	addi		sp, sp, -96
-	sd		s0, 0(sp)
 	sd		s1, 8(sp)
 	sd		s2, 16(sp)
 	sd		s3, 24(sp)
@@ -277,7 +277,6 @@ SYM_FUNC_START(chacha20_zvkb)
 	add		INP, INP, TMP
 	bnez		LEN, .Lblock_loop
 
-	ld		s0, 0(sp)
 	ld		s1, 8(sp)
 	ld		s2, 16(sp)
 	ld		s3, 24(sp)


Patches currently in stable-queue which might be from ebiggers@kernel.org are

queue-6.12/lib-crypto-riscv-chacha-avoid-s0-fp-register.patch
queue-6.12/lib-crypto-x86-blake2s-fix-32-bit-arg-treated-as-64-bit.patch

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
