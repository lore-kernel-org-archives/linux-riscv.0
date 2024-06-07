Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D30FCC27C65
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncyUnm7Qnj5VkJThTg/pz5t1i+fDSf/NPt7NZFqsyt0=; b=PTX3nZHKKpKmCc
	QYYfOxSSRuxSg93hY1TEE0G40995cX3Mr84zGDETd4vXBkVigJW8dH1vJXS0pZlH2yK+poELmQwkc
	VMMz/2SKCfo/dIu+0hiN9CArN3tN+ugy5UhxBWMVFc6IguDGF4Yvx4KnFipB9tQW57qJlRkY5wOAC
	5T+3fsPMnYFGa6TRvYJSPRxpvFAlMmWI0LqdTxIQGlZ9hXwmfVATT/yAZa9LaTIT9mN8iYqcW8C9v
	K27miwzRwPPjmSlUZNB4OiE/Rz4dtGOp1n52NQMD5blr9ZsSzb+CJUBuPTOonvFpohQok5hMxQANe
	dzIje8Z6SICWbJSum7FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6c-0000000FVXE-09gh;
	Fri, 07 Jun 2024 20:22:34 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6Q-0000000FVRd-0P1f
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:32 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TP0ssdDAE0NqzBzFQW76UUCVj0BXnEtRoVuuQq7wR+A=;
	b=cQzPkJdtRWilbFwWhEzmOk8wKwdQTdbrjtndb3Y+dC72TGNip7QyeYIf1ym/rDYhKOvXAV
	g994mSyBhfaKP0VLrAYutCQeOoCRfCg3/c6N7Ooiiq4J42a9dL9ikGhDy2gI6+VwOgig6o
	LYu3oKF2qoHLTrsZH8sR0rxBHpp8GagcYhHJIsZXck56+Cdwfd0Aa8CQEFLVTWCk9QjPh0
	q+Iqu8K+S5rKHIJEE14bL/y5+hvGLNoNxkVCmmTGF6o41jKT3C/ObAx1aCE9nVgByBznCn
	NOGPBxuG1TyxM5shHTfhaE3dQBGBZBWyROq3eLWp0auUC3K3Use7X6JyaPCRjQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TP0ssdDAE0NqzBzFQW76UUCVj0BXnEtRoVuuQq7wR+A=;
	b=baW3tS6AU1ouireVhMZXJaC7HqFegaRe4WIoi/evjK5RZHILiI6VHVnu0W4qgXHjbRUBRY
	DcR18wEhRuGd6mDA==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 6/8] riscv: drop the use of XIP_OFFSET in kernel_mapping_va_to_pa()
Date: Fri,  7 Jun 2024 22:22:11 +0200
Message-Id: <644c13d9467525a06f5d63d157875a35b2edb4bc.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132222_517543_7C47B0D6 
X-CRM114-Status: GOOD (  10.75  )
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

XIP_OFFSET is the hard-coded offset of writable data section within the
kernel.

By hard-coding this value, the read-only section of the kernel (which is
placed before the writable data section) is restricted in size.

As a preparation to remove this hard-coded macro XIP_OFFSET entirely,
remove the use of XIP_OFFSET in kernel_mapping_va_to_pa(). The macro
XIP_OFFSET is used in this case to check if the virtual address is mapped
to Flash or to RAM. The same check can be done with kernel_map.xiprom_sz.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/page.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index b1fcf0d733c4..cda4a917f90a 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -159,7 +159,7 @@ phys_addr_t linear_mapping_va_to_pa(unsigned long x);
 #ifdef CONFIG_XIP_KERNEL
 #define kernel_mapping_va_to_pa(y) ({						\
 	unsigned long _y = (unsigned long)(y);					\
-	(_y < kernel_map.virt_addr + XIP_OFFSET) ?				\
+	(_y < kernel_map.virt_addr + kernel_map.xiprom_sz) ?			\
 		(_y - kernel_map.va_kernel_xip_text_pa_offset) :		\
 		(_y - kernel_map.va_kernel_xip_data_pa_offset);			\
 	})
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
