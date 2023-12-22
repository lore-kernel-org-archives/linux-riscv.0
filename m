Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED26C46CD8
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Dec 2023 11:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9F740Up2AQ1sCodkcZXx25nw4ckhaajZBRATYUu3NHA=; b=nrvBpSqQWo0C43
	LyLo8byB4VJR02Rq0KZv+FprpskWcsqVIL89egi4G1lt3EBU1px/6Xkg1ABmg4YU9VpLuTQwQmHlH
	fkkBpnqQMUqOIfuX4svMXghLLv0ef6fAKqCWcOM2TFP3PDj2KYpXBuFeEbVp8jyDogYETNpOZeOno
	kKjTWLR1OUCL4vtM733eJNEBFJIUdlcX1kNsXClsg9S4tSxFrMgP9fHehKePGB73OpNBFZY0OkICY
	zGbrl7tNt7PmRolExORUm9lGyG2O9lXWaO7mmFX+rXcVnPCw7wSCml7lVQYfBjf6YZ2jzUdoNHWWw
	tfm0x2NwPrd7hHXRBxEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9l-005sIs-0t;
	Fri, 22 Dec 2023 11:57:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGe9i-005sGz-23
	for linux-riscv@lists.infradead.org;
	Fri, 22 Dec 2023 11:57:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CCCDE61C0C;
	Fri, 22 Dec 2023 11:57:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 453B3C433C7;
	Fri, 22 Dec 2023 11:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703246249;
	bh=/l6avMA7EU8OdaEPKAk6fYnGo8Aj3OZ74KZJkfMi7ro=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9NA+rgguh457yYzw8xXp5ZSYH8I1HoC3z7XcoXIbtLpB/D+HRAQ9UcNBjMluElnH
	 4RUzNAaKXXd53Sy2egoIyBSCVfN0GNLMKj7M3XGHOUXMNdjJ4SgJHjW2/Da9nSYvpj
	 zNiQsEn2KI9bPrHx7VRY1NHyGJPOD5GZlnZDtD7oZZgXwJEma8EIbyEBlFYy+8fhpD
	 lro6yLLsWb0bTPAf0kmFRnRgbyjo3069vahuhziEzw7kS4uw3mP4UL5mRq/gU06ncr
	 pZ1tbjgYFuBjUUVxMg1xYLXYHriQeO06xrHkSHiRN/vO8PT1k96fZgxqxNvHtspWxk
	 3SKGxdrbqPVCA==
From: guoren@kernel.org
To: linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alexghiti@rivosinc.com,
	charlie@rivosinc.com,
	xiao.w.wang@intel.com,
	guoren@kernel.org,
	david@redhat.com,
	panqinglin2020@iscas.ac.cn,
	rick.p.edgecombe@intel.com,
	willy@infradead.org,
	bjorn@rivosinc.com,
	conor.dooley@microchip.com,
	cleger@rivosinc.com,
	leobras@redhat.com
Cc: linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	stable@vger.kernel.org
Subject: [PATCH V3 2/4] riscv: mm: Fixup compat arch_get_mmap_end
Date: Fri, 22 Dec 2023 06:57:01 -0500
Message-Id: <20231222115703.2404036-3-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231222115703.2404036-1-guoren@kernel.org>
References: <20231222115703.2404036-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231222_035730_742083_CB727154 
X-CRM114-Status: UNSURE (   8.84  )
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

From: Guo Ren <guoren@linux.alibaba.com>

When the task is in COMPAT mode, the arch_get_mmap_end should be 2GB,
not TASK_SIZE_64. The TASK_SIZE has contained is_compat_mode()
detection, so change the definition of STACK_TOP_MAX to TASK_SIZE
directly.

Cc: stable@vger.kernel.org
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/processor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index f19f861cda54..e1944ff0757a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -16,7 +16,7 @@
 
 #ifdef CONFIG_64BIT
 #define DEFAULT_MAP_WINDOW	(UL(1) << (MMAP_VA_BITS - 1))
-#define STACK_TOP_MAX		TASK_SIZE_64
+#define STACK_TOP_MAX		TASK_SIZE
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
