Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97E9C3DA78
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ve4VtwkFaIs8sCIn0bDobSxLgeX+tkrYTmaejNBXaFc=; b=pmuh3MRJfyPW2/
	h5kEV1J03Cwi+Gzmr82HvB4xVEWJTsNRRU9CFy9iGj5/GAf1FLI2c/syLoWLUtAhe5LdIN6MhyGus
	GVvOpjzBOgFS0HjnT5Rd9KXS46SmzZgespDvVbWS5PKZMoMrVYZ9gVwiMcuZNGUU05Dzk25X0P9wH
	9iua9wK5ew4q2Ldg8kDLGMoDBHtDtyb5Z1rUZWOh7S9AMpGfo5fRaDADGgzqM8bosnLyRO2iDWyUT
	Q2l5N/5YKc+yuRP1s4ioJYCrEPle8Ul8uGCzZd2QZ8a95BrYGVIYAlrqqeBkIM01dLy5ITYDl3oFx
	tBj/Uo7EICxRsK9qcK8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH61l-007frn-Ck; Sun, 15 Jan 2023 16:38:37 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH61j-007frP-4I
	for linux-riscv@lists.infradead.org; Sun, 15 Jan 2023 16:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 29A21CE0B42;
	Sun, 15 Jan 2023 16:38:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C396C433D2;
	Sun, 15 Jan 2023 16:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673800709;
	bh=4CyV238BW6buQA/dtLPqJucBf3kAZWi8xQWfny1Z+yo=;
	h=From:To:Cc:Subject:Date:From;
	b=PQKd8QgV6dvP8P301dN0tE5afY5Wm9uXtm+/6WQV/iWzp3Quxx3vYQySiASSvQkC8
	 FbvHfLy3VREXlVn3JNf7LMLvT3+/BEylZzY+rGg3X6wuXE478LUha2AhQ7sFYLGRsO
	 te+kkuWk3/HQbnnCxT48UeZ40o1MWVccAXniOAknsm15KuZGIZtjabm3Ve35IFKYbL
	 KfxFbd7dkb9FjyWnU5IUXHNu1pQixVEnTdIdfCbYmBLkaJJncgU2IIOFzduzy4wrad
	 EJAkjJ5AF7alpCje0fvesrGUlJNOQBVzNXfBV+/fjBS5h+hN/4BKMaR9wKO7OKl/WV
	 8sEGJ3CBR/DGg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Jones <ajones@ventanamicro.com>,
	Heiko Stuebner <heiko.stuebner@vrull.eu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: alternative: proceed one more instruction for auipc/jalr pair
Date: Mon, 16 Jan 2023 00:28:11 +0800
Message-Id: <20230115162811.3146-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_083835_362413_8F36EDB6 
X-CRM114-Status: GOOD (  10.60  )
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

If we patched auipc + jalr pair, we'd better proceed one more
instruction. Andrew pointed out "There's not a problem now, since
we're only adding a fixup for jal, not jalr, but we should
future-proof this and there's no reason to revisit an already fixed-up
instruction anyway."

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Suggested-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/alternative.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/kernel/alternative.c b/arch/riscv/kernel/alternative.c
index fc341b69bf62..2354c69dc7d1 100644
--- a/arch/riscv/kernel/alternative.c
+++ b/arch/riscv/kernel/alternative.c
@@ -122,6 +122,7 @@ void riscv_alternative_fix_offsets(void *alt_ptr, unsigned int len,
 
 			riscv_alternative_fix_auipc_jalr(alt_ptr + i * sizeof(u32),
 							 insn, insn2, patch_offset);
+			i++;
 		}
 
 		if (riscv_insn_is_jal(insn)) {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
