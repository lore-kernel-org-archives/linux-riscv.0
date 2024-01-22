Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A56DC47DD3
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 00:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NmTA+lbORWZgFMZL+fmdQgeEE8wa6Me8wNwhlmUTvr4=; b=iVIKTYWtZBUnDz
	qzSeW5Aym0Ancmj3KC/K1PujlvOFtbhNBbDTycljj34o0w+L3JYYp9zHLLRdtZpT6u87WNOI90fjB
	NHcxkVTzDNjG3mO8O/vCnUohx+m+nmgxN6r2C9vduh/ktuIIap4hRvr97XUGV8nRRPI60XUz1LOjn
	/453ak6nhZtLjMuJJIHxsSmZwjzNGeqe++veqzVLDQU6t0H5/V09U4l1V2XRC+nQQSfFuS/27slif
	klNbVKVpxsr6vSWRY2oiwTKFZ+IgF4ospHjMjqGNnDD3iMqAp6BSVm8WRHZcolI0abyppY6eXL3CC
	vgqIwP3Euh3N9GXSG/Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRi5i-00AFnj-1q;
	Mon, 22 Jan 2024 00:23:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRi5e-00AFmI-0g
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 00:23:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D1C7CB80B44;
	Mon, 22 Jan 2024 00:22:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB036C43390;
	Mon, 22 Jan 2024 00:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705882978;
	bh=cu/x3ItAEqexfto4Q62/HSpF8UbXNvIBvj4vMpklLig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pHW/j+hVYcQ07mUuVmoaaAsGPm/61eCDdoJM0ufsYRwR6PrpSPg84A+/4jl51OZqh
	 gRJqHPELv2mQnKLWkuFWnmN6bOuwlKBmo1kkltWLEMQiZiPjAKFOdrKl4xdlX2EfZf
	 MFIuQ/hgBkYKXEw4jZWDBPoLXota/bOJ7wWH+VHTnNr0myYVIsGWL+dLXfLSG7ByEZ
	 1BvesMZ2YNLNAY8HD4twt8KK1b+kp7/ituTaaXKMTwHXvZAWuFnNZpnQ8pFjZEo8cg
	 5W2ZkYpsq0PQFU3itAG689+XqQbphjP4Fji+0DZ+zAUPDz9JKqxZOdTSz6bQEq3q68
	 HayS0AbAwrKxg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Jerry Shih <jerry.shih@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	hongrong.hsu@sifive.com,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v3 01/10] RISC-V: add helper function to read the vector VLEN
Date: Sun, 21 Jan 2024 16:19:12 -0800
Message-ID: <20240122002024.27477-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122002024.27477-1-ebiggers@kernel.org>
References: <20240122002024.27477-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240121_162302_377145_E48A973F 
X-CRM114-Status: GOOD (  11.26  )
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

From: Heiko Stuebner <heiko.stuebner@vrull.eu>

VLEN describes the length of each vector register and some instructions
need specific minimal VLENs to work correctly.

The vector code already includes a variable riscv_v_vsize that contains
the value of "32 vector registers with vlenb length" that gets filled
during boot. vlenb is the value contained in the CSR_VLENB register and
the value represents "VLEN / 8".

So add riscv_vector_vlen() to return the actual VLEN value for in-kernel
users when they need to check the available VLEN.

Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
Reviewed-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Jerry Shih <jerry.shih@sifive.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/include/asm/vector.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/include/asm/vector.h b/arch/riscv/include/asm/vector.h
index 0cd6f0a027d1f..731dcd0ed4de9 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -277,11 +277,22 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vstate_restore(vstate, regs)	do {} while (0)
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
 #define riscv_v_thread_free(tsk)		do {} while (0)
 #define  riscv_v_setup_ctx_cache()		do {} while (0)
 #define riscv_v_thread_alloc(tsk)		do {} while (0)
 
 #endif /* CONFIG_RISCV_ISA_V */
 
+/*
+ * Return the implementation's vlen value.
+ *
+ * riscv_v_vsize contains the value of "32 vector registers with vlenb length"
+ * so rebuild the vlen value in bits from it.
+ */
+static inline int riscv_vector_vlen(void)
+{
+	return riscv_v_vsize / 32 * 8;
+}
+
 #endif /* ! __ASM_RISCV_VECTOR_H */
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
