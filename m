Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61242CCA470
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Oct 2025 07:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x1WRH0Ul26TWZpd93Cc73sankn4gkD8Jh4uPmVcRENU=; b=kdz3DEnPmYPXqS
	1oug60vUClmFEKvv+vZgp7+EaF882c3bJliLFTFuTtVnnSC+cOPtxJW9noPnQj85olah6ryRaY3Qb
	RAddW5cwZRE8Ud6TWu7ETxhuBkExyaRKALQCEPwPxkAFqXgVhMB4915PLHDUUms7SnMHsuj/Wn2rC
	UWPC0SEgLAEo6obM5KTL9RHWvyc3fMhirQxInB/6DcAnjEHQYNCu8CaiIeK9DfLO/udbKyAEtMxET
	7wpwi9tfbqYoR+YXX1ZenC5k1kldCbxSCcYZKc0Yg+p8+1/B39OP4wsyKqUXYvrp0xam9Ym3vVz4g
	dgnc0MgXNApOGkpqqlRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Own-00000003O8i-2FXr;
	Wed, 08 Oct 2025 07:50:53 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6Owj-00000003O7d-1BS0
	for linux-riscv@lists.infradead.org;
	Wed, 08 Oct 2025 07:50:52 +0000
Received: from [127.0.0.2] (unknown [114.241.81.247])
	by APP-01 (Coremail) with SMTP id qwCowAA3kaPLF+ZoUI4EDQ--.32936S4;
	Wed, 08 Oct 2025 15:50:36 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 08 Oct 2025 15:50:17 +0800
Subject: [PATCH 6.6.y 2/2] riscv: mm: Do not restrict mmap address based on
 hint
MIME-Version: 1.0
Message-Id: <20251008-riscv-mmap-addr-space-6-6-v1-2-9f47574a520f@iscas.ac.cn>
References: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
In-Reply-To: <20251008-riscv-mmap-addr-space-6-6-v1-0-9f47574a520f@iscas.ac.cn>
To: stable@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Paul Walmsley <paul.walmsley@sifive.com>
X-Mailer: b4 0.14.2
X-CM-TRANSID: qwCowAA3kaPLF+ZoUI4EDQ--.32936S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Zr1DWF1furyUZr4kZFyDAwb_yoW8uFykpF
	Zakanakr1vkry7trZrAr47uF18tan8KFy2grW0grnYkr1YvFW7Xr4Ik3WkZF1UZFW09a1F
	vF1fCasYva4UJwUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUm214x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4U
	JwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7
	IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r4U
	M4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628vn2
	kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkE
	bVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67
	AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI
	42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVF
	xhVjvjDU0xZFpf9x0JUQXo7UUUUU=
X-Originating-IP: [114.241.81.247]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_005049_702238_E9065FF7 
X-CRM114-Status: UNSURE (   8.68  )
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
Cc: Vivian Wang <wangruikang@iscas.ac.cn>, Inochi Amaoto <inochiama@gmail.com>, Charlie Jenkins <charlie@rivosinc.com>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, Yangyu Chen <cyy@cyyself.name>, Guo Ren <guoren@kernel.org>, Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Charlie Jenkins <charlie@rivosinc.com>

[ Upstream commit 2116988d5372aec51f8c4fb85bf8e305ecda47a0 ]

The hint address should not forcefully restrict the addresses returned
by mmap as this causes mmap to report ENOMEM when there is memory still
available.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Fixes: b5b4287accd7 ("riscv: mm: Use hint address in mmap if available")
Fixes: add2cc6b6515 ("RISC-V: mm: Restrict address space for sv39,sv48,sv57")
Closes: https://lore.kernel.org/linux-kernel/ZbxTNjQPFKBatMq+@ghost/T/#mccb1890466bf5a488c9ce7441e57e42271895765
Link: https://lore.kernel.org/r/20240826-riscv_mmap-v1-3-cd8962afe47f@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
[ Adjust removed lines ]
Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
Tested-by: Han Gao <rabenda.cn@gmail.com>
---
 arch/riscv/include/asm/processor.h | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 938aef30dfb42ee477b7c59b5d2afc3871d8004d..4747277983ad1a2a9666c03a4e69758f56d22dbc 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -15,30 +15,12 @@
 
 #define arch_get_mmap_end(addr, len, flags)			\
 ({								\
-	unsigned long mmap_end;					\
-	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 ||					\
-	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_end = STACK_TOP_MAX;			\
-	else							\
-		mmap_end = (_addr + len);			\
-	mmap_end;						\
+	STACK_TOP_MAX;						\
 })
 
 #define arch_get_mmap_base(addr, base)				\
 ({								\
-	unsigned long mmap_base;				\
-	typeof(addr) _addr = (addr);				\
-	typeof(base) _base = (base);				\
-	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 ||					\
-	    (IS_ENABLED(CONFIG_COMPAT) && is_compat_task()) ||	\
-	    ((_addr + len) > BIT(VA_BITS - 1)))			\
-		mmap_base = (_base);				\
-	else							\
-		mmap_base = (_addr + len) - rnd_gap;		\
-	mmap_base;						\
+	base;							\
 })
 
 #ifdef CONFIG_64BIT

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
