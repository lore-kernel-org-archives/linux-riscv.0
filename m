Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7903C4707C
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jan 2024 18:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iHXtvzAe7BgaUJHf40ndIZTAM9hlx7CdSkXIkee1klk=; b=ti0i0naqMxJgdv
	MwpWaCV1O+MnMR9SX2omP2Ri5Hz4tJEZPxG5CXrNWTM0n2fbPXjoFMrmtpD19dnOuH4F7cYkNsRUs
	Zg277LKbKCc1+pdt7gIsZvNZmjjdiF8QkSpN3/vWQUA8WQWpO0Sy4mL5e23aQhV1UP421KbgRaR//
	zZ8hp6xQ0AY8NqTDqhrI7dHeCmjD6t5a6oAOqty5vV352qEgOIGLAoPR2HIfJY8J24v6l+ff0xJwa
	NXer4o//jpWFzYhzd5kjLMIws+dIcBduAiKJIaii5KaqG3WFDAWq/e9JIWkJF+q2kSmK0JIZe/iQX
	RQAbI6b5eSlzOvwnCbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLpI9-0001Kw-0C;
	Fri, 05 Jan 2024 18:51:37 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLpI4-0001Gt-1j
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jan 2024 18:51:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 236ACB81DD6;
	Fri,  5 Jan 2024 18:51:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C11B5C433B6;
	Fri,  5 Jan 2024 18:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704480689;
	bh=nsJfxzeMQv5O8Qx1VjRmXPmszEADwolhj0yHfx5D/74=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KLofNzRTE48YcTNp2pEQs7koOanFijkUEzMPvxdXIP/DrnVTo1I4T2uHaF9AKaXrI
	 jgLoCgXIh9/cx/LfI0PtPZkQ25WQlWF1HKUnaVQax709V7Hzwz9z0mryE2XZLwZ3Rt
	 71JsLakPYJaaaxOrcjYlef+/OWzFCCutckJxgGbEXzNrnuKV/hzz2xnzLeWahhXlHA
	 JnHXBsJ3P2jfBSBXnJnlS0h6AIWrvpXAjkQbMDRZ9YtRFwrdF7Wit3m/rXP+0yRHay
	 XcbJJXsDC91dZGM4aKRP2anfU0GN6X1yoAj2FkBvXSeEsMY9/fWI3qWfM4XhWa2/0x
	 mhv5aMa9UnOeg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Jerry Shih <jerry.shih@sifive.com>
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	hongrong.hsu@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andy Chiu <andy.chiu@sifive.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: [PATCH v2 03/12] RISC-V: add helper function to read the vector VLEN
Date: Fri,  5 Jan 2024 10:49:39 -0800
Message-ID: <20240105184950.43181-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105184950.43181-1-ebiggers@kernel.org>
References: <20240105184950.43181-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240105_105132_712662_DA21D892 
X-CRM114-Status: GOOD (  11.36  )
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
index 71af3404fda14..ae724e016fe24 100644
--- a/arch/riscv/include/asm/vector.h
+++ b/arch/riscv/include/asm/vector.h
@@ -218,11 +218,22 @@ static inline bool riscv_v_vstate_ctrl_user_allowed(void) { return false; }
 #define riscv_v_vsize (0)
 #define riscv_v_vstate_discard(regs)		do {} while (0)
 #define riscv_v_vstate_save(task, regs)		do {} while (0)
 #define riscv_v_vstate_restore(task, regs)	do {} while (0)
 #define __switch_to_vector(__prev, __next)	do {} while (0)
 #define riscv_v_vstate_off(regs)		do {} while (0)
 #define riscv_v_vstate_on(regs)			do {} while (0)
 
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
